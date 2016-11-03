c = console.log.bind console
Imm = require 'immutable'
uuid = require 'node-uuid'
v4 = uuid.v4.bind uuid
{ Desire_Imm } = require('./Desire_050__.coffee')
Desire = Desire_Imm

Redis = require 'ioredis'




getCacheImm = ({ state__cache }) ->
    # state_cache is assumed to be pretty raw unprocessed Redis derived data-structures.
    # We process to Immutable structure ready for setIn() on State.

    # Or maybe it could return a standard js object on which there are keyed immutable objects.
    # So a log immutable object and an env.  These could be attached to different keys on the State obj.
    Imm.Map({})

module.exports = ({ state__cache, proto__primus, brujo__primus  }) ->





    init__wodehouse = Desire_Imm
        desire_id: 'init_wodehouse'
        desire_type: 'wodehouse:initialise'

    init__primus = Desire_Imm
        desire_id: 'init_all_the_primus'
        desire_type: 'primus:init_all_the_primus'

    initial__desires = Imm.fromJS({})

    initial__desires = initial__desires.setIn(["init__primus"], init__primus)

    # initial__desires = initial__desires.setIn(['init_wodehouse'], init__wodehouse)


    # Desires = Desires.setIn(["init_wodehouse"], x100)
    stateCacheImm = getCacheImm { state__cache }


    { Env_Imm, Log_Imm, Reg_State } = stateCacheImm

    # maybe we would fold some stuff in like with the immutable version of assign.


    # Desires.set("init_wodehouse", init_wodehouse)
    # Desires["init_wodehouse"] = init_wodehouse

    initial__state = Imm.fromJS
        proto__primus: proto__primus
        brujo__primus: brujo__primus
        dispatch_initialised: false
        proto__primus:
            _initialised: false
            some_other_interesting_property: null
        pg:
            pool: null
            initialised_already: false
        redis: new Redis()
        Desires: initial__desires
        Transactions: Imm.fromJS({})
        Sparks : Imm.fromJS({})


    initial__state
