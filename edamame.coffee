#"枝豆"の発言に反応する。
module.exports = (robot) ->
    robot.hear /枝豆|えだまめ/i, (res) ->
        #console.log(msg)
        res.send ":edamame: @#{res.message.user.name}"

#akkiliさんに反応する。
    robot.respond /akkili/i, (res) ->
         res.send ":akkili:さんが呼ばれました。"
