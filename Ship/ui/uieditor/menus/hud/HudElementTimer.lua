-- 406cd2f1f57cd992f41ccbdc4235faf2
-- This hash is used for caching, delete to decompile the file again

local f0_local0 = function ( f1_arg0 )
	f1_arg0.Timer:setupEndTimer( f1_arg0.time )
end

local f0_local1 = function ( f2_arg0 )
	if f2_arg0.x and f2_arg0.y and f2_arg0.height then
		f2_arg0.Timer:setLeftRight( true, false, f2_arg0.x, f2_arg0.x + 100 )
		f2_arg0.Timer:setTopBottom( true, false, f2_arg0.y, f2_arg0.y + f2_arg0.height )
	end
end

local f0_local2 = function ( f3_arg0 )
	if f3_arg0.red and f3_arg0.green and f3_arg0.blue then
		f3_arg0:setRGB( f3_arg0.red, f3_arg0.green, f3_arg0.blue )
	end
end

local PostLoadFunc = function ( f4_arg0 )
	local f4_local0 = f4_arg0:getModel( Engine.GetPrimaryController(), "x" )
	local f4_local1 = f4_arg0:getModel( Engine.GetPrimaryController(), "y" )
	local f4_local2 = f4_arg0:getModel( Engine.GetPrimaryController(), "height" )
	local f4_local3 = f4_arg0:getModel( Engine.GetPrimaryController(), "time" )
	local f4_local4 = f4_arg0:getModel( Engine.GetPrimaryController(), "red" )
	local f4_local5 = f4_arg0:getModel( Engine.GetPrimaryController(), "green" )
	local f4_local6 = f4_arg0:getModel( Engine.GetPrimaryController(), "blue" )
	f4_arg0.red = 1
	f4_arg0.green = 1
	f4_arg0.blue = 1
	if f4_local0 then
		f4_arg0:subscribeToModel( f4_local0, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				f4_arg0.x = modelValue
				f0_local1( f4_arg0 )
			end
		end )
	end
	if f4_local1 then
		f4_arg0:subscribeToModel( f4_local1, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				f4_arg0.y = modelValue
				f0_local1( f4_arg0 )
			end
		end )
	end
	if f4_local2 then
		f4_arg0:subscribeToModel( f4_local2, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				f4_arg0.height = modelValue
				f0_local1( f4_arg0 )
			end
		end )
	end
	if f4_local3 then
		f4_arg0:subscribeToModel( f4_local3, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				f4_arg0.time = modelValue
				f0_local0( f4_arg0 )
			end
		end )
	end
	if f4_local4 then
		f4_arg0:subscribeToModel( f4_local4, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				f4_arg0.red = modelValue
				f0_local2( f4_arg0 )
			end
		end )
	end
	if f4_local5 then
		f4_arg0:subscribeToModel( f4_local5, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				f4_arg0.green = modelValue
				f0_local2( f4_arg0 )
			end
		end )
	end
	if f4_local6 then
		f4_arg0:subscribeToModel( f4_local6, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				f4_arg0.blue = modelValue
				f0_local2( f4_arg0 )
			end
		end )
	end
end

LUI.createMenu.HudElementTimer = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "HudElementTimer" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "HudElementTimer.buttonPrompts" )
	local f12_local1 = self
	
	local Timer = LUI.UITightText.new()
	Timer:setLeftRight( true, false, 317.45, 371.45 )
	Timer:setTopBottom( true, false, 324.11, 349.11 )
	Timer:setTTF( "fonts/default.ttf" )
	self:addElement( Timer )
	self.Timer = Timer
	
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f12_local1
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "HudElementTimer.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

