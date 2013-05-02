# Description:
#   Display RSS feed
#
# Commands:
#   hubot rss <url> - Displays news titles
module.exports = (robot) ->
  robot.respond /(rss) (.*)/i, (msg) ->
    query = msg.match[2]
    msg.http(query).get() (err, res, body) ->
        titles = ""
        res = body.match(/\<title\>([^<]+)\<\/title\>/g)
        res.forEach (title) ->
          title = title.replace /<title>/, ""
          title = title.replace /<\/title>/, ""
          titles += title + " - "
        robot.brain.data.messages.push {message:"#{titles}"}