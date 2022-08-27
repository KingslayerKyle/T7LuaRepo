-- 99d934c25aeb5d32aa4d1282b6673102
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemDrawWidgetNew" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemItem" )
require( "ui.uieditor.widgets.Scrollbars.verticalScrollbar" )

CoD.GroupMyEmblemsTab = InheritFrom( LUI.UIElement )
CoD.GroupMyEmblemsTab.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GroupMyEmblemsTab )
	self.id = "GroupMyEmblemsTab"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1152 )
	self:setTopBottom( true, false, 0, 461 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, false, 0, 1149.74 )
	Background:setTopBottom( true, false, 0, 485.57 )
	Background:setRGB( 0, 0, 0 )
	Background:setAlpha( 0 )
	Background:setScale( 1.1 )
	self:addElement( Background )
	self.Background = Background
	
	local emblemDrawWidget = CoD.EmblemDrawWidgetNew.new( menu, controller )
	emblemDrawWidget:setLeftRight( true, false, 695.88, 1129 )
	emblemDrawWidget:setTopBottom( true, false, 33, 305 )
	self:addElement( emblemDrawWidget )
	self.emblemDrawWidget = emblemDrawWidget
	
	local emblemList = LUI.UIList.new( menu, controller, 7, 0, nil, true, false, 0, 0, false, false )
	emblemList:makeFocusable()
	emblemList:setLeftRight( true, false, 32.87, 574.87 )
	emblemList:setTopBottom( true, false, 33, 371 )
	emblemList:setDataSource( "GroupsGroupEmblemsList" )
	emblemList:setWidgetType( CoD.EmblemItem )
	emblemList:setHorizontalCount( 3 )
	emblemList:setVerticalCount( 3 )
	emblemList:setSpacing( 7 )
	emblemList:setVerticalScrollbar( CoD.verticalScrollbar )
	emblemList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f2_local0 = nil
		EmblemSelect_GainFocus( self, element, controller )
		return f2_local0
	end )
	emblemList:registerEventHandler( "gain_focus", function ( element, event )
		local f3_local0 = nil
		if element.gainFocus then
			f3_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f3_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f3_local0
	end )
	emblemList:registerEventHandler( "lose_focus", function ( element, event )
		local f4_local0 = nil
		if element.loseFocus then
			f4_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f4_local0 = element.super:loseFocus( event )
		end
		return f4_local0
	end )
	menu:AddButtonCallbackFunction( emblemList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
		if Emblem_IsOccupied( f5_arg0, f5_arg2 ) then
			PlaySoundSetSound( self, "toggle" )
			GroupEmblemSelect_SetAsEmblem( self, f5_arg0, f5_arg2 )
			GroupEmblemSelect_Back( self, f5_arg0, f5_arg2, f5_arg1 )
			GoBack( self, f5_arg2 )
			return true
		else
			
		end
	end, function ( f6_arg0, f6_arg1, f6_arg2 )
		CoD.Menu.SetButtonLabel( f6_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SET_AS_EMBLEM" )
		if Emblem_IsOccupied( f6_arg0, f6_arg2 ) then
			return true
		else
			return false
		end
	end, false )
	emblemList:mergeStateConditions( {
		{
			stateName = "EmptySlot",
			condition = function ( menu, element, event )
				return not Emblem_IsOccupied( element, controller )
			end
		}
	} )
	self:addElement( emblemList )
	self.emblemList = emblemList
	
	emblemDrawWidget.navigation = {
		left = emblemList
	}
	emblemList.navigation = {
		right = emblemDrawWidget
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	emblemDrawWidget.id = "emblemDrawWidget"
	emblemList.id = "emblemList"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.emblemList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.emblemDrawWidget:close()
		element.emblemList:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

