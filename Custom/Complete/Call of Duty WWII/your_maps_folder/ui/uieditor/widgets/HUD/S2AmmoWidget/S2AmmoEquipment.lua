require( "ui.uieditor.widgets.HUD.ZM_FX.ZmFx_Spark2" )
require( "ui.uieditor.widgets.HUD.ZM_FX.ZmFx_Spark2Ext" )

CoD.S2AmmoEquipment = InheritFrom( LUI.UIElement )
CoD.S2AmmoEquipment.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.S2AmmoEquipment )
	self.id = "S2AmmoEquipment"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	self.LethalImage = LUI.UIImage.new()
    self.LethalImage:setLeftRight( false, true, -145, -130.5 )
    self.LethalImage:setTopBottom( false, true, -120, -105.5 )
	self.LethalImage:setImage( RegisterImage( "blacktransparent" ) )
	self.LethalImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
	self.LethalImage:setShaderVector( 0, 0, 0, 0, 0 )
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

	self.LethalCountTextShadow = LUI.UIText.new()
    self.LethalCountTextShadow:setLeftRight( false, true, -152.5, 0 )
    self.LethalCountTextShadow:setTopBottom( false, true, -124.5, -97.5 )
	self.LethalCountTextShadow:setText( Engine.Localize( "0" ) )
	self.LethalCountTextShadow:setTTF( "fonts/dinnextltpro-regular.ttf" )
	self.LethalCountTextShadow:setRGB( 0.11, 0.11, 0.11 )
	self.LethalCountTextShadow:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self.LethalCountTextShadow:setScale( 0.66 )
	self.LethalCountTextShadow:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentPrimaryOffhand.primaryOffhandCount" ), function ( model )
		local primaryOffhandCount = Engine.GetModelValue( model )

		if primaryOffhandCount then
			self.LethalCountTextShadow:setText( Engine.Localize( primaryOffhandCount ) )
		end
	end )
	self:addElement( self.LethalCountTextShadow )

	self.LethalCountText = LUI.UIText.new()
    self.LethalCountText:setLeftRight( false, true, -152, 0 )
    self.LethalCountText:setTopBottom( false, true, -125, -98 )
	self.LethalCountText:setText( Engine.Localize( "0" ) )
	self.LethalCountText:setTTF( "fonts/dinnextltpro-regular.ttf" )
	self.LethalCountText:setRGB( 0.65, 0.63, 0.57 )
	self.LethalCountText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self.LethalCountText:setScale( 0.66 )
	self.LethalCountText:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentPrimaryOffhand.primaryOffhandCount" ), function ( model )
		local primaryOffhandCount = Engine.GetModelValue( model )

		if primaryOffhandCount then
			self.LethalCountText:setText( Engine.Localize( primaryOffhandCount ) )
		end
	end )
	self:addElement( self.LethalCountText )

	self.TacticalImage = LUI.UIImage.new()
	self.TacticalImage:setLeftRight( false, true, -145, -130.5 )
	self.TacticalImage:setTopBottom( false, true, -136, -121.5 )
	self.TacticalImage:setImage( RegisterImage( "blacktransparent" ) )
	self.TacticalImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
	self.TacticalImage:setShaderVector( 0, 0, 0, 0, 0 )
	self.TacticalImage:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentSecondaryOffhand.secondaryOffhand" ), function ( model )
		local secondaryOffhand = Engine.GetModelValue( model )

		if secondaryOffhand then
			self.TacticalImage:setImage( RegisterImage( secondaryOffhand ) )
		end
	end )
	self:addElement( self.TacticalImage )

	self.TacticalCountTextShadow = LUI.UIText.new()
    self.TacticalCountTextShadow:setLeftRight( false, true, -152.5, 0 )
    self.TacticalCountTextShadow:setTopBottom( false, true, -140.5, -113.5 )
	self.TacticalCountTextShadow:setText( Engine.Localize( "0" ) )
	self.TacticalCountTextShadow:setTTF( "fonts/dinnextltpro-regular.ttf" )
	self.TacticalCountTextShadow:setRGB( 0.11, 0.11, 0.11 )
	self.TacticalCountTextShadow:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self.TacticalCountTextShadow:setScale( 0.66 )
	self.TacticalCountTextShadow:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentSecondaryOffhand.secondaryOffhandCount" ), function ( model )
		local secondaryOffhandCount = Engine.GetModelValue( model )

		if secondaryOffhandCount then
			local secondaryOffhand = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "currentSecondaryOffhand.secondaryOffhand" ) )

			if secondaryOffhand ~= nil then
				if secondaryOffhand == "blacktransparent" then
					self.TacticalCountTextShadow:setText( Engine.Localize( "" ) )
				else
					self.TacticalCountTextShadow:setText( Engine.Localize( secondaryOffhandCount ) )
				end
			end
		end
	end )
	self:addElement( self.TacticalCountTextShadow )

	self.TacticalCountText = LUI.UIText.new()
    self.TacticalCountText:setLeftRight( false, true, -152, 0 )
    self.TacticalCountText:setTopBottom( false, true, -141, -114 )
	self.TacticalCountText:setText( Engine.Localize( "0" ) )
	self.TacticalCountText:setTTF( "fonts/dinnextltpro-regular.ttf" )
	self.TacticalCountText:setRGB( 0.65, 0.63, 0.57 )
	self.TacticalCountText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self.TacticalCountText:setScale( 0.66 )
	self.TacticalCountText:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentSecondaryOffhand.secondaryOffhandCount" ), function ( model )
		local secondaryOffhandCount = Engine.GetModelValue( model )

		if secondaryOffhandCount then
			local secondaryOffhand = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "currentSecondaryOffhand.secondaryOffhand" ) )

			if secondaryOffhand ~= nil then
				if secondaryOffhand == "blacktransparent" then
					self.TacticalCountText:setText( Engine.Localize( "" ) )
				else
					self.TacticalCountText:setText( Engine.Localize( secondaryOffhandCount ) )
				end
			end
		end
	end )
	self:addElement( self.TacticalCountText )
	
	self.SpecialImageBG = CoD.ZmFx_Spark2.new( menu, controller )
	self.SpecialImageBG:setLeftRight( false, true, -94, -36.5 )
	self.SpecialImageBG:setTopBottom( false, true, -122, -64.5 )
	self.SpecialImageBG:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self.SpecialImageBG:setRGB( 0.33, 0.33, 0.33 )
	self.SpecialImageBG:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmhud.swordEnergy" ), function ( model )
		local swordEnergy = Engine.GetModelValue( model )

		if swordEnergy then
			if swordEnergy < 1 then
				self.SpecialImageBG.Image0:setImage( RegisterImage( "blacktransparent" ) )
				self.SpecialImageBG.Image00:setImage( RegisterImage( "blacktransparent" ) )
			else
				self.SpecialImageBG.Image0:setImage( RegisterImage( "uie_t7_zm_hud_rnd_spk2" ) )
				self.SpecialImageBG.Image00:setImage( RegisterImage( "uie_t7_zm_hud_rnd_spk2" ) )
			end
		end
	end )
	self:addElement( self.SpecialImageBG )

	self.SpecialImageBG2 = CoD.ZmFx_Spark2Ext.new( menu, controller )
	self.SpecialImageBG2:setLeftRight( false, true, -94, -36.5 )
	self.SpecialImageBG2:setTopBottom( false, true, -122, -64.5 )
	self.SpecialImageBG2:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self.SpecialImageBG2:setRGB( 0.33, 0.33, 0.33 )
	self.SpecialImageBG2:setYRot( 180 )
	self.SpecialImageBG2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmhud.swordEnergy" ), function ( model )
		local swordEnergy = Engine.GetModelValue( model )

		if swordEnergy then
			if swordEnergy < 1 then
				self.SpecialImageBG2.ZmFxSpark1Img0.Image00:setImage( RegisterImage( "blacktransparent" ) )
				self.SpecialImageBG2.ZmFxSpark1Img1.Image00:setImage( RegisterImage( "blacktransparent" ) )
			else
				self.SpecialImageBG2.ZmFxSpark1Img0.Image00:setImage( RegisterImage( "uie_t7_zm_hud_rnd_spkseq1" ) )
				self.SpecialImageBG2.ZmFxSpark1Img1.Image00:setImage( RegisterImage( "uie_t7_zm_hud_rnd_spkseq1" ) )
			end
		end
	end )
	self:addElement( self.SpecialImageBG2 )
	
	self.SpecialImage = LUI.UIImage.new()
	self.SpecialImage:setLeftRight( false, true, -114, -16.5 )
	self.SpecialImage:setTopBottom( false, true, -142, -44.5 )
	self.SpecialImage:setImage( RegisterImage( "zm_ability_mad_minute" ) )
	self.SpecialImage:setScale( 0.60 )
	self:addElement( self.SpecialImage )

	self.SpecialPromptTextShadow = LUI.UIText.new()
	self.SpecialPromptTextShadow:setLeftRight( false, true, -114.5, -17 )
	self.SpecialPromptTextShadow:setTopBottom( false, true, -48, -24 )
	self.SpecialPromptTextShadow:setTTF( "fonts/dinnextltpro-regular.ttf" )
	self.SpecialPromptTextShadow:setRGB( 0.11, 0.11, 0.11 )
	self.SpecialPromptTextShadow:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self.SpecialPromptTextShadow:setScale( 0.8 )
	self:addElement( self.SpecialPromptTextShadow )

	self.SpecialPromptText = LUI.UIText.new()
	self.SpecialPromptText:setLeftRight( false, true, -114, -16.5 )
	self.SpecialPromptText:setTopBottom( false, true, -48.5, -24.5 )
	self.SpecialPromptText:setTTF( "fonts/dinnextltpro-regular.ttf" )
	self.SpecialPromptText:setRGB( 0.65, 0.63, 0.57 )
	self.SpecialPromptText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self.SpecialPromptText:setScale( 0.8 )
	self.SpecialPromptText:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		local last_input = Engine.GetModelValue( model )

		if last_input then
			if last_input > 0 then
				self.SpecialPromptText:setScale( 0.8 )

				self.SpecialPromptText:setText( Engine.Localize( "[{+weaphero}]" ) )
				self.SpecialPromptTextShadow:setText( Engine.Localize( "[{+weaphero}]" ) )

				if string.match( Engine.GetKeyBindingLocalizedString( controller, "+weaphero" ), "UNBOUND" ) then
					self.SpecialPromptText:setText( Engine.Localize( "" ) )
					self.SpecialPromptTextShadow:setText( Engine.Localize( "" ) )
				end
					
				if string.match( Engine.GetKeyBindingLocalizedString( controller, "+weaphero" ), "%s" ) then
					if string.len( Engine.GetKeyBindingLocalizedString( controller, "+weaphero" ):match("^(.-)%s") ) > 1 then
						if string.len( Engine.GetKeyBindingLocalizedString( controller, "+weaphero" ):reverse():match("^(.-)%s") ) > 1 then
							-- At this point we'll just set it to nothing
							self.SpecialPromptText:setText( Engine.Localize( "" ) )
							self.SpecialPromptTextShadow:setText( Engine.Localize( "" ) )
						else
							self.SpecialPromptText:setText( Engine.Localize( Engine.GetKeyBindingLocalizedString( controller, "+weaphero" ):reverse():match("^(.-)%s") ) )
							self.SpecialPromptTextShadow:setText( Engine.Localize( Engine.GetKeyBindingLocalizedString( controller, "+weaphero" ):reverse():match("^(.-)%s") ) )
						end
					else
						self.SpecialPromptText:setText( Engine.Localize( Engine.GetKeyBindingLocalizedString( controller, "+weaphero" ):match("^(.-)%s") ) )
						self.SpecialPromptTextShadow:setText( Engine.Localize( Engine.GetKeyBindingLocalizedString( controller, "+weaphero" ):match("^(.-)%s") ) )
					end
				end
			else
				self.SpecialPromptText:setScale( 0.5 )

				self.SpecialPromptText:setText( Engine.Localize( "[{+smoke}] + [{+frag}]" ) )
				self.SpecialPromptTextShadow:setText( Engine.Localize( "" ) )
			end
		end
	end )
	self:addElement( self.SpecialPromptText )

	self.SpecialMeterBGGlow = LUI.UIImage.new()
	self.SpecialMeterBGGlow:setLeftRight( false, true, -114, -16.5 )
	self.SpecialMeterBGGlow:setTopBottom( false, true, -142, -44.5 )
	self.SpecialMeterBGGlow:setImage( RegisterImage( "blacktransparent" ) )
	self.SpecialMeterBGGlow:setRGB( 0.88, 0.77, 0.49 )
	self.SpecialMeterBGGlow:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmhud.swordEnergy" ), function ( model )
		local swordEnergy = Engine.GetModelValue( model )

		if swordEnergy then
			if swordEnergy < 1 then
				self.SpecialMeterBGGlow:setImage( RegisterImage( "blacktransparent" ) )
			else
				self.SpecialMeterBGGlow:setImage( RegisterImage( "uie_t7_zm_hud_ammo_bbgummeterringblur3" ) )
			end
		end
	end )
	self:addElement( self.SpecialMeterBGGlow )

	self.SpecialMeterBG = LUI.UIImage.new()
	self.SpecialMeterBG:setLeftRight( false, true, -114, -16.5 )
	self.SpecialMeterBG:setTopBottom( false, true, -142, -44.5 )
	self.SpecialMeterBG:setImage( RegisterImage( "uie_t7_zm_hud_revive_ringtop" ) )
	self.SpecialMeterBG:setRGB( 0.33, 0.33, 0.33 )
	self.SpecialMeterBG:setAlpha( 0.33 )
	self:addElement( self.SpecialMeterBG )

	self.SpecialMeter = LUI.UIImage.new()
	self.SpecialMeter:setLeftRight( false, true, -114, -16.5 )
	self.SpecialMeter:setTopBottom( false, true, -142, -44.5 )
	self.SpecialMeter:setImage( RegisterImage( "uie_t7_zm_hud_revive_ringtop" ) )
	self.SpecialMeter:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	self.SpecialMeter:setRGB( 0.88, 0.77, 0.49 )
	self.SpecialMeter:setShaderVector( 0, 1, 0, 0, 0 )
	self.SpecialMeter:setShaderVector( 1, 0.5, 0, 0, 0 )
	self.SpecialMeter:setShaderVector( 2, 0.5, 0, 0, 0 )
	self.SpecialMeter:setShaderVector( 3, 0, 0, 0, 0 )
	self.SpecialMeter:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmhud.swordEnergy" ), function ( model )
		local swordEnergy = Engine.GetModelValue( model )

		if swordEnergy then
			self.SpecialMeter:setShaderVector( 0, AdjustStartEnd( 0, 1,
				CoD.GetVectorComponentFromString( swordEnergy, 1 ),
				CoD.GetVectorComponentFromString( swordEnergy, 2 ),
				CoD.GetVectorComponentFromString( swordEnergy, 3 ),
				CoD.GetVectorComponentFromString( swordEnergy, 4 ) ) )
		end
	end )
	self:addElement( self.SpecialMeter )

	self.DpadIconMine = LUI.UIImage.new()
	self.DpadIconMine:setLeftRight( false, true, -86, -63 )
	self.DpadIconMine:setTopBottom( false, true, -179, -156 )
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

	self.DpadIconMineCountTextShadow = LUI.UIText.new()
	self.DpadIconMineCountTextShadow:setLeftRight( true, true, 0, -83 )
	self.DpadIconMineCountTextShadow:setTopBottom( false, true, -179, -169 )
	self.DpadIconMineCountTextShadow:setText( Engine.Localize( "" ) )
	self.DpadIconMineCountTextShadow:setTTF( "fonts/dinnextltpro-regular.ttf" )
	self.DpadIconMineCountTextShadow:setRGB( 0.11, 0.11, 0.11 )
	self.DpadIconMineCountTextShadow:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	self.DpadIconMineCountTextShadow:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.actionSlot3ammo" ), function ( model )
		local actionSlot3ammo = Engine.GetModelValue( model )

		if actionSlot3ammo then
			if actionSlot3ammo > 0 then
				self.DpadIconMineCountTextShadow:setText( Engine.Localize( actionSlot3ammo ) )
			else
				self.DpadIconMineCountTextShadow:setText( Engine.Localize( "" ) )
			end
		end
	end )
	self:addElement( self.DpadIconMineCountTextShadow )

	self.DpadIconMineCountText = LUI.UIText.new()
	self.DpadIconMineCountText:setLeftRight( true, true, 0, -82.5 )
	self.DpadIconMineCountText:setTopBottom( false, true, -179.5, -169.5 )
	self.DpadIconMineCountText:setText( Engine.Localize( "" ) )
	self.DpadIconMineCountText:setTTF( "fonts/dinnextltpro-regular.ttf" )
	self.DpadIconMineCountText:setRGB( 0.65, 0.63, 0.57 )
	self.DpadIconMineCountText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
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
		element.LethalImage:close()
		element.LethalCountTextShadow:close()
		element.LethalCountText:close()
		element.TacticalImage:close()
		element.TacticalCountTextShadow:close()
		element.TacticalCountText:close()
		element.SpecialImageBG:close()
		element.SpecialImageBG2:close()
		element.SpecialImage:close()
		element.SpecialPromptTextShadow:close()
		element.SpecialPromptText:close()
		element.SpecialMeterBGGlow:close()
		element.SpecialMeterBG:close()
		element.SpecialMeter:close()
		element.DpadIconMine:close()
		element.DpadIconMineCountTextShadow:close()
		element.DpadIconMineCountText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
