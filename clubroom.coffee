#部室の入退室管理用

module.exports = (robot) ->
    robot.hear /部室.今/i, (msg) ->
        msg.reply "部室の今の画像ですよ！"
        #写真の撮影処理
        #写真撮影の例外処理
        #写真の投稿処理
        filename = "./clubroom.jpg"
        channel = msg.message.rawMessage.channel #<-ここの右辺のチャンネルがないとエラー発生。
        exec "curl -F file=@#{filename} -F channels=#{channel} -F token=#{process.env.HUBOT_SLACK_TOKEN} https://slack.com/api/files.upload", (err, stdout, stderr) ->
            if err
            #写真の投稿の例外処理
                msg.reply "写真の投稿に失敗しました。"

