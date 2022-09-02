-- b7c24b3f4d95a3655f2998b83e3c1ca8
-- This hash is used for caching, delete to decompile the file again

CoD.AmmoWidget_ThiefCoinWidgetxml = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_ThiefCoinWidgetxml.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_ThiefCoinWidgetxml )
	self.id = "AmmoWidget_ThiefCoinWidgetxml"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 108 )
	self:setTopBottom( true, false, 0, 108 )
	
	local RingBG = LUI.UIImage.new()
	RingBG:setLeftRight( true, true, 0.14, -0.14 )
	RingBG:setTopBottom( true, true, 0.14, -0.14 )
	RingBG:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_blackjackring2" ) )
	self:addElement( RingBG )
	self.RingBG = RingBG
	
	local NewWeaponIcon = LUI.UIImage.new()
	NewWeaponIcon:setLeftRight( true, true, 22.67, -22.67 )
	NewWeaponIcon:setTopBottom( true, true, 22.67, -22.67 )
	NewWeaponIcon:setYRot( 180 )
	NewWeaponIcon:setZRot( 8 )
	NewWeaponIcon:setScale( 1.3 )
	NewWeaponIcon:subscribeToGlobalModel( controller, "HeroWeapon", "imageAvailable", function ( model )
		local imageAvailable = Engine.GetModelValue( model )
		if imageAvailable then
			NewWeaponIcon:setImage( RegisterImage( imageAvailable ) )
		end
	end )
	self:addElement( NewWeaponIcon )
	self.NewWeaponIcon = NewWeaponIcon
	
	local CurrentWeaponIcon = LUI.UIImage.new()
	CurrentWeaponIcon:setLeftRight( true, true, 22.67, -22.67 )
	CurrentWeaponIcon:setTopBottom( true, true, 22.67, -22.67 )
	CurrentWeaponIcon:setZRot( 8 )
	CurrentWeaponIcon:setScale( 1.3 )
	CurrentWeaponIcon:subscribeToGlobalModel( controller, "HeroWeapon", "thiefLastWeapon", function ( model )
		local thiefLastWeapon = Engine.GetModelValue( model )
		if thiefLastWeapon then
			CurrentWeaponIcon:setImage( RegisterImage( thiefLastWeapon ) )
		end
	end )
	self:addElement( CurrentWeaponIcon )
	self.CurrentWeaponIcon = CurrentWeaponIcon
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.NewWeaponIcon:close()
		element.CurrentWeaponIcon:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

