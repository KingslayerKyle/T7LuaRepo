require( "ui.uieditor.widgets.SystemOverlays.featureOverlay_frameVLayout" )
require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_alertStatusBar" )

CoD.featureOverlay_Layout = InheritFrom( LUI.UIElement )
CoD.featureOverlay_Layout.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.featureOverlay_Layout )
	self.id = "featureOverlay_Layout"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 1080 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( 0, 1, 0, 0 )
	background:setTopBottom( 0, 1, 0, 0 )
	background:setRGB( 0, 0, 0 )
	background:setAlpha( 0.8 )
	self:addElement( background )
	self.background = background
	
	local alertStatusBar = CoD.systemOverlay_alertStatusBar.new( menu, controller )
	alertStatusBar:setLeftRight( 0, 1, 0, 0 )
	alertStatusBar:setTopBottom( 0, 0, 216, 222 )
	alertStatusBar:linkToElementModel( self, nil, false, function ( model )
		alertStatusBar:setModel( model, controller )
	end )
	self:addElement( alertStatusBar )
	self.alertStatusBar = alertStatusBar
	
	local vlayout = CoD.featureOverlay_frameVLayout.new( menu, controller )
	vlayout:setLeftRight( 0, 0, 0, 1920 )
	vlayout:setTopBottom( 0, 0, 222, 972 )
	vlayout:linkToElementModel( self, nil, false, function ( model )
		vlayout:setModel( model, controller )
	end )
	self:addElement( vlayout )
	self.vlayout = vlayout
	
	vlayout.id = "vlayout"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.vlayout:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.alertStatusBar:close()
		self.vlayout:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

