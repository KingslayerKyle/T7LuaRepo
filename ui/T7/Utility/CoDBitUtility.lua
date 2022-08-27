-- a99641b59b0d4223f3e42c4232e1ce39
-- This hash is used for caching, delete to decompile the file again

CoD.BitUtility = {}
CoD.BitUtility.IsBitSet = function ( f1_arg0, f1_arg1 )
	return f1_arg0 & 1 << f1_arg1 > 0
end

CoD.BitUtility.IsBitwiseAndNonZero = function ( f2_arg0, f2_arg1 )
	return f2_arg0 & f2_arg1 ~= 0
end

CoD.BitUtility.AreAllBitsSet = function ( f3_arg0, f3_arg1 )
	for f3_local3, f3_local4 in ipairs( f3_arg1 ) do
		if not CoD.BitUtility.IsBitSet( f3_arg0, f3_local4 ) then
			return false
		end
	end
	return true
end

CoD.BitUtility.IsAnyBitSet = function ( f4_arg0, f4_arg1 )
	for f4_local3, f4_local4 in ipairs( f4_arg1 ) do
		if CoD.BitUtility.IsBitSet( f4_arg0, f4_local4 ) then
			return true
		end
	end
	return false
end

