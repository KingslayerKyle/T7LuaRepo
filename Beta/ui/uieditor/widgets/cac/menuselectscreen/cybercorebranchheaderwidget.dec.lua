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
	self:setTopBottom( true, false, 0, 29 )
	
	local CybercoreHeaderBG = LUI.UIImage.new()
	CybercoreHeaderBG:setLeftRight( true, true, 0, 0 )
	CybercoreHeaderBG:setTopBottom( true, true, 0, 0 )
	CybercoreHeaderBG:setAlpha( 0.5 )
	self:addElement( CybercoreHeaderBG )
	self.CybercoreHeaderBG = CybercoreHeaderBG
	
	local headerText = LUI.UIText.new()
	headerText:setLeftRight( true, true, 2, -2 )
	headerText:setTopBottom( true, false, 2, 27 )
	headerText:setText( Engine.Localize( LocalizeToUpperString( "MENU_NEW" ) ) )
	headerText:setTTF( "fonts/default.ttf" )
	headerText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	headerText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( headerText )
	self.headerText = headerText
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

