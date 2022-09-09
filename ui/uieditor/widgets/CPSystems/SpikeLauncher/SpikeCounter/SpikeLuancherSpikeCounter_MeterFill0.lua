-- b2ef7bfcff7d7bb2351b8e56b749b7f0
-- This hash is used for caching, delete to decompile the file again

CoD.SpikeLuancherSpikeCounter_MeterFill0 = InheritFrom( LUI.UIElement )
CoD.SpikeLuancherSpikeCounter_MeterFill0.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.SpikeLuancherSpikeCounter_MeterFill0 )
	self.id = "SpikeLuancherSpikeCounter_MeterFill0"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 112 )
	self:setTopBottom( true, false, 0, 128 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 112 )
	Image0:setTopBottom( true, false, 0, 128 )
	Image0:setImage( RegisterImage( "uie_t7_cp_hud_system_spikelaunchercounter_fillmeter0" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				Image0:completeAnimation()
				self.Image0:setAlpha( 0 )
				self.clipFinished( Image0, {} )
			end
		},
		Blasting = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				Image0:completeAnimation()
				self.Image0:setAlpha( 0 )
				self.clipFinished( Image0, {} )
			end
		},
		Ready = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				Image0:completeAnimation()
				self.Image0:setAlpha( 1 )
				self.clipFinished( Image0, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
