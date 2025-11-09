require( "ui.uieditor.widgets.StartMenu.DOA.DOA_ControlHelp_Text" )

CoD.DOA_ControlKBMouse = InheritFrom( LUI.UIElement )
CoD.DOA_ControlKBMouse.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.DOA_ControlKBMouse )
	self.id = "DOA_ControlKBMouse"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 776 )
	self:setTopBottom( true, false, 0, 584 )
	self.anyChildUsesUpdateState = true
	
	local triangleText = CoD.DOA_ControlHelp_Text.new( menu, controller )
	triangleText:setLeftRight( false, false, -211.5, 262.5 )
	triangleText:setTopBottom( false, false, 128.79, 153.79 )
	triangleText.defaultText:setText( Engine.Localize( "CP_DOA_BO3_CAMERA_BIND" ) )
	triangleText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	triangleText.drivingText:setText( Engine.Localize( "CP_DOA_BO3_CAMERA_BIND" ) )
	triangleText.drivingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	triangleText.doaFPSText:setText( Engine.Localize( "CP_DOA_BO3_CAMERA_BIND" ) )
	triangleText.doaFPSText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( triangleText )
	self.triangleText = triangleText
	
	local boxText1 = CoD.DOA_ControlHelp_Text.new( menu, controller )
	boxText1:setLeftRight( false, false, -211.5, 164.5 )
	boxText1:setTopBottom( false, false, 103.79, 128.79 )
	boxText1.defaultText:setText( Engine.Localize( "CP_DOA_BO3_DROP_WEAPON_EXIT_VEHICLE_BIND" ) )
	boxText1.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	boxText1.drivingText:setText( Engine.Localize( "CP_DOA_BO3_POWER_SLIDE_BIND" ) )
	boxText1.drivingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	boxText1.doaFPSText:setText( Engine.Localize( "CP_DOA_BO3_DROP_WEAPON_EXIT_VEHICLE_BIND" ) )
	boxText1.doaFPSText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( boxText1 )
	self.boxText1 = boxText1
	
	local r1Text = CoD.DOA_ControlHelp_Text.new( menu, controller )
	r1Text:setLeftRight( false, false, -211.5, 164.5 )
	r1Text:setTopBottom( false, false, 78.79, 103.79 )
	r1Text.defaultText:setText( Engine.Localize( "CP_DOA_BO3_DROP_BOMB_BIND" ) )
	r1Text.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	r1Text.drivingText:setText( Engine.Localize( "CP_DOA_BO3_STEER_BIND" ) )
	r1Text.drivingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	r1Text.doaFPSText:setText( Engine.Localize( "CP_DOA_BO3_DROP_BOMB_BIND" ) )
	r1Text.doaFPSText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( r1Text )
	self.r1Text = r1Text
	
	local boost = CoD.DOA_ControlHelp_Text.new( menu, controller )
	boost:setLeftRight( false, false, -211.5, 150.5 )
	boost:setTopBottom( false, false, 53.79, 78.79 )
	boost.defaultText:setText( Engine.Localize( "CP_DOA_BO3_SPEED_BOOST_BIND" ) )
	boost.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	boost.drivingText:setText( Engine.Localize( "CP_DOA_BO3_DRIVE_SPEED_BOOST_BIND" ) )
	boost.drivingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	boost.doaFPSText:setText( Engine.Localize( "CP_DOA_BO3_SPEED_BOOST_BIND" ) )
	boost.doaFPSText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( boost )
	self.boost = boost
	
	local lstickText = CoD.DOA_ControlHelp_Text.new( menu, controller )
	lstickText:setLeftRight( false, false, -211.5, 108.5 )
	lstickText:setTopBottom( false, false, 28.79, 53.79 )
	lstickText.defaultText:setText( Engine.Localize( "CP_DOA_BO3_MOVE_BIND" ) )
	lstickText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	lstickText.drivingText:setText( Engine.Localize( "CP_DOA_BO3_REVERSE_BIND" ) )
	lstickText.drivingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	lstickText.doaFPSText:setText( Engine.Localize( "CP_DOA_BO3_MOVE_BIND" ) )
	lstickText.doaFPSText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( lstickText )
	self.lstickText = lstickText
	
	local rstickText = CoD.DOA_ControlHelp_Text.new( menu, controller )
	rstickText:setLeftRight( false, false, -211.5, 150.5 )
	rstickText:setTopBottom( false, false, 3.79, 28.79 )
	rstickText.defaultText:setText( Engine.Localize( "CP_DOA_BO3_FIRE_BIND" ) )
	rstickText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	rstickText.drivingText:setText( Engine.Localize( "CP_DOA_BO3_ACCELERATE_BIND" ) )
	rstickText.drivingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	rstickText.doaFPSText:setText( Engine.Localize( "CP_DOA_BO3_FIRE_BIND" ) )
	rstickText.doaFPSText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( rstickText )
	self.rstickText = rstickText
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.triangleText:close()
		element.boxText1:close()
		element.r1Text:close()
		element.boost:close()
		element.lstickText:close()
		element.rstickText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

