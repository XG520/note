# mongodb

## insert

db. <集合>.insertOne(<json对象>)

db.<集合>.insertMany([<json1>,<json2>,<json3>])

例：

~~~shell
db.fruit.insertOne({name:"apple"})
db.fruit.insertMany(
[{name:"apple"},
{name:"pear"},
{name:"orange"}
])
~~~

