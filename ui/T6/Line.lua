-- 89bc4da04d21e54abe2294f1e99541e9
-- This hash is used for caching, delete to decompile the file again

CoD.Line = {}
CoD.Line.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3 )
	local f1_local0 = 1
	local f1_local1 = {}
	local f1_local2 = {}
	if f1_arg3 == nil then
		f1_arg3 = {
			1,
			1,
			1,
			1
		}
	end
	for f1_local3 = 1, 2, 1 do
		if f1_arg0[f1_local3] < f1_arg1[f1_local3] then
			f1_local1[f1_local3] = f1_arg0[f1_local3]
			f1_local2[f1_local3] = f1_arg1[f1_local3] - f1_arg0[f1_local3]
		else
			f1_local1[f1_local3] = f1_arg1[f1_local3]
			f1_local2[f1_local3] = f1_arg0[f1_local3] - f1_arg1[f1_local3]
		end
		f1_local1[f1_local3] = f1_local1[f1_local3] - f1_arg2
		f1_local2[f1_local3] = f1_local2[f1_local3] + f1_arg2 * 2
	end
	return LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = f1_local1[1],
		right = f1_local1[1] + f1_local2[1],
		topAnchor = true,
		bottomAnchor = false,
		top = f1_local1[2],
		bottom = f1_local1[2] + f1_local2[2],
		red = f1_arg3[1],
		green = f1_arg3[2],
		blue = f1_arg3[3],
		alpha = f1_arg3[4],
		material = RegisterMaterial( "ui_line" ),
		shaderVector0 = {
			f1_local2[1],
			f1_local2[2],
			f1_arg2,
			f1_local0
		},
		shaderVector1 = {
			f1_arg0[1] - f1_local1[1],
			f1_arg0[2] - f1_local1[2],
			f1_arg1[1] - f1_local1[1],
			f1_arg1[2] - f1_local1[2]
		}
	} )
end

