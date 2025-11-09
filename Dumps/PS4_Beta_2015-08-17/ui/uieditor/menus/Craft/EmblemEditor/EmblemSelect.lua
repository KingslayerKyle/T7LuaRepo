require( "ui.uieditor.widgets.CAC.TitleDotsWidget" )
require( "ui.uieditor.widgets.CAC.cac_3dTitleIntermediary" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideList" )
require( "ui.uieditor.menus.Craft.EmblemEditor.EmblemEditor" )
require( "ui.uieditor.menus.Craft.EmblemEditor.EmblemSelectOptions" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemItem" )
require( "ui.uieditor.widgets.Scrollbars.verticalScrollbar" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemDrawWidgetNew" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )

local PreLoadFunc = function ( self, controller )
	self:subscribeToModel( Engine.CreateModel( Engine.GetModelForController( controller ), "Emblem.UpdateDataSource" ), function ()
		local selectedEmblemModel = CoD.perController[controller].selectedEmblemModel
		if selectedEmblemModel then
			local emblemIndex = Engine.GetModelValue( Engine.GetModel( selectedEmblemModel, "emblemIndex" ) )
			if self.emblemList ~= nil then
				self.emblemList:updateDataSource( true )
				self.emblemList:findItem( {
					emblemIndex = emblemIndex
				}, nil, true, nil )
			end
		end
	end )
	CoD.emblem.ColorList = nil
end

LUI.createMenu.EmblemSelect = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "EmblemSelect" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "EmblemSelect.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( false, false, -638, 642 )
	Background:setTopBottom( false, false, -360, 360 )
	Background:setImage( RegisterImage( "uie_t7_mp_menu_cac_version6_backdrop720p" ) )
	self:addElement( Background )
	self.Background = Background
	
	local emblemSelectBg = LUI.UIImage.new()
	emblemSelectBg:setLeftRight( true, true, 0, 0 )
	emblemSelectBg:setTopBottom( true, true, 0, 0 )
	emblemSelectBg:setRGB( 0, 0, 0 )
	emblemSelectBg:setAlpha( 0.7 )
	emblemSelectBg:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiply" ) )
	self:addElement( emblemSelectBg )
	self.emblemSelectBg = emblemSelectBg
	
	local TitleDotsWidget0 = CoD.TitleDotsWidget.new( self, controller )
	TitleDotsWidget0:setLeftRight( true, false, 3, 528.34 )
	TitleDotsWidget0:setTopBottom( true, false, -65.33, 92.67 )
	TitleDotsWidget0:setAlpha( 0 )
	self:addElement( TitleDotsWidget0 )
	self.TitleDotsWidget0 = TitleDotsWidget0
	
	local cac3dTitleIntermediary0 = CoD.cac_3dTitleIntermediary.new( self, controller )
	cac3dTitleIntermediary0:setLeftRight( true, false, -71.25, 506.75 )
	cac3dTitleIntermediary0:setTopBottom( true, false, -5.5, 140.5 )
	cac3dTitleIntermediary0:setAlpha( 0 )
	cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_EMBLEMS_CAPS" ) )
	self:addElement( cac3dTitleIntermediary0 )
	self.cac3dTitleIntermediary0 = cac3dTitleIntermediary0
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, -11, 1293 )
	CategoryListLine:setTopBottom( true, false, 80, 88 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local ElemsSideList = CoD.cac_ElemsSideList.new( self, controller )
	ElemsSideList:setLeftRight( true, false, 11, 78.87 )
	ElemsSideList:setTopBottom( true, false, 48, 718 )
	self:addElement( ElemsSideList )
	self.ElemsSideList = ElemsSideList
	
	local GridPanel = LUI.UIImage.new()
	GridPanel:setLeftRight( true, false, 64, 658 )
	GridPanel:setTopBottom( true, false, 76, 684 )
	GridPanel:setRGB( 0, 0, 0 )
	GridPanel:setAlpha( 0.15 )
	self:addElement( GridPanel )
	self.GridPanel = GridPanel
	
	local emblemList = LUI.UIList.new( self, controller, 7, 0, nil, true, false, 0, 0, false, false )
	emblemList:makeFocusable()
	emblemList:setLeftRight( true, false, 90, 632 )
	emblemList:setTopBottom( true, false, 140, 593 )
	emblemList:setDataSource( "EmblemsList" )
	emblemList:setWidgetType( CoD.EmblemItem )
	emblemList:setHorizontalCount( 3 )
	emblemList:setVerticalCount( 4 )
	emblemList:setSpacing( 7 )
	emblemList:setVerticalScrollbar( CoD.verticalScrollbar )
	emblemList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		EmblemSelect_GainFocus( self, element, controller )
		return retVal
	end )
	emblemList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		return retVal
	end )
	emblemList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( emblemList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		EmblemSelect_ChooseEmblem( self, element, controller )
		OpenOverlay( self, "EmblemEditor", controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:AddButtonCallbackFunction( emblemList, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, nil, function ( element, menu, controller, model )
		if Emblem_IsOccupied( element, controller ) then
			OpenPopup( self, "EmblemSelectOptions", controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_OPTIONS" )
		if Emblem_IsOccupied( element, controller ) then
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( emblemList, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, nil, function ( element, menu, controller, model )
		if Emblem_IsOccupied( element, controller ) then
			EmblemSelect_SetAsEmblem( self, element, controller )
			PlaySoundSetSound( self, "toggle" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "MENU_SET_AS_EMBLEM" )
		if Emblem_IsOccupied( element, controller ) then
			return true
		else
			return false
		end
	end, false )
	emblemList:mergeStateConditions( {
		{
			stateName = "EmptySlot",
			condition = function ( menu, element, event )
				return not Emblem_IsOccupied( element, controller )
			end
		}
	} )
	self:addElement( emblemList )
	self.emblemList = emblemList
	
	local emblemDrawWidget = CoD.EmblemDrawWidgetNew.new( self, controller )
	emblemDrawWidget:setLeftRight( true, false, 700, 1200 )
	emblemDrawWidget:setTopBottom( true, false, 130, 444 )
	self:addElement( emblemDrawWidget )
	self.emblemDrawWidget = emblemDrawWidget
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_EMBLEMS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_EMBLEMS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_emblem" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	emblemList.navigation = {
		right = emblemDrawWidget
	}
	emblemDrawWidget.navigation = {
		left = emblemList
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				emblemDrawWidget:completeAnimation()
				self.emblemDrawWidget:setLeftRight( true, false, 700, 1200 )
				self.emblemDrawWidget:setTopBottom( true, false, 130, 444 )
				self.clipFinished( emblemDrawWidget, {} )
			end
		}
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		ShowHeaderIconOnly( self )
		SetElementStateByElementName( self, "MenuFrame", controller, "Update" )
		PlayClipOnElement( self, {
			elementName = "MenuFrame",
			clipName = "Intro"
		}, controller )
		PlayClip( self, "Intro", controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		ClearSavedState( self, controller )
		EmblemSelect_Back( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	emblemList.id = "emblemList"
	emblemDrawWidget.id = "emblemDrawWidget"
	MenuFrame:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.emblemList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.TitleDotsWidget0:close()
		self.cac3dTitleIntermediary0:close()
		self.ElemsSideList:close()
		self.emblemList:close()
		self.emblemDrawWidget:close()
		self.MenuFrame:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "EmblemSelect.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

