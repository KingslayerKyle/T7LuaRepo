-- b276adee9773e3ca4bb57f83c1aaf1d6
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.scorestreakVignetteContainer" )
require( "ui.uieditor.widgets.BackgroundFrames.CACBackgroundNoHero" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.CybercoreSelectionMulticoreWidget" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.CybercoreListItemWidget" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.CybercoreSelectionInfoWidget" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )

DataSources.CybercoreSelectionMenu = {
	getModel = function ( f1_arg0 )
		local f1_local0 = Engine.CreateModel( Engine.GetModelForController( f1_arg0 ), "CybercoreSelectionMenu" )
		Engine.SetModelValue( Engine.CreateModel( f1_local0, "multicoreUnlockLevel" ), CoD.CACUtility.MulticoreUnlockLevel )
		return f1_local0
	end
}
DataSources.CybercoreList = DataSourceHelpers.ListSetup( "CybercoreList", function ( f2_arg0 )
	local f2_local0 = {}
	local f2_local1 = Engine.GetEquippedCybercore( f2_arg0 )
	local f2_local2 = CoD.GetUnlockablesByGroupName( "cybercom_core" )
	local f2_local3 = function ( f3_arg0, f3_arg1, f3_arg2, f3_arg3, f3_arg4 )
		local f3_local0 = f3_arg1:getModel( f3_arg2, "itemIndex" )
		if f3_local0 then
			local f3_local1 = Engine.GetModelValue( f3_local0 )
			local f3_local2 = Engine.GetModel( Engine.GetModelForController( f3_arg2 ), "hudItems.cybercomRequestedType" )
			if f3_local2 then
				local f3_local3 = f3_arg1:getModel( f3_arg2, "gscIndex" )
				if f3_local3 then
					Engine.SetModelValue( f3_local2, Engine.GetModelValue( f3_local3 ) )
					Engine.EquipCybercore( f3_arg2, f3_local1 )
				end
			end
			local f3_local3 = GoBack( f3_arg0, f3_arg2 )
			ClearMenuSavedState( f3_arg4 )
			if f3_local3 then
				f3_local3:processEvent( {
					name = "update_state",
					controller = f3_arg2
				} )
			end
			SaveLoadout( f3_arg0, f3_arg2 )
		end
	end
	
	for f2_local4 = 1, table.getn( f2_local2 ), 1 do
		local f2_local7 = f2_local2[f2_local4]
		local f2_local8 = Engine.GetItemName( f2_local7 )
		local f2_local9 = Engine.GetItemImage( f2_local7 )
		local f2_local10 = Engine.GetItemDesc( f2_local7 )
		local f2_local11 = Engine.GetItemRef( f2_local7 )
		local f2_local12 = {
			name = f2_local8,
			icon = f2_local9,
			desc = f2_local10,
			ref = f2_local11,
			itemIndex = f2_local7,
			gscIndex = 0
		}
		for f2_local16, f2_local17 in ipairs( CoD.CACUtility.CybercoreGroupNames ) do
			if f2_local17.itemRef == f2_local11 then
				f2_local12.gscIndex = f2_local17.index
				break
			end
		end
		f2_local13 = CoD.CACUtility.abilityButtonNumMapping
		f2_local14 = 0
		f2_local15 = 0
		for f2_local16 = 1, CoD.CACUtility.maxAbilities, 1 do
			local f2_local19 = Engine.GetTacticalMenuItems( f2_arg0, f2_local16 - 1, f2_local4 - 1 )
			local f2_local20 = nil
			if f2_local19.contextual then
				f2_local20 = "AbilityWheelContextualWeapon" .. f2_local15 + 1
			else
				f2_local20 = "AbilityWheelWeapon" .. f2_local13[f2_local14 + 1]
			end
			f2_local12[f2_local20] = {
				name = f2_local19.name,
				displayName = f2_local19.displayName,
				image = f2_local19.image,
				enabled = Engine.IsItemPurchased( f2_arg0, Engine.GetItemIndexFromReference( f2_local19.name ) )
			}
		end
		for f2_local16 = f2_local14 + 1, CoD.CACUtility.maxAbilityWheelItems, 1 do
			f2_local12["AbilityWheelWeapon" .. f2_local13[f2_local16]] = {
				name = nil,
				displayName = "",
				image = nil,
				enabled = false
			}
		end
		for f2_local16 = f2_local15 + 1, CoD.CACUtility.maxContextualAbilityItems, 1 do
			f2_local12["AbilityWheelContextualWeapon" .. f2_local13[f2_local16]] = {
				name = nil,
				displayName = "",
				image = nil,
				enabled = false
			}
		end
		table.insert( f2_local0, {
			models = f2_local12,
			properties = {
				selectIndex = f2_local7 == f2_local1,
				action = f2_local3
			}
		} )
	end
	return f2_local0
end, true )
LUI.createMenu.CybercoreSelectionMenu = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CybercoreSelectionMenu" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "CAC"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CybercoreSelectionMenu.buttonPrompts" )
	local f4_local1 = self
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, true, 0, 0 )
	Background:setTopBottom( true, true, -18, -18 )
	Background:setScale( 1 )
	Background:setImage( RegisterImage( "uie_t7_mp_menu_cac_version6_backdrop720p" ) )
	self:addElement( Background )
	self.Background = Background
	
	local blackImage = LUI.UIImage.new()
	blackImage:setLeftRight( true, true, 0, 0 )
	blackImage:setTopBottom( true, true, 0, 0 )
	blackImage:setRGB( 0, 0, 0 )
	blackImage:setAlpha( 0.5 )
	self:addElement( blackImage )
	self.blackImage = blackImage
	
	local CybercoreVignetteContainer = CoD.scorestreakVignetteContainer.new( f4_local1, controller )
	CybercoreVignetteContainer:setLeftRight( true, true, 0, 0 )
	CybercoreVignetteContainer:setTopBottom( true, true, 0, 0 )
	self:addElement( CybercoreVignetteContainer )
	self.CybercoreVignetteContainer = CybercoreVignetteContainer
	
	local Backing = LUI.UIImage.new()
	Backing:setLeftRight( false, false, -597, -251 )
	Backing:setTopBottom( true, true, 81.5, -44.5 )
	Backing:setRGB( 0, 0, 0 )
	Backing:setAlpha( 0.65 )
	self:addElement( Backing )
	self.Backing = Backing
	
	local CACBackgroundNoHero0 = CoD.CACBackgroundNoHero.new( f4_local1, controller )
	CACBackgroundNoHero0:setLeftRight( true, true, -6, -6 )
	CACBackgroundNoHero0:setTopBottom( true, true, 4, 4 )
	CACBackgroundNoHero0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_LOADOUTS_CAPS" ) )
	self:addElement( CACBackgroundNoHero0 )
	self.CACBackgroundNoHero0 = CACBackgroundNoHero0
	
	local listHeader = LUI.UITightText.new()
	listHeader:setLeftRight( false, false, -576, -283 )
	listHeader:setTopBottom( true, false, 109, 134 )
	listHeader:setText( Engine.Localize( LocalizeToUpperString( "MENU_CYBERNETICS_CORE" ) ) )
	listHeader:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	self:addElement( listHeader )
	self.listHeader = listHeader
	
	local listBgImage = LUI.UIImage.new()
	listBgImage:setLeftRight( false, false, -576, -266 )
	listBgImage:setTopBottom( true, false, 143.5, 635 )
	listBgImage:setRGB( 0.43, 0.43, 0.43 )
	listBgImage:setAlpha( 0 )
	listBgImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( listBgImage )
	self.listBgImage = listBgImage
	
	local CybercoreSelectionMulticoreWidget0 = CoD.CybercoreSelectionMulticoreWidget.new( f4_local1, controller )
	CybercoreSelectionMulticoreWidget0:setLeftRight( false, false, -576, -283 )
	CybercoreSelectionMulticoreWidget0:setTopBottom( true, false, 505, 645 )
	self:addElement( CybercoreSelectionMulticoreWidget0 )
	self.CybercoreSelectionMulticoreWidget0 = CybercoreSelectionMulticoreWidget0
	
	local coreList = LUI.UIList.new( f4_local1, controller, 2, 0, nil, false, false, 0, 0, false, true )
	coreList:makeFocusable()
	coreList:setLeftRight( false, false, -576, -266 )
	coreList:setTopBottom( true, false, 134, 480 )
	coreList:setDataSource( "CybercoreList" )
	coreList:setWidgetType( CoD.CybercoreListItemWidget )
	coreList:setVerticalCount( 3 )
	coreList:registerEventHandler( "gain_focus", function ( element, event )
		local f5_local0 = nil
		if element.gainFocus then
			f5_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f5_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f4_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f5_local0
	end )
	coreList:registerEventHandler( "lose_focus", function ( element, event )
		local f6_local0 = nil
		if element.loseFocus then
			f6_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f6_local0 = element.super:loseFocus( event )
		end
		return f6_local0
	end )
	f4_local1:AddButtonCallbackFunction( coreList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
		ProcessListAction( self, f7_arg0, f7_arg2 )
		return true
	end, function ( f8_arg0, f8_arg1, f8_arg2 )
		CoD.Menu.SetButtonLabel( f8_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( coreList )
	self.coreList = coreList
	
	local CybercoreSelectionInfoWidget0 = CoD.CybercoreSelectionInfoWidget.new( f4_local1, controller )
	CybercoreSelectionInfoWidget0:setLeftRight( false, false, -223.5, 640 )
	CybercoreSelectionInfoWidget0:setTopBottom( true, false, 89.5, 675.5 )
	self:addElement( CybercoreSelectionInfoWidget0 )
	self.CybercoreSelectionInfoWidget0 = CybercoreSelectionInfoWidget0
	
	local feFooterContainerNOTLobby0 = CoD.fe_FooterContainer_NOTLobby.new( f4_local1, controller )
	feFooterContainerNOTLobby0:setLeftRight( true, true, 0, 0 )
	feFooterContainerNOTLobby0:setTopBottom( false, true, -65, 0 )
	feFooterContainerNOTLobby0:setAlpha( 0 )
	self:addElement( feFooterContainerNOTLobby0 )
	self.feFooterContainerNOTLobby0 = feFooterContainerNOTLobby0
	
	local cacButtonBoxLrgInactiveStroke0 = CoD.cac_ButtonBoxLrgInactiveStroke.new( f4_local1, controller )
	cacButtonBoxLrgInactiveStroke0:setLeftRight( false, false, -576, -271 )
	cacButtonBoxLrgInactiveStroke0:setTopBottom( true, false, 490, 653 )
	self:addElement( cacButtonBoxLrgInactiveStroke0 )
	self.cacButtonBoxLrgInactiveStroke0 = cacButtonBoxLrgInactiveStroke0
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, true, -12, 12 )
	CategoryListLine:setTopBottom( true, false, 79.5, 89 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local LineSide = LUI.UIImage.new()
	LineSide:setLeftRight( false, false, -584.1, -581.1 )
	LineSide:setTopBottom( true, true, 86.5, -44 )
	LineSide:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide )
	self.LineSide = LineSide
	
	local Pixel20010 = LUI.UIImage.new()
	Pixel20010:setLeftRight( false, false, -604.13, -568.13 )
	Pixel20010:setTopBottom( true, false, 134, 138 )
	Pixel20010:setYRot( -180 )
	Pixel20010:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel20010:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel20010 )
	self.Pixel20010 = Pixel20010
	
	local Pixel200100 = LUI.UIImage.new()
	Pixel200100:setLeftRight( false, false, -604.13, -568.13 )
	Pixel200100:setTopBottom( true, false, 476, 480 )
	Pixel200100:setYRot( -180 )
	Pixel200100:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel200100:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel200100 )
	self.Pixel200100 = Pixel200100
	
	local feFooterContainer = CoD.fe_FooterContainer_NOTLobby.new( f4_local1, controller )
	feFooterContainer:setLeftRight( true, true, 0, 0 )
	feFooterContainer:setTopBottom( false, true, -65, 0 )
	feFooterContainer:registerEventHandler( "menu_loaded", function ( element, event )
		local f9_local0 = nil
		SizeToSafeArea( element, controller )
		if not f9_local0 then
			f9_local0 = element:dispatchEventToChildren( event )
		end
		return f9_local0
	end )
	self:addElement( feFooterContainer )
	self.feFooterContainer = feFooterContainer
	
	CybercoreSelectionInfoWidget0:linkToElementModel( coreList, nil, false, function ( model )
		CybercoreSelectionInfoWidget0:setModel( model, controller )
	end )
	f4_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
		GoBack( self, f11_arg2 )
		ClearMenuSavedState( f11_arg1 )
		return true
	end, function ( f12_arg0, f12_arg1, f12_arg2 )
		CoD.Menu.SetButtonLabel( f12_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	coreList.id = "coreList"
	feFooterContainerNOTLobby0:setModel( self.buttonModel, controller )
	feFooterContainer:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f4_local1
	} )
	if not self:restoreState() then
		self.coreList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CybercoreVignetteContainer:close()
		element.CACBackgroundNoHero0:close()
		element.CybercoreSelectionMulticoreWidget0:close()
		element.coreList:close()
		element.CybercoreSelectionInfoWidget0:close()
		element.feFooterContainerNOTLobby0:close()
		element.cacButtonBoxLrgInactiveStroke0:close()
		element.feFooterContainer:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CybercoreSelectionMenu.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

