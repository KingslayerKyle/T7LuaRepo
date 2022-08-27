-- 63b6323dd730d36ddfe2e480fab755ee
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BackgroundFrames.CACFullPopupBackground" )
require( "ui.uieditor.widgets.CAC.OverCapacityItem" )
require( "ui.uieditor.widgets.CAC.popup_warninglabel" )
require( "ui.uieditor.widgets.Pregame.Pregame_TimerOverlay" )
require( "ui.uieditor.widgets.Scrollbars.horizontalCounterHide" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	local f1_local0 = CoD.perController[f1_arg1].overCapacityItemIndex
	local f1_local1 = CoD.perController[f1_arg1].weaponCategory
	local f1_local2 = CoD.perController[f1_arg1].classModel
	if f1_local1 then
		local f1_local3 = Engine.GetItemName( f1_local0 )
		if LUI.startswith( f1_local1, "primaryattachment" ) then
			f1_local3 = Engine.GetAttachmentName( Engine.GetModelValue( Engine.GetModel( f1_local2, "primary.itemIndex" ) ), f1_local0 )
		elseif LUI.startswith( f1_local1, "secondaryattachment" ) then
			f1_local3 = Engine.GetAttachmentName( Engine.GetModelValue( Engine.GetModel( f1_local2, "secondary.itemIndex" ) ), f1_local0 )
		elseif LUI.startswith( f1_local1, "primarygadgetattachment" ) then
			f1_local3 = Engine.GetItemName( Engine.GetModelValue( Engine.GetModel( f1_local2, "primarygadget.itemIndex" ) ) )
		elseif LUI.startswith( f1_local1, "secondarygadgetattachment" ) then
			f1_local3 = Engine.GetItemName( Engine.GetModelValue( Engine.GetModel( f1_local2, "secondarygadget.itemIndex" ) ) )
		end
		f1_arg0.popupwarninglabel.menudescription:setText( Engine.Localize( "MENU_TOO_MANY_ITEMS_DESC_CAPS", Engine.Localize( f1_local3 ) ) )
	end
end

LUI.createMenu.OverCapacity = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "OverCapacity" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "CAC_Overcapacity"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "OverCapacity.buttonPrompts" )
	local f2_local1 = self
	self.anyChildUsesUpdateState = true
	
	local background = CoD.CACFullPopupBackground.new( f2_local1, controller )
	background:setLeftRight( true, false, 0, 1280 )
	background:setTopBottom( true, false, 0, 720 )
	background.StartMenuTitlePopup.StartMenuTitleContainerLOC.StartMenu3dTitle.StartMenu3dTitleLabel.Label0:setText( Engine.Localize( "MENU_TOO_MANY_ITEMS_CAPS" ) )
	background:linkToElementModel( self, nil, false, function ( model )
		background.buttons:setModel( model, controller )
	end )
	self:addElement( background )
	self.background = background
	
	local itemList = LUI.UIList.new( f2_local1, controller, 5, 0, nil, false, false, 0, 0, false, false )
	itemList:makeFocusable()
	itemList:setLeftRight( true, false, 101, 1570 )
	itemList:setTopBottom( true, false, 332, 461 )
	itemList:setWidgetType( CoD.OverCapacityItem )
	itemList:setHorizontalCount( 11 )
	itemList:setSpacing( 5 )
	itemList:setDataSource( "OverCapacityList" )
	itemList:registerEventHandler( "gain_focus", function ( element, event )
		local f4_local0 = nil
		if element.gainFocus then
			f4_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f4_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f2_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f4_local0
	end )
	itemList:registerEventHandler( "lose_focus", function ( element, event )
		local f5_local0 = nil
		if element.loseFocus then
			f5_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f5_local0 = element.super:loseFocus( event )
		end
		return f5_local0
	end )
	f2_local1:AddButtonCallbackFunction( itemList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
		RemoveOverflowItemFromClass( self, f6_arg0, f6_arg2 )
		ClearSavedState( self, f6_arg2 )
		return true
	end, function ( f7_arg0, f7_arg1, f7_arg2 )
		CoD.Menu.SetButtonLabel( f7_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, true )
	self:addElement( itemList )
	self.itemList = itemList
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, false, 57, 93 )
	Image3:setTopBottom( false, false, 101.56, 105.06 )
	Image3:setZRot( 180 )
	Image3:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( true, false, 57, 93 )
	Image4:setTopBottom( false, false, -23.69, -20.19 )
	Image4:setZRot( 180 )
	Image4:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local LineSide0 = LUI.UIImage.new()
	LineSide0:setLeftRight( true, false, 72.5, 77.5 )
	LineSide0:setTopBottom( true, false, 350.06, 440.44 )
	LineSide0:setAlpha( 0.8 )
	LineSide0:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide0 )
	self.LineSide0 = LineSide0
	
	local Image30 = LUI.UIImage.new()
	Image30:setLeftRight( true, false, 1186, 1222 )
	Image30:setTopBottom( false, false, 103.38, 107.06 )
	Image30:setZRot( 360 )
	Image30:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image30:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image30 )
	self.Image30 = Image30
	
	local Image41 = LUI.UIImage.new()
	Image41:setLeftRight( true, false, 1186, 1222 )
	Image41:setTopBottom( false, false, -22.75, -19.25 )
	Image41:setZRot( 360 )
	Image41:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image41:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image41 )
	self.Image41 = Image41
	
	local LineSide00 = LUI.UIImage.new()
	LineSide00:setLeftRight( true, false, 1201.5, 1206.5 )
	LineSide00:setTopBottom( true, false, 348.06, 451.44 )
	LineSide00:setAlpha( 0.8 )
	LineSide00:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide00 )
	self.LineSide00 = LineSide00
	
	local Image000000 = LUI.UIImage.new()
	Image000000:setLeftRight( true, false, 1192.5, 1208.5 )
	Image000000:setTopBottom( true, false, 388, 396 )
	Image000000:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image000000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image000000 )
	self.Image000000 = Image000000
	
	local popupwarninglabel = CoD.popup_warninglabel.new( f2_local1, controller )
	popupwarninglabel:setLeftRight( true, false, 57, 790 )
	popupwarninglabel:setTopBottom( true, false, 241.25, 276 )
	popupwarninglabel.menudescription:setText( Engine.Localize( "MENU_TOO_MANY_ITEMS_DESC_CAPS" ) )
	self:addElement( popupwarninglabel )
	self.popupwarninglabel = popupwarninglabel
	
	local custompopupwarninglabel0 = CoD.popup_warninglabel.new( f2_local1, controller )
	custompopupwarninglabel0:setLeftRight( true, false, 57, 790 )
	custompopupwarninglabel0:setTopBottom( true, false, 241.25, 276 )
	custompopupwarninglabel0:setAlpha( 0 )
	custompopupwarninglabel0.menudescription:setText( GetCustomOverCapacityDescription( controller, "MENU_TOO_MANY_ITEMS_CUSTOM_DESC_CAPS" ) )
	self:addElement( custompopupwarninglabel0 )
	self.custompopupwarninglabel0 = custompopupwarninglabel0
	
	local Image000001 = LUI.UIImage.new()
	Image000001:setLeftRight( true, false, 70.5, 86.5 )
	Image000001:setTopBottom( true, false, 390, 398 )
	Image000001:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image000001:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image000001 )
	self.Image000001 = Image000001
	
	local PregameTimerOverlay = CoD.Pregame_TimerOverlay.new( f2_local1, controller )
	PregameTimerOverlay:setLeftRight( true, true, 0, 0 )
	PregameTimerOverlay:setTopBottom( true, true, 0, 0 )
	PregameTimerOverlay:mergeStateConditions( {
		{
			stateName = "OverCapacity",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	PregameTimerOverlay:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.state" ), function ( model )
		f2_local1:updateElementState( PregameTimerOverlay, {
			name = "model_validation",
			menu = f2_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.state"
		} )
	end )
	self:addElement( PregameTimerOverlay )
	self.PregameTimerOverlay = PregameTimerOverlay
	
	local horizontalCounter = CoD.horizontalCounterHide.new( f2_local1, controller )
	horizontalCounter:setLeftRight( false, false, -100, 100 )
	horizontalCounter:setTopBottom( false, true, -215.5, -190.5 )
	horizontalCounter:registerEventHandler( "menu_loaded", function ( element, event )
		local f10_local0 = nil
		SetAsListHorizontalCounter( self, element, "itemList" )
		if not f10_local0 then
			f10_local0 = element:dispatchEventToChildren( event )
		end
		return f10_local0
	end )
	self:addElement( horizontalCounter )
	self.horizontalCounter = horizontalCounter
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				popupwarninglabel:completeAnimation()
				self.popupwarninglabel:setAlpha( 1 )
				self.clipFinished( popupwarninglabel, {} )
				custompopupwarninglabel0:completeAnimation()
				self.custompopupwarninglabel0:setAlpha( 0 )
				self.clipFinished( custompopupwarninglabel0, {} )
			end
		},
		CustomAllocation = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				popupwarninglabel:completeAnimation()
				self.popupwarninglabel:setAlpha( 0 )
				self.clipFinished( popupwarninglabel, {} )
				custompopupwarninglabel0:completeAnimation()
				self.custompopupwarninglabel0:setAlpha( 1 )
				self.clipFinished( custompopupwarninglabel0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "CustomAllocation",
			condition = function ( menu, element, event )
				return not IsClassAllocationInState( controller, 10 )
			end
		}
	} )
	f2_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f14_arg0, f14_arg1, f14_arg2, f14_arg3 )
		GoBack( self, f14_arg2 )
		PlaySoundSetSound( self, "menu_no_selection" )
		ClearSavedState( self, f14_arg2 )
		return true
	end, function ( f15_arg0, f15_arg1, f15_arg2 )
		CoD.Menu.SetButtonLabel( f15_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	f2_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f16_arg0, f16_arg1, f16_arg2, f16_arg3 )
		return true
	end, function ( f17_arg0, f17_arg1, f17_arg2 )
		CoD.Menu.SetButtonLabel( f17_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	background:setModel( self.buttonModel, controller )
	itemList.id = "itemList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f2_local1
	} )
	if not self:restoreState() then
		self.itemList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.background:close()
		element.itemList:close()
		element.popupwarninglabel:close()
		element.custompopupwarninglabel0:close()
		element.PregameTimerOverlay:close()
		element.horizontalCounter:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "OverCapacity.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

