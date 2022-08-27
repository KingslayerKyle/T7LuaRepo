-- 84554fdd83e42587ffb365e0543118f0
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )

CoD.CybercoreBranchHeaderWidget = InheritFrom( LUI.UIElement )
CoD.CybercoreBranchHeaderWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CybercoreBranchHeaderWidget )
	self.id = "CybercoreBranchHeaderWidget"
	self.soundSet = "CAC_LethalGrenade"
	self:setLeftRight( true, false, 0, 120 )
	self:setTopBottom( true, false, 0, 32 )
	self.anyChildUsesUpdateState = true
	
	local CybercoreHeaderBG = LUI.UIImage.new()
	CybercoreHeaderBG:setLeftRight( true, true, 0, 0 )
	CybercoreHeaderBG:setTopBottom( true, true, 0, 0 )
	CybercoreHeaderBG:setRGB( 0, 0, 0 )
	CybercoreHeaderBG:setAlpha( 0.5 )
	self:addElement( CybercoreHeaderBG )
	self.CybercoreHeaderBG = CybercoreHeaderBG
	
	local headerText = LUI.UIText.new()
	headerText:setLeftRight( true, true, 2, -2 )
	headerText:setTopBottom( true, false, 2, 27 )
	headerText:setScale( LanguageOverrideNumber( "japanese", 0.85, 1 ) )
	headerText:setText( Engine.Localize( LocalizeToUpperString( "MENU_NEW" ) ) )
	headerText:setTTF( "fonts/default.ttf" )
	headerText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	headerText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( headerText )
	self.headerText = headerText
	
	local HighlightFrame = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	HighlightFrame:setLeftRight( true, true, 0, 0 )
	HighlightFrame:setTopBottom( true, true, 0, 0 )
	self:addElement( HighlightFrame )
	self.HighlightFrame = HighlightFrame
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.HighlightFrame:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

