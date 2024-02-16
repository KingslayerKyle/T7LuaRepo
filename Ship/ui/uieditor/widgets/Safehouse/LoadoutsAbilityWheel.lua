-- 69695bd82b155ea978fa9e4721a46536
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.AbilityWheel.AbilityWheel_IconHex" )
require( "ui.uieditor.widgets.AbilityWheel.AbilityWheel_Pixel" )

CoD.LoadoutsAbilityWheel = InheritFrom( LUI.UIElement )
CoD.LoadoutsAbilityWheel.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.LoadoutsAbilityWheel )
	self.id = "LoadoutsAbilityWheel"
	self.soundSet = "CAC"
	self:setLeftRight( true, false, 0, 108 )
	self:setTopBottom( true, false, 0, 106 )
	self.anyChildUsesUpdateState = true
	
	local AbilityWheelIconHex1 = CoD.AbilityWheel_IconHex.new( menu, controller )
	AbilityWheelIconHex1:setLeftRight( false, false, -45.12, 45.12 )
	AbilityWheelIconHex1:setTopBottom( false, false, -52.86, 52.86 )
	AbilityWheelIconHex1:setScale( 0.9 )
	AbilityWheelIconHex1:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( AbilityWheelIconHex1 )
	self.AbilityWheelIconHex1 = AbilityWheelIconHex1
	
	local Pixel1 = CoD.AbilityWheel_Pixel.new( menu, controller )
	Pixel1:setLeftRight( false, false, 46, 54 )
	Pixel1:setTopBottom( false, false, -24, -16 )
	Pixel1:setRGB( 0, 0.56, 1 )
	Pixel1:setAlpha( 0.6 )
	self:addElement( Pixel1 )
	self.Pixel1 = Pixel1
	
	local Pixel2 = CoD.AbilityWheel_Pixel.new( menu, controller )
	Pixel2:setLeftRight( false, false, -54, -46 )
	Pixel2:setTopBottom( false, false, -23, -15 )
	Pixel2:setRGB( 0, 0.56, 1 )
	Pixel2:setAlpha( 0.6 )
	self:addElement( Pixel2 )
	self.Pixel2 = Pixel2
	
	local Pixel3 = CoD.AbilityWheel_Pixel.new( menu, controller )
	Pixel3:setLeftRight( false, false, 40, 48 )
	Pixel3:setTopBottom( false, false, 19, 27 )
	Pixel3:setRGB( 0, 0.56, 1 )
	Pixel3:setAlpha( 0.6 )
	self:addElement( Pixel3 )
	self.Pixel3 = Pixel3
	
	local Pixel4 = CoD.AbilityWheel_Pixel.new( menu, controller )
	Pixel4:setLeftRight( false, false, -49, -41 )
	Pixel4:setTopBottom( false, false, 20, 28 )
	Pixel4:setRGB( 0, 0.56, 1 )
	Pixel4:setAlpha( 0.6 )
	self:addElement( Pixel4 )
	self.Pixel4 = Pixel4
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.AbilityWheelIconHex1:close()
		element.Pixel1:close()
		element.Pixel2:close()
		element.Pixel3:close()
		element.Pixel4:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
