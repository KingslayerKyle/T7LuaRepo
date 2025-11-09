CoD.Notification_Timer = InheritFrom( LUI.UIElement )
CoD.Notification_Timer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Notification_Timer )
	self.id = "Notification_Timer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 178 )
	self:setTopBottom( true, false, 0, 45 )
	
	local Icon0 = LUI.UIImage.new()
	Icon0:setLeftRight( false, true, -99, -68 )
	Icon0:setTopBottom( false, true, -38.5, -6.5 )
	Icon0:setRGB( 1, 1, 1 )
	Icon0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Icon0 )
	self.Icon0 = Icon0
	
	local Icon1 = LUI.UIImage.new()
	Icon1:setLeftRight( false, true, -65, -34 )
	Icon1:setTopBottom( false, true, -38.5, -6.5 )
	Icon1:setRGB( 1, 1, 1 )
	Icon1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Icon1 )
	self.Icon1 = Icon1
	
	local Icon2 = LUI.UIImage.new()
	Icon2:setLeftRight( false, true, -31, 0 )
	Icon2:setTopBottom( false, true, -38.5, -6.5 )
	Icon2:setRGB( 1, 1, 1 )
	Icon2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Icon2 )
	self.Icon2 = Icon2
	
	local Clock = LUI.UITightText.new()
	Clock:setLeftRight( true, false, 0, 77 )
	Clock:setTopBottom( true, false, 0, 45 )
	Clock:setTTF( "fonts/default.ttf" )
	self:addElement( Clock )
	self.Clock = Clock
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

