arq_755 = {}
arq_755 = assign arq_755, require('./Reducer/proto__ufo__.coffee')

keys_arq_755 = keys arq_755

reducer_755 = ({ cs, State, action }) ->
    State = State.setIn ['desires'], Imm.Map({})
    if includes(keys_arq_755, action.type)
        arq_755[action.type] {
            cs
            State
            action
        }
    else
        State

exports.default = reducer_755
