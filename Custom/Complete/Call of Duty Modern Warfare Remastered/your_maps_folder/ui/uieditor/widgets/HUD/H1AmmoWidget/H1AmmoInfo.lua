local SetWeaponName = function ( controller, element )
	local weaponName = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.weaponName" ) )
	local aatIcon = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.aatIcon" ) )

	if weaponName ~= nil and aatIcon ~= nil then
		if aatIcon == "t7_icon_zm_aat_blast_furnace" then
			element:setText( Engine.Localize( weaponName .. " (Blast Furnace)" ) )

		elseif aatIcon == "t7_icon_zm_aat_dead_wire" then
			element:setText( Engine.Localize( weaponName .. " (Dead Wire)" ) )

		elseif aatIcon == "t7_icon_zm_aat_fire_works" then
			element:setText( Engine.Localize( weaponName .. " (Fire Works)" ) )

		elseif aatIcon == "t7_icon_zm_aat_thunder_wall" then
			element:setText( Engine.Localize( weaponName .. " (Thunder Wall)" ) )

		elseif aatIcon == "t7_icon_zm_aat_turned" then
			element:setText( Engine.Localize( weaponName .. " (Turned)" ) )

		else
			element:setText( Engine.Localize( weaponName ) )
		end
	end
end

local GetWeaponNameRightAnchor = function ( stockLength )
	if stockLength then
		if stockLength == 1 then
			return 238

		elseif stockLength == 2 then
			return 211

		elseif stockLength == 3 then
			return 184

		elseif stockLength == 4 then
			return 158
		end
	end

	return 0
end

local GetAmmoPipInfo = function ()
	local ammoPipInfo = {
		pistol = {
			image = "h1_weaponwidget_ammopip_smallb",
			bulletWidth = 9 / 3,
			bulletHeight = 24 / 3,
			rowLength = 50
		},
		smg = {
			image = "h1_weaponwidget_ammopip_smalla",
			bulletWidth = 7 / 3,
			bulletHeight = 21 / 3,
			rowLength = 50
		},
		rifle = {
			image = "h1_weaponwidget_ammopip_medium",
			bulletWidth = 7 / 3,
			bulletHeight = 27 / 3,
			rowLength = 50
		},
		mg = {
			image = "h1_weaponwidget_ammopip_largea",
			bulletWidth = 9 / 3,
			bulletHeight = 31 / 3,
			rowLength = 40
		},
		spread = {
			image = "h1_weaponwidget_ammopip_shell",
			bulletWidth = 49 / 3,
			bulletHeight = 21 / 3,
			rowLength = 8
		},
		rocketlauncher = {
			image = "h1_weaponwidget_ammopip_rpg7",
			bulletWidth = 146 / 3,
			bulletHeight = 29 / 3,
			rowLength = 3
		}
	}

	return ammoPipInfo
end

local SetAmmoPips = function ( controller, AmmoPips, WeaponName )
	local controllerModel = Engine.GetModelForController( controller )
	local ammoInClip = Engine.GetModelValue( Engine.GetModel( controllerModel, "currentWeapon.ammoInClip" ) )
    local ammoInDWClip = Engine.GetModelValue( Engine.GetModel( controllerModel, "currentWeapon.ammoInDWClip" ) )
    local clipMaxAmmo = Engine.GetModelValue( Engine.GetModel( controllerModel, "currentWeapon.clipMaxAmmo" ) )
    local clipMaxAmmoDW = Engine.GetModelValue( Engine.GetModel( controllerModel, "currentWeapon.clipMaxAmmoDW" ) )
    local ammoStock = Engine.GetModelValue( Engine.GetModel( controllerModel, "currentWeapon.ammoStock" ) )
    local weaponClass = Engine.GetModelValue( Engine.GetModel( controllerModel, "currentWeapon.weaponClass" ) )
    local viewmodelWeaponName = Engine.GetModelValue( Engine.GetModel( controllerModel, "currentWeapon.viewmodelWeaponName" ) )

	local pipImage = "blacktransparent"
	local bulletWidth = 0
	local bulletHeight = 0
	local rowLength = 0
	local clipMaxTotal = 0
	local clipTotal = 0
	local rows = 0
	local stockLength = 0
	local pipSpacing = 0

	if ammoInClip ~= nil
	and ammoInDWClip ~= nil
	and clipMaxAmmo ~= nil
	and clipMaxAmmoDW ~= nil
	and ammoStock ~= nil then
		local pipInfo = GetAmmoPipInfo()[weaponClass]

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
		stockLength = #tostring( ammoStock )
		pipSpacing = ( tonumber( stockLength ) - 1 ) * 20

		AmmoPips:setLeftRight( false, true, rowLength * -bulletWidth - 144 - pipSpacing, 0 - 144 - pipSpacing )
		AmmoPips:setTopBottom( false, true, rows * -bulletHeight - 25, 0 - 25 )
		AmmoPips:setImage( RegisterImage( pipImage ) )
		AmmoPips:setShaderVector( 0, clipTotal, clipMaxTotal, rowLength, 0.5 )

		WeaponName:setLeftRight( true, true, 0, GetWeaponNameRightAnchor( stockLength ) )

		if viewmodelWeaponName:find( "melee_" ) then
			bulletHeight = 24 / 3
			rows = 1
		end

		WeaponName:setTopBottom( false, true, -50 - bulletHeight * rows, -18 - bulletHeight * rows )
	end
