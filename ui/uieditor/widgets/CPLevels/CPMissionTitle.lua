-- 550615c666105d2755409e50fa1ca597
-- This hash is used for caching, delete to decompile the file again

CoD.CPMissionTitle = InheritFrom( LUI.UIElement )
CoD.CPMissionTitle.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.CPMissionTitle )
	self.id = "CPMissionTitle"
	self.soundSet = "MultiplayerMain"
	self:setLeftRight( true, false, 0, 542 )
	self:setTopBottom( true, false, 0, 49 )
	
	local SecTitleBG0 = LUI.UIImage.new()
	SecTitleBG0:setLeftRight( true, false, 0, 542.1 )
	SecTitleBG0:setTopBottom( true, false, 1, 49.22 )
	SecTitleBG0:setAlpha( 0.65 )
	SecTitleBG0:setImage( RegisterImage( "uie_t7_menu_cp_vault_sec_title_bg" ) )
	self:addElement( SecTitleBG0 )
	self.SecTitleBG0 = SecTitleBG0
	
	local Image31 = LUI.UIImage.new()
	Image31:setLeftRight( true, false, 4, 32 )
	Image31:setTopBottom( true, false, 0, 4.22 )
	Image31:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image31:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image31 )
	self.Image31 = Image31
	
	local Image300 = LUI.UIImage.new()
	Image300:setLeftRight( true, false, 4, 32 )
	Image300:setTopBottom( true, false, 45, 49.22 )
	Image300:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image300:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image300 )
	self.Image300 = Image300
	
	local BriefingHeading = LUI.UITightText.new()
	BriefingHeading:setLeftRight( true, false, 41, 254 )
	BriefingHeading:setTopBottom( true, false, 14.11, 36.11 )
	BriefingHeading:setText( Engine.Localize( "MENU_MISSION_BRIEFING_CAPS" ) )
	BriefingHeading:setTTF( "fonts/escom.ttf" )
	BriefingHeading:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	BriefingHeading:setShaderVector( 0, 0.06, 0, 0, 0 )
	BriefingHeading:setShaderVector( 1, 0.02, 0, 0, 0 )
	BriefingHeading:setShaderVector( 2, 1, 0, 0, 0 )
	BriefingHeading:setLetterSpacing( 2 )
	self:addElement( BriefingHeading )
	self.BriefingHeading = BriefingHeading
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

