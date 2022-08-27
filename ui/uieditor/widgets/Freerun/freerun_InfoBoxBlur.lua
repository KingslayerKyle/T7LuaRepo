-- 875d92cd3f5410d09fb48ca5f0352ed5
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Freerun.freerun_InfoBoxBlurInternal" )

CoD.freerun_InfoBoxBlur = InheritFrom( LUI.UIElement )
CoD.freerun_InfoBoxBlur.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.freerun_InfoBoxBlur )
	self.id = "freerun_InfoBoxBlur"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 206 )
	self:setTopBottom( true, false, 0, 206 )
	
	local freerunInfoBoxBlurInternal = CoD.freerun_InfoBoxBlurInternal.new( menu, controller )
	freerunInfoBoxBlurInternal:setLeftRight( false, false, -103, 103 )
	freerunInfoBoxBlurInternal:setTopBottom( false, false, -100, 44 )
	freerunInfoBoxBlurInternal:setRGB( 0.86, 0.86, 0.86 )
	freerunInfoBoxBlurInternal:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2" ) )
	freerunInfoBoxBlurInternal:setShaderVector( 0, 30, 10, 0, 0 )
	self:addElement( freerunInfoBoxBlurInternal )
	self.freerunInfoBoxBlurInternal = freerunInfoBoxBlurInternal
	
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
		element.freerunInfoBoxBlurInternal:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

