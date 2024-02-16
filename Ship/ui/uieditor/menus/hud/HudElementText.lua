-- b8a02c8dc335a8aab7a5eb53846d09dd
-- This hash is used for caching, delete to decompile the file again

local f0_local0 = function ( f1_arg0 )
	if f1_arg0.x and f1_arg0.y and f1_arg0.width and f1_arg0.height then
		f1_arg0.Text:setLeftRight( true, false, f1_arg0.x, f1_arg0.x + f1_arg0.width )
		f1_arg0.Text:setTopBottom( true, false, f1_arg0.y, f1_arg0.y + f1_arg0.height )
	end
end

local f0_local1 = function ( f2_arg0 )
	if f2_arg0.alpha then
		f2_arg0.Text:setAlpha( f2_arg0.alpha )
	end
end

local f0_local2 = function ( f3_arg0 )
	if f3_arg0.text then
		f3_arg0.Text:setText( f3_arg0.text )
	end
end

local f0_local3 = function ( f4_arg0 )
	if f4_arg0.alignment then
		f4_arg0.Text:setAlignment( f4_arg0.alignment )
	end
end

local f0_local4 = function ( f5_arg0 )
	if f5_arg0.red and f5_arg0.green and f5_arg0.blue then
		f5_arg0:setRGB( f5_arg0.red, f5_arg0.green, f5_arg0.blue )
	end
end

local PostLoadFunc = function ( f6_arg0 )
	f6_arg0.width = 100
	f6_arg0.height = 25
	local f6_local0 = f6_arg0:getModel( Engine.GetPrimaryController(), "x" )
	local f6_local1 = f6_arg0:getModel( Engine.GetPrimaryController(), "y" )
	local f6_local2 = f6_arg0:getModel( Engine.GetPrimaryController(), "width" )
	local f6_local3 = f6_arg0:getModel( Engine.GetPrimaryController(), "height" )
	local f6_local4 = f6_arg0:getModel( Engine.GetPrimaryController(), "alpha" )
	local f6_local5 = f6_arg0:getModel( Engine.GetPrimaryController(), "text" )
	local f6_local6 = f6_arg0:getModel( Engine.GetPrimaryController(), "alignment" )
	local f6_local7 = f6_arg0:getModel( Engine.GetPrimaryController(), "fadeOverTime" )
	local f6_local8 = f6_arg0:getModel( Engine.GetPrimaryController(), "red" )
	local f6_local9 = f6_arg0:getModel( Engine.GetPrimaryController(), "green" )
	local f6_local10 = f6_arg0:getModel( Engine.GetPrimaryController(), "blue" )
	f6_arg0.red = 1
	f6_arg0.green = 1
	f6_arg0.blue = 1
	if f6_local0 then
		f6_arg0:subscribeToModel( f6_local0, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				f6_arg0.x = modelValue
				f0_local0( f6_arg0 )
			end
		end )
	end
	if f6_local1 then
		f6_arg0:subscribeToModel( f6_local1, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				f6_arg0.y = modelValue
				f0_local0( f6_arg0 )
			end
		end )
	end
	if f6_local2 then
		f6_arg0:subscribeToModel( f6_local2, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				f6_arg0.width = modelValue
				f0_local0( f6_arg0 )
			end
		end )
	end
	if f6_local3 then
		f6_arg0:subscribeToModel( f6_local3, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				f6_arg0.height = modelValue
				f0_local0( f6_arg0 )
			end
		end )
	end
	if f6_local4 then
		f6_arg0:subscribeToModel( f6_local4, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				f6_arg0.alpha = modelValue
				f0_local1( f6_arg0 )
			end
		end )
	end
	if f6_local5 then
		f6_arg0:subscribeToModel( f6_local5, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				f6_arg0.text = modelValue
				f0_local2( f6_arg0 )
			end
		end )
	end
	if f6_local6 then
		f6_arg0:subscribeToModel( f6_local6, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				f6_arg0.alignment = modelValue
				f0_local3( f6_arg0 )
			end
		end )
	end
	if f6_local7 then
		f6_arg0:subscribeToModel( f6_local7, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue and tonumber( modelValue ) then
				f6_arg0.Text:setAlpha( 0 )
				f6_arg0.Text:beginAnimation( "fadeOverTime", modelValue )
				f6_arg0.Text:setAlpha( 1 )
			end
		end )
	end
	if f6_local8 then
		f6_arg0:subscribeToModel( f6_local8, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				f6_arg0.red = modelValue
				f0_local4( f6_arg0 )
			end
		end )
	end
	if f6_local9 then
		f6_arg0:subscribeToModel( f6_local9, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				f6_arg0.green = modelValue
				f0_local4( f6_arg0 )
			end
		end )
	end
	if f6_local10 then
		f6_arg0:subscribeToModel( f6_local10, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				f6_arg0.blue = modelValue
				f0_local4( f6_arg0 )
			end
		end )
	end
end

LUI.createMenu.HudElementText = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "HudElementText" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "HudElementText.buttonPrompts" )
	local f18_local1 = self
	
	local Text = LUI.UIText.new()
	Text:setLeftRight( true, false, 294.14, 794.14 )
	Text:setTopBottom( true, false, 96, 121 )
	Text:setText( Engine.Localize( "" ) )
	Text:setTTF( "fonts/default.ttf" )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Text )
	self.Text = Text
	
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f18_local1
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "HudElementText.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

