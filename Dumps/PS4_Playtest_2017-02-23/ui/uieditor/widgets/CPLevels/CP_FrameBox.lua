require( "ui.uieditor.widgets.Lobby.Common.FE_FeaturedFrame" )

CoD.CP_FrameBox = InheritFrom( LUI.UIElement )
CoD.CP_FrameBox.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CP_FrameBox )
	self.id = "CP_FrameBox"
	self.soundSet = "ModeSelection"
	self:setLeftRight( 0, 0, 0, 480 )
	self:setTopBottom( 0, 0, 0, 294 )
	
	local FEFeaturedFrame = CoD.FE_FeaturedFrame.new( menu, controller )
	FEFeaturedFrame:setLeftRight( 0, 1, 0, 0 )
	FEFeaturedFrame:setTopBottom( 0, 1, 0, 0 )
	FEFeaturedFrame:setAlpha( 0.5 )
	self:addElement( FEFeaturedFrame )
	self.FEFeaturedFrame = FEFeaturedFrame
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FEFeaturedFrame:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

