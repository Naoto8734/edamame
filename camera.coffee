child_process = require('child_process')
module.exports = (robot) ->
  robot.respond /sample/i, (msg) ->
      child_process.exec 'ls', (error, stdout, stderr) ->
          msg.send(stdout)
              msg.send(stderr)
                  msg.send(error)
                      return
