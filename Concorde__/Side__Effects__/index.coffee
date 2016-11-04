co = console.log.bind console
color = require 'bash-color'
Imm = require 'immutable'
_ = require 'lodash'
{
    assign, keys,
    includes, map,
    reduce, omit,
    size
} = _

_handlers = {}
_handlers = assign _handlers, require('./modules/proto__primus/index.coffee')
_handlers = assign _handlers, require('./modules/proto__redis/index.coffee')
_handlers = assign _handlers, require('./modules/proto__spark/index.coffee')

keys__handlers = keys _handlers

side__effects_factory = ({ Dispatch, c }) ->


    dispatch = (opts) ->
        Dispatch.emit 'new_action', {action: opts}

    ({ State }) ->
        Desires = State.get('Desires').toJS()
        for key_id, desire of Desires
            { desire_type, desire_timestamp, desire_intensity, desire_fulfilled, desire_id } = desire
            if (includes(keys__handlers, desire_type) and ( desire_intensity > 49 ) and ( desire_fulfilled is false))
                _handlers[desire_type] { State, Dispatch, dispatch, desire, desire_id, desire_type, desire_timestamp, desire_intensity, desire_fulfilled }
            else
                c 'noOp.'

exports.default = side__effects_factory
