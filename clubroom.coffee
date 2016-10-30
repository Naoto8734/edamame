# Description:
#   部室の写真を投稿します。
#   http://qiita.com/KeitaMoromizato/items/1ecbfcd0f9343ce53975
#   参考です。
#
# Dependencies:
#
# Configuration:
#
# Commands:
#   部室 今 - 部室の今の写真を撮影、投稿します。間の部分には適当な１文字を入れてください。
#
# Notes:
#
# Author:
#   Naoto8734

module.exports = (robot) ->
    exec = require('child_process').exec
    mytoken = process.env.HUBOT_SLACK_TOKEN
    DIR = '/home/pi/Pictures/'

    robot.hear /(部室.今)|(今.部室)/i, (msg) ->
        channel = "C2T9PNAR0"

        #channelが正しいかを判定
        if msg.message.room != channel
            #channelでない時
            msg.reply "#clubroomでお願いします!!  :angry:"
        else
            #写真を撮影
            exec "raspistill -o #{DIR}clubroom.jpg", (err, stdout, stderr) ->
                if err
                    return msg.reply "写真の撮影に失敗しました。 :" + err
                msg.reply "写真を撮りました。:camera:"

                #画像の加工
                exec "python #{DIR}face_over_write.py", (err, stdout, stderr) ->
                    if err
                        return msg.reply "写真の加工に失敗しました。 :" + err
                    msg.reply "写真を加工しました。 :warai_otoko:"

                    #画像の投稿
                    request = robot.http("https://slack.com/api/files.upload")
                        .query(token: mytoken)
                        .query(file: DIR+"result.png")
                        .query(filename:"clubroom")
                        .query(channels: channel)
                        .get()
                    request (err, res, body) ->
                        if err
                            return msg.reply "写真の投稿に失敗しました。 :" + err
                        data = JSON.parse body
                        if !data.ok
                            return msg.reply "写真の投稿に失敗しました。 :" + data.error
