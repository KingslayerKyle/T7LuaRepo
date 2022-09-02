-- 5c172e3902266e36e26d00c90fa5e2ff
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 124 )
	self:setTopBottom( true, false, 0, 46 )
	
	local StatLabel = LUI.UIText.new()
	StatLabel:setLeftRight( false, false, -61.83, 61.83 )
	StatLabel:setTopBottom( true, false, 0, 20 )
	StatLabel:setText( Engine.Localize( "MENU_KILLS_CAPS" ) )
	StatLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	StatLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	StatLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( StatLabel )
	self.StatLabel = StatLabel
	
	local StatValue = LUI.UIText.new()
	StatValue:setLeftRight( false, false, -47.5, 47.5 )
	StatValue:setTopBottom( true, false, 20, 46 )
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

