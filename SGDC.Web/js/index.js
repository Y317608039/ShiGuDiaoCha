$(
    function () {
        initMenu();
        $('#oldPwd').validatebox(); $('#newPwd').validatebox(); $('#newPwd1').validatebox();
        $('#tabs').tabs({ fit: true, border: false });
        $('#changePwd').dialog({
            width: 300, title: '修改密码', modal: true, closed: true,
            iconCls: 'icon-login',
            buttons: [{
                text: '保存',
                iconCls: 'icon-ok',
                handler: function () {
                    if ($('#changePwd').form('validate')) {
                        var oldPwd = $('#oldPwd').val(); var newPwd = $('#newPwd').val(); var newPwd1 = $('#newPwd1').val();
                        if (newPwd != newPwd1) {
                            $('#showvalidinfo').text('输入的新密码和确认密码不相同,请重新输入.');
                            return;
                        } else {
                            $('#showvalidinfo').text('');
                        }
                        $.messager.progress({ text: '正在修改密码中...' });
                        $.post(
                            'Index.aspx',
                            {
                                method: 'ChangePwd',
                                oldPwd: oldPwd,
                                newPwd: newPwd,
                                newPwd1: newPwd1
                            },
                            function (data, response, status) {
                                data = $.parseJSON(data);
                                $.messager.progress('close');
                                //console.log(data);
                                if (data) {
                                    if (data.User_No.length > 0) {
                                        $.messager.show({ title: '提示', msg: '密码修改成功' });
                                        $('#changePwd').dialog('close').form('reset');
                                    } else {
                                        $.messager.alert('密码修改失败！', '旧密码输入不正确，请重新输入！', 'warning');
                                    }

                                } else {
                                    $.messager.alert('密码修改失败！', '未知错误导致失败，请重试！', 'warning');
                                }
                            }
                        );
                    }
                }
            }, {
                text: '取消',
                iconCls: 'icon-redo',
                handler: function () {
                    $('#changePwd').dialog('close').form('reset');
                }
            }],
            onClose: function () {
                $('#changePwd').form('reset');
            }
        });
    }
);



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
};
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
};
Logout = function () {
    $.messager.confirm('确定操作', '确定要退出登录吗？', function (flag) {
        if (flag) {
            window.location.href = "Login.aspx";
        }
    });
};
ChangePwd = function () { 
    $('#changePwd').dialog('open');
    $('#showvalidinfo').text('');
};
