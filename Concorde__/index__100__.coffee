co = console.log.bind console
_ = require 'lodash'
color = require 'bash-color'
{
    includes, assign, map, reduce,
    keys
} = _
EventEmitter = require 'events'
class Emitter extends EventEmitter
Dispatch = new Emitter()
process.setMaxListeners(10000)

reducer = require('./Reducer/index.coffee').default

module.exports = ({ c, state__cache, proto__primus, brujo__primus }) ->

    State = initial__state = require('./modules/initial__state__100__.coffee')({ c, state__cache, proto__primus, brujo__primus })
    side__effects = require('./Side__Effects__/index.coffee').default({ Dispatch, c })
    action_counter = 0

    Dispatch.on 'new_action', ({ action }) ->
        co '\n ------' + color.white("#{action_counter++}", on)
        wrapped_action = assign action,
            concorde__timestamp : Date.now()
        State = reducer { c, State, action: wrapped_action }
        side__effects { c, State }

    side__effects { c, State }
