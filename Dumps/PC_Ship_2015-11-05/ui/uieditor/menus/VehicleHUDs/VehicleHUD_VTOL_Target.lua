require( "ui.uieditor.widgets.VehicleHUDs.VTOL.vtolTarget" )

local f0_local0 = function ( f1_arg0 )
	if f1_arg0.targetX and f1_arg0.targetY and f1_arg0.targetWidth and f1_arg0.targetHeight then
		f1_arg0.vtolTarget:setLeftRight( true, false, f1_arg0.targetX - f1_arg0.targetWidth * 0.5, f1_arg0.targetX + f1_arg0.targetWidth * 0.5 )
		f1_arg0.vtolTarget:setTopBottom( true, false, f1_arg0.targetY - f1_arg0.targetHeight * 0.5, f1_arg0.targetY + f1_arg0.targetHeight * 0.5 )
	end
end

local f0_local1 = function ( f2_arg0 )
	if f2_arg0.missileLockTargetX and f2_arg0.missileLockTargetY and f2_arg0.missileLockTargetWidth and f2_arg0.missileLockTargetHeight then
		if f2_arg0.missileLockTargetLerpTime and f2_arg0.missileLockTargetLerpTime > 0 then
			f2_arg0.MissileLockTarget:beginAnimation( "position", f2_arg0.missileLockTargetLerpTime )
		end
		f2_arg0.MissileLockTarget:setLeftRight( true, false, f2_arg0.missileLockTargetX - f2_arg0.missileLockTargetWidth * 0.5, f2_arg0.missileLockTargetX + f2_arg0.missileLockTargetWidth * 0.5 )
		f2_arg0.MissileLockTarget:setTopBottom( true, false, f2_arg0.missileLockTargetY - f2_arg0.missileLockTargetHeight * 0.5, f2_arg0.missileLockTargetY + f2_arg0.missileLockTargetHeight * 0.5 )
	end
end

