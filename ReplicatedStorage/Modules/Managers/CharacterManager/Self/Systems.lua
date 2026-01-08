-- @ScriptType: ModuleScript
local RunService = game:GetService("RunService")

local CharacterTypecasts = require "../Typecasts"
local TableUtil = require "../../../Utils/TableUtil"

local Systems = {}


function Systems.Connect(Object:CharacterTypecasts.CharacterObject,Component:string)
	local Module = script:FindFirstChild(Component)
	if not (Module and Module:IsA("ModuleScript")) then return end
	local RequiredModule = require(Module)
	RequiredModule.Connect(Object)
end


function Systems.Remove(Object:CharacterTypecasts.CharacterObject,Component:string)
	Object.Components[Component] = nil

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
