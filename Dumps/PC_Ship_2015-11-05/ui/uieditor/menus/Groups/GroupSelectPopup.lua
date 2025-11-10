require( "ui.uieditor.widgets.Groups.GroupsItemRow" )
require( "ui.uieditor.widgets.Scrollbars.verticalScrollbarNew" )

LUI.createMenu.GroupSelectPopup = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "GroupSelectPopup" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "MultiplayerMain"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GroupSelectPopup.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, false, 0, 1280 )
	background:setTopBottom( true, false, 2, 720 )
	background:setRGB( 0, 0, 0 )
	self:addElement( background )
	self.background = background
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, true, 0, 0 )
	Image1:setTopBottom( false, true, -188.84, -182.84 )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, true, 0, 0 )
	Image2:setTopBottom( false, true, -592.84, -586.84 )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local ButtonList = LUI.UIList.new( self, controller, 3, 0, nil, false, false, 0, 0, false, false )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( true, false, 64, 420 )
	ButtonList:setTopBottom( true, false, 261, 508 )
	ButtonList:setDataSource( "GroupsInviteButtonList" )
	ButtonList:setWidgetType( CoD.GroupsItemRow )
	ButtonList:setVerticalCount( 5 )
	ButtonList:setSpacing( 3 )
	ButtonList:setVerticalScrollbar( CoD.verticalScrollbarNew )
	ButtonList:registerEventHandler( "gain_focus", function ( element, event )
		local f2_local0 = nil
		if element.gainFocus then
			f2_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f2_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f2_local0
	end )
	ButtonList:registerEventHandler( "lose_focus", function ( element, event )
		local f3_local0 = nil
		if element.loseFocus then
			f3_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f3_local0 = element.super:loseFocus( event )
		end
		return f3_local0
	end )
	self:AddButtonCallbackFunction( ButtonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	local Title = LUI.UITightText.new()
	Title:setLeftRight( true, false, 64, 264 )
	Title:setTopBottom( true, false, 145.5, 193.5 )
	Title:setText( Engine.Localize( "GROUPS_CHOOSE_GROUP_CAPS" ) )
	Title:setTTF( "fonts/default.ttf" )
	self:addElement( Title )
	self.Title = Title
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( true, false, 64, 600 )
	TextBox0:setTopBottom( true, false, 198.5, 223.5 )
	TextBox0:setText( Engine.Localize( "GROUPS_CHOOSE_GROUP_MESSAGE" ) )
	TextBox0:setTTF( "fonts/default.ttf" )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	ButtonList.id = "ButtonList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.ButtonList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ButtonList:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "GroupSelectPopup.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

