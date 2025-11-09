require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FeaturedTag" )
require( "ui.uieditor.widgets.Lobby.Common.FE_LabelBodyA" )

CoD.FE_FeaturedSubHeader = InheritFrom( LUI.UIElement )
CoD.FE_FeaturedSubHeader.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_FeaturedSubHeader )
	self.id = "FE_FeaturedSubHeader"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 138 )
	self:setTopBottom( true, false, 0, 28 )
	self.anyChildUsesUpdateState = true
	
	local panel0 = CoD.FE_ButtonPanelShaderContainer.new( menu, controller )
	panel0:setLeftRight( true, true, 2, 0 )
	panel0:setTopBottom( false, false, -12, 12 )
	panel0:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( panel0 )
	self.panel0 = panel0
	
	local IconBacking = LUI.UIImage.new()
	IconBacking:setLeftRight( true, false, 0, 24 )
	IconBacking:setTopBottom( true, false, 0, 28 )
	IconBacking:setRGB( 1, 1, 1 )
	IconBacking:setImage( RegisterImage( "uie_t7_menu_frontend_featuredtagiconbacking" ) )
	IconBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( IconBacking )
	self.IconBacking = IconBacking
	
	local TagBacking = CoD.FE_FeaturedTag.new( menu, controller )
	TagBacking:setLeftRight( true, true, 22, 0 )
	TagBacking:setTopBottom( true, false, 2, 26 )
	TagBacking:setRGB( 1, 1, 1 )
	self:addElement( TagBacking )
	self.TagBacking = TagBacking
	
	local icon = LUI.UIImage.new()
	icon:setLeftRight( true, false, 4, 20 )
	icon:setTopBottom( true, false, 6, 22 )
	icon:setRGB( 0, 0, 0 )
	icon:setImage( RegisterImage( "uie_t7_menu_frontend_icongroup" ) )
	icon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( icon )
	self.icon = icon
	
	local FELabelBodyA0 = CoD.FE_LabelBodyA.new( menu, controller )
	FELabelBodyA0:setLeftRight( true, false, 29, 134 )
	FELabelBodyA0:setTopBottom( true, false, 4, 23 )
	FELabelBodyA0:setRGB( 1, 1, 1 )
	FELabelBodyA0.TextBox0:setRGB( 0, 0, 0 )
	FELabelBodyA0.TextBox0:setText( Engine.Localize( "Primary Group" ) )
	FELabelBodyA0.TextBox0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	FELabelBodyA0.TextBox0:setLetterSpacing( 1 )
	self:addElement( FELabelBodyA0 )
	self.FELabelBodyA0 = FELabelBodyA0
	
	self.close = function ( self )
		self.panel0:close()
		self.TagBacking:close()
		self.FELabelBodyA0:close()
		CoD.FE_FeaturedSubHeader.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

