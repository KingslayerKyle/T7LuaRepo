CoD.Outcome_title_PnlURInt = InheritFrom( LUI.UIElement )
CoD.Outcome_title_PnlURInt.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Outcome_title_PnlURInt )
	self.id = "Outcome_title_PnlURInt"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 28 )
	self:setTopBottom( true, false, 0, 28 )
	
	local CornerFrameURBlur = LUI.UIImage.new()
	CornerFrameURBlur:setLeftRight( false, false, -13.5, 14 )
	CornerFrameURBlur:setTopBottom( false, false, -14, 13.5 )
	CornerFrameURBlur:setImage( RegisterImage( "uie_t7_hud_mp_notifications_endgame_framecorner" ) )
	CornerFrameURBlur:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	CornerFrameURBlur:setShaderVector( 0, 0, 20, 0, 0 )
	self:addElement( CornerFrameURBlur )
	self.CornerFrameURBlur = CornerFrameURBlur
	
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

