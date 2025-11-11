require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )
require( "ui.uieditor.widgets.Lobby.Common.FE_MemberBlurPanelContainer" )

CoD.Competitive_LobbyWidget_Title = InheritFrom( LUI.UIElement )
CoD.Competitive_LobbyWidget_Title.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Competitive_LobbyWidget_Title )
	self.id = "Competitive_LobbyWidget_Title"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 627 )
	self:setTopBottom( 0, 0, 0, 45 )
	self.anyChildUsesUpdateState = true
	
	local FEMemberBlurPanelContainer0 = CoD.FE_MemberBlurPanelContainer.new( menu, controller )
	FEMemberBlurPanelContainer0:setLeftRight( 0, 1, 0, 0 )
	FEMemberBlurPanelContainer0:setTopBottom( 0, 1, 0, 0 )
	self:addElement( FEMemberBlurPanelContainer0 )
	self.FEMemberBlurPanelContainer0 = FEMemberBlurPanelContainer0
	
	local TitleGlow1 = CoD.cac_ItemTitleGlow.new( menu, controller )
	TitleGlow1:setLeftRight( 0, 1, -4, 4 )
	TitleGlow1:setTopBottom( 0, 1, -4, 4 )
	TitleGlow1:setRGB( 0.9, 0.9, 0.9 )
	self:addElement( TitleGlow1 )
	self.TitleGlow1 = TitleGlow1
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( 0, 1, -81, 73 )
	Glow:setTopBottom( 0.5, 0.5, -45, 65 )
	Glow:setAlpha( 0.5 )
	Glow:setImage( RegisterImage( "uie_t7_menu_cac_glow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( 0, 0, 4, 828 )
	Title:setTopBottom( 0.5, 0.5, -19.5, 19.5 )
	Title:setRGB( 0, 0, 0 )
	Title:setText( LocalizeIntoString( "", "Care Package" ) )
	Title:setTTF( "fonts/escom.ttf" )
	Title:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	Title:setShaderVector( 0, 0.06, 0, 0, 0 )
	Title:setShaderVector( 1, 0.02, 0, 0, 0 )
	Title:setShaderVector( 2, 1, 0, 0, 0 )
	Title:setLetterSpacing( 0.6 )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( Title, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 2 )
	end )
	self:addElement( Title )
	self.Title = Title
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FEMemberBlurPanelContainer0:close()
		self.TitleGlow1:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

