import React from 'react';

class TodoForm extends React.Component {
    constructor(props) {
        super(props)

        this.state = { title: "", body: "", done: false}
        this.handleSubmit = this.handleSubmit.bind(this);
    };

    handleSubmit(e) {
        e.preventDefault();
        const newTodo = {
            title: this.state.title,
            body: this.state.body,
            done: this.state.done
        }

        this.setState({ title: "", body: "", done: false})
    }

}