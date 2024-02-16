-- 286d720bad33e96d21796e67ede5d315
-- This hash is used for caching, delete to decompile the file again

CoD.AARMedalsListWidget = InheritFrom( LUI.UIElement )
CoD.AARMedalsListWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.AARMedalsListWidget )
	self.id = "AARMedalsListWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 240 )
	self:setTopBottom( true, false, 0, 75 )
	
	local medalIcon = LUI.UIImage.new()
	medalIcon:setLeftRight( true, false, 0, 75 )
	medalIcon:setTopBottom( true, true, 0, 0 )
	medalIcon:setImage( RegisterImage( "uie_hud_medals_default" ) )
	self:addElement( medalIcon )
	self.medalIcon = medalIcon
	
	local medalNameLabel = LUI.UITightText.new()
	medalNameLabel:setLeftRight( true, false, 85, 123 )
	medalNameLabel:setTopBottom( true, true, 27.5, -22.5 )
	medalNameLabel:setText( Engine.Localize( "MPUI_KILLER" ) )
	medalNameLabel:setTTF( "fonts/default.ttf" )
	self:addElement( medalNameLabel )
	self.medalNameLabel = medalNameLabel
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
