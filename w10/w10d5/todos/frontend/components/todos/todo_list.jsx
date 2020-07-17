import React from 'react';
import TodoListItem from '../todo_list/todo_list_item';
import { receiveTodo } from '../../actions/todo_actions';

// class TodoList extends React.Component {
//     constructor(props) {
//         super(props);
//     };
    
//     render() {
//         let list = todos.map((todo) => {
//             return <ul key={todo.id}>
//                 <TodoListItem props={this.props}/>
//             </ul>
//         });
//     }
    
// };

// export default () => <h3>Todo List goes here!</h3>

const TodoList = ({todos = []}) => {
    const list = todos.map((todo) =>{
        return <ul key={todo.id}>
                <TodoListItem  todo={todo}/>
            </ul>
    });

    return list;
};

// { todo.title }
export default TodoList;

// {} in arguments
// functional vs class component
// obviously: this
// when to import with {}
// default