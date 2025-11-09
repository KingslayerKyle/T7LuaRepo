require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_HashText" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_HashIcon" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_HashRingLarge" )

CoD.vhud_ms_HashRotateRight = InheritFrom( LUI.UIElement )
CoD.vhud_ms_HashRotateRight.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.vhud_ms_HashRotateRight )
	self.id = "vhud_ms_HashRotateRight"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 225 )
	self:setTopBottom( true, false, 0, 491 )
	self.anyChildUsesUpdateState = true
	
	local VehicleGroundHashText0 = CoD.VehicleGround_HashText.new( menu, controller )
	VehicleGroundHashText0:setLeftRight( true, false, 60.67, 166.67 )
	VehicleGroundHashText0:setTopBottom( true, false, 230.9, 256.9 )
	VehicleGroundHashText0:setRGB( 1, 1, 1 )
	VehicleGroundHashText0:setAlpha( 0 )
	VehicleGroundHashText0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_cheap_blur" ) )
	VehicleGroundHashText0:setShaderVector( 0, 0.1, 0, 0, 0 )
	VehicleGroundHashText0:setShaderVector( 1, 1, 0, 0, 0 )
	VehicleGroundHashText0:setShaderVector( 2, 5, 7, 0, 0 )
	VehicleGroundHashText0:setShaderVector( 3, 1, 1, 0, 0 )
	VehicleGroundHashText0:setShaderVector( 4, 0, 0, 0, 0 )
	VehicleGroundHashText0:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:addElement( VehicleGroundHashText0 )
	self.VehicleGroundHashText0 = VehicleGroundHashText0
	
	local VehicleGroundHashIcon0 = CoD.VehicleGround_HashIcon.new( menu, controller )
	VehicleGroundHashIcon0:setLeftRight( true, false, 160.37, 192.37 )
	VehicleGroundHashIcon0:setTopBottom( true, false, 233.64, 249.64 )
	VehicleGroundHashIcon0:setRGB( 1, 1, 1 )
	VehicleGroundHashIcon0:setAlpha( 0 )
	self:addElement( VehicleGroundHashIcon0 )
	self.VehicleGroundHashIcon0 = VehicleGroundHashIcon0
	
	local VehicleGroundHashRingLarge000 = CoD.VehicleGround_HashRingLarge.new( menu, controller )
	VehicleGroundHashRingLarge000:setLeftRight( true, false, -130.5, 0.5 )
	VehicleGroundHashRingLarge000:setTopBottom( true, false, 96.64, 384.64 )
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
				self:setupElementClipCounter( 1 )
				local VehicleGroundHashIcon0Frame2 = function ( VehicleGroundHashIcon0, event )
					if not event.interrupted then
						VehicleGroundHashIcon0:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
					end
					VehicleGroundHashIcon0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( VehicleGroundHashIcon0, event )
					else
						VehicleGroundHashIcon0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VehicleGroundHashIcon0:beginAnimation( "keyframe", 1759, false, false, CoD.TweenType.Linear )
				VehicleGroundHashIcon0:setAlpha( 0 )
				VehicleGroundHashIcon0:registerEventHandler( "transition_complete_keyframe", VehicleGroundHashIcon0Frame2 )
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
		self.VehicleGroundHashText0:close()
		self.VehicleGroundHashIcon0:close()
		self.VehicleGroundHashRingLarge000:close()
		CoD.vhud_ms_HashRotateRight.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

