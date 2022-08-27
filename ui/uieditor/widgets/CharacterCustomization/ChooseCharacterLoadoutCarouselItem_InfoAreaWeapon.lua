-- 11358b2461ebb66c121fe5b5fd1d1c05
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 183 )
	self:setTopBottom( true, false, 0, 26 )
	
	local BlackBox = LUI.UIImage.new()
	BlackBox:setLeftRight( true, true, 0, 0 )
	BlackBox:setTopBottom( true, true, 0, -0.5 )
	BlackBox:setRGB( 0, 0, 0 )
	BlackBox:setAlpha( 0.6 )
	self:addElement( BlackBox )
	self.BlackBox = BlackBox
	
	local loadOutItemName = LUI.UITightText.new()
	loadOutItemName:setLeftRight( true, false, 3.31, 113.31 )
	loadOutItemName:setTopBottom( true, false, 1, 23 )
	loadOutItemName:setText( Engine.Localize( "Hero Weapon/Ability" ) )
	loadOutItemName:setTTF( "fonts/escom.ttf" )
	LUI.OverrideFunction_CallOriginalFirst( loadOutItemName, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 0 )
	end )
	self:addElement( loadOutItemName )
	self.loadOutItemName = loadOutItemName
	
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

