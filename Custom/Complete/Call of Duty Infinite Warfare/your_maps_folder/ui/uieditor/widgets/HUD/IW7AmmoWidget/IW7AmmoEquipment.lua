CoD.IW7AmmoEquipment = InheritFrom( LUI.UIElement )
CoD.IW7AmmoEquipment.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.IW7AmmoEquipment )
	self.id = "IW7AmmoEquipment"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true

	self.LethalImage = LUI.UIImage.new()
    self.LethalImage:setLeftRight( false, true, -206.5, -186.5 )
    self.LethalImage:setTopBottom( false, true, -82, -62 )
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

	self.LethalCountText = LUI.UIText.new()
    self.LethalCountText:setLeftRight( true, true, 0, -170 )
    self.LethalCountText:setTopBottom( false, true, -75, -60 )
	self.LethalCountText:setText( Engine.Localize( "0" ) )
	self.LethalCountText:setTTF( "fonts/blender_pro_bold.ttf" )
	self.LethalCountText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	self.LethalCountText:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentPrimaryOffhand.primaryOffhandCount" ), function ( model )
		local primaryOffhandCount = Engine.GetModelValue( model )

		if primaryOffhandCount then
			self.LethalCountText:setText( Engine.Localize( primaryOffhandCount ) )
		end
	end )
	self:addElement( self.LethalCountText )

	self.TacticalImage = LUI.UIImage.new()
    self.TacticalImage:setLeftRight( false, true, -251.5, -231.5 )
    self.TacticalImage:setTopBottom( false, true, -82, -62 )
	self.TacticalImage:setImage( RegisterImage( "blacktransparent" ) )
	self.TacticalImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
	self.TacticalImage:setShaderVector( 0, 1, 0, 0, 0 )
	self.TacticalImage:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentSecondaryOffhand.secondaryOffhand" ), function ( model )
		local secondaryOffhand = Engine.GetModelValue( model )

		if secondaryOffhand then
			if secondaryOffhand == "hud_cymbal_monkey_bo3" then
				self.TacticalImage:setShaderVector( 0, 0, 0, 0, 0 )
			else
				self.TacticalImage:setShaderVector( 0, 1, 0, 0, 0 )
			end

			self.TacticalImage:setImage( RegisterImage( secondaryOffhand ) )
		end
	end )
	self:addElement( self.TacticalImage )

	self.TacticalCountText = LUI.UIText.new()
    self.TacticalCountText:setLeftRight( true, true, 0, -215 )
    self.TacticalCountText:setTopBottom( false, true, -75, -60 )
	self.TacticalCountText:setText( Engine.Localize( "0" ) )
	self.TacticalCountText:setTTF( "fonts/blender_pro_bold.ttf" )
	self.TacticalCountText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
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

	self.SpecialMeter = LUI.UIImage.new()
    self.SpecialMeter:setLeftRight( false, true, -206.5, -186.5 )
    self.SpecialMeter:setTopBottom( false, true, -117, -97 )
	self.SpecialMeter:setImage( RegisterImage( "blacktransparent" ) )
	self.SpecialMeter:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	self.SpecialMeter:setShaderVector( 0, 1, 0, 0, 0 )
	self.SpecialMeter:setShaderVector( 1, 0.5, 0, 0, 0 )
	self.SpecialMeter:setShaderVector( 2, 0.5, 0, 0, 0 )
	self.SpecialMeter:setShaderVector( 3, 0, 0, 0, 0 )
	self.SpecialMeter:setRGB( 0.88, 0.88, 0 )
	self.SpecialMeter:setScale( 1.25 )
	self.SpecialMeter:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmhud.swordEnergy" ), function ( model )
		local swordEnergy = Engine.GetModelValue( model )

		if swordEnergy then
			if swordEnergy > 0 then
				self.SpecialMeter:setImage( RegisterImage( "uie_t7_zm_hud_revive_ringtop" ) )
			else
				self.SpecialMeter:setImage( RegisterImage( "blacktransparent" ) )
			end

			self.SpecialMeter:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )

			if swordEnergy < 1 then
				self.SpecialMeter:setRGB( 0.88, 0.88, 0 )
			else
				self.SpecialMeter:setRGB( 0, 0.88, 0 )
			end

			self.SpecialMeter:setShaderVector( 0, AdjustStartEnd( 0, 1,
				CoD.GetVectorComponentFromString( swordEnergy, 1 ),
				CoD.GetVectorComponentFromString( swordEnergy, 2 ),
				CoD.GetVectorComponentFromString( swordEnergy, 3 ),
				CoD.GetVectorComponentFromString( swordEnergy, 4 ) ) )
		end
	end )
	self:addElement( self.SpecialMeter )

	self.Special = LUI.UIImage.new()
    self.Special:setLeftRight( false, true, -206.5, -186.5 )
    self.Special:setTopBottom( false, true, -117, -97 )
	self.Special:setImage( RegisterImage( "blacktransparent" ) )
	self.Special:setScale( 0.75 )
	self.Special:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmhud.swordEnergy" ), function ( model )
		local swordEnergy = Engine.GetModelValue( model )

		if swordEnergy then
			if swordEnergy > 0 then
				self.Special:setImage( RegisterImage( "uie_t7_mp_icon_header_character" ) )
			else
				self.Special:setImage( RegisterImage( "blacktransparent" ) )
			end
		end
	end )
	self:addElement( self.Special )

	self.SpecialCountText = LUI.UIText.new()
	self.SpecialCountText:setLeftRight( true, true, 0, -170 )
	self.SpecialCountText:setTopBottom( false, true, -110, -95 )
	self.SpecialCountText:setText( Engine.Localize( "" ) )
	self.SpecialCountText:setTTF( "fonts/blender_pro_bold.ttf" )
	self.SpecialCountText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	self.SpecialCountText:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmhud.swordEnergy" ), function ( model )
		local swordEnergy = Engine.GetModelValue( model )

		if swordEnergy then
			if swordEnergy < 1 then
				self.SpecialCountText:setText( Engine.Localize( "" ) )
			else
				self.SpecialCountText:setText( Engine.Localize( "1" ) )
			end
		end
	end )
	self:addElement( self.SpecialCountText )

	self.DpadIconMine = LUI.UIImage.new()
    self.DpadIconMine:setLeftRight( false, true, -251.5, -231.5 )
    self.DpadIconMine:setTopBottom( false, true, -117, -97 )
	self.DpadIconMine:setImage( RegisterImage( "blacktransparent" ) )
	self.DpadIconMine:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.actionSlot3ammo" ), function ( model )
		local actionSlot3ammo = Engine.GetModelValue( model )

		if actionSlot3ammo then
			if actionSlot3ammo > 0 then
				self.DpadIconMine:setImage( RegisterImage( "t7_hud_mp_inventory_bouncingbetty" ) )
			else
				self.DpadIconMine:setImage( RegisterImage( "blacktransparent" ) )
			end
		end
	end )
	self:addElement( self.DpadIconMine )

	self.DpadIconMineCountText = LUI.UIText.new()
	self.DpadIconMineCountText:setLeftRight( true, true, 0, -215 )
	self.DpadIconMineCountText:setTopBottom( false, true, -110, -95 )
	self.DpadIconMineCountText:setText( Engine.Localize( "" ) )
	self.DpadIconMineCountText:setTTF( "fonts/blender_pro_bold.ttf" )
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
		element.LethalCountText:close()
		element.TacticalImage:close()
		element.TacticalCountText:close()
		element.SpecialMeter:close()
		element.Special:close()
		element.SpecialCountText:close()
		element.DpadIconMine:close()
		element.DpadIconMineCountText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
