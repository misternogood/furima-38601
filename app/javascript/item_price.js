function calc (){
  const price = document.getElementById("item-price");
  const add_tax_price = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  const commission_ratio = 0.1;
  let value;
  let commission;
  let profit_price;

  price.addEventListener("input",() => {
    value = price.value;
    commission = value * commission_ratio;
    commission = Math.floor(commission);
    profit_price = value - commission;

    add_tax_price.innerHTML = Number(commission).toLocaleString();
    profit.innerHTML = Number(profit_price).toLocaleString();
  });
};

window.addEventListener('load', calc);