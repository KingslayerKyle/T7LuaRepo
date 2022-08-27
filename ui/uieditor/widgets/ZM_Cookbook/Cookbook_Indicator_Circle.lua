-- 1ec4c5403219eeaed441811fb8c652a4
-- This hash is used for caching, delete to decompile the file again

CoD.Cookbook_Indicator_Circle = InheritFrom( LUI.UIElement )
CoD.Cookbook_Indicator_Circle.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Cookbook_Indicator_Circle )
	self.id = "Cookbook_Indicator_Circle"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 8 )
	self:setTopBottom( true, false, 0, 8 )
	
	local IndicatorCircle = LUI.UIImage.new()
	IndicatorCircle:setLeftRight( true, false, 0, 8 )
	IndicatorCircle:setTopBottom( true, false, 0, 8 )
	IndicatorCircle:setImage( RegisterImage( "uie_t7_zm_cookbook_indicator_circle" ) )
	self:addElement( IndicatorCircle )
	self.IndicatorCircle = IndicatorCircle
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				IndicatorCircle:completeAnimation()
				self.IndicatorCircle:setAlpha( 0 )
				self.clipFinished( IndicatorCircle, {} )
			end
		},
		Red = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				IndicatorCircle:completeAnimation()
				self.IndicatorCircle:setRGB( 1, 0.04, 0 )
				self.clipFinished( IndicatorCircle, {} )
			end
		},
		Green = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				IndicatorCircle:completeAnimation()
				self.IndicatorCircle:setRGB( 0.16, 0.92, 0.15 )
				self.clipFinished( IndicatorCircle, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

