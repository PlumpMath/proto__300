c = console.log.bind console
Imm = require 'immutable'
uuid = require 'node-uuid'
v4 = uuid.v4.bind uuid
{ Desire_Imm } = require('./Desire_050__.coffee')
Desire = Desire_Imm

Redis = require 'ioredis'




some_func_to_put_state__cache__into__immutable__state = ({ state__cache }) ->


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
