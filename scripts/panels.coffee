
Util = require "util"

module.exports = (robot) ->

	openConnections = []

	robot.router.get "/#{robot.name}/panels", (request, response) ->
		req.socket.setTimeout(Infinity)

		res.writeHead 200, {
			'Content-Type': 'text/event-stream',
			'Cache-Control': 'no-cache',
			'Connection': 'keep-alive'
		}
		res.write('\n')
		console.log "Opening connection for : " + req
		openConnections.push(res)
		req.on "close", () ->
			openConnections.splice(openConnections.indexOf(res), 1);
			console.log(openConnections.length)

	robot.respond /(load) (.*) (in frame) (.*)/i, (msg) ->
		url = msg.match[2]
		frame = msg.match[4]
		for connection in openConnections 
			d = new Date()
			message = createMsg()
			console.log message
			resp.write('id: ' + d.getMilliseconds() + '\n')
			resp.write('data:' + message +   '\n\n')

	createMsg : () ->
		msg = {}	
		msg.hostname = os.hostname()
		msg.type = os.type()
		msg.platform = os.platform()
		msg.arch = os.arch()
		msg.release = os.release()
		msg.uptime = os.uptime()
		msg.loadaverage = os.loadavg()
		msg.totalmem = os.totalmem()
		msg.freemem = os.freemem()
		JSON.stringify(msg)
