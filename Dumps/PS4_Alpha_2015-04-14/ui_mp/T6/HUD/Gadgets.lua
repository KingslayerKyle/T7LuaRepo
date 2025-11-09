CoD.GadgetsHUD = {}
CoD.GadgetsHUD.horizontalOffset = 200
CoD.GadgetsHUD.Bottom = 200
CoD.GadgetsHUD.Width = 60
CoD.GadgetsHUD.Height = 20
CoD.GadgetsHUD.Border = 3
CoD.GadgetsHUD.Alpha = 1
LUI.createMenu.GadgetsHUD = function ( controller )
	local self = CoD.Menu.NewSafeAreaFromState( "Gadgets", controller )
	local gadgetFirst = LUI.UIImage.new()
	gadgetFirst:setLeftRight( false, true, -CoD.GadgetsHUD.horizontalOffset - CoD.GadgetsHUD.Width, -CoD.GadgetsHUD.horizontalOffset )
	gadgetFirst:setTopBottom( false, true, -CoD.GadgetsHUD.Bottom - CoD.GadgetsHUD.Height, -CoD.GadgetsHUD.Bottom )
	gadgetFirst:setImage( RegisterMaterial( "white" ) )
	gadgetFirst:setAlpha( CoD.GadgetsHUD.Alpha )
	self.gadgetFirst = gadgetFirst
	self:addElement( gadgetFirst )
	gadgetFirst:setupGadget( 0 )
	local gadgetSecond = LUI.UIImage.new()
	gadgetSecond:setLeftRight( true, false, CoD.GadgetsHUD.horizontalOffset, CoD.GadgetsHUD.horizontalOffset + CoD.GadgetsHUD.Width )
	gadgetSecond:setTopBottom( false, true, -CoD.GadgetsHUD.Bottom - CoD.GadgetsHUD.Height, -CoD.GadgetsHUD.Bottom )
	gadgetSecond:setImage( RegisterMaterial( "white" ) )
	gadgetSecond:setAlpha( CoD.GadgetsHUD.Alpha )
	self.gadgetSecond = gadgetSecond
	self:addElement( gadgetSecond )
	gadgetSecond:setupGadget( 1 )
	self:setAlpha( CoD.GadgetsHUD.Alpha )
	return self
end

