-- 1bdec0a6c469f3302caf8177d560616f
-- This hash is used for caching, delete to decompile the file again

CoD.freerun_InfoBoxBlurInternal = InheritFrom( LUI.UIElement )
CoD.freerun_InfoBoxBlurInternal.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.freerun_InfoBoxBlurInternal )
	self.id = "freerun_InfoBoxBlurInternal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 206 )
	self:setTopBottom( true, false, 0, 206 )
	
	local InfoBarBlur = LUI.UIImage.new()
	InfoBarBlur:setLeftRight( true, true, 0, -14 )
	InfoBarBlur:setTopBottom( true, true, 0, 0 )
	InfoBarBlur:setImage( RegisterImage( "uie_t7_freerun_hud_infobarright_blur" ) )
	InfoBarBlur:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	InfoBarBlur:setShaderVector( 0, 10, 10, 0, 0 )
	self:addElement( InfoBarBlur )
	self.InfoBarBlur = InfoBarBlur
	
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
