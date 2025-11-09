require( "ui.uieditor.widgets.Lobby.Common.FE_PanelNoBlur" )

CoD.PersonalizePrompt = InheritFrom( LUI.UIElement )
CoD.PersonalizePrompt.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PersonalizePrompt )
	self.id = "PersonalizePrompt"
	self.soundSet = "CAC"
	self:setLeftRight( true, false, 0, 123 )
	self:setTopBottom( true, false, 0, 20 )
	
	local Panel = CoD.FE_PanelNoBlur.new( menu, controller )
	Panel:setLeftRight( true, true, 0, 0 )
	Panel:setTopBottom( false, false, -10, 10 )
	Panel:setRGB( 0, 0, 0 )
	Panel:setAlpha( 0.7 )
	self:addElement( Panel )
	self.Panel = Panel
	
	local promptText = LUI.UIText.new()
	promptText:setLeftRight( true, true, 5.18, 0 )
	promptText:setTopBottom( false, false, -8, 8 )
	promptText:setRGB( 0.82, 0.85, 0.88 )
	promptText:setText( Engine.Localize( "MPUI_BUTTON_PERSONALIZE_CAPS" ) )
	promptText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	promptText:setLetterSpacing( 0.5 )
	promptText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	promptText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( promptText )
	self.promptText = promptText
	
	self.close = function ( self )
		self.Panel:close()
		CoD.PersonalizePrompt.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

