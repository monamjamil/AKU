let products = [
    { id: 1, name: "coffee", price: 2.90, category: "drink", discount: false },
    { id: 2, name: "tea", price: 1.90, category: "drink", discount: false },
    { id: 3, name: "chocolate cake", price: 3.90, category: "bakery", discount: true },
    { id: 4, name: "strawberry cake", price: 4.90, category: "bakery", discount: false },
    { id: 5, name: "orange juice", price: 2.00, category: "drink", discount: true }
];

function applyFilter() {

    const maxPriceValue = document.getElementById('max-price').value;

    const selectedCategory = document.getElementById('category-select').value;

    const onlyDiscount = document.getElementById('discount-checkbox').checked;

    const maxPrice = maxPriceValue ? parseFloat(maxPriceValue) : Infinity;

    const filteredProducts = products.filter(product => {

        const meetsPrice = product.price <= maxPrice;

        const meetsCategory = selectedCategory ? product.category === selectedCategory : true;

        const meetsDiscount = onlyDiscount ? product.discount : true;

        return meetsPrice && meetsCategory && meetsDiscount;
    });

    updateProductTable(filteredProducts);
}

function updateProductTable(filteredProducts) {

    const tableBody = document.getElementById('product-table').querySelector('tbody');

    tableBody.innerHTML = '';

    filteredProducts.forEach(product => {
        
        const row = tableBody.insertRow();

        row.insertCell(0).textContent = product.id;

        row.insertCell(1).textContent = product.name;

        row.insertCell(2).textContent = product.price.toFixed(2);

        row.insertCell(3).textContent = product.category;

        row.insertCell(4).textContent = product.discount ? "Yes" : "No";

    });
}

updateProductTable(products);
