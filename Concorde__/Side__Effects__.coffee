

arq = {}

arq = assign arq, require('./Side__Effects__/system__primus__.coffee')


arq = assign arq, require('./Side__Effects__/proto__user__.coffee')
keys_arq = keys arq

side__effects_factory = ({ cs, Dispatch }) ->
    dispatch = (opts) ->
        Dispatch.emit 'new_action', (action: opts)
    ({ cs, State }) ->
        for key_id, desire of State.get('desires').toJS()
            if includes(keys_arq, desire.type) is true
                arq[desire.type] { cs, State, dispatch, desire }

exports.default = side__effects_factory
