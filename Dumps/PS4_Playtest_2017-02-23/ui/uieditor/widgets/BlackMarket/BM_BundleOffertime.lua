CoD.BM_BundleOffertime = InheritFrom( LUI.UIElement )
CoD.BM_BundleOffertime.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BM_BundleOffertime )
	self.id = "BM_BundleOffertime"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 528 )
	self:setTopBottom( 0, 0, 0, 37 )
	
	local BundleOfferTime = LUI.UIText.new()
	BundleOfferTime:setLeftRight( 0, 0, 0, 528 )
	BundleOfferTime:setTopBottom( 0, 0, 0, 33 )
	BundleOfferTime:setRGB( ColorSet.BlackMarketRare.r, ColorSet.BlackMarketRare.g, ColorSet.BlackMarketRare.b )
	BundleOfferTime:setText( Engine.Localize( "MPUI_BM_BUNDLE_OFFER" ) )
	BundleOfferTime:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	BundleOfferTime:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	BundleOfferTime:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( BundleOfferTime )
	self.BundleOfferTime = BundleOfferTime
	
	self.resetProperties = function ()
		BundleOfferTime:completeAnimation()
		BundleOfferTime:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				BundleOfferTime:completeAnimation()
				self.BundleOfferTime:setAlpha( 0 )
				self.clipFinished( BundleOfferTime, {} )
			end
		},
		Bundle = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

