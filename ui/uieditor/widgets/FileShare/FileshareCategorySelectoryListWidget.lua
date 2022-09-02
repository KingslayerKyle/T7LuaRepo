-- aa0828419681158471734a9f71445311
-- This hash is used for caching, delete to decompile the file again

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
		spacing = 0
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
	
	local itemList = LUI.UIList.new( menu, controller, 6, 0, nil, false, false, 0, 0, false, false )
	itemList:makeFocusable()
	itemList:setLeftRight( true, false, 0, 280 )
	itemList:setTopBottom( true, false, 0, 442 )
	itemList:setWidgetType( CoD.FileshareCategoriesSelectorListItem )
	itemList:setVerticalCount( 8 )
	itemList:setSpacing( 6 )
	itemList:setDataSource( "FileshareCategoriesList" )
	itemList:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot.fileshareType" ), function ( model )
		local f2_local0 = itemList
		local f2_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.fileshareType"
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
	itemList:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "FileshareRoot.PublishMode" ), function ( model )
		local f4_local0 = itemList
		local f4_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "FileshareRoot.PublishMode"
		}
		CoD.Menu.UpdateButtonShownState( f4_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	itemList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f5_local0 = nil
		FileshareCategorySelectorItemSelected( self, element, controller )
		return f5_local0
	end )
	itemList:registerEventHandler( "gain_focus", function ( element, event )
		local f6_local0 = nil
		if element.gainFocus then
			f6_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f6_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f6_local0
	end )
	itemList:registerEventHandler( "lose_focus", function ( element, event )
		local f7_local0 = nil
		if element.loseFocus then
			f7_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f7_local0 = element.super:loseFocus( event )
		end
		return f7_local0
	end )
	menu:AddButtonCallbackFunction( itemList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
		if not FileshareIsCommunityMode( f8_arg0, f8_arg2 ) and FileshareIsCurrentUserContext( f8_arg2 ) then
			SetState( self, "Selected" )
			OpenShowcase( self, f8_arg0, f8_arg2, "", f8_arg1 )
			return true
		elseif not FileshareIsCommunityMode( f8_arg0, f8_arg2 ) and not FileshareIsCurrentUserContext( f8_arg2 ) and FileshareHasContent( f8_arg0, f8_arg2 ) then
			SetState( self, "Selected" )
			OpenShowcase( self, f8_arg0, f8_arg2, "", f8_arg1 )
			return true
		elseif FileshareIsCommunityMode( f8_arg0, f8_arg2 ) and FileshareHasContent( f8_arg0, f8_arg2 ) then
			SetState( self, "Selected" )
			OpenShowcase( self, f8_arg0, f8_arg2, "", f8_arg1 )
			return true
		else
			
		end
	end, function ( f9_arg0, f9_arg1, f9_arg2 )
		CoD.Menu.SetButtonLabel( f9_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not FileshareIsCommunityMode( f9_arg0, f9_arg2 ) and FileshareIsCurrentUserContext( f9_arg2 ) then
			return true
		elseif not FileshareIsCommunityMode( f9_arg0, f9_arg2 ) and not FileshareIsCurrentUserContext( f9_arg2 ) and FileshareHasContent( f9_arg0, f9_arg2 ) then
			return true
		elseif FileshareIsCommunityMode( f9_arg0, f9_arg2 ) and FileshareHasContent( f9_arg0, f9_arg2 ) then
			return true
		else
			return false
		end
	end, true )
	itemList:mergeStateConditions( {
		{
			stateName = "NoListFocus",
			condition = function ( menu, element, event )
				return not IsParentListInFocus( element )
			end
		}
	} )
	self:addElement( itemList )
	self.itemList = itemList
	
	local TheaterHintText = CoD.Theater_HintText.new( menu, controller )
	TheaterHintText:setLeftRight( true, false, 0, 280 )
	TheaterHintText:setTopBottom( true, false, 442, 467 )
	self:addElement( TheaterHintText )
	self.TheaterHintText = TheaterHintText
	
	TheaterHintText:linkToElementModel( itemList, "hintText", true, function ( model )
		local hintText = Engine.GetModelValue( model )
		if hintText then
			TheaterHintText.ItemHintText:setText( Engine.Localize( hintText ) )
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
		element.itemList:close()
		element.TheaterHintText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

