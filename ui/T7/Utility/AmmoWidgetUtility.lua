-- 51c3d8c24f7b7177bfb30ea59b588b6e
-- This hash is used for caching, delete to decompile the file again

CoD.AmmoWidgetUtility = {}
CoD.AmmoWidgetUtility.InitTacticalEmptyPulse = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4 )
	local f1_local0 = Engine.GetModelForController( f1_arg2 )
	f1_arg1.previousPulseValue = 0
	f1_arg1:subscribeToModel( Engine.GetModel( f1_local0, "hudItems.pulseNoTactical" ), function ( model )
		local modelValue = Engine.GetModelValue( model )
		if f1_arg1.previousPulseValue == modelValue then
			return 
		else
			f1_arg1.previousPulseValue = modelValue
			if not PulseNoTactical( f1_arg2 ) then
				return 
			elseif Engine.GetModelValue( Engine.GetModel( f1_local0, "currentSecondaryOffhand.secondaryOffhand" ) ) == nil then
				return 
			else
				local f2_local1 = f1_arg3.new( f1_arg4, f1_arg2 )
				f2_local1:setLeftRight( f1_arg1:getLocalLeftRight() )
				f2_local1:setTopBottom( f1_arg1:getLocalTopBottom() )
				f2_local1:subscribeToGlobalModel( f1_arg2, "CurrentSecondaryOffhand", "secondaryOffhand", function ( model )
					local modelValue = Engine.GetModelValue( model )
					if modelValue then
						f2_local1.ImgIcon:setImage( RegisterImage( modelValue ) )
						f2_local1.ImgIconGrow:setImage( RegisterImage( modelValue ) )
					end
				end )
				f2_local1:registerEventHandler( "clip_over", function ( element, event )
					element:close()
				end )
				f2_local1:setState( "Empty" )
				f1_arg0:addElement( f2_local1 )
			end
		end
	end )
end

CoD.AmmoWidgetUtility.InitLethalEmptyPulse = function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3, f5_arg4 )
	local f5_local0 = Engine.GetModelForController( f5_arg2 )
	f5_arg1.previousPulseValue = 0
	f5_arg1:subscribeToModel( Engine.GetModel( f5_local0, "hudItems.pulseNoLethal" ), function ( model )
		local modelValue = Engine.GetModelValue( model )
		if f5_arg1.previousPulseValue == modelValue then
			return 
		else
			f5_arg1.previousPulseValue = modelValue
			if not PulseNoLethal( f5_arg2 ) then
				return 
			elseif Engine.GetModelValue( Engine.GetModel( f5_local0, "currentPrimaryOffhand.primaryOffhand" ) ) == nil then
				return 
			else
				local f6_local1 = f5_arg3.new( f5_arg4, f5_arg2 )
				f6_local1:setLeftRight( f5_arg1:getLocalLeftRight() )
				f6_local1:setTopBottom( f5_arg1:getLocalTopBottom() )
				f6_local1:subscribeToGlobalModel( f5_arg2, "CurrentPrimaryOffhand", "primaryOffhand", function ( model )
					local modelValue = Engine.GetModelValue( model )
					if modelValue then
						f6_local1.ImgIcon:setImage( RegisterImage( modelValue ) )
						f6_local1.ImgIconGrow:setImage( RegisterImage( modelValue ) )
					end
				end )
				f6_local1:registerEventHandler( "clip_over", function ( element, event )
					element:close()
				end )
				f6_local1:setState( "Empty" )
				f5_arg0:addElement( f6_local1 )
			end
		end
	end )
end

