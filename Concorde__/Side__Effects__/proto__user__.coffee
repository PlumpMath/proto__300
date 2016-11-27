
bcrypt = require 'bcrypt'
uuid = require 'node-uuid'
v4 = uuid.v4.bind uuid
async = require 'async'

pgControlSurface = require('./proto__user/pgControlSurface__000.coffee')

check_email_avail = ({ email_candide, cb }) ->
    redis.sismember 'active_accounts', email_candide, (err, re) ->
        if err then cb(err, null) else
            cb(null, re)


process_password = ({ password_candide, cb }) ->
    salt_rounds = 10
    bcrypt.hash password_candide, salt_rounds, (err, hash) ->
        cb { hash }


sanitize_hash_f = ({ user_hash }) ->
    _.omit user_hash, ['hash']

user_hash_f = ({ email_candide, hash }) ->
    id : v4()
    timestamp : Date.now()
    ip_address_at_signup: "todo"
    email: email_candide
    hash: hash

user_summary_f = ({ owner_id })->
    meta_owner_id: owner_id
    some_user_property: 0
    credits: 100
    last_login: Date.now()

arq = {}

handle_error = ({ spark, context }) ->
    spark.write
        type: 'unknown:error'
        payload: { context }



material_search_hash_f = ({ search_strang }) ->

    timestamp: Date.now()
    search_strang: search_strang




login_handle_all_succeed = ->
    c 'got this ttwo \n \n'

    redis_stuff = "put data on redis about this. via redis io and async."
    pg_stuff = "put data on pg about this :
            there er are ere ther era

                        open up the space to documentation:

HOW TO DO DATABASE FOR THIS APPLICATION:
    THERE ARE MANY DATA TOOLS, WE GO FOR SOME REDUNDANCY EVEN WHERE NOT NECESSARY:
    We use direct memory ram representation with NodeJS process memory.  Called Concorde.
    We use Redis. Called Redis.
    We use PG. Called Pg.

    These are just tools, question is: what data we store and why ? What is the data the program needs to have in order to behave in the specified way.
                                        waht should go into the pg ?

    In PG a message queue of actions that could be applied in a deterministic way with reducer,action signature to give some kind of universal program state for a given time.  This would take some time to fully cover, but we feel it's a good goal.
    But also there is at least some (also not fully covered) immediate and direct representation of state (or some memoizantion structure) in PG memory, tables of users, and whatnot.

    In Redis the same thing.  We don't know what the division of labor should be.

                                        we shoeuld have a message queue that can be Reduced
lambda-calc like in a deterministic way.  Then we also have a direct image of this determined structure set in memory as such, and accessible in a coordinatised way.

But initially, just getting anything in the way of structure laid down is better than nothing.  Use it redundantly alongside Redis for the account data.
     via pool, streams andcetera."
    concorde_stuff = "put stuff on concorde / State about this. via dispatch"
    primus_stuff = "sparkwrite stuff "

    session_metadata = {}
    { username_candide , password_candide, spark, dispatch, spark_id, user_hash, token } = @
    clean_user_hash = user_hash
    delete clean_user_hash.hash
    redis.hset "summary::#{user_hash.id}", 'last_login', Date.now()
    spark.write
        type: 'login_good_confirm'
        payload: clean_user_hash
    dispatch
        type: 'side__effect:feedback'
        payload:
            type: 'login:success'
            payload: { clean_user_hash, spark_id, session_metadata, token }

    login_handle_all_succeed_pg_handle.bind(@)()

login_handle_password_fail = ->
    c 'got this one \n\n'
    redis_stuff = "put data on redis about this. via redis io and async."
    pg_stuff = "put data on pg about this : via pool, streams andcetera."
    concorde_stuff = "put stuff on concorde / State about this. via dispatch"
    primus_stuff = "sparkwrite stuff "
    { username_candide , password_candide, spark, dispatch, spark_id } = @
    spark.write
        type: 'login:bad:password_fail'
        payload: { username_candide, password_candide }
    dispatch
        type: 'login:bad:password_fail'
        payload: { username_candide, password_candide, spark_id }
    # pasword cleared and should send status and safe hash without the hash.


