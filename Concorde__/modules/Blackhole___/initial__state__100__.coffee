co = console.log.bind console
Imm = require 'immutable'
uuid = require 'node-uuid'
color = require 'bash-color'
v4 = uuid.v4.bind uuid
{ add__desire } = require('./desire__333__.coffee')
_ = require 'lodash'
{ assign, map, reduce, keys, includes } = _
Redis = require 'ioredis'
redis = new Redis({ db: 0 })

a_more_truly = " advanced system would allow us to open new ports (for maybe new webapps) and primus instances on the fly, but we can probably defer this clever trick until much later, even though implementation probably not so complex. In this version we are stuck with just the two, proto and brujo, totally sufficient with our more modest use cases."

state__cache__reducer = ({ state__cache }) ->
    should_be = " a message log here that can be reduced to a State. "
    {}

module.exports = ({ c, state__cache, proto__primus, brujo__primus }) ->
    State = state__cache__reducer { state__cache }
    other_initial_state =
        log_cache: Imm.List([])
        desires: Imm.Map({})
        redis : redis
        proto__primus : proto__primus
        brujo__primus : brujo__primus
        brujo__sparks : Imm.Map({})
        proto__sparks : Imm.Map({})
    State = assign State, other_initial_state
    State = Imm.fromJS State
    State = add__desire
        State: State
        desire:
            desire_type: 'primus:init_all_the_primus'
    State = add__desire
        State: State
        desire:
            desire_type: 'setup_intermittent_process_cache'
    # co color.blue('...', on), color.green(keys(State), on)
    State