end

local PostLoadFunc = function ( self, controller, menu )
	local ammoModels = {
		"ammoInClip",
		"ammoInDWClip",
		"clipMaxAmmo",
		"clipMaxAmmoDW",
		"ammoStock",
		"weaponClass",
		"viewmodelWeaponName"
	}

	for index = 1, #ammoModels do
		self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon." .. ammoModels[index] ), function ( model )
			SetAmmoPips( controller, self.AmmoPips, self.WeaponName )
		end )
	end
end

CoD.H1AmmoInfo = InheritFrom( LUI.UIElement )
CoD.H1AmmoInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.H1AmmoInfo )
	self.id = "H1AmmoInfo"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true

	self.WeaponName = LUI.UIText.new()
	self.WeaponName:setLeftRight( true, false, 0, 0 )
	self.WeaponName:setTopBottom( true, false, 0, 0 )
	self.WeaponName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	self.WeaponName:setTTF( "fonts/defaultbold.otf" )
	self.WeaponName:setScale( 0.5 )
	self.WeaponName:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.weaponName" ), function ( model )
		SetWeaponName( controller, self.WeaponName )
	end )
	self.WeaponName:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.aatIcon" ), function ( model )
		SetWeaponName( controller, self.WeaponName )
	end )
	self:addElement( self.WeaponName )

    self.AmmoPips = LUI.UIImage.new()
    self.AmmoPips:setLeftRight( true, false, 0, 0 )
    self.AmmoPips:setTopBottom( true, false, 0, 0 )
	self.AmmoPips:setImage( RegisterImage( "blacktransparent" ) )
    self.AmmoPips:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_h1_bullet_bar" ) )
    self.AmmoPips:setShaderVector( 0, 0, 0, 0, 0 )
    self:addElement( self.AmmoPips )

	self.AmmoStock = LUI.UIText.new()
    self.AmmoStock:setLeftRight( true, true, 0, 268.5 )
    self.AmmoStock:setTopBottom( false, true, -76.5, 1 )
    self.AmmoStock:setTTF( "fonts/defaultbold.otf" )
	self.AmmoStock:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	self.AmmoStock:setScale( 0.5 )
	self.AmmoStock:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.ammoStock" ), function ( model )
		local ammoStock = Engine.GetModelValue( model )

		if ammoStock then
			if ammoStock == 0 then
				self.AmmoStock:setRGB( 0.94, 0.21, 0.27 )
			else
				self.AmmoStock:setRGB( 1, 1, 1 )
			end

			self.AmmoStock:setText( Engine.Localize( ammoStock ) )
		end
	end )
	self:addElement( self.AmmoStock )

	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				self.AmmoPips:completeAnimation()
				self.AmmoPips:setAlpha( 1 )
				self.clipFinished( self.AmmoPips, {} )

				self.AmmoStock:completeAnimation()
				self.AmmoStock:setAlpha( 1 )
				self.clipFinished( self.AmmoStock, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				self.AmmoPips:completeAnimation()
				self.AmmoPips:setAlpha( 0 )
				self.clipFinished( self.AmmoPips, {} )

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
		element.WeaponName:close()
		element.AmmoPips:close()
		element.AmmoStock:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
