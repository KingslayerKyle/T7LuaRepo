-- 0f1dd745351a27accb0f29ee2e73f6a9
-- This hash is used for caching, delete to decompile the file again

local f0_local0 = {
	ReadOnlyTable = function ( f1_arg0 )
		local f1_local0 = {
			_originalTable = f1_arg0
		}
		setmetatable( f1_local0, {
			__index = f1_arg0,
			__newindex = function ( f2_arg0, f2_arg1, f2_arg2 )
				error( "Attempt to modify a value in a readonly table." )
			end
		} )
		return f1_local0
	end
}
LuaReadOnlyTables = f0_local0:ReadOnlyTable()
