require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_CenterInnerRingElement" )

CoD.vhud_turret_reticle_arrows = InheritFrom( LUI.UIElement )
CoD.vhud_turret_reticle_arrows.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.vhud_turret_reticle_arrows )
	self.id = "vhud_turret_reticle_arrows"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 64 )
	self:setTopBottom( true, false, 0, 69 )
	self.anyChildUsesUpdateState = true
	
	local RingElement0 = CoD.VehicleGround_CenterInnerRingElement.new( menu, controller )
	RingElement0:setLeftRight( false, false, -25, 32 )
	RingElement0:setTopBottom( false, false, -34.5, 34.5 )
	RingElement0:setAlpha( 0.5 )
	RingElement0:setZRot( 45 )
	self:addElement( RingElement0 )
	self.RingElement0 = RingElement0
	
	local RingElement00 = CoD.VehicleGround_CenterInnerRingElement.new( menu, controller )
	RingElement00:setLeftRight( false, false, -32, 25 )
	RingElement00:setTopBottom( false, false, -34.5, 34.5 )
	RingElement00:setAlpha( 0.5 )
	RingElement00:setYRot( 180 )
	RingElement00:setZRot( 45 )
	self:addElement( RingElement00 )
	self.RingElement00 = RingElement00
	
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.RingElement0:close()
		element.RingElement00:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

