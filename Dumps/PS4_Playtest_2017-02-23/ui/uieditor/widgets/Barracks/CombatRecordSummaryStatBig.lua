CoD.CombatRecordSummaryStatBig = InheritFrom( LUI.UIElement )
CoD.CombatRecordSummaryStatBig.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CombatRecordSummaryStatBig )
	self.id = "CombatRecordSummaryStatBig"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 286 )
	self:setTopBottom( 0, 0, 0, 91 )
	
	local StatLabel = LUI.UIText.new()
	StatLabel:setLeftRight( 0.5, 0.5, -142, 142 )
	StatLabel:setTopBottom( 0, 0, 8, 36 )
	StatLabel:setText( Engine.Localize( "MENU_KILLS_CAPS" ) )
	StatLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	StatLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	StatLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( StatLabel )
	self.StatLabel = StatLabel
	
	local StatValue = LUI.UIText.new()
	StatValue:setLeftRight( 0.5, 0.5, -142, 142 )
	StatValue:setTopBottom( 0, 0, 42, 87 )
	StatValue:setRGB( 1, 0.8, 0.4 )
	StatValue:setText( Engine.Localize( "42,000" ) )
	StatValue:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	StatValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	StatValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( StatValue )
	self.StatValue = StatValue
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

