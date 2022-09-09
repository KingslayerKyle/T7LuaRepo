-- 4029fc45ba80fea400f685a9ed7b7573
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Freerun.FR_TopScore_Box_FooterBlurInternal" )

CoD.FR_TopScore_Box_FooterBlur = InheritFrom( LUI.UIElement )
CoD.FR_TopScore_Box_FooterBlur.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.FR_TopScore_Box_FooterBlur )
	self.id = "FR_TopScore_Box_FooterBlur"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 554 )
	self:setTopBottom( true, false, 0, 54 )
	
	local FRTopScoreBoxFooterBlurInternal = CoD.FR_TopScore_Box_FooterBlurInternal.new( menu, controller )
	FRTopScoreBoxFooterBlurInternal:setLeftRight( true, false, 0, 553.92 )
	FRTopScoreBoxFooterBlurInternal:setTopBottom( true, false, 0, 53.57 )
	FRTopScoreBoxFooterBlurInternal:setRGB( 0.86, 0.86, 0.86 )
	FRTopScoreBoxFooterBlurInternal:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2" ) )
	FRTopScoreBoxFooterBlurInternal:setShaderVector( 0, 30, 30, 0, 0 )
	self:addElement( FRTopScoreBoxFooterBlurInternal )
	self.FRTopScoreBoxFooterBlurInternal = FRTopScoreBoxFooterBlurInternal
	
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
		element.FRTopScoreBoxFooterBlurInternal:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
