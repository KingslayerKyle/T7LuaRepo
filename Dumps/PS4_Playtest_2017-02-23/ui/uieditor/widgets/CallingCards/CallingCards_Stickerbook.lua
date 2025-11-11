require( "ui.uieditor.widgets.CallingCards.CallingCards_CardWidget" )
require( "ui.uieditor.widgets.Challenges.Challenges_CallingCardProfiler" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )

local PostLoadFunc = function ( self, controller )
	self:registerEventHandler( "update_tier_list", function ( self, event )
		self.CallingCardProfiler.TierList:updateDataSource()
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
	self:setLeftRight( 0, 0, 0, 1725 )
	self:setTopBottom( 0, 0, 0, 780 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local CallingCardGrid = LUI.UIList.new( menu, controller, 15, 0, nil, true, false, 0, 0, false, false )
	CallingCardGrid:makeFocusable()
	CallingCardGrid:setLeftRight( 0, 0, 15, 1125 )
	CallingCardGrid:setTopBottom( 0, 0, 24, 744 )
	CallingCardGrid:setWidgetType( CoD.CallingCards_CardWidget )
	CallingCardGrid:setHorizontalCount( 3 )
	CallingCardGrid:setVerticalCount( 7 )
	CallingCardGrid:setSpacing( 15 )
	CallingCardGrid:setVerticalCounter( CoD.verticalCounter )
	CallingCardGrid:setDataSource( "CallingCardsSorted" )
	CallingCardGrid:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		if IsElementInState( element, "New" ) then
			CallingCards_SetOld( element, controller )
			UpdateSelfElementState( menu, element, controller )
		end
		return retVal
	end )
	CallingCardGrid:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	CallingCardGrid:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( CallingCardGrid, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsElementInState( element, "Locked" ) then
			CallingCards_SetPlayerBackground( menu, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsElementInState( element, "Locked" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( CallingCardGrid )
	self.CallingCardGrid = CallingCardGrid
	
	local CallingCardProfiler = CoD.Challenges_CallingCardProfiler.new( menu, controller )
	CallingCardProfiler:setLeftRight( 1, 1, -568.5, -43.5 )
	CallingCardProfiler:setTopBottom( 0, 1, 21, -33 )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.CallingCardGrid:close()
		self.CallingCardProfiler:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

