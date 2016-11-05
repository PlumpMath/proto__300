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
    { desire_id, desire_type, desire_payload, desire_fulfilled }

add__desire = ({ State, ticket }) ->
    desire = Desire_Imm ticket
    State.setIn(['Desires', desire.desire_id], desire)

module.exports = { add__desire }
