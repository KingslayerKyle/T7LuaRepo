CoD.NotificationDoubleXP = {}
CoD.NotificationDoubleXP.Height = 40
CoD.NotificationDoubleXP.Width = 80
CoD.NotificationDoubleXP.Delay = 400
CoD.NotificationDoubleXP.InTime = 150
CoD.NotificationDoubleXP.New = function ( top, delay, inTime )
	local doubleXPContainer = LUI.UIElement.new()
	doubleXPContainer:setAlpha( 0 )
	doubleXPContainer:registerEventHandler( "inState", CoD.NotificationDoubleXP.In )
	doubleXPContainer:registerEventHandler( "transition_complete_in", CoD.NotificationDoubleXP.InComplete )
	local doubleXPImage = LUI.UIImage.new()
	doubleXPImage:setLeftRight( true, true, 0, 0 )
	doubleXPImage:setTopBottom( true, true, 0, 0 )
	doubleXPImage:setImage( RegisterMaterial( "menu_x2_xp_notify" ) )
	doubleXPImage:setAlpha( 1 )
	doubleXPContainer.image = doubleXPImage
	doubleXPContainer:addElement( doubleXPImage )
	doubleXPContainer.top = top
	if delay == nil then
		delay = CoD.NotificationDoubleXP.Delay
	end
	if inTime == nil then
		inTime = CoD.NotificationDoubleXP.InTime
	end
	doubleXPContainer.inTime = inTime
	doubleXPContainer:addElement( LUI.UITimer.new( delay, "inState", true, doubleXPContainer ) )
	return doubleXPContainer
end

CoD.NotificationDoubleXP.In = function ( self, event )
	self:beginAnimation( "in", self.inTime, true, false )
	self:setLeftRight( false, false, -CoD.NotificationDoubleXP.Width / 2, CoD.NotificationDoubleXP.Width / 2 )
	self:setTopBottom( true, false, self.top, self.top + CoD.NotificationDoubleXP.Height )
	self:setAlpha( 1 )
	Engine.PlaySound( "uin_lau_doublexp" )
end

CoD.NotificationDoubleXP.InComplete = function ( self, event )
	self.image:setupBitchinFX( RegisterMaterial( "bitchin_glint" ) )
	self.image:playBitchinFX( 600 )
end

