require( "ui.uieditor.widgets.BackgroundFrames.CACFullPopupBackground" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WildcardItemButton" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_TitlePopup" )
require( "ui.uieditor.widgets.CAC.cac_wildcardwarningtext" )
require( "ui.uieditor.widgets.CAC.cac_2lines" )
require( "ui.uieditor.widgets.Pregame.Pregame_TimerOverlay" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	local f1_local0 = CoD.perController[f1_arg1].classModel
	local f1_local1 = CoD.perController[f1_arg1].weaponCategory
	local f1_local2 = CoD.perController[f1_arg1].wildcardOverCapacityRefName
	if not f1_local2 then
		f1_local2 = CoD.CACUtility.WildcardNeededForSlot( f1_arg1, f1_local1 )
	end
	if f1_local2 then
		local f1_local3 = Engine.GetModel( Engine.GetModelForController( f1_arg1 ), "CACMenu.curWeaponVariantName" )
		if not CoD.UnlockablesTable then
			CoD.UnlockablesTable = CoD.GetUnlockablesTable( f1_arg1 )
		end
		if CoD.UnlockablesTable then
			for f1_local9, f1_local10 in ipairs( CoD.UnlockablesTable.bonuscard ) do
				local f1_local11 = Engine.GetModel( f1_local10, "ref" )
				if f1_local11 and Engine.GetModelValue( f1_local11 ) == f1_local2 then
					local f1_local7 = Engine.GetModel( f1_local10, "image" )
					local f1_local8 = Engine.ToUpper( Engine.Localize( Engine.GetModelValue( Engine.GetModel( f1_local10, "name" ) ) ) )
					f1_arg0.selectedWildcard:setImage( RegisterImage( Engine.GetModelValue( f1_local7 ) ) )
					if (f1_local1 == "primary" or f1_local1 == "secondary") and f1_local3 then
						f1_arg0.desc.desc:setText( Engine.Localize( "MENU_TOO_MANY_WILDCARDS_WEAPVAR_CAPS", Engine.GetModelValue( f1_local3 ), f1_local8 ) )
					else
						f1_arg0.desc.desc:setText( Engine.Localize( "MENU_TOO_MANY_WILDCARDS_DESC_CAPS", f1_local8 ) )
					end
				end
			end
		end
	end
end

LUI.createMenu.WildcardCapacity = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "WildcardCapacity" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "CAC_Overcapacity"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "WildcardCapacity.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local background = CoD.CACFullPopupBackground.new( self, controller )
	background:setLeftRight( true, false, 0, 1280 )
	background:setTopBottom( true, false, 0, 720 )
	background.StartMenuTitlePopup.StartMenuTitleContainerLOC.StartMenu3dTitle.StartMenu3dTitleLabel.Label0:setText( Engine.Localize( "" ) )
	self:addElement( background )
	self.background = background
	
	local selectedWildcard = LUI.UIImage.new()
	selectedWildcard:setLeftRight( true, false, 100.5, 374.5 )
	selectedWildcard:setTopBottom( true, false, 223.06, 471.22 )
	self:addElement( selectedWildcard )
	self.selectedWildcard = selectedWildcard
	
	local selectionList = LUI.UIList.new( self, controller, 10, 0, nil, true, false, 0, 0, false, false )
	selectionList:makeFocusable()
	selectionList:setLeftRight( true, false, 471, 803 )
	selectionList:setTopBottom( true, false, 281, 423 )
	selectionList:setDataSource( "WildcardOvercapacityList" )
	selectionList:setWidgetType( CoD.WildcardItemButton )
	selectionList:setHorizontalCount( 3 )
	selectionList:setSpacing( 10 )
	selectionList:registerEventHandler( "gain_focus", function ( element, event )
		local f3_local0 = nil
		if element.gainFocus then
			f3_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f3_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f3_local0
	end )
	selectionList:registerEventHandler( "lose_focus", function ( element, event )
		local f4_local0 = nil
		if element.loseFocus then
			f4_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f4_local0 = element.super:loseFocus( event )
		end
		return f4_local0
	end )
	self:AddButtonCallbackFunction( selectionList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		RemoveOverflowWildcardFromClass( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	selectionList:mergeStateConditions( {
		{
			stateName = "ContextualWildcardEquipped",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "ContextualWildcard",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				return IsCACWildcardEquipped( menu, element, controller ) and AlwaysFalse()
			end
		},
		{
			stateName = "WildcardOverCapacityEquipped",
			condition = function ( menu, element, event )
				return IsCACSlotEquipped( menu, element, controller )
			end
		},
		{
			stateName = "WildcardOverCapacity",
			condition = function ( menu, element, event )
				return true
			end
		}
	} )
	selectionList:linkToElementModel( selectionList, "itemIndex", true, function ( model )
		self:updateElementState( selectionList, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( selectionList )
	self.selectionList = selectionList
	
	local StartMenuTitlePopup = CoD.StartMenu_TitlePopup.new( self, controller )
	StartMenuTitlePopup:setLeftRight( true, false, -51, 848 )
	StartMenuTitlePopup:setTopBottom( true, false, 112, 258 )
	StartMenuTitlePopup.StartMenuTitleContainerLOC.StartMenu3dTitle.StartMenu3dTitleLabel.Label0:setText( Engine.Localize( "MENU_TOO_MANY_WILDCARDS" ) )
	self:addElement( StartMenuTitlePopup )
	self.StartMenuTitlePopup = StartMenuTitlePopup
	
	local Image5 = LUI.UIImage.new()
	Image5:setLeftRight( true, false, 805, 841 )
	Image5:setTopBottom( false, false, -79, -75.5 )
	Image5:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image5:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image5 )
	self.Image5 = Image5
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 805, 841 )
	Image0:setTopBottom( false, false, 58.25, 61.75 )
	Image0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 433, 469 )
	Image1:setTopBottom( false, false, -78.75, -75.25 )
	Image1:setZRot( 180 )
	Image1:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, false, 57, 93 )
	Image3:setTopBottom( false, false, 108.56, 112.06 )
	Image3:setZRot( 180 )
	Image3:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( true, false, 57, 93 )
	Image4:setTopBottom( false, false, -138.69, -135.19 )
	Image4:setZRot( 180 )
	Image4:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local LineSide0 = LUI.UIImage.new()
	LineSide0:setLeftRight( true, false, 72.5, 77.5 )
	LineSide0:setTopBottom( true, false, 233.06, 463.44 )
	LineSide0:setAlpha( 0.8 )
	LineSide0:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide0 )
	self.LineSide0 = LineSide0
	
	local Image40 = LUI.UIImage.new()
	Image40:setLeftRight( true, false, 54, 70 )
	Image40:setTopBottom( true, false, 293.06, 345.06 )
	Image40:setZoom( -5 )
	Image40:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	Image40:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image40 )
	self.Image40 = Image40
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, 0, 1280 )
	CategoryListLine:setTopBottom( true, false, 192.83, 200.5 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local Image10 = LUI.UIImage.new()
	Image10:setLeftRight( true, false, 433, 469 )
	Image10:setTopBottom( false, false, 57.5, 61 )
	Image10:setZRot( 180 )
	Image10:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image10:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image10 )
	self.Image10 = Image10
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( true, false, 0, 1280 )
	CategoryListLine0:setTopBottom( true, false, 533.83, 541.5 )
	CategoryListLine0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine0:setAlpha( 0.25 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local Image30 = LUI.UIImage.new()
	Image30:setLeftRight( true, false, 1186, 1222 )
	Image30:setTopBottom( false, false, 109.38, 113.06 )
	Image30:setZRot( 360 )
	Image30:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image30:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image30 )
	self.Image30 = Image30
	
	local Image41 = LUI.UIImage.new()
	Image41:setLeftRight( true, false, 1186, 1222 )
	Image41:setTopBottom( false, false, -137.75, -134.25 )
	Image41:setZRot( 360 )
	Image41:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image41:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image41 )
	self.Image41 = Image41
	
	local LineSide00 = LUI.UIImage.new()
	LineSide00:setLeftRight( true, false, 1201.5, 1206.5 )
	LineSide00:setTopBottom( true, false, 233.06, 463.44 )
	LineSide00:setAlpha( 0.8 )
	LineSide00:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide00 )
	self.LineSide00 = LineSide00
	
	local Image400 = LUI.UIImage.new()
	Image400:setLeftRight( true, false, 1209, 1225 )
	Image400:setTopBottom( true, false, 293, 345 )
	Image400:setZoom( -5 )
	Image400:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	Image400:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image400 )
	self.Image400 = Image400
	
	local CategoryListLine00 = LUI.UIImage.new()
	CategoryListLine00:setLeftRight( true, false, 0, 1280 )
	CategoryListLine00:setTopBottom( true, false, 580.83, 588.5 )
	CategoryListLine00:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine00:setAlpha( 0.25 )
	CategoryListLine00:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine00 )
	self.CategoryListLine00 = CategoryListLine00
	
	local CategoryListLine01 = LUI.UIImage.new()
	CategoryListLine01:setLeftRight( true, false, 0, 1280 )
	CategoryListLine01:setTopBottom( true, false, 130.83, 138.5 )
	CategoryListLine01:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine01:setAlpha( 0.25 )
	CategoryListLine01:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine01 )
	self.CategoryListLine01 = CategoryListLine01
	
	local desc = CoD.cac_wildcardwarningtext.new( self, controller )
	desc:setLeftRight( true, false, 471, 898 )
	desc:setTopBottom( true, false, 223.06, 259.06 )
	desc.desc:setText( Engine.Localize( "MENU_TOO_MANY_WILDCARDS_DESC_CAPS" ) )
	self:addElement( desc )
	self.desc = desc
	
	local cac2lines0 = CoD.cac_2lines.new( self, controller )
	cac2lines0:setLeftRight( true, false, 433, 469 )
	cac2lines0:setTopBottom( true, false, 222.31, 259.06 )
	cac2lines0:setRGB( 0.89, 0.31, 0.07 )
	self:addElement( cac2lines0 )
	self.cac2lines0 = cac2lines0
	
	local PregameTimerOverlay = CoD.Pregame_TimerOverlay.new( self, controller )
	PregameTimerOverlay:setLeftRight( true, true, 0, 0 )
	PregameTimerOverlay:setTopBottom( true, true, 0, 0 )
	PregameTimerOverlay:mergeStateConditions( {
		{
			stateName = "WildcardSelect",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	PregameTimerOverlay:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.state" ), function ( model )
		self:updateElementState( PregameTimerOverlay, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.state"
		} )
	end )
	self:addElement( PregameTimerOverlay )
	self.PregameTimerOverlay = PregameTimerOverlay
	
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		PlaySoundSetSound( self, "menu_no_selection" )
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
	selectionList.id = "selectionList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.selectionList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.background:close()
		element.selectionList:close()
		element.StartMenuTitlePopup:close()
		element.desc:close()
		element.cac2lines0:close()
		element.PregameTimerOverlay:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "WildcardCapacity.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

