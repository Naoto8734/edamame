#"枝豆"の発言に反応する。
module.exports = (robot) ->
    robot.hear /枝豆|えだまめ|edamame/i, (msg) ->
        #console.log(msg)
        msg.send ":edamame: @#{msg.message.user.name}"

#akkiliさんに反応する。
    robot.respond /akkili/i, (msg) ->
         msg.send ":akkili:さんが#{msg.message.user.room}で呼ばれました。"
