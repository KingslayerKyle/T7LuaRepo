-- e8e4255549a1ad74ab034c95da100df2
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_PanelEquip" )
require( "ui.uieditor.widgets.HUD.CP_Prologue.CP_Prologue_AmmoWidget_PanelClip" )
require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidget_Panel" )

CoD.CP_Prologue_AmmoWidget_PanelContainer = InheritFrom( LUI.UIElement )
CoD.CP_Prologue_AmmoWidget_PanelContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CP_Prologue_AmmoWidget_PanelContainer )
	self.id = "CP_Prologue_AmmoWidget_PanelContainer"
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
	
	local CPPrologueAmmoWidgetPanelClip = CoD.CP_Prologue_AmmoWidget_PanelClip.new( menu, controller )
	CPPrologueAmmoWidgetPanelClip:setLeftRight( false, true, -234.53, -156.01 )
	CPPrologueAmmoWidgetPanelClip:setTopBottom( true, false, 34.34, 79.34 )
	CPPrologueAmmoWidgetPanelClip:setZoom( -10 )
	self:addElement( CPPrologueAmmoWidgetPanelClip )
	self.CPPrologueAmmoWidgetPanelClip = CPPrologueAmmoWidgetPanelClip
	
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

				CPPrologueAmmoWidgetPanelClip:completeAnimation()
				self.CPPrologueAmmoWidgetPanelClip:setLeftRight( false, true, -234.53, -156.01 )
				self.CPPrologueAmmoWidgetPanelClip:setTopBottom( true, false, 34.34, 79.34 )
				self.CPPrologueAmmoWidgetPanelClip:setAlpha( 1 )
				self.clipFinished( CPPrologueAmmoWidgetPanelClip, {} )

				PanelAmmo:completeAnimation()
				self.PanelAmmo:setLeftRight( false, true, -158.34, -87.01 )
				self.PanelAmmo:setTopBottom( true, false, 38.66, 80 )
				self.PanelAmmo:setAlpha( 1 )
				self.clipFinished( PanelAmmo, {} )
			end
		},
		Knife = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				PanelAmmo:completeAnimation()
				self.PanelAmmo:setLeftRight( false, true, -195.34, -87.01 )
				self.PanelAmmo:setTopBottom( true, false, 38.66, 80 )
				self.clipFinished( PanelAmmo, {} )
			end
		},
		Weapon = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

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
				self:setupElementClipCounter( 0 )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.PanelLethal:close()
		element.PanelTactical:close()
		element.CPPrologueAmmoWidgetPanelClip:close()
		element.PanelAmmo:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
