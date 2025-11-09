require( "ui.uieditor.widgets.Paintshop.PaintjobSlotsBack" )

CoD.PaintshopChooseIconName = InheritFrom( LUI.UIElement )
CoD.PaintshopChooseIconName.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PaintshopChooseIconName )
	self.id = "PaintshopChooseIconName"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 400 )
	self:setTopBottom( true, false, 0, 34 )
	self.anyChildUsesUpdateState = true
	
	local PaintjobSlotsBack0 = CoD.PaintjobSlotsBack.new( menu, controller )
	PaintjobSlotsBack0:setLeftRight( true, true, -2, 3 )
	PaintjobSlotsBack0:setTopBottom( true, true, -3, 3 )
	self:addElement( PaintjobSlotsBack0 )
	self.PaintjobSlotsBack0 = PaintjobSlotsBack0
	
	local itemName = LUI.UITightText.new()
	itemName:setLeftRight( true, false, 3, 72.8 )
	itemName:setTopBottom( false, false, -11, 13 )
	itemName:setRGB( 0, 0, 0 )
	itemName:setText( Engine.Localize( "WEAPON_AR_STANDARD" ) )
	itemName:setTTF( "fonts/escom.ttf" )
	itemName:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	itemName:setShaderVector( 0, 0.06, 0, 0, 0 )
	itemName:setShaderVector( 1, 0.02, 0, 0, 0 )
	itemName:setShaderVector( 2, 1, 0, 0, 0 )
	itemName:setLetterSpacing( 0.6 )
	LUI.OverrideFunction_CallOriginalFirst( itemName, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 0 )
	end )
	self:addElement( itemName )
	self.itemName = itemName
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.PaintjobSlotsBack0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