local PostLoadFunc = function ( f3_arg0 )
	local f3_local0 = f3_arg0:getModel( Engine.GetPrimaryController(), "newTarget" )
	local f3_local1 = f3_arg0:getModel( Engine.GetPrimaryController(), "targetX" )
	local f3_local2 = f3_arg0:getModel( Engine.GetPrimaryController(), "targetY" )
	local f3_local3 = f3_arg0:getModel( Engine.GetPrimaryController(), "targetWidth" )
	local f3_local4 = f3_arg0:getModel( Engine.GetPrimaryController(), "targetHeight" )
	f3_arg0.newTargetModel = 0
	if f3_local0 then
		f3_arg0:subscribeToModel( f3_local0, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue and f3_arg0.newTargetModel ~= modelValue then
				f3_arg0.newTargetModel = modelValue
				if f3_arg0.newTargetModel == 1 then
					f3_arg0.vtolTarget:playClip( "NewTarget" )
				else
					f3_arg0.vtolTarget:playClip( "LostTarget" )
				end
			end
		end )
	end
	if f3_local1 then
		f3_arg0:subscribeToModel( f3_local1, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				f3_arg0.targetX = modelValue
				f0_local0( f3_arg0 )
			end
		end )
	end
	if f3_local2 then
		f3_arg0:subscribeToModel( f3_local2, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				f3_arg0.targetY = modelValue
				f0_local0( f3_arg0 )
			end
		end )
	end
	if f3_local3 then
		f3_arg0:subscribeToModel( f3_local3, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				f3_arg0.targetWidth = modelValue
				f0_local0( f3_arg0 )
			end
		end )
	end
	if f3_local4 then
		f3_arg0:subscribeToModel( f3_local4, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				f3_arg0.targetHeight = modelValue
				f0_local0( f3_arg0 )
			end
		end )
	end
	local f3_local5 = f3_arg0:getModel( Engine.GetPrimaryController(), "missileLockTargetAlpha" )
	local f3_local6 = f3_arg0:getModel( Engine.GetPrimaryController(), "missileLockTargetScale" )
	local f3_local7 = f3_arg0:getModel( Engine.GetPrimaryController(), "missileLockTargetRotZ" )
	local f3_local8 = f3_arg0:getModel( Engine.GetPrimaryController(), "missileLockTargetX" )
	local f3_local9 = f3_arg0:getModel( Engine.GetPrimaryController(), "missileLockTargetY" )
	local f3_local10 = f3_arg0:getModel( Engine.GetPrimaryController(), "missileLockTargetWidth" )
	local f3_local11 = f3_arg0:getModel( Engine.GetPrimaryController(), "missileLockTargetHeight" )
	local f3_local12 = f3_arg0:getModel( Engine.GetPrimaryController(), "missileLockTargetLerpTime" )
	local f3_local13 = f3_arg0:getModel( Engine.GetPrimaryController(), "missileLockTargetMaterial" )
	local f3_local14 = f3_arg0:getModel( Engine.GetPrimaryController(), "missileLockTargetRed" )
	local f3_local15 = f3_arg0:getModel( Engine.GetPrimaryController(), "missileLockTargetGreen" )
	local f3_local16 = f3_arg0:getModel( Engine.GetPrimaryController(), "missileLockTargetBlue" )
	f3_arg0.missileLockTargetRed = 1
	f3_arg0.missileLockTargetGreen = 1
	f3_arg0.missileLockTargetBlue = 1
	f3_arg0.missileLockLerpTime = 50
	if f3_local5 then
		f3_arg0:subscribeToModel( f3_local5, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				f3_arg0.MissileLockTarget:setAlpha( modelValue )
			end
		end )
	end
	if f3_local6 then
		f3_arg0:subscribeToModel( f3_local6, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				f3_arg0.MissileLockTarget:setScale( modelValue )
			end
		end )
	end
	if f3_local7 then
		f3_arg0:subscribeToModel( f3_local7, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				f3_arg0.MissileLockTarget:setZRot( modelValue )
			end
		end )
	end
	if f3_local8 then
		f3_arg0:subscribeToModel( f3_local8, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				f3_arg0.missileLockTargetX = modelValue
			end
		end )
	end
	if f3_local9 then
		f3_arg0:subscribeToModel( f3_local9, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				f3_arg0.missileLockTargetY = modelValue
				f0_local1( f3_arg0 )
			end
		end )
	end
	if f3_local10 then
		f3_arg0:subscribeToModel( f3_local10, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				f3_arg0.missileLockTargetWidth = modelValue
			end
		end )
	end
	if f3_local11 then
		f3_arg0:subscribeToModel( f3_local11, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				f3_arg0.missileLockTargetHeight = modelValue
			end
		end )
	end
	if f3_local12 then
		f3_arg0:subscribeToModel( f3_local12, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				f3_arg0.missileLockTargetLerpTime = modelValue
			end
		end )
	end
	if f3_local13 then
		f3_arg0:subscribeToModel( f3_local13, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				f3_arg0.MissileLockTarget:setImage( modelValue )
			end
		end )
	end
	if f3_local14 then
		f3_arg0:subscribeToModel( f3_local14, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				f3_arg0.missileLockTargetRed = modelValue
				if f3_arg0.missileLockTargetRed and f3_arg0.missileLockTargetGreen and f3_arg0.missileLockTargetBlue then
					f3_arg0.MissileLockTarget:setRGB( f3_arg0.missileLockTargetRed, f3_arg0.missileLockTargetGreen, f3_arg0.missileLockTargetBlue )
				end
			end
		end )
	end
	if f3_local15 then
		f3_arg0:subscribeToModel( f3_local15, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				f3_arg0.missileLockTargetGreen = modelValue
				if f3_arg0.missileLockTargetRed and f3_arg0.missileLockTargetGreen and f3_arg0.missileLockTargetBlue then
					f3_arg0.MissileLockTarget:setRGB( f3_arg0.missileLockTargetRed, f3_arg0.missileLockTargetGreen, f3_arg0.missileLockTargetBlue )
				end
			end
		end )
	end
	if f3_local16 then
		f3_arg0:subscribeToModel( f3_local16, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				f3_arg0.missileLockTargetBlue = modelValue
				if f3_arg0.missileLockTargetRed and f3_arg0.missileLockTargetGreen and f3_arg0.missileLockTargetBlue then
					f3_arg0.MissileLockTarget:setRGB( f3_arg0.missileLockTargetRed, f3_arg0.missileLockTargetGreen, f3_arg0.missileLockTargetBlue )
				end
			end
		end )
	end
end

LUI.createMenu.VehicleHUD_VTOL_Target = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "VehicleHUD_VTOL_Target" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "VehicleHUD_VTOL_Target.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local vtolTarget = CoD.vtolTarget.new( self, controller )
	vtolTarget:setLeftRight( true, false, 0, 1280 )
	vtolTarget:setTopBottom( true, false, 0, 720 )
	vtolTarget:setScale( 0.75 )
	self:addElement( vtolTarget )
	self.vtolTarget = vtolTarget
	
	local MissileLockTarget = LUI.UIImage.new()
	MissileLockTarget:setLeftRight( true, true, 512, -512 )
	MissileLockTarget:setTopBottom( true, false, 232, 488 )
	MissileLockTarget:setAlpha( 0 )
	MissileLockTarget:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_vtol_lockoncircle" ) )
	self:addElement( MissileLockTarget )
	self.MissileLockTarget = MissileLockTarget
	
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.vtolTarget:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "VehicleHUD_VTOL_Target.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

