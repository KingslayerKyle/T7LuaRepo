require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_Layout_GenericForeground_FreeCursor_Full" )
require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_supportWidget" )

CoD.systemOverlay_FreeCursor_Full_BasicFrame = InheritFrom( LUI.UIElement )
CoD.systemOverlay_FreeCursor_Full_BasicFrame.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.systemOverlay_FreeCursor_Full_BasicFrame )
	self.id = "systemOverlay_FreeCursor_Full_BasicFrame"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 480 )
	self.anyChildUsesUpdateState = true
	
	local largeImage = LUI.UIImage.new()
	largeImage:setLeftRight( 0, 0, 0, 528 )
	largeImage:setTopBottom( 0, 1, 0, 0 )
	largeImage:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			largeImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( largeImage )
	self.largeImage = largeImage
	
	local foreground = CoD.systemOverlay_Layout_GenericForeground_FreeCursor_Full.new( menu, controller )
	foreground:setLeftRight( 0, 1, 0, 0 )
	foreground:setTopBottom( 0, 1, 0, 0 )
	foreground:linkToElementModel( self, nil, false, function ( model )
		foreground:setModel( model, controller )
	end )
	self:addElement( foreground )
	self.foreground = foreground
	
	local supportInfo = CoD.systemOverlay_supportWidget.new( menu, controller )
	supportInfo:setLeftRight( 0, 0, 0, 528 )
	supportInfo:setTopBottom( 1, 1, -36, 0 )
	supportInfo:linkToElementModel( self, nil, false, function ( model )
		supportInfo:setModel( model, controller )
	end )
	self:addElement( supportInfo )
	self.supportInfo = supportInfo
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.foreground:close()
		self.supportInfo:close()
		self.largeImage:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

