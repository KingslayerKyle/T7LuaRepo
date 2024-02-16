-- 63236de1b9ee0ec4d03f2f0d723deeec
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Freerun.freerun_DpadBoxBlurInternal" )

CoD.freerun_DpadBoxBlur = InheritFrom( LUI.UIElement )
CoD.freerun_DpadBoxBlur.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.freerun_DpadBoxBlur )
	self.id = "freerun_DpadBoxBlur"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 290 )
	self:setTopBottom( true, false, 0, 83 )
	
	local freerunDpadBoxBlurInternal = CoD.freerun_DpadBoxBlurInternal.new( menu, controller )
	freerunDpadBoxBlurInternal:setLeftRight( true, false, 0, 290 )
	freerunDpadBoxBlurInternal:setTopBottom( true, false, 1, 81 )
	freerunDpadBoxBlurInternal:setRGB( 0.86, 0.86, 0.86 )
	freerunDpadBoxBlurInternal:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2" ) )
	freerunDpadBoxBlurInternal:setShaderVector( 0, 30, 10, 0, 0 )
	self:addElement( freerunDpadBoxBlurInternal )
	self.freerunDpadBoxBlurInternal = freerunDpadBoxBlurInternal
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Penalty = function ()
				self:setupElementClipCounter( 0 )
			end,
			FaultAnim = function ()
				self:setupElementClipCounter( 0 )
			end,
			RetryAnim = function ()
				self:setupElementClipCounter( 0 )
			end,
			SetCheckpointDelta = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.freerunDpadBoxBlurInternal:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
