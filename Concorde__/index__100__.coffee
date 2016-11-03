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

module.exports = ({ proto__primus, brujo__primus }) ->

    dispatch = (opts) ->
        Dispatch.emit 'new_action', {action: opts}

    cb = ({ state__cache, c }) ->
        State = initial__state = require('./modules/initial__state__.coffee')({ state__cache, proto__primus, brujo__primus })
        side__effects = require('./Side__Effects/index.coffee').default({ Dispatch, c })
        action_counter = 0
        Dispatch.on 'new_action', ({ action }) ->
            co '\n ------' + color.white("#{action_counter++}", on)
            c
                stuff: " some great stuff possible with the redis cache and brujo-terminal maybe D3 graphhpics"
            wrapped_action = assign action,
                concorde__timestamp : Date.now()
            State = reducer { State, c, action: wrapped_action }
            side__effects { State, c }

        side__effects { State, c }

    require('./modules/brujo__log__env__redis/index.coffee') { cb }
