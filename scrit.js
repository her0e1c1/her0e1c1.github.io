var fs = require("fs")
var path = require("path")

export const getFiles = root => {
  let r = []
  let files = fs.readdirSync(root)
  files.forEach(f => {
    f = path.join(root, f)
    let stat = fs.statSync(f)
    if (stat.isFile()) {
      r.push(f)
    } else if (stat.isDirectory()) {
      r = r.concat(getFiles(f))
    }
  })
  return r
}
