require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponNameWidget" )

CoD.PersonalizeHero_InfoBlock = InheritFrom( LUI.UIElement )
CoD.PersonalizeHero_InfoBlock.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PersonalizeHero_InfoBlock )
	self.id = "PersonalizeHero_InfoBlock"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( true, false, 0, 300 )
	self:setTopBottom( true, false, 0, 471 )
	self.anyChildUsesUpdateState = true
	
	local currentlyEquipped = LUI.UITightText.new()
	currentlyEquipped:setLeftRight( true, false, 0, 45 )
	currentlyEquipped:setTopBottom( true, false, 37, 53 )
	currentlyEquipped:setText( Engine.Localize( "MENU_NEW" ) )
	currentlyEquipped:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( currentlyEquipped )
	self.currentlyEquipped = currentlyEquipped
	
	local WeaponNameWidget0 = CoD.WeaponNameWidget.new( menu, controller )
	WeaponNameWidget0:setLeftRight( true, false, 0, 196 )
	WeaponNameWidget0:setTopBottom( true, false, 0, 34 )
	WeaponNameWidget0.weaponNameLabel:setText( Engine.Localize( "MENU_NEW" ) )
	self:addElement( WeaponNameWidget0 )
	self.WeaponNameWidget0 = WeaponNameWidget0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.WeaponNameWidget0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

