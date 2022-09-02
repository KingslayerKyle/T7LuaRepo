-- 8c24e2c10f1dc682011dcfecc790b462
-- This hash is used for caching, delete to decompile the file again

CoD.CPTrainingSimRankIcon = InheritFrom( LUI.UIElement )
CoD.CPTrainingSimRankIcon.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CPTrainingSimRankIcon )
	self.id = "CPTrainingSimRankIcon"
	self.soundSet = "CAC"
	self:setLeftRight( true, false, 0, 74 )
	self:setTopBottom( true, false, 0, 74 )
	
	local MaskGlow = LUI.UIImage.new()
	MaskGlow:setLeftRight( false, false, -45.5, 43.5 )
	MaskGlow:setTopBottom( false, false, -44, 45 )
	MaskGlow:setRGB( 0, 0, 0 )
	MaskGlow:setAlpha( 0.5 )
	MaskGlow:setImage( RegisterImage( "uie_t7_cp_hud_incomingexplosive_glow" ) )
	self:addElement( MaskGlow )
	self.MaskGlow = MaskGlow
	
	local RatingIcon = LUI.UIImage.new()
	RatingIcon:setLeftRight( true, false, 0, 74 )
	RatingIcon:setTopBottom( true, false, 0, 74 )
	RatingIcon:setImage( RegisterImage( "uie_t7_cp_mission_complete_icon" ) )
	self:addElement( RatingIcon )
	self.RatingIcon = RatingIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				RatingIcon:completeAnimation()
				self.RatingIcon:setRGB( 0, 0, 0 )
				self.clipFinished( RatingIcon, {} )
			end
		},
		Show = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				RatingIcon:completeAnimation()
				self.RatingIcon:setRGB( 1, 1, 1 )
				self.clipFinished( RatingIcon, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

