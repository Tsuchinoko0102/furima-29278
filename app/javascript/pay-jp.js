function pay() {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const submit = document.getElementById('charge-form');
  
  submit.addEventListener("submit",(e) =>{
    e.preventDefault();

    const card = {
      number: document.getElementById("card-number").value,
      cvc: document.getElementById("card-cvc").value,
      exp_month: document.getElementById("card-exp-month").value,
      exp_year:`20${document.getElementById("card-exp-year").value}`
    };
    

    Payjp.createToken(card, function(status, response){
      if (response.error){
        alert("トークン生成エラー");
      }
      else{
        const token = response.id;
        const submitData = document.getElementById('charge-form');
        const tokenData = `<input value=${token} type="hidden" name="order_address[token]">`;
        submitData.insertAdjacentHTML("beforeend", tokenData);
      }
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");

      document.getElementById("charge-form").submit();
      document.getElementById("charge-form").reset();
    });
  });
};

window.addEventListener("load", pay);
