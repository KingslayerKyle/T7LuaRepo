require( "ui.uieditor.widgets.MPHudWidgets.PrestigeRewards.prestigeRewardWidget_UI3D_v2" )

CoD.prestigeRewardWidget_v2 = InheritFrom( LUI.UIElement )
CoD.prestigeRewardWidget_v2.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.prestigeRewardWidget_v2 )
	self.id = "prestigeRewardWidget_v2"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( true, false, 0, 153 )
	self:setTopBottom( true, false, 0, 25 )
	
	local internal = CoD.prestigeRewardWidget_UI3D_v2.new( menu, controller )
	internal:setLeftRight( true, false, 0, 153 )
	internal:setTopBottom( true, false, 0, 25 )
	Engine.SetupUI3DWindow( controller, 5, 153, 25 )
	internal:setUI3DWindow( 5 )
	internal:setRGB( 0.78, 0.99, 0.99 )
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

