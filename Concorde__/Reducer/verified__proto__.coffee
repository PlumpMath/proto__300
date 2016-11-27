verified__proto__ = {}

verified__proto__['do_logout'] = ({ cs, State, action }) ->
    { token } = action.payload.session_metadata
    State = State.setIn(['proto__sessions', token, 'user'], Imm.fromJS('ufo'))
    State = State.setIn(['proto__sessions', token, 'user_details'], Imm.Map({}))
    State

verified__proto__['edit_details_two'] = ({ cs, State, action }) ->
    { token } = action.payload.session_metadata
    { edit_form } = action.payload.data.payload
    translate =
        email_candide: 'email'
        phone_candide: 'phone'
        address_candide: 'address'
    for k, v of edit_form
        State = State.setIn(['proto__sessions', token, 'user_details', translate[k]], v)
    State = State.setIn ['desires', shortid()],
        type: 'edit_details_two'
        payload: { edit_form, token }
    State

verified__proto__['edit_details_one'] = ({ cs, State, action }) ->
    { token } = action.payload.session_metadata
    { edit_form } = action.payload.data.payload
    translate =
        first_name_candide: 'first_name'
        last_name_candide: 'last_name'
        some_user_property_candide: 'company'
    for k, v of action.payload.data.payload.edit_form
        State = State.setIn(['proto__sessions', token, 'user_details', translate[k]], v)
    State = State.setIn ['desires', shortid()],
        type: 'edit_details_one'
        payload: { edit_form, token }
    State




module.exports = verified__proto__
