require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.scorestreakVignetteContainer" )
require( "ui.uieditor.widgets.CAC.ResetDefaultClassButton" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideList" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )

local PostLoadFunc = function ( self )
	local controller = self:getOwner()
	self:setModel( CoD.perController[controller].classModel )
end

LUI.createMenu.ResetClass = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "ResetClass" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ResetClass.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( false, false, -640, 640 )
	Background:setTopBottom( false, false, -360, 360 )
	Background:setAlpha( 0 )
	Background:setImage( RegisterImage( "uie_t7_mp_menu_cac_version5_backdrop720p" ) )
	self:addElement( Background )
	self.Background = Background
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 1280 )
	Image0:setTopBottom( true, false, 0, 720 )
	Image0:setRGB( 0.31, 0.31, 0.31 )
	Image0:setAlpha( 0.48 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local scorestreakVignetteContainer = CoD.scorestreakVignetteContainer.new( self, controller )
	scorestreakVignetteContainer:setLeftRight( true, false, 0, 1280 )
	scorestreakVignetteContainer:setTopBottom( true, false, 0, 720 )
	self:addElement( scorestreakVignetteContainer )
	self.scorestreakVignetteContainer = scorestreakVignetteContainer
	
	local topBorder = LUI.UIImage.new()
	topBorder:setLeftRight( true, true, 0, 0 )
	topBorder:setTopBottom( true, false, 216, 497 )
	topBorder:setRGB( 0, 0, 0 )
	self:addElement( topBorder )
	self.topBorder = topBorder
	
	local buttonList = LUI.UIList.new( self, controller, 2, 0, nil, true, false, 0, 0, false, true )
	buttonList:makeFocusable()
	buttonList:setLeftRight( true, false, 76, 256 )
	buttonList:setTopBottom( true, false, 302, 460 )
	buttonList:setDataSource( "ResetDefaultClass" )
	buttonList:setWidgetType( CoD.ResetDefaultClassButton )
	buttonList:setVerticalCount( 5 )
	buttonList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	buttonList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( buttonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ClassOptionsResetToDefault( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( buttonList )
	self.buttonList = buttonList
	
	local ElemsSideList = CoD.cac_ElemsSideList.new( self, controller )
	ElemsSideList:setLeftRight( true, false, 0, 67.87 )
	ElemsSideList:setTopBottom( true, false, 0, 720 )
	self:addElement( ElemsSideList )
	self.ElemsSideList = ElemsSideList
	
	local titleLabel = LUI.UITightText.new()
	titleLabel:setLeftRight( true, false, 76, 523 )
	titleLabel:setTopBottom( true, false, 249, 279 )
	titleLabel:setText( Engine.Localize( "MENU_WHICH_DEFAULT_CLASS" ) )
	titleLabel:setTTF( "fonts/default.ttf" )
	self:addElement( titleLabel )
	self.titleLabel = titleLabel
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, -2, 1302 )
	CategoryListLine:setTopBottom( true, false, 211, 219 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( true, false, -2, 1302 )
	CategoryListLine0:setTopBottom( true, false, 492, 500 )
	CategoryListLine0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local feFooterContainer = CoD.fe_FooterContainer_NOTLobby.new( self, controller )
	feFooterContainer:setLeftRight( true, true, 0, 0 )
	feFooterContainer:setTopBottom( false, true, -65, 0 )
	feFooterContainer:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SizeToSafeArea( element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( feFooterContainer )
	self.feFooterContainer = feFooterContainer
	
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	buttonList.id = "buttonList"
	feFooterContainer:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.buttonList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.scorestreakVignetteContainer:close()
		self.buttonList:close()
		self.ElemsSideList:close()
		self.feFooterContainer:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "ResetClass.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

