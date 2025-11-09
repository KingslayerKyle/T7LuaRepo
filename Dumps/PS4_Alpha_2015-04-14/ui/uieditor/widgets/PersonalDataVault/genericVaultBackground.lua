CoD.genericVaultBackground = InheritFrom( LUI.UIElement )
CoD.genericVaultBackground.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.genericVaultBackground )
	self.id = "genericVaultBackground"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	
	local TitleBacking = LUI.UIImage.new()
	TitleBacking:setLeftRight( true, true, 0, 0 )
	TitleBacking:setTopBottom( true, false, 0, 106.67 )
	TitleBacking:setRGB( 0, 0, 0 )
	TitleBacking:setImage( RegisterImage( "uie_img_t7_menu_cacselection_titlebacking" ) )
	TitleBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( TitleBacking )
	self.TitleBacking = TitleBacking
	
	local HelpBacking = LUI.UIImage.new()
	HelpBacking:setLeftRight( true, true, 0, 0 )
	HelpBacking:setTopBottom( false, true, -66, 0 )
	HelpBacking:setRGB( 0, 0, 0 )
	HelpBacking:setImage( RegisterImage( "uie_img_t7_menu_frontend_asset_helpbacking" ) )
	HelpBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( HelpBacking )
	self.HelpBacking = HelpBacking
	
	local minorTitle = LUI.UITightText.new()
	minorTitle:setLeftRight( true, false, 64, 311 )
	minorTitle:setTopBottom( true, false, 77.5, 93.5 )
	minorTitle:setRGB( 0.87, 0.88, 0.78 )
	minorTitle:setAlpha( 0.7 )
	minorTitle:setText( Engine.Localize( "CPUI_COALESCENE_DATA_SYSTEMS_COPYWRITE" ) )
	minorTitle:setTTF( "fonts/UnitedSansRgMd.ttf" )
	self:addElement( minorTitle )
	self.minorTitle = minorTitle
	
	local title = LUI.UITightText.new()
	title:setLeftRight( true, false, 64, 404 )
	title:setTopBottom( true, false, 28, 76 )
	title:setRGB( 0.87, 0.88, 0.78 )
	title:setText( Engine.Localize( "CPUI_PERSONAL_DATA_VAULT" ) )
	title:setTTF( "fonts/escom.ttf" )
	self:addElement( title )
	self.title = title
	
	local emblem = LUI.UIImage.new()
	emblem:setLeftRight( false, true, -121, -64 )
	emblem:setTopBottom( true, false, 36, 93 )
	emblem:setRGB( 1, 1, 1 )
	emblem:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( emblem )
	self.emblem = emblem
	
	local playerGreeting = LUI.UITightText.new()
	playerGreeting:setLeftRight( false, true, -353, -130 )
	playerGreeting:setTopBottom( true, false, 38, 58 )
	playerGreeting:setRGB( 0.87, 0.88, 0.78 )
	playerGreeting:setText( Engine.Localize( "CPUI_PLAYER_GREETING" ) )
	playerGreeting:setTTF( "fonts/UnitedSansRgMd.ttf" )
	self:addElement( playerGreeting )
	self.playerGreeting = playerGreeting
	
	self.emblem:linkToElementModel( self, "emblem", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			emblem:setImage( RegisterImage( modelValue ) )
		end
	end )
	self.close = function ( self )
		self.emblem:close()
		CoD.genericVaultBackground.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

