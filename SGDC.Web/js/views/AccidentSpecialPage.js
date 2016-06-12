$(
    function () {
        $('#cmbZtType').combobox({
            width: 320, panelHeight: 80, valueField: 'label', textField: 'value',
            data: [{ label: '图片', value: '图片' }, { label: '视频', value: '视频' }]
        }).combobox('setValue', '图片');

        $('#fileZtFile').filebox({ buttonText: '选择多媒体', width: 450 });
        $('#uploadztfile').linkbutton({ iconCls: 'icon-system', onClick: function () { sgztinfo_tool.uploadfile(); } });

        $('#txtZtDesc').textbox({ width: 842 });

        $('#gv_sgztinfo').datagrid({
            url: 'views/AccidentSpecialPage.aspx',
            fit: true,
            fitColumns: true,
            rownumbers: true,
            border: false,
            pagination: true,
            striped: true,
            singleSelect: true,
            pageSize: 10,
            pageList: [10, 20, 30, 50],
            pageNumber: 1,
            idField: 'JB_ID',
            queryParams: { method: 'QryList' },
            dataType: 'json',
            columns: [[
                { field: 'JB_DD_Ju', title: '事故点局属', width: 30 },
                { field: 'JB_DD_Xian', title: '事故点线属', width: 30 },
                { field: 'JB_DD_QiDian', title: '事故点起始站', width: 30 },
                { field: 'JB_DD_ZhongDian', title: '事故点终点站', width: 30 },//formatter: function (value, row, index) { if (value && value.length > 30) { return value.substr(0, 30) + '...'; } else { return value; } }
                { field: 'JB_DD_XingBie', title: '上下行', width: 30 },
                { field: 'JB_DD_GongLi', title: '公里数', width: 30 },
                { field: 'JB_DD_MiShu', title: '米数', width: 30 },
                { field: 'JB_LC_CheCi', title: '车次', width: 30 },
                { field: 'JB_JC_XingHao', title: '机车型号', width: 30 },
                { field: 'JB_ZB_X', title: '经度', width: 30 },//formatter: function (value, row, index) { if (value) { return DateFormat(value); } else { return value; } }
                { field: 'JB_ZB_Y', title: '纬度', width: 30 },
                { field: 'JB_CreatTime', title: '创建时间', width: 40, formatter: function (value, row, index) { if (value) { return DateFormat(value); } else { return value; } } }
            ]],
            toolbar: "#sgztinfo_tool"
        });

        $('#sgztinfo_edit').dialog({
            width: 1000,
            title: '事故专题信息',
            modal: true,
            closed: true,
            iconCls: 'icon-system'
        });

        sgztinfo_tool = {
            reload: function () {
                $('#gv_sgztinfo').datagrid('reload');
            },
            redo: function () {
                $('#gv_sgztinfo').datagrid('unselectAll');
            },
            resetquery: function () {
                $('#search_txtSgZt_JB_DD_Ju').val("");
                $('#search_txtSgZt_JB_DD_Xian').val("");
                $('#search_txtSgZt_JB_LC_CheCi').val("");
            },
            search: function () {
                $('#gv_sgztinfo').datagrid('unselectAll');
                $('#gv_sgztinfo').datagrid('load', {
                    method: 'QryList',
                    search_txtSgZt_JB_DD_Ju: $('#search_txtSgZt_JB_DD_Ju').val(),
                    search_txtSgZt_JB_DD_Xian: $('#search_txtSgZt_JB_DD_Xian').val(),
                    search_txtSgZt_JB_LC_CheCi: $('#search_txtSgZt_JB_LC_CheCi').val()
                });
            },
            showzt: function () {
                var rows = $('#gv_sgztinfo').datagrid('getSelections');
                if (rows.length > 0) {
                    $('#sgztinfo_edit').form('load', {
                        sgztbaseid: rows[0].JB_ID
                    }).dialog({ title: "事故专题信息" }).dialog('open');

                    //#region 展示上传文件信息
                    $.post(
                        'views/AccidentSpecialPage.aspx',
                        {
                            method: 'ShowUploadFileInfo',
                            sgztbaseid: rows[0].JB_ID
                        },
                        function (data, response, status) {
                            data = $.parseJSON(data);
                            if (data) {
                                //console.log(data);
                                $('#zttupian').html(''); $('#ztshipin').html('');
                                for (var i = 0; i < data.length; i++) {
                                    var temp = data[i];
                                    if (temp.ZT_Type === '图片')
                                        $('#zttupian').append(sgztinfo_tool.adddmtrow(temp));
                                    else
                                        $('#ztshipin').append(sgztinfo_tool.adddmtrow(temp));
                                }


                            } else {
                                $.messager.alert('获取信息失败！', '未知错误导致失败，请重试！', 'warning');
                            }
                        }
                    );
                    //#endregion 
                } else if (rows.length === 0) {
                    $.messager.alert('警告操作！', '请选择事故点记录！', 'warning');
                }
            },
            uploadfile: function () {
                var idFile = $("#fileZtFile").filebox("getText");
                if (idFile != null && idFile.length > 0) {
                    $.messager.progress({ text: '正在上传中...' });
                    var zttype = $('#cmbZtType').combobox('getText');

                    $('#sgztinfo_edit').ajaxSubmit({
                        type: "POST",
                        url: 'views/AccidentSpecialPage.aspx',
                        data: { method: "SaveFile", docfile: idFile },
                        success: function (data) {
                            $.messager.progress('close');
                            data = data.replace("<PRE>", "").replace("</PRE>", "");

                            //#region 保存上传文件信息
                            $.post(
                                'views/AccidentSpecialPage.aspx',
                                {
                                    method: 'SaveUploadFileInfo',
                                    sgztbaseid: $('#sgztbaseid').val(),
                                    zttype: zttype,
                                    filename: data,
                                    filedesc: $('#txtZtDesc').val()
                                },
                                function (data1, response, status) {
                                    data1 = $.parseJSON(data1);
                                    if (data1) {
                                        $.messager.show({ title: '提示', msg: '上传成功' });
                                        //console.log(data1);
                                        if (data1.ZT_Type === '图片')
                                            $('#zttupian').append(sgztinfo_tool.adddmtrow(data1));
                                        else
                                            $('#ztshipin').append(sgztinfo_tool.adddmtrow(data1));
                                        //#endregion 
                                    } else {
                                        $.messager.alert('上传失败！', '未知错误导致失败，请重试！', 'warning');
                                    }
                                }
                            );
                            //#endregion 

                            //$("#cmbZtType").combobox({ 'setValue': '图片' });
                            $("#fileZtFile").filebox({ 'value': '' }); $("#txtZtDesc").textbox('clear');
                        }
                    });
                }
            },
            adddmtrow: function (obj) {
                var temphtml = String.format('<tr class="dmtrow{2}{3}"><td title="{0}">{1}</td><td><a href="#" class="easyui-linkbutton l-btn l-btn-small l-btn-plain" iconcls="icon-delete-new" plain="true" onclick="sgztinfo_tool.deletedmtrow({2},{3},\'{4}\');" ><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text l-btn-empty">&nbsp;</span><span class="l-btn-icon icon-delete-new">&nbsp;</span></span></a></td></tr>',
                    obj.ZT_Desc, obj.ZT_FilePath, obj.JB_ID, obj.ZT_ID, obj.ZT_FilePath);
                return temphtml;
            },
            deletedmtrow: function (jbid, ztid, ztpath) {
                $.messager.confirm('确定操作', String.format('您确定要删除{0}吗？', ztpath), function (flag) {
                    if (flag) {
                        $.messager.progress({ text: '正在删除中...' });
                        $.post(
                            'views/AccidentSpecialPage.aspx',
                            {
                                method: 'DelZtFileInfo',
                                jbid: jbid,
                                ztid: ztid,
                                ztpath: ztpath
                            },
                            function (data) {
                                if (data) {
                                    $.messager.progress('close');
                                    data = $.parseJSON(data);
                                    if (data === 'sucess') {
                                        $('.dmtrow' + jbid + ztid).remove();
                                        $.messager.show({ title: '提示', msg: String.format('{0} 删除成功！', ztpath) });
                                    }
                                }
                            });
                    }
                });
            }

        };
    }
);