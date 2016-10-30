# Description:
#   ブログの更新順をランダムに決めます。
#
# Dependencies:
#
# Configuration:
#
# Commands:
#   hubot 選んで - 今いるチャンネルから、ランダムで1人選びます。
#
# Notes:
#
# Author:
#   Naoto8734

mytoken = process.env.HUBOT_SLACK_TOKEN
myurl = "https://slack.com/api/channels.info"
module.exports = (robot) ->
    robot.respond /選んで/i, (msg) ->
        myurl += "?token=#{mytoken}&channel=#{msg.message.room}"
        #APIを叩く。
        request = robot.http(myurl)
            .get()
        request (err, res, body) ->
            if err
                msg.send "Error:cry: : #{err}"
            data = JSON.parse body
            random_member = msg.random data.channel.members
            msg.send "#{data.channel.name}から１人選びます。"

#random_memberはidなので、再びAPIを叩いて名前を取得する。
            request = robot.http("https://slack.com/api/users.info")
                .query(token: mytoken)
                .query(user: random_member)
                .get()
            request (err, res, body) ->
                if err
                    msg.send "Error:cry: : #{err}"
                data = JSON.parse body
                msg.send "#{data.user.name}さんが選ばれました。"
