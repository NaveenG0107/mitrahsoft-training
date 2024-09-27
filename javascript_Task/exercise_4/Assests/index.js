function validation(){
    document.getElementById("err").innerHTML=" ";
    document.getElementById("large").innerHTML=" ";
    document.getElementById("small").innerHTML=" ";
    var value=document.getElementById('txt').value;
    var formate= /[!@#$%^&*()\-+={}[\]:;"'<>,.?\/|\\]/;
    if(value == "")
    {
        document.getElementById('err').innerHTML="please enter a sentence";
    }
    else if(formate.test(value))
    {
        document.getElementById('err').innerHTML="Special Character(s) not allowed";
    }
    else{
         var trim=value.trim(" ");
         const spltVal=trim.split(/\s+/);
         if(spltVal.length==1)
         {
          document.getElementById("err").innerHTML="Please enter a sentence which has more than one word";
         }
         else{
            var strlarge="";
            var strsmall=spltVal[0];
            for(i=0;i<spltVal.length;i++)
                {
                    if(strlarge.length<spltVal[i].length)
                    {
                      strlarge=spltVal[i];
                    }
                    else if(strsmall.length>spltVal[i].length)
                    {
                      strsmall=spltVal[i];
                    }
                }
            if(strsmall==strlarge)
            {
                document.getElementById("err").innerHTML="All words are equal in length";
            }
            else{
                document.getElementById("large").innerHTML="largest string is:" +" "+ strlarge;
                document.getElementById("small").innerHTML="Smallest string is:" + " "+strsmall;
            }  
         }
        
    }
  }