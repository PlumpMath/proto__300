






g000__metadata = (spark) ->
    "pulling various fields out and cookie stuff from express,  primus reconnects."


arq = {}


ufo__ = require('./ufo.coffee')
keys__ufo__ = keys ufo__


verified__proto__ = require('./verified__proto__.coffee')
keys__verified__proto = keys verified__proto__


side_effect__feedbacks = require('./side_effect__feedbacks__.coffee')
keys_sideEffectsFeedback = keys side_effect__feedbacks

arq['side__effect:feedback'] = ({ cs, State, action }) ->
    { session_metadata, spark_id, type, token } = action.payload
    if includes(keys_sideEffectsFeedback, type)
        side_effect__feedbacks[type] { cs, State, action}
    else
        State

arq['login:bad:password_fail'] = ({ cs, State, action }) ->
    { session_metadata, spark_id, username_candide, password_candide } = action.payload
    c "can log a message or put something on state about this or just ignore it."
    State

arq['proto:spark:data'] = ({ cs, State, action }) ->
    { session_metadata, spark_id, data, token } = action.payload
    { type, payload } = data
    if includes(keys__ufo__, type)
        State = ufo__[type] { cs, State, action, data, token }
    else if includes(keys__verified__proto, type)
        user = State.getIn(['proto__sessions', token, 'user'])
        if user.toJS().role is 'proto-user'
            State = verified__proto__[type] { cs, State, action, data, token }
    State

arq['proto:primus:spark'] = ({ cs, State, action }) ->
    { spark, session_metadata } = action.payload
    { signedCookies, cookies, session, token } = session_metadata
    token = signedCookies['connect.sid']
    if State.hasIn(['proto__sessions', token]) isnt true
        grandmaster_session = Imm.Map
            spark: spark
            session_metadata: session_metadata
            token : token # fast access even though it's already buried in the session_metadata
            other_stuff : 43
            other_stuff_three: 349
            signup_attempts: Imm.List([])
            user: Imm.fromJS('ufo')
            user_details: Imm.Map({})
        State = State.setIn(['proto__sessions', token], grandmaster_session)
    else
        State = State.setIn(['proto__sessions', token, 'spark'], spark)
    State

module.exports = arq
