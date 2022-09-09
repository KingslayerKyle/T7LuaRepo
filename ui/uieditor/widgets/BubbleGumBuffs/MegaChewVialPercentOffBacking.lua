-- 67a381afee57c98cf2f12a48a8ba5614
-- This hash is used for caching, delete to decompile the file again

CoD.MegaChewVialPercentOffBacking = InheritFrom( LUI.UIElement )
CoD.MegaChewVialPercentOffBacking.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.MegaChewVialPercentOffBacking )
	self.id = "MegaChewVialPercentOffBacking"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 150 )
	self:setTopBottom( true, false, 0, 22 )
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, true, 0, 0 )
	bg:setTopBottom( true, true, 0, 0 )
	bg:setRGB( 0, 0.6, 0.9 )
	self:addElement( bg )
	self.bg = bg
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Common = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				bg:completeAnimation()
				self.bg:setRGB( ColorSet.BlackMarketCommon.r, ColorSet.BlackMarketCommon.g, ColorSet.BlackMarketCommon.b )
				self.clipFinished( bg, {} )
			end
		},
		Rare = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				bg:completeAnimation()
				self.bg:setRGB( 0, 0.6, 0.9 )
				self.clipFinished( bg, {} )
			end
		},
		Legendary = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				bg:completeAnimation()
				self.bg:setRGB( ColorSet.BlackMarketLegendary.r, ColorSet.BlackMarketLegendary.g, ColorSet.BlackMarketLegendary.b )
				self.clipFinished( bg, {} )
			end
		},
		Epic = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				bg:completeAnimation()
				self.bg:setRGB( 1, 0.67, 0 )
				self.clipFinished( bg, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Common",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "rarity", "MPUI_BM_COMMON" )
			end
		},
		{
			stateName = "Rare",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "rarity", "MPUI_BM_RARE" )
			end
		},
		{
			stateName = "Legendary",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "rarity", "MPUI_BM_LEGENDARY" )
			end
		},
		{
			stateName = "Epic",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "rarity", "MPUI_BM_EPIC" )
			end
		}
	} )
	self:linkToElementModel( self, "rarity", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "rarity"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
