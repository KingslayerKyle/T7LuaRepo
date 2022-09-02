-- 254adfc8db8ec2e2b9c8a5e35dc3296d
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_alertStatusBar" )
require( "ui.uieditor.widgets.SystemOverlays.featureOverlay_frameVLayout" )

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
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 0 )
	background:setRGB( 0, 0, 0 )
	background:setAlpha( 0.8 )
	self:addElement( background )
	self.background = background
	
	local alertStatusBar = CoD.systemOverlay_alertStatusBar.new( menu, controller )
	alertStatusBar:setLeftRight( true, true, 0, 0 )
	alertStatusBar:setTopBottom( true, false, 144, 148 )
	alertStatusBar:linkToElementModel( self, nil, false, function ( model )
		alertStatusBar:setModel( model, controller )
	end )
	self:addElement( alertStatusBar )
	self.alertStatusBar = alertStatusBar
	
	local vlayout = CoD.featureOverlay_frameVLayout.new( menu, controller )
	vlayout:setLeftRight( true, false, 0, 1280 )
	vlayout:setTopBottom( true, false, 148, 648 )
	vlayout:linkToElementModel( self, nil, false, function ( model )
		vlayout:setModel( model, controller )
	end )
	self:addElement( vlayout )
	self.vlayout = vlayout
	
	vlayout.id = "vlayout"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.vlayout:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.alertStatusBar:close()
		element.vlayout:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

