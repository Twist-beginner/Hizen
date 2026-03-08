if not shared then
	return warn("Shared environment not detected.")
end

loadstring("getfenv().LPH_NO_VIRTUALIZE = function(...) return ... end")()

getfenv().PP_SCRAMBLE_NUM = function(...)
	return ...
end

getfenv().PP_SCRAMBLE_STR = function(...)
	return ...
end

getfenv().PP_SCRAMBLE_RE_NUM = function(...)
	return ...
end

local Tracker = require("Core/Tracker")
local Hizen = require("Hizen")

local function initializeScript()

	if shared.Hizen then
		shared.Hizen.detach()
		Hizen.queued = shared.Hizen.queued
	end

	shared.Hizen = Hizen
	shared.Hizen.init()

end

local function onInitializeError(error)

	warn("Hizen initialization failed.")
	warn(error)
	warn(debug.traceback())

	Hizen.detach()

end

Tracker.run("Hizen_Initialize", function(...)
	return xpcall(initializeScript, onInitializeError, ...)
end)