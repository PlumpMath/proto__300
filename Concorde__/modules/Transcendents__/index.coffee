co = console.log.bind console
Redis = require 'ioredis'
redis = new Redis()


parse__reduce__cache = ({ cache }) ->

get_state_cache = ({ go, c }) ->
    redis.get 'state__cache', (err, state__cache) ->
        if err then co err else
            env = { state__cache, c, other__stuff }
            go { env }

logging__func = ({ setup_opts }) ->

    ({ stuff }) ->
        more_likely = " We'll be writing to a list, just some message maybe a payload stringified (but is that expensive) "
        redis.rpush "some cache address", stuff?

module.exports = ({ go }) ->
    setup_opts = {}
    c = logging__func { setup_opts }
    get_state_cache  { go, c }
