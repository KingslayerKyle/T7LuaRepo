-- 4e5a31932901698ca0374f61b4aa2a4f
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Freerun.timerframblurInternal" )

CoD.timerframeblur = InheritFrom( LUI.UIElement )
CoD.timerframeblur.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.timerframeblur )
	self.id = "timerframeblur"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 235 )
	self:setTopBottom( true, false, 0, 63 )
	
	local timerframblurInternal = CoD.timerframblurInternal.new( menu, controller )
	timerframblurInternal:setLeftRight( true, false, 0, 235 )
	timerframblurInternal:setTopBottom( true, false, 0, 63 )
	timerframblurInternal:setRGB( 0.86, 0.86, 0.86 )
	timerframblurInternal:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2_highquality" ) )
	timerframblurInternal:setShaderVector( 0, 0, 3, 0, 0 )
	self:addElement( timerframblurInternal )
	self.timerframblurInternal = timerframblurInternal
	
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
		element.timerframblurInternal:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
