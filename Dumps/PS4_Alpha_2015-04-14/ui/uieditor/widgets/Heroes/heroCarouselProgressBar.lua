CoD.heroCarouselProgressBar = InheritFrom( LUI.UIElement )
CoD.heroCarouselProgressBar.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.heroCarouselProgressBar )
	self.id = "heroCarouselProgressBar"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 204 )
	self:setTopBottom( true, false, 0, 15 )
	
	local border = LUI.UIImage.new()
	border:setLeftRight( true, true, 0, 0 )
	border:setTopBottom( true, true, 0, 0 )
	border:setRGB( 1, 1, 1 )
	border:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( border )
	self.border = border
	
	local progressBar = LUI.UIImage.new()
	progressBar:setLeftRight( true, false, 2, 202 )
	progressBar:setTopBottom( true, true, 2, -2 )
	progressBar:setRGB( 0.52, 0.77, 0.25 )
	progressBar:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( progressBar )
	self.progressBar = progressBar
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

