-- e74c5ea819a8dd8034f4713576f6d6c2
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.PerksWidget_InGame" )

CoD.SpecialtyPerksWidget_InGame = InheritFrom( LUI.UIElement )
CoD.SpecialtyPerksWidget_InGame.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SpecialtyPerksWidget_InGame )
	self.id = "SpecialtyPerksWidget_InGame"
	self.soundSet = "CAC"
	self:setLeftRight( true, false, 0, 196 )
	self:setTopBottom( true, false, 0, 145 )
	self.anyChildUsesUpdateState = true
	
	local perk1 = CoD.PerksWidget_InGame.new( menu, controller )
	perk1:setLeftRight( false, true, -196, -134 )
	perk1:setTopBottom( true, false, 0, 145 )
	perk1.header:setText( Engine.Localize( "MPUI_PERK1_CAPS" ) )
	self:addElement( perk1 )
	self.perk1 = perk1
	
	local perk2 = CoD.PerksWidget_InGame.new( menu, controller )
	perk2:setLeftRight( true, false, 67, 129 )
	perk2:setTopBottom( true, false, 0, 145 )
	perk2.header:setText( Engine.Localize( "MPUI_PERK2_CAPS" ) )
	self:addElement( perk2 )
	self.perk2 = perk2
	
	local perk3 = CoD.PerksWidget_InGame.new( menu, controller )
	perk3:setLeftRight( false, true, -62, 0 )
	perk3:setTopBottom( true, false, 0, 145 )
	perk3.header:setText( Engine.Localize( "MPUI_PERK3_CAPS" ) )
	self:addElement( perk3 )
	self.perk3 = perk3
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.perk1:close()
		element.perk2:close()
		element.perk3:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

