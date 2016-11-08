# Description:
#   枝豆の普通の会話を定義します。
#   なんの機能も付いてい無いけど、ちょっと会話させたい。
#   新機能を少し試してみたい。
#   などの場合はここへ。
# Dependencies:
#
# Configuration:
#
# Commands:
#   hubot akkili - akkiliさんのemojiが表示されます。
#   枝豆 or えだまめ - edamameがemojiと名前を返してくれます。デバック用です。
#   hubot ppap - ppapの動画をくれます。
# Notes:
#
# Author:
#   Naoto8734

module.exports = (robot) ->
    robot.hear /枝豆|えだまめ/i, (res) ->
        #console.log(msg)
        res.reply ":edamame:ですよ #{res.message.user.name}さん！  "

    robot.respond /akkili/i, (res) ->
        res.send ":akkili:さんが呼ばれました。"
    
    robot.respond /(ppap|ピコ太郎)/i, (res) ->
        res.reply "Pen-Pineapple-Apple-Pen"
        res.send "https://www.youtube.com/watch?v=0E00Zuayv9Q"
