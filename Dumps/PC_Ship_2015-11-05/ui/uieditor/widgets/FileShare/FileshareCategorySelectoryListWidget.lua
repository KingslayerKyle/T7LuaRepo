require( "ui.uieditor.widgets.FileShare.FileshareCategoriesSelectorListItem" )
require( "ui.uieditor.widgets.Theater.Theater_HintText" )

CoD.FileshareCategorySelectoryListWidget = InheritFrom( LUI.UIElement )
CoD.FileshareCategorySelectoryListWidget.new = function ( menu, controller )
	local self = LUI.UIVerticalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 15
	} )
	self:setAlignment( LUI.Alignment.Top )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FileshareCategorySelectoryListWidget )
	self.id = "FileshareCategorySelectoryListWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 300 )
	self:setTopBottom( true, false, 0, 500 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local itemList = LUI.UIList.new( menu, controller, 4, 0, nil, false, false, 0, 0, false, false )
	itemList:makeFocusable()
	itemList:setLeftRight( true, false, 0, 280 )
	itemList:setTopBottom( true, false, 0, 212 )
	itemList:setDataSource( "FileshareCategoriesList" )
	itemList:setWidgetType( CoD.FileshareCategoriesSelectorListItem )
	itemList:setVerticalCount( 4 )
	itemList:setSpacing( 4 )
	itemList:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot.isCommunity" ), function ( model )
		local f2_local0 = itemList
		local f2_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.isCommunity"
		}
		CoD.Menu.UpdateButtonShownState( f2_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	itemList:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot.itemsCount" ), function ( model )
		local f3_local0 = itemList
		local f3_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.itemsCount"
		}
		CoD.Menu.UpdateButtonShownState( f3_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	itemList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f4_local0 = nil
		FileshareCategorySelectorItemSelected( self, element, controller )
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
	menu:AddButtonCallbackFunction( itemList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not FileshareIsCommunityMode( element, controller ) and FileshareHasContent( element, controller ) then
			SetState( self, "Selected" )
			OpenShowcase( self, element, controller, "", menu )
			return true
		elseif FileshareIsCommunityMode( element, controller ) and FileshareHasContent( element, controller ) then
			SetState( self, "Selected" )
			OpenShowcase( self, element, controller, "", menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not FileshareIsCommunityMode( element, controller ) and FileshareHasContent( element, controller ) then
			return true
		elseif FileshareIsCommunityMode( element, controller ) and FileshareHasContent( element, controller ) then
			return true
		else
			return false
		end
	end, true )
	self:addElement( itemList )
	self.itemList = itemList
	
	local TheaterHintText = CoD.Theater_HintText.new( menu, controller )
	TheaterHintText:setLeftRight( true, false, 0, 280 )
	TheaterHintText:setTopBottom( true, false, 227, 252 )
	self:addElement( TheaterHintText )
	self.TheaterHintText = TheaterHintText
	
	TheaterHintText:linkToElementModel( itemList, "hintText", true, function ( model )
		local hintText = Engine.GetModelValue( model )
		if hintText then
			TheaterHintText.ItemHintText:setText( Engine.Localize( hintText ) )
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
		element.itemList:close()
		element.TheaterHintText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

