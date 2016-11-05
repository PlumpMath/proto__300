require './globals_devv.coffee'
root_el = document.getElementById 'root'
Provider = rc require('react-redux').Provider
store = require('../../store/create.coffee')
c 'hi ?'

ready__mock = ->
    { ww , wh } = @props
    div null, "hello 38938838838838838383838"


ready__sparse = rr
    componentDidMount: ->
        primus.on 'data', (data) =>
            c 'data', data, @state
            @setState
                log_rayy : @state.log_rayy.concat(data.payload.log_rayy)
    getInitialState: ->
        log_rayy : []
    render: ->
        div null,
            p null, 'there we are'
            for item, idx in @state.log_rayy
                p
                    key: "p:#{idx}"
                    "... and more #{item}"


root_component = rr
    render: ->
        { ww , wh } = @props
        Provider
            store: store
            # ready__mock.bind(@)()
            ready__sparse()
            # launch_index()

set_and_render = ->
    { width , height } = root_el.getBoundingClientRect()
    React_DOM.render root_component({ww: width, wh: height}), root

window.onload = ->
    set_and_render()
    window.onresize = debounce(set_and_render, 100, false)
