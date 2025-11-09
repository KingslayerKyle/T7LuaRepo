require( "ui.uieditor.widgets.HUD.CSGOAmmoWidget.CSGOAmmoWeaponImages" )
require( "ui.uieditor.widgets.HUD.ZM_AmmoWidget.ZmAmmo_BBGumMeterWidget" )
require( "ui.uieditor.widgets.HUD.ZM_FX.ZmFx_Spark2" )

local SetWeaponImages = function ( element, model )
	local weaponName = Engine.GetModelValue( model )

	if weaponName then
		if weaponName:find( "+" ) then
			weaponName = weaponName:match( "^(.-)+" )
		end

		if weaponName:find( "^" .. "pistol_" )
		or weaponName:find( "^" .. "ar_" )
		or weaponName:find( "^" .. "smg_" )
		or weaponName:find( "^" .. "shotgun_" )
		or weaponName:find( "^" .. "lmg_" )
		or weaponName:find( "^" .. "sniper_" ) then
			if weaponName:find( "_upgraded" ) then
				element:setImage( RegisterImage( "t7_icon_weapon_" .. tostring( weaponName ):gsub( "_upgraded", "_pu" ) ) )
			else
				element:setImage( RegisterImage( "t7_icon_weapon_" .. tostring( weaponName ) .. "_pu" ) )
			end
		else
			element:setImage( RegisterImage( "blacktransparent" ) )
		end

		if CoD.CSGOAmmoWeaponImages then
			for key, value in pairs( CoD.CSGOAmmoWeaponImages ) do
				if weaponName == key then
					element:setImage( RegisterImage( value ) )
				end
			end
		end

		if weaponName == "none" then
			element:setImage( RegisterImage( "blacktransparent" ) )
		end
	end
end

local SetWeaponUpgradeImages = function ( element, model )
	local weaponName = Engine.GetModelValue( model )

	if weaponName then
		if weaponName:find( "_upgraded" )
		or weaponName:sub( -3 ) == "_up" then
			element.Image0:setImage( RegisterImage( "uie_t7_zm_hud_rnd_spk2" ) )
			element.Image00:setImage( RegisterImage( "uie_t7_zm_hud_rnd_spk2" ) )
		else
			element.Image0:setImage( RegisterImage( "blacktransparent" ) )
			element.Image00:setImage( RegisterImage( "blacktransparent" ) )
		end
	end
end

local SetAATImages = function ( element, model )
	local aatName = Engine.GetModelValue( model )

	if aatName then
		if aatName == "zm_aat_blast_furnace" then
			element:setImage( RegisterImage( "t7_icon_zm_aat_blast_furnace" ) )

		elseif aatName == "zm_aat_dead_wire" then
			element:setImage( RegisterImage( "t7_icon_zm_aat_dead_wire" ) )

		elseif aatName == "zm_aat_fire_works" then
			element:setImage( RegisterImage( "t7_icon_zm_aat_fire_works" ) )

		elseif aatName == "zm_aat_thunder_wall" then
			element:setImage( RegisterImage( "t7_icon_zm_aat_thunder_wall" ) )

		elseif aatName == "zm_aat_turned" then
			element:setImage( RegisterImage( "t7_icon_zm_aat_turned" ) )

		else
			element:setImage( RegisterImage( "blacktransparent" ) )
		end
	end
end

