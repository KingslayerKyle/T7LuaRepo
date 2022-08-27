-- a57f060b038205a641881764e58d380d
-- This hash is used for caching, delete to decompile the file again

CoD.AbilityWheel_Panel = InheritFrom( LUI.UIElement )
CoD.AbilityWheel_Panel.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AbilityWheel_Panel )
	self.id = "AbilityWheel_Panel"
	self.soundSet = "AbilityWheel"
	self:setLeftRight( true, false, 0, 544 )
	self:setTopBottom( true, false, 0, 544 )
	
	local Image18 = LUI.UIImage.new()
	Image18:setLeftRight( true, true, 0, 0 )
	Image18:setTopBottom( true, true, 0, 0 )
	Image18:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_panelul" ) )
	Image18:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	Image18:setShaderVector( 0, 0, 20, 0, 0 )
	self:addElement( Image18 )
	self.Image18 = Image18
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

