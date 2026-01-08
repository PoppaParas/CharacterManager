-- @ScriptType: ModuleScript
local RunService = game:GetService("RunService")

local CharacterTypecasts = require "../Typecasts"
local TableUtil = require "../../../Utils/TableUtil"

local Systems = {
	
}
local CurrentSystems = {
	InputData = require(script.InputData)
}
type CurrentSystems = typeof(CurrentSystems)

function FetchModule(Name:string)

	return CurrentSystems[Name]
end

function Systems.Connect(Object:CharacterTypecasts.CharacterObject,System:string)
	local RequiredModule = FetchModule(System)
	if not RequiredModule then return end
	RequiredModule.Connect(Object)
end


function Systems.Remove(Object:CharacterTypecasts.CharacterObject,System:string)
	local RequiredModule = FetchModule(System)
	if not RequiredModule then return end
	RequiredModule.Remove(Object)

end

function Systems.Call(Object:CharacterTypecasts.CharacterObject,System:string,Func:string,...)
	local RequiredModule = FetchModule(System)
	if not RequiredModule then return end
	RequiredModule[Func](Object,...)
end


local function SystemAdded(System:ModuleScript)
	if not System:IsA("ModuleScript") then return end
	local RequiredSystem = require(System)
	if not RequiredSystem.RunLoop then return end
	RunService.Heartbeat:Connect(RequiredSystem.RunLoop)
end

for i,v in script:GetChildren() do
	SystemAdded(v)
end
script.ChildAdded:Connect(SystemAdded)

return Systems