local SetCurrentWeaponBG = function ( controller, element )
	local viewmodelWeaponName = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.viewmodelWeaponName" ) )
	local csgo_first_weapon = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "csgo_first_weapon" ) )
	local csgo_second_weapon = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "csgo_second_weapon" ) )
	local csgo_third_weapon = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "csgo_third_weapon" ) )

	local success = false

	if viewmodelWeaponName ~= nil then
		if csgo_first_weapon ~= nil then
			if csgo_first_weapon:find( "+" ) then
				csgo_first_weapon = csgo_first_weapon:match( "^(.-)+" )
			end

			if viewmodelWeaponName == csgo_first_weapon
			or viewmodelWeaponName == ( csgo_first_weapon .. "_zm" ) then
				element:setTopBottom( false, true, -143, -105.5 )
				element:setImage( RegisterImage( "$white" ) )
				success = true
			end
		end

		if csgo_second_weapon ~= nil then
			if csgo_second_weapon:find( "+" ) then
				csgo_second_weapon = csgo_second_weapon:match( "^(.-)+" )
			end

			if ( viewmodelWeaponName == csgo_second_weapon
			or viewmodelWeaponName == ( csgo_second_weapon .. "_zm" ) )
			and not success then
				element:setTopBottom( false, true, -143 - 56, -105.5 - 56 )
				element:setImage( RegisterImage( "$white" ) )
				success = true
			end
		end

		if csgo_third_weapon ~= nil then
			if csgo_third_weapon:find( "+" ) then
				csgo_third_weapon = csgo_third_weapon:match( "^(.-)+" )
			end

			if ( viewmodelWeaponName == csgo_third_weapon
			or viewmodelWeaponName == ( csgo_third_weapon .. "_zm" ) )
			and not success then
				element:setTopBottom( false, true, -143 - 56 - 56, -105.5 - 56 - 56 )
				element:setImage( RegisterImage( "$white" ) )
				success = true
			end
		end

		if not success then
			element:setImage( RegisterImage( "blacktransparent" ) )
		end
	end
end

local PreLoadFunc = function ( self, controller )
	Engine.CreateModel( Engine.GetModelForController( controller ), "csgo_first_weapon" )
	Engine.CreateModel( Engine.GetModelForController( controller ), "csgo_first_weapon_aat" )
	Engine.CreateModel( Engine.GetModelForController( controller ), "csgo_second_weapon" )
	Engine.CreateModel( Engine.GetModelForController( controller ), "csgo_second_weapon_aat" )
	Engine.CreateModel( Engine.GetModelForController( controller ), "csgo_third_weapon" )
	Engine.CreateModel( Engine.GetModelForController( controller ), "csgo_third_weapon_aat" )
end

