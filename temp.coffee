# Description:
#   タナパイのCPU温度を知る事ができます。
#   http://qiita.com/PonDad/items/47c7786b36c8359ac56e#_reference-49d84e486822e845da0b
#   参考です。
#
# Dependencies:
#
# Configuration:
#
# Commands:
#   tanapi temp or タナパイ 温度 - タナパイのCPU温度が表示されます。間には適当な1文字を入れてください。
#
# Notes:
#   <optional notes required for the script>
#
# Author:
#   <github username of the original script author>

child_process = require('child_process')
module.exports = (robot) ->
    robot.hear /(タナパイ.温度)|(tanapi.temp)/i, (msg) ->
        child_process.exec 'vcgencmd measure_temp', (error, stdout, stderr) ->
            if error
                return msg.send "Error:" + error
            msg.send(stdout)
        return
