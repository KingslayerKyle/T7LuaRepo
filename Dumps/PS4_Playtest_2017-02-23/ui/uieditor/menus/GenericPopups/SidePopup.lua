require( "ui.uieditor.widgets.GenericPopups.SideModalButtonList" )

LUI.createMenu.SidePopup = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "SidePopup" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "SidePopup.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( 0, 0, 1349, 1920 )
	Background:setTopBottom( 0, 0, 0, 1080 )
	Background:setRGB( 0, 0, 0 )
	Background:setAlpha( 0.9 )
	self:addElement( Background )
	self.Background = Background
	
	local Border = LUI.UIImage.new()
	Border:setLeftRight( 0, 0, 1343, 1349 )
	Border:setTopBottom( 0, 0, 0, 1080 )
	self:addElement( Border )
	self.Border = Border
	
	local Border0 = LUI.UIImage.new()
	Border0:setLeftRight( 0, 0, 1339, 1343 )
	Border0:setTopBottom( 0, 0, 0, 1080 )
	Border0:setAlpha( 0.42 )
	self:addElement( Border0 )
	self.Border0 = Border0
	
	local SideModalButtonList0 = CoD.SideModalButtonList.new( self, controller )
	SideModalButtonList0:setLeftRight( 0, 0, 1338.5, 1809.5 )
	SideModalButtonList0:setTopBottom( 0, 0, 37.5, 1042.5 )
	self:addElement( SideModalButtonList0 )
	self.SideModalButtonList0 = SideModalButtonList0
	
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "", nil )
		return false
	end, false )
	SideModalButtonList0.id = "SideModalButtonList0"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
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

