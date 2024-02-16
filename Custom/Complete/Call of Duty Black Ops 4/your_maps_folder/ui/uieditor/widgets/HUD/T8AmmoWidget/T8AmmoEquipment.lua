CoD.T8AmmoEquipment = InheritFrom( LUI.UIElement )
CoD.T8AmmoEquipment.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.T8AmmoEquipment )
	self.id = "T8AmmoEquipment"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true

	self.LethalBG = LUI.UIImage.new()
	self.LethalBG:setLeftRight( false, true, -306, -252.5 )
	self.LethalBG:setTopBottom( false, true, -85.5, -32 )
	self.LethalBG:setImage( RegisterImage( "t8_hud_hero_weapon_bg" ) )
	self:addElement( self.LethalBG )

	self.LethalImage = LUI.UIImage.new()
	self.LethalImage:setLeftRight( false, true, -306, -252.5 )
	self.LethalImage:setTopBottom( false, true, -85.5, -32 )
	self.LethalImage:setImage( RegisterImage( "blacktransparent" ) )
	self.LethalImage:setScale( 0.6 )
	self.LethalImage:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentPrimaryOffhand.primaryOffhand" ), function ( model )
		local primaryOffhand = Engine.GetModelValue( model )

		if primaryOffhand then
			if primaryOffhand == "uie_t7_zm_hud_inv_icnlthl" then
				self.LethalImage:setImage( RegisterImage( "t7_hud_icon_menu_frag" ) )

			elseif primaryOffhand == "uie_t7_zm_hud_inv_widowswine" then
				self.LethalImage:setImage( RegisterImage( "t7_hud_icon_menu_zmb_semtex" ) )

			else
				self.LethalImage:setImage( RegisterImage( primaryOffhand ) )
			end
		end
	end )
	self:addElement( self.LethalImage )

	self.LethalPromptBG = LUI.UIImage.new()
	self.LethalPromptBG:setLeftRight( false, true, -298, -261 )
	self.LethalPromptBG:setTopBottom( false, true, -107, -90.5 )
	self.LethalPromptBG:setRGB( 0.11, 0.11, 0.11 )
	self.LethalPromptBG:setAlpha( 0.88 )
	self:addElement( self.LethalPromptBG )

	self.LethalPromptLED = LUI.UIImage.new()
	self.LethalPromptLED:setLeftRight( false, true, -298, -261 )
	self.LethalPromptLED:setTopBottom( false, true, -107, -90.5 )
	self.LethalPromptLED:setImage( RegisterImage( "t8_hud_abilityled" ) )
	self.LethalPromptLED:setRGB( 0.11, 0.11, 0.11 )
	self.LethalPromptLED:setAlpha( 0.88 )
	self:addElement( self.LethalPromptLED )

	self.LethalPromptFrame = LUI.UIImage.new()
	self.LethalPromptFrame:setLeftRight( false, true, -303, -256 )
	self.LethalPromptFrame:setTopBottom( false, true, -112, -85.5 )
	self.LethalPromptFrame:setImage( RegisterImage( "t8_hud_abilityframe" ) )
	self.LethalPromptFrame:setRGB( 0.11, 0.11, 0.11 )
	self.LethalPromptFrame:setAlpha( 0.88 )
	self:addElement( self.LethalPromptFrame )

	self.LethalPromptText = LUI.UIText.new()
	self.LethalPromptText:setLeftRight( false, true, -353, -206 )
	self.LethalPromptText:setTopBottom( false, true, -107, -89.5 )
	self.LethalPromptText:setTTF( "fonts/ttmussels_demibold.ttf" )
	self.LethalPromptText:setScale( 0.8 )
	self.LethalPromptText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self:addElement( self.LethalPromptText )

	self.LethalPromptTimer = LUI.UITimer.newElementTimer( 0, false, function ( timerEvent )
		if Engine.LastInput_Gamepad() then
			self.LethalPromptText:setScale( 0.5 )

			self.LethalPromptText:setText( Engine.Localize( "[{+frag}]" ) )
		else
			self.LethalPromptText:setScale( 0.8 )

			self.LethalPromptText:setText( Engine.Localize( "[{+frag}]" ) )

			if string.match( Engine.GetKeyBindingLocalizedString( controller, "+frag" ), "UNBOUND" ) then
				self.LethalPromptText:setText( Engine.Localize( "" ) )
			end
				
			if string.match( Engine.GetKeyBindingLocalizedString( controller, "+frag" ), "%s" ) then
				if string.len( Engine.GetKeyBindingLocalizedString( controller, "+frag" ):match("^(.-)%s") ) > 1 then
					if string.len( Engine.GetKeyBindingLocalizedString( controller, "+frag" ):reverse():match("^(.-)%s") ) > 1 then
						-- At this point we'll just set it to nothing
						self.LethalPromptText:setText( Engine.Localize( "" ) )
					else
						self.LethalPromptText:setText( Engine.Localize( Engine.GetKeyBindingLocalizedString( controller, "+frag" ):reverse():match("^(.-)%s") ) )
					end
				else
					self.LethalPromptText:setText( Engine.Localize( Engine.GetKeyBindingLocalizedString( controller, "+frag" ):match("^(.-)%s") ) )
				end
			end
		end
	end )
	self:addElement( self.LethalPromptTimer )

	self.LethalCountBG = LUI.UIImage.new()
	self.LethalCountBG:setLeftRight( false, true, -279.5, -259 )
	self.LethalCountBG:setTopBottom( false, true, -50.5, -38 )
	self.LethalCountBG:setImage( RegisterImage( "$white" ) )
	self.LethalCountBG:setRGB( 0, 0, 0 )
	self.LethalCountBG:setAlpha( 0.88 )
	self:addElement( self.LethalCountBG )

	self.LethalCountText = LUI.UIText.new()
	self.LethalCountText:setLeftRight( false, true, -279.5, -259 )
	self.LethalCountText:setTopBottom( false, true, -50.5, -38 )
	self.LethalCountText:setText( Engine.Localize( "0" ) )
	self.LethalCountText:setTTF( "fonts/0arame_mono_stencil.ttf" )
	self.LethalCountText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self.LethalCountText:setScale( 0.66 )
	self.LethalCountText:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentPrimaryOffhand.primaryOffhandCount" ), function ( model )
		local primaryOffhandCount = Engine.GetModelValue( model )

		if primaryOffhandCount then
			self.LethalCountText:setText( Engine.Localize( primaryOffhandCount ) )
		end
	end )
	self:addElement( self.LethalCountText )

	self.TacticalBG = LUI.UIImage.new()
	self.TacticalBG:setLeftRight( false, true, -359, -305.5 )
	self.TacticalBG:setTopBottom( false, true, -85.5, -32 )
	self.TacticalBG:setImage( RegisterImage( "t8_hud_hero_weapon_bg" ) )
	self:addElement( self.TacticalBG )

	self.TacticalImage = LUI.UIImage.new()
	self.TacticalImage:setLeftRight( false, true, -359, -305.5 )
	self.TacticalImage:setTopBottom( false, true, -85.5, -32 )
	self.TacticalImage:setImage( RegisterImage( "blacktransparent" ) )
	self.TacticalImage:setScale( 0.6 )
	self.TacticalImage:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentSecondaryOffhand.secondaryOffhand" ), function ( model )
		local secondaryOffhand = Engine.GetModelValue( model )

		if secondaryOffhand then
			if secondaryOffhand == "hud_cymbal_monkey_bo3" then
				self.TacticalImage:setImage( RegisterImage( "ui_icon_inventory_cymbal_monkey" ) )
			else
				self.TacticalImage:setImage( RegisterImage( secondaryOffhand ) )
			end
		end
	end )
	self:addElement( self.TacticalImage )

	self.TacticalPromptBG = LUI.UIImage.new()
	self.TacticalPromptBG:setLeftRight( false, true, -350.5, -313.5 )
	self.TacticalPromptBG:setTopBottom( false, true, -107, -90.5 )
	self.TacticalPromptBG:setRGB( 0.11, 0.11, 0.11 )
	self.TacticalPromptBG:setAlpha( 0.88 )
	self:addElement( self.TacticalPromptBG )

	self.TacticalPromptLED = LUI.UIImage.new()
	self.TacticalPromptLED:setLeftRight( false, true, -350.5, -313.5 )
	self.TacticalPromptLED:setTopBottom( false, true, -107, -90.5 )
	self.TacticalPromptLED:setImage( RegisterImage( "t8_hud_abilityled" ) )
	self.TacticalPromptLED:setRGB( 0.11, 0.11, 0.11 )
	self.TacticalPromptLED:setAlpha( 0.88 )
	self:addElement( self.TacticalPromptLED )

	self.TacticalPromptFrame = LUI.UIImage.new()
	self.TacticalPromptFrame:setLeftRight( false, true, -355.5, -308.5 )
	self.TacticalPromptFrame:setTopBottom( false, true, -112, -85.5 )
	self.TacticalPromptFrame:setImage( RegisterImage( "t8_hud_abilityframe" ) )
	self.TacticalPromptFrame:setRGB( 0.11, 0.11, 0.11 )
	self.TacticalPromptFrame:setAlpha( 0.88 )
	self:addElement( self.TacticalPromptFrame )

	self.TacticalPromptText = LUI.UIText.new()
	self.TacticalPromptText:setLeftRight( false, true, -405.5, -258.5 )
	self.TacticalPromptText:setTopBottom( false, true, -107, -89.5 )
	self.TacticalPromptText:setTTF( "fonts/ttmussels_demibold.ttf" )
	self.TacticalPromptText:setScale( 0.8 )
	self.TacticalPromptText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self:addElement( self.TacticalPromptText )

	self.TacticalPromptTimer = LUI.UITimer.newElementTimer( 0, false, function ( timerEvent )
		if Engine.LastInput_Gamepad() then
			self.TacticalPromptText:setScale( 0.5 )

			self.TacticalPromptText:setText( Engine.Localize( "[{+smoke}]" ) )
		else
			self.TacticalPromptText:setScale( 0.8 )

			self.TacticalPromptText:setText( Engine.Localize( "[{+smoke}]" ) )

			if string.match( Engine.GetKeyBindingLocalizedString( controller, "+smoke" ), "UNBOUND" ) then
				self.TacticalPromptText:setText( Engine.Localize( "" ) )
			end
				
			if string.match( Engine.GetKeyBindingLocalizedString( controller, "+smoke" ), "%s" ) then
				if string.len( Engine.GetKeyBindingLocalizedString( controller, "+smoke" ):match("^(.-)%s") ) > 1 then
					if string.len( Engine.GetKeyBindingLocalizedString( controller, "+smoke" ):reverse():match("^(.-)%s") ) > 1 then
						-- At this point we'll just set it to nothing
						self.TacticalPromptText:setText( Engine.Localize( "" ) )
					else
						self.TacticalPromptText:setText( Engine.Localize( Engine.GetKeyBindingLocalizedString( controller, "+smoke" ):reverse():match("^(.-)%s") ) )
					end
				else
					self.TacticalPromptText:setText( Engine.Localize( Engine.GetKeyBindingLocalizedString( controller, "+smoke" ):match("^(.-)%s") ) )
				end
			end
		end
	end )
	self:addElement( self.TacticalPromptTimer )

	self.TacticalCountBG = LUI.UIImage.new()
	self.TacticalCountBG:setLeftRight( false, true, -332.5, -312 )
	self.TacticalCountBG:setTopBottom( false, true, -50.5, -38 )
	self.TacticalCountBG:setImage( RegisterImage( "$white" ) )
	self.TacticalCountBG:setRGB( 0, 0, 0 )
	self.TacticalCountBG:setAlpha( 0.88 )
	self:addElement( self.TacticalCountBG )

	self.TacticalCountText = LUI.UIText.new()
	self.TacticalCountText:setLeftRight( false, true, -332.5, -312 )
	self.TacticalCountText:setTopBottom( false, true, -50.5, -38 )
	self.TacticalCountText:setText( Engine.Localize( "0" ) )
	self.TacticalCountText:setTTF( "fonts/0arame_mono_stencil.ttf" )
	self.TacticalCountText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self.TacticalCountText:setScale( 0.66 )
	self.TacticalCountText:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentSecondaryOffhand.secondaryOffhandCount" ), function ( model )
		local secondaryOffhandCount = Engine.GetModelValue( model )

		if secondaryOffhandCount then
			self.TacticalCountText:setText( Engine.Localize( secondaryOffhandCount ) )
		end
	end )
	self:addElement( self.TacticalCountText )

	self.SpecialBG = LUI.UIImage.new()
	self.SpecialBG:setLeftRight( false, true, -412, -358.5 )
	self.SpecialBG:setTopBottom( false, true, -85.5, -32 )
	self.SpecialBG:setImage( RegisterImage( "t8_hud_hero_weapon_bg" ) )
	self:addElement( self.SpecialBG )

	self.SpecialImage = LUI.UIImage.new()
	self.SpecialImage:setLeftRight( false, true, -412, -358.5 )
	self.SpecialImage:setTopBottom( false, true, -85.5, -32 )
	self.SpecialImage:setImage( RegisterImage( "ui_icon_zm_calling_tasks_specialweapon" ) )
	self.SpecialImage:setScale( 0.5 )
	self:addElement( self.SpecialImage )

	self.SpecialPromptBG = LUI.UIImage.new()
	self.SpecialPromptBG:setLeftRight( false, true, -403, -366 )
	self.SpecialPromptBG:setTopBottom( false, true, -107, -90.5 )
	self.SpecialPromptBG:setRGB( 0.11, 0.11, 0.11 )
	self.SpecialPromptBG:setAlpha( 0.88 )
	self:addElement( self.SpecialPromptBG )

	self.SpecialPromptLED = LUI.UIImage.new()
	self.SpecialPromptLED:setLeftRight( false, true, -403, -366 )
	self.SpecialPromptLED:setTopBottom( false, true, -107, -90.5 )
	self.SpecialPromptLED:setImage( RegisterImage( "t8_hud_abilityled" ) )
	self.SpecialPromptLED:setRGB( 0.11, 0.11, 0.11 )
	self.SpecialPromptLED:setAlpha( 0.88 )
	self:addElement( self.SpecialPromptLED )

	self.SpecialPromptFrame = LUI.UIImage.new()
	self.SpecialPromptFrame:setLeftRight( false, true, -408, -361 )
	self.SpecialPromptFrame:setTopBottom( false, true, -112, -85.5 )
	self.SpecialPromptFrame:setImage( RegisterImage( "t8_hud_abilityframe" ) )
	self.SpecialPromptFrame:setRGB( 0.11, 0.11, 0.11 )
	self.SpecialPromptFrame:setAlpha( 0.88 )
	self:addElement( self.SpecialPromptFrame )

	self.SpecialPromptText = LUI.UIText.new()
	self.SpecialPromptText:setLeftRight( false, true, -458, -311 )
	self.SpecialPromptText:setTopBottom( false, true, -107, -89.5 )
	self.SpecialPromptText:setTTF( "fonts/ttmussels_demibold.ttf" )
	self.SpecialPromptText:setScale( 0.8 )
	self.SpecialPromptText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self:addElement( self.SpecialPromptText )

	self.SpecialPromptTimer = LUI.UITimer.newElementTimer( 0, false, function ( timerEvent )
		if Engine.LastInput_Gamepad() then
			self.SpecialPromptText:setScale( 0.5 )

			self.SpecialPromptText:setText( Engine.Localize( "[{+smoke}] + [{+frag}]" ) )
		else
			self.SpecialPromptText:setScale( 0.8 )

			self.SpecialPromptText:setText( Engine.Localize( "[{+weaphero}]" ) )

			if string.match( Engine.GetKeyBindingLocalizedString( controller, "+weaphero" ), "UNBOUND" ) then
				self.SpecialPromptText:setText( Engine.Localize( "" ) )
			end
				
			if string.match( Engine.GetKeyBindingLocalizedString( controller, "+weaphero" ), "%s" ) then
				if string.len( Engine.GetKeyBindingLocalizedString( controller, "+weaphero" ):match("^(.-)%s") ) > 1 then
					if string.len( Engine.GetKeyBindingLocalizedString( controller, "+weaphero" ):reverse():match("^(.-)%s") ) > 1 then
						-- At this point we'll just set it to nothing
						self.SpecialPromptText:setText( Engine.Localize( "" ) )
					else
						self.SpecialPromptText:setText( Engine.Localize( Engine.GetKeyBindingLocalizedString( controller, "+weaphero" ):reverse():match("^(.-)%s") ) )
					end
				else
					self.SpecialPromptText:setText( Engine.Localize( Engine.GetKeyBindingLocalizedString( controller, "+weaphero" ):match("^(.-)%s") ) )
				end
			end
		end
	end )
	self:addElement( self.SpecialPromptTimer )

	self.SpecialMeterBG = LUI.UIImage.new()
	self.SpecialMeterBG:setLeftRight( false, true, -416, -354.5 )
	self.SpecialMeterBG:setTopBottom( false, true, -94.5, -68 )
	self.SpecialMeterBG:setImage( RegisterImage( "t8_hud_hero_weapon_progress_bg" ) )
	self:addElement( self.SpecialMeterBG )

	self.SpecialMeter = LUI.UIImage.new()
	self.SpecialMeter:setLeftRight( false, true, -416, -354.5 )
	self.SpecialMeter:setTopBottom( false, true, -92.5, -29 )
	self.SpecialMeter:setImage( RegisterImage( "t8_hud_hero_weapon_progress" ) )
	self.SpecialMeter:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	self.SpecialMeter:setZRot( 90 )
	self.SpecialMeter:setShaderVector( 0, 0.5, 0, 0, 0 )
	self.SpecialMeter:setShaderVector( 1, 0.75, 0, 0, 0 )
	self.SpecialMeter:setShaderVector( 2, 0.5, 0, 0, 0 )
	self.SpecialMeter:setShaderVector( 3, 0.075, 0, 0, 0 )
	self.SpecialMeter:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmhud.swordEnergy" ), function ( model )
		local swordEnergy = Engine.GetModelValue( model )

		if swordEnergy then
			self.SpecialMeter:setShaderVector( 0, AdjustStartEnd( 0, 0.5,
				CoD.GetVectorComponentFromString( swordEnergy, 1 ),
				CoD.GetVectorComponentFromString( swordEnergy, 2 ),
				CoD.GetVectorComponentFromString( swordEnergy, 3 ),
				CoD.GetVectorComponentFromString( swordEnergy, 4 ) ) )
		end
	end )
	self:addElement( self.SpecialMeter )

	self.SpecialCountBG = LUI.UIImage.new()
	self.SpecialCountBG:setLeftRight( false, true, -385.5, -365 )
	self.SpecialCountBG:setTopBottom( false, true, -50.5, -38 )
	self.SpecialCountBG:setImage( RegisterImage( "$white" ) )
	self.SpecialCountBG:setRGB( 0, 0, 0 )
	self.SpecialCountBG:setAlpha( 0.88 )
	self:addElement( self.SpecialCountBG )

	self.SpecialCountText = LUI.UIText.new()
	self.SpecialCountText:setLeftRight( false, true, -385.5, -365 )
	self.SpecialCountText:setTopBottom( false, true, -50.5, -38 )
	self.SpecialCountText:setText( Engine.Localize( "0" ) )
	self.SpecialCountText:setTTF( "fonts/0arame_mono_stencil.ttf" )
	self.SpecialCountText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self.SpecialCountText:setScale( 0.66 )
	self.SpecialCountText:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmhud.swordEnergy" ), function ( model )
		local swordEnergy = Engine.GetModelValue( model )

		if swordEnergy then
			if swordEnergy < 1 then
				self.SpecialCountText:setText( Engine.Localize( "0" ) )
			else
				self.SpecialCountText:setText( Engine.Localize( "1" ) )
			end
		end
	end )
	self:addElement( self.SpecialCountText )

	self.DpadIconMine = LUI.UIImage.new()
	self.DpadIconMine:setLeftRight( false, true, -239.5, -213.5 )
	self.DpadIconMine:setTopBottom( false, true, -122, -96 )
	self.DpadIconMine:setImage( RegisterImage( "blacktransparent" ) )
	self.DpadIconMine:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.actionSlot3ammo" ), function ( model )
		local actionSlot3ammo = Engine.GetModelValue( model )

		if actionSlot3ammo then
			if actionSlot3ammo > 0 then
				self.DpadIconMine:setImage( RegisterImage( "t7_hud_icon_menu_bouncebetty" ) )
			else
				self.DpadIconMine:setImage( RegisterImage( "blacktransparent" ) )
			end
		end
	end )
	self:addElement( self.DpadIconMine )

	self.DpadIconMineCountTextGlow = LUI.UIImage.new()
	self.DpadIconMineCountTextGlow:setLeftRight( false, true, -225, -208 )
	self.DpadIconMineCountTextGlow:setTopBottom( false, true, -109, -95 )
	self.DpadIconMineCountTextGlow:setImage( RegisterImage( "blacktransparent" ) )
	self.DpadIconMineCountTextGlow:setRGB( 0.1, 0.1, 0.1 )
	self.DpadIconMineCountTextGlow:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.actionSlot3ammo" ), function ( model )
		local actionSlot3ammo = Engine.GetModelValue( model )

		if actionSlot3ammo then
			if actionSlot3ammo > 0 then
				self.DpadIconMineCountTextGlow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
			else
				self.DpadIconMineCountTextGlow:setImage( RegisterImage( "blacktransparent" ) )
			end
		end
	end )
	self:addElement( self.DpadIconMineCountTextGlow )

	self.DpadIconMineCountText = LUI.UIText.new()
	self.DpadIconMineCountText:setLeftRight( false, true, -239.5, -213.5 )
	self.DpadIconMineCountText:setTopBottom( false, true, -114, -93 )
	self.DpadIconMineCountText:setText( Engine.Localize( "" ) )
	self.DpadIconMineCountText:setTTF( "fonts/dinnext_regular.ttf" )
	self.DpadIconMineCountText:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.actionSlot3ammo" ), function ( model )
		local actionSlot3ammo = Engine.GetModelValue( model )

		if actionSlot3ammo then
			if actionSlot3ammo > 0 then
				self.DpadIconMineCountText:setText( Engine.Localize( actionSlot3ammo ) )
			else
				self.DpadIconMineCountText:setText( Engine.Localize( "" ) )
			end
		end
	end )
	self:addElement( self.DpadIconMineCountText )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LethalBG:close()
		element.LethalImage:close()
		element.LethalPromptBG:close()
		element.LethalPromptLED:close()
		element.LethalPromptFrame:close()
		element.LethalPromptText:close()
		element.LethalPromptTimer:close()
		element.LethalCountBG:close()
		element.LethalCountText:close()
		element.TacticalBG:close()
		element.TacticalImage:close()
		element.TacticalPromptBG:close()
		element.TacticalPromptLED:close()
		element.TacticalPromptFrame:close()
		element.TacticalPromptText:close()
		element.TacticalPromptTimer:close()
		element.TacticalCountBG:close()
		element.TacticalCountText:close()
		element.SpecialBG:close()
		element.SpecialImage:close()
		element.SpecialPromptBG:close()
		element.SpecialPromptLED:close()
		element.SpecialPromptFrame:close()
		element.SpecialPromptText:close()
		element.SpecialPromptTimer:close()
		element.SpecialMeterBG:close()
		element.SpecialMeter:close()
		element.SpecialCountBG:close()
		element.SpecialCountText:close()
		element.DpadIconMine:close()
		element.DpadIconMineCountTextGlow:close()
		element.DpadIconMineCountText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
