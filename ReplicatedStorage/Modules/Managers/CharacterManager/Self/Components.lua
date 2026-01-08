-- @ScriptType: ModuleScript
local CharacterTypecasts = require "../Typecasts"
local TableUtil = require "../../../Utils/TableUtil"

local Components:CharacterTypecasts.ComponentSystem = {}
local ComponentModules = {
	Input = require(script.Input)
}
local ComponentTypes = {
	"InputData",
}
function Components.Add(Object: CharacterTypecasts.CharacterObject, ComponentName: string)

	local Module = ComponentModules[ComponentName]
	if not Module then 
		warn("Component does not exist:", ComponentName)
		return 
	end

	-- Create the data
	local data = Module.new()

	-- Attach it to the object (using the name as the key)
	Object[ComponentName] = data

	return data
end

-- 3. Optional: A Remove function
function Components.Remove(Object: CharacterTypecasts.CharacterObject, ComponentName: string)
	if Object[ComponentName] then
		Object[ComponentName] = nil
	end
end




return Components
