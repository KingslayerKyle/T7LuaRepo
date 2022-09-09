-- 5c9306740b89ff46de783f2c6352ebc4
-- This hash is used for caching, delete to decompile the file again

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
	VehicleGroundHashText0:setLeftRight( false, false, -51.83, 54.17 )
	VehicleGroundHashText0:setTopBottom( false, false, -14.6, 11.4 )
	VehicleGroundHashText0:setAlpha( 0 )
	VehicleGroundHashText0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_cheap_blur" ) )
	VehicleGroundHashText0:setShaderVector( 0, 0.1, 0, 0, 0 )
	VehicleGroundHashText0:setShaderVector( 1, 1, 0, 0, 0 )
	VehicleGroundHashText0:setShaderVector( 2, 5, 7, 0, 0 )
	VehicleGroundHashText0:setShaderVector( 3, 1, 1, 0, 0 )
	VehicleGroundHashText0:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( VehicleGroundHashText0 )
	self.VehicleGroundHashText0 = VehicleGroundHashText0
	
	local VehicleGroundHashIcon0 = CoD.VehicleGround_HashIcon.new( menu, controller )
	VehicleGroundHashIcon0:setLeftRight( false, false, 47.87, 79.87 )
	VehicleGroundHashIcon0:setTopBottom( false, false, -11.86, 4.14 )
	VehicleGroundHashIcon0:setAlpha( 0 )
	self:addElement( VehicleGroundHashIcon0 )
	self.VehicleGroundHashIcon0 = VehicleGroundHashIcon0
	
	local VehicleGroundHashRingLarge000 = CoD.VehicleGround_HashRingLarge.new( menu, controller )
	VehicleGroundHashRingLarge000:setLeftRight( false, false, -243, -112 )
	VehicleGroundHashRingLarge000:setTopBottom( false, false, -148.86, 139.14 )
	VehicleGroundHashRingLarge000:setRGB( 0.35, 0.35, 0.35 )
	VehicleGroundHashRingLarge000:setZoom( 800 )
	VehicleGroundHashRingLarge000:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( VehicleGroundHashRingLarge000 )
	self.VehicleGroundHashRingLarge000 = VehicleGroundHashRingLarge000
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			StartUp = function ()
				self:setupElementClipCounter( 1 )

				local f3_local0 = function ( f4_arg0, f4_arg1 )
					if not f4_arg1.interrupted then
						f4_arg0:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
					end
					f4_arg0:setAlpha( 1 )
					if f4_arg1.interrupted then
						self.clipFinished( f4_arg0, f4_arg1 )
					else
						f4_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VehicleGroundHashIcon0:beginAnimation( "keyframe", 1759, false, false, CoD.TweenType.Linear )
				VehicleGroundHashIcon0:setAlpha( 0 )
				VehicleGroundHashIcon0:registerEventHandler( "transition_complete_keyframe", f3_local0 )
			end,
			Zoom = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.VehicleGroundHashText0:close()
		element.VehicleGroundHashIcon0:close()
		element.VehicleGroundHashRingLarge000:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
