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
	self:setLeftRight( 0, 0, 0, 720 )
	self:setTopBottom( 0, 0, 0, 192 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local titleBacking = LUI.UIImage.new()
	titleBacking:setLeftRight( 0, 1, 7, -13 )
	titleBacking:setTopBottom( 0, 0, 0, 36 )
	titleBacking:setRGB( 0, 0, 0 )
	titleBacking:setAlpha( 0.5 )
	self:addElement( titleBacking )
	self.titleBacking = titleBacking
	
	local title = LUI.UITightText.new()
	title:setLeftRight( 0, 0, 14, 126 )
	title:setTopBottom( 0, 0, 5, 35 )
	title:setText( LocalizeToUpperString( "MPUI_SELECTED" ) )
	title:setTTF( "fonts/escom.ttf" )
	self:addElement( title )
	self.title = title
	
	local bodyBacking = LUI.UIImage.new()
	bodyBacking:setLeftRight( 0, 1, 7, -13 )
	bodyBacking:setTopBottom( 0, 1, 36, 0 )
	bodyBacking:setRGB( 0, 0, 0 )
	bodyBacking:setAlpha( 0.1 )
	self:addElement( bodyBacking )
	self.bodyBacking = bodyBacking
	
	local scorestreaks = LUI.UIList.new( menu, controller, 105, 0, nil, false, false, 0, 0, false, false )
	scorestreaks:makeFocusable()
	scorestreaks:setLeftRight( 0, 0, 16, 697 )
	scorestreaks:setTopBottom( 0, 0, 44, 188 )
	scorestreaks:setWidgetType( CoD.equippedScoreStreaksButton )
	scorestreaks:setHorizontalCount( 3 )
	scorestreaks:setSpacing( 105 )
	scorestreaks:setDataSource( "EquippedScorestreaksList" )
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

