-- 5f94432b20669c633a8f594cd2c539a6
-- This hash is used for caching, delete to decompile the file again

CoD.AmmoWidget_Knife = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_Knife.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_Knife )
	self.id = "AmmoWidget_Knife"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 86 )
	self:setTopBottom( true, false, 0, 26 )
	
	local Knife = LUI.UIImage.new()
	Knife:setLeftRight( false, true, -25.2, -60.26 )
	Knife:setTopBottom( false, true, -49.8, 23.8 )
	Knife:setZRot( -90 )
	Knife:subscribeToGlobalModel( controller, "CurrentWeapon", "equippedWeaponReference", function ( model )
		local equippedWeaponReference = Engine.GetModelValue( model )
		if equippedWeaponReference then
			Knife:setImage( RegisterImage( SecondaryMeleeIcon( equippedWeaponReference ) ) )
		end
	end )
	self:addElement( Knife )
	self.Knife = Knife
	
	self:mergeStateConditions( {
		{
			stateName = "Wide",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "currentWeapon.equippedWeaponReference", "melee_knuckles_mp" )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.equippedWeaponReference" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.equippedWeaponReference"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Knife:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

