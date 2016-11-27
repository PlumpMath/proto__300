


require './modules/globals.coffee'

EventEmitter = require 'events'
class Emitter extends EventEmitter
Dispatch = new Emitter()

process.setMaxListeners 10000

reducer = require('./Reducer__.coffee')

module.exports = ({ cs, state__cache, proto__primus, brujo__primus, redis }) ->

    State = require('./modules/initial__state__884__.coffee') {
        cs, state__cache, proto__primus, brujo__primus, redis
    }

    side__effects = require('./Side__Effects__.coffee').default({ Dispatch, cs })

    Dispatch.on 'new_action', ({ action }) ->
        State = reducer { cs, State, action }
        side__effects { cs, State }

    side__effects { cs, State }
