LUI.LUIElementAllocator = {}
LUI.LUIElementAllocator.alloc = function ( allocator )
	if allocator ~= nil and allocator.m_pool ~= nil then
		for i = 1, #allocator.m_pool, 1 do
			if allocator.m_pool[i].m_allocated == false then
				allocator.m_pool[i].m_allocated = true
				return allocator.m_pool[i]
			end
		end
	end
	error( "LUI Element Allocator: No more free elements in the pool. Allocation failed." )
	return nil
end

LUI.LUIElementAllocator.free = function ( allocator, element )
	if allocator ~= nil and allocator.m_pool ~= nil then
		for i = 1, #allocator.m_pool, 1 do
			if allocator.m_pool[i] == element then
				allocator.m_pool[i].m_allocated = false
				element = nil
				return 
			end
		end
	end
	error( "LUI Element Allocator: Tried to free an element that does not exist in the pool." )
end

LUI.LUIElementAllocator.freeAll = function ( allocator )
	if allocator ~= nil and allocator.m_pool ~= nil then
		for i = 1, #allocator.m_pool, 1 do
			allocator.m_pool[i].m_allocated = false
		end
	end
end

LUI.LUIElementAllocator.addToPool = function ( allocator, element )
	local elementCount = #allocator.m_pool
	allocator.m_pool[elementCount + 1] = element
	allocator.m_pool[elementCount + 1].m_allocated = false
end

LUI.LUIElementAllocator.new = function ()
	local allocator = {
		m_pool = {},
		alloc = LUI.LUIElementAllocator.alloc,
		free = LUI.LUIElementAllocator.free,
		freeAll = LUI.LUIElementAllocator.freeAll,
		addToPool = LUI.LUIElementAllocator.addToPool
	}
	return allocator
end

