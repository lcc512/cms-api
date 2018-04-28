const db = require('../models/db')
const moment = require('moment')

// 也写了分页显示的功能
exports.list = async (req, res, next) => {

  try {
    //解构赋值，当get是带问号参数的请求时，req.query请求体里有这些参数，通过解构赋值给它们
    let {_page = 1, _limit = 20} = req.query

    if (_page < 1) {
      _page = 1
    }
    if (_limit < 1) {
      _limit = 1
    }
    if (_limit > 20) {
      _limit = 20
    }

    //              _page           _limit
    //              页码，索引值序号，每页条数
    //第一页显示20   1,0,20
    //第二页显示20   2,20,20
    //第三页显示20   3,40,20
    const sqlStr = `select * from topics limit ${(_page - 1) * _limit},${_limit}`
    // console.log(_page,_limit)
    const count=await db.query(`select count(*) as count from topics`)
    const topics = await db.query(sqlStr)
    res.status(200).json({
      topics,
      count
    })
  } catch (err) {
    next(err)
  }

}
//根据ID找话题
exports.listByID = async (req, res, next) => {
  try {
    const {id} = req.params
    // console.log(id)
    const topics = await db.query(`select * from topics where id='${id}'`)
    // console.log(topics)

    res.status(200).json(topics[0])
  } catch (err) {
    next(err)
  }
}

//创建话题
exports.create = async (req, res, next) => {

  try {

    const body = req.body
    body.create_time = moment().format('YYYY-MM-DD HH:mm:ss')
    body.modify_time = moment().format('YYYY-MM-DD HH:mm:ss')
    body.user_id = req.session.user.id

    const sqlStr = `
                insert into topics(title, content, user_id, create_time, modify_time)
                values('${body.title}', '${body.content}', '${body.user_id}', '${body.create_time}', 
                '${body.modify_time}')`

    // sql查询方法返回的数组（第一条是ret[0]），增删改方法返回的是对象
    const ret = await db.query(sqlStr)
    const [topic] = await db.query(`select * from topics where id='${ret.insertId}'`)

    res.status(201).json(topic)

  } catch (err) {
    next(err)
  }

}

//更新话题
exports.update = async (req, res, next) => {

  try {

    const {id} = req.params
    const body = req.body
    const sqlStr = `update topics set 
                                   title='${body.title}',
                                   content='${body.content}',
                                   modify_time='${moment().format('YYYY-MM-DD HH:mm:ss')}' 
                                   where id=${id} `
    await db.query(sqlStr)
    const [updatedTopic] = await db.query(`select * from topics where id=${id}`)
    res.status(201).json(updatedTopic)
  } catch (err) {
    next(err)
  }
}

//删除话题
exports.destory = async (req, res, next) => {
  // url中的 :id 叫做动态路由参数
  // 可以通过 req.params 来获取这个动态路由参数
  // 查询字符串 req.query
  // post请求体 req.body
  // 动态路径参数 req.params  路径实际写的时候不用写那个冒号

  //根据话题id查询到话题，如果话题的用户id和当前用户id一致，则可删除，否则不可

  try {
    const {id} = req.params

    //执行删除操作
    const ret = await db.query(`delete from topics where id=${id}`)
    res.status(201).json({})
  } catch (err) {
    next(err)
  }


}