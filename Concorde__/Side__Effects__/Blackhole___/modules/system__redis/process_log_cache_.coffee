


co = console.log.bind console



arq = {}

arq['process_log_cache'] = ({ c, State, dispatch, desire }) ->
    dispatch
        type: 'sync__desire__kill'
        payload: { desire_id : desire.desire_id }
    redis = State.get 'redis'
    redis.lrange 'log_cache', 0, -1, (err, rayy) ->
        if err then co err else
            dispatch
                type: 'process_log_cache:rayy'
                payload: { rayy }


arq['setup_intermittent_process_cache'] = ({ c, State, dispatch, desire }) ->
    dispatch
        type: 'sync__desire__kill'
        payload: { desire_id : desire.desire_id }

    go = ->
        dispatch
            type: 'process_log_cache'
    cache_process_interval = setInterval go, 2000
    dispatch
        type: 'process_log_cache:cb'
        payload: { cache_process_interval }




module.exports = arq
