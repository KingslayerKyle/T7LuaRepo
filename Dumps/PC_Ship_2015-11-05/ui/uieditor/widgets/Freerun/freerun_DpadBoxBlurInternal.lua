CoD.freerun_DpadBoxBlurInternal = InheritFrom( LUI.UIElement )
CoD.freerun_DpadBoxBlurInternal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.freerun_DpadBoxBlurInternal )
	self.id = "freerun_DpadBoxBlurInternal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 290 )
	self:setTopBottom( true, false, 0, 83 )
	
	local DpadBoxBlur = LUI.UIImage.new()
	DpadBoxBlur:setLeftRight( false, false, -135, 86 )
	DpadBoxBlur:setTopBottom( false, false, -26.09, 41.18 )
	DpadBoxBlur:setImage( RegisterImage( "uie_t7_freerun_hud_infobarright_blur" ) )
	DpadBoxBlur:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	DpadBoxBlur:setShaderVector( 0, 10, 10, 0, 0 )
	self:addElement( DpadBoxBlur )
	self.DpadBoxBlur = DpadBoxBlur
	
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
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

