function checkAll() {
    var innp = document.getElementsByClassName("form-check-input");
    for(i=0; i<innp.length; i++){
       innp[i].checked = true;
    }
   }
function unCheckAll(){
   var unInnp = document.getElementsByTagName("input");
   for(i=0; i<unInnp.length; i++){
       unInnp[i].checked = false;
   }
}
function opp(){
   var opp=document.getElementsByName("check");
   for(i=0; i<opp.length; i++){
       if(opp[i].checked == true)
       {
           opp[i].checked = false;
       }
       else{
           opp[i].checked = true;
       }
   }
}
