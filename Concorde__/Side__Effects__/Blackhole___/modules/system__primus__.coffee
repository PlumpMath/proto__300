


arq = {}

arq['primus:init_all_the_primus'] = ({ c, State, dispatch, desire }) ->
    dispatch
        type: 'sync__desire__kill'
        payload: { desire_id : desire.desire_id }

    brujo__primus = State.get('brujo__primus')
    brujo__primus.on 'connection', (spark) ->
        dispatch
            type: 'brujo:primus:spark'
            payload: { spark }

    proto__primus = State.get 'proto__primus'


module.exports = arq
