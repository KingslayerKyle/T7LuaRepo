-- 9a2c71cd64cf8d4bf7c552801852c58b
-- This hash is used for caching, delete to decompile the file again

CoD.AmmoWidget_IventoryBox = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_IventoryBox.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_IventoryBox )
	self.id = "AmmoWidget_IventoryBox"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 39 )
	self:setTopBottom( true, false, 0, 35 )
	
	local imgBoxLethalEmpty = LUI.UIImage.new()
	imgBoxLethalEmpty:setLeftRight( true, true, 0, 0 )
	imgBoxLethalEmpty:setTopBottom( true, true, -1, 1 )
	imgBoxLethalEmpty:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_inventoryboxempty" ) )
	imgBoxLethalEmpty:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( imgBoxLethalEmpty )
	self.imgBoxLethalEmpty = imgBoxLethalEmpty
	
	local imgBoxLethal = LUI.UIImage.new()
	imgBoxLethal:setLeftRight( true, true, 0, 0 )
	imgBoxLethal:setTopBottom( true, true, -1, 1 )
	imgBoxLethal:setAlpha( 0 )
	imgBoxLethal:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_inventorybox" ) )
	imgBoxLethal:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( imgBoxLethal )
	self.imgBoxLethal = imgBoxLethal
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				imgBoxLethalEmpty:completeAnimation()
				self.imgBoxLethalEmpty:setAlpha( 0 )
				self.clipFinished( imgBoxLethalEmpty, {} )

				imgBoxLethal:completeAnimation()
				self.imgBoxLethal:setAlpha( 1 )
				self.clipFinished( imgBoxLethal, {} )
			end
		},
		Empty = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				imgBoxLethalEmpty:completeAnimation()
				self.imgBoxLethalEmpty:setAlpha( 1 )
				self.clipFinished( imgBoxLethalEmpty, {} )

				imgBoxLethal:completeAnimation()
				self.imgBoxLethal:setAlpha( 0 )
				self.clipFinished( imgBoxLethal, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
