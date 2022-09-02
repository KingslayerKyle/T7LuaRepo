-- 8bc8be3e2970a5ca96cd41277889cbbf
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.VehicleHUDs.mothership.vhud_ModDNITime" )

CoD.vhud_sentinel_TimeBar = InheritFrom( LUI.UIElement )
CoD.vhud_sentinel_TimeBar.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.vhud_sentinel_TimeBar )
	self.id = "vhud_sentinel_TimeBar"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 218 )
	self:setTopBottom( true, false, 0, 9 )
	self.anyChildUsesUpdateState = true
	
	local vhudModDNITime00 = CoD.vhud_ModDNITime.new( menu, controller )
	vhudModDNITime00:setLeftRight( true, false, -29.13, 22.88 )
	vhudModDNITime00:setTopBottom( true, false, -24, 33 )
	vhudModDNITime00:setAlpha( 0.2 )
	vhudModDNITime00:setZoom( -20 )
	self:addElement( vhudModDNITime00 )
	self.vhudModDNITime00 = vhudModDNITime00
	
	local Frame0 = LUI.UIImage.new()
	Frame0:setLeftRight( true, false, 10.43, 218.43 )
	Frame0:setTopBottom( true, false, 0.31, 8.31 )
	Frame0:setAlpha( 0.2 )
	Frame0:setZoom( -15 )
	Frame0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_timebar" ) )
	Frame0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Frame0 )
	self.Frame0 = Frame0
	
	local vhudModDNITime0 = CoD.vhud_ModDNITime.new( menu, controller )
	vhudModDNITime0:setLeftRight( true, false, -29.13, 22.88 )
	vhudModDNITime0:setTopBottom( true, false, -24, 33 )
	self:addElement( vhudModDNITime0 )
	self.vhudModDNITime0 = vhudModDNITime0
	
	local Bar = LUI.UIImage.new()
	Bar:setLeftRight( true, false, 10.43, 218.43 )
	Bar:setTopBottom( true, false, 0, 8 )
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
	Frame:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_timebar" ) )
	Frame:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Frame )
	self.Frame = Frame
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				vhudModDNITime00:completeAnimation()
				self.vhudModDNITime00:setAlpha( 0.2 )
				self.clipFinished( vhudModDNITime00, {} )

				Frame0:completeAnimation()
				self.Frame0:setAlpha( 0.2 )
				self.clipFinished( Frame0, {} )

				vhudModDNITime0:completeAnimation()
				self.vhudModDNITime0:setAlpha( 1 )
				self.clipFinished( vhudModDNITime0, {} )

				Bar:completeAnimation()
				self.Bar:setAlpha( 1 )
				self.clipFinished( Bar, {} )

				Frame:completeAnimation()
				self.Frame:setAlpha( 1 )
				self.clipFinished( Frame, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				vhudModDNITime00:completeAnimation()
				self.vhudModDNITime00:setAlpha( 0 )
				self.clipFinished( vhudModDNITime00, {} )

				Frame0:completeAnimation()
				self.Frame0:setAlpha( 0 )
				self.clipFinished( Frame0, {} )

				vhudModDNITime0:completeAnimation()
				self.vhudModDNITime0:setAlpha( 0 )
				self.clipFinished( vhudModDNITime0, {} )

				Bar:completeAnimation()
				self.Bar:setAlpha( 0 )
				self.clipFinished( Bar, {} )

				Frame:completeAnimation()
				self.Frame:setAlpha( 0 )
				self.clipFinished( Frame, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.vhudModDNITime00:close()
		element.vhudModDNITime0:close()
		element.Bar:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

