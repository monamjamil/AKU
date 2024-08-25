document.addEventListener("DOMContentLoaded", function() {
    
    sortAndRenderProducts('price');

    document.getElementById('sort-by').addEventListener('change', function() {

        sortAndRenderProducts(this.value);
    });

});

let products = [
    { id: 1, name: "coffee", price: 2.90, category: "drink", discount: false },
    { id: 2, name: "tea", price: 1.90, category: "drink", discount: false },
    { id: 3, name: "chocolate cake", price: 3.90, category: "bakery", discount: true },
    { id: 4, name: "strawberry cake", price: 4.90, category: "bakery", discount: false },
    { id: 5, name: "orange juice", price: 2.00, category: "drink", discount: true }
];


function sortAndRenderProducts(criteria) {

    products.sort(function(a, b) {

        if (criteria === 'price') {
            return b.price - a.price;
        } 
        
        else if (criteria === 'name') {
            return a.name.localeCompare(b.name);
        } 
        
        else if (criteria === 'id') {
            return a.id - b.id;
        } 
        
        else if (criteria === 'discount') {
            return b.discount - a.discount;
        } 
        
        else if (criteria === 'category') {
            return a.category.localeCompare(b.category);
        }
    });

    renderProducts(products);
}

function renderProducts(products) {

    var productList = document.getElementById("product-list");

    productList.innerHTML = '';

    products.forEach(function(product) {

        var tr = document.createElement("tr");

        tr.innerHTML = "<td>" + product.id + "</td><td>" + product.name + "</td><td>$" + product.price.toFixed(2) + "</td><td>" + product.category + "</td><td>" + (product.discount ? "True" : "False") + "</td>";

        productList.appendChild(tr);

    });
}
