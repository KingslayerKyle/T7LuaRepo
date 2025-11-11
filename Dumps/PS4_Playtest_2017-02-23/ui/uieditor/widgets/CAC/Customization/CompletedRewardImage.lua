require( "ui.uieditor.widgets.Border" )

CoD.CompletedRewardImage = InheritFrom( LUI.UIElement )
CoD.CompletedRewardImage.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CompletedRewardImage )
	self.id = "CompletedRewardImage"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 117 )
	self:setTopBottom( 0, 0, 0, 117 )
	
	local bgImage = LUI.UIImage.new()
	bgImage:setLeftRight( 0, 1, 0, 0 )
	bgImage:setTopBottom( 0, 1, 0, 0 )
	bgImage:setRGB( 0.14, 0.12, 0.13 )
	self:addElement( bgImage )
	self.bgImage = bgImage
	
	local completedRewardImage = LUI.UIImage.new()
	completedRewardImage:setLeftRight( 0.5, 0.5, -24, 24 )
	completedRewardImage:setTopBottom( 0.5, 0.5, -24, 24 )
	completedRewardImage:setRGB( 0.98, 0.73, 0.35 )
	self:addElement( completedRewardImage )
	self.completedRewardImage = completedRewardImage
	
	local border = CoD.Border.new( menu, controller )
	border:setLeftRight( 0, 1, 0, 0 )
	border:setTopBottom( 0, 1, 0, 0 )
	self:addElement( border )
	self.border = border
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.border:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

