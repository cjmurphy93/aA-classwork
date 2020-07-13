const toDos = JSON.parse(localStorage.getItem("toDos")) || [];

const ul = document.querySelector(".todos");
const form = document.querySelector(".add-todo-form");

addTodo = function(e) {
    
        e.preventDefault();
    
    let input = document.querySelector('[name="add-todo"]').value;
    console.log(input);
    const todo = {
        input,
        done: false
    };

    toDos.push(todo);

    
    input = "";
    localStorage.setItem("toDos", JSON.stringify(toDos))
    console.log(localStorage);
    
    populateList(toDos);
    e.currentTarget.reset();

}

populateList = function(array) {
    ul.innerHTML = "";
  array.map(todo => {
    const label = document.createElement("label");
    label.innerHTML = todo.input;
    const checkMark = document.createElement("input")
      checkMark.setAttribute("type", "checkbox");
    const li = document.createElement("li");
    li.append(label);
    li.append(checkMark);
    
    ul.append(li);
  })
}

form.addEventListener("submit", addTodo)
populateList(toDos);
