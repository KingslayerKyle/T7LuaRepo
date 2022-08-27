-- 1ce56ba3826145619313f4aa1a4191df
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 16 )
	self:setTopBottom( true, false, 0, 16 )
	
	local ParagonMilestoneIcon = LUI.UIImage.new()
	ParagonMilestoneIcon:setLeftRight( true, true, 2, -2 )
	ParagonMilestoneIcon:setTopBottom( true, true, 2, -2 )
	ParagonMilestoneIcon:setRGB( 0.89, 0.7, 0.36 )
	ParagonMilestoneIcon:setImage( RegisterImage( "uie_t7_arena_diamond_small_yellow" ) )
	self:addElement( ParagonMilestoneIcon )
	self.ParagonMilestoneIcon = ParagonMilestoneIcon
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

