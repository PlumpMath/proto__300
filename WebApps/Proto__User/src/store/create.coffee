{ applyMiddleware, compose, createStore } = require 'redux'
{ combineReducers } = require 'redux-immutable'
thunk = require('redux-thunk').default
middleware = thunk

mocks = (state, action) ->
    # c 'state in mocks reducer', state
    c 'action', action
    state

# query_return = require('./modules/query_return.coffee').default

reducers = { mocks } #query_return

initial_state = require './modules/initial_state_.coffee'
Imm_initial_state = Immutable.Map(initial_state)

store = createStore(combineReducers(reducers), Imm_initial_state, compose(applyMiddleware(middleware)))

# require('./primus__surface.coffee').default(store)

module.exports = store
