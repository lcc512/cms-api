const moment = require('moment')
const db = require('../models/db')

exports.list = async (req, res, next) => {

  try {
    const {topic_id} = req.query
    // comment 是一个数组
    const comment = await db.query(`select * from comments where topic_id=${topic_id}`)
    res.status(200).json(comment)
  } catch (err) {
    next(err)
  }
}

exports.create = async (req, res, next) => {

  try {
    const {
      content = '',
      topic_id,
      reply_id = 0
    } = req.body
    const strSql = `insert into comments (content,create_time,modify_time,topic_id,user_id,reply_id)
                value('${content}',
                      '${moment().format('YYYY-MM-DD HH:mm:ss')}',
                      '${moment().format('YYYY-MM-DD HH:mm:ss')}',
                      ${topic_id},
                      ${req.session.user.id},
                      ${reply_id})`

    const {insertId} = await db.query(strSql)
    const [comment] = await db.query(`select * from comments where id=${insertId}`)
    res.status(201).json(comment)

  } catch (err) {
    next(err)
  }

}

exports.update = (req, res, next) => {

}

exports.destory = (req, res, next) => {

}