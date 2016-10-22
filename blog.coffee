# Description:
#   ブログの更新順をランダムに決めます。
#
# Dependencies:
#
# Configuration:
#
# Commands:
#   hubot ブログ - 今いるチャンネルから、ランダムで1人選びます。
#
# Notes:
#
# Author:
#   Naoto8734

token = process.env.SLACK_API_TOKEN
myurl = "https://slack.com/api/channels.info"
module.exports = (robot) ->
    robot.hear /blog|ブログ/i, (msg) ->
        myurl += "?token=#{token}&channel=#{msg.message.room}"
        msg.send "叩くよ。"
        request = robot.http(myurl)
            .get()
        request (err, res, body) ->
            msg.send "叩いたよ"
