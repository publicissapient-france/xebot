# spawn = require('child_process').spawn

Util = require "util"

module.exports = (robot) ->

	robot.router.get "/#{robot.name}/tagline", (request, response) ->
		robot.brain.data.messages = [{message:"welcome"}] unless robot.brain.data.messages?
		messages = []
		if robot.brain.data.messages.length < 5
			messages = robot.brain.data.messages
		else
			messages = robot.brain.data.messages[robot.brain.data.messages.length - 5..robot.brain.data.messages.length - 1] 
		console.log messages
		response.setHeader "Content-Type", "application/json"
		response.end JSON.stringify messages

	robot.respond /(screen) (.*)/i, (msg) ->
		text = msg.match[2]
		console.log msg
		robot.brain.data.messages.push {message:"#{text}"}
