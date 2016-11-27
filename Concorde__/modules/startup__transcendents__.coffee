c = console.log.bind console
Redis = require 'ioredis'
redis = new Redis({ db: 3, dropBufferSupport: true })

logging__func_F = ({ env, dev__server }) ->
    cs = ( stuff ) ->
        redis.lpush 'log_cache', JSON.stringify(stuff)
    dev__server { cs, env, redis }

get_state_cache = ({ logging__func_F, dev__server }) ->
    redis.hgetall 'env', (err, env) ->
        if err then c err else
            logging__func_F { env, dev__server }

module.exports = ({ dev__server }) ->
    get_state_cache { logging__func_F, dev__server }
