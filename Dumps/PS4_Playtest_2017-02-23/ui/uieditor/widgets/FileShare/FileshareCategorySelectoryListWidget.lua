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
	self:setLeftRight( 0, 0, 0, 450 )
	self:setTopBottom( 0, 0, 0, 750 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local itemList = LUI.UIList.new( menu, controller, 9, 0, nil, false, false, 0, 0, false, false )
	itemList:makeFocusable()
	itemList:mergeStateConditions( {
		{
			stateName = "NoListFocus",
			condition = function ( menu, element, event )
				return not IsParentListInFocus( element )
			end
		}
	} )
	itemList:setLeftRight( 0, 0, 3, 423 )
	itemList:setTopBottom( 0, 0, -42, 621 )
	itemList:setWidgetType( CoD.FileshareCategoriesSelectorListItem )
	itemList:setVerticalCount( 8 )
	itemList:setSpacing( 9 )
	itemList:setDataSource( "FileshareCategoriesList" )
	itemList:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot.fileshareType" ), function ( model )
		local element = itemList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.fileshareType"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	itemList:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot.itemsCount" ), function ( model )
		local element = itemList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.itemsCount"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	itemList:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "FileshareRoot.PublishMode" ), function ( model )
		local element = itemList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "FileshareRoot.PublishMode"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	itemList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		FileshareCategorySelectorItemSelected( self, element, controller )
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
		if not FileshareIsCommunityMode( element, controller ) and FileshareIsCurrentUserContext( controller ) then
			SetState( self, "Selected" )
			OpenShowcase( self, element, controller, "", menu )
			return true
		elseif not FileshareIsCommunityMode( element, controller ) and not FileshareIsCurrentUserContext( controller ) and FileshareHasContent( element, controller ) then
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		if not FileshareIsCommunityMode( element, controller ) and FileshareIsCurrentUserContext( controller ) then
			return true
		elseif not FileshareIsCommunityMode( element, controller ) and not FileshareIsCurrentUserContext( controller ) and FileshareHasContent( element, controller ) then
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
	TheaterHintText:setLeftRight( 0, 0, 3, 423 )
	TheaterHintText:setTopBottom( 0, 0, 601, 639 )
	self:addElement( TheaterHintText )
	self.TheaterHintText = TheaterHintText
	
	TheaterHintText:linkToElementModel( itemList, "hintText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TheaterHintText.ItemHintText:setText( Engine.Localize( modelValue ) )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.itemList:close()
		self.TheaterHintText:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

