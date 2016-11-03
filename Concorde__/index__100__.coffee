c =c = console.log.bind console
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

side__effects = require('./Side__Effects/index.coffee').default({ Dispatch })
reducer = require('./Reducer/index.coffee').default

module.exports = ({ proto__primus, brujo__primus }) ->
    State = initial__state = require('./modules/initial__state__029__.coffee')({ proto__primus, brujo__primus })

    dispatch = (opts) ->
        Dispatch.emit 'new_action', {action: opts}

    action_counter = 0
    Dispatch.on 'new_action', ({ action }) ->
        c '\n ------' + color.white("#{action_counter++}", on)
        concorded_action = assign action,
            concorde__timestamp : Date.now()
        State = reducer { State, action: concorded_action }
        side__effects { State }

    side__effects { State }
