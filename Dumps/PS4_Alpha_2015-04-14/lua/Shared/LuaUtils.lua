local utils = {
	ReadOnlyTable = function ( originalTable )
		local proxy = {
			_originalTable = originalTable
		}
		local mt = {
			__index = originalTable,
			__newindex = function ( table, k, v )
				error( "Attempt to modify a value in a readonly table." )
			end
		}
		setmetatable( proxy, mt )
		return proxy
	end
}
LuaUtils = utils:ReadOnlyTable()
