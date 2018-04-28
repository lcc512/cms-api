const express = require('express')
const router = express.Router()

const db = require('./models/db')

const userController = require('./controllers/user')
const topicController = require('./controllers/topic')
const commentController = require('./controllers/comment')
const sessionController = require('./controllers/session')

//以下封装一个获取用户登录状态的方法 一个中间件
//提取方法，实现功能，校验登录状态
function checkLogin(req, res, next) {
  if (!req.session.user) {
    return res.status(401).json({
      y_error: 'wei shou quan'
    })
  }

  //如果if不执行 则下一个中间件开始执行
  next()
}

//以下封装一个 验证用户操作的话题是否存在和是否属于当前登录用户的话题 一个中间件
async function checkTopic(req, res, next) {

  // url中的 :id 叫做动态路由参数
  // 可以通过 req.params 来获取这个动态路由参数
  // 查询字符串 req.query
  // post请求体 req.body
  // 动态路径参数 req.params  路径实际写的时候不用写那个冒号

  //根据话题id查询到话题，如果话题的用户id和当前用户id一致，则可删除，否则不可
  try {
    const {id} = req.params
    const [topic] = await db.query(`select * from topics where id=${id}`)

    //如果资源不存在，
    if (!topic) {
      return res.status(404).json({
        y_error: 'Topis is not exists'
      })
    }
    //如果话题不属于当前登录用户
    if (topic.user_id !== req.session.user.id) {
      return res.status(400).json({
        y_error: 'Fobbiden user todo'
      })
    }

    // 验证完成，执行下一个中间件
    next()

  } catch (err) {
    next(err)
  }

}

// 用户资源
router
  .get('/users', userController.list)
  .post('/users', userController.create)
  .patch('/users/:id', userController.update)
  .delete('/users/:id', userController.destory)

// 话题资源
router
  .get('/topics', topicController.list)
  .get('/topics/:id', topicController.listByID)
  .post('/topics', checkLogin, topicController.create)
  .patch('/topics/:id', checkLogin, checkTopic, topicController.update)
  .delete('/topics/:id', checkLogin, checkTopic, topicController.destory)

// 评论资源
router
  // .get('/comments', commentController.list)
  .get('/comments', commentController.list)
  .post('/comments', checkLogin, commentController.create)
  .patch('/comments/:id', checkLogin, commentController.update)
  .delete('/comments/:id', checkLogin, commentController.destory)

// 会话资源
router
  .get('/session', sessionController.get)
  .post('/session', sessionController.create)
  .delete('/session/', sessionController.destory)

//导出router模块
module.exports = router