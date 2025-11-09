require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.scorestreakVignetteContainer" )
require( "ui.uieditor.widgets.BubbleGumBuffs.BubbleGumPackListItem" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideList" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0:setModel( CoD.perController[f1_arg1].bubbleGumPackModel )
	local f1_local0 = f1_arg0:getModel()
	if f1_local0 then
		for f1_local1 = 1, #f1_arg0.bubblegumPacksList.layoutItems, 1 do
			local f1_local4 = f1_arg0.bubblegumPacksList.layoutItems[f1_local1][1]
			if f1_local4 and f1_local0 == f1_local4:getModel() then
				f1_local4:setState( "Disabled" )
				break
			end
		end
	end
	f1_arg0.bubblegumPacksList:processEvent( {
		name = "gain_focus",
		controller = f1_arg1
	} )
end

LUI.createMenu.CopyBubblegumPack = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CopyBubblegumPack" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CopyBubblegumPack.buttonPrompts" )
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
	topBorder:setTopBottom( true, false, 118, 556 )
	topBorder:setRGB( 0, 0, 0 )
	topBorder:setAlpha( 0.75 )
	self:addElement( topBorder )
	self.topBorder = topBorder
	
	local copyTitle = LUI.UITightText.new()
	copyTitle:setLeftRight( true, false, 86.07, 720.07 )
	copyTitle:setTopBottom( true, false, 139.85, 164.85 )
	copyTitle:setText( Engine.Localize( "MPUI_COPY_BUBBLEGUM_PACK_TITLE" ) )
	copyTitle:setTTF( "fonts/default.ttf" )
	self:addElement( copyTitle )
	self.copyTitle = copyTitle
	
	local bubblegumPacksList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	bubblegumPacksList:makeFocusable()
	bubblegumPacksList:setLeftRight( true, false, 86.07, 366.07 )
	bubblegumPacksList:setTopBottom( true, false, 188.25, 526.25 )
	bubblegumPacksList:setDataSource( "BubbleGumPacks" )
	bubblegumPacksList:setWidgetType( CoD.BubbleGumPackListItem )
	bubblegumPacksList:setVerticalCount( 10 )
	bubblegumPacksList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f3_local0 = nil
		if IsBubbleGumPackClassSelectedBubbleGumPack( self, element ) then
			SetElementState( self, element, controller, "Disabled" )
			PlayClipOnListItemElement( self, element, controller, "Focus" )
		end
		return f3_local0
	end )
	bubblegumPacksList:registerEventHandler( "gain_focus", function ( element, event )
		local f4_local0 = nil
		if element.gainFocus then
			f4_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f4_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f4_local0
	end )
	bubblegumPacksList:registerEventHandler( "lose_focus", function ( element, event )
		local f5_local0 = nil
		if element.loseFocus then
			f5_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f5_local0 = element.super:loseFocus( event )
		end
		return f5_local0
	end )
	self:AddButtonCallbackFunction( bubblegumPacksList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsBubbleGumPackClassSelectedBubbleGumPack( menu, element ) then
			BubblegumPackOptionsCopy( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsBubbleGumPackClassSelectedBubbleGumPack( menu, element ) then
			return true
		else
			return false
		end
	end, false )
	self:addElement( bubblegumPacksList )
	self.bubblegumPacksList = bubblegumPacksList
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, 0, 1280 )
	CategoryListLine:setTopBottom( true, false, 114, 122 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( true, false, -1, 1280 )
	CategoryListLine0:setTopBottom( true, false, 552, 560 )
	CategoryListLine0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local ElemsSideList = CoD.cac_ElemsSideList.new( self, controller )
	ElemsSideList:setLeftRight( true, false, 0, 67.87 )
	ElemsSideList:setTopBottom( true, false, 0, 720 )
	self:addElement( ElemsSideList )
	self.ElemsSideList = ElemsSideList
	
	local feFooterContainer = CoD.fe_FooterContainer_NOTLobby.new( self, controller )
	feFooterContainer:setLeftRight( true, true, 0, 0 )
	feFooterContainer:setTopBottom( false, true, -65, 0 )
	feFooterContainer:registerEventHandler( "menu_loaded", function ( element, event )
		local f8_local0 = nil
		SizeToSafeArea( element, controller )
		if not f8_local0 then
			f8_local0 = element:dispatchEventToChildren( event )
		end
		return f8_local0
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.scorestreakVignetteContainer:close()
		element.bubblegumPacksList:close()
		element.ElemsSideList:close()
		element.feFooterContainer:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CopyBubblegumPack.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

