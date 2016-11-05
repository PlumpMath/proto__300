
co = console.log.bind console

arq = {}

arq['brujo:primus:spark'] = ({ c, add__desire, State, action }) ->
    co '222222222222222222222222222'
    { spark } = action.payload
    spark_id = spark.id
    State.setIn(['brujo__sparks', spark_id], spark)


module.exports = arq
