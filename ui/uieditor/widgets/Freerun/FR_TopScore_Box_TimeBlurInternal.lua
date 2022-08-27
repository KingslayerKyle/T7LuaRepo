-- bdda5b3d2acbc183b52952121afa77bd
-- This hash is used for caching, delete to decompile the file again

CoD.FR_TopScore_Box_TimeBlurInternal = InheritFrom( LUI.UIElement )
CoD.FR_TopScore_Box_TimeBlurInternal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.FR_TopScore_Box_TimeBlurInternal )
	self.id = "FR_TopScore_Box_TimeBlurInternal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 540 )
	self:setTopBottom( true, false, 0, 87 )
	
	local HighScoreTimeBox1 = LUI.UIImage.new()
	HighScoreTimeBox1:setLeftRight( true, false, 0, 540 )
	HighScoreTimeBox1:setTopBottom( true, false, 0, 86.81 )
	HighScoreTimeBox1:setImage( RegisterImage( "uie_t7_freerun_hud_topscores_timebox" ) )
	HighScoreTimeBox1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	HighScoreTimeBox1:setShaderVector( 0, 10, 10, 0, 0 )
	self:addElement( HighScoreTimeBox1 )
	self.HighScoreTimeBox1 = HighScoreTimeBox1
	
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

