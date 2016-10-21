#tanapiのtemputureを知りたい。
#http://qiita.com/PonDad/items/47c7786b36c8359ac56e#_reference-49d84e486822e845da0b

child_process = require('child_process')
module.exports = (robot) ->
    robot.hear /(タナパイ|tanapi).(温度|temp)/i, (msg) ->
        child_process.exec 'vcgencmd measure_temp', (error, stdout, stderr) ->
            if error
                return msg.send "Error:" + error
            msg.send(stdout)
        return
