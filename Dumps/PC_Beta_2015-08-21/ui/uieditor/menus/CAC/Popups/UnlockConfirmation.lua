require( "ui.uieditor.widgets.BackgroundFrames.CACFullPopupBackground" )
require( "ui.uieditor.widgets.CAC.Customization.CACGenericButton" )
require( "ui.uieditor.widgets.CAC.UnlockTokensWidget" )

DataSources.UnlockTokenMenuList = DataSourceHelpers.ListSetup( "UnlockTokenMenuList", function ( f1_arg0 )
	local f1_local0 = {}
	local f1_local1 = CoD.perController[f1_arg0].isInCybercoreUpgrade or false
	local f1_local2 = function ( f2_arg0, f2_arg1 )
		return {
			models = {
				displayText = f2_arg0
			},
			properties = {
				action = f2_arg1
			}
		}
	end
	
	local f1_local3 = function ( f3_arg0, f3_arg1, f3_arg2 )
		Engine.SetModelValue( Engine.CreateModel( f3_arg1:getModel(), "itemIndex" ), Engine.GetModelValue( f3_arg0:getModel( f3_arg2, "itemIndex" ) ) )
	end
	
	local f1_local4 = function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3, f4_arg4 )
		f1_local3( f4_arg0, f4_arg1, f4_arg2 )
		UnlockItem( f4_arg0, f4_arg1, f4_arg2 )
		local f4_local0 = GoBackAndUpdateStateOnPreviousMenu( f4_arg0, f4_arg2 )
		if f1_local1 then
			UpdateCybercoreTree( f4_local0, f4_local0, f4_arg2 )
		end
		ClearSavedState( f4_arg0, f4_arg2 )
	end
	
	local f1_local5 = function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3, f5_arg4 )
		f1_local3( f5_arg0, f5_arg1, f5_arg2 )
		UnlockAndEquipItem( f5_arg0, f5_arg1, f5_arg2 )
		GoBackToCustomClassMenu( f5_arg0, f5_arg2 )
		ClearSavedState( f5_arg0, f5_arg2 )
	end
	
	local f1_local6 = function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3, f6_arg4 )
		GoBack( f6_arg0, f6_arg2 )
		ClearSavedState( f6_arg0, f6_arg2 )
	end
	
	local f1_local7 = not f1_local1
	table.insert( f1_local0, f1_local2( "MENU_UNLOCK", f1_local4 ) )
	if f1_local7 then
		table.insert( f1_local0, f1_local2( "MENU_UNLOCK_AND_EQUIP", f1_local5 ) )
	end
	table.insert( f1_local0, f1_local2( "MENU_CANCEL_UNLOCK", f1_local6 ) )
	return f1_local0
