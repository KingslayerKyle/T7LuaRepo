-- bfdcda578401eec8bbc22d92581b2465
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.VehicleHUDs.mothership.vhud_ModDNITime" )

CoD.vhud_hcxd_Timebar = InheritFrom( LUI.UIElement )
CoD.vhud_hcxd_Timebar.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.vhud_hcxd_Timebar )
	self.id = "vhud_hcxd_Timebar"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 218 )
	self:setTopBottom( true, false, 0, 9 )
	self.anyChildUsesUpdateState = true
	
	local vhudModDNITime0 = CoD.vhud_ModDNITime.new( menu, controller )
	vhudModDNITime0:setLeftRight( true, false, -29.13, 22.88 )
	vhudModDNITime0:setTopBottom( true, false, -24, 33 )
	vhudModDNITime0:setRGB( 0.81, 0.96, 1 )
	self:addElement( vhudModDNITime0 )
	self.vhudModDNITime0 = vhudModDNITime0
	
	local Bar = LUI.UIImage.new()
	Bar:setLeftRight( true, false, 10.43, 218.43 )
	Bar:setTopBottom( true, false, 0, 8 )
	Bar:setRGB( 0.81, 0.96, 1 )
	Bar:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_timebarsolid" ) )
	Bar:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	Bar:setShaderVector( 1, 0, 0, 0, 0 )
	Bar:setShaderVector( 2, 1, 0, 0, 0 )
	Bar:setShaderVector( 3, 0, 0, 0, 0 )
	Bar:linkToElementModel( self, "remainingTime", true, function ( model )
		local remainingTime = Engine.GetModelValue( model )
		if remainingTime then
			Bar:setShaderVector( 0, CoD.GetVectorComponentFromString( remainingTime, 1 ), CoD.GetVectorComponentFromString( remainingTime, 2 ), CoD.GetVectorComponentFromString( remainingTime, 3 ), CoD.GetVectorComponentFromString( remainingTime, 4 ) )
		end
	end )
	self:addElement( Bar )
	self.Bar = Bar
	
	local Frame = LUI.UIImage.new()
	Frame:setLeftRight( true, false, 10.43, 218.43 )
	Frame:setTopBottom( true, false, 0.31, 8.31 )
	Frame:setRGB( 0.81, 0.96, 1 )
	Frame:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_timebar" ) )
	Frame:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Frame )
	self.Frame = Frame
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.vhudModDNITime0:close()
		element.Bar:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

