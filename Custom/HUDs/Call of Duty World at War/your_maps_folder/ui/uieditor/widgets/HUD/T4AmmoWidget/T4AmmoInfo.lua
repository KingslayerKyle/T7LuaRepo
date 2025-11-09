local ammoPipInfo = {
	pistol = {
		image = "t4_weaponwidget_ammopip_smallb",
		bulletWidth = 9 / 3,
		bulletHeight = 24 / 3,
		rowLength = 50
	},
	smg = {
		image = "t4_weaponwidget_ammopip_smalla",
		bulletWidth = 7 / 3,
		bulletHeight = 21 / 3,
		rowLength = 50
	},
	rifle = {
		image = "t4_weaponwidget_ammopip_medium",
		bulletWidth = 7 / 3,
		bulletHeight = 27 / 3,
		rowLength = 50
	},
	lmg = {
		image = "t4_weaponwidget_ammopip_belt",
		bulletWidth = 16 / 3,
		bulletHeight = 8 / 3,
		rowLength = 20
	},
	shotgun = {
		image = "t4_weaponwidget_ammopip_shell",
		bulletWidth = 49 / 3,
		bulletHeight = 21 / 3,
		rowLength = 8
	},
	sniper = {
		image = "t4_weaponwidget_ammopip_largeahor",
		bulletWidth = 59 / 3,
		bulletHeight = 20 / 3,
		rowLength = 10
	},
	rocketlauncher = {
		image = "t4_weaponwidget_ammopip_rpg7",
		bulletWidth = 146 / 3,
		bulletHeight = 29 / 3,
		rowLength = 3
	},
	wonderweapon = {
		image = "ammo_counter_tesla",
		bulletWidth = 16 / 2,
		bulletHeight = 8 / 2,
		rowLength = 10
	}
}

local SetAmmoPips = function ( controller, element )
	local controllerModel = Engine.GetModelForController( controller )
	local ammoInClip = Engine.GetModelValue( Engine.GetModel( controllerModel, "currentWeapon.ammoInClip" ) )
    local ammoInDWClip = Engine.GetModelValue( Engine.GetModel( controllerModel, "currentWeapon.ammoInDWClip" ) )
    local clipMaxAmmo = Engine.GetModelValue( Engine.GetModel( controllerModel, "currentWeapon.clipMaxAmmo" ) )
    local clipMaxAmmoDW = Engine.GetModelValue( Engine.GetModel( controllerModel, "currentWeapon.clipMaxAmmoDW" ) )
    local ammoStock = Engine.GetModelValue( Engine.GetModel( controllerModel, "currentWeapon.ammoStock" ) )
    local ammoStockMax = Engine.GetModelValue( Engine.GetModel( controllerModel, "currentWeapon.ammoStockMax" ) )
    local weaponClass = Engine.GetModelValue( Engine.GetModel( controllerModel, "currentWeapon.weaponClass" ) )

	local pipImage = "blacktransparent"
	local bulletWidth = 0
	local bulletHeight = 0
	local rowLength = 0
	local clipMaxTotal = 0
	local clipTotal = 0
	local rows = 0

	if ammoInClip ~= nil
	and ammoInDWClip ~= nil
	and clipMaxAmmo ~= nil
	and clipMaxAmmoDW ~= nil
	and ammoStock ~= nil then
		local pipInfo = ammoPipInfo[weaponClass]

		if pipInfo ~= nil then
			pipImage = pipInfo.image
			bulletWidth = pipInfo.bulletWidth
			bulletHeight = pipInfo.bulletHeight
			rowLength = pipInfo.rowLength
		end

		clipMaxTotal = clipMaxAmmo + clipMaxAmmoDW

		if ammoInDWClip ~= -1 then
			clipTotal = ammoInClip + ammoInDWClip
		else
			clipTotal = ammoInClip
		end

		if clipMaxTotal < rowLength then
			rowLength = clipMaxTotal
		end

		rows = math.ceil( clipMaxTotal / rowLength )

		element:setLeftRight( false, true, rowLength * -bulletWidth - 117.5, 0 - 117.5 )
		element:setTopBottom( false, true, rows * -bulletHeight - 2, 0 - 2 )
		element:setImage( RegisterImage( pipImage ) )
		element:setShaderVector( 0, clipTotal, clipMaxTotal, rowLength, 0.5 )
	end
end

