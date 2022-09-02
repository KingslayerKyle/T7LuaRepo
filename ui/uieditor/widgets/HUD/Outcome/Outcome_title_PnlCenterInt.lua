-- ccf0d3253b58c4b2d56258156db5d66e
-- This hash is used for caching, delete to decompile the file again

CoD.Outcome_title_PnlCenterInt = InheritFrom( LUI.UIElement )
CoD.Outcome_title_PnlCenterInt.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Outcome_title_PnlCenterInt )
	self.id = "Outcome_title_PnlCenterInt"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 701 )
	self:setTopBottom( true, false, 0, 55 )
	
	local TopFrameBlur = LUI.UIImage.new()
	TopFrameBlur:setLeftRight( true, true, 0, 0 )
	TopFrameBlur:setTopBottom( true, false, 0, 54.9 )
	TopFrameBlur:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	TopFrameBlur:setShaderVector( 0, 0, 20, 0, 0 )
	self:addElement( TopFrameBlur )
	self.TopFrameBlur = TopFrameBlur
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		VictoryGreen = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		DefeatRed = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		OvertimeOrange = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

