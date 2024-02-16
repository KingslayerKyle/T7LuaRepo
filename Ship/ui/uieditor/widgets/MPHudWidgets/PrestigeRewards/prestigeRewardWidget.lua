-- 13a40860055a8b9fef6b7383557f0594
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.MPHudWidgets.PrestigeRewards.prestigeRewardWidget_UI3D" )

CoD.prestigeRewardWidget = InheritFrom( LUI.UIElement )
CoD.prestigeRewardWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.prestigeRewardWidget )
	self.id = "prestigeRewardWidget"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( true, false, 0, 125 )
	self:setTopBottom( true, false, 0, 25 )
	
	local internal = CoD.prestigeRewardWidget_UI3D.new( menu, controller )
	internal:setLeftRight( true, false, 0, 125 )
	internal:setTopBottom( true, false, 0, 25 )
	Engine.SetupUI3DWindow( controller, 5, 125, 25 )
	internal:setUI3DWindow( 5 )
	internal:setRGB( 0, 0.59, 0.96 )
	self:addElement( internal )
	self.internal = internal
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.internal:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
