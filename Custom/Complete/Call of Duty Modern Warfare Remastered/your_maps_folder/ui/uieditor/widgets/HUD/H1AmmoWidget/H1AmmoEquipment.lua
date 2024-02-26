require( "ui.uieditor.widgets.HUD.ZM_FX.ZmFx_Spark2Ext" )

CoD.H1AmmoEquipment = InheritFrom( LUI.UIElement )
CoD.H1AmmoEquipment.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.H1AmmoEquipment )
	self.id = "H1AmmoEquipment"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true

	self.LethalBG = LUI.UIImage.new()
	self.LethalBG:setLeftRight( false, true, -62, -15 )
	self.LethalBG:setTopBottom( false, true, -100, -15 )
	self.LethalBG:setImage( RegisterImage( "h1_basewidgets_box_border" ) )
	self.LethalBG:setRGB( 0, 0, 0 )
	self:addElement( self.LethalBG )

	self.Lethal = LUI.UIImage.new()
	self.Lethal:setLeftRight( false, true, -60, -18 )
	self.Lethal:setTopBottom( false, true, -60, -18 )
	self.Lethal:setImage( RegisterImage( "blacktransparent" ) )
	self.Lethal:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentPrimaryOffhand.primaryOffhand" ), function ( model )
		local primaryOffhand = Engine.GetModelValue( model )

		if primaryOffhand then
			if primaryOffhand == "uie_t7_zm_hud_inv_icnlthl" then
				self.Lethal:setImage( RegisterImage( "h1_baseicons_grenades_frg" ) )

			elseif primaryOffhand == "uie_t7_zm_hud_inv_widowswine" then
				self.Lethal:setImage( RegisterImage( "h1_baseicons_grenades_widows_semtex" ) )

			else
				self.Lethal:setImage( RegisterImage( primaryOffhand ) )
			end
		end
	end )
	self:addElement( self.Lethal )

	self.LethalCount = LUI.UIText.new()
    self.LethalCount:setLeftRight( true, true, 0, 402.5 )
    self.LethalCount:setTopBottom( false, true, -42.5, -13 )
	self.LethalCount:setText( Engine.Localize( "0" ) )
    self.LethalCount:setTTF( "fonts/defaultbold.otf" )
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

	self.TacticalBG = LUI.UIImage.new()
	self.TacticalBG:setLeftRight( false, true, -62 - 48, -15 - 48 )
	self.TacticalBG:setTopBottom( false, true, -100, -15 )
	self.TacticalBG:setImage( RegisterImage( "h1_basewidgets_box_border" ) )
	self.TacticalBG:setRGB( 0, 0, 0 )
	self:addElement( self.TacticalBG )

	self.Tactical = LUI.UIImage.new()
	self.Tactical:setLeftRight( false, true, -60 - 48, -18 - 48 )
	self.Tactical:setTopBottom( false, true, -60, -18 )
	self.Tactical:setImage( RegisterImage( "blacktransparent" ) )
	self.Tactical:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentSecondaryOffhand.secondaryOffhand" ), function ( model )
		local secondaryOffhand = Engine.GetModelValue( model )

		if secondaryOffhand then
			if secondaryOffhand == "hud_cymbal_monkey_bo3" then
				self.Tactical:setImage( RegisterImage( "h1_baseicons_grenades_monkey" ) )
			else
				self.Tactical:setImage( RegisterImage( secondaryOffhand ) )
			end
		end
	end )
	self:addElement( self.Tactical )

	self.TacticalCount = LUI.UIText.new()
    self.TacticalCount:setLeftRight( true, true, 0, 402.5 - 64 )
    self.TacticalCount:setTopBottom( false, true, -42.5, -13 )
	self.TacticalCount:setText( Engine.Localize( "0" ) )
    self.TacticalCount:setTTF( "fonts/defaultbold.otf" )
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
	self.SpecialBG:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmhud.swordEnergy" ), function ( model )
		local swordEnergy = Engine.GetModelValue( model )

		if swordEnergy then
			if swordEnergy > 0 then
				self.SpecialBG:setImage( RegisterImage( "uie_t7_zm_hud_revive_ringtop" ) )
			else
				self.SpecialBG:setImage( RegisterImage( "blacktransparent" ) )
			end
		end
	end )
	self:addElement( self.SpecialBG )

	self.Special = LUI.UIImage.new()
	self.Special:setLeftRight( false, true, -78, -16 )
	self.Special:setTopBottom( false, true, -171, -109 )
	self.Special:setImage( RegisterImage( "h1_baseicons_specialweapon" ) )
	self.Special:setScale( 0.5 )
	self.Special:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmhud.swordEnergy" ), function ( model )
		local swordEnergy = Engine.GetModelValue( model )

		if swordEnergy then
			if swordEnergy > 0 then
				self.Special:setImage( RegisterImage( "h1_baseicons_specialweapon" ) )
			else
				self.Special:setImage( RegisterImage( "blacktransparent" ) )
			end
		end
	end )
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
			if swordEnergy > 0 then
				self.SpecialMeter:setImage( RegisterImage( "uie_t7_zm_hud_revive_ringtop" ) )
			else
				self.SpecialMeter:setImage( RegisterImage( "blacktransparent" ) )
			end

			self.SpecialMeter:setShaderVector( 0, AdjustStartEnd( 0, 1,
				CoD.GetVectorComponentFromString( swordEnergy, 1 ),
				CoD.GetVectorComponentFromString( swordEnergy, 2 ),
				CoD.GetVectorComponentFromString( swordEnergy, 3 ),
				CoD.GetVectorComponentFromString( swordEnergy, 4 ) ) )
		end
	end )
	self:addElement( self.SpecialMeter )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LethalBG:close()
		element.Lethal:close()
		element.LethalCount:close()
		element.TacticalBG:close()
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
