const mysql = require('mysql');

// 创建一个mysql连接池，效率更高，不需要每次操作数据库都创建连接
const pool = mysql.createPool({
  host: 'localhost',
  user: 'root',
  password: 'jianpan',
  database: 'cms'
});

//执行sql语句的方法，各种语句增删改查都用这个，传入不同的sql语句
exports.query = function (sqlStr) {

  return new Promise((resolve, reject) => {

    //从连接池中拿一个连接
    pool.getConnection(function (err, connection) {
      if (err) {
        return reject(err)
      }
      connection.query(sqlStr, (err, ...args) => {

        //操作结束，尽早的释放连接
        connection.release();
        if (err) {
          return reject(err)
        }
        resolve(...args)
      })
    })
  })

}