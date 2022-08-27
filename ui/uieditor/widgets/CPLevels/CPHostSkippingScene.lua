-- 3c3097f6fb6addad5458841537710757
-- This hash is used for caching, delete to decompile the file again

CoD.CPHostSkippingScene = InheritFrom( LUI.UIElement )
CoD.CPHostSkippingScene.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CPHostSkippingScene )
	self.id = "CPHostSkippingScene"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 187 )
	self:setTopBottom( true, false, 0, 25 )
	
	local Label0 = LUI.UITightText.new()
	Label0:setLeftRight( true, true, 14, -14 )
	Label0:setTopBottom( true, true, 0, 0 )
	Label0:setText( Engine.Localize( "MENU_HOST_SKIPPING_SCENE" ) )
	Label0:setTTF( "fonts/default.ttf" )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

