



arq = {}


arq['produce_some_data'] = ({ State, dispatch, c }) ->
    redis.set 'a bunch of stuff'

    do_more = ->
        redis.set 'mock_channel_one', 'a bunch of random stuff'

    do_more_process = setInterval do_more, 1000

    dispatch
        type: 'do_more_process:file_for_cancel'
        payload: do_more_process
    # so after we call this function monad side effect we have a stream of redis data.

module.exports = arq
