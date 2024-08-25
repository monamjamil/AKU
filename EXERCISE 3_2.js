
const persons = [
    { name: "Mike Mills", position: "Secretary" },
    { name: "Alice Aston", position: "Sales Manager" },
    { name: "Jordan Lewis", position: "HR Manager" }, 
    { name: "Mary Mills", position: "Boss" },
    { name: "Philip Pattern", position: "Web Developer" }   
];
  
function displayList(array) { 
    
    const placeholder = document.getElementById("staff-list");
  
    const ul = document.createElement('ul');
    
    for (let i = 0; i < array.length; i++ ) { 
  
        const li = document.createElement('li');
  
        li.textContent = `${array[i].name}, ${array[i].position}`;
  
        ul.appendChild(li);   

    }

    placeholder.appendChild(ul);

}

displayList(persons);
