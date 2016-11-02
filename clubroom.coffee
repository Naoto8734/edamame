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
    comment = "画像を投稿しました。:ok:"

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
                #exec "#{DIR}face_over_write.py", (err, stdout, stderr) ->
                #    if err
                #        return msg.reply "写真の加工に失敗しました。 :" + err
                #    msg.reply "写真を加工しました。 :warai_otoko:"

                    #画像の投稿 タブを一つずらしました。
                exec "curl -F file=@#{DIR}clubroom.jpg -F channels=#{channel} -F token=#{mytoken} -F filename=clubroom -F initial_comment=#{comment} https://slack.com/api/files.upload", (err, stdout, stderr) ->
                    if err
                        return msg.repply "画像の投稿に失敗しました。 :" + err
                    data = JSON.parse stdout
                    if !data.ok
                        return msg.reply "画像の投稿に失敗しました。 :" + data.error
