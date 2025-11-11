require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )

CoD.ChooseCharacterLoadout_TabBar = InheritFrom( LUI.UIElement )
CoD.ChooseCharacterLoadout_TabBar.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChooseCharacterLoadout_TabBar )
	self.id = "ChooseCharacterLoadout_TabBar"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 172 )
	self:setTopBottom( 0, 0, 0, 42 )
	
	local cacItemTitleGlow0 = CoD.cac_ItemTitleGlow.new( menu, controller )
	cacItemTitleGlow0:setLeftRight( 0, 1, 0, 0 )
	cacItemTitleGlow0:setTopBottom( 0, 1, 0, 0 )
	cacItemTitleGlow0:setRGB( 0.9, 0.9, 0.9 )
	self:addElement( cacItemTitleGlow0 )
	self.cacItemTitleGlow0 = cacItemTitleGlow0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.cacItemTitleGlow0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

