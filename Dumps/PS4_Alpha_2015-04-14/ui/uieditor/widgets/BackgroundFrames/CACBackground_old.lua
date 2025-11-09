require( "ui.uieditor.widgets.CAC.ClassAllocation" )
require( "ui.uieditor.widgets.CAC.TitleDotsWidget" )

CoD.CACBackground_old = InheritFrom( LUI.UIElement )
CoD.CACBackground_old.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CACBackground_old )
	self.id = "CACBackground_old"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local TitleBacking = LUI.UIImage.new()
	TitleBacking:setLeftRight( true, true, 0, 0 )
	TitleBacking:setTopBottom( true, false, 0, 82.67 )
	TitleBacking:setRGB( 1, 1, 1 )
	TitleBacking:setImage( RegisterImage( "uie_img_t7_menu_cacselection_titlebacking" ) )
	TitleBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( TitleBacking )
	self.TitleBacking = TitleBacking
	
	local playerPreview = LUI.UIImage.new()
	playerPreview:setLeftRight( true, false, 304.81, 794.31 )
	playerPreview:setTopBottom( true, false, 20, 999 )
	playerPreview:setRGB( 1, 1, 1 )
	playerPreview:setAlpha( 0 )
	playerPreview:setImage( RegisterImage( "uie_t7_menu_mp_cac_tempcharacter" ) )
	playerPreview:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( playerPreview )
	self.playerPreview = playerPreview
	
	local HelpBacking = LUI.UIImage.new()
	HelpBacking:setLeftRight( true, true, 0, 0 )
	HelpBacking:setTopBottom( false, true, -66, 0 )
	HelpBacking:setRGB( 1, 1, 1 )
	HelpBacking:setImage( RegisterImage( "uie_img_t7_menu_frontend_asset_helpbacking" ) )
	HelpBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( HelpBacking )
	self.HelpBacking = HelpBacking
	
	local classAllocation = CoD.ClassAllocation.new( menu, controller )
	classAllocation:setLeftRight( false, true, -494, -59 )
	classAllocation:setTopBottom( true, false, 32, 67 )
	classAllocation:setRGB( 1, 1, 1 )
	classAllocation:linkToElementModel( self, nil, false, function ( model )
		classAllocation:setModel( model, controller )
	end )
	self:addElement( classAllocation )
	self.classAllocation = classAllocation
	
	local TitleDotsWidget = CoD.TitleDotsWidget.new( menu, controller )
	TitleDotsWidget:setLeftRight( true, false, 3, 528.34 )
	TitleDotsWidget:setTopBottom( true, false, -65.33, 92.67 )
	TitleDotsWidget:setRGB( 1, 1, 1 )
	TitleDotsWidget:setAlpha( 0.49 )
	self:addElement( TitleDotsWidget )
	self.TitleDotsWidget = TitleDotsWidget
	
	local titleLabel = LUI.UITightText.new()
	titleLabel:setLeftRight( true, false, 64, 141 )
	titleLabel:setTopBottom( true, false, 28, 76 )
	titleLabel:setRGB( 0.87, 0.88, 0.78 )
	titleLabel:setText( Engine.Localize( "MENU_NEW" ) )
	titleLabel:setTTF( "fonts/escom.ttf" )
	self:addElement( titleLabel )
	self.titleLabel = titleLabel
	
	self.close = function ( self )
		self.classAllocation:close()
		self.TitleDotsWidget:close()
		CoD.CACBackground_old.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

