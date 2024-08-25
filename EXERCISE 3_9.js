// Function to fetch todos from the API
function fetchTodos() {

    const user = document.getElementById("user").value;
    
    const showTodos = document.getElementById("show-todos").value;

    const searchValue = document.getElementById("search").value.toLowerCase();

    const url = new URL("https://jsonplaceholder.typicode.com/todos");
  
    if (user) {

      url.searchParams.append("userId", user);

    }
  
    document.getElementById("loading").style.display = "block";
  
    fetch(url)

      .then(response => response.json())

      .then(data => {

        let filteredTodos = data;
  
        if (showTodos === "completed") {
          filteredTodos = filteredTodos.filter(todo => todo.completed);

        } else if (showTodos === "not-completed") {
          filteredTodos = filteredTodos.filter(todo => !todo.completed);
        }
  
        if (searchValue) {
          filteredTodos = filteredTodos.filter(todo => todo.title.toLowerCase().includes(searchValue));
        }
  
        renderTodos(filteredTodos);
      })

      .catch(error => console.error('Error fetching todos:', error))

      .finally(() => {

        document.getElementById("loading").style.display = "none";

      });
  }
  
  function renderTodos(todos) {

    const todosList = document.getElementById("todos-list");

    todosList.innerHTML = '';
  
    todos.forEach(todo => {

      const tr = document.createElement("tr");

      tr.innerHTML = `<td>${todo.userId}</td><td>${todo.id}</td><td>${todo.title}</td><td>${todo.completed ? "Yes" : "No"}</td>`;

      todosList.appendChild(tr);

    });
  }
  
  document.getElementById("user").addEventListener("change", fetchTodos);

  document.getElementById("show-todos").addEventListener("change", fetchTodos);

  document.getElementById("search").addEventListener("input", fetchTodos);
  
  document.addEventListener("DOMContentLoaded", fetchTodos);
  