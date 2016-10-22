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

module.exports = (robot) ->
    robot.hear /blog|ブログ/i, (res) ->
        res.send "ok"
