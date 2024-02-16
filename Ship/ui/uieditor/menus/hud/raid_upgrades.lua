-- f516eee204f124c392be425955dce3a7
-- This hash is used for caching, delete to decompile the file again

LUI.createMenu.raid_upgrades = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "raid_upgrades" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "raid_upgrades.buttonPrompts" )
	local f1_local1 = self
	
	local SpendText = LUI.UIText.new()
	SpendText:setLeftRight( true, false, 409, 899 )
	SpendText:setTopBottom( true, false, 434.5, 459.5 )
	SpendText:setText( Engine.Localize( "COOP_UPGRADE_SPEND" ) )
	SpendText:setTTF( "fonts/default.ttf" )
	SpendText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	SpendText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SpendText )
	self.SpendText = SpendText
	
	local CancelText = LUI.UIText.new()
	CancelText:setLeftRight( true, false, 379, 869 )
	CancelText:setTopBottom( true, false, 434.5, 459.5 )
	CancelText:setText( Engine.Localize( "COOP_UPGRADE_CANCEL" ) )
	CancelText:setTTF( "fonts/default.ttf" )
	CancelText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	CancelText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( CancelText )
	self.CancelText = CancelText
	
	local TokensAvailableText = LUI.UIText.new()
	TokensAvailableText:setLeftRight( true, false, 409, 869 )
	TokensAvailableText:setTopBottom( true, false, 404.5, 434.5 )
	TokensAvailableText:setText( Engine.Localize( "COOP_UPGRADE_TOKENS_AVAILABLE" ) )
	TokensAvailableText:setTTF( "fonts/default.ttf" )
	TokensAvailableText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TokensAvailableText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TokensAvailableText )
	self.TokensAvailableText = TokensAvailableText
	
	local TokensRequiredLabel = LUI.UITightText.new()
	TokensRequiredLabel:setLeftRight( true, false, 449.25, 777.25 )
	TokensRequiredLabel:setTopBottom( true, false, 274, 304 )
	TokensRequiredLabel:setText( Engine.Localize( "COOP_UPGRADE_TOKENS_REQUIRED" ) )
	TokensRequiredLabel:setTTF( "fonts/default.ttf" )
	self:addElement( TokensRequiredLabel )
	self.TokensRequiredLabel = TokensRequiredLabel
	
	local UpgradeImage = LUI.UIImage.new()
	UpgradeImage:setLeftRight( true, false, 707, 820 )
	UpgradeImage:setTopBottom( true, false, 274, 393 )
	self:addElement( UpgradeImage )
	self.UpgradeImage = UpgradeImage
	
	local UpgradeDescriptionText = LUI.UIText.new()
	UpgradeDescriptionText:setLeftRight( true, false, 461.5, 681.5 )
	UpgradeDescriptionText:setTopBottom( true, false, 308.5, 327.97 )
	UpgradeDescriptionText:setText( Engine.Localize( "MENU_DESCRIPTION" ) )
	UpgradeDescriptionText:setTTF( "fonts/default.ttf" )
	UpgradeDescriptionText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	UpgradeDescriptionText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( UpgradeDescriptionText )
	self.UpgradeDescriptionText = UpgradeDescriptionText
	
	local UpgradeTitleText = LUI.UIText.new()
	UpgradeTitleText:setLeftRight( true, false, 409, 869 )
	UpgradeTitleText:setTopBottom( true, false, 216, 264 )
	UpgradeTitleText:setText( Engine.Localize( "COOP_UPGRADE_TITLE" ) )
	UpgradeTitleText:setTTF( "fonts/default.ttf" )
	UpgradeTitleText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	UpgradeTitleText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( UpgradeTitleText )
	self.UpgradeTitleText = UpgradeTitleText
	
	f1_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "ESC", function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3 )
		SetResponseNo( self, f2_arg2 )
		return true
	end, function ( f3_arg0, f3_arg1, f3_arg2 )
		CoD.Menu.SetButtonLabel( f3_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
		return false
	end, false )
	f1_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "F", function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
		SetResponseYes( self, f4_arg2 )
		return true
	end, function ( f5_arg0, f5_arg1, f5_arg2 )
		CoD.Menu.SetButtonLabel( f5_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "" )
		return false
	end, false )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f1_local1
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "raid_upgrades.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

