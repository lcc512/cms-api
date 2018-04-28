exports.andCondition = (query) => {

  // 注意str两边的空格，要没有，在拼接成sql语句会练成一块
  let str = ' 1=1 '
  for (let key in query) {
    str += ` and ${key}='${query[key]}' `
  }
  return str
}
// query没有 select * from users where 1=1
// query有   select * from users where email='sdfs' and nickname='sdfsd'