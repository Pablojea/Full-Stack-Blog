function validateLogin(){

    let mail = document.querySelector('#email')
    let mailRe = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|.(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    event.preventDefault()
    
    if(mailRe.test(mail.value.trim())){
        console.log('good');
        document.querySelector('#mail-error').hidden = true;
        let myform = document.querySelector('#loginform')
        myform.submit()
        return true;
    }
    else{

        document.querySelector('#mail-error').hidden = false;
        console.log('bad');
        return false;

    }

}