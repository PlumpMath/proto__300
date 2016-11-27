

co = console.log.bind console
Imm = require 'immutable'

arq = {}


arq['process_log_cache'] = ({ c, add__desire, State, action }) ->
    add__desire
        State: State
        desire:
            desire_type: 'process_log_cache'

arq['process_log_cache:cb'] = ({ c, add__desire, State, action }) ->
    { cache_process_interval } = action.payload
    State.set('cache_process_interval', cache_process_interval)

arq['process_log_cache:rayy'] = ({ c, add__desire, State, action }) ->
    co 'onto rayy'
    { rayy } = action.payload
    State = State.mergeIn(['log_cache'], Imm.fromJS(rayy))
    State = add__desire
        State: State
        desire:
            desire_type: 'brujo__spark:write:log_cache'
    State



module.exports = arq