CoD.CSGOAmmoEquipment = InheritFrom( LUI.UIElement )
CoD.CSGOAmmoEquipment.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CSGOAmmoEquipment )
	self.id = "CSGOAmmoEquipment"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true

	self.BGBWidget = CoD.ZmAmmo_BBGumMeterWidget.new( menu, controller )
	self.BGBWidget:setLeftRight( false, true, -220, 0 )
	self.BGBWidget:setTopBottom( false, true, -95, 0 )
	self:addElement( self.BGBWidget )

	self.LethalCountText = LUI.UIText.new()
    self.LethalCountText:setLeftRight( false, true, 0, -4 )
    self.LethalCountText:setTopBottom( false, true, -84.5, -72 )
	self.LethalCountText:setText( Engine.Localize( "" ) )
	self.LethalCountText:setTTF( "fonts/stratum2bold.ttf" )
	self.LethalCountText:setRGB( 0.9, 0.9, 0.9 )
	self.LethalCountText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	self.LethalCountText:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentPrimaryOffhand.primaryOffhandCount" ), function ( model )
		local primaryOffhandCount = Engine.GetModelValue( model )

		if primaryOffhandCount then
			if primaryOffhandCount < 1 then
				self.LethalCountText:setText( Engine.Localize( "" ) )
			else
				self.LethalCountText:setText( Engine.Localize( primaryOffhandCount ) )
			end
		end
	end )
	self:addElement( self.LethalCountText )

	self.LethalImage = LUI.UIImage.new()
    self.LethalImage:setLeftRight( false, true, -51.5, -14 )
    self.LethalImage:setTopBottom( false, true, -87, -49.5 )
	self.LethalImage:setImage( RegisterImage( "blacktransparent" ) )
	self.LethalImage:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentPrimaryOffhand.primaryOffhand" ), function ( model )
		local primaryOffhand = Engine.GetModelValue( model )

		if primaryOffhand then
			if primaryOffhand == "uie_t7_zm_hud_inv_icnlthl" then
				self.LethalImage:setImage( RegisterImage( "t7_hud_mp_inventory_grenade" ) )

			elseif primaryOffhand == "uie_t7_zm_hud_inv_widowswine" then
				self.LethalImage:setImage( RegisterImage( "t7_hud_mp_inventory_semtex" ) )

			else
				self.LethalImage:setImage( RegisterImage( primaryOffhand ) )
			end
		end
	end )
	self:addElement( self.LethalImage )

	self.TacticalCountText = LUI.UIText.new()
    self.TacticalCountText:setLeftRight( false, true, 0 - 56, -4 - 56 )
    self.TacticalCountText:setTopBottom( false, true, -84.5, -72 )
	self.TacticalCountText:setText( Engine.Localize( "" ) )
	self.TacticalCountText:setTTF( "fonts/stratum2bold.ttf" )
	self.TacticalCountText:setRGB( 0.9, 0.9, 0.9 )
	self.TacticalCountText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	self.TacticalCountText:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentSecondaryOffhand.secondaryOffhandCount" ), function ( model )
		local secondaryOffhandCount = Engine.GetModelValue( model )

		if secondaryOffhandCount then
			if secondaryOffhandCount < 1 then
				self.TacticalCountText:setText( Engine.Localize( "" ) )
			else
				self.TacticalCountText:setText( Engine.Localize( secondaryOffhandCount ) )
			end
		end
	end )
	self:addElement( self.TacticalCountText )

	self.TacticalImage = LUI.UIImage.new()
    self.TacticalImage:setLeftRight( false, true, -51.5 - 56, -14 - 56 )
    self.TacticalImage:setTopBottom( false, true, -87, -49.5 )
    self.TacticalImage:setImage( RegisterImage( "blacktransparent" ) )
	self.TacticalImage:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentSecondaryOffhand.secondaryOffhand" ), function ( model )
		local secondaryOffhand = Engine.GetModelValue( model )

		if secondaryOffhand then
			if secondaryOffhand == "hud_cymbal_monkey_bo3" then
				self.TacticalImage:setImage( RegisterImage( "t7_hud_mp_inventory_cymbal_monkey" ) )
			else
				self.TacticalImage:setImage( RegisterImage( secondaryOffhand ) )
			end
		end
	end )
	self:addElement( self.TacticalImage )

	self.DpadIconMineCountText = LUI.UIText.new()
    self.DpadIconMineCountText:setLeftRight( false, true, 0 - 56 - 56, -4 - 56 - 56 )
    self.DpadIconMineCountText:setTopBottom( false, true, -84.5, -72 )
	self.DpadIconMineCountText:setText( Engine.Localize( "" ) )
	self.DpadIconMineCountText:setTTF( "fonts/stratum2bold.ttf" )
	self.DpadIconMineCountText:setRGB( 0.9, 0.9, 0.9 )
	self.DpadIconMineCountText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	self.DpadIconMineCountText:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.actionSlot3ammo" ), function ( model )
		local actionSlot3ammo = Engine.GetModelValue( model )

		if actionSlot3ammo then
			if actionSlot3ammo < 1 then
				self.DpadIconMineCountText:setText( Engine.Localize( "" ) )
			else
				self.DpadIconMineCountText:setText( Engine.Localize( actionSlot3ammo ) )
			end
		end
	end )
	self:addElement( self.DpadIconMineCountText )

	self.DpadIconMineImage = LUI.UIImage.new()
    self.DpadIconMineImage:setLeftRight( false, true, -51.5 - 56 - 56, -14 - 56 - 56 )
    self.DpadIconMineImage:setTopBottom( false, true, -87, -49.5 )
	self.DpadIconMineImage:setImage( RegisterImage( "blacktransparent" ) )
	self.DpadIconMineImage:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.showDpadRight" ), function ( model )
		local showDpadRight = Engine.GetModelValue( model )

		if showDpadRight then
			if showDpadRight > 0 then
				self.DpadIconMineImage:setImage( RegisterImage( "t7_hud_mp_inventory_bouncingbetty" ) )
			else
				self.DpadIconMineImage:setImage( RegisterImage( "blacktransparent" ) )
			end
		end
	end )
	self:addElement( self.DpadIconMineImage )

	self.CurrentWeaponBG = LUI.UIImage.new()
    self.CurrentWeaponBG:setLeftRight( false, true, -115.5, -14 )
    self.CurrentWeaponBG:setTopBottom( false, true, -143, -105.5 )
    self.CurrentWeaponBG:setImage( RegisterImage( "blacktransparent" ) )
	self.CurrentWeaponBG:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	self.CurrentWeaponBG:setShaderVector( 0, 0.2, 0.02, 0.2, 0.02 )
	self.CurrentWeaponBG:setRGB( 0, 0, 0 )
	self.CurrentWeaponBG:setAlpha( 0.2 )
	self.CurrentWeaponBG:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.viewmodelWeaponName" ), function ( model )
		if Engine.GetModelValue( model ) then
			SetCurrentWeaponBG( controller, self.CurrentWeaponBG )
		end
	end )
	self.CurrentWeaponBG:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "csgo_first_weapon" ), function ( model )
		if Engine.GetModelValue( model ) then
			SetCurrentWeaponBG( controller, self.CurrentWeaponBG )
		end
	end )
	self.CurrentWeaponBG:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "csgo_second_weapon" ), function ( model )
		if Engine.GetModelValue( model ) then
			SetCurrentWeaponBG( controller, self.CurrentWeaponBG )
		end
	end )
	self.CurrentWeaponBG:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "csgo_third_weapon" ), function ( model )
		if Engine.GetModelValue( model ) then
			SetCurrentWeaponBG( controller, self.CurrentWeaponBG )
		end
	end )
	self:addElement( self.CurrentWeaponBG )

	self.FirstWeaponPrompt = LUI.UIText.new()
    self.FirstWeaponPrompt:setLeftRight( false, true, 0, -4 )
    self.FirstWeaponPrompt:setTopBottom( false, true, -140.5, -128 )
	self.FirstWeaponPrompt:setText( Engine.Localize( "" ) )
	self.FirstWeaponPrompt:setTTF( "fonts/stratum2bold.ttf" )
	self.FirstWeaponPrompt:setRGB( 0.9, 0.9, 0.9 )
	self.FirstWeaponPrompt:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	self.FirstWeaponPrompt:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "csgo_first_weapon" ), function ( model )
		local weaponName = Engine.GetModelValue( model )

		if weaponName then
			if weaponName == "none" then
				self.FirstWeaponPrompt:setText( Engine.Localize( "" ) )
			else
				self.FirstWeaponPrompt:setText( Engine.Localize( "1st" ) )
			end
		end
	end )
	self:addElement( self.FirstWeaponPrompt )

	self.FirstWeaponUpgradeImage = CoD.ZmFx_Spark2.new( menu, controller )
    self.FirstWeaponUpgradeImage:setLeftRight( false, true, -115.5, -14 )
    self.FirstWeaponUpgradeImage:setTopBottom( false, true, -143, -105.5 )
    self.FirstWeaponUpgradeImage:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self.FirstWeaponUpgradeImage:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "csgo_first_weapon" ), function ( model )
		local weaponName = Engine.GetModelValue( model )

		if weaponName then
			SetWeaponUpgradeImages( self.FirstWeaponUpgradeImage, model )
		end
	end )
	self:addElement( self.FirstWeaponUpgradeImage )

	self.FirstWeaponImage = LUI.UIImage.new()
    self.FirstWeaponImage:setLeftRight( false, true, -115.5, -14 )
    self.FirstWeaponImage:setTopBottom( false, true, -143, -105.5 )
    self.FirstWeaponImage:setImage( RegisterImage( "blacktransparent" ) )
	self.FirstWeaponImage:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "csgo_first_weapon" ), function ( model )
		local weaponName = Engine.GetModelValue( model )

		if weaponName then
			SetWeaponImages( self.FirstWeaponImage, model )
		end
	end )
	self:addElement( self.FirstWeaponImage )

	self.FirstWeaponAATImage = LUI.UIImage.new()
    self.FirstWeaponAATImage:setLeftRight( false, true, -51.5 - 100, -14 - 100 )
    self.FirstWeaponAATImage:setTopBottom( false, true, -143, -105.5 )
	self.FirstWeaponAATImage:setImage( RegisterImage( "blacktransparent" ) )
	self.FirstWeaponAATImage:setScale( 0.5 )
	self.FirstWeaponAATImage:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "csgo_first_weapon_aat" ), function ( model )
		local aatName = Engine.GetModelValue( model )

		if aatName then
			SetAATImages( self.FirstWeaponAATImage, model )
		end
	end )
	self:addElement( self.FirstWeaponAATImage )

	self.SecondWeaponPrompt = LUI.UIText.new()
	self.SecondWeaponPrompt:setLeftRight( false, true, 0, -4 )
	self.SecondWeaponPrompt:setTopBottom( false, true, -140.5 - 56, -128 - 56 )
	self.SecondWeaponPrompt:setText( Engine.Localize( "" ) )
	self.SecondWeaponPrompt:setTTF( "fonts/stratum2bold.ttf" )
	self.SecondWeaponPrompt:setRGB( 0.9, 0.9, 0.9 )
	self.SecondWeaponPrompt:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	self.SecondWeaponPrompt:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "csgo_second_weapon" ), function ( model )
		local weaponName = Engine.GetModelValue( model )

		if weaponName then
			if weaponName == "none" then
				self.SecondWeaponPrompt:setText( Engine.Localize( "" ) )
			else
				self.SecondWeaponPrompt:setText( Engine.Localize( "2nd" ) )
			end
		end
	end )
	self:addElement( self.SecondWeaponPrompt )

	self.SecondWeaponUpgradeImage = CoD.ZmFx_Spark2.new( menu, controller )
	self.SecondWeaponUpgradeImage:setLeftRight( false, true, -115.5, -14 )
	self.SecondWeaponUpgradeImage:setTopBottom( false, true, -143 - 56, -105.5 - 56 )
    self.SecondWeaponUpgradeImage:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self.SecondWeaponUpgradeImage:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "csgo_second_weapon" ), function ( model )
		local weaponName = Engine.GetModelValue( model )

		if weaponName then
			SetWeaponUpgradeImages( self.SecondWeaponUpgradeImage, model )
		end
	end )
	self:addElement( self.SecondWeaponUpgradeImage )

	self.SecondWeaponImage = LUI.UIImage.new()
	self.SecondWeaponImage:setLeftRight( false, true, -115.5, -14 )
	self.SecondWeaponImage:setTopBottom( false, true, -143 - 56, -105.5 - 56 )
	self.SecondWeaponImage:setImage( RegisterImage( "blacktransparent" ) )
	self.SecondWeaponImage:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "csgo_second_weapon" ), function ( model )
		local weaponName = Engine.GetModelValue( model )

		if weaponName then
			SetWeaponImages( self.SecondWeaponImage, model )
		end
	end )
	self:addElement( self.SecondWeaponImage )

	self.SecondWeaponAATImage = LUI.UIImage.new()
	self.SecondWeaponAATImage:setLeftRight( false, true, -51.5 - 100, -14 - 100 )
	self.SecondWeaponAATImage:setTopBottom( false, true, -143 - 56, -105.5 - 56 )
	self.SecondWeaponAATImage:setImage( RegisterImage( "blacktransparent" ) )
	self.SecondWeaponAATImage:setScale( 0.5 )
	self.SecondWeaponAATImage:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "csgo_second_weapon_aat" ), function ( model )
		local aatName = Engine.GetModelValue( model )

		if aatName then
			SetAATImages( self.SecondWeaponAATImage, model )
		end
	end )
	self:addElement( self.SecondWeaponAATImage )

	self.ThirdWeaponPrompt = LUI.UIText.new()
	self.ThirdWeaponPrompt:setLeftRight( false, true, 0, -4 )
	self.ThirdWeaponPrompt:setTopBottom( false, true, -140.5 - 56 - 56, -128 - 56 - 56 )
	self.ThirdWeaponPrompt:setText( Engine.Localize( "" ) )
	self.ThirdWeaponPrompt:setTTF( "fonts/stratum2bold.ttf" )
	self.ThirdWeaponPrompt:setRGB( 0.9, 0.9, 0.9 )
	self.ThirdWeaponPrompt:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	self.ThirdWeaponPrompt:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "csgo_third_weapon" ), function ( model )
		local weaponName = Engine.GetModelValue( model )

		if weaponName then
			if weaponName == "none" then
				self.ThirdWeaponPrompt:setText( Engine.Localize( "" ) )
			else
				self.ThirdWeaponPrompt:setText( Engine.Localize( "3rd" ) )
			end
		end
	end )
	self:addElement( self.ThirdWeaponPrompt )

	self.ThirdWeaponUpgradeImage = CoD.ZmFx_Spark2.new( menu, controller )
	self.ThirdWeaponUpgradeImage:setLeftRight( false, true, -115.5, -14 )
	self.ThirdWeaponUpgradeImage:setTopBottom( false, true, -143 - 56 - 56, -105.5 - 56 - 56 )
    self.ThirdWeaponUpgradeImage:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self.ThirdWeaponUpgradeImage:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "csgo_third_weapon" ), function ( model )
		local weaponName = Engine.GetModelValue( model )

		if weaponName then
			SetWeaponUpgradeImages( self.ThirdWeaponUpgradeImage, model )
		end
	end )
	self:addElement( self.ThirdWeaponUpgradeImage )

	self.ThirdWeaponImage = LUI.UIImage.new()
	self.ThirdWeaponImage:setLeftRight( false, true, -115.5, -14 )
	self.ThirdWeaponImage:setTopBottom( false, true, -143 - 56 - 56, -105.5 - 56 - 56 )
	self.ThirdWeaponImage:setImage( RegisterImage( "blacktransparent" ) )
	self.ThirdWeaponImage:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "csgo_third_weapon" ), function ( model )
		local weaponName = Engine.GetModelValue( model )

		if weaponName then
			SetWeaponImages( self.ThirdWeaponImage, model )
		end
	end )
	self:addElement( self.ThirdWeaponImage )

	self.ThirdWeaponAATImage = LUI.UIImage.new()
	self.ThirdWeaponAATImage:setLeftRight( false, true, -51.5 - 100, -14 - 100 )
	self.ThirdWeaponAATImage:setTopBottom( false, true, -143 - 56 - 56, -105.5 - 56 - 56 )
	self.ThirdWeaponAATImage:setImage( RegisterImage( "blacktransparent" ) )
	self.ThirdWeaponAATImage:setScale( 0.5 )
	self.ThirdWeaponAATImage:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "csgo_third_weapon_aat" ), function ( model )
		local aatName = Engine.GetModelValue( model )

		if aatName then
			SetAATImages( self.ThirdWeaponAATImage, model )
		end
	end )
	self:addElement( self.ThirdWeaponAATImage )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BGBWidget:close()
		element.LethalCountText:close()
		element.LethalImage:close()
		element.TacticalCountText:close()
		element.TacticalImage:close()
		element.DpadIconMineCountText:close()
		element.DpadIconMineImage:close()
		element.CurrentWeaponBG:close()
		element.FirstWeaponPrompt:close()
		element.FirstWeaponUpgradeImage:close()
		element.FirstWeaponImage:close()
		element.FirstWeaponAATImage:close()
		element.SecondWeaponPrompt:close()
		element.SecondWeaponUpgradeImage:close()
		element.SecondWeaponImage:close()
		element.SecondWeaponAATImage:close()
		element.ThirdWeaponPrompt:close()
		element.ThirdWeaponUpgradeImage:close()
		element.ThirdWeaponImage:close()
		element.ThirdWeaponAATImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
