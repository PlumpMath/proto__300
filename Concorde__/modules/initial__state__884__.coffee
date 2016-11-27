



state__cache__reducer = ({ state__cache }) ->
    should_be = "Doing something here to resurrect Concorde state from Redis cache."
    {}

log_cache = Imm.List []

desires = Imm.Map {}

module.exports = ({
    cs, state__cache
    , proto__primus, brujo__primus
    , redis
}) ->
    State = state__cache__reducer { state__cache }

    Primary__State =
        log_cache : log_cache
        desires : desires
        ufo__sessions : Imm.Map({})
        proto__sessions : Imm.Map({})
        sundry__list : Imm.List([])
        proto__primus : proto__primus
        brujo__primus : brujo__primus

    State = assign State, Primary__State

    State = Imm.fromJS State

    di = { type : 'primus:init_all_the_primus'}

    State = State.setIn ['desires', shortid()], di

    State
