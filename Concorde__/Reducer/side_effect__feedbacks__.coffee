


side_effect__feedbacks = {}











side_effect__feedbacks['login:success'] = ({ cs, State, action }) ->
    { clean_user_hash, token, spark_id, session_metadata } = action.payload.payload
    user_hash = clean_user_hash
    container = Imm.fromJS
        stuff: 42
        role: 'proto-user'
    user_hash = Imm.fromJS user_hash
    maxi = container.setIn(['user_hash'], user_hash)
    State = State.setIn(['proto__sessions', token, 'user'], maxi)
    # State = State.setIn
    State


side_effect__feedbacks['signup:success'] = ({ cs, State, action }) ->
    { user_hash, token, spark_id, session_metadata } = action.payload
    session = State.getIn(['proto__sessions', token])
    container = Imm.fromJS
        stuff: 42
        role: 'proto-user'
    user_hash = Imm.fromJS user_hash
    maxi = container.setIn(['user_hash'], user_hash)
    State = State.setIn(['proto__sessions', token, 'user'], maxi)
    State






module.exports = side_effect__feedbacks
