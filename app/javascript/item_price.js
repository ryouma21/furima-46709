const price = () => {
  const priceInput = document.getElementById("item-price");
  if (!priceInput) return;
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);

    const addTaxDom = document.getElementById("add-tax-price");
    const profitDom = document.getElementById("profit");

    const tax = Math.floor(inputValue * 0.1);       
    const profit = inputValue - tax; 

    addTaxDom.innerHTML = tax;
    profitDom.innerHTML = profit;

  })
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);