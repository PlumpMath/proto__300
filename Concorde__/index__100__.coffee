c = console.log.bind console
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

    dispatch = (opts) ->
        Dispatch.emit 'new_action', {action: opts}

    callback__from__hell = ({ state__cache, ccc }) ->
        State = initial__state = require('./modules/initial__state__.coffee')({ state__cache, proto__primus, brujo__primus })

        action_counter = 0
        Dispatch.on 'new_action', ({ action }) ->
            c '\n ------' + color.white("#{action_counter++}", on)
            wrapped_action = assign action,
                concorde__timestamp : Date.now()
            State = reducer { State, ccc, action: wrapped_action }
            side__effects { State, ccc }

        side__effects { State, ccc }

    require('./modules/brujo__log__env__redis/index.coffee') { cb: callback__from__hell }
