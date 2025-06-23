CoD.T4AmmoEquipment = InheritFrom( LUI.UIElement )
CoD.T4AmmoEquipment.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.T4AmmoEquipment )
	self.id = "T4AmmoEquipment"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true

	self.Lethal = LUI.UIImage.new()
	self.Lethal:setLeftRight( false, true, -156, -120 )
	self.Lethal:setTopBottom( false, true, -58, -21 )
	self.Lethal:setImage( RegisterImage( "blacktransparent" ) )
	self.Lethal:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentPrimaryOffhand.primaryOffhand" ), function ( model )
		local primaryOffhand = Engine.GetModelValue( model )

		if primaryOffhand then
			if primaryOffhand == "uie_t7_zm_hud_inv_icnlthl" then
				self.Lethal:setImage( RegisterImage( "t4_hud_us_grenade" ) )

			elseif primaryOffhand == "uie_t7_zm_hud_inv_widowswine" then
				self.Lethal:setImage( RegisterImage( "t4_hud_us_grenade" ) )

			else
				self.Lethal:setImage( RegisterImage( primaryOffhand ) )
			end
		end
	end )
	self:addElement( self.Lethal )

	self.LethalCountShadow = LUI.UIText.new()
    self.LethalCountShadow:setLeftRight( true, true, 1113 + 0.5, 0 + 0.5 )
    self.LethalCountShadow:setTopBottom( false, true, -46 + 0.5, -2 + 0.5 )
	self.LethalCountShadow:setText( Engine.Localize( "" ) )
    self.LethalCountShadow:setTTF( "fonts/itc_legacy_sans_bold.ttf" )
	self.LethalCountShadow:setRGB( 0, 0, 0 )
	self.LethalCountShadow:setScale( 0.5 )
	self.LethalCountShadow:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self.LethalCountShadow:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentPrimaryOffhand.primaryOffhandCount" ), function ( model )
		local primaryOffhandCount = Engine.GetModelValue( model )

		if primaryOffhandCount then
			if primaryOffhandCount == 0 then
				self.LethalCountShadow:setText( Engine.Localize( "" ) )
			else
				self.LethalCountShadow:setText( Engine.Localize( primaryOffhandCount ) )
			end
		end
	end )
	self:addElement( self.LethalCountShadow )

	self.LethalCount = LUI.UIText.new()
    self.LethalCount:setLeftRight( true, true, 1113, 0 )
    self.LethalCount:setTopBottom( false, true, -46, -2 )
	self.LethalCount:setText( Engine.Localize( "" ) )
    self.LethalCount:setTTF( "fonts/itc_legacy_sans_bold.ttf" )
	self.LethalCount:setScale( 0.5 )
	self.LethalCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self.LethalCount:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentPrimaryOffhand.primaryOffhandCount" ), function ( model )
		local primaryOffhandCount = Engine.GetModelValue( model )

		if primaryOffhandCount then
			if primaryOffhandCount == 0 then
				self.LethalCount:setText( Engine.Localize( "" ) )
			else
				self.LethalCount:setText( Engine.Localize( primaryOffhandCount ) )
			end
		end
	end )
	self:addElement( self.LethalCount )

	self.Tactical = LUI.UIImage.new()
	self.Tactical:setLeftRight( false, true, -201, -165 )
	self.Tactical:setTopBottom( false, true, -58, -21 )
	self.Tactical:setImage( RegisterImage( "blacktransparent" ) )
	self.Tactical:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentSecondaryOffhand.secondaryOffhand" ), function ( model )
		local secondaryOffhand = Engine.GetModelValue( model )

		if secondaryOffhand then
			if secondaryOffhand == "hud_cymbal_monkey_bo3" then
				self.Tactical:setImage( RegisterImage( "t4_hud_monkey" ) )
			else
				self.Tactical:setImage( RegisterImage( secondaryOffhand ) )
			end
		end
	end )
	self:addElement( self.Tactical )

	self.TacticalCountShadow = LUI.UIText.new()
    self.TacticalCountShadow:setLeftRight( true, true, 1053 + 0.5, 0 + 0.5 )
    self.TacticalCountShadow:setTopBottom( false, true, -46 + 0.5, -2 + 0.5 )
	self.TacticalCountShadow:setText( Engine.Localize( "" ) )
    self.TacticalCountShadow:setTTF( "fonts/itc_legacy_sans_bold.ttf" )
	self.TacticalCountShadow:setRGB( 0, 0, 0 )
	self.TacticalCountShadow:setScale( 0.5 )
	self.TacticalCountShadow:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self.TacticalCountShadow:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentSecondaryOffhand.secondaryOffhandCount" ), function ( model )
		local secondaryOffhandCount = Engine.GetModelValue( model )

		if secondaryOffhandCount then
			if secondaryOffhandCount == 0 then
				self.TacticalCountShadow:setText( Engine.Localize( "" ) )
			else
				self.TacticalCountShadow:setText( Engine.Localize( secondaryOffhandCount ) )
			end
		end
	end )
	self:addElement( self.TacticalCountShadow )

	self.TacticalCount = LUI.UIText.new()
    self.TacticalCount:setLeftRight( true, true, 1053, 0 )
    self.TacticalCount:setTopBottom( false, true, -46, -2 )
	self.TacticalCount:setText( Engine.Localize( "" ) )
    self.TacticalCount:setTTF( "fonts/itc_legacy_sans_bold.ttf" )
	self.TacticalCount:setScale( 0.5 )
	self.TacticalCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self.TacticalCount:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentSecondaryOffhand.secondaryOffhandCount" ), function ( model )
		local secondaryOffhandCount = Engine.GetModelValue( model )

		if secondaryOffhandCount then
			if secondaryOffhandCount == 0 then
				self.TacticalCount:setText( Engine.Localize( "" ) )
			else
				self.TacticalCount:setText( Engine.Localize( secondaryOffhandCount ) )
			end
		end
	end )
	self:addElement( self.TacticalCount )

	self.Mine = LUI.UIImage.new()
	self.Mine:setLeftRight( false, true, -246, -210 )
	self.Mine:setTopBottom( false, true, -58, -21 )
	self.Mine:setImage( RegisterImage( "blacktransparent" ) )
	self.Mine:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.actionSlot3ammo" ), function ( model )
		local actionSlot3ammo = Engine.GetModelValue( model )

		if actionSlot3ammo then
			if actionSlot3ammo > 0 then
				self.Mine:setImage( RegisterImage( "t7_hud_icon_menu_bouncebetty" ) )
			else
				self.Mine:setImage( RegisterImage( "blacktransparent" ) )
			end
		end
	end )
	self:addElement( self.Mine )

	self.MineCountShadow = LUI.UIText.new()
    self.MineCountShadow:setLeftRight( true, true, 1008 + 0.5, -44 + 0.5 )
    self.MineCountShadow:setTopBottom( false, true, -46 + 0.5, -2 + 0.5 )
	self.MineCountShadow:setText( Engine.Localize( "" ) )
    self.MineCountShadow:setTTF( "fonts/itc_legacy_sans_bold.ttf" )
	self.MineCountShadow:setRGB( 0, 0, 0 )
	self.MineCountShadow:setScale( 0.5 )
	self.MineCountShadow:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self.MineCountShadow:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.actionSlot3ammo" ), function ( model )
		local actionSlot3ammo = Engine.GetModelValue( model )

		if actionSlot3ammo then
			if actionSlot3ammo > 0 then
				self.MineCountShadow:setText( Engine.Localize( actionSlot3ammo ) )
			else
				self.MineCountShadow:setText( Engine.Localize( "" ) )
			end
		end
	end )
	self:addElement( self.MineCountShadow )

	self.MineCount = LUI.UIText.new()
    self.MineCount:setLeftRight( true, true, 1008, -45 )
    self.MineCount:setTopBottom( false, true, -46, -2 )
	self.MineCount:setText( Engine.Localize( "" ) )
    self.MineCount:setTTF( "fonts/itc_legacy_sans_bold.ttf" )
	self.MineCount:setScale( 0.5 )
	self.MineCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self.MineCount:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.actionSlot3ammo" ), function ( model )
		local actionSlot3ammo = Engine.GetModelValue( model )

		if actionSlot3ammo then
			if actionSlot3ammo > 0 then
				self.MineCount:setText( Engine.Localize( actionSlot3ammo ) )
			else
				self.MineCount:setText( Engine.Localize( "" ) )
			end
		end
	end )
	self:addElement( self.MineCount )

	self.Special = LUI.UIImage.new()
	self.Special:setLeftRight( false, true, -60, -20 )
	self.Special:setTopBottom( false, true, -342, -302 )
	self.Special:setImage( RegisterImage( "blacktransparent" ) )
	self.Special:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmhud.swordEnergy" ), function ( model )
		local swordEnergy = Engine.GetModelValue( model )

		if swordEnergy then
			if swordEnergy > 0 then
				self.Special:setImage( RegisterImage( "t4_hud_special" ) )
			else
				self.Special:setImage( RegisterImage( "blacktransparent" ) )
			end
		end
	end )
	self:addElement( self.Special )

	self.SpecialMeterBG = LUI.UIImage.new()
	self.SpecialMeterBG:setLeftRight( false, true, -70, -10 )
	self.SpecialMeterBG:setTopBottom( false, true, -297, -290 )
	self.SpecialMeterBG:setImage( RegisterImage( "blacktransparent" ) )
	self.SpecialMeterBG:setRGB( 0, 0, 0 )
	self.SpecialMeterBG:setAlpha( 0.75 )
	self.SpecialMeterBG:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmhud.swordEnergy" ), function ( model )
		local swordEnergy = Engine.GetModelValue( model )

		if swordEnergy then
			if swordEnergy > 0 then
				self.SpecialMeterBG:setImage( RegisterImage( "$white" ) )
			else
				self.SpecialMeterBG:setImage( RegisterImage( "blacktransparent" ) )
			end
		end
	end )
	self:addElement( self.SpecialMeterBG )

	self.SpecialMeter = LUI.UIImage.new()
	self.SpecialMeter:setLeftRight( false, true, -68, -12 )
	self.SpecialMeter:setTopBottom( false, true, -295, -292 )
	self.SpecialMeter:setImage( RegisterImage( "blacktransparent" ) )
	self.SpecialMeter:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_normal" ) )
	self.SpecialMeter:setShaderVector( 1, 0, 0, 0, 0 )
	self.SpecialMeter:setShaderVector( 2, 1, 0, 0, 0 )
	self.SpecialMeter:setShaderVector( 3, 0, 0, 0, 0 )
	self.SpecialMeter:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmhud.swordEnergy" ), function ( model )
		local swordEnergy = Engine.GetModelValue( model )

		if swordEnergy then
			if swordEnergy > 0 then
				self.SpecialMeter:setImage( RegisterImage( "$white" ) )
			else
				self.SpecialMeter:setImage( RegisterImage( "blacktransparent" ) )
			end

			self.SpecialMeter:setShaderVector( 0,
				CoD.GetVectorComponentFromString( swordEnergy, 1 ),
				CoD.GetVectorComponentFromString( swordEnergy, 2 ),
				CoD.GetVectorComponentFromString( swordEnergy, 3 ),
				CoD.GetVectorComponentFromString( swordEnergy, 4 ) )
		end
	end )
	self:addElement( self.SpecialMeter )

	self.Shield = LUI.UIImage.new()
	self.Shield:setLeftRight( false, true, -60, -20 )
	self.Shield:setTopBottom( false, true, -272, -232 )
	self.Shield:setImage( RegisterImage( "blacktransparent" ) )
	self.Shield:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.showDpadDown" ), function ( model )
		local showDpadDown = Engine.GetModelValue( model )

		if showDpadDown then
			if showDpadDown == 1 then
				self.Shield:setImage( RegisterImage( "t4_hud_shield" ) )
			else
				self.Shield:setImage( RegisterImage( "blacktransparent" ) )
			end
		end
	end )
	self:addElement( self.Shield )

	self.ShieldMeterBG = LUI.UIImage.new()
	self.ShieldMeterBG:setLeftRight( false, true, -70, -10 )
	self.ShieldMeterBG:setTopBottom( false, true, -227, -220 )
	self.ShieldMeterBG:setImage( RegisterImage( "blacktransparent" ) )
	self.ShieldMeterBG:setRGB( 0, 0, 0 )
	self.ShieldMeterBG:setAlpha( 0.75 )
	self.ShieldMeterBG:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.showDpadDown" ), function ( model )
		local showDpadDown = Engine.GetModelValue( model )

		if showDpadDown then
			if showDpadDown == 1 then
				self.ShieldMeterBG:setImage( RegisterImage( "$white" ) )
			else
				self.ShieldMeterBG:setImage( RegisterImage( "blacktransparent" ) )
			end
		end
	end )
	self:addElement( self.ShieldMeterBG )

	self.ShieldMeter = LUI.UIImage.new()
	self.ShieldMeter:setLeftRight( false, true, -68, -12 )
	self.ShieldMeter:setTopBottom( false, true, -225, -222 )
	self.ShieldMeter:setImage( RegisterImage( "blacktransparent" ) )
	self.ShieldMeter:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_normal" ) )
	self.ShieldMeter:setShaderVector( 1, 0, 0, 0, 0 )
	self.ShieldMeter:setShaderVector( 2, 1, 0, 0, 0 )
	self.ShieldMeter:setShaderVector( 3, 0, 0, 0, 0 )
	self.ShieldMeter:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.showDpadDown" ), function ( model )
		local showDpadDown = Engine.GetModelValue( model )

		if showDpadDown then
			if showDpadDown == 1 then
				self.ShieldMeter:setImage( RegisterImage( "$white" ) )
			else
				self.ShieldMeter:setImage( RegisterImage( "blacktransparent" ) )
			end
		end
	end )
	self.ShieldMeter:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "ZMInventory.shield_health" ), function ( model )
		local shield_health = Engine.GetModelValue( model )

		if shield_health then
			self.ShieldMeter:setShaderVector( 0,
				CoD.GetVectorComponentFromString( shield_health, 1 ),
				CoD.GetVectorComponentFromString( shield_health, 2 ),
				CoD.GetVectorComponentFromString( shield_health, 3 ),
				CoD.GetVectorComponentFromString( shield_health, 4 ) )
		end
	end )
	self:addElement( self.ShieldMeter )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Lethal:close()
		element.LethalCountShadow:close()
		element.LethalCount:close()
		element.Tactical:close()
		element.TacticalCountShadow:close()
		element.TacticalCount:close()
		element.Mine:close()
		element.MineCountShadow:close()
		element.MineCount:close()
		element.Special:close()
		element.SpecialMeterBG:close()
		element.SpecialMeter:close()
		element.Shield:close()
		element.ShieldMeterBG:close()
		element.ShieldMeter:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
