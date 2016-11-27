

# pg = require 'pg'
# QueryStream = require 'pg-query-stream'
# JSONStream = require('JSONStream')
#
#
# set_last_login = "function"
#
#
# config =
#     user: "wylie"
#     database: "glowlit_one_eleven"
#     password: "terebinth"
#     host: "localhost"
#     port: 5432
#     max: 10
#     idleTimeoutMillis: 30000
#
#
#
# diagnostics__checkIn = ({ pool }) ->
#     pool.connect ( err, client, done ) ->
#         if err
#             c err
#         else
#             c color.cyan('PG diagnostics: startup ...'), keys(client).length
#         done()
#
#
# pool = new pg.Pool(config)
# diagnostics__checkIn { pool }
