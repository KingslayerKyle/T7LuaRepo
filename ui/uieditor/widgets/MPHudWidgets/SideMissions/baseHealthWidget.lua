-- aad4b4c6c198ff5ac02f9438a71fa971
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.MPHudWidgets.SideMissions.baseHealthDamageIconWidget" )
require( "ui.uieditor.widgets.MPHudWidgets.SideMissions.baseHealthDamageBarWidget" )

local f0_local0 = 1500
local f0_local1 = 1500
local f0_local2 = function ( f1_arg0, f1_arg1 )
	if not f1_arg0.alreadyUpdated then
		f1_arg0:setState( "Visible" )
		f1_arg0.alreadyUpdated = true
	end
	local f1_local0 = f1_arg1.newValue
	if f1_local0 < f1_arg0.healthPercent or f1_arg0.damageClipTimer then
		if f1_local0 < f1_arg0.healthPercent and f1_arg0.damageClipTimer then
			f1_arg0.damageClipTimer:close()
			f1_arg0.damageClipTimer = nil
		end
		if f1_arg0.healingClipTimer then
			f1_arg0.healingClipTimer:processNow()
			f1_arg0.healingClipTimer = nil
		end
		f1_arg0.damageBarWidget:takingDamageFunction( f1_local0 )
		f1_arg0.iconWidget:takingDamageFunction()
		if not f1_arg0.damageClipTimer then
			f1_arg0.damageClipTimer = LUI.UITimer.new( f0_local0, "damage_icon_reset", true, f1_arg0 )
			f1_arg0:addElement( f1_arg0.damageClipTimer )
		end
	elseif f1_arg0.healthPercent < f1_local0 then
		if f1_arg0.healingClipTimer then
			f1_arg0.healingClipTimer:close()
			f1_arg0.healingClipTimer = nil
		end
		f1_arg0.damageBarWidget:healingFunction( f1_local0 )
		f1_arg0.iconWidget:healingFunction()
		f1_arg0.healingClipTimer = LUI.UITimer.new( f0_local1, "healing_icon_reset", true, f1_arg0 )
		f1_arg0:addElement( f1_arg0.healingClipTimer )
	end
	f1_arg0.healthPercent = f1_local0
	f1_arg0:dispatchEventToChildren( f1_arg1 )
end

local f0_local3 = function ( f2_arg0, f2_arg1 )
	f2_arg0.damageClipTimer:close()
	f2_arg0.damageClipTimer = nil
	f2_arg0.damageBarWidget:endTakingDamageFunction()
	f2_arg0.iconWidget:endTakingDamageFunction()
end

local f0_local4 = function ( f3_arg0, f3_arg1 )
	f3_arg0.healingClipTimer:close()
	f3_arg0.healingClipTimer = nil
	f3_arg0.damageBarWidget:endHealingFunction()
	f3_arg0.iconWidget:endHealingFunction()
end

local PostLoadFunc = function ( f4_arg0 )
	f4_arg0.healthPercent = 1
	f4_arg0:registerEventHandler( "sm_beacon_health", f0_local2 )
	f4_arg0:registerEventHandler( "damage_icon_reset", f0_local3 )
	f4_arg0:registerEventHandler( "healing_icon_reset", f0_local4 )
end

CoD.baseHealthWidget = InheritFrom( LUI.UIElement )
CoD.baseHealthWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.baseHealthWidget )
	self.id = "baseHealthWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 268 )
	self:setTopBottom( true, false, 0, 32 )
	self.anyChildUsesUpdateState = true
	
	local iconWidget = CoD.baseHealthDamageIconWidget.new( menu, controller )
	iconWidget:setLeftRight( false, true, -32, 0 )
	iconWidget:setTopBottom( true, true, 0, 0 )
	self:addElement( iconWidget )
	self.iconWidget = iconWidget
	
	local damageBarWidget = CoD.baseHealthDamageBarWidget.new( menu, controller )
	damageBarWidget:setLeftRight( true, false, 0, 232 )
	damageBarWidget:setTopBottom( true, true, 0, 0 )
	self:addElement( damageBarWidget )
	self.damageBarWidget = damageBarWidget
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				iconWidget:completeAnimation()
				self.iconWidget:setAlpha( 0 )
				self.clipFinished( iconWidget, {} )
				damageBarWidget:completeAnimation()
				self.damageBarWidget:setAlpha( 0 )
				self.clipFinished( damageBarWidget, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				iconWidget:completeAnimation()
				self.iconWidget:setAlpha( 1 )
				self.clipFinished( iconWidget, {} )
				damageBarWidget:completeAnimation()
				self.damageBarWidget:setAlpha( 1 )
				self.clipFinished( damageBarWidget, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.iconWidget:close()
		element.damageBarWidget:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

