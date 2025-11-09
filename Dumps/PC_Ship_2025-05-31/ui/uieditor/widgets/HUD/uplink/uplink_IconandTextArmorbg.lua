CoD.uplink_IconandTextArmorbg = InheritFrom( LUI.UIElement )
CoD.uplink_IconandTextArmorbg.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.uplink_IconandTextArmorbg )
	self.id = "uplink_IconandTextArmorbg"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 41 )
	self:setTopBottom( true, false, 0, 20 )
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, -36, 19 )
	background:setTopBottom( true, true, -1, 1 )
	background:setAlpha( 0.3 )
	background:setImage( RegisterImage( "uie_t7_hud_armorcontainer" ) )
	background:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	background:setShaderVector( 0, 0.5, 0.49, 0, 0 )
	background:setupNineSliceShader( 20, 10 )
	self:addElement( background )
	self.background = background
	
	local Shield = LUI.UIImage.new()
	Shield:setLeftRight( true, false, -22, -2 )
	Shield:setTopBottom( true, false, 0, 20 )
	Shield:setImage( RegisterImage( "uie_t7_uplink_shield" ) )
	self:addElement( Shield )
	self.Shield = Shield
	
	local armorLabel = LUI.UITightText.new()
	armorLabel:setLeftRight( true, false, 0, 41.08 )
	armorLabel:setTopBottom( true, false, 0, 20 )
	armorLabel:setText( Engine.Localize( "MP_HUD_UPLINK_ARMOR" ) )
	armorLabel:setTTF( "fonts/escom.ttf" )
	LUI.OverrideFunction_CallOriginalFirst( armorLabel, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 1 )
	end )
	self:addElement( armorLabel )
	self.armorLabel = armorLabel
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

