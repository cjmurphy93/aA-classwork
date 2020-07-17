import React from "react";
import TodoListContainer from './todos/todo_list_container';
import TodoList from './todos/todo_list';

const App = () => {
    return (
        <div>
            <TodoList />
            <TodoListContainer />
        </div>
)};

export default App;