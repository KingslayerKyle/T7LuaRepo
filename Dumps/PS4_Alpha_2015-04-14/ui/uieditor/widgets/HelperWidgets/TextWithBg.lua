require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )

CoD.TextWithBg = InheritFrom( LUI.UIElement )
CoD.TextWithBg.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.TextWithBg )
	self.id = "TextWithBg"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 349 )
	self:setTopBottom( true, false, 0, 38 )
	self.anyChildUsesUpdateState = true
	
	local BgNew = CoD.FE_ButtonPanelShaderContainer.new( menu, controller )
	BgNew:setLeftRight( true, true, 0, 0 )
	BgNew:setTopBottom( true, true, 0, 0 )
	BgNew:setRGB( 1, 1, 1 )
	BgNew:setAlpha( 0 )
	BgNew.FEButtonPanel:setShaderVector( 0, 30, 0, 0, 0 )
	self:addElement( BgNew )
	self.BgNew = BgNew
	
	local Bg = LUI.UIImage.new()
	Bg:setLeftRight( true, true, 0, 0 )
	Bg:setTopBottom( true, true, 0, 0 )
	Bg:setRGB( 0, 0, 0 )
	Bg:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Bg )
	self.Bg = Bg
	
	local Text = LUI.UIText.new()
	Text:setLeftRight( false, false, -174.5, 174.5 )
	Text:setTopBottom( false, false, -12.5, 12.5 )
	Text:setRGB( 1, 1, 1 )
	Text:setText( Engine.Localize( "MENU_NEW" ) )
	Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Text )
	self.Text = Text
	
	self.close = function ( self )
		self.BgNew:close()
		CoD.TextWithBg.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

