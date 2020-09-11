function calc () {
  document.getElementById("item-price").value = ""

  document.addEventListener("keyup", () => {
    const amount = document.getElementById("item-price").value;
    const commission = parseInt(`${amount * 0.1}`, 10);
    const profit = parseInt(`${amount - commission}`, 10);
    
    document.getElementById("add-tax-price").innerHTML = commission;
    document.getElementById("profit").innerHTML = profit
  });
};

window.addEventListener('load', calc);

