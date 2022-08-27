-- 960d23e5895beadc3065d9e77877dcf2
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.VehicleHUDs.mothership.vhud_ms_DamageSideContainer" )
require( "ui.uieditor.widgets.VehicleHUDs.mothership.vhud_ms_NotificationSeatingSide" )
require( "ui.uieditor.widgets.VehicleHUDs.mothership.vhud_ms_NotificationSeatingTop" )

CoD.vhud_ms_Seating = InheritFrom( LUI.UIElement )
CoD.vhud_ms_Seating.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.vhud_ms_Seating )
	self.id = "vhud_ms_Seating"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 101 )
	self:setTopBottom( true, false, 0, 106 )
	self.anyChildUsesUpdateState = true
	
	local msDamageFillBar = LUI.UIImage.new()
	msDamageFillBar:setLeftRight( false, false, -39, 39 )
	msDamageFillBar:setTopBottom( false, false, -36.5, 41.5 )
	msDamageFillBar:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_damagefillbar" ) )
	msDamageFillBar:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
	msDamageFillBar:setShaderVector( 0, 0, 1, 0, 0 )
	msDamageFillBar:setShaderVector( 1, 0, 0, 0, 0 )
	msDamageFillBar:setShaderVector( 3, 0, 0, 0, 0 )
	msDamageFillBar:linkToElementModel( self, "damage", true, function ( model )
		local damage = Engine.GetModelValue( model )
		if damage then
			msDamageFillBar:setShaderVector( 2, SetVectorComponent( 2, 1, SubtractVectorComponentFrom( 1, 1, CoD.GetVectorComponentFromString( damage, 1 ), CoD.GetVectorComponentFromString( damage, 2 ), CoD.GetVectorComponentFromString( damage, 3 ), CoD.GetVectorComponentFromString( damage, 4 ) ) ) )
		end
	end )
	self:addElement( msDamageFillBar )
	self.msDamageFillBar = msDamageFillBar
	
	local damagedSideContainer = CoD.vhud_ms_DamageSideContainer.new( menu, controller )
	damagedSideContainer:setLeftRight( false, false, -31.5, 29 )
	damagedSideContainer:setTopBottom( false, false, -25.5, 0 )
	damagedSideContainer:linkToElementModel( self, "partDestroyed", false, function ( model )
		damagedSideContainer:setModel( model, controller )
	end )
	self:addElement( damagedSideContainer )
	self.damagedSideContainer = damagedSideContainer
	
	local msSeating1 = LUI.UIImage.new()
	msSeating1:setLeftRight( false, false, -39, 39 )
	msSeating1:setTopBottom( false, false, -36.5, 41.5 )
	msSeating1:setAlpha( 0.3 )
	msSeating1:setZoom( -15 )
	msSeating1:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_damageline" ) )
	msSeating1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( msSeating1 )
	self.msSeating1 = msSeating1
	
	local msSeating = LUI.UIImage.new()
	msSeating:setLeftRight( false, false, -39, 39 )
	msSeating:setTopBottom( false, false, -36.5, 41.5 )
	msSeating:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_damageline" ) )
	msSeating:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( msSeating )
	self.msSeating = msSeating
	
	local msSeating0 = LUI.UIImage.new()
	msSeating0:setLeftRight( false, false, -39, 39 )
	msSeating0:setTopBottom( false, false, -36.5, 41.5 )
	msSeating0:setAlpha( 0.25 )
	msSeating0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_damageline" ) )
	msSeating0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( msSeating0 )
	self.msSeating0 = msSeating0
	
	local vhudmsNotificationSeatingSide = CoD.vhud_ms_NotificationSeatingSide.new( menu, controller )
	vhudmsNotificationSeatingSide:setLeftRight( false, false, 8.5, 41 )
	vhudmsNotificationSeatingSide:setTopBottom( false, false, -20.25, -5.25 )
	vhudmsNotificationSeatingSide:setAlpha( 0 )
	self:addElement( vhudmsNotificationSeatingSide )
	self.vhudmsNotificationSeatingSide = vhudmsNotificationSeatingSide
	
	local vhudmsNotificationSeatingSide0 = CoD.vhud_ms_NotificationSeatingSide.new( menu, controller )
	vhudmsNotificationSeatingSide0:setLeftRight( false, false, -44, -11.5 )
	vhudmsNotificationSeatingSide0:setTopBottom( false, false, -20.25, -5.25 )
	vhudmsNotificationSeatingSide0:setAlpha( 0 )
	vhudmsNotificationSeatingSide0:setYRot( 180 )
	self:addElement( vhudmsNotificationSeatingSide0 )
	self.vhudmsNotificationSeatingSide0 = vhudmsNotificationSeatingSide0
	
	local vhudmsNotificationSeatingTop = CoD.vhud_ms_NotificationSeatingTop.new( menu, controller )
	vhudmsNotificationSeatingTop:setLeftRight( false, false, -10.5, 8.5 )
	vhudmsNotificationSeatingTop:setTopBottom( false, false, -47.25, -19 )
	self:addElement( vhudmsNotificationSeatingTop )
	self.vhudmsNotificationSeatingTop = vhudmsNotificationSeatingTop
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.damagedSideContainer:close()
		element.vhudmsNotificationSeatingSide:close()
		element.vhudmsNotificationSeatingSide0:close()
		element.vhudmsNotificationSeatingTop:close()
		element.msDamageFillBar:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

