function validation(){
    document.getElementById("err").innerHTML=" ";
    document.getElementById("result").innerHTML=" ";
    var innp = document.getElementById('txt').value;
    var formate = /[!@#$%^&*()\-+={}[\]:;"'<>.?\/|\\]/;
    var numFormat = /[a-zA-Z]+/g;
    var commFormat = /,+/g;
    var innp = innp.trim();
    var fComFormat = /^,/;
    var fComFormat2 = /,$/;
    if(innp == ""){
        document.getElementById('err').innerHTML = "Please enter a number";
    }
    else if(formate.test(innp)){
        document.getElementById('err').innerHTML = "Special Character(s) not allowed";
    }
    else if(innp.length == 1){
        document.getElementById("err").innerHTML = "Please enter more than one digit using commas ";
    }
    else if(numFormat.test(innp)){
        document.getElementById("err").innerHTML = "letter(s) not allowed";
    }
    else if(fComFormat.test(innp)){
        document.getElementById("err").innerHTML = "dont use comma first";
    }
    else if(fComFormat2.test(innp)){
        document.getElementById("err").innerHTML = "dont use comma last";
    }
    else if(commFormat.test(innp)){
        var sMerge = innp.replaceAll(/\s+/g,"");
        var spltVal = sMerge.split(",");
        var large=0;
        var small=+spltVal[0];
        for(i = 0; i<spltVal.length; i++){
            var val=+spltVal[i];
            if(large<val){
                large=val ;
            }
            else if(small>val){
                small=val;
            }
        } 
        if(large == small){
            document.getElementById("err").innerHTML = "both numbers are same";
        }
        else{
            document.getElementById("result").innerHTML =large;
        }
    }
    else{
        document.getElementById("err").innerHTML = "Separate digits by commas";

    }    
}