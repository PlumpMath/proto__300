

EventEmitter = require 'events'
class Emitter extends EventEmitter
Dispatch = new Emitter()

process.setMaxListeners 10000

module.exports = ({ cs, env, state__cache, proto__primus, brujo__primus, redis }) ->

    State = require('./modules/initial__state__884__.coffee') {
        cs, env, state__cache, proto__primus, brujo__primus, redis
    }
    reducer = require('./Reducer__.coffee').default # todo make a factory parametrised by env
    require './modules/globals.coffee' # todo make this a factory parametrised by env
    side__effects = require('./Side__Effects__.coffee').default({ Dispatch, cs, env })

    Dispatch.on 'new_action', ({ action }) ->
        State = reducer { cs, State, action }
        side__effects { cs, State }

    side__effects { cs, State }
