# Description:
#   枝豆の普通の会話を定義します。
#   なんの機能も付いてい無いけど、ちょっと会話させたい。
#   新機能を少し試してみたい。
#   などの場合はここへ。
# Dependencies:
#
# Configuration:
#
# Commands:
#   hubot akkili - akkiliさんのemojiが表示されます。
#   枝豆 or えだまめ - edamameがemojiと名前を返してくれます。デバック用です。
#   hubot ppap - ppapの動画をくれます。
#   hubot sushi - :sushi:ﾍｲﾗｯｼｬｲ
#   hubot noSee - (　ﾟдﾟ)こっちみんな
# Notes:
#
# Author:
#   Naoto8734

module.exports = (robot) ->
    robot.hear /枝豆|えだまめ/i, (res) ->
        #console.log(msg)
        res.reply ":edamame:ですよ #{res.message.user.name}さん！  "

    robot.respond /akkili/i, (res) ->
        res.send ":akkili:さんが呼ばれました。"

    robot.hear /ppap/i, (res) ->
        res.reply """
        I have a pen :lower_left_ballpoint_pen:
        I have an apple :apple:
        ah!　Apple pen :apple::lower_left_ballpoint_pen:
        I have a pen :lower_left_ballpoint_pen:
        I have a Pineapple:pineapple:
        ah!　Pineapple pen:pineapple::lower_left_ballpoint_pen:
        Apple pen :apple::lower_left_ballpoint_pen: Pineapple pen :pineapple::lower_left_ballpoint_pen:
        Pen Pineapple Apple pen :lower_left_ballpoint_pen::pineapple::apple::lower_left_ballpoint_pen:
        Pen Pineapple Apple pen :lower_left_ballpoint_pen::pineapple::apple::lower_left_ballpoint_pen:
        """

    robot.hear /sushi|寿司|へいらっしゃい/i, (res) ->
      res.reply """
      \\ﾍｲﾗｯｼｬｲ/
      SUSHI:sushi:食べたい:pray:この世:earth_asia:の終わり:wave:の日は
      SUSHI:sushi:食べたい:pray:最後:boom::bomb:の晩餐:fork_and_knife:に:innocent:
      SUSHI:sushi:食べたい:pray:特別:birthday::tada::trophy::couplekiss:なあの日:calendar:には
      SUSHI:sushi:食べたい:pray:
      トロ:fish:タコ:octopus:ウニ✳いくら:moneybag:
      :loudspeaker:ﾃｰﾚｰﾚｰ⤴(感謝:pray:セ〜〜〜ル)(都会:bridge_at_night:のオアスシ:sushi:)
      """

    robot.hear /(?:no see|こっちみんな)\s+(.*)/i, (res) ->
      noSee = res.match[1]
      res.reply """
      (　ﾟдﾟ) 「#{noSee}」
      ＿(__つ/￣￣￣/＿

      ＼/ /

      ￣￣￣



      ( ﾟдﾟ ) 彡 

      ＿(__つ/￣￣￣/＿

      ＼/ /

      ￣￣￣
      """
