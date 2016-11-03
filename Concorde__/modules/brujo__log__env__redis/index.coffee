c = console.log.bind console

_ = require 'lodash'


Redis = require('ioredis')



redis = new Redis()



getStateCache = ({ cb, ccc }) ->
    # for now it's simple.
    redis.get 'state__cache', (err, state__cache) ->
        if err then c err else
            cb { state__cache, ccc }
    # maybe a bunch of transactions to grab, parse assemble

CCC_F = ({ arq }) ->

    ({ stuff }) ->
        redis.set 'somewhere in cache state for logging', stuff?


module.exports = ({ cb }) ->
    arq = {}
    ccc = CCC_F { arq }
    getStateCache { cb, ccc }
