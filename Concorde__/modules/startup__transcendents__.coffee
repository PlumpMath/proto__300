co = console.log.bind console
Redis = require 'ioredis'
redis = new Redis()

parse__reduce__cache = ({ cache }) ->

get_state_cache = ({ go, c }) ->
    redis.get 'state__cache', (err, state__cache) ->
        if err then co err else
            env = { state__cache, c }
            go { env }

logging__func = ({ setup_opts }) ->
    ( stuff ) ->
        redis.lpush "log_cache", stuff

module.exports = ({ go }) ->
    setup_opts = {}
    c = logging__func { setup_opts }
    get_state_cache  { go, c }
