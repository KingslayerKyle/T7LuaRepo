require( "ui.uieditor.widgets.BubbleGumBuffs.BubbleGumPackListItem" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideList" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.scorestreakVignetteContainer" )

local PostLoadFunc = function ( self, controller )
	self:setModel( CoD.perController[controller].bubbleGumPackModel )
	local menuModel = self:getModel()
	if menuModel then
		for i = 1, #self.bubblegumPacksList.layoutItems, 1 do
			local currentItem = self.bubblegumPacksList.layoutItems[i][1]
			local currentItemModel = currentItem:getModel()
			if currentItem and menuModel == currentItemModel then
				currentItem:setState( "Disabled" )
				break
			end
		end
	end
	self.bubblegumPacksList:processEvent( {
		name = "gain_focus",
		controller = controller
	} )
end

LUI.createMenu.CopyBubblegumPack = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CopyBubblegumPack" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CopyBubblegumPack.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( 0.5, 0.5, -960, 960 )
	Background:setTopBottom( 0.5, 0.5, -540, 540 )
	Background:setAlpha( 0 )
	Background:setImage( RegisterImage( "img_t7_mp_menu_cac_version5_backdrop720p" ) )
	self:addElement( Background )
	self.Background = Background
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 0, 0, 1920 )
	Image0:setTopBottom( 0, 0, 0, 1080 )
	Image0:setRGB( 0.31, 0.31, 0.31 )
	Image0:setAlpha( 0.48 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local scorestreakVignetteContainer = CoD.scorestreakVignetteContainer.new( self, controller )
	scorestreakVignetteContainer:setLeftRight( 0, 0, 0, 1920 )
	scorestreakVignetteContainer:setTopBottom( 0, 0, 0, 1080 )
	self:addElement( scorestreakVignetteContainer )
	self.scorestreakVignetteContainer = scorestreakVignetteContainer
	
	local topBorder = LUI.UIImage.new()
	topBorder:setLeftRight( 0, 1, 0, 0 )
	topBorder:setTopBottom( 0, 0, 177, 834 )
	topBorder:setRGB( 0, 0, 0 )
	topBorder:setAlpha( 0.75 )
	self:addElement( topBorder )
	self.topBorder = topBorder
	
	local copyTitle = LUI.UITightText.new()
	copyTitle:setLeftRight( 0, 0, 129, 1080 )
	copyTitle:setTopBottom( 0, 0, 210, 248 )
	copyTitle:setText( Engine.Localize( "MPUI_COPY_BUBBLEGUM_PACK_TITLE" ) )
	copyTitle:setTTF( "fonts/default.ttf" )
	self:addElement( copyTitle )
	self.copyTitle = copyTitle
	
	local bubblegumPacksList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	bubblegumPacksList:makeFocusable()
	bubblegumPacksList:setLeftRight( 0, 0, 129, 549 )
	bubblegumPacksList:setTopBottom( 0, 0, 287, 785 )
	bubblegumPacksList:setWidgetType( CoD.BubbleGumPackListItem )
	bubblegumPacksList:setVerticalCount( 10 )
	bubblegumPacksList:setDataSource( "BubbleGumPacks" )
	bubblegumPacksList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		if IsBubbleGumPackClassSelectedBubbleGumPack( self, element ) then
			SetElementState( self, element, controller, "Disabled" )
			PlayClipOnListItemElement( self, element, controller, "Focus" )
		end
		return retVal
	end )
	bubblegumPacksList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	bubblegumPacksList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( bubblegumPacksList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsBubbleGumPackClassSelectedBubbleGumPack( menu, element ) then
			BubblegumPackOptionsCopy( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsBubbleGumPackClassSelectedBubbleGumPack( menu, element ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( bubblegumPacksList )
	self.bubblegumPacksList = bubblegumPacksList
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( 0, 0, 0, 1920 )
	CategoryListLine:setTopBottom( 0, 0, 171, 183 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( 0, 0, -2, 1920 )
	CategoryListLine0:setTopBottom( 0, 0, 828, 840 )
	CategoryListLine0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local ElemsSideList = CoD.cac_ElemsSideList.new( self, controller )
	ElemsSideList:setLeftRight( 0, 0, 0, 102 )
	ElemsSideList:setTopBottom( 0, 0, 0, 1080 )
	self:addElement( ElemsSideList )
	self.ElemsSideList = ElemsSideList
	
	local feFooterContainer = CoD.fe_FooterContainer_NOTLobby.new( self, controller )
	feFooterContainer:setLeftRight( 0, 1, 0, 0 )
	feFooterContainer:setTopBottom( 1, 1, -98, 0 )
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	bubblegumPacksList.id = "bubblegumPacksList"
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
		self.bubblegumPacksList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.scorestreakVignetteContainer:close()
		self.bubblegumPacksList:close()
		self.ElemsSideList:close()
		self.feFooterContainer:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CopyBubblegumPack.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

