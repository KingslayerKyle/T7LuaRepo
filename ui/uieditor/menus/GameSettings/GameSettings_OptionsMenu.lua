-- 23a24ae9ead2812a4aa449e9a317f685
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.GameSettings.GameSettings_OptionsContainer" )
require( "ui.uieditor.widgets.Footer.fe_footerRighSlideIn" )

local PreLoadFunc = function ( self, controller )
	self.animateInFromOffset = 340
end

LUI.createMenu.GameSettings_OptionsMenu = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "GameSettings_OptionsMenu" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GameSettings_OptionsMenu.buttonPrompts" )
	local f2_local1 = self
	self.anyChildUsesUpdateState = true
	
	local Blackfade = LUI.UIImage.new()
	Blackfade:setLeftRight( true, true, -262, 11 )
	Blackfade:setTopBottom( true, false, 0, 720 )
	Blackfade:setRGB( 0, 0, 0 )
	Blackfade:setAlpha( 0.35 )
	self:addElement( Blackfade )
	self.Blackfade = Blackfade
	
	local leftBackground = LUI.UIImage.new()
	leftBackground:setLeftRight( false, true, -355, 0 )
	leftBackground:setTopBottom( true, true, 0, 0 )
	leftBackground:setRGB( 0.04, 0.04, 0.04 )
	leftBackground:setAlpha( 0.98 )
	self:addElement( leftBackground )
	self.leftBackground = leftBackground
	
	local GameSettingsOptionsContainer0 = CoD.GameSettings_OptionsContainer.new( f2_local1, controller )
	GameSettingsOptionsContainer0:setLeftRight( false, true, -363, 0 )
	GameSettingsOptionsContainer0:setTopBottom( true, false, 0, 720 )
	GameSettingsOptionsContainer0:registerEventHandler( "gain_focus", function ( element, event )
		local f3_local0 = nil
		if element.gainFocus then
			f3_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f3_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f2_local1, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
		return f3_local0
	end )
	GameSettingsOptionsContainer0:registerEventHandler( "lose_focus", function ( element, event )
		local f4_local0 = nil
		if element.loseFocus then
			f4_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f4_local0 = element.super:loseFocus( event )
		end
		return f4_local0
	end )
	f2_local1:AddButtonCallbackFunction( GameSettingsOptionsContainer0, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
		GoBack( self, f5_arg2 )
		return true
	end, function ( f6_arg0, f6_arg1, f6_arg2 )
		CoD.Menu.SetButtonLabel( f6_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:addElement( GameSettingsOptionsContainer0 )
	self.GameSettingsOptionsContainer0 = GameSettingsOptionsContainer0
	
	local tileTexture = LUI.UIImage.new()
	tileTexture:setLeftRight( false, true, -355, 3 )
	tileTexture:setTopBottom( true, true, 0, 0 )
	tileTexture:setAlpha( 0.5 )
	tileTexture:setImage( RegisterImage( "uie_t7_tile_texture" ) )
	tileTexture:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	tileTexture:setShaderVector( 0, 30, 55, 0, 0 )
	tileTexture:setShaderVector( 1, 0, 0, 0, 0 )
	self:addElement( tileTexture )
	self.tileTexture = tileTexture
	
	local fefooterRighSlideIn = CoD.fe_footerRighSlideIn.new( f2_local1, controller )
	fefooterRighSlideIn:setLeftRight( false, true, -464, -32 )
	fefooterRighSlideIn:setTopBottom( false, true, -75, -43 )
	self:addElement( fefooterRighSlideIn )
	self.fefooterRighSlideIn = fefooterRighSlideIn
	
	f2_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "O", function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
		GoBack( self, f7_arg2 )
		return true
	end, function ( f8_arg0, f8_arg1, f8_arg2 )
		CoD.Menu.SetButtonLabel( f8_arg1, Enum.LUIButton.LUI_KEY_START, "" )
		return false
	end, false )
	GameSettingsOptionsContainer0.id = "GameSettingsOptionsContainer0"
	fefooterRighSlideIn.buttons:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f2_local1
	} )
	if not self:restoreState() then
		self.GameSettingsOptionsContainer0:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GameSettingsOptionsContainer0:close()
		element.fefooterRighSlideIn:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "GameSettings_OptionsMenu.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

