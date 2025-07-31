-- Services
local Players = game:GetService("Players")

-- Module
local TestServer = {
	Client = {},
}

-- Defining an event which is exposed to the client that can be listened to or fired
function TestServer.Client.TestEvent(...: any)
	return
end

-- Defining a method which is exposed to the client which can be called
function TestServer.Client:Test(...: any)
	return self.Server:Test(...)
end

function TestServer:Test(player: Player): string
	return `User Id: {player.UserId}`
end

function TestServer.onPlayerAdded(player: Player)
	TestServer.Client.TestEvent:Fire(player, `Welcome {player.Name}!`)
end

do
	Players.PlayerAdded:Connect(TestServer.onPlayerAdded)

	for _, player in Players:GetPlayers() do
		task.spawn(TestServer.onPlayerAdded, player)
	end
end

return TestServer
