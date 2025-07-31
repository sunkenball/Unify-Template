-- Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Variables
local TestServer

local Packages = ReplicatedStorage.Packages

local Unify = require(Packages.Unify)

-- Module
local TestClient = {}

do
	TestServer = Unify:Get("TestServer")
end

do
	TestServer:Test():andThen(function(response: string)
		print(response)
	end)

	TestServer.TestEvent:Connect(function(message: string)
		print(message)
	end)
end

return TestClient
