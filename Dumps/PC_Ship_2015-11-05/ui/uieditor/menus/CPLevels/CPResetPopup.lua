require( "ui.uieditor.widgets.Footer.fe_footerRighSlideIn" )
require( "ui.uieditor.widgets.GameSettings.GameSettings_OptionsButton" )

local PreLoadFunc = function ( self, controller )
	self.animateInFromOffset = 340
end

LUI.createMenu.CPResetPopup = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CPResetPopup" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CPResetPopup.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Blackfade = LUI.UIImage.new()
	Blackfade:setLeftRight( true, true, -231, 0 )
	Blackfade:setTopBottom( true, false, 0, 720 )
	Blackfade:setRGB( 0, 0, 0 )
	Blackfade:setAlpha( 0.35 )
	self:addElement( Blackfade )
	self.Blackfade = Blackfade
	
	local leftBackground = LUI.UIImage.new()
	leftBackground:setLeftRight( false, true, -355, 0 )
	leftBackground:setTopBottom( true, true, 0, 0 )
	leftBackground:setRGB( 0.04, 0.04, 0.04 )
	leftBackground:setAlpha( 0.9 )
	self:addElement( leftBackground )
	self.leftBackground = leftBackground
	
	local leftLineStripe = LUI.UIImage.new()
	leftLineStripe:setLeftRight( false, true, -355, -354 )
	leftLineStripe:setTopBottom( true, true, 0, 0 )
	leftLineStripe:setAlpha( 0.43 )
	self:addElement( leftLineStripe )
	self.leftLineStripe = leftLineStripe
	
	local description = LUI.UIText.new()
	description:setLeftRight( true, false, 962.5, 1216 )
	description:setTopBottom( true, false, 250.5, 270.5 )
	description:setText( Engine.Localize( "MENU_NEW_GAME_DESC" ) )
	description:setTTF( "fonts/default.ttf" )
	description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( description )
	self.description = description
	
	local customClassNameTitile = LUI.UIText.new()
	customClassNameTitile:setLeftRight( true, false, 962.5, 1185 )
	customClassNameTitile:setTopBottom( true, false, 128, 162 )
	customClassNameTitile:setRGB( 1, 0.41, 0 )
	customClassNameTitile:setText( Engine.Localize( "MENU_MISSION_OPTIONS" ) )
	customClassNameTitile:setTTF( "fonts/escom.ttf" )
	customClassNameTitile:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	customClassNameTitile:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( customClassNameTitile )
	self.customClassNameTitile = customClassNameTitile
	
	local fefooterRighSlideIn = CoD.fe_footerRighSlideIn.new( self, controller )
	fefooterRighSlideIn:setLeftRight( false, true, -447, -15 )
	fefooterRighSlideIn:setTopBottom( false, true, -32, 0 )
	fefooterRighSlideIn:registerEventHandler( "menu_loaded", function ( element, event )
		local f3_local0 = nil
		SizeToSafeArea( element, controller )
		if not f3_local0 then
			f3_local0 = element:dispatchEventToChildren( event )
		end
		return f3_local0
	end )
	self:addElement( fefooterRighSlideIn )
	self.fefooterRighSlideIn = fefooterRighSlideIn
	
	local ResetCPButton = CoD.GameSettings_OptionsButton.new( self, controller )
	ResetCPButton:setLeftRight( true, false, 962.5, 1205.5 )
	ResetCPButton:setTopBottom( true, false, 183.79, 219.79 )
	ResetCPButton.icon:setImage( RegisterImage( "uie_t7_icon_menu_revertsetting" ) )
	ResetCPButton.optionText:setText( Engine.Localize( "MENU_NEW_GAME" ) )
	ResetCPButton:registerEventHandler( "gain_focus", function ( element, event )
		local f4_local0 = nil
		if element.gainFocus then
			f4_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f4_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f4_local0
	end )
	ResetCPButton:registerEventHandler( "lose_focus", function ( element, event )
		local f5_local0 = nil
		if element.loseFocus then
			f5_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f5_local0 = element.super:loseFocus( event )
		end
		return f5_local0
	end )
	self:AddButtonCallbackFunction( ResetCPButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ResetCampaign( self, controller, menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return false
	end, false )
	self:addElement( ResetCPButton )
	self.ResetCPButton = ResetCPButton
	
	self:mergeStateConditions( {
		{
			stateName = "Campaign",
			condition = function ( menu, element, event )
				return IsCampaign()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		self:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	fefooterRighSlideIn.buttons:setModel( self.buttonModel, controller )
	ResetCPButton.id = "ResetCPButton"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.ResetCPButton:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.fefooterRighSlideIn:close()
		element.ResetCPButton:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CPResetPopup.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

