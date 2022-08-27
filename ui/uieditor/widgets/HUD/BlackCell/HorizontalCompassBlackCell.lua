-- 18ccc69eff731d59d57da0570f8369b5
-- This hash is used for caching, delete to decompile the file again

CoD.HorizontalCompassBlackCell = InheritFrom( LUI.UIElement )
CoD.HorizontalCompassBlackCell.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.HorizontalCompassBlackCell )
	self.id = "HorizontalCompassBlackCell"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 743 )
	self:setTopBottom( true, false, 0, 75 )
	
	local user = LUI.UIImage.new()
	user:setLeftRight( false, false, -18.5, 18.5 )
	user:setTopBottom( false, true, -34, 3 )
	user:setImage( RegisterImage( "uie_t7_hud_blackcell_user" ) )
	self:addElement( user )
	self.user = user
	
	local enemy = LUI.UIImage.new()
	enemy:setLeftRight( false, false, -18.5, 18.5 )
	enemy:setTopBottom( true, false, -2.75, 34.25 )
	enemy:setAlpha( 0 )
	enemy:setImage( RegisterImage( "uie_t7_hud_blackcell_enemie" ) )
	self:addElement( enemy )
	self.enemy = enemy
	
	local HorizontalCompass = LUI.UIImage.new()
	HorizontalCompass:setLeftRight( false, false, -287.54, 287.54 )
	HorizontalCompass:setTopBottom( false, false, -17.13, 7.62 )
	HorizontalCompass:setupHorizontalCompass( 0.75 )
	HorizontalCompass:setImage( RegisterMaterial( "hud_horizontal_compass_blackcell" ) )
	HorizontalCompass:setShaderVector( 0, 0.6, 0, 0, 0 )
	self:addElement( HorizontalCompass )
	self.HorizontalCompass = HorizontalCompass
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

