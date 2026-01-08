-- @ScriptType: ModuleScript
local CharacterTypecasts = require "../../Typecasts"
local InputData = require "../Components/InputData"
local Cache:{CharacterTypecasts.CharacterObject} = {}
local InputManager = {
	Cache = Cache,

}



function InputManager.Connect(Object:CharacterTypecasts.CharacterObject)
	local Found = table.find(InputManager.Cache)
	if Found or not Found.Input then return end
	table.insert(InputManager.Cache,Object)
end

function InputManager.Remove(Object:CharacterTypecasts.CharacterObject)
	local Found = table.find(InputManager.Cache)
	if not Found then return end
	table.remove(InputManager.Cache, Found)
end

local function RunLoop(Object:CharacterTypecasts.CharacterObject,Delta:number)
	local InputData:InputData.InputData = Object.Properties.InputData
	
	
end

function InputManager.RunLoop(Delta:number)
	for i,v in InputManager.Cache do
		if not v.Properties.InputData then continue end
		
	end
end

return InputManager
