const express = require('express')
const router = require('./router')
const session=require('express-session')
//npm 装body-parser 用来获取表单POST请求体
const bodyParse = require('body-parser')

const app = express()

app.use(bodyParse.urlencoded({extended: false}))
app.use(bodyParse.json())

app.use(session({
  secret: 'mylcc',//加密附加字符串，增加密码复杂度，可自定义
  resave: false,
  saveUninitialized: true//是否在未使用session是给其分配id
}))

app.use(router)
// app.get('/',(reg,res,next)=>{
//     res.status(200).send('api server is running...')
// })

//user中等等其他controllers中需要统一处理的错误，统一在这儿处理
app.use((err,req,res,next)=>{
  res.status(500).json({
    t_error:err
  })
})

app.listen(3100, function () {
  console.log('running at port 3100...')
  // 用nodemon 启动这个js
})
