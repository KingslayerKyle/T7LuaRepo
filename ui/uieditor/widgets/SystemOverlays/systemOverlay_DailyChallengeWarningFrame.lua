-- d9d632f0d1dd1e46ca0b66ef89e53028
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_DailyChallengeWarning" )

CoD.systemOverlay_DailyChallengeWarningFrame = InheritFrom( LUI.UIElement )
CoD.systemOverlay_DailyChallengeWarningFrame.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.systemOverlay_DailyChallengeWarningFrame )
	self.id = "systemOverlay_DailyChallengeWarningFrame"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 320 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local systemOverlayDailyChallengeWarning = CoD.systemOverlay_DailyChallengeWarning.new( menu, controller )
	systemOverlayDailyChallengeWarning:setLeftRight( false, false, -640, 640 )
	systemOverlayDailyChallengeWarning:setTopBottom( true, false, 0, 320 )
	systemOverlayDailyChallengeWarning:linkToElementModel( self, nil, false, function ( model )
		systemOverlayDailyChallengeWarning:setModel( model, controller )
	end )
	self:addElement( systemOverlayDailyChallengeWarning )
	self.systemOverlayDailyChallengeWarning = systemOverlayDailyChallengeWarning
	
	systemOverlayDailyChallengeWarning.id = "systemOverlayDailyChallengeWarning"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.systemOverlayDailyChallengeWarning:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.systemOverlayDailyChallengeWarning:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

