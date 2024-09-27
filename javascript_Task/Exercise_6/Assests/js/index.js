function validation(){
    document.getElementById("err").innerHTML=" ";
    document.getElementById("result").innerHTML=" ";
    var value = document.getElementById('txt').value;
    var formate = /[!@#$%^&*()\-+={}[\]:;"'<>,.?\/|\\]/;
    if(value == "")
    {
        document.getElementById('err').innerHTML = "Please enter a letter";
    }
    else if(formate.test(value))
    {
        document.getElementById('err').innerHTML = "Special Character(s) not allowed";
    }
    else if(isNaN(value)){
        if(value.length==1){
            document.getElementById('err').innerHTML = "Please enter more than one charcter";
        }
        else{
            value = value.toUpperCase();
            value = value.trimStart();
            value = value.trimEnd();
            startStr = value[0];
            endStr = value[value.length-1];
            if(startStr == endStr){
                document.getElementById("result").innerHTML = "character are same";
            }
            else{
                document.getElementById('err').innerHTML = "character are not same";
            }
        }    
    }
    else {
            document.getElementById('err').innerHTML = "Number(s) not allowed";
    }   
}
  