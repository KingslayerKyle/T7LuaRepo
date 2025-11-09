require( "ui.uieditor.widgets.MPHudWidgets.SideMissions.baseHealthDamageBorderWidget" )

local f0_local0 = 0.25
local f0_local1 = 232
local f0_local2 = 500
local f0_local3 = function ( f1_arg0, f1_arg1 )
	if f1_arg1 < f0_local0 then
		f1_arg0:setState( "LowHealthState" )
	else
		f1_arg0:setState( "DefaultState" )
	end
	local f1_local0 = f1_arg1 * f0_local1
	f1_arg0.baseHealthBar:beginAnimation( "update_width" )
	f1_arg0.baseHealthBar:setLeftRight( true, false, 0, f1_local0 )
	f1_arg0.updatedWidth = f1_local0
end

local f0_local4 = function ( f2_arg0, f2_arg1 )
	f2_arg0.baseHealthBarAnimBacking:beginAnimation( "update_width", f0_local2 )
	f2_arg0.baseHealthBarAnimBacking:setLeftRight( true, false, 0, f2_arg0.updatedWidth )
end

local f0_local5 = function ( f3_arg0, f3_arg1 )
	if f3_arg1 < f0_local0 then
		f3_arg0:setState( "LowHealthState" )
	else
		f3_arg0:setState( "DefaultState" )
	end
	local f3_local0 = f3_arg1 * f0_local1
	f3_arg0.baseHealthBarHealing:beginAnimation( "update_width" )
	if f3_arg0.healingStartPoint == -1 then
		f3_arg0.baseHealthBarHealing:setLeftRight( true, false, f3_arg0.updatedWidth, f3_local0 )
		f3_arg0.healingStartPoint = f3_arg0.updatedWidth
	else
		f3_arg0.baseHealthBarHealing:setLeftRight( true, false, f3_arg0.healingStartPoint, f3_local0 )
	end
	f3_arg0.baseHealthBarHealing:setAlpha( 1 )
	f3_arg0.baseHealthBar:beginAnimation( "update_width" )
	f3_arg0.baseHealthBar:setLeftRight( true, false, 0, f3_local0 )
	f3_arg0.updatedWidth = f3_local0
end

local f0_local6 = function ( f4_arg0, f4_arg1 )
	f4_arg0.baseHealthBarHealing:beginAnimation( "update_width", f0_local2 )
	f4_arg0.baseHealthBarHealing:setLeftRight( true, false, f4_arg0.updatedWidth, f4_arg0.updatedWidth )
	f4_arg0.healingStartPoint = -1
end

local PostLoadFunc = function ( f5_arg0 )
	f5_arg0.updatedWidth = f0_local1
	f5_arg0.healingStartPoint = -1
	f5_arg0.takingDamageFunction = f0_local3
	f5_arg0.endTakingDamageFunction = f0_local4
	f5_arg0.healingFunction = f0_local5
	f5_arg0.endHealingFunction = f0_local6
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
	self:addElement( staticBackground )
	self.staticBackground = staticBackground
	
	local baseHealthBarAnimBacking = LUI.UIImage.new()
	baseHealthBarAnimBacking:setLeftRight( true, true, 0, 0 )
	baseHealthBarAnimBacking:setTopBottom( true, true, 0, 0 )
	baseHealthBarAnimBacking:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( baseHealthBarAnimBacking )
	self.baseHealthBarAnimBacking = baseHealthBarAnimBacking
	
	local baseHealthBar = LUI.UIImage.new()
	baseHealthBar:setLeftRight( true, true, 0, 0 )
	baseHealthBar:setTopBottom( true, true, 0, 0 )
	baseHealthBar:setRGB( 0.31, 0.74, 0.21 )
	self:addElement( baseHealthBar )
	self.baseHealthBar = baseHealthBar
	
	local baseHealthBarHealing = LUI.UIImage.new()
	baseHealthBarHealing:setLeftRight( true, false, 0, 0 )
	baseHealthBarHealing:setTopBottom( true, true, 0, 0 )
	baseHealthBarHealing:setRGB( 0.54, 0.84, 0.12 )
	self:addElement( baseHealthBarHealing )
	self.baseHealthBarHealing = baseHealthBarHealing
	
	local baseHealthTextBox = LUI.UIText.new()
	baseHealthTextBox:setLeftRight( true, true, 0, 0 )
	baseHealthTextBox:setTopBottom( false, false, -12.5, 12.5 )
	baseHealthTextBox:setText( Engine.Localize( "CPUI_BEACON_HEALTH" ) )
	baseHealthTextBox:setTTF( "fonts/default.ttf" )
	baseHealthTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	baseHealthTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( baseHealthTextBox )
	self.baseHealthTextBox = baseHealthTextBox
	
	local baseHealthDamageBorderWidget = CoD.baseHealthDamageBorderWidget.new( menu, controller )
	baseHealthDamageBorderWidget:setLeftRight( true, false, 0, 232 )
	baseHealthDamageBorderWidget:setTopBottom( true, false, 0, 32 )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.baseHealthDamageBorderWidget:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

