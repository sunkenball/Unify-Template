-- Services
local HttpService = game:GetService("HttpService")

-- Module
local Functions = {}

function Functions.getId(): string
	return string.lower(HttpService:GenerateGUID(false))
end

function Functions.deepCopy(table: { [any]: any }): { [any]: any }
	local copy = {}

	for key, value in table do
		if type(value) == "table" then
			copy[key] = Functions.deepCopy(value)
		else
			copy[key] = value
		end
	end

	return copy
end

return Functions
