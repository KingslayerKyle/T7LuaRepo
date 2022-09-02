-- 20447bdfd334f9df39b88d7d9901ff8a
-- This hash is used for caching, delete to decompile the file again

CoD.ScrStk_CombatEfficiencyScrollFX = InheritFrom( LUI.UIElement )
CoD.ScrStk_CombatEfficiencyScrollFX.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ScrStk_CombatEfficiencyScrollFX )
	self.id = "ScrStk_CombatEfficiencyScrollFX"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 19 )
	self:setTopBottom( true, false, 0, 120 )
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, true, 0, 0 )
	Image1:setTopBottom( true, true, 0, 0 )
	Image1:setImage( RegisterImage( "uie_t7_mp_hud_scorestreak_focusmeterpixelfade" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	Image1:setShaderVector( 0, 1, 1, 0, 0 )
	Image1:setShaderVector( 1, 2.4, 0, 0, 0 )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, true, 0, 0 )
	Image0:setTopBottom( true, true, 0, 0 )
	Image0:setImage( RegisterImage( "uie_t7_mp_hud_scorestreak_focusmeterpixelfadegrad" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end,
			ScoreAdded = function ()
				self:setupElementClipCounter( 0 )

			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

