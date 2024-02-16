-- faa918bef0530bf856de78e04945b9eb
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.SystemOverlays.featureOverlay_frameVLayout_Buttons" )

CoD.featureOverlay_frameVLayout = InheritFrom( LUI.UIElement )
CoD.featureOverlay_frameVLayout.new = function ( menu, controller )
	local self = LUI.UIVerticalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 0
	} )
	self:setAlignment( LUI.Alignment.Top )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.featureOverlay_frameVLayout )
	self.id = "featureOverlay_frameVLayout"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 500 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local frame = LUI.UIFrame.new( menu, controller, 0, 0, true )
	frame:setLeftRight( true, true, 0, 0 )
	frame:setTopBottom( true, false, 0, 466 )
	frame:linkToElementModel( self, nil, false, function ( model )
		frame:setModel( model, controller )
	end )
	frame:linkToElementModel( self, "frameWidget", true, function ( model )
		local frameWidget = Engine.GetModelValue( model )
		if frameWidget then
			frame:changeFrameWidget( frameWidget )
		end
	end )
	self:addElement( frame )
	self.frame = frame
	
	local buttons = CoD.featureOverlay_frameVLayout_Buttons.new( menu, controller )
	buttons:setLeftRight( true, false, 0, 1280 )
	buttons:setTopBottom( true, false, 466, 502 )
	self:addElement( buttons )
	self.buttons = buttons
	
	frame.id = "frame"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.frame:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.buttons:close()
		element.frame:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