arq['do_login'] = ({ cs, State, dispatch, desire }) ->
    { username_candide, password_candide, spark_id, token } = desire.payload
    arq2 = desire.payload
    session_metadata = {}
    spark = State.getIn ['proto__sessions', token, 'spark']
    arq2.spark = spark
    user = State.getIn(['proto__sessions', token, 'user'])
    arq2.user = user
    arq2.dispatch = dispatch

    if typeof(spark) is 'undefined'
        c color.red('Major error: no spark or session found.', on)
    else if user isnt 'ufo'
        c color.red('User already logged in attempting to sign in again, or major bug.', on)
        handle_error { spark, context: "User already logged in."}
    else
        redis.hget 'email_to_userId', username_candide, (err, id_0) ->
            if err
                handle_error { spark, context: "LoginRedis:problem"}
            else
                if id_0 is null
                    spark.write
                        type: 'login:bad:email_fail'
                        payload: { username_candide }
                else
                    redis.hgetall id_0, (err, user_hash) ->
                        if err
                            handle_error { spark, context: 'LoginRedis:problem'}
                        else
                            bcrypt.compare password_candide, user_hash.hash, (err, res) ->
                                if err
                                    handle_error { spark, context: "login:redis:problem"}
                                else
                                    if res is true
                                        arq2.user_hash = user_hash
                                        login_handle_all_succeed.bind(arq2)()
                                    if res is false
                                        login_handle_password_fail.bind(arq2)()



arq['orient:reply'] = ({ cs, State, dispatch, desire }) ->
    { token } = desire.payload
    sesh = State.getIn(['proto__sessions', token]).toJS()
    { spark, user, user_details } = sesh
    if user.user_hash?
        { id } = user.user_hash
        redis.hset "summary::#{id}", 'last_login', Date.now()
    func_one = (cb) ->
        redis.hgetall "proto_users_details::#{id}", (err, user_details) ->
            if err
                c err
                cb(err, null)
            else
                cb(null, user_details)
    func_two = (cb) ->
        redis.hgetall "summary::#{id}", (err, user_summary) ->
            if err
                c err ; cb(err, null)
            else
                cb(null, user_summary)
    mano = ( err, results ) ->
        user_details = results[0]
        user_summary = results[1]
        spark.write
            type: 'orient:reply'
            payload: { user, user_details, user_summary }
    async.parallel [func_one, func_two], mano


signup_handle_form_accept = ->
    {
        email_candide, password_candide, session_metadata
        , spark_id, token, dispatch, spark, session
    } = @
    process_password
        password_candide: password_candide
        cb: ({ hash }) =>
            user_hash = user_hash_f { email_candide, hash }
            user_summary = user_summary_f { owner_id : user_hash.id }
# redis  -- fast
            redis.hmset user_hash.id, user_hash
            redis.hmset "summary::#{user_hash.id}", user_summary
            redis.sadd 'active_accounts', user_hash.email
            redis.hset 'email_to_userId', user_hash.email, user_hash.id
# primus:spark
            safe_hash = _sq.omit( user_hash, ['hash'] )
            spark.write
                type: 'signup:success'
                payload:
                    user_hash: safe_hash
# pg:wodehouse:pool
            pool.connect (err, client, done) ->
                if err
                    c 'err at pg client connect', err
                    handle_error { spark, context: "signup:db:error"}
                else
                    strang = "insert into users table here somehow"
                    query = new QueryStream(strang)
                    stream = client.query query
# concorde
            dispatch
                type: 'side__effect:feedback'
                payload:
                    session_metadata: session_metadata
                    spark_id: spark_id
                    type: 'signup:success'
                    user_hash: safe_hash
                    token: token


    # pg  -- pool querystream client

    # primus , spark

    # concorde -- dispatch


arq['submit_signup_form'] = ({ cs, State, dispatch, desire }) ->
    { email_candide, password_candide, session_metadata, spark_id, token } = desire.payload
    car = desire.payload
    session = State.getIn(['proto__sessions'], token)
    car.session = State.getIn(['proto__sessions'], token)
    car.spark = State.getIn ['proto__sparks', spark_id]
    car.dispatch = dispatch
    spark = State.getIn ['proto__sparks', spark_id]
    check_email_avail
        email_candide: email_candide
        cb: (err, re) =>
            if re is 0
                signup_handle_form_accept.bind(car)()


arq['check_is_email_valid_and_avail'] = ({ cs, State, dispatch, desire }) ->
    { email_candide, session_metadata, spark_id } = desire.payload
    spark = State.getIn ['proto__sparks', spark_id]
    redis.sismember 'active_accounts', email_candide, (err, re) ->
        if err then c err else
            dispatch
                type: 'email_check_returns'
                re: re
            spark.write
                type: 'email_check_returns'
                payload:
                    re: re


module.exports = arq
