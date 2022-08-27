-- 300bb8d4c426fbbaec827236fd49f8f7
-- This hash is used for caching, delete to decompile the file again

CoD.FR_TopScore_Box_FooterBlurInternal = InheritFrom( LUI.UIElement )
CoD.FR_TopScore_Box_FooterBlurInternal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.FR_TopScore_Box_FooterBlurInternal )
	self.id = "FR_TopScore_Box_FooterBlurInternal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 554 )
	self:setTopBottom( true, false, 0, 54 )
	
	local HighScoreFooterBox = LUI.UIImage.new()
	HighScoreFooterBox:setLeftRight( true, false, 0, 553.92 )
	HighScoreFooterBox:setTopBottom( true, false, 0, 53.57 )
	HighScoreFooterBox:setImage( RegisterImage( "uie_t7_freerun_hud_topscores_footerbox" ) )
	HighScoreFooterBox:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	HighScoreFooterBox:setShaderVector( 0, 10, 10, 0, 0 )
	self:addElement( HighScoreFooterBox )
	self.HighScoreFooterBox = HighScoreFooterBox
	
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

