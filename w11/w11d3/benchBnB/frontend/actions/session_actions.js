import * as util from '../util/session_api_util';

export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER';
export const LOGOUT_USER = 'LOGOUT_USER';
export const RECIVE_ERRORS = 'RECIVE_ERRORS';

debugger;
const receiveCurrentUser = (user) => ({
    type: RECEIVE_CURRENT_USER,
    users: user,
    session: {
        id: user.id
    },
});
const logoutUser = () => ({
    type: LOGOUT_USER,
    session: {
        id: null
    }
})
export const reciveErrors = (errors) =>({
    type: RECIVE_ERRORS,
    errors
})

export const login = (user) => (dispatch) => (
    util.login(user).then(payload => dispatch(receiveCurrentUser(payload)))
)
export const logout = () => (dispatch) => (
    util.logout().then(payload => dispatch(logoutUser(payload)))
)
export const signUp = (user) => (dispatch) => (
    util.signUp(user).then(payload => dispatch(receiveCurrentUser(payload)))
)


