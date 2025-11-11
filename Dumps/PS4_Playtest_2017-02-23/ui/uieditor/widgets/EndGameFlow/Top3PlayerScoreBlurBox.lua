CoD.Top3PlayerScoreBlurBox = InheritFrom( LUI.UIElement )
CoD.Top3PlayerScoreBlurBox.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Top3PlayerScoreBlurBox )
	self.id = "Top3PlayerScoreBlurBox"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 399 )
	self:setTopBottom( 0, 0, 0, 162 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 1, 0, 0 )
	Image0:setTopBottom( 0, 1, 0, 0 )
	Image0:setImage( RegisterImage( "uie_t7_menu_fe_scoreboardbuttonblur" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	Image0:setShaderVector( 0, 0, 20, 0, 0 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

