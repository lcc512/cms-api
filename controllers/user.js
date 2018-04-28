const md5 = require('blueimp-md5')
const moment = require('moment')
const db = require('../models/db')
const sqlHelper=require('../utilities/sqlhelper')

exports.list = async (req, res, next) => {

  try{

    //处理拼接sql语句where的条件
    const andConditionStr=sqlHelper.andCondition(req.query)

    // const {email,nickname}=req.query
    const strSql=`select * from users where ${andConditionStr}`
    const user=await db.query(strSql)
    res.status(200).json(user)

  }catch (err){
    next(err)
  }

}

exports.create = async (req, res, next) => {

  //我们把容易出错的代码放在try catch中
  try {
  const body = req.body

//写sql语句
//     npm i moment 强大的时间处理库
  const sqlStr = `insert into users(username,password,email,nickname,avatar,gender,create_time,modify_time)
                values('${body.email}',
                       '${md5(md5(body.password))}',
                       '${body.email}',
                       '${body.nickname}',
                       'default-avatar.png',
                       0,
                       '${moment().format('YYYY-MM-DD HH:mm:ss')}',
                       '${moment().format('YYYY-MM-DD HH:mm:ss')}')`


    // 执行插入数据
    const ret = await db.query(sqlStr)

    //ret.insertId 是插入数据操作后，返回的结果对象的一个属性，代表插入的条目的id值，
    //然后这里根据这个id值重新select这条数据
    const [user] = await db.query(`select * from users where id='${ret.insertId}'`)

    res.status(201).json(user)

  } catch (err) {

    //用next统一处理错误信息，意思是往下一个中间件执行
    next(err)
  }


}

exports.update = (req, res, next) => {

}

exports.destory = (req, res, next) => {

}
