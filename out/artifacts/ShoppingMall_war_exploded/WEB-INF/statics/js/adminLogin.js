
function adminLoginBeforeSubmit(form) {
    if(form.admin_name.value==""||form.admin_pwd.value==""){
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

// function adminRegisterBeforeSubmit(form) {
//     if(form.admin_name.value==""||form.admin_pwd.value==""||form.admin_pwd2.value==""){
//         alert("用户名或密码不能为空！");
//         return false;
//     }
//     else{
//         if(form.admin_phone.value==""){
//             alert("手机号不能为空");
//             return false;
//         }
//         else{
//             if(form.code.value==""){
//                 alert("验证码不能为空");
//                 return false;
//             }
//             else{
//                 if(form.admin_pwd.value!=form.admin_pwd2.value){
//                     alert("两次输入的密码不一致!")
//                     return false;
//                 }
//                 else
//                     return true;
//             }
//         }
//     }
// }