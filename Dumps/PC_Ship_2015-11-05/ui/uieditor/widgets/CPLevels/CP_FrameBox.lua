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
	self:setLeftRight( true, false, 0, 320 )
	self:setTopBottom( true, false, 0, 196 )
	
	local FEFeaturedFrame = CoD.FE_FeaturedFrame.new( menu, controller )
	FEFeaturedFrame:setLeftRight( true, true, 0, 0 )
	FEFeaturedFrame:setTopBottom( true, true, 0, 0 )
	FEFeaturedFrame:setAlpha( 0.5 )
	self:addElement( FEFeaturedFrame )
	self.FEFeaturedFrame = FEFeaturedFrame
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEFeaturedFrame:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

