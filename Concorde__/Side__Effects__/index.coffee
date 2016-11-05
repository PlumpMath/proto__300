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
# _handlers = assign _handlers, require('./modules/proto__primus/index.coffee')
# _handlers = assign _handlers, require('./modules/proto__redis/index.coffee')
# _handlers = assign _handlers, require('./modules/proto__spark/index.coffee')

keys__handlers = keys _handlers

side__effects_factory = ({ c, Dispatch }) ->

    dispatch = (opts) ->
        Dispatch.emit 'new_action', {action: opts}

    ({ State }) ->
        desires = State.get('Desires').toJS()
        for key_id, desire of desires
            { desire_type, desire_timestamp, desire_fulfilled, desire_id } = desire
            if ( includes(keys__handlers, desire_type) and (desire_fulfilled is false) )
                _handlers[desire_type] { c, State, dispatch, desire }
            else
                c 'noOp.'

exports.default = side__effects_factory
