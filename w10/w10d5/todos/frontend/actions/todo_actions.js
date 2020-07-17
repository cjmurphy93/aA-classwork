export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";
export const CLEAR_ALL = "CLEAR_ALL";

export const receiveTodo = (todo) => {
    return {
        type: RECEIVE_TODO,
        todo
    }
};

export const receiveTodos = (todos) => {
    return {
        type: RECEIVE_TODOS,
        todos
    }
};

export const clearAll = () => {
    return {
        type: CLEAR_ALL
    };
};