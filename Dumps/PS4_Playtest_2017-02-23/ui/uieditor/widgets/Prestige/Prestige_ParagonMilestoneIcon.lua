CoD.Prestige_ParagonMilestoneIcon = InheritFrom( LUI.UIElement )
CoD.Prestige_ParagonMilestoneIcon.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Prestige_ParagonMilestoneIcon )
	self.id = "Prestige_ParagonMilestoneIcon"
	self.soundSet = "AAR"
	self:setLeftRight( 0, 0, 0, 24 )
	self:setTopBottom( 0, 0, 0, 24 )
	
	local ParagonMilestoneIcon = LUI.UIImage.new()
	ParagonMilestoneIcon:setLeftRight( 0, 1, 3, -3 )
	ParagonMilestoneIcon:setTopBottom( 0, 1, 3, -3 )
	ParagonMilestoneIcon:setRGB( 0.89, 0.7, 0.36 )
	ParagonMilestoneIcon:setImage( RegisterImage( "uie_t7_arena_diamond_small_yellow" ) )
	self:addElement( ParagonMilestoneIcon )
	self.ParagonMilestoneIcon = ParagonMilestoneIcon
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

