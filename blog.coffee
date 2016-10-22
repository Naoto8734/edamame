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
url = "https://slack.com/api/channels.info"

module.exports = (robot) ->
    robot.hear /blog|ブログ/i, (res) ->
        url += "?token=#{token}&channel=#{res.message.room}&pretty=1"
        robot.http(url)
            .header('Accept', 'application/json')
            .get() (err, res, body) ->
                if err
                    res.send "Error:cry::#{err}"
                data = JSON.parse body
                res.send "#{data.ok}"
