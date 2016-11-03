c = console.log.bind console

_ = require 'lodash'


Redis = require('ioredis')



redis = new Redis()



getStateCache = ({ cb, c }) ->
    # for now it's simple.
    redis.get 'state__cache', (err, state__cache) ->
        if err then c err else
            cb { state__cache, c }
    # maybe a bunch of transactions to grab, parse assemble

CCC_F = ({ arq }) ->

    ({ stuff }) ->
        # structured logging functions in a way that's sync and fast on the write, can take a bit more on the collection and reduction on the startup phase.
        redis.set 'somewhere in cache state for logging', stuff?


module.exports = ({ cb }) ->
    arq = {} # can define some parameters to CCC_F if needed.
    c = CCC_F { arq }
    getStateCache { cb, c }
