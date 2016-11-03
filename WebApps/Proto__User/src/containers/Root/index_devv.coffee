require './globals_devv.coffee'
root_el = document.getElementById 'root'
Provider = rc require('react-redux').Provider
store = require('../../store/create.coffee')
ready__mock = ->
    { ww , wh } = @props
    div null, "hello 38938838838838838383838"
# launch_index = rc require('../../scenes/Launch/index.coffee')
root_component = rr
    render: ->
        { ww , wh } = @props
        Provider
            store: store
set_and_render = ->
    { width , height } = root_el.getBoundingClientRect()
    React_DOM.render root_component({ww: width, wh: height}), root
window.onload = ->
    set_and_render()
    window.onresize = debounce(set_and_render, 100, false)
