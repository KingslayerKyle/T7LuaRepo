CoD.CombatRecordSummaryStat = InheritFrom( LUI.UIElement )
CoD.CombatRecordSummaryStat.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CombatRecordSummaryStat )
	self.id = "CombatRecordSummaryStat"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 186 )
	self:setTopBottom( 0, 0, 0, 69 )
	
	local StatLabel = LUI.UIText.new()
	StatLabel:setLeftRight( 0.5, 0.5, -92.5, 92.5 )
	StatLabel:setTopBottom( 0, 0, 0, 30 )
	StatLabel:setText( Engine.Localize( "MENU_KILLS_CAPS" ) )
	StatLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	StatLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	StatLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( StatLabel )
	self.StatLabel = StatLabel
	
	local StatValue = LUI.UIText.new()
	StatValue:setLeftRight( 0.5, 0.5, -71, 71 )
	StatValue:setTopBottom( 0, 0, 30, 69 )
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

