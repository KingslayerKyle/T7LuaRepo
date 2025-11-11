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
	self:setLeftRight( 0, 0, 0, 180 )
	self:setTopBottom( 0, 0, 0, 48 )
	
	local CybercoreHeaderBG = LUI.UIImage.new()
	CybercoreHeaderBG:setLeftRight( 0, 1, 0, 0 )
	CybercoreHeaderBG:setTopBottom( 0, 1, 0, 0 )
	CybercoreHeaderBG:setRGB( 0, 0, 0 )
	CybercoreHeaderBG:setAlpha( 0.5 )
	self:addElement( CybercoreHeaderBG )
	self.CybercoreHeaderBG = CybercoreHeaderBG
	
	local headerText = LUI.UIText.new()
	headerText:setLeftRight( 0, 1, 3, -3 )
	headerText:setTopBottom( 0, 0, 3, 41 )
	headerText:setScale( LanguageOverrideNumber( "japanese", 0.85, 1 ) )
	headerText:setText( LocalizeToUpperString( "MENU_NEW" ) )
	headerText:setTTF( "fonts/default.ttf" )
	headerText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	headerText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( headerText )
	self.headerText = headerText
	
	local HighlightFrame = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	HighlightFrame:setLeftRight( 0, 1, 0, 0 )
	HighlightFrame:setTopBottom( 0, 1, 0, 0 )
	self:addElement( HighlightFrame )
	self.HighlightFrame = HighlightFrame
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.HighlightFrame:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

