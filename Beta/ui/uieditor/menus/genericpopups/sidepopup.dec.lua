require( "ui.uieditor.widgets.GenericPopups.SideModalButtonList" )

LUI.createMenu.SidePopup = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "SidePopup" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "SidePopup.buttonPrompts" )
	local menu = self
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, false, 899.5, 1280 )
	Background:setTopBottom( true, false, 0, 720 )
	Background:setRGB( 0, 0, 0 )
	Background:setAlpha( 0.9 )
	self:addElement( Background )
	self.Background = Background
	
	local Border = LUI.UIImage.new()
	Border:setLeftRight( true, false, 895.5, 899.5 )
	Border:setTopBottom( true, false, 0, 720 )
	self:addElement( Border )
	self.Border = Border
	
	local Border0 = LUI.UIImage.new()
	Border0:setLeftRight( true, false, 892.5, 895.5 )
	Border0:setTopBottom( true, false, 0, 720 )
	Border0:setAlpha( 0.42 )
	self:addElement( Border0 )
	self.Border0 = Border0
	
	local SideModalButtonList0 = CoD.SideModalButtonList.new( menu, controller )
	SideModalButtonList0:setLeftRight( true, false, 892.5, 1206.5 )
	SideModalButtonList0:setTopBottom( true, false, 25, 695 )
	self:addElement( SideModalButtonList0 )
	self.SideModalButtonList0 = SideModalButtonList0
	
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "ESCAPE", function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
		return false
	end, false )
	SideModalButtonList0.id = "SideModalButtonList0"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = menu
	} )
	if not self:restoreState() then
		self.SideModalButtonList0:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.SideModalButtonList0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "SidePopup.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

