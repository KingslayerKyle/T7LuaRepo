CoD.cac_WeapStatsBarEmpty = InheritFrom( LUI.UIElement )
CoD.cac_WeapStatsBarEmpty.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.cac_WeapStatsBarEmpty )
	self.id = "cac_WeapStatsBarEmpty"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 32 )
	self:setTopBottom( true, false, 0, 16 )
	
	local Image10 = LUI.UIImage.new()
	Image10:setLeftRight( true, false, 0, 32 )
	Image10:setTopBottom( true, false, 0, 16 )
	Image10:setRGB( 1, 1, 1 )
	Image10:setAlpha( 0.66 )
	Image10:setImage( RegisterImage( "uie_t7_menu_cac_weaponstatsempty" ) )
	Image10:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image10 )
	self.Image10 = Image10
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