end, true )
LUI.createMenu.UnlockConfirmation = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "UnlockConfirmation" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "CAC_Overcapacity"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "UnlockConfirmation.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local background = CoD.CACFullPopupBackground.new( self, controller )
	background:setLeftRight( true, false, 0, 1280 )
	background:setTopBottom( true, false, 0, 720 )
	background.StartMenuTitlePopup.StartMenuTitleContainerLOC.StartMenu3dTitle.StartMenu3dTitleLabel.Label0:setText( Engine.Localize( "MPUI_CONFIRM_PURCHASE_CAPS" ) )
	self:addElement( background )
	self.background = background
	
	local desc = LUI.UITightText.new()
	desc:setLeftRight( true, false, 450, 798 )
	desc:setTopBottom( true, false, 223.25, 248.25 )
	desc:setRGB( 0.5, 0.51, 0.52 )
	desc:setText( Engine.Localize( GetUnlockTokenItemString( controller, "MPUI_UNLOCK_ITEM" ) ) )
	desc:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	desc:setLetterSpacing( 0.5 )
	self:addElement( desc )
	self.desc = desc
	
	local previewImage = LUI.UIImage.new()
	previewImage:setLeftRight( true, false, 92, 330 )
	previewImage:setTopBottom( true, false, 226, 464 )
	previewImage:linkToElementModel( self, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			previewImage:setImage( RegisterImage( GetItemImageFromIndexPerWeaponCategory( controller, itemIndex ) ) )
		end
	end )
	self:addElement( previewImage )
	self.previewImage = previewImage
	
	local buttonList = LUI.UIList.new( self, controller, 10, 0, nil, false, false, 0, 0, false, true )
	buttonList:makeFocusable()
	buttonList:setLeftRight( true, false, 450, 730 )
	buttonList:setTopBottom( true, false, 329, 445 )
	buttonList:setDataSource( "UnlockTokenMenuList" )
	buttonList:setWidgetType( CoD.CACGenericButton )
	buttonList:setVerticalCount( 3 )
	buttonList:setSpacing( 10 )
	buttonList:registerEventHandler( "gain_focus", function ( element, event )
		local f9_local0 = nil
		if element.gainFocus then
			f9_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f9_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f9_local0
	end )
	buttonList:registerEventHandler( "lose_focus", function ( element, event )
		local f10_local0 = nil
		if element.loseFocus then
			f10_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f10_local0 = element.super:loseFocus( event )
		end
		return f10_local0
	end )
	self:AddButtonCallbackFunction( buttonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
		return false
	end, false )
	self:addElement( buttonList )
	self.buttonList = buttonList
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, false, 10, 46 )
	Image3:setTopBottom( false, false, 99.5, 103 )
	Image3:setZRot( 180 )
	Image3:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( true, false, 10, 46 )
	Image4:setTopBottom( false, false, -136.75, -133.25 )
	Image4:setZRot( 180 )
	Image4:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local LineSide0 = LUI.UIImage.new()
	LineSide0:setLeftRight( true, false, 25.5, 30.5 )
	LineSide0:setTopBottom( true, false, 230, 460.38 )
	LineSide0:setAlpha( 0.8 )
	LineSide0:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide0 )
	self.LineSide0 = LineSide0
	
	local Image40 = LUI.UIImage.new()
	Image40:setLeftRight( true, false, 7, 23 )
	Image40:setTopBottom( true, false, 295, 347 )
	Image40:setZoom( -5 )
	Image40:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	Image40:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image40 )
	self.Image40 = Image40
	
	local Image30 = LUI.UIImage.new()
	Image30:setLeftRight( true, false, 1231, 1267 )
	Image30:setTopBottom( false, false, 99.5, 103 )
	Image30:setZRot( 180 )
	Image30:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image30:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image30 )
	self.Image30 = Image30
	
	local Image41 = LUI.UIImage.new()
	Image41:setLeftRight( true, false, 1231, 1267 )
	Image41:setTopBottom( false, false, -136.75, -133.25 )
	Image41:setZRot( 180 )
	Image41:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image41:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image41 )
	self.Image41 = Image41
	
	local LineSide00 = LUI.UIImage.new()
	LineSide00:setLeftRight( true, false, 1246.5, 1251.5 )
	LineSide00:setTopBottom( true, false, 230, 460.38 )
	LineSide00:setAlpha( 0.8 )
	LineSide00:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide00 )
	self.LineSide00 = LineSide00
	
	local UnlockTokensWidget = CoD.UnlockTokensWidget.new( self, controller )
	UnlockTokensWidget:setLeftRight( false, true, -499, -260 )
	UnlockTokensWidget:setTopBottom( true, false, 148, 192 )
	UnlockTokensWidget.tokenLabel:setTTF( "fonts/escom.ttf" )
	self:addElement( UnlockTokensWidget )
	self.UnlockTokensWidget = UnlockTokensWidget
	
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f13_local0 = nil
		SetModelFromPerControllerTable( controller, self, "UnlockTokenInfo" )
		if not f13_local0 then
			f13_local0 = self:dispatchEventToChildren( event )
		end
		return f13_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		ClearSavedState( self, controller )
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
	background:setModel( self.buttonModel, controller )
	buttonList.id = "buttonList"
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.background:close()
		element.buttonList:close()
		element.UnlockTokensWidget:close()
		element.previewImage:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "UnlockConfirmation.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

