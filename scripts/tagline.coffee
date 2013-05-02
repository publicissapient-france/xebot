# spawn = require('child_process').spawn

Util = require "util"

module.exports = (robot) ->

	robot.router.get "/#{robot.name}/tagline", (request, response) ->
		robot.brain.data.messages = [{message:"welcome"}] unless robot.brain.data.messages?
		message = robot.brain.data.messages[0]
		message = 
			message : "#{message.message}"
		response.setHeader "Content-Type", "application/json"
		response.end JSON.stringify message

	robot.respond /(screen) (.*)/i, (msg) ->
		text = msg.match[2]
		robot.brain.data.messages.push {message:"#{text}"}
