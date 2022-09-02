-- c1b111b77c6b5a8fd2fc1598032f50e0
-- This hash is used for caching, delete to decompile the file again

CoD.timerframblurInternal = InheritFrom( LUI.UIElement )
CoD.timerframblurInternal.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.timerframblurInternal )
	self.id = "timerframblurInternal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 235 )
	self:setTopBottom( true, false, 0, 63 )
	
	local freerunTimerBlur = LUI.UIImage.new()
	freerunTimerBlur:setLeftRight( true, true, 0, 0 )
	freerunTimerBlur:setTopBottom( true, true, 0, 0 )
	freerunTimerBlur:setImage( RegisterImage( "uie_t7_freerun_hud_timer_blur" ) )
	freerunTimerBlur:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	freerunTimerBlur:setShaderVector( 0, 10, 10, 0, 0 )
	self:addElement( freerunTimerBlur )
	self.freerunTimerBlur = freerunTimerBlur
	
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

