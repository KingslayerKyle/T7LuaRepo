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
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			frame:changeFrameWidget( modelValue )
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
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.frame:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.buttons:close()
		self.frame:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

