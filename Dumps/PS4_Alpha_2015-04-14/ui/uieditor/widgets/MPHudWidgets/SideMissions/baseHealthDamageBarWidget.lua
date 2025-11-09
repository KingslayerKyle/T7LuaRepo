require( "ui.uieditor.widgets.MPHudWidgets.SideMissions.baseHealthDamageBorderWidget" )

local BaseHealthDamageBarWidget_LowThreshold = 0.25
local BaseHealthDamageBarWidget_BarWidth = 232
local BaseHealthDamageBarWidget_SwooshSpeed = 500
local BaseHealthDamageBarWidget_DamageTaken = function ( self, healthPercent )
	if healthPercent < BaseHealthDamageBarWidget_LowThreshold then
		self:setState( "LowHealthState" )
	else
		self:setState( "DefaultState" )
	end
	local newWidth = healthPercent * BaseHealthDamageBarWidget_BarWidth
	self.baseHealthBar:beginAnimation( "update_width" )
	self.baseHealthBar:setLeftRight( true, false, 0, newWidth )
	self.updatedWidth = newWidth
end

local BaseHealthDamageBarWidget_EndDamageTaken = function ( self, event )
	self.baseHealthBarAnimBacking:beginAnimation( "update_width", BaseHealthDamageBarWidget_SwooshSpeed )
	self.baseHealthBarAnimBacking:setLeftRight( true, false, 0, self.updatedWidth )
end

local BaseHealthDamageBarWidget_Healing = function ( self, healthPercent )
	if healthPercent < BaseHealthDamageBarWidget_LowThreshold then
		self:setState( "LowHealthState" )
	else
		self:setState( "DefaultState" )
	end
	local newWidth = healthPercent * BaseHealthDamageBarWidget_BarWidth
	self.baseHealthBarHealing:beginAnimation( "update_width" )
	if self.healingStartPoint == -1 then
		self.baseHealthBarHealing:setLeftRight( true, false, self.updatedWidth, newWidth )
		self.healingStartPoint = self.updatedWidth
	else
		self.baseHealthBarHealing:setLeftRight( true, false, self.healingStartPoint, newWidth )
	end
	self.baseHealthBarHealing:setAlpha( 1 )
	self.baseHealthBar:beginAnimation( "update_width" )
	self.baseHealthBar:setLeftRight( true, false, 0, newWidth )
	self.updatedWidth = newWidth
end

local BaseHealthDamageBarWidget_EndHealing = function ( self, event )
	self.baseHealthBarHealing:beginAnimation( "update_width", BaseHealthDamageBarWidget_SwooshSpeed )
	self.baseHealthBarHealing:setLeftRight( true, false, self.updatedWidth, self.updatedWidth )
	self.healingStartPoint = -1
end

local PostLoadFunc = function ( self )
	self.updatedWidth = BaseHealthDamageBarWidget_BarWidth
	self.healingStartPoint = -1
	self.takingDamageFunction = BaseHealthDamageBarWidget_DamageTaken
	self.endTakingDamageFunction = BaseHealthDamageBarWidget_EndDamageTaken
	self.healingFunction = BaseHealthDamageBarWidget_Healing
	self.endHealingFunction = BaseHealthDamageBarWidget_EndHealing
end

CoD.baseHealthDamageBarWidget = InheritFrom( LUI.UIElement )
CoD.baseHealthDamageBarWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.baseHealthDamageBarWidget )
	self.id = "baseHealthDamageBarWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 232 )
	self:setTopBottom( true, false, 0, 32 )
	self.anyChildUsesUpdateState = true
	
	local staticBackground = LUI.UIImage.new()
	staticBackground:setLeftRight( true, true, 0, 0 )
	staticBackground:setTopBottom( true, true, 0, 0 )
	staticBackground:setRGB( 0.34, 0.34, 0.34 )
	staticBackground:setAlpha( 0.16 )
	staticBackground:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( staticBackground )
	self.staticBackground = staticBackground
	
	local baseHealthBarAnimBacking = LUI.UIImage.new()
	baseHealthBarAnimBacking:setLeftRight( true, true, 0, 0 )
	baseHealthBarAnimBacking:setTopBottom( true, true, 0, 0 )
	baseHealthBarAnimBacking:setRGB( 0.5, 0.5, 0.5 )
	baseHealthBarAnimBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( baseHealthBarAnimBacking )
	self.baseHealthBarAnimBacking = baseHealthBarAnimBacking
	
	local baseHealthBar = LUI.UIImage.new()
	baseHealthBar:setLeftRight( true, true, 0, 0 )
	baseHealthBar:setTopBottom( true, true, 0, 0 )
	baseHealthBar:setRGB( 0.31, 0.74, 0.21 )
	baseHealthBar:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( baseHealthBar )
	self.baseHealthBar = baseHealthBar
	
	local baseHealthBarHealing = LUI.UIImage.new()
	baseHealthBarHealing:setLeftRight( true, false, 0, 0 )
	baseHealthBarHealing:setTopBottom( true, true, 0, 0 )
	baseHealthBarHealing:setRGB( 0.54, 0.84, 0.12 )
	baseHealthBarHealing:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( baseHealthBarHealing )
	self.baseHealthBarHealing = baseHealthBarHealing
	
	local baseHealthTextBox = LUI.UIText.new()
	baseHealthTextBox:setLeftRight( true, true, 0, 0 )
	baseHealthTextBox:setTopBottom( false, false, -12.5, 12.5 )
	baseHealthTextBox:setRGB( 1, 1, 1 )
	baseHealthTextBox:setText( Engine.Localize( "CPUI_BEACON_HEALTH" ) )
	baseHealthTextBox:setTTF( "fonts/default.ttf" )
	baseHealthTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	baseHealthTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( baseHealthTextBox )
	self.baseHealthTextBox = baseHealthTextBox
	
	local baseHealthDamageBorderWidget = CoD.baseHealthDamageBorderWidget.new( menu, controller )
	baseHealthDamageBorderWidget:setLeftRight( true, false, 0, 232 )
	baseHealthDamageBorderWidget:setTopBottom( true, false, 0, 32 )
	baseHealthDamageBorderWidget:setRGB( 1, 1, 1 )
	self:addElement( baseHealthDamageBorderWidget )
	self.baseHealthDamageBorderWidget = baseHealthDamageBorderWidget
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		LowHealthState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				baseHealthBar:completeAnimation()
				self.baseHealthBar:setRGB( 0.97, 0.15, 0.11 )
				self.clipFinished( baseHealthBar, {} )
			end,
			damageTaken = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self.close = function ( self )
		self.baseHealthDamageBorderWidget:close()
		CoD.baseHealthDamageBarWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

