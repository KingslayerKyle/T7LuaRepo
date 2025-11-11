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
	self:setLeftRight( 0, 0, 0, 48 )
	self:setTopBottom( 0, 0, 0, 24 )
	
	local Image10 = LUI.UIImage.new()
	Image10:setLeftRight( 0, 0, 0, 48 )
	Image10:setTopBottom( 0, 0, 0, 24 )
	Image10:setAlpha( 0 )
	Image10:setImage( RegisterImage( "uie_t7_menu_cac_weaponstatsempty" ) )
	Image10:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image10 )
	self.Image10 = Image10
	
	local EmptySlot10 = LUI.UIImage.new()
	EmptySlot10:setLeftRight( 0, 0, 25, 43 )
	EmptySlot10:setTopBottom( 0, 0, 3, 21 )
	EmptySlot10:setRGB( 0.27, 0.27, 0.27 )
	EmptySlot10:setAlpha( 0.25 )
	self:addElement( EmptySlot10 )
	self.EmptySlot10 = EmptySlot10
	
	local EmptySlot100 = LUI.UIImage.new()
	EmptySlot100:setLeftRight( 0, 0, 5, 23 )
	EmptySlot100:setTopBottom( 0, 0, 3, 21 )
	EmptySlot100:setRGB( 0.27, 0.27, 0.27 )
	EmptySlot100:setAlpha( 0.25 )
	self:addElement( EmptySlot100 )
	self.EmptySlot100 = EmptySlot100
	
	self.resetProperties = function ()
		EmptySlot100:completeAnimation()
		EmptySlot10:completeAnimation()
		EmptySlot100:setRGB( 0.27, 0.27, 0.27 )
		EmptySlot100:setAlpha( 0.25 )
		EmptySlot10:setRGB( 0.27, 0.27, 0.27 )
		EmptySlot10:setAlpha( 0.25 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				EmptySlot10:completeAnimation()
				self.EmptySlot10:setRGB( 0.18, 0.18, 0.18 )
				self.EmptySlot10:setAlpha( 0.5 )
				self.clipFinished( EmptySlot10, {} )
				EmptySlot100:completeAnimation()
				self.EmptySlot100:setRGB( 0.18, 0.18, 0.18 )
				self.EmptySlot100:setAlpha( 0.5 )
				self.clipFinished( EmptySlot100, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

