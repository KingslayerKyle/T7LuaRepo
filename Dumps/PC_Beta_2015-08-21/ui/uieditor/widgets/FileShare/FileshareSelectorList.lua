require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.FileShare.FileshareSelectorListItem" )
require( "ui.uieditor.widgets.Scrollbars.verticalScrollbar" )
require( "ui.uieditor.widgets.FileShare.FileshareSelectedItemInfo" )

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
	self:setLeftRight( true, false, 0, 920 )
	self:setTopBottom( true, false, 0, 528 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( menu, controller )
	LeftPanel:setLeftRight( true, false, 20, 330 )
	LeftPanel:setTopBottom( true, false, 1, 528 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local itemList = LUI.UIList.new( menu, controller, 2, 0, nil, true, false, 0, 0, false, false )
	itemList:makeFocusable()
	itemList:setLeftRight( true, false, 31, 311 )
	itemList:setTopBottom( true, false, 43.35, 510.35 )
	itemList:setDataSource( "FilesharePublishedList" )
	itemList:setWidgetType( CoD.FileshareSelectorListItem )
	itemList:setVerticalCount( 7 )
	itemList:setVerticalScrollbar( CoD.verticalScrollbar )
	itemList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f2_local0 = nil
		FileshareSetSelectedItem( self, element, controller )
		return f2_local0
	end )
	itemList:registerEventHandler( "gain_focus", function ( element, event )
		local f3_local0 = nil
		if element.gainFocus then
			f3_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f3_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		return f3_local0
	end )
	itemList:registerEventHandler( "lose_focus", function ( element, event )
		local f4_local0 = nil
		if element.loseFocus then
			f4_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f4_local0 = element.super:loseFocus( event )
		end
		return f4_local0
	end )
	menu:AddButtonCallbackFunction( itemList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	menu:AddButtonCallbackFunction( itemList, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, nil, function ( element, menu, controller, model )
		FileshareDeleteCurrentItem( self, element, controller, "", menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_DELETE" )
		return true
	end, false )
	itemList:subscribeToGlobalModel( controller, "FileshareRoot", "ready", function ( model )
		UpdateDataSource( self, itemList, controller )
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
	header:setTTF( "fonts/escom.ttf" )
	header:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	header:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	header:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	header:subscribeToGlobalModel( controller, "Customization", "weapon_index", function ( model )
		local weaponIndex = Engine.GetModelValue( model )
		if weaponIndex then
			header:setText( Engine.Localize( LocalizeWeaponNameIntoString( "MENU_PAINTSHOP_WEAPON_PAINTJOBS", controller, weaponIndex ) ) )
		end
	end )
	self:addElement( header )
	self.header = header
	
	local Loading = LUI.UITightText.new()
	Loading:setLeftRight( true, false, 142.5, 199.5 )
	Loading:setTopBottom( true, false, 195.35, 220.35 )
	Loading:setText( Engine.Localize( "MENU_LOADING_DOTS" ) )
	Loading:setTTF( "fonts/default.ttf" )
	Loading:subscribeToGlobalModel( controller, "FileshareRoot", "ready", function ( model )
		local ready = Engine.GetModelValue( model )
		if ready then
			Loading:setAlpha( FileshareIsReadyAlphaReverse( ready ) )
		end
	end )
	self:addElement( Loading )
	self.Loading = Loading
	
	local FileshareSelectedItemInfo0 = CoD.FileshareSelectedItemInfo.new( menu, controller )
	FileshareSelectedItemInfo0:setLeftRight( true, false, 353, 771 )
	FileshareSelectedItemInfo0:setTopBottom( true, false, 426.35, 510.35 )
	FileshareSelectedItemInfo0:subscribeToGlobalModel( controller, "FileshareRoot", "showFileDetails", function ( model )
		local showFileDetails = Engine.GetModelValue( model )
		if showFileDetails then
			FileshareSelectedItemInfo0:setAlpha( showFileDetails )
		end
	end )
	self:addElement( FileshareSelectedItemInfo0 )
	self.FileshareSelectedItemInfo0 = FileshareSelectedItemInfo0
	
	FileshareSelectedItemInfo0:linkToElementModel( itemList, nil, false, function ( model )
		FileshareSelectedItemInfo0:setModel( model, controller )
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
		element.itemList:close()
		element.FileshareSelectedItemInfo0:close()
		element.header:close()
		element.Loading:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

