


co = console.log.bind console
_ = require 'lodash'
{ keys, includes, assign } = _

{ add__desire } = require('../modules/desire__333__.coffee')
_handlers = {}

# _handlers = assign _handlers, require('./interfaces/whatever.coffee')
_handlers = assign _handlers, require('./modules/desire__kill__.coffee')
_handlers = assign _handlers, require('./modules/process_log_cache_.coffee')
exports.unit__test__interface = _handlers

keys__handlers = keys(_handlers)

pre_process__desires = ->
    "We can preprocess them for debounce, throttle, other effects."

reducer = ({ c, State, action }) ->
    if includes(keys__handlers, action.type)
        _handlers[action.type] { c, add__desire, State, action }
    else
        co "NoOp in reducer on", action.type
        State

exports.default = reducer
