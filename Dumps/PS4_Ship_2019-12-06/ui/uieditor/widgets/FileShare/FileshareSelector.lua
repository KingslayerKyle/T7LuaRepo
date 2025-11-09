require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.CAC.GridItemButtonBackdropContainer2x4" )
require( "ui.uieditor.menus.FileShare.Popups.FileshareOptions" )
require( "ui.uieditor.widgets.Fileshare.FileshareSelectorItem" )
require( "ui.uieditor.widgets.FileShare.FileshareSelectedItemInfo" )
require( "ui.uieditor.widgets.FileShare.FilesharePublishDetails" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfoPaneItemName" )

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
	self:setLeftRight( true, false, 0, 920 )
	self:setTopBottom( true, false, 0, 528 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( menu, controller )
	LeftPanel:setLeftRight( true, false, 0, 368 )
	LeftPanel:setTopBottom( true, false, -32.15, 610.85 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local listBacking = LUI.UIImage.new()
	listBacking:setLeftRight( true, false, 15, 388 )
	listBacking:setTopBottom( true, false, 25.35, 488.35 )
	listBacking:setRGB( 0.74, 0.82, 0.86 )
	listBacking:setAlpha( 0 )
	self:addElement( listBacking )
	self.listBacking = listBacking
	
	local GridItemButtonBackdropContainer2x40 = CoD.GridItemButtonBackdropContainer2x4.new( menu, controller )
	GridItemButtonBackdropContainer2x40:setLeftRight( true, false, 7, 388 )
	GridItemButtonBackdropContainer2x40:setTopBottom( true, false, 25.35, 480.35 )
	GridItemButtonBackdropContainer2x40:setAlpha( 0.5 )
	self:addElement( GridItemButtonBackdropContainer2x40 )
	self.GridItemButtonBackdropContainer2x40 = GridItemButtonBackdropContainer2x40
	
	local itemList = LUI.UIList.new( menu, controller, 7, 0, nil, true, false, 0, 0, false, false )
	itemList:makeFocusable()
	itemList:setLeftRight( true, false, 14, 352 )
	itemList:setTopBottom( true, false, 13.35, 466.35 )
	itemList:setWidgetType( CoD.FileshareSelectorItem )
	itemList:setHorizontalCount( 3 )
	itemList:setVerticalCount( 4 )
	itemList:setSpacing( 7 )
	itemList:setDataSource( "FilesharePublishedList" )
	itemList:linkToElementModel( itemList, "isPublishNew", true, function ( model )
		local f4_local0 = itemList
		local f4_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isPublishNew"
		}
		CoD.Menu.UpdateButtonShownState( f4_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( f4_local0, menu, controller, Enum.LUIButton.LUI_KEY_START )
	end )
	itemList:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "FileshareRoot.SelectedFileID" ), function ( model )
		local f5_local0 = itemList
		local f5_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "FileshareRoot.SelectedFileID"
		}
		CoD.Menu.UpdateButtonShownState( f5_local0, menu, controller, Enum.LUIButton.LUI_KEY_START )
	end )
	itemList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f6_local0 = nil
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
		return f6_local0
	end )
	itemList:registerEventHandler( "list_item_lose_focus", function ( element, event )
		local f7_local0 = nil
		FileshareItemLoseFocus( element )
		return f7_local0
	end )
	itemList:registerEventHandler( "menu_loaded", function ( element, event )
		local f8_local0 = nil
		if FileshareIsCommunityMode( element, controller ) then
			SetElementDataSource( self, "itemList", "FileshareCommunityList" )
		elseif not FileshareIsCommunityMode( element, controller ) then
			SetElementDataSource( self, "itemList", "FilesharePublishedList" )
		end
		if not f8_local0 then
			f8_local0 = element:dispatchEventToChildren( event )
		end
		return f8_local0
	end )
	itemList:registerEventHandler( "gain_focus", function ( element, event )
		local f9_local0 = nil
		if element.gainFocus then
			f9_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f9_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_START )
		return f9_local0
	end )
	itemList:registerEventHandler( "lose_focus", function ( element, event )
		local f10_local0 = nil
		if element.loseFocus then
			f10_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f10_local0 = element.super:loseFocus( event )
		end
		return f10_local0
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
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
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS" )
			return true
		else
			return false
		end
	end, false )
	itemList:subscribeToGlobalModel( controller, "FileshareRoot", "ready", function ( model )
		local f15_local0 = itemList
		if FileshareIsReady( controller ) then
			UpdateDataSource( self, f15_local0, controller )
		end
	end )
	itemList:subscribeToGlobalModel( controller, "FileshareRoot", "dirty", function ( model )
		UpdateDataSource( self, itemList, controller )
	end )
	self:addElement( itemList )
	self.itemList = itemList
	
	local upperline = LUI.UIImage.new()
	upperline:setLeftRight( true, true, 0, 0 )
	upperline:setTopBottom( true, false, 1.35, 3.35 )
	upperline:setAlpha( 0 )
	self:addElement( upperline )
	self.upperline = upperline
	
	local bottomline = LUI.UIImage.new()
	bottomline:setLeftRight( true, true, 0, 0 )
	bottomline:setTopBottom( true, false, 525.28, 527.28 )
	bottomline:setAlpha( 0 )
	self:addElement( bottomline )
	self.bottomline = bottomline
	
	local header = LUI.UIText.new()
	header:setLeftRight( true, false, 37, 443 )
	header:setTopBottom( true, false, 1, 26 )
	header:setAlpha( 0 )
	header:setTTF( "fonts/escom.ttf" )
	header:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	header:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	header:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	header:subscribeToGlobalModel( controller, "Customization", "weapon_index", function ( model )
		local weaponIndex = Engine.GetModelValue( model )
		if weaponIndex then
			header:setText( LocalizeWeaponNameIntoString( "MENU_PAINTSHOP_WEAPON_PAINTJOBS", "mp", controller, weaponIndex ) )
		end
	end )
	self:addElement( header )
	self.header = header
	
	local FileshareSelectedItemInfo0 = CoD.FileshareSelectedItemInfo.new( menu, controller )
	FileshareSelectedItemInfo0:setLeftRight( true, false, 388, 806 )
	FileshareSelectedItemInfo0:setTopBottom( true, false, 444, 528 )
	FileshareSelectedItemInfo0:subscribeToGlobalModel( controller, "FileshareRoot", "showFileDetails", function ( model )
		local showFileDetails = Engine.GetModelValue( model )
		if showFileDetails then
			FileshareSelectedItemInfo0:setAlpha( showFileDetails )
		end
	end )
	self:addElement( FileshareSelectedItemInfo0 )
	self.FileshareSelectedItemInfo0 = FileshareSelectedItemInfo0
	
	local FilesharePublishDetails0 = CoD.FilesharePublishDetails.new( menu, controller )
	FilesharePublishDetails0:setLeftRight( true, false, 397.5, 723.5 )
	FilesharePublishDetails0:setTopBottom( true, false, 0, 474 )
	FilesharePublishDetails0:setScale( 0.9 )
	FilesharePublishDetails0:subscribeToGlobalModel( controller, "FileshareRoot", "showPublishNewDetails", function ( model )
		local showPublishNewDetails = Engine.GetModelValue( model )
		if showPublishNewDetails then
			FilesharePublishDetails0:setAlpha( showPublishNewDetails )
		end
	end )
	self:addElement( FilesharePublishDetails0 )
	self.FilesharePublishDetails0 = FilesharePublishDetails0
	
	local verticalCounter0 = CoD.verticalCounter.new( menu, controller )
	verticalCounter0:setLeftRight( true, false, 83, 283 )
	verticalCounter0:setTopBottom( true, false, 478.35, 503.35 )
	verticalCounter0:registerEventHandler( "menu_loaded", function ( element, event )
		local f20_local0 = nil
		SetAsListVerticalCounter( self, element, "itemList" )
		if not f20_local0 then
			f20_local0 = element:dispatchEventToChildren( event )
		end
		return f20_local0
	end )
	self:addElement( verticalCounter0 )
	self.verticalCounter0 = verticalCounter0
	
	local itemName = CoD.InfoPaneItemName.new( menu, controller )
	itemName:setLeftRight( true, false, 388, 769 )
	itemName:setTopBottom( true, false, 13.5, 47.5 )
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
	self:addElement( itemName )
	self.itemName = itemName
	
	FileshareSelectedItemInfo0:linkToElementModel( itemList, nil, false, function ( model )
		FileshareSelectedItemInfo0:setModel( model, controller )
	end )
	itemName:linkToElementModel( itemList, nil, false, function ( model )
		itemName:setModel( model, controller )
	end )
	itemName:linkToElementModel( itemList, "weaponName", true, function ( model )
		local weaponName = Engine.GetModelValue( model )
		if weaponName then
			itemName.weaponNameWithVariant.itemName.itemName:setText( Engine.Localize( weaponName ) )
		end
	end )
	itemName:linkToElementModel( itemList, "showPlusImage", true, function ( model )
		local showPlusImage = Engine.GetModelValue( model )
		if showPlusImage then
			itemName.weaponNameWithVariant.variantName:setAlpha( Negate( showPlusImage ) )
		end
	end )
	itemName:linkToElementModel( itemList, "fileName", true, function ( model )
		local fileName = Engine.GetModelValue( model )
		if fileName then
			itemName.weaponNameWithVariant.variantName.itemName:setText( fileName )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				upperline:completeAnimation()
				self.upperline:setAlpha( 0 )
				self.clipFinished( upperline, {} )
				bottomline:completeAnimation()
				self.bottomline:setAlpha( 0 )
				self.clipFinished( bottomline, {} )
			end
		}
	}
	self:subscribeToGlobalModel( controller, "FileshareRoot", "itemsCount", function ( model )
		if IsGlobalModelValueEqualTo( self, controller, "FileshareRoot.itemsCount", 0 ) and FileshareIsCheckingPageFetchThreshold( controller ) then
			HideElement( self, "itemList" )
			HideElement( self, "verticalCounter0" )
			DisableNavigation( self, "itemList" )
		elseif FileshareIsCheckingPageFetchThreshold( controller ) then
			ShowElement( self, "itemList" )
			ShowElement( self, "verticalCounter0" )
			EnableNavigation( self, "itemList" )
		end
	end )
	itemList.id = "itemList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.itemList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LeftPanel:close()
		element.GridItemButtonBackdropContainer2x40:close()
		element.itemList:close()
		element.FileshareSelectedItemInfo0:close()
		element.FilesharePublishDetails0:close()
		element.verticalCounter0:close()
		element.itemName:close()
		element.header:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

