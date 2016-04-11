$(
    function () {
        initMenu();
    },

    $('#tabs').tabs({
        fit: true,
        border: false
    }),
    initMenu = function () {
        $("#expandMenu").accordion({ animate: false });
        $('.easyui-accordion li a').click(function () {
            //var tabTitle = $(this).children('.nav').text();
            NavItemClick(this);
            $('.easyui-accordion li div').removeClass("selected");

            $(this).parent().addClass("selected");
        }).hover(function () {
            $(this).parent().addClass("hover");
        }, function () {
            $(this).parent().removeClass("hover");
        });

        //选中第一个
        var panels = $('#expandMenu').accordion('panels');
        var t = panels[0].panel('options').title;
        $('#expandMenu').accordion('select', t);
    },
    NavItemClick = function (item) {

        item = $(item);
        url = item.attr('rel');
        text = item.children('.nav').text();
        if (url.length > 0) {
            if ($('#tabs').tabs('exists', text)) {
                $('#tabs').tabs('select', text);
            } else {
                $('#tabs').tabs('add', { title: text, closable: true, href: url });
            }
        }
    }

);
DateFormat = function (cellval) {
    try {
        var date = new Date(parseInt(cellval.replace("/Date(", "").replace(")/", ""), 10));
        var month = date.getUTCMonth() + 1 < 10 ? "0" + (date.getUTCMonth() + 1) : date.getUTCMonth() + 1;
        var currentDate = date.getUTCDate() < 10 ? "0" + date.getUTCDate() : date.getUTCDate();
        var hour = date.getUTCHours() < 10 ? "0" + date.getUTCHours() : date.getUTCHours();
        var min = date.getUTCMinutes() < 10 ? "0" + date.getUTCMinutes() : date.getUTCMinutes();
        var sec = date.getUTCSeconds() < 10 ? "0" + date.getUTCSeconds() : date.getUTCSeconds();
        return date.getUTCFullYear() + "-" + month + "-" + currentDate + " " + hour + ":" + min + ":" + sec;
    } catch (e) {
        return "";
    }
};
String.format = function () {
    if (arguments.length == 0)
        return null;
    var str = arguments[0];
    for (var i = 1; i < arguments.length; i++) {
        var re = new RegExp('\\{' + (i - 1) + '\\}', 'gm');
        str = str.replace(re, arguments[i]);
    }
    return str;
};
String.prototype.format = function () {
    var result = this;
    if (arguments.length == 0)
        return null;
    for (var i = 0; i < arguments.length; i++) {
        var re = new RegExp('\\{' + (i) + '\\}', 'gm');
        result = result.replace(re, arguments[i]);
    }
    return result;
};
String.prototype.padLeft = function (totalWidth, paddingChar) {
    if (this.length >= totalWidth || (paddingChar == undefined || paddingChar.length == 0))
        return this;
    else {
        left = "";
        while (left.length < (totalWidth - this.length))
            left += paddingChar.toString();
        return left.toString() + this;
    }
};
String.prototype.padRight = function (totalWidth, paddingChar) {
    if (this.length >= totalWidth || (paddingChar == undefined || paddingChar.length == 0))
        return this;
    else {
        right = "";
        while (right.length < (totalWidth - this.length))
            right += paddingChar.toString();
        return this + right.toString();
    }
};

//通用绑定dropdown方法
fillDropDown = function (ddlSource, ddlType) {
    if (ddlSource != null && ddlType != null && ddlType.length > 0) {
        ddlSource.combobox({
            valueField: "DicValue", textField: "DicValue", panelHeight: 100
        });
        $.post(
            'Index.aspx',
            {
                method: 'GetDropDownSourceByType',
                ddtype: ddlType
            },
            function (data, response, status) {
                data = $.parseJSON(data);
                //console.log(data);
                if (data) {
                    $.messager.progress('close');
                    ddlSource.combobox("loadData", data);
                    ddlSource.combobox("setText", "");
                    ddlSource.combobox("setValue", "");
                }
            });
    }
},
//fillDropDownExt = function (ddlSource, ddlType, showItem, asyncRequest) {
//    if (ddlSource != null && ddlType != null && ddlType.length > 0) {
//        ddlSource.combobox({
//            valueField: "DD_Value", textField: "DD_Value", panelHeight: 100
//        });
//        $.ajax({
//            type: "Get",
//            url: "Index.aspx",
//            dataType: "json",
//            data: {
//                mode: 'GetBaseDataListByDdlType',
//                ddtype: ddlType,
//                ddvalue: showItem
//            },
//            async: asyncRequest,
//            contentType: "application/json; charset=utf-8",
//            success: function (data) {
//                data = eval(data);
//                if (data) {
//                    $.messager.progress('close');
//                    ddlSource.combobox("loadData", data);
//                    ddlSource.combobox("setText", "");
//                    ddlSource.combobox("setValue", "");
//                    //ddlSource.combobox().combo({ panelHeight: 100, });
//                }
//            },
//            error: function (err) {
//                $.messager.alert('获取失败！', '未知错误导致失败，请重试！', 'error');
//            }
//        });
//    }
//},

//小数取位
ValFormart = function (val, xiaoshuweishu) {
    var SplitDK = parseFloat(val).toFixed(xiaoshuweishu).toString();
    return SplitDK;
};
exitclick = function () {
    var s = "<%=logout() %>";
}
