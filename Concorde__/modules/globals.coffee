



pg = require 'pg'
QueryStream = require 'pg-query-stream'
JSONStream = require 'JSONStream'

# set_last_login = "function"   # ?

config = {}
diagnostics__checkIn = ({ pool }) ->
    pool.connect ( err, client, done ) ->
        if err
            c err
        else
            c color.cyan('PG diagnostics:  startup ...'), keys(client).length
        done()

pool = new pg.Pool(config)

diagnostics__checkIn { pool }

global.pg = pg
global.QueryStream = QueryStream
global.JSONStream = JSONStream
global.pool = pool


global.c = console.log.bind console
global.color = require 'bash-color'
global._ = requeire 'lodash/fp'

global.keys = _.keys
global.assign = _.assign
global.map = _.map
global.reduce = _.reduce
global.omit = _.omit

global.sq_ = require 'lodash'
global._sq = require 'lodash'

global.includes = sq_.includes

global.shortid = require 'shortid'
global.Imm = require 'immutable'
Redis = require 'ioredis'
global.redis = new Redis({db: 3, dropBufferSupport: true})


global.uuid = require 'node-uuid'
global.v4 = uuid.v4.bind uuid
