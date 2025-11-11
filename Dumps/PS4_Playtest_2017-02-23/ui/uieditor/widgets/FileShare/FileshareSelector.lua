require( "ui.uieditor.menus.FileShare.Popups.FileshareOptions" )
require( "ui.uieditor.widgets.CAC.GridItemButtonBackdropContainer2x4" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfoPaneItemName" )
require( "ui.uieditor.widgets.FileShare.FileshareNoContent" )
require( "ui.uieditor.widgets.FileShare.FilesharePublishDetails" )
require( "ui.uieditor.widgets.FileShare.FileshareSelectedItemInfo" )
require( "ui.uieditor.widgets.Fileshare.FileshareSelectorItem" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )

local PostLoadFunc = function ( self, controller, menu )
	self:subscribeToGlobalModel( controller, "FileshareRoot", "itemsCount", function ( model )
		if self.itemName then
			if FileshareHasContent( nil, controller ) == true then
				self.itemName:setAlpha( 1 )
			else
				self.itemName:setAlpha( 0 )
			end
		end
	end )
end

CoD.FileshareSelector = InheritFrom( LUI.UIElement )
CoD.FileshareSelector.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FileshareSelector )
	self.id = "FileshareSelector"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1380 )
	self:setTopBottom( 0, 0, 0, 792 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( menu, controller )
	LeftPanel:setLeftRight( 0, 0, 0, 552 )
	LeftPanel:setTopBottom( 0, 0, -48, 916 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local FileshareNoContent = CoD.FileshareNoContent.new( menu, controller )
	FileshareNoContent:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f4_local0
				if not FileshareHasContent( element, controller ) then
					f4_local0 = not FileshareShowcaseIsPublishMode( element, controller )
				else
					f4_local0 = false
				end
				return f4_local0
			end
		}
	} )
	FileshareNoContent:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot.itemsCount" ), function ( model )
		menu:updateElementState( FileshareNoContent, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.itemsCount"
		} )
	end )
	FileshareNoContent:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "FileshareRoot.PublishMode" ), function ( model )
		menu:updateElementState( FileshareNoContent, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "FileshareRoot.PublishMode"
		} )
	end )
	FileshareNoContent:setLeftRight( 0, 0, 86, 448 )
	FileshareNoContent:setTopBottom( 0, 0, 334, 434 )
	self:addElement( FileshareNoContent )
	self.FileshareNoContent = FileshareNoContent
	
	local listBacking = LUI.UIImage.new()
	listBacking:setLeftRight( 0, 0, 22, 582 )
	listBacking:setTopBottom( 0, 0, 38, 732 )
	listBacking:setRGB( 0.74, 0.82, 0.86 )
	listBacking:setAlpha( 0 )
	self:addElement( listBacking )
	self.listBacking = listBacking
	
	local GridItemButtonBackdropContainer2x40 = CoD.GridItemButtonBackdropContainer2x4.new( menu, controller )
	GridItemButtonBackdropContainer2x40:setLeftRight( 0, 0, 10, 582 )
	GridItemButtonBackdropContainer2x40:setTopBottom( 0, 0, 38, 720 )
	GridItemButtonBackdropContainer2x40:setAlpha( 0.5 )
	self:addElement( GridItemButtonBackdropContainer2x40 )
	self.GridItemButtonBackdropContainer2x40 = GridItemButtonBackdropContainer2x40
	
	local itemList = LUI.UIList.new( menu, controller, 10, 0, nil, true, false, 0, 0, false, false )
	itemList:makeFocusable()
	itemList:setLeftRight( 0, 0, 21.5, 527.5 )
	itemList:setTopBottom( 0, 0, 21, 699 )
	itemList:setWidgetType( CoD.FileshareSelectorItem )
	itemList:setHorizontalCount( 3 )
	itemList:setVerticalCount( 4 )
	itemList:setSpacing( 10 )
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
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_START )
	end )
	itemList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		if not IsSelfModelValueTrue( element, controller, "isPublishNew" ) then
			FileshareSetSelectedItem( self, element, controller, "" )
			FileshareSetShowPublishNewDetails( controller, false )
			SetElementStateByElementName( self, "itemName", controller, "Equipped" )
		elseif IsSelfModelValueTrue( element, controller, "isPublishNew" ) then
			FileshareSetShowPublishNewDetails( controller, true )
			FileshareSetShowFileDetails( controller, false )
			MediaManagerClearDisplay( self, element, controller )
			SetElementStateByElementName( self, "itemName", controller, "Hidden" )
		end
		return retVal
	end )
	itemList:registerEventHandler( "list_item_lose_focus", function ( element, event )
		local retVal = nil
		FileshareItemLoseFocus( element )
		return retVal
	end )
	itemList:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		if FileshareIsCommunityMode( element, controller ) then
			SetElementDataSource( self, "itemList", "FileshareCommunityList" )
		elseif not FileshareIsCommunityMode( element, controller ) then
			SetElementDataSource( self, "itemList", "FilesharePublishedList" )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
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
	menu:AddButtonCallbackFunction( itemList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsSelfModelValueTrue( element, controller, "isPublishNew" ) then
			FileshareSetShowcasePublishMode( controller, true )
			return true
		elseif not IsSelfModelValueTrue( element, controller, "isPublishNew" ) and FileshareCanOpenDetailsView( element, controller ) then
			FileshareSetSelectedItem( self, element, controller, "true" )
			FileshareOpenFullscreenView( self, element, controller, menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		if IsSelfModelValueTrue( element, controller, "isPublishNew" ) then
			return true
		elseif not IsSelfModelValueTrue( element, controller, "isPublishNew" ) and FileshareCanOpenDetailsView( element, controller ) then
			return true
		else
			return false
		end
	end, true )
	menu:AddButtonCallbackFunction( itemList, controller, Enum.LUIButton.LUI_KEY_START, "O", function ( element, menu, controller, model )
		if not IsSelfModelValueTrue( element, controller, "isPublishNew" ) and FileshareCanShowOptionsMenu( controller ) then
			OpenPopup( self, "FileshareOptions", controller, "", "" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsSelfModelValueTrue( element, controller, "isPublishNew" ) and FileshareCanShowOptionsMenu( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS", nil )
			return true
		else
			return false
		end
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
	Loading:setLeftRight( 0, 0, 224, 310 )
	Loading:setTopBottom( 0, 0, 367, 404 )
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
	FileshareSelectedItemInfo0:setLeftRight( 0, 0, 582, 1209 )
	FileshareSelectedItemInfo0:setTopBottom( 0, 0, 666, 792 )
	FileshareSelectedItemInfo0:subscribeToGlobalModel( controller, "FileshareRoot", "showFileDetails", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FileshareSelectedItemInfo0:setAlpha( modelValue )
		end
	end )
	self:addElement( FileshareSelectedItemInfo0 )
	self.FileshareSelectedItemInfo0 = FileshareSelectedItemInfo0
	
	local FilesharePublishDetails0 = CoD.FilesharePublishDetails.new( menu, controller )
	FilesharePublishDetails0:setLeftRight( 0, 0, 596, 1085 )
	FilesharePublishDetails0:setTopBottom( 0, 0, 0.5, 711.5 )
	FilesharePublishDetails0:setScale( 0.9 )
	FilesharePublishDetails0:subscribeToGlobalModel( controller, "FileshareRoot", "showPublishNewDetails", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FilesharePublishDetails0:setAlpha( modelValue )
		end
	end )
	self:addElement( FilesharePublishDetails0 )
	self.FilesharePublishDetails0 = FilesharePublishDetails0
	
	local verticalCounter0 = CoD.verticalCounter.new( menu, controller )
	verticalCounter0:setLeftRight( 0, 0, 124, 424 )
	verticalCounter0:setTopBottom( 0, 0, 717, 755 )
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
	
	local itemName = CoD.InfoPaneItemName.new( menu, controller )
	itemName:mergeStateConditions( {
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				return true
			end
		},
		{
			stateName = "Available",
			condition = function ( menu, element, event )
				return true
			end
		},
		{
			stateName = "NotEquippable",
			condition = function ( menu, element, event )
				return true
			end
		},
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				return true
			end
		}
	} )
	itemName:setLeftRight( 0, 0, 582, 1154 )
	itemName:setTopBottom( 0, 0, 20.5, 71.5 )
	self:addElement( itemName )
	self.itemName = itemName
	
	FileshareSelectedItemInfo0:linkToElementModel( itemList, nil, false, function ( model )
		FileshareSelectedItemInfo0:setModel( model, controller )
	end )
	itemName:linkToElementModel( itemList, nil, false, function ( model )
		itemName:setModel( model, controller )
	end )
	itemName:linkToElementModel( itemList, "weaponName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemName.weaponNameWithVariant.itemName.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	itemName:linkToElementModel( itemList, "showPlusImage", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemName.weaponNameWithVariant.variantName:setAlpha( Negate( modelValue ) )
		end
	end )
	itemName:linkToElementModel( itemList, "fileName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemName.weaponNameWithVariant.variantName.itemName:setText( Engine.Localize( modelValue ) )
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
		self.FileshareNoContent:close()
		self.GridItemButtonBackdropContainer2x40:close()
		self.itemList:close()
		self.FileshareSelectedItemInfo0:close()
		self.FilesharePublishDetails0:close()
		self.verticalCounter0:close()
		self.itemName:close()
		self.header:close()
		self.Loading:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

