const persons = [
    { name: "Mike Mills", position: "Secretary", location: "California" },
    { name: "Alice Aston", position: "Sales Manager", location: "Barcelona, Spain" },
    { name: "Jordan Lewis", position: "HR Manager", location: "Milan, Italy" }, 
    { name: "Mary Mills", position: "Boss", location: "Hamburg, Germany" },
    { name: "Philip Pattern", position: "Web Developer", location: "London, England" }     
  ];

function displayTable(array) {

    const placeholder = document.getElementById("staff-list");

    const table = document.createElement('table');

    const thead = document.createElement('thead');

    const headerRow = document.createElement('tr');

    const headers = ["Name", "Position", "Location"];

    headers.forEach(headerText => {

      const header = document.createElement('th');

      header.textContent = headerText;

      headerRow.appendChild(header);
    });
  

    thead.appendChild(headerRow);

    table.appendChild(thead);

    const tbody = document.createElement('tbody');
  
    array.forEach(person => {

      const row = document.createElement('tr');

      const nameCell = document.createElement('td');
      nameCell.textContent = person.name;
      row.appendChild(nameCell);

      const positionCell = document.createElement('td');
      positionCell.textContent = person.position;
      row.appendChild(positionCell);

      const locationCell = document.createElement('td');
      locationCell.textContent = person.location;
      row.appendChild(locationCell);

      tbody.appendChild(row);
    });

    table.appendChild(tbody);

    table.setAttribute('class', 'table table-striped');

    placeholder.appendChild(table);

}

displayTable(persons);
  