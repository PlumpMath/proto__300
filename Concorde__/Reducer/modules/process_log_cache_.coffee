

co = console.log.bind console


arq = {}


arq['process_log_cache'] = ({ c, add__desire, State, action }) ->
    co 'processing log cache', add__desire
    add__desire
        State: State
        desire:
            desire_type: 'process_log_cache'





module.exports = arq
