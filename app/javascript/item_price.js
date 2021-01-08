window.addEventListener('load', () => {
const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);
    const addTaxDom = document.getElementById("add-tax-price");
    console.log(Math.floor(inputValue / 10));
    addTaxDom.innerHTML = Math.floor(inputValue / 10);
    const profit = addTaxDom.innerHTML
    const profitNumber = document.getElementById("profit");
    console.log(Math.floor(inputValue - profit));
    profitNumber.innerHTML = Math.floor(inputValue - profit );
})
});