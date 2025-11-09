require( "ui.uieditor.widgets.HUD.ZM_FX.ZmFx_Spark2Ext" )

CoD.S4AmmoEquipment = InheritFrom( LUI.UIElement )
CoD.S4AmmoEquipment.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.S4AmmoEquipment )
	self.id = "S4AmmoEquipment"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true

	self.Lethal = LUI.UIImage.new()
    self.Lethal:setLeftRight( false, true, -70.5, -32.5 )
    self.Lethal:setTopBottom( false, true, -74, -36 )
	self.Lethal:setImage( RegisterImage( "blacktransparent" ) )
	self.Lethal:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentPrimaryOffhand.primaryOffhand" ), function ( model )
		local primaryOffhand = Engine.GetModelValue( model )

		if primaryOffhand then
			if primaryOffhand == "blacktransparent" then
				self.Lethal:setLeftRight( false, true, -48.5, -40.5 )
				self.Lethal:setTopBottom( false, true, -61, -53 )
			else
				self.Lethal:setLeftRight( false, true, -70.5, -32.5 )
				self.Lethal:setTopBottom( false, true, -74, -36 )
			end

			if primaryOffhand == "blacktransparent" then
				self.Lethal:setImage( RegisterImage( "uie_t7_hud_cp_bleeding_out_blur" ) )

			elseif primaryOffhand == "uie_t7_zm_hud_inv_icnlthl" then
				self.Lethal:setImage( RegisterImage( "v_ui_icon_equipment_equiplethal01" ) )

			elseif primaryOffhand == "uie_t7_zm_hud_inv_widowswine" then
				self.Lethal:setImage( RegisterImage( "v_ui_icons_zombies_general_feedback_widowswine" ) )

			else
				self.Lethal:setImage( RegisterImage( primaryOffhand ) )
			end
		end
	end )
	self:addElement( self.Lethal )

	self.LethalCount = LUI.UIText.new()
    self.LethalCount:setLeftRight( true, true, 0, 399 )
    self.LethalCount:setTopBottom( false, true, -88, -21 )
	self.LethalCount:setText( Engine.Localize( "0" ) )
    self.LethalCount:setTTF( "fonts/main_bold.ttf" )
	self.LethalCount:setScale( 0.5 )
	self.LethalCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
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
    self.Tactical:setLeftRight( false, true, -121, -83 )
    self.Tactical:setTopBottom( false, true, -74, -36 )
	self.Tactical:setImage( RegisterImage( "blacktransparent" ) )
	self.Tactical:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentSecondaryOffhand.secondaryOffhand" ), function ( model )
		local secondaryOffhand = Engine.GetModelValue( model )

		if secondaryOffhand then
			if secondaryOffhand == "blacktransparent" then
				self.Tactical:setLeftRight( false, true, -99, -91 )
				self.Tactical:setTopBottom( false, true, -61, -53 )
			else
				self.Tactical:setLeftRight( false, true, -121, -83 )
				self.Tactical:setTopBottom( false, true, -74, -36 )
			end

			if secondaryOffhand == "blacktransparent" then
				self.Tactical:setImage( RegisterImage( "uie_t7_hud_cp_bleeding_out_blur" ) )

			elseif secondaryOffhand == "hud_cymbal_monkey_bo3" then
				self.Tactical:setImage( RegisterImage( "v_ui_icons_zombies_general_feedback_cymbalmonkey" ) )

			else
				self.Tactical:setImage( RegisterImage( secondaryOffhand ) )
			end
		end
	end )
	self:addElement( self.Tactical )

	self.TacticalCount = LUI.UIText.new()
    self.TacticalCount:setLeftRight( true, true, 0, 332 )
    self.TacticalCount:setTopBottom( false, true, -88, -21 )
	self.TacticalCount:setText( Engine.Localize( "0" ) )
    self.TacticalCount:setTTF( "fonts/main_bold.ttf" )
	self.TacticalCount:setScale( 0.5 )
	self.TacticalCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
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

	self.SpecialBG = LUI.UIImage.new()
	self.SpecialBG:setLeftRight( false, true, -78, -16 )
	self.SpecialBG:setTopBottom( false, true, -171, -109 )
	self.SpecialBG:setImage( RegisterImage( "uie_t7_zm_hud_revive_ringtop" ) )
	self.SpecialBG:setAlpha( 0.25 )
	self:addElement( self.SpecialBG )

	self.Special = LUI.UIImage.new()
	self.Special:setLeftRight( false, true, -78, -16 )
	self.Special:setTopBottom( false, true, -171, -109 )
	self.Special:setImage( RegisterImage( "v_ui_icon_zm_calling_tasks_specialweapon" ) )
	self.Special:setScale( 0.5 )
	self:addElement( self.Special )

	self.SpecialMeterBG = CoD.ZmFx_Spark2Ext.new( menu, controller )
	self.SpecialMeterBG:setLeftRight( false, true, -87, -25 )
	self.SpecialMeterBG:setTopBottom( false, true, -188.5, -126.5 )
	self.SpecialMeterBG:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self.SpecialMeterBG:setRGB( 0.33, 0.33, 0.33 )
	self.SpecialMeterBG:setYRot( 120 )
	self.SpecialMeterBG:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmhud.swordEnergy" ), function ( model )
		local swordEnergy = Engine.GetModelValue( model )

		if swordEnergy then
			if swordEnergy < 1 then
				self.SpecialMeterBG.ZmFxSpark1Img0.Image00:setImage( RegisterImage( "blacktransparent" ) )
				self.SpecialMeterBG.ZmFxSpark1Img1.Image00:setImage( RegisterImage( "blacktransparent" ) )
			else
				self.SpecialMeterBG.ZmFxSpark1Img0.Image00:setImage( RegisterImage( "uie_t7_zm_hud_rnd_spkseq1" ) )
				self.SpecialMeterBG.ZmFxSpark1Img1.Image00:setImage( RegisterImage( "uie_t7_zm_hud_rnd_spkseq1" ) )
			end
		end
	end )
	self:addElement( self.SpecialMeterBG )

	self.SpecialMeter = LUI.UIImage.new()
	self.SpecialMeter:setLeftRight( false, true, -78, -16 )
	self.SpecialMeter:setTopBottom( false, true, -171, -109 )
	self.SpecialMeter:setImage( RegisterImage( "uie_t7_zm_hud_revive_ringtop" ) )
	self.SpecialMeter:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Lethal:close()
		element.LethalCount:close()
		element.Tactical:close()
		element.TacticalCount:close()
		element.SpecialBG:close()
		element.Special:close()
		element.SpecialMeterBG:close()
		element.SpecialMeter:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
