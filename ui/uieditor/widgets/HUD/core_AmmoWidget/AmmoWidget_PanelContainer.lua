-- d63d545a3b4fe8c50be7e74c2ba637af
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_PanelEquip" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_PanelClip" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_PanelOct" )
require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidget_Panel" )

CoD.AmmoWidget_PanelContainer = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_PanelContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_PanelContainer )
	self.id = "AmmoWidget_PanelContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 228 )
	self:setTopBottom( true, false, 0, 106 )
	
	local PanelLethal = CoD.AmmoWidget_PanelEquip.new( menu, controller )
	PanelLethal:setLeftRight( false, true, -138.01, -92.68 )
	PanelLethal:setTopBottom( true, false, -2, 35.33 )
	PanelLethal:setZoom( -10 )
	self:addElement( PanelLethal )
	self.PanelLethal = PanelLethal
	
	local PanelTactical = CoD.AmmoWidget_PanelEquip.new( menu, controller )
	PanelTactical:setLeftRight( false, true, -178.68, -133.35 )
	PanelTactical:setTopBottom( true, false, -2, 35.33 )
	PanelTactical:setZoom( -10 )
	self:addElement( PanelTactical )
	self.PanelTactical = PanelTactical
	
	local PanelClip = CoD.AmmoWidget_PanelClip.new( menu, controller )
	PanelClip:setLeftRight( false, true, -241, -156 )
	PanelClip:setTopBottom( true, false, 34.34, 79.67 )
	PanelClip:setZoom( -10 )
	self:addElement( PanelClip )
	self.PanelClip = PanelClip
	
	local PanelOctagon = CoD.AmmoWidget_PanelOct.new( menu, controller )
	PanelOctagon:setLeftRight( false, true, -94.34, 2.99 )
	PanelOctagon:setTopBottom( true, false, 8.33, 105.67 )
	PanelOctagon:setZoom( -10 )
	self:addElement( PanelOctagon )
	self.PanelOctagon = PanelOctagon
	
	local PanelAmmo = CoD.DamageWidget_Panel.new( menu, controller )
	PanelAmmo:setLeftRight( false, true, -158.34, -87.02 )
	PanelAmmo:setTopBottom( true, false, 38.66, 80 )
	PanelAmmo:setZoom( -11 )
	self:addElement( PanelAmmo )
	self.PanelAmmo = PanelAmmo
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				PanelClip:completeAnimation()
				self.PanelClip:setLeftRight( false, true, -228, -156 )
				self.PanelClip:setTopBottom( true, false, 34.34, 79.67 )
				self.PanelClip:setAlpha( 1 )
				self.clipFinished( PanelClip, {} )
				PanelAmmo:completeAnimation()
				self.PanelAmmo:setLeftRight( false, true, -158.34, -87.01 )
				self.PanelAmmo:setTopBottom( true, false, 38.66, 80 )
				self.clipFinished( PanelAmmo, {} )
			end
		},
		Knife = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				PanelClip:completeAnimation()
				self.PanelClip:setLeftRight( false, true, -228, -196 )
				self.PanelClip:setTopBottom( true, false, 34.34, 79.67 )
				self.PanelClip:setAlpha( 0 )
				self.clipFinished( PanelClip, {} )
				PanelAmmo:completeAnimation()
				self.PanelAmmo:setLeftRight( false, true, -195.34, -87.01 )
				self.PanelAmmo:setTopBottom( true, false, 38.66, 80 )
				self.clipFinished( PanelAmmo, {} )
			end
		},
		Weapon = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				PanelClip:completeAnimation()
				self.PanelClip:setLeftRight( false, true, -228, -156 )
				self.PanelClip:setTopBottom( true, false, 34.34, 79.67 )
				self.PanelClip:setAlpha( 1 )
				self.clipFinished( PanelClip, {} )
				PanelAmmo:completeAnimation()
				self.PanelAmmo:setLeftRight( false, true, -158.34, -87.01 )
				self.PanelAmmo:setTopBottom( true, false, 38.66, 80 )
				self.clipFinished( PanelAmmo, {} )
			end,
			Knife = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Weapon3Digits = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				PanelClip:completeAnimation()
				self.PanelClip:setLeftRight( false, true, -241, -156 )
				self.PanelClip:setTopBottom( true, false, 34.34, 79.67 )
				self.clipFinished( PanelClip, {} )
			end
		},
		Prologue = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				PanelOctagon:completeAnimation()
				self.PanelOctagon:setAlpha( 0 )
				self.clipFinished( PanelOctagon, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.PanelLethal:close()
		element.PanelTactical:close()
		element.PanelClip:close()
		element.PanelOctagon:close()
		element.PanelAmmo:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

