local Tracker = {}

function Tracker.run(name, func)

	local success, result = func()

	if not success then
		warn("Tracker caught error in:", name)
	end

	return result

end

return Tracker