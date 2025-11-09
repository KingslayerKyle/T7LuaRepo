LUI.createMenu.raid_upgrades = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "raid_upgrades" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	local menu = self
	
	local SpendText = LUI.UIText.new()
	SpendText:setLeftRight( true, false, 409, 899 )
	SpendText:setTopBottom( true, false, 434.5, 459.5 )
	SpendText:setRGB( 1, 1, 1 )
	SpendText:setText( Engine.Localize( "COOP_UPGRADE_SPEND" ) )
	SpendText:setTTF( "fonts/default.ttf" )
	SpendText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	SpendText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SpendText )
	self.SpendText = SpendText
	
	local CancelText = LUI.UIText.new()
	CancelText:setLeftRight( true, false, 379, 869 )
	CancelText:setTopBottom( true, false, 434.5, 459.5 )
	CancelText:setRGB( 1, 1, 1 )
	CancelText:setText( Engine.Localize( "COOP_UPGRADE_CANCEL" ) )
	CancelText:setTTF( "fonts/default.ttf" )
	CancelText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	CancelText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( CancelText )
	self.CancelText = CancelText
	
	local TokensAvailableText = LUI.UIText.new()
	TokensAvailableText:setLeftRight( true, false, 409, 869 )
	TokensAvailableText:setTopBottom( true, false, 404.5, 434.5 )
	TokensAvailableText:setRGB( 1, 1, 1 )
	TokensAvailableText:setText( Engine.Localize( "COOP_UPGRADE_TOKENS_AVAILABLE" ) )
	TokensAvailableText:setTTF( "fonts/default.ttf" )
	TokensAvailableText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TokensAvailableText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TokensAvailableText )
	self.TokensAvailableText = TokensAvailableText
	
	local TokensRequiredLabel = LUI.UITightText.new()
	TokensRequiredLabel:setLeftRight( true, false, 449.25, 777.25 )
	TokensRequiredLabel:setTopBottom( true, false, 274, 304 )
	TokensRequiredLabel:setRGB( 1, 1, 1 )
	TokensRequiredLabel:setText( Engine.Localize( "COOP_UPGRADE_TOKENS_REQUIRED" ) )
	TokensRequiredLabel:setTTF( "fonts/default.ttf" )
	self:addElement( TokensRequiredLabel )
	self.TokensRequiredLabel = TokensRequiredLabel
	
	local UpgradeImage = LUI.UIImage.new()
	UpgradeImage:setLeftRight( true, false, 707, 820 )
	UpgradeImage:setTopBottom( true, false, 274, 393 )
	UpgradeImage:setRGB( 1, 1, 1 )
	UpgradeImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( UpgradeImage )
	self.UpgradeImage = UpgradeImage
	
	local UpgradeDescriptionText = LUI.UIText.new()
	UpgradeDescriptionText:setLeftRight( true, false, 461.5, 681.5 )
	UpgradeDescriptionText:setTopBottom( true, false, 308.5, 327.97 )
	UpgradeDescriptionText:setRGB( 1, 1, 1 )
	UpgradeDescriptionText:setText( Engine.Localize( "MENU_DESCRIPTION" ) )
	UpgradeDescriptionText:setTTF( "fonts/default.ttf" )
	UpgradeDescriptionText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	UpgradeDescriptionText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( UpgradeDescriptionText )
	self.UpgradeDescriptionText = UpgradeDescriptionText
	
	local UpgradeTitleText = LUI.UIText.new()
	UpgradeTitleText:setLeftRight( true, false, 409, 869 )
	UpgradeTitleText:setTopBottom( true, false, 216, 264 )
	UpgradeTitleText:setRGB( 1, 1, 1 )
	UpgradeTitleText:setText( Engine.Localize( "COOP_UPGRADE_TITLE" ) )
	UpgradeTitleText:setTTF( "fonts/default.ttf" )
	UpgradeTitleText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	UpgradeTitleText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( UpgradeTitleText )
	self.UpgradeTitleText = UpgradeTitleText
	
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		return true
	end
	
	self.buttonPromptAddFunctions.alt1 = function ( menu, element, event )
		return true
	end
	
	self:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESC") then
			SetResponseNo( self, controller )
		end
		if not self.occludedBy and (event.button == "alt1" or event.button == "key_shortcut" and event.key == "F") then
			SetResponseYes( self, controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = menu
	} )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

