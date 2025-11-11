CoD.ChooseCharacterLoadoutCarouselItem_InfoAreaWeapon = InheritFrom( LUI.UIElement )
CoD.ChooseCharacterLoadoutCarouselItem_InfoAreaWeapon.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.ChooseCharacterLoadoutCarouselItem_InfoAreaWeapon )
	self.id = "ChooseCharacterLoadoutCarouselItem_InfoAreaWeapon"
	self.soundSet = "none"
	self:setLeftRight( 0, 0, 0, 274 )
	self:setTopBottom( 0, 0, 0, 39 )
	
	local BlackBox = LUI.UIImage.new()
	BlackBox:setLeftRight( 0, 1, 0, 0 )
	BlackBox:setTopBottom( 0, 1, 0, 0 )
	BlackBox:setRGB( 0, 0, 0 )
	BlackBox:setAlpha( 0.6 )
	self:addElement( BlackBox )
	self.BlackBox = BlackBox
	
	local loadOutItemName = LUI.UITightText.new()
	loadOutItemName:setLeftRight( 0, 0, 5, 170 )
	loadOutItemName:setTopBottom( 0, 0, 1, 34 )
	loadOutItemName:setText( Engine.Localize( "Hero Weapon/Ability" ) )
	loadOutItemName:setTTF( "fonts/escom.ttf" )
	LUI.OverrideFunction_CallOriginalFirst( loadOutItemName, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 0 )
	end )
	self:addElement( loadOutItemName )
	self.loadOutItemName = loadOutItemName
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

