-- eb5ae4f9f0bbe1943f86ca5d2b1b37fb
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Freerun.FR_TopScore_Box_TimeBlurInternal" )

CoD.FR_TopScore_Box_TimeBlur = InheritFrom( LUI.UIElement )
CoD.FR_TopScore_Box_TimeBlur.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.FR_TopScore_Box_TimeBlur )
	self.id = "FR_TopScore_Box_TimeBlur"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 540 )
	self:setTopBottom( true, false, 0, 87 )
	
	local FRTopScoreBoxTimeBlurInternal = CoD.FR_TopScore_Box_TimeBlurInternal.new( menu, controller )
	FRTopScoreBoxTimeBlurInternal:setLeftRight( true, false, 0, 539 )
	FRTopScoreBoxTimeBlurInternal:setTopBottom( true, false, 0, 86.81 )
	FRTopScoreBoxTimeBlurInternal:setRGB( 0.86, 0.86, 0.86 )
	FRTopScoreBoxTimeBlurInternal:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2" ) )
	FRTopScoreBoxTimeBlurInternal:setShaderVector( 0, 30, 10, 0, 0 )
	self:addElement( FRTopScoreBoxTimeBlurInternal )
	self.FRTopScoreBoxTimeBlurInternal = FRTopScoreBoxTimeBlurInternal
	
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
		element.FRTopScoreBoxTimeBlurInternal:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

