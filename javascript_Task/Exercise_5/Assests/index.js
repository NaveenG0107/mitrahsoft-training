function validation(){
    document.getElementById("err").innerHTML=" ";
    document.getElementById("result").innerHTML=" ";
    var value=document.getElementById('txt').value;
    var formate= /[!@#$%^&*()\-+={}[\]:;"'<>,.?\/|\\]/;
    var formate2= /^-\d+$/;
    if(value == "")
    {
        document.getElementById('err').innerHTML="Please enter a letter";
    }
    else if(formate2.test(value))
        {
            document.getElementById('err').innerHTML="Don't type negative integer";
        }
    else if(formate.test(value))
    {
        document.getElementById('err').innerHTML="Special Character(s) not allowed";
    }
    else if(isNaN(value)){
        var res=value;
        value=value.toLowerCase();
        if(value.length!=1)
            {
                document.getElementById('err').innerHTML="Please enter only one letter";
            }
        else if(value=="a" || value=="e" || value=="i" || value=="o" || value=="u"){
            document.getElementById("result").innerHTML= res +" "+"is a Vowel";
        }
        else{
            document.getElementById("result").innerHTML= res+" "+"is not a Vowel";
        }
    }
    else {
            document.getElementById('err').innerHTML="Number(s) not allowed";
        }   
}
  