local SetWeaponName = function ( controller, element )
	local weaponNameModel = Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.weaponName" )
	local aatIconModel = Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.aatIcon" )
	local muleKickModel = Engine.GetModel( Engine.GetModelForController( controller ), "t4_mule_kick" )
	local weaponName = Engine.GetModelValue( weaponNameModel )
	local aatIcon = Engine.GetModelValue( aatIconModel )
	local muleKick = Engine.GetModelValue( muleKickModel )

	if weaponName ~= nil and aatIcon ~= nil and muleKick ~= nil then
		if aatIcon == "t7_icon_zm_aat_blast_furnace" then
			weaponName = (weaponName .. " (Blast Furnace)")

		elseif aatIcon == "t7_icon_zm_aat_dead_wire" then
			weaponName = (weaponName .. " (Dead Wire)")

		elseif aatIcon == "t7_icon_zm_aat_fire_works" then
			weaponName = (weaponName .. " (Fire Works)")

		elseif aatIcon == "t7_icon_zm_aat_thunder_wall" then
			weaponName = (weaponName .. " (Thunder Wall)")

		elseif aatIcon == "t7_icon_zm_aat_turned" then
			weaponName = (weaponName .. " (Turned)")
		end

		if muleKick == 1 then
			weaponName = (weaponName .. " (MK)")
		end

		element:setText( Engine.Localize( weaponName ) )
	end
end

local SetLowAmmoRGB = function ( controller, element )
	local controllerModel = Engine.GetModelForController( controller )
    local ammoStock = Engine.GetModelValue( Engine.GetModel( controllerModel, "currentWeapon.ammoStock" ) )
    local ammoStockMax = Engine.GetModelValue( Engine.GetModel( controllerModel, "currentWeapon.ammoStockMax" ) )

	if ammoStock ~= nil and ammoStockMax ~= nil then
		if ammoStock <= (ammoStockMax / 4) then
			element:setRGB( 0.71, 0.21, 0.21 )
		else
			element:setRGB( 1, 1, 1 )
		end
	end
end

local PostLoadFunc = function ( self, controller, menu )
	local ammoModels = {
		"ammoInClip",
		"ammoInDWClip",
		"clipMaxAmmo",
		"clipMaxAmmoDW",
		"ammoStock",
		"ammoStockMax",
		"weaponClass"
	}

	for index = 1, #ammoModels do
		self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon." .. ammoModels[index] ), function ( model )
			SetAmmoPips( controller, self.AmmoPips )
		end )
	end
end

