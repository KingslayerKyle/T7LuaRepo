require( "ui.uieditor.widgets.BorderThin" )

CoD.CombatRecordStatHeader = InheritFrom( LUI.UIElement )
CoD.CombatRecordStatHeader.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CombatRecordStatHeader )
	self.id = "CombatRecordStatHeader"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 124 )
	self:setTopBottom( true, false, 0, 56 )
	self.anyChildUsesUpdateState = true
	
	local BlackBar = LUI.UIImage.new()
	BlackBar:setLeftRight( true, true, 1, -1 )
	BlackBar:setTopBottom( false, false, -24.5, -3 )
	BlackBar:setRGB( 0, 0, 0 )
	BlackBar:setAlpha( 0.3 )
	BlackBar:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	BlackBar:setShaderVector( 0, 0.01, 0.05, 0.01, 0.05 )
	self:addElement( BlackBar )
	self.BlackBar = BlackBar
	
	local StatLabel = LUI.UIText.new()
	StatLabel:setLeftRight( true, true, 0, 0 )
	StatLabel:setTopBottom( false, false, -24, -4 )
	StatLabel:setText( Engine.Localize( "MENU_KILLS_CAPS" ) )
	StatLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	StatLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	StatLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( StatLabel )
	self.StatLabel = StatLabel
	
	local StatValue = LUI.UIText.new()
	StatValue:setLeftRight( false, false, -47.5, 47.5 )
	StatValue:setTopBottom( false, false, -2, 24 )
	StatValue:setRGB( 1, 0.8, 0.4 )
	StatValue:setText( Engine.Localize( "42,000" ) )
	StatValue:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	StatValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	StatValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( StatValue )
	self.StatValue = StatValue
	
	local BorderThin0 = CoD.BorderThin.new( menu, controller )
	BorderThin0:setLeftRight( true, true, 0, 0 )
	BorderThin0:setTopBottom( true, true, 0, 0 )
	self:addElement( BorderThin0 )
	self.BorderThin0 = BorderThin0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BorderThin0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

