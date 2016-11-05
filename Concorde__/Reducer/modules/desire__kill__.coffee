co = console.log.bind console
Imm = require 'immutable'
arq = {}
# use this if syncronous and optimistic (the desired task has been received and will be done).
arq['sync__desire__kill'] = ({ c, State, action }) ->
    co 'State?', State
    co 'kilrli', action.payload.desire_id
    co 'commora', State.getIn(['desires', action.payload.desire_id])
    if State.getIn(['desires', action.payload.desire_id])
        State = State.setIn(['desires', action.payload.desire_id, 'desire_fulfilled'], true)
    State
module.exports = arq
