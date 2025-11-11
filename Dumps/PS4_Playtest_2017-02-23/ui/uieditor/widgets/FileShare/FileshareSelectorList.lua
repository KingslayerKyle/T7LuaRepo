require( "ui.uieditor.widgets.FileShare.Fileshare_BuyExtraSlots" )
require( "ui.uieditor.widgets.FileShare.FileshareItemLarge" )
require( "ui.uieditor.widgets.FileShare.FileshareNoContent" )
require( "ui.uieditor.widgets.FileShare.FileshareSelectedItemInfo" )
require( "ui.uieditor.widgets.FileShare.FileshareSelectorListItem" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )

local PostLoadFunc = function ( self, controller )
	local f1_local0 = self.itemList:getDataSource()
	if f1_local0:getCount() == 0 then
		self.FileshareBuyExtraSlots:setAlpha( 0 )
	end
end

CoD.FileshareSelectorList = InheritFrom( LUI.UIElement )
CoD.FileshareSelectorList.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FileshareSelectorList )
	self.id = "FileshareSelectorList"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1380 )
	self:setTopBottom( 0, 0, 0, 792 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( menu, controller )
	LeftPanel:setLeftRight( 0, 0, 30, 495 )
	LeftPanel:setTopBottom( 0, 0, 2, 792 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	LeftPanel:setAlpha( 0 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local itemList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	itemList:makeFocusable()
	itemList:setLeftRight( 0, 0, 46, 466 )
	itemList:setTopBottom( 0, 0, 7, 698 )
	itemList:setWidgetType( CoD.FileshareSelectorListItem )
	itemList:setVerticalCount( 7 )
	itemList:setVerticalCounter( CoD.verticalCounter )
	itemList:setDataSource( "FilesharePublishedList" )
	itemList:linkToElementModel( itemList, "isPublishNew", true, function ( model )
		local element = itemList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isPublishNew"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	itemList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		FileshareSetSelectedItem( self, element, controller, "" )
		return retVal
	end )
	itemList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_START )
		return retVal
	end )
	itemList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( itemList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if IsSelfModelValueEqualTo( element, controller, "isPublishNew", false ) then
			FileshareDeleteCurrentItem( self, element, controller, "", menu )
			return true
		elseif FileshareCanBuyMoreSlots( controller ) then
			OpenBuyExtraSlotsPackDialog( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsSelfModelValueEqualTo( element, controller, "isPublishNew", false ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_DELETE", nil )
			return true
		elseif FileshareCanBuyMoreSlots( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_STORE_CAPS", nil )
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( itemList, controller, Enum.LUIButton.LUI_KEY_START, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "", nil )
		return false
	end, false )
	itemList:subscribeToGlobalModel( controller, "FileshareRoot", "ready", function ( model )
		local element = itemList
		UpdateDataSource( self, element, controller )
	end )
	itemList:subscribeToGlobalModel( controller, "FileshareRoot", "dirty", function ( model )
		local element = itemList
		UpdateDataSource( self, element, controller )
	end )
	self:addElement( itemList )
	self.itemList = itemList
	
	local upperline = LUI.UIImage.new()
	upperline:setLeftRight( 0, 1, 0, 0 )
	upperline:setTopBottom( 0, 0, 2, 5 )
	upperline:setAlpha( 0 )
	self:addElement( upperline )
	self.upperline = upperline
	
	local bottomline = LUI.UIImage.new()
	bottomline:setLeftRight( 0, 1, 0, 0 )
	bottomline:setTopBottom( 0, 0, 788, 791 )
	bottomline:setAlpha( 0 )
	self:addElement( bottomline )
	self.bottomline = bottomline
	
	local header = LUI.UIText.new()
	header:setLeftRight( 0, 0, 55, 664 )
	header:setTopBottom( 0, 0, 1, 39 )
	header:setAlpha( 0 )
	header:setTTF( "fonts/escom.ttf" )
	header:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	header:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	header:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	header:subscribeToGlobalModel( controller, "Customization", "weapon_index", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			header:setText( LocalizeWeaponNameIntoString( "MENU_PAINTSHOP_WEAPON_PAINTJOBS", controller, modelValue ) )
		end
	end )
	self:addElement( header )
	self.header = header
	
	local Loading = LUI.UITightText.new()
	Loading:setLeftRight( 0, 0, 213, 299 )
	Loading:setTopBottom( 0, 0, 293, 331 )
	Loading:setText( Engine.Localize( "MENU_LOADING_DOTS" ) )
	Loading:setTTF( "fonts/default.ttf" )
	Loading:subscribeToGlobalModel( controller, "FileshareRoot", "ready", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Loading:setAlpha( FileshareIsReadyAlphaReverse( modelValue ) )
		end
	end )
	self:addElement( Loading )
	self.Loading = Loading
	
	local FileshareSelectedItemInfo0 = CoD.FileshareSelectedItemInfo.new( menu, controller )
	FileshareSelectedItemInfo0:setLeftRight( 0, 0, 530, 1157 )
	FileshareSelectedItemInfo0:setTopBottom( 0, 0, 640, 766 )
	FileshareSelectedItemInfo0:subscribeToGlobalModel( controller, "FileshareRoot", "showFileDetails", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FileshareSelectedItemInfo0:setAlpha( modelValue )
		end
	end )
	self:addElement( FileshareSelectedItemInfo0 )
	self.FileshareSelectedItemInfo0 = FileshareSelectedItemInfo0
	
	local verticalCounter0 = CoD.verticalCounter.new( menu, controller )
	verticalCounter0:setLeftRight( 0, 0, 106, 406 )
	verticalCounter0:setTopBottom( 0, 0, 728, 766 )
	verticalCounter0:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SetAsListVerticalCounter( self, element, "itemList" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( verticalCounter0 )
	self.verticalCounter0 = verticalCounter0
	
	local FileshareItemLarge = CoD.FileshareItemLarge.new( menu, controller )
	FileshareItemLarge:setLeftRight( 0, 0, 530, 1055 )
	FileshareItemLarge:setTopBottom( 0, 0, -0.5, 524.5 )
	self:addElement( FileshareItemLarge )
	self.FileshareItemLarge = FileshareItemLarge
	
	local FileshareBuyExtraSlots = CoD.Fileshare_BuyExtraSlots.new( menu, controller )
	FileshareBuyExtraSlots:setLeftRight( 0, 0, 530, 1055 )
	FileshareBuyExtraSlots:setTopBottom( 0, 0, 49, 319 )
	self:addElement( FileshareBuyExtraSlots )
	self.FileshareBuyExtraSlots = FileshareBuyExtraSlots
	
	local FileshareNoContent = CoD.FileshareNoContent.new( menu, controller )
	FileshareNoContent:setLeftRight( 0, 0, 68.5, 443.5 )
	FileshareNoContent:setTopBottom( 0, 0, 306, 396 )
	self:addElement( FileshareNoContent )
	self.FileshareNoContent = FileshareNoContent
	
	FileshareSelectedItemInfo0:linkToElementModel( itemList, nil, false, function ( model )
		FileshareSelectedItemInfo0:setModel( model, controller )
	end )
	FileshareItemLarge:linkToElementModel( itemList, "showPlusImage", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FileshareItemLarge:setAlpha( Negate( modelValue ) )
		end
	end )
	FileshareItemLarge:linkToElementModel( itemList, nil, false, function ( model )
		FileshareItemLarge:setModel( model, controller )
	end )
	FileshareBuyExtraSlots:linkToElementModel( itemList, "showPlusImage", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FileshareBuyExtraSlots:setAlpha( modelValue )
		end
	end )
	itemList.navigation = {
		down = verticalCounter0
	}
	verticalCounter0.navigation = {
		up = itemList
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	itemList.id = "itemList"
	verticalCounter0.id = "verticalCounter0"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.itemList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LeftPanel:close()
		self.itemList:close()
		self.FileshareSelectedItemInfo0:close()
		self.verticalCounter0:close()
		self.FileshareItemLarge:close()
		self.FileshareBuyExtraSlots:close()
		self.FileshareNoContent:close()
		self.header:close()
		self.Loading:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

