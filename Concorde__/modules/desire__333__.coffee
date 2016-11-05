co = console.log.bind console
_ = require 'lodash'
{ keys, assign, map, reduce, includes, omit } = _
Imm = require 'immutable'
uuid = require 'node-uuid'
v4 = uuid.v4.bind uuid
shortid = require 'shortid'

Desire_Imm = ( opts ) ->
    desire_id = v4()
    desire_type = opts.desire_type
    desire_payload = opts.desire_payload or null
    # desire_intensity = opts.desire_intensity or 100
    desire_fulfilled = false
    Imm.fromJS { desire_id, desire_type, desire_payload, desire_fulfilled }


add__desire = ({ State, desire }) ->
    desire = Desire_Imm desire
    State.setIn(['desires', desire.desire_id], desire)

module.exports = { add__desire }
