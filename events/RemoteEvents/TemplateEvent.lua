-- events/RemoteEvents/TemplateEvent.lua
local TemplateEvent = {}
TemplateEvent.__index = TemplateEvent

TemplateEvent.__EVENT__ = "TemplateEvent"
TemplateEvent.CanInitialize = false

function TemplateEvent:init(core, remoteEvent)
    self.Core = core
    self.RemoteEvent = remoteEvent
    self.CanInitialize = true
    self:setup()
end

function TemplateEvent:setup()
    self.RemoteEvent.OnServerEvent:Connect(function(player, ...)
        self:onEvent(player, ...)
    end)
end

function TemplateEvent:onEvent(player, ...)
    print("TemplateEvent triggered by", player.Name)
end

return TemplateEvent
