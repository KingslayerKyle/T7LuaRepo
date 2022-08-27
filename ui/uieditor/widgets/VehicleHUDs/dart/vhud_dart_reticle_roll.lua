-- 7ca736e8f12f3fc89845a7b827057a24
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.VehicleHUDs.dart.vhud_dart_CenterReticleHorizonLine" )

CoD.vhud_dart_reticle_roll = InheritFrom( LUI.UIElement )
CoD.vhud_dart_reticle_roll.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.vhud_dart_reticle_roll )
	self.id = "vhud_dart_reticle_roll"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 458 )
	self:setTopBottom( true, false, 0, 210 )
	
	local RightHashDot = LUI.UIImage.new()
	RightHashDot:setLeftRight( false, false, 88.58, 177.58 )
	RightHashDot:setTopBottom( false, false, -20.23, 20.23 )
	RightHashDot:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_dart_reticlehashdots" ) )
	RightHashDot:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( RightHashDot )
	self.RightHashDot = RightHashDot
	
	local LeftHashDot = LUI.UIImage.new()
	LeftHashDot:setLeftRight( false, false, -177.42, -88.42 )
	LeftHashDot:setTopBottom( false, false, -20.23, 20.23 )
	LeftHashDot:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_dart_reticlehashdots" ) )
	LeftHashDot:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LeftHashDot )
	self.LeftHashDot = LeftHashDot
	
	local CenterReticleLineRight = LUI.UIImage.new()
	CenterReticleLineRight:setLeftRight( false, false, 10.58, 24.58 )
	CenterReticleLineRight:setTopBottom( false, false, -3.5, 3.5 )
	CenterReticleLineRight:setAlpha( 0.5 )
	CenterReticleLineRight:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_dart_reticlecenterline" ) )
	CenterReticleLineRight:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CenterReticleLineRight )
	self.CenterReticleLineRight = CenterReticleLineRight
	
	local CenterReticleLineLeft = LUI.UIImage.new()
	CenterReticleLineLeft:setLeftRight( false, false, -24.42, -10.42 )
	CenterReticleLineLeft:setTopBottom( false, false, -3.5, 3.5 )
	CenterReticleLineLeft:setAlpha( 0.5 )
	CenterReticleLineLeft:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_dart_reticlecenterline" ) )
	CenterReticleLineLeft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CenterReticleLineLeft )
	self.CenterReticleLineLeft = CenterReticleLineLeft
	
	local vhuddartCenterReticleHorizonLine0 = CoD.vhud_dart_CenterReticleHorizonLine.new( menu, controller )
	vhuddartCenterReticleHorizonLine0:setLeftRight( false, false, -229, 229 )
	vhuddartCenterReticleHorizonLine0:setTopBottom( false, false, -104.5, 104.5 )
	self:addElement( vhuddartCenterReticleHorizonLine0 )
	self.vhuddartCenterReticleHorizonLine0 = vhuddartCenterReticleHorizonLine0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				local f2_local0 = function ( f3_arg0, f3_arg1 )
					if not f3_arg1.interrupted then
						f3_arg0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
					end
					f3_arg0:setAlpha( 1 )
					if f3_arg1.interrupted then
						self.clipFinished( f3_arg0, f3_arg1 )
					else
						f3_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RightHashDot:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
				RightHashDot:setAlpha( 0 )
				RightHashDot:registerEventHandler( "transition_complete_keyframe", f2_local0 )
				local f2_local1 = function ( f4_arg0, f4_arg1 )
					if not f4_arg1.interrupted then
						f4_arg0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
					end
					f4_arg0:setAlpha( 1 )
					if f4_arg1.interrupted then
						self.clipFinished( f4_arg0, f4_arg1 )
					else
						f4_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftHashDot:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
				LeftHashDot:setAlpha( 0 )
				LeftHashDot:registerEventHandler( "transition_complete_keyframe", f2_local1 )
				local f2_local2 = function ( f5_arg0, f5_arg1 )
					if not f5_arg1.interrupted then
						f5_arg0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
					end
					f5_arg0:setAlpha( 0.5 )
					if f5_arg1.interrupted then
						self.clipFinished( f5_arg0, f5_arg1 )
					else
						f5_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterReticleLineRight:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
				CenterReticleLineRight:setAlpha( 0 )
				CenterReticleLineRight:registerEventHandler( "transition_complete_keyframe", f2_local2 )
				local f2_local3 = function ( f6_arg0, f6_arg1 )
					if not f6_arg1.interrupted then
						f6_arg0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
					end
					f6_arg0:setAlpha( 0.5 )
					if f6_arg1.interrupted then
						self.clipFinished( f6_arg0, f6_arg1 )
					else
						f6_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterReticleLineLeft:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
				CenterReticleLineLeft:setAlpha( 0 )
				CenterReticleLineLeft:registerEventHandler( "transition_complete_keyframe", f2_local3 )
				local f2_local4 = function ( f7_arg0, f7_arg1 )
					if not f7_arg1.interrupted then
						f7_arg0:beginAnimation( "keyframe", 49, true, false, CoD.TweenType.Back )
					end
					f7_arg0:setAlpha( 1 )
					if f7_arg1.interrupted then
						self.clipFinished( f7_arg0, f7_arg1 )
					else
						f7_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhuddartCenterReticleHorizonLine0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
				vhuddartCenterReticleHorizonLine0:setAlpha( 0 )
				vhuddartCenterReticleHorizonLine0:registerEventHandler( "transition_complete_keyframe", f2_local4 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.vhuddartCenterReticleHorizonLine0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

