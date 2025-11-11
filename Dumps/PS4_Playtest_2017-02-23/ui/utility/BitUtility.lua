CoD.BitUtility = {}
CoD.BitUtility.IsBitSet = function ( value, bit )
	return value & 1 << bit > 0
end

CoD.BitUtility.IsBitwiseAndNonZero = function ( value1, value2 )
	return value1 & value2 ~= 0
end

CoD.BitUtility.AreAllBitsSet = function ( value, bitArray )
	for index, bit in ipairs( bitArray ) do
		if not CoD.BitUtility.IsBitSet( value, bit ) then
			return false
		end
	end
	return true
end

CoD.BitUtility.IsAnyBitSet = function ( value, bitArray )
	for index, bit in ipairs( bitArray ) do
		if CoD.BitUtility.IsBitSet( value, bit ) then
			return true
		end
	end
	return false
end

CoD.BitUtility.ClearBit = function ( value, bit )
	if CoD.BitUtility.IsBitSet( value, bit ) then
		return value - (1 << bit)
	else
		
	end
end

