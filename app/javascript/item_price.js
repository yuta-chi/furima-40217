function item_price() {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profitDom = document.getElementById("profit");

  const updateValues = () => {
    const inputValue = parseFloat(priceInput.value) || 0;
    const tax = Math.floor(inputValue * 0.1);
    const profit = inputValue - tax;

    addTaxDom.textContent = tax;
    profitDom.textContent = profit;
  };

  if (priceInput) {
    priceInput.addEventListener("input", updateValues);
    priceInput.addEventListener("change", updateValues);
  }

  // 初回読み込み時にも計算を行う
  updateValues();
};
window.addEventListener("turbo:load", item_price);
window.addEventListener("turbo:render", item_price);