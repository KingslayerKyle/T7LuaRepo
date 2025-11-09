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
	self:setLeftRight( true, false, 0, 120 )
	self:setTopBottom( true, false, 0, 61 )
	
	local BorderThin0 = CoD.BorderThin.new( menu, controller )
	BorderThin0:setLeftRight( true, true, 0, 0 )
	BorderThin0:setTopBottom( true, true, 0, 0 )
	BorderThin0:setRGB( 1, 1, 1 )
	self:addElement( BorderThin0 )
	self.BorderThin0 = BorderThin0
	
	local Value = LUI.UIText.new()
	Value:setLeftRight( true, true, 0, -0.33 )
	Value:setTopBottom( false, false, -24, -6 )
	Value:setRGB( 1, 1, 1 )
	Value:setText( Engine.Localize( "MPUI_TOTAL_KILLS_CAPS" ) )
	Value:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Value:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Value:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Value )
	self.Value = Value
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( true, true, 0, -0.33 )
	Title:setTopBottom( false, false, -4, 28 )
	Title:setRGB( 1, 0.8, 0.4 )
	Title:setText( Engine.Localize( "42,000" ) )
	Title:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Title )
	self.Title = Title
	
	self.close = function ( self )
		self.BorderThin0:close()
		CoD.StartMenu_Barracks_Stat.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

