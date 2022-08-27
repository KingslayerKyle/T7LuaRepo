-- 0b6fee286162f554f3c9274750e4ffce
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.FileShare.FileshareSelectorListItem" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.FileShare.FileshareSelectedItemInfo" )
require( "ui.uieditor.widgets.FileShare.FileshareItemLarge" )
require( "ui.uieditor.widgets.FileShare.Fileshare_BuyExtraSlots" )
require( "ui.uieditor.widgets.FileShare.FileshareNoContent" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	local f1_local0 = f1_arg0.itemList:getDataSource()
	if f1_local0:getCount() == 0 then
		f1_arg0.FileshareBuyExtraSlots:setAlpha( 0 )
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
	self:setLeftRight( true, false, 0, 920 )
	self:setTopBottom( true, false, 0, 528 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( menu, controller )
	LeftPanel:setLeftRight( true, false, 20, 330 )
	LeftPanel:setTopBottom( true, false, 1, 528 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	LeftPanel:setAlpha( 0 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local itemList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	itemList:makeFocusable()
	itemList:setLeftRight( true, false, 31, 311 )
	itemList:setTopBottom( true, false, 1.35, 468.35 )
	itemList:setWidgetType( CoD.FileshareSelectorListItem )
	itemList:setVerticalCount( 7 )
	itemList:setVerticalCounter( CoD.verticalCounter )
	itemList:setDataSource( "FilesharePublishedList" )
	itemList:linkToElementModel( itemList, "isPublishNew", true, function ( model )
		local f3_local0 = itemList
		local f3_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isPublishNew"
		}
		CoD.Menu.UpdateButtonShownState( f3_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	itemList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f4_local0 = nil
		FileshareSetSelectedItem( self, element, controller, "" )
		return f4_local0
	end )
	itemList:registerEventHandler( "gain_focus", function ( element, event )
		local f5_local0 = nil
		if element.gainFocus then
			f5_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f5_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_START )
		return f5_local0
	end )
	itemList:registerEventHandler( "lose_focus", function ( element, event )
		local f6_local0 = nil
		if element.loseFocus then
			f6_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f6_local0 = element.super:loseFocus( event )
		end
		return f6_local0
	end )
	menu:AddButtonCallbackFunction( itemList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
		if IsSelfModelValueEqualTo( f7_arg0, f7_arg2, "isPublishNew", false ) then
			FileshareDeleteCurrentItem( self, f7_arg0, f7_arg2, "", f7_arg1 )
			return true
		elseif FileshareCanBuyMoreSlots( f7_arg2 ) then
			OpenPurchaseExtraSlotsOverlay( self, f7_arg2, f7_arg1 )
			return true
		else
			
		end
	end, function ( f8_arg0, f8_arg1, f8_arg2 )
		if IsSelfModelValueEqualTo( f8_arg0, f8_arg2, "isPublishNew", false ) then
			CoD.Menu.SetButtonLabel( f8_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_DELETE" )
			return true
		elseif FileshareCanBuyMoreSlots( f8_arg2 ) then
			CoD.Menu.SetButtonLabel( f8_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_STORE_CAPS" )
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( itemList, controller, Enum.LUIButton.LUI_KEY_START, nil, function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
		return true
	end, function ( f10_arg0, f10_arg1, f10_arg2 )
		CoD.Menu.SetButtonLabel( f10_arg1, Enum.LUIButton.LUI_KEY_START, "" )
		return false
	end, false )
	itemList:subscribeToGlobalModel( controller, "FileshareRoot", "ready", function ( model )
		local f11_local0 = itemList
		if FileshareCanBuyMoreSlots( controller ) then
			FileshareSetShowCreateButton( controller, true )
			UpdateDataSource( self, f11_local0, controller )
		else
			FileshareSetShowCreateButton( controller, false )
			UpdateDataSource( self, f11_local0, controller )
		end
	end )
	itemList:subscribeToGlobalModel( controller, "FileshareRoot", "dirty", function ( model )
		local f12_local0 = itemList
		if FileshareCanBuyMoreSlots( controller ) then
			FileshareSetShowCreateButton( controller, true )
			UpdateDataSource( self, f12_local0, controller )
		else
			FileshareSetShowCreateButton( controller, false )
			UpdateDataSource( self, f12_local0, controller )
		end
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
	
	local FileshareItemLarge = CoD.FileshareItemLarge.new( menu, controller )
	FileshareItemLarge:setLeftRight( true, false, 353, 703 )
	FileshareItemLarge:setTopBottom( true, false, 0, 350 )
	self:addElement( FileshareItemLarge )
	self.FileshareItemLarge = FileshareItemLarge
	
	local FileshareBuyExtraSlots = CoD.Fileshare_BuyExtraSlots.new( menu, controller )
	FileshareBuyExtraSlots:setLeftRight( true, false, 353, 703 )
	FileshareBuyExtraSlots:setTopBottom( true, false, 33, 213 )
	self:addElement( FileshareBuyExtraSlots )
	self.FileshareBuyExtraSlots = FileshareBuyExtraSlots
	
	local FileshareNoContent = CoD.FileshareNoContent.new( menu, controller )
	FileshareNoContent:setLeftRight( true, false, 46, 296 )
	FileshareNoContent:setTopBottom( true, false, 204, 264 )
	self:addElement( FileshareNoContent )
	self.FileshareNoContent = FileshareNoContent
	
	FileshareSelectedItemInfo0:linkToElementModel( itemList, nil, false, function ( model )
		FileshareSelectedItemInfo0:setModel( model, controller )
	end )
	FileshareItemLarge:linkToElementModel( itemList, "showPlusImage", true, function ( model )
		local showPlusImage = Engine.GetModelValue( model )
		if showPlusImage then
			FileshareItemLarge:setAlpha( Negate( showPlusImage ) )
		end
	end )
	FileshareItemLarge:linkToElementModel( itemList, nil, false, function ( model )
		FileshareItemLarge:setModel( model, controller )
	end )
	FileshareBuyExtraSlots:linkToElementModel( itemList, "showPlusImage", true, function ( model )
		local showPlusImage = Engine.GetModelValue( model )
		if showPlusImage then
			FileshareBuyExtraSlots:setAlpha( showPlusImage )
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
		if IsGlobalModelValueEqualTo( self, controller, "FileshareRoot.itemsCount", 0 ) then
			HideElement( self, "FileshareItemLarge" )
		end
	end )
	itemList.id = "itemList"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.itemList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LeftPanel:close()
		element.itemList:close()
		element.FileshareSelectedItemInfo0:close()
		element.FileshareItemLarge:close()
		element.FileshareBuyExtraSlots:close()
		element.FileshareNoContent:close()
		element.header:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

