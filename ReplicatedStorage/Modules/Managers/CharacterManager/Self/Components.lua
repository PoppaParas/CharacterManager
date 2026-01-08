-- @ScriptType: ModuleScript
local CharacterTypecasts = require "../Typecasts"
local TableUtil = require "../../../Utils/TableUtil"

local Components:CharacterTypecasts.ComponentSystem = {}
local ComponentTypes = {
	"InputData",
}

function Components.Call(Object:CharacterTypecasts.CharacterObject,Component:string,...)
	local Module = script:FindFirstChild(Component)
	if not (Module and Module:IsA("ModuleScript")) then return end
	return require(Module)(Object,...)
end


function Components.Remove(Object:CharacterTypecasts.CharacterObject,Component:string)
	Object.Components[Component] = nil
	
end


return Components
