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
	self:setLeftRight( true, false, 0, 400 )
	self:setTopBottom( true, false, 0, 114 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local titleBacking = LUI.UIImage.new()
	titleBacking:setLeftRight( true, true, 0, -14 )
	titleBacking:setTopBottom( true, false, 0, 24 )
	titleBacking:setRGB( 0, 0, 0 )
	titleBacking:setAlpha( 0.5 )
	titleBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( titleBacking )
	self.titleBacking = titleBacking
	
	local title = LUI.UITightText.new()
	title:setLeftRight( true, false, 5, 205 )
	title:setTopBottom( true, false, 3, 23 )
	title:setRGB( 1, 1, 1 )
	title:setText( Engine.Localize( LocalizeToUpperString( "MPUI_SELECTED_SCORE_STREAKS" ) ) )
	title:setTTF( "fonts/Entovo.ttf" )
	self:addElement( title )
	self.title = title
	
	local bodyBacking = LUI.UIImage.new()
	bodyBacking:setLeftRight( true, true, 0, -14 )
	bodyBacking:setTopBottom( true, true, 24, 14 )
	bodyBacking:setRGB( 0, 0, 0 )
	bodyBacking:setAlpha( 0.1 )
	bodyBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( bodyBacking )
	self.bodyBacking = bodyBacking
	
	local scorestreaks = LUI.UIList.new( menu, controller, 44, 0, nil, false, false, 0, 0, false, false )
	scorestreaks:makeFocusable()
	scorestreaks:setLeftRight( true, false, 5, 381 )
	scorestreaks:setTopBottom( true, false, 29, 125 )
	scorestreaks:setRGB( 1, 1, 1 )
	scorestreaks:setDataSource( "EquippedScorestreaksList" )
	scorestreaks:setWidgetType( CoD.equippedScoreStreaksButton )
	scorestreaks:setHorizontalCount( 3 )
	scorestreaks:setSpacing( 44 )
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
	self.close = function ( self )
		self.scorestreaks:close()
		CoD.equippedScoreStreaksList.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

