require( "ui.uieditor.widgets.BorderThin" )

CoD.StartMenu_Barracks_Stat = InheritFrom( LUI.UIElement )
CoD.StartMenu_Barracks_Stat.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Barracks_Stat )
	self.id = "StartMenu_Barracks_Stat"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 180 )
	self:setTopBottom( 0, 0, 0, 91 )
	
	local BorderThin0 = CoD.BorderThin.new( menu, controller )
	BorderThin0:setLeftRight( 0, 1, 0, 0 )
	BorderThin0:setTopBottom( 0, 1, 0, 0 )
	BorderThin0:setAlpha( 0 )
	self:addElement( BorderThin0 )
	self.BorderThin0 = BorderThin0
	
	local BlackBar = LUI.UIImage.new()
	BlackBar:setLeftRight( 0, 1, 2, -2 )
	BlackBar:setTopBottom( 0.5, 0.5, -41, -9 )
	BlackBar:setRGB( 0, 0, 0 )
	BlackBar:setAlpha( 0.3 )
	BlackBar:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	BlackBar:setShaderVector( 0, 0.01, 0.05, 0.01, 0.05 )
	self:addElement( BlackBar )
	self.BlackBar = BlackBar
	
	local Value = LUI.UIText.new()
	Value:setLeftRight( 0, 1, 0, 0 )
	Value:setTopBottom( 0.5, 0.5, -38, -10 )
	Value:setText( Engine.Localize( "MPUI_TOTAL_KILLS_CAPS" ) )
	Value:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Value:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Value:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Value )
	self.Value = Value
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( 0, 1, 0, 0 )
	Title:setTopBottom( 0.5, 0.5, -1, 44 )
	Title:setRGB( 1, 0.8, 0.4 )
	Title:setText( Engine.Localize( "42,000" ) )
	Title:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Title )
	self.Title = Title
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BorderThin0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

