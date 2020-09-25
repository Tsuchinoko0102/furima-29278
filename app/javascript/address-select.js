function shippingSwitch() {
  let formSwitch = document.getElementsByName("order_address[address]");
  const forms = document.getElementsByClassName("shipping-input");
  const radio = document.getElementById("radios")

  radio.addEventListener("change",() =>{
  for(let i = 0; i < forms.length; i++){
    if (formSwitch[0].checked){
      forms[i].style.display = "none";
    }
    else if(formSwitch[1].checked){
      forms[i].style.display = "block";
    }
  };
});
};
window.addEventListener("load", shippingSwitch);