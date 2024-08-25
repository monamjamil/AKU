let products = [
    { id: 1, name: "coffee", price: 2.90 },
    { id: 2, name: "tea", price: 1.90 },
    { id: 3, name: "chocolate cake", price: 3.90 },
    { id: 4, name: "strawberry cake", price: 4.90 },
    { id: 5, name: "orange juice", price: 2.00 }
];

function populateDropdown() {

    let selector = document.getElementById('product-selector');

    products.forEach(product => {

        let option = document.createElement('option');

        option.value = product.id;

        option.textContent = product.name;

        selector.appendChild(option);

    });
}

function displayProductDetails(productId) {

    let productDetailsDiv = document.getElementById('product-details');

    if (productId) {

        let product = products.find(p => p.id == productId);

        document.getElementById('product-name').value = product.name;

        document.getElementById('product-price').value = product.price;

        productDetailsDiv.style.display = 'block';

    } else {

        productDetailsDiv.style.display = 'none';
    }
}

function saveProduct() {

    alert('CANNOT SAVE.');

}

populateDropdown();
