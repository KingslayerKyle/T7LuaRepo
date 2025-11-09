require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_HashRingLarge" )

CoD.vhud_ms_OutsideHashRing = InheritFrom( LUI.UIElement )
CoD.vhud_ms_OutsideHashRing.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.vhud_ms_OutsideHashRing )
	self.id = "vhud_ms_OutsideHashRing"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 151 )
	self:setTopBottom( true, false, 0, 430 )
	self.anyChildUsesUpdateState = true
	
	local VehicleGroundHashRingLarge000 = CoD.VehicleGround_HashRingLarge.new( menu, controller )
	VehicleGroundHashRingLarge000:setLeftRight( true, false, -137, -6 )
	VehicleGroundHashRingLarge000:setTopBottom( true, false, 76, 364 )
	VehicleGroundHashRingLarge000:setRGB( 0.35, 0.35, 0.35 )
	VehicleGroundHashRingLarge000:setZoom( 800 )
	VehicleGroundHashRingLarge000:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	VehicleGroundHashRingLarge000:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:addElement( VehicleGroundHashRingLarge000 )
	self.VehicleGroundHashRingLarge000 = VehicleGroundHashRingLarge000
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			StartUp = function ()
				self:setupElementClipCounter( 0 )
			end,
			Zoom = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Zoom = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self.close = function ( self )
		self.VehicleGroundHashRingLarge000:close()
		CoD.vhud_ms_OutsideHashRing.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

