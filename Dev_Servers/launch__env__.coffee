

why = "
We intend to make the entire nodejs process highly configurable, parametrised by env drawn from Redis cache, which can be set from brujo.

Initial `env` needs to be initialised outside that process.


"

co = console.log.bind console
Redis = require 'ioredis'
redis = new Redis()
color = require 'bash-color'


initial__env =
    env_var_zero: 42
    env_var_one: 43
    env_var_two: 53


redis.hmset 'initial__env', initial__env
