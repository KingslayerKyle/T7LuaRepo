require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.equippedScoreStreaksButton" )

local PostLoadFunc = function ( self )
	local updateStateHandler = self.m_eventHandlers.update_state
	self:registerEventHandler( "update_state", function ( self, event )
		self.scorestreaks:updateDataSource()
		return updateStateHandler( self, event )
	end )
end

CoD.equippedScoreStreaksList = InheritFrom( LUI.UIElement )
CoD.equippedScoreStreaksList.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.equippedScoreStreaksList )
	self.id = "equippedScoreStreaksList"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 128 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local titleBacking = LUI.UIImage.new()
	titleBacking:setLeftRight( true, true, 5, -9 )
	titleBacking:setTopBottom( true, false, 0, 24 )
	titleBacking:setRGB( 0, 0, 0 )
	titleBacking:setAlpha( 0.5 )
	self:addElement( titleBacking )
	self.titleBacking = titleBacking
	
	local title = LUI.UITightText.new()
	title:setLeftRight( true, false, 9, 84 )
	title:setTopBottom( true, false, 3, 23 )
	title:setText( Engine.Localize( LocalizeToUpperString( "MPUI_SELECTED" ) ) )
	title:setTTF( "fonts/escom.ttf" )
	self:addElement( title )
	self.title = title
	
	local bodyBacking = LUI.UIImage.new()
	bodyBacking:setLeftRight( true, true, 5, -9 )
	bodyBacking:setTopBottom( true, true, 24, 0 )
	bodyBacking:setRGB( 0, 0, 0 )
	bodyBacking:setAlpha( 0.1 )
	self:addElement( bodyBacking )
	self.bodyBacking = bodyBacking
	
	local scorestreaks = LUI.UIList.new( menu, controller, 70, 0, nil, false, false, 0, 0, false, false )
	scorestreaks:makeFocusable()
	scorestreaks:setLeftRight( true, false, 10, 465 )
	scorestreaks:setTopBottom( true, false, 29, 125 )
	scorestreaks:setDataSource( "EquippedScorestreaksList" )
	scorestreaks:setWidgetType( CoD.equippedScoreStreaksButton )
	scorestreaks:setHorizontalCount( 3 )
	scorestreaks:setSpacing( 70 )
	self:addElement( scorestreaks )
	self.scorestreaks = scorestreaks
	
	scorestreaks.id = "scorestreaks"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.scorestreaks:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.scorestreaks:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

