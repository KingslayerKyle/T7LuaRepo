-- 5f4a3011e46cc7e2a7a206025254ca18
-- This hash is used for caching, delete to decompile the file again

CoD.BM_BundleGlow = InheritFrom( LUI.UIElement )
CoD.BM_BundleGlow.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.BM_BundleGlow )
	self.id = "BM_BundleGlow"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 472 )
	self:setTopBottom( true, false, 0, 168 )
	
	local Bribeglow = LUI.UIImage.new()
	Bribeglow:setLeftRight( true, false, 0, 472 )
	Bribeglow:setTopBottom( true, false, 0, 168 )
	Bribeglow:setImage( RegisterImage( "uie_t7_blackmarket_bundleglow_bg" ) )
	self:addElement( Bribeglow )
	self.Bribeglow = Bribeglow
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				Bribeglow:completeAnimation()
				self.Bribeglow:setAlpha( 1 )
				self.clipFinished( Bribeglow, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
