
co = console.log.bind console

arq = {}

arq['brujo:primus:spark'] = ({ c, add__desire, State, action }) ->
    { spark } = action.payload
    spark_id = spark.id
    State.setIn(['brujo__sparks', spark_id], spark)


module.exports = arq
