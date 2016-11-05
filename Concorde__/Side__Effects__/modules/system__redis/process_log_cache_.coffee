


co = console.log.bind console



arq = {}

arq['process_log_cache'] = ({ c, State, dispatch, desire }) ->
    redis = State.get 'redis'
    co 'go go go'
    redis.lrange 'log_cache', 0, -1, (err, rayy) ->
        if err then co err else
            co 'have it rayy', rayy


counter = 0
arq['setup_intermittent_process_cache'] = ({ c, State, dispatch, desire }) ->
    co 'here at', counter++
    go = ->
        co 'go go go 999992222'
        dispatch
            type: 'process_log_cache'
    cache_process_interval = setInterval go, 2000
    # dispatch
    #     type: 'process_log_cache:cb'
    #     payload: { cache_process_interval }



module.exports = arq
