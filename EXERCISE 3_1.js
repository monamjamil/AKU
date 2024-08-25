
const persons  = ["Mike Mills", "Alice Aston", "Jordan Lewis", "Mary Mills", "Philip Patterson"]
function displayList(array) {
              
  const placeholder = document.getElementById("staff-list")
        
              
  const ul = document.createElement('ul')
        
               
  for (let i = 0; i < array.length; i++){
                
  const li = document.createElement('li');
        
    li.textContent = array[i]
                
    ul.appendChild(li);

    } 
              
    placeholder.appendChild(ul);
        
}
        
displayList(persons);
