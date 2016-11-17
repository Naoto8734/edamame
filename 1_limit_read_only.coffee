# Description:
#  read_only(general)チャンネルの発言に@channelをつけないと、赤城さんが怒ります。
#
# Dependencies:
#
# Configuration:
#
# Commands:
#
# Notes:
#
# Author:
#   Naoto8734

mychannel = "C2GJNG457"
#"C0EK3RA04"がread_only

module.exports = (robot) ->
    robot.hear /.*/, (msg) ->
        if msg.message.room == mychannel
            #channelがread_onlyだった時
            if !(/@channel/.test(msg.message.text))
                msg.send "ok!"
                #@channelをつけなかった時
                mytoken = process.env.HUBOT_SLACK_TOKEN
                mytext = "@channelをつけてくださいね。"
                
                request = robot.http("https://slack.com/api/chat.postMessage")
                    .query(token:mytoken)
                    .query(channel:mychannel)
                    .query(text:mytext)
                    .query(username:赤城)
                    .query("iconurl:https://dl.dropboxusercontent.com/s/tzvut1fxlkcxsz4/akagi.jpg")
                    .get()
                
                request (err, res, body) ->
                    msg.send "ok"
                    if err
                        msg.send "Error:cry: : #{err}"
                    data = JSON.parse body
                    if !data.ok
                        msg.send "Error:cry: : #{data.error}"
