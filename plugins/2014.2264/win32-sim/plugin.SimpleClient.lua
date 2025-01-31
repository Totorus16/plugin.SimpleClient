local Library = require "CoronaLibrary"

-- Create library
local lib = Library:new{ name='plugin.SimpleClient', publisherId='com.totorus16' }

-------------------------------------------------------------------------------
-- BEGIN (Insert your implementation starting here)
-------------------------------------------------------------------------------
local function placeholder()
	print( "WARNING: This library is not available on this platform")
end

lib.init = placeholder
lib.send = placeholder

return lib