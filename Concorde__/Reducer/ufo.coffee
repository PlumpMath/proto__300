





uuid = require 'node-uuid'
v4 = uuid.v4.bind uuid


arq = {}

signup = "contact redis and check for available username, salt and hash password etc etc."


arq['do_login'] = ({cs, State, action}) ->
    { spark_id, token } = action.payload
    spark = State.getIn(['proto__sessions', token, 'spark'])
    { username_candide, password_candide }= action.payload.data.payload
    State = State.setIn ['desires', 'do_some_redis_login_check'],
        type: 'do_login'
        payload: { username_candide, password_candide, spark_id, token }
    State


arq['submit_signup_form'] = ({ cs, State, action }) ->
    { session_metadata, spark_id, data, token } = action.payload
    { type, payload } = data
    payload = assign payload, { session_metadata, spark_id, token }
    signup__attempt__entry =
        timestamp: Date.now()
        id: v4()
        payload: payload
    rayy = State.getIn(['Signup__Attempts__List'])
    rayy = rayy.unshift(signup__attempt__entry)
    State = State.setIn(['Signup__Attempts__List'], rayy)
    rayy = State.getIn(['proto__sessions', token, 'signup_attempts'])
    rayy = rayy.unshift(signup__attempt__entry)
    State = State.setIn(['proto__sessions', token, 'signup_attempts'], rayy)
    State = State.setIn ['desires', shortid()],
        type: 'submit_signup_form'
        payload: payload
    State

arq['check_is_email_valid_and_avail'] = ({ cs, State, action, data }) ->
    { session_metadata, spark_id, data, token } = action.payload
    { type, payload } = data
    todo = " maintain some memory of ufo sessions, "
    { email_candide } = data.payload
    State.setIn ['desires', shortid()],
        type: 'check_is_email_valid_and_avail'
        payload: { email_candide, session_metadata, spark_id }

arq['request_orient'] = ({ cs, State, action, data })->
    { session_metadata, spark_id, data, token } = action.payload
    user = State.getIn(['proto__sessions', token, 'user'])
    user_details = State.getIn(['proto__sessions', token, 'user_details'])
    is_map = Imm.Map.isMap(user)
    if (user is 'ufo') and (is_map is false)
        reply_payload =
            user: user
            token: token
    else if (is_map is true)
        reply_payload =
            user: user.getIn(['user_hash'])
            user_details: user_details
            # user_summary:
            token : token
    State = State.setIn( ['desires', shortid()], { type: 'orient:reply', payload: reply_payload }  )
    State

module.exports = arq
