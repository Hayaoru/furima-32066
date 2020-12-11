function price(){ 
  const articleText = document.getElementById("item-price");
  articleText.addEventListener("keyup", () => {
    var addTax = Math.floor(articleText.value * 0.1);
    const priceContent = articleText.value - addTax;

    const charTax  = document.getElementById("add-tax-price");
    const charPrice  = document.getElementById("profit");

    charTax.innerHTML =`${addTax}`;
    charPrice.innerHTML =`${priceContent}`
  });
}
window.addEventListener("load", price)