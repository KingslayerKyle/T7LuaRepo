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
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 480 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local systemOverlayDailyChallengeWarning = CoD.systemOverlay_DailyChallengeWarning.new( menu, controller )
	systemOverlayDailyChallengeWarning:setLeftRight( 0.5, 0.5, -960, 960 )
	systemOverlayDailyChallengeWarning:setTopBottom( 0, 0, 0, 480 )
	systemOverlayDailyChallengeWarning:linkToElementModel( self, nil, false, function ( model )
		systemOverlayDailyChallengeWarning:setModel( model, controller )
	end )
	self:addElement( systemOverlayDailyChallengeWarning )
	self.systemOverlayDailyChallengeWarning = systemOverlayDailyChallengeWarning
	
	systemOverlayDailyChallengeWarning.id = "systemOverlayDailyChallengeWarning"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.systemOverlayDailyChallengeWarning:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.systemOverlayDailyChallengeWarning:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

