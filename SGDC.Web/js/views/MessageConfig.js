$(
    function () { 
        $.post('views/MessageConfig.aspx', { method: 'GetInfo' },
           function (data, response, status) {
               if (data) {
                   data = $.parseJSON(data);
                   $('#message_uid').textbox('setValue', data.Uid);
                   $('#message_pwd').textbox('setValue', data.Pwd);
                   $('#message_url').textbox('setValue', data.Url);
               } else {
                   $.messager.alert('获取信息失败！', '未知错误导致失败，请重试！', 'warning');
               }
           }
        );

        messageconfig_tool = {
            save: function () { 
                var uid = $('#message_uid').val();
                var pwd = $('#message_pwd').val();
                var url = $('#message_url').val();
                if ($('#messageconfig_form').form('validate')) {
                    $.messager.progress({ text: '正在保存中...' });
                    $.post(
                        'views/MessageConfig.aspx',
                        {
                            method: 'SaveInfo',
                            uid: uid,
                            pwd: pwd,
                            url: url
                        },
                        function (data, response, status) {
                            $.messager.progress('close');
                            data = $.parseJSON(data);
                            if (data) {
                                $.messager.show({ title: '提示', msg: '保存成功' });
                            } else {
                                $.messager.alert('保存失败！', '未知错误导致失败，请重试！', 'warning');
                            }
                        }
                    );
                } else {
                    $.messager.show({
                        msg: '请检查输入项'
                    });
                }
            }
        }
    }
);