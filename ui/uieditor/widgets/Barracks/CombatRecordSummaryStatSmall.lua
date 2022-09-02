-- 7955d22e707802daab8653eb5e27e76c
-- This hash is used for caching, delete to decompile the file again

CoD.CombatRecordSummaryStatSmall = InheritFrom( LUI.UIElement )
CoD.CombatRecordSummaryStatSmall.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CombatRecordSummaryStatSmall )
	self.id = "CombatRecordSummaryStatSmall"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 124 )
	self:setTopBottom( true, false, 0, 36 )
	
	local StatLabel = LUI.UIText.new()
	StatLabel:setLeftRight( false, false, -61.83, 61.83 )
	StatLabel:setTopBottom( true, false, -2, 18 )
	StatLabel:setText( Engine.Localize( "MENU_KILLS_CAPS" ) )
	StatLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	StatLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	StatLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( StatLabel )
	self.StatLabel = StatLabel
	
	local StatValue = LUI.UIText.new()
	StatValue:setLeftRight( false, false, -47.5, 47.5 )
	StatValue:setTopBottom( true, false, 18, 38 )
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

