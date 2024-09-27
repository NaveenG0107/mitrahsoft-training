function validation(){
    document.getElementById("err").innerHTML=" ";
    document.getElementById("result").innerHTML=" ";
    var innput = document.getElementById('txt').value;
    var formate = /[!@#$%^&*()\-+={}[\]:;"'<>,.?\/|\\]/;
    var numFormat=/\d+/g;
    var innp = innput.trim();
    if(innp == ""){
        document.getElementById('err').innerHTML = "Please enter a letter";
    }
    else if(formate.test(innp)){
        document.getElementById('err').innerHTML = "Special Character(s) not allowed";
    }
    else if(innp.length == 1){
        document.getElementById("err").innerHTML = "Please enter more than one charcter ";
    }
    else if(numFormat.test(innp)){
        document.getElementById("err").innerHTML = "Numbers not allowed in the string ";
    }
    else if(isNaN(innp)){
        var oPut="";
        for(i = innp.length-1; i >= 0; i--){
            var oPut = oPut+innp[i];
        }
        document.getElementById("result").innerHTML = oPut;    
    }
    else{
        document.getElementById('err').innerHTML = "Number(s) not allowed";
    }   
}