let products = [
    { id: 1, name: "coffee", price: 2.90 },
    { id: 2, name: "tea", price: 1.90 },
    { id: 3, name: "chocolate cake", price: 3.90 },
    { id: 4, name: "strawberry cake", price: 4.90 },
    { id: 5, name: "orange juice", price: 2.00 }
];

function applyFilter() {

    const maxPriceValue = document.getElementById('max-price').value;

    const maxPrice = parseFloat(maxPriceValue);

    const filteredProducts = products.filter(product => product.price <= maxPrice);

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
    });
}

updateProductTable(products);
