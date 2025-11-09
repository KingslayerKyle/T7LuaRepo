LUI.LUIElementAllocator = {}
LUI.LUIElementAllocator.alloc = function ( f1_arg0 )
	if f1_arg0 ~= nil and f1_arg0.m_pool ~= nil then
		for f1_local0 = 1, #f1_arg0.m_pool, 1 do
			if f1_arg0.m_pool[f1_local0].m_allocated == false then
				f1_arg0.m_pool[f1_local0].m_allocated = true
				return f1_arg0.m_pool[f1_local0]
			end
		end
	end
	error( "LUI Element Allocator: No more free elements in the pool. Allocation failed." )
	return nil
end

LUI.LUIElementAllocator.free = function ( f2_arg0, f2_arg1 )
	if f2_arg0 ~= nil and f2_arg0.m_pool ~= nil then
		for f2_local0 = 1, #f2_arg0.m_pool, 1 do
			if f2_arg0.m_pool[f2_local0] == f2_arg1 then
				f2_arg0.m_pool[f2_local0].m_allocated = false
				f2_arg1 = nil
				return 
			end
		end
	end
	error( "LUI Element Allocator: Tried to free an element that does not exist in the pool." )
end

LUI.LUIElementAllocator.freeAll = function ( f3_arg0 )
	if f3_arg0 ~= nil and f3_arg0.m_pool ~= nil then
		for f3_local0 = 1, #f3_arg0.m_pool, 1 do
			f3_arg0.m_pool[f3_local0].m_allocated = false
		end
	end
end

LUI.LUIElementAllocator.addToPool = function ( f4_arg0, f4_arg1 )
	local f4_local0 = #f4_arg0.m_pool
	f4_arg0.m_pool[f4_local0 + 1] = f4_arg1
	f4_arg0.m_pool[f4_local0 + 1].m_allocated = false
end

LUI.LUIElementAllocator.new = function ()
	return {
		m_pool = {},
		alloc = LUI.LUIElementAllocator.alloc,
		free = LUI.LUIElementAllocator.free,
		freeAll = LUI.LUIElementAllocator.freeAll,
		addToPool = LUI.LUIElementAllocator.addToPool
	}
end

