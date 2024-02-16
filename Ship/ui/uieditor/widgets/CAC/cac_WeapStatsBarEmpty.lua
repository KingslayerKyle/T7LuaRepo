-- 12efefd3dfc91045b4ba42bd6107f470
-- This hash is used for caching, delete to decompile the file again

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
	Image10:setAlpha( 0 )
	Image10:setImage( RegisterImage( "uie_t7_menu_cac_weaponstatsempty" ) )
	Image10:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image10 )
	self.Image10 = Image10
	
	local EmptySlot10 = LUI.UIImage.new()
	EmptySlot10:setLeftRight( true, false, 17, 29 )
	EmptySlot10:setTopBottom( true, false, 2, 14 )
	EmptySlot10:setRGB( 0.27, 0.27, 0.27 )
	EmptySlot10:setAlpha( 0.25 )
	self:addElement( EmptySlot10 )
	self.EmptySlot10 = EmptySlot10
	
	local EmptySlot100 = LUI.UIImage.new()
	EmptySlot100:setLeftRight( true, false, 3, 15 )
	EmptySlot100:setTopBottom( true, false, 2, 14 )
	EmptySlot100:setRGB( 0.27, 0.27, 0.27 )
	EmptySlot100:setAlpha( 0.25 )
	self:addElement( EmptySlot100 )
	self.EmptySlot100 = EmptySlot100
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
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
