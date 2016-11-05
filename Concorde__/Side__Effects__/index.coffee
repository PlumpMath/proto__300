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

_handlers = assign _handlers, require('./modules/system__redis/process_log_cache_.coffee')

keys__handlers = keys _handlers
co "keys__handlers", keys__handlers

side__effects_factory = ({ c, Dispatch }) ->

    # c 'in side effects initialisation '

    dispatch = (opts) ->
        Dispatch.emit 'new_action', {action: opts}

    ({ State }) ->
        desires = State.get('desires').toJS()
        for key_id, desire of desires

            if ( includes(keys__handlers, desire.desire_type) and (desire.desire_fulfilled is false) )
                _handlers[desire.desire_type] { c, State, dispatch, desire }
                dispatch
                    type: 'sync__desire__kill'
                    payload: { desire_id : desire.desire_id }

            else
                co 'noOp in side__effects on ', desire

exports.default = side__effects_factory
