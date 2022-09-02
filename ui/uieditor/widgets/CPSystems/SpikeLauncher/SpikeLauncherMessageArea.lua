-- 4f59f9d9b31107fcf9a8ae287e1ba11a
-- This hash is used for caching, delete to decompile the file again

CoD.SpikeLauncherMessageArea = InheritFrom( LUI.UIElement )
CoD.SpikeLauncherMessageArea.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.SpikeLauncherMessageArea )
	self.id = "SpikeLauncherMessageArea"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 97 )
	self:setTopBottom( true, false, 0, 55 )
	
	local Image12 = LUI.UIImage.new()
	Image12:setLeftRight( true, false, 43.67, 54 )
	Image12:setTopBottom( true, false, 48, 55 )
	Image12:setImage( RegisterImage( "uie_t7_cp_hud_system_spikelauncher_infolmbase" ) )
	Image12:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image12 )
	self.Image12 = Image12
	
	local Image18 = LUI.UIImage.new()
	Image18:setLeftRight( true, false, 40, 57 )
	Image18:setTopBottom( true, false, 0, 6.33 )
	Image18:setImage( RegisterImage( "uie_t7_cp_hud_system_spikelauncher_infolmtop" ) )
	Image18:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image18 )
	self.Image18 = Image18
	
	local AreaLbl = LUI.UIText.new()
	AreaLbl:setLeftRight( true, false, 0, 97 )
	AreaLbl:setTopBottom( true, false, 12.17, 50.5 )
	AreaLbl:setText( Engine.Localize( "33" ) )
	AreaLbl:setTTF( "fonts/UnitedSansSmCdLt_0.ttf" )
	AreaLbl:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	AreaLbl:setShaderVector( 0, 0.2, 1, 0, 0 )
	AreaLbl:setShaderVector( 1, 0, 0, 0, 0 )
	AreaLbl:setShaderVector( 2, 0, 0, 0, 0 )
	AreaLbl:setShaderVector( 3, 0, 0, 0, 0 )
	AreaLbl:setShaderVector( 4, 0, 0, 0, 0 )
	AreaLbl:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	AreaLbl:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( AreaLbl )
	self.AreaLbl = AreaLbl
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

