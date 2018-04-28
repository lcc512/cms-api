const md5 = require('blueimp-md5')
const db = require('../models/db')

//获取会话状态
exports.get = (req, res, next) => {
  if(!req.session.user){
    return res.status(401).json({
      y_error:'wei shou quan'
    })
  }
  res.status(200).json(req.session.user)
}

//创建会话，也就是用户登录
exports.create = async (req, res, next) => {

  try {
    const body = req.body
    body.password = md5(md5(body.password))

    //注意等于号右边传入变量两边需要有双引号
    const sqlStr = `
    select * from users where email='${body.email}' and password='${body.password}'`

    //解构赋值，数组的解构赋值，
    const [user] = await db.query(sqlStr)
    if (!user) {
      return res.status(404).json({
        y_error: 'Invalid email or password'
      })
    }

    //登录成功，记录session，然后之后session.user点出的属性就是数据库里面的列名
    req.session.user=user
    res.status(201).json(user)

  } catch (err) {
    next(err)
  }

}

//删除对话，注销登录
exports.destory = (req, res, next) => {

  //稳妥方法，删除这个session，比把它置为null好
  delete req.session.user
  res.status(201).json({})
}