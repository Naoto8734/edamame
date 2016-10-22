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
    robot.hear /選んで/i, (msg) ->
        myurl += "?token=#{token}&channel=#{msg.message.room}"
        #APIを叩く。
        request = robot.http(myurl)
            .get()
        request (err, res, body) ->
            if err
                msg.send "Error:cry: : #{err}"
            data = JSON.parse body
            random_member = msg.random data.channel.members
            msg.send "今回は<@#{random_member}>さんです！"
            msg.send "#{data.channel.name}から１人選びました。"
