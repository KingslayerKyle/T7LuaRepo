require( "ui.uieditor.widgets.MPHudWidgets.SideMissions.baseHealthDamageIconWidget" )
require( "ui.uieditor.widgets.MPHudWidgets.SideMissions.baseHealthDamageBarWidget" )

local BaseHealthWidget_DamageIconWait = 1500
local BaseHealthWidget_HealIconWait = 1500
local BaseHealthWidget_BeaconHealthSet = function ( self, event )
	if not self.alreadyUpdated then
		self:setState( "Visible" )
		self.alreadyUpdated = true
	end
	local baseHealthPercent = event.newValue
	if baseHealthPercent < self.healthPercent or self.damageClipTimer then
		if baseHealthPercent < self.healthPercent and self.damageClipTimer then
			self.damageClipTimer:close()
			self.damageClipTimer = nil
		end
		if self.healingClipTimer then
			self.healingClipTimer:processNow()
			self.healingClipTimer = nil
		end
		self.damageBarWidget:takingDamageFunction( baseHealthPercent )
		self.iconWidget:takingDamageFunction()
		if not self.damageClipTimer then
			self.damageClipTimer = LUI.UITimer.new( BaseHealthWidget_DamageIconWait, "damage_icon_reset", true, self )
			self:addElement( self.damageClipTimer )
		end
	elseif self.healthPercent < baseHealthPercent then
		if self.healingClipTimer then
			self.healingClipTimer:close()
			self.healingClipTimer = nil
		end
		self.damageBarWidget:healingFunction( baseHealthPercent )
		self.iconWidget:healingFunction()
		self.healingClipTimer = LUI.UITimer.new( BaseHealthWidget_HealIconWait, "healing_icon_reset", true, self )
		self:addElement( self.healingClipTimer )
	end
	self.healthPercent = baseHealthPercent
	self:dispatchEventToChildren( event )
end

local BaseHealthWidget_DamageIconReset = function ( self, event )
	self.damageClipTimer:close()
	self.damageClipTimer = nil
	self.damageBarWidget:endTakingDamageFunction()
	self.iconWidget:endTakingDamageFunction()
end

local BaseHealthWidget_HealingIconReset = function ( self, event )
	self.healingClipTimer:close()
	self.healingClipTimer = nil
	self.damageBarWidget:endHealingFunction()
	self.iconWidget:endHealingFunction()
end

local PostLoadFunc = function ( self )
	self.healthPercent = 1
	self:registerEventHandler( "sm_beacon_health", BaseHealthWidget_BeaconHealthSet )
	self:registerEventHandler( "damage_icon_reset", BaseHealthWidget_DamageIconReset )
	self:registerEventHandler( "healing_icon_reset", BaseHealthWidget_HealingIconReset )
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
	iconWidget:setRGB( 1, 1, 1 )
	self:addElement( iconWidget )
	self.iconWidget = iconWidget
	
	local damageBarWidget = CoD.baseHealthDamageBarWidget.new( menu, controller )
	damageBarWidget:setLeftRight( true, false, 0, 232 )
	damageBarWidget:setTopBottom( true, true, 0, 0 )
	damageBarWidget:setRGB( 1, 1, 1 )
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
	self.close = function ( self )
		self.iconWidget:close()
		self.damageBarWidget:close()
		CoD.baseHealthWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

