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
    Slack = require 'slack-node'
    slack = new Slack process.env.SLACK_API_TOKEN
    DIR = '/home/pi/Pictures/'

    robot.hear /(部室.今)|(今.部室)/i, (msg) ->
        channel = msg.message.room
        fileName = "clubroom.jpg"

        console.log "rcv"
        exec "raspistill -o #{DIR}#{fileName} -t 1", (err, stdout, stderr) ->
            if err
                return msg.send "Take photo error : Failed " + err

            postSlack channel, fileName, (err, res) ->
                if err
                    return msg.send "Post error : Failed " + err
                msg.reply ":OK:今の状況ですよ！"


#関数
    postSlack = (channel, fileName, callback) ->
        getChannelFromName channel, (err, id) ->
            if err
                return callback err
            exec "curl -F file=@#{DIR}#{fileName} -F channels=#{channel} -F token=$HUBOT_SLACK_TOKEN https://slack.com/api/files.upload", (err, stdout, stderr) ->
                exec "rm -f #{DIR}#{fileName}", (err, stdout, stderr) ->
                    if err
                        console.log "failed to delete file"
                if err
                    return callback err
                callback null, 'OK'

               
    getChannelFromName = (channelName, callback) ->
        slack.api "channels.list", exclude_archived: 1, (err, response) ->
            if err
                return callback err

            if !response.ok
                return callback response.error
            for val, i in response.channels
                if val.name == channelName
                    return callback null, val.id

            return callback err 
