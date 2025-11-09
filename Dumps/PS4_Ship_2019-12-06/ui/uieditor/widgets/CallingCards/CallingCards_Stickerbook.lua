require( "ui.uieditor.widgets.CallingCards.CallingCards_CardWidget" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.Challenges.Challenges_CallingCardProfiler" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0:registerEventHandler( "update_tier_list", function ( element, event )
		element.CallingCardProfiler.TierList:updateDataSource()
	end )
end

CoD.CallingCards_Stickerbook = InheritFrom( LUI.UIElement )
CoD.CallingCards_Stickerbook.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CallingCards_Stickerbook )
	self.id = "CallingCards_Stickerbook"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 1150 )
	self:setTopBottom( true, false, 0, 520 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local CallingCardGrid = LUI.UIList.new( menu, controller, 10, 0, nil, true, false, 0, 0, false, false )
	CallingCardGrid:makeFocusable()
	CallingCardGrid:setLeftRight( true, false, 10, 750 )
	CallingCardGrid:setTopBottom( true, false, 16, 496 )
	CallingCardGrid:setDataSource( "CallingCardsSorted" )
	CallingCardGrid:setWidgetType( CoD.CallingCards_CardWidget )
	CallingCardGrid:setHorizontalCount( 3 )
	CallingCardGrid:setVerticalCount( 7 )
	CallingCardGrid:setSpacing( 10 )
	CallingCardGrid:setVerticalCounter( CoD.verticalCounter )
	CallingCardGrid:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f4_local0 = nil
		if IsElementInState( element, "New" ) then
			CallingCards_SetOld( element, controller )
			UpdateSelfElementState( menu, element, controller )
		end
		return f4_local0
	end )
	CallingCardGrid:registerEventHandler( "gain_focus", function ( element, event )
		local f5_local0 = nil
		if element.gainFocus then
			f5_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f5_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f5_local0
	end )
	CallingCardGrid:registerEventHandler( "lose_focus", function ( element, event )
		local f6_local0 = nil
		if element.loseFocus then
			f6_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f6_local0 = element.super:loseFocus( event )
		end
		return f6_local0
	end )
	menu:AddButtonCallbackFunction( CallingCardGrid, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsElementInState( element, "Locked" ) then
			CallingCards_SetPlayerBackground( menu, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsElementInState( element, "Locked" ) then
			return true
		else
			return false
		end
	end, false )
	self:addElement( CallingCardGrid )
	self.CallingCardGrid = CallingCardGrid
	
	local CallingCardProfiler = CoD.Challenges_CallingCardProfiler.new( menu, controller )
	CallingCardProfiler:setLeftRight( false, true, -379, -29 )
	CallingCardProfiler:setTopBottom( true, true, 14, -22 )
	self:addElement( CallingCardProfiler )
	self.CallingCardProfiler = CallingCardProfiler
	
	CallingCardProfiler:linkToElementModel( CallingCardGrid, nil, false, function ( model )
		CallingCardProfiler:setModel( model, controller )
	end )
	CallingCardGrid.id = "CallingCardGrid"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.CallingCardGrid:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CallingCardGrid:close()
		element.CallingCardProfiler:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

