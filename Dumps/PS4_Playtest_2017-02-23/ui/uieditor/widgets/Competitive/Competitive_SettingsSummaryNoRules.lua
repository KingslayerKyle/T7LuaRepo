require( "ui.uieditor.widgets.Lobby.Common.FE_MemberBlurPanelContainer" )

CoD.Competitive_SettingsSummaryNoRules = InheritFrom( LUI.UIElement )
CoD.Competitive_SettingsSummaryNoRules.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Competitive_SettingsSummaryNoRules )
	self.id = "Competitive_SettingsSummaryNoRules"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 412 )
	self:setTopBottom( 0, 0, 0, 105 )
	self.anyChildUsesUpdateState = true
	
	local BlackBack = LUI.UIImage.new()
	BlackBack:setLeftRight( 0, 1, 0, 0 )
	BlackBack:setTopBottom( 0, 1, 0, -2 )
	BlackBack:setRGB( 0, 0, 0 )
	BlackBack:setAlpha( 0.2 )
	self:addElement( BlackBack )
	self.BlackBack = BlackBack
	
	local FEMemberBlurPanelContainer0 = CoD.FE_MemberBlurPanelContainer.new( menu, controller )
	FEMemberBlurPanelContainer0:setLeftRight( 0, 1, 0, -2 )
	FEMemberBlurPanelContainer0:setTopBottom( 0, 1, 0, 0 )
	FEMemberBlurPanelContainer0:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( FEMemberBlurPanelContainer0 )
	self.FEMemberBlurPanelContainer0 = FEMemberBlurPanelContainer0
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( 0, 0, 7, 405 )
	Title:setTopBottom( 0, 0, 9, 36 )
	Title:setAlpha( 0 )
	Title:setText( Engine.Localize( "MENU_BAN_PROTECT_ACTIVE_CAPS" ) )
	Title:setTTF( "fonts/escom.ttf" )
	Title:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	Title:setShaderVector( 0, 0.09, 0, 0, 0 )
	Title:setShaderVector( 1, 0.06, 0, 0, 0 )
	Title:setShaderVector( 2, 1, 0, 0, 0 )
	Title:setLetterSpacing( 0.5 )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Title )
	self.Title = Title
	
	local Description = LUI.UIText.new()
	Description:setLeftRight( 0, 0, 11, 405 )
	Description:setTopBottom( 0, 0, 9, 39 )
	Description:setText( Engine.Localize( "MENU_BAN_PROTECT_ACTIVE_DESC" ) )
	Description:setTTF( "fonts/default.ttf" )
	Description:setLineSpacing( -3 )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Description )
	self.Description = Description
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FEMemberBlurPanelContainer0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

