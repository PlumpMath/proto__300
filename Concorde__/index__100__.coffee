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
shortid = require 'shortid'

process.setMaxListeners(10000)

reducer = require('./Reducer/index.coffee').default
count2 = 0
module.exports = ({ c, state__cache, proto__primus, brujo__primus }) ->
    c 'hel', count2++
    Todo = "make another c function that will be more proactive about pushing the log over to reducer and side-effects, this first one can actually be put onto state for preservation. "

    State = require('./modules/initial__state__100__.coffee')({ c, state__cache, proto__primus, brujo__primus })
    co 'checkout', State.getIn(['desires'])
    side__effects = require('./Side__Effects__/index.coffee').default({ Dispatch, c })
    action_counter = 0

    Dispatch.on 'new_action', ({ action }) ->
        co '\n ------' + color.white("#{action_counter++}", on), action.type
        if action_counter < 100
            c "whoa #{shortid()}"
            if action.type is 'sync__desire__kill'
                co 'killing'
                State = reducer { c, State, action}
                co 'grancha', State.getIn(['desires', action.payload.desire_id])
            # else if action_counter < 1000
            else
                # wrapped_action = assign action,
                #     timestamp : Date.now()
                co 'orange'
                State = reducer { c, State, action }
                side__effects { c, State }

    side__effects { c, State }
