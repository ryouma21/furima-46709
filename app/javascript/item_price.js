const price = () => {
  const priceInput = document.getElementById("item-price");
  if (!priceInput) return;
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);

    // 表示する場所の要素を取得
    const addTaxDom = document.getElementById("add-tax-price");
    const profitDom = document.getElementById("profit");

    // 計算（10%の手数料）
    const tax = Math.floor(inputValue * 0.1);       
    const profit = inputValue - tax; 

    // HTMLを書き換える
    addTaxDom.innerHTML = tax;
    profitDom.innerHTML = profit;

  })
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);