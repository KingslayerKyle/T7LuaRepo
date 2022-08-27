-- b9b7331cda9db51f779fc84b8aa0ded4
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 191 )
	self:setTopBottom( true, false, 0, 61 )
	
	local StatLabel = LUI.UIText.new()
	StatLabel:setLeftRight( false, false, -94.5, 94.5 )
	StatLabel:setTopBottom( true, false, 5, 24 )
	StatLabel:setText( Engine.Localize( "MENU_KILLS_CAPS" ) )
	StatLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	StatLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	StatLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( StatLabel )
	self.StatLabel = StatLabel
	
	local StatValue = LUI.UIText.new()
	StatValue:setLeftRight( false, false, -94.5, 94.5 )
	StatValue:setTopBottom( true, false, 28, 58 )
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

