-- 980d444b57adbc648033c9bda88f666d
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.MPHudWidgets.ThrustMeter.ThrustMeterDots" )
require( "ui.uieditor.widgets.MPHudWidgets.ThrustMeter.ThrustMeterArrows" )

local f0_local0 = {
	{
		r = 1,
		g = 1,
		b = 1
	}
}
local f0_local1 = {
	0
}
local f0_local2 = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3 )
	f1_arg3 = math.min( math.max( 0, f1_arg3 ), 1 )
	f1_arg0:setRGB( f1_arg1.r * (1 - f1_arg3) + f1_arg2.r * f1_arg3, f1_arg1.g * (1 - f1_arg3) + f1_arg2.g * f1_arg3, f1_arg1.b * (1 - f1_arg3) + f1_arg2.b * f1_arg3 )
end

local f0_local3 = function ( f2_arg0, f2_arg1 )
	for f2_local0 = 1, #f0_local1 - 1, 1 do
		if f0_local1[f2_local0] <= f2_arg1 and f2_arg1 <= f0_local1[f2_local0 + 1] then
			f0_local2( f2_arg0, f0_local0[f2_local0], f0_local0[f2_local0 + 1], (f2_arg1 - f0_local1[f2_local0]) / (f0_local1[f2_local0 + 1] - f0_local1[f2_local0]) )
			return 
		end
	end
	f2_arg0:setRGB( f0_local0[#f0_local0].r, f0_local0[#f0_local0].g, f0_local0[#f0_local0].b )
end

local f0_local4 = function ( f3_arg0, f3_arg1 )
	local f3_local0 = Engine.GetModelValue( f3_arg1 )
	if not f3_local0 then
		return 
	elseif f3_arg0.lastScalableWidth == -1 then
		f3_arg0:playClip( "IntroAnimation" )
		f3_arg0.lastScalableWidth = 1
	end
	if f3_arg0.lastScalableWidth == f3_local0 then
		return 
	end
	local f3_local1 = f3_arg0.lastScalableWidth + 0 < f3_local0
	if f3_local0 == 1 then
		f3_arg0:setState( "FullEnergy" )
	else
		f3_arg0:setState( "DefaultState" )
		f3_arg0:playClip( "DecreaseFromFull" )
	end
	f3_arg0.lastScalableWidth = f3_local0
	local f3_local2 = 0.48 + 0.04 * f3_local0
	local f3_local3 = -25.3 + 52.3 * f3_local0
	local f3_local4 = f3_local3 + 2
	f3_arg0.thrustMeter.fill:beginAnimation( "update_fill", 50, false, false )
	f0_local3( f3_arg0.thrustMeter.fill, f3_local0 )
	f3_arg0.thrustMeter.fill:setShaderVector( 0, f3_local2, 0, 0, 0 )
	f3_arg0.thrustMeter.dots:beginAnimation( "update_fill", 50, false, false )
	f3_arg0.thrustMeter.dots:setShaderVector( 0, 1 - f3_local2, 0, 0, 0 )
	local f3_local5 = 50
	if f3_local1 then
		f3_local5 = 50
		f3_arg0.thrustArrows.right1:playClip( "Fill" )
	else
		f3_arg0.thrustArrows.right1:playClip( "Drain" )
	end
	f3_arg0.thrustArrows.right1:beginAnimation( "right_chevron_thick", f3_local5, false, false )
	f3_arg0.thrustArrows.right1:setZRot( f3_local3 )
	f3_arg0.thrustArrows.right2:beginAnimation( "right_chevron_thin", f3_local5, false, false )
	f3_arg0.thrustArrows.right2:setZRot( f3_local4 )
end

local PostLoadFunc = function ( f4_arg0, f4_arg1 )
	f4_arg0.lastScalableWidth = -1
	f4_arg0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f4_arg1 ), "playerAbilities.playerEnergyRatio" ), function ( model )
		f0_local4( f4_arg0, model )
	end )
end

CoD.ThrustMeter = InheritFrom( LUI.UIElement )
CoD.ThrustMeter.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ThrustMeter )
	self.id = "ThrustMeter"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 170 )
	self:setTopBottom( true, false, 0, 40 )
	
	local thrustMeter = CoD.ThrustMeterDots.new( menu, controller )
	thrustMeter:setLeftRight( false, false, -70, 68 )
	thrustMeter:setTopBottom( false, true, -36, 0 )
	thrustMeter.dots:setShaderVector( 0, 0.52, 0, 0, 0 )
	thrustMeter.dots:setShaderVector( 1, 0.5, 0, 0, 0 )
	thrustMeter.dots:setShaderVector( 2, -2.84, 0, 0, 0 )
	thrustMeter.fill:setShaderVector( 0, 0.52, 0, 0, 0 )
	thrustMeter.fill:setShaderVector( 1, 0.5, 0, 0, 0 )
	thrustMeter.fill:setShaderVector( 2, -2.84, 0, 0, 0 )
	self:addElement( thrustMeter )
	self.thrustMeter = thrustMeter
	
	local thrustArrows = CoD.ThrustMeterArrows.new( menu, controller )
	thrustArrows:setLeftRight( false, false, -7.5, 7.5 )
	thrustArrows:setTopBottom( false, true, -299, 1 )
	thrustArrows.right1:setZRot( 27 )
	self:addElement( thrustArrows )
	self.thrustArrows = thrustArrows
	
	local pixel1 = LUI.UIImage.new()
	pixel1:setLeftRight( false, false, -80, -72 )
	pixel1:setTopBottom( false, true, -36, -28 )
	pixel1:setAlpha( 0 )
	pixel1:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_pixel" ) )
	pixel1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixel1 )
	self.pixel1 = pixel1
	
	local pixel2 = LUI.UIImage.new()
	pixel2:setLeftRight( false, false, 72, 80 )
	pixel2:setTopBottom( false, true, -36, -28 )
	pixel2:setAlpha( 0 )
	pixel2:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_pixel" ) )
	pixel2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixel2 )
	self.pixel2 = pixel2
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.thrustMeter:close()
		element.thrustArrows:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
