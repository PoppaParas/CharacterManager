-- @ScriptType: ModuleScript
local CharacterTypecasts = require "../../Typecasts"


local InputManager = {
}


function InputManager.Connect(Object:CharacterTypecasts.CharacterObject)
	
	
end

function InputManager.RunLoop(Delta:number)
	print("Input time: ",Delta)
end

return InputManager