CoD.T4AmmoInfo = InheritFrom( LUI.UIElement )
CoD.T4AmmoInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.T4AmmoInfo )
	self.id = "T4AmmoInfo"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true

	self.WeaponNameShadow = LUI.UIText.new()
	self.WeaponNameShadow:setLeftRight( true, true, 0 + 0.5, 345 + 0.5 )
	self.WeaponNameShadow:setTopBottom( false, true, -45 - 50 + 0.5, 0 - 50 + 0.5 )
	self.WeaponNameShadow:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	self.WeaponNameShadow:setTTF( "fonts/itc_legacy_sans_bold.ttf" )
	self.WeaponNameShadow:setRGB( 0, 0, 0 )
	self.WeaponNameShadow:setScale( 0.5 )
	self.WeaponNameShadow:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.weaponName" ), function ( model )
		SetWeaponName( controller, self.WeaponNameShadow )
	end )
	self.WeaponNameShadow:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.aatIcon" ), function ( model )
		SetWeaponName( controller, self.WeaponNameShadow )
	end )
	self.WeaponNameShadow:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "t4_mule_kick" ), function ( model )
		SetWeaponName( controller, self.WeaponNameShadow )
	end )
	self:addElement( self.WeaponNameShadow )

	self.WeaponName = LUI.UIText.new()
	self.WeaponName:setLeftRight( true, true, 0, 345 )
	self.WeaponName:setTopBottom( false, true, -45 - 50, 0 - 50 )
	self.WeaponName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	self.WeaponName:setTTF( "fonts/itc_legacy_sans_bold.ttf" )
	self.WeaponName:setScale( 0.5 )
	self.WeaponName:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.weaponName" ), function ( model )
		SetWeaponName( controller, self.WeaponName )
	end )
	self.WeaponName:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.aatIcon" ), function ( model )
		SetWeaponName( controller, self.WeaponName )
	end )
	self.WeaponName:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "t4_mule_kick" ), function ( model )
		SetWeaponName( controller, self.WeaponName )
	end )
	self:addElement( self.WeaponName )

    self.AmmoPips = LUI.UIImage.new()
    self.AmmoPips:setLeftRight( true, false, 0, 0 )
    self.AmmoPips:setTopBottom( true, false, 0, 0 )
	self.AmmoPips:setImage( RegisterImage( "blacktransparent" ) )
    self.AmmoPips:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_t4_bullet_bar" ) )
    self.AmmoPips:setShaderVector( 0, 0, 0, 0, 0 )
    self:addElement( self.AmmoPips )

	self.AmmoStockShadow = LUI.UIText.new()
    self.AmmoStockShadow:setLeftRight( true, true, 1138 + 0.5, 0 + 0.5 )
    self.AmmoStockShadow:setTopBottom( false, true, -28 + 0.5, 15 + 0.5 )
    self.AmmoStockShadow:setTTF( "fonts/itc_legacy_sans_bold.ttf" )
	self.AmmoStockShadow:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self.AmmoStockShadow:setRGB( 0, 0, 0 )
	self.AmmoStockShadow:setScale( 0.5 )
	self.AmmoStockShadow:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.ammoStock" ), function ( model )
		local ammoStock = Engine.GetModelValue( model )

		if ammoStock then
			self.AmmoStockShadow:setText( Engine.Localize( ammoStock ) )
		end
	end )
	self:addElement( self.AmmoStockShadow )

	self.AmmoStock = LUI.UIText.new()
    self.AmmoStock:setLeftRight( true, true, 1138, 0 )
    self.AmmoStock:setTopBottom( false, true, -28, 15 )
    self.AmmoStock:setTTF( "fonts/itc_legacy_sans_bold.ttf" )
	self.AmmoStock:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self.AmmoStock:setScale( 0.5 )
	self.AmmoStock:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.ammoStock" ), function ( model )
		local ammoStock = Engine.GetModelValue( model )

		if ammoStock then
			self.AmmoStock:setText( Engine.Localize( ammoStock ) )
		end

		SetLowAmmoRGB( controller, self.AmmoStock )
	end )
	self.AmmoStock:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.ammoStockMax" ), function ( model )
		SetLowAmmoRGB( controller, self.AmmoStock )
	end )
	self:addElement( self.AmmoStock )

	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				self.WeaponNameShadow:completeAnimation()
				self.WeaponNameShadow:setAlpha( 1 )
				self.clipFinished( self.WeaponNameShadow, {} )

				self.WeaponName:completeAnimation()
				self.WeaponName:setAlpha( 1 )
				self.clipFinished( self.WeaponName, {} )

				self.AmmoPips:completeAnimation()
				self.AmmoPips:setAlpha( 1 )
				self.clipFinished( self.AmmoPips, {} )

				self.AmmoStockShadow:completeAnimation()
				self.AmmoStockShadow:setAlpha( 1 )
				self.clipFinished( self.AmmoStockShadow, {} )

				self.AmmoStock:completeAnimation()
				self.AmmoStock:setAlpha( 1 )
				self.clipFinished( self.AmmoStock, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				self.WeaponNameShadow:completeAnimation()
				self.WeaponNameShadow:setAlpha( 0 )
				self.clipFinished( self.WeaponNameShadow, {} )

				self.WeaponName:completeAnimation()
				self.WeaponName:setAlpha( 0 )
				self.clipFinished( self.WeaponName, {} )

				self.AmmoPips:completeAnimation()
				self.AmmoPips:setAlpha( 0 )
				self.clipFinished( self.AmmoPips, {} )

				self.AmmoStockShadow:completeAnimation()
				self.AmmoStockShadow:setAlpha( 0 )
				self.clipFinished( self.AmmoStockShadow, {} )

				self.AmmoStock:completeAnimation()
				self.AmmoStock:setAlpha( 0 )
				self.clipFinished( self.AmmoStock, {} )
			end
		}
	}
	
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				if not WeaponUsesAmmo( controller )
				or IsModelValueEqualTo( controller, "currentWeapon.viewmodelWeaponName", "minigun_zm" )
				or IsModelValueEqualTo( controller, "currentWeapon.viewmodelWeaponName", "cymbal_monkey_zm" )
				or IsModelValueEqualTo( controller, "currentWeapon.viewmodelWeaponName", "octobomb_zm" )
				or IsModelValueEqualTo( controller, "currentWeapon.viewmodelWeaponName", "frag_grenade_zm" )
				or IsModelValueEqualTo( controller, "currentWeapon.viewmodelWeaponName", "sticky_grenade_widows_wine_zm" )
				or ModelValueStartsWith( controller, "currentWeapon.viewmodelWeaponName", "zombie_" ) then
					return true
				else
					return false
				end
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.viewmodelWeaponName" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.viewmodelWeaponName"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.WeaponNameShadow:close()
		element.WeaponName:close()
		element.AmmoPips:close()
		element.AmmoStockShadow:close()
		element.AmmoStock:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
