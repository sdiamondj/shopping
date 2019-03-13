function alertMsg() {
    if(msg !="" ){
        alert(msg);
    }
}
function customerLoginBeforeSubmit(form) {
    if(form.customer_name.value==""||form.customer_pwd.value==""){
        alert("用户名或密码不能为空！");
        return false;
    }
    else{
        if(form.code.value ==""){
            alert("验证码不能为空!");
            return false;
        }
        else
            return true;
    }
}


function customerRegisterBeforeSubmit(form) {
    if(form.customer_name.value==""||form.customer_pwd.value==""||form.customer_pwd2.value==""){
        alert("用户名或密码不能为空！");
        return false;
    }
    else{
        if(form.customer_phone.value==""){
            alert("手机号不能为空");
            return false;
        }
        else{
            if(form.code.value==""){
                alert("验证码不能为空");
                return false;
            }
            else{
                if(form.customer_pwd.value!=form.customer_pwd2.value){
                    alert("两次输入的密码不一致!")
                    return false;
                }
                else
                    return true;
            }
        }
    }
}

