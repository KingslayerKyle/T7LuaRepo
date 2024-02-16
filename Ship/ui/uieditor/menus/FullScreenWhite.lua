-- 4f717b69dc548ea99b9fdfaa578b2023
-- This hash is used for caching, delete to decompile the file again

local PostLoadFunc = function ( f1_arg0 )
	local f1_local0 = f1_arg0:getModel( Engine.GetPrimaryController(), "fadeOverTime" )
	if f1_local0 then
		f1_arg0:subscribeToModel( f1_local0, function ( model )
			local modelValue = Engine.GetModelValue( model )
			local f2_local1 = f1_arg0:getModel( Engine.GetPrimaryController(), "startAlpha" )
			local f2_local2 = f1_arg0:getModel( Engine.GetPrimaryController(), "endAlpha" )
			local f2_local3 = 0
			local f2_local4 = 0
			if f2_local1 then
				f2_local3 = Engine.GetModelValue( f2_local1 )
			end
			if f2_local2 then
				f2_local4 = Engine.GetModelValue( f2_local2 )
			end
			if modelValue then
				if f2_local4 == 0 then
					CoD.Menu.RemoveFromCurrMenuNameList( f1_arg0.menuName )
				else
					CoD.Menu.AddToCurrMenuNameList( f1_arg0.menuName )
				end
				if f2_local3 >= 0 then
					f1_arg0.Fullscreen:setAlpha( f2_local3 )
				end
				f1_arg0.Fullscreen:beginAnimation( "fadeOverTime", modelValue )
				f1_arg0.Fullscreen:setAlpha( f2_local4 )
			end
		end )
	end
end

LUI.createMenu.FullScreenWhite = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "FullScreenWhite" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "none"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "FullScreenWhite.buttonPrompts" )
	local f3_local1 = self
	
	local Fullscreen = LUI.UIImage.new()
	Fullscreen:setLeftRight( true, false, 0, 1280 )
	Fullscreen:setTopBottom( true, false, 0, 720 )
	Fullscreen:setImage( RegisterImage( "uie_default_white_255" ) )
	self:addElement( Fullscreen )
	self.Fullscreen = Fullscreen
	
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f3_local1
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "FullScreenWhite.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

