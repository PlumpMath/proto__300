

co = console.log.bind console

arq = {}

arq['brujo__spark:write:log_cache'] = ({ c, dispatch, State, desire }) ->
    dispatch
        type: 'sync__desire__kill'
        payload: { desire_id : desire.desire_id }

    log_rayy = State.getIn(['log_cache']).toJS()
    for spark_id, spark of State.get('brujo__sparks').toJS()
        spark.write
            type: 'log_cache:write'
            payload: { log_rayy }




module.exports = arq
