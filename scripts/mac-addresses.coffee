
fs = require('fs')

module.exports = (robot) ->
	robot.router.get "/#{robot.name}/current-mac-addresses", (request, response) ->
		mac_addresses_str = fs.readFileSync('./tmp/current-mac-addresses.txt').toString()

		current_mac_addresses = mac_addresses_str.split('\n')
		stored_mac_addresses = robot.brain.data.mac_addresses

		result = {}
		for addr in stored_mac_addresses?
			result[addr] = {name: stored_mac_addresses[addr].name, connected: false}
		for addr in current_mac_addresses
			if(result[addr])
				result[addr].connected = true
			else
				result[addr] = {name: "", connected: true}

		response.setHeader "Content-Type", "application/json"
		response.end JSON.stringify result

	robot.router.post "/#{robot.name}/claim", (request, response) ->
		mac = request.body.mac;
		name = request.body.name;
		ip = request.connection.remoteAddress;

		console.log("Mac " + mac + " IP " + ip + " User : " + name);
		robot.brain.data.mac_addresses[mac] = {ip:ip, name:name}
		response.end ""
