#ブログの順番管理用。
module.exports = (robot) ->
    robot.hear /ブログ/i , (res) ->
        res.reply "ブログを書こう！"
