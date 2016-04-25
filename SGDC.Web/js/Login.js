$(function () {
    //添加登陆按钮提交事件
    $('#btnLogin').click(function () {
        $('#myform').submit();
    });
    //绑定回车
    $('#myform').find('input').on('keyup', function (event) {
        if (event.keyCode == 13) {
            $('#myform').submit();
        }
    });
    //定义form表单 
    $('#myform').form({
        url: 'ValidUser.aspx',
        data: $('#myform').serialize(),
        dataType: 'text',
        onSubmit: function () {
            if (!$('#myform').form('validate')) {
                $.messager.show({
                    title: '提示信息',
                    msg: '请输入完整信息后,重新登陆!'
                });
                return false;
            }
        },
        success: function (result) {
            var lblErrorMessage = $("#lblErrorMessage");
            if (result != "") {
                if (result.length == 1) {
                    if (result == "1") {
                        lblErrorMessage.text("用户名输入错误或不存在.");
                    }
                    else if (result == "2") {
                        lblErrorMessage.text("密码输入错误.");
                    }
                }
                else {
                    eval(result);
                }
            }
            else {
                lblErrorMessage.text("服务器发生错误,请重试...");
            }
        },
    });
})