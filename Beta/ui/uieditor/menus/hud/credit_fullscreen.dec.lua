require( "ui.uieditor.widgets.HUD.FadingSkipPrompt" )

local PostLoadFunc = function ( self )
	self.Credit0:setupCredit()
end

LUI.createMenu.Credit_Fullscreen = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Credit_Fullscreen" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "HUD"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Credit_Fullscreen.buttonPrompts" )
	local menu = self
	self.anyChildUsesUpdateState = true
	
	local Credit0 = LUI.UIElement.new()
	Credit0:setLeftRight( true, false, 64, 1216 )
	Credit0:setTopBottom( true, false, 36, 659 )
	self:addElement( Credit0 )
	self.Credit0 = Credit0
	
	local FadingSkipPrompt0 = CoD.FadingSkipPrompt.new( menu, controller )
	FadingSkipPrompt0:setLeftRight( true, false, 875, 1216 )
	FadingSkipPrompt0:setTopBottom( true, false, 659, 684 )
	self:addElement( FadingSkipPrompt0 )
	self.FadingSkipPrompt0 = FadingSkipPrompt0
	
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if PropertyIsTrue( self, "showPrompt" ) then
			SendMenuResponse( self, "Credit_Fullscreen", "skip", controller )
			return true
		else
			SetProperty( self, "showPrompt", true )
			PlayClipOnElement( self, {
				elementName = "FadingSkipPrompt0",
				clipName = "Show"
			}, controller )
			return true
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
		return false
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		if not PropertyIsTrue( self, "showPrompt" ) then
			SetProperty( self, "showPrompt", true )
			PlayClipOnElement( self, {
				elementName = "FadingSkipPrompt0",
				clipName = "Show"
			}, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
		if not PropertyIsTrue( self, "showPrompt" ) then
			return false
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, nil, function ( element, menu, controller, model )
		if not PropertyIsTrue( self, "showPrompt" ) then
			SetProperty( self, "showPrompt", true )
			PlayClipOnElement( self, {
				elementName = "FadingSkipPrompt0",
				clipName = "Show"
			}, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "" )
		if not PropertyIsTrue( self, "showPrompt" ) then
			return false
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, nil, function ( element, menu, controller, model )
		if not PropertyIsTrue( self, "showPrompt" ) then
			SetProperty( self, "showPrompt", true )
			PlayClipOnElement( self, {
				elementName = "FadingSkipPrompt0",
				clipName = "Show"
			}, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "" )
		if not PropertyIsTrue( self, "showPrompt" ) then
			return false
		else
			return false
		end
	end, false )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = menu
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FadingSkipPrompt0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Credit_Fullscreen.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

