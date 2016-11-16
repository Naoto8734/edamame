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

channel = "C2GJNG457"
#"C0EK3RA04"がread_only

module.exports = (robot) ->
    robot.hear /.*/, (msg) ->
        if msg.message.room = channel
            #channelがread_onlyだった時
            if !(/@channel/.test(msg.message.room))
                #@channel
                msg.send "@chnnelをつけませんでしたね。"
