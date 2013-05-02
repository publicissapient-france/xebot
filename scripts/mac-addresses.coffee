
fs = require('fs')

module.exports = (robot) ->
	robot.router.get "/#{robot.name}/current-mac-addresses", (request, response) ->
		mac_addresses_str = fs.readFileSync('./tmp/current-mac-addresses.txt').toString()
		mac_addresses = mac_addresses_str.split('\n')

		response.setHeader "Content-Type", "application/json"
		response.end JSON.stringify mac_addresses
