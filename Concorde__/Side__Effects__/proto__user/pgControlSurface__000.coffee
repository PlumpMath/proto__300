

# pg = require 'pg'
# QueryStream = require 'pg-query-stream'
# JSONStream = require('JSONStream')
#
#
# set_last_login = "function"
#
#
# config = {}
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
