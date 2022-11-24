local variant = Tracker.ActiveVariantUID
local has_map = not variant:find("itemsonly")
local hard = variant:find("hard")

Tracker:AddItems("items/items.json")
if hard then
  Tracker:AddItems("items/hard.json")
else
  Tracker:AddItems("items/normal.json")
end

if has_map then
  ScriptHost:LoadScript("scripts/logic.lua")
  Tracker:AddItems("items/settings.json")
  Tracker:AddMaps("maps/maps.json")
  Tracker:AddLocations("locations/locations.json")
end

Tracker:AddLayouts("layouts/items.json")
Tracker:AddLayouts("layouts/layouts.json")
Tracker:AddLayouts("layouts/capture.json")
Tracker:AddLayouts("layouts/tracker.json")
Tracker:AddLayouts("layouts/broadcast.json")