require( "ui.uieditor.widgets.HUD.T6AmmoWidget.T6AmmoEquipment" )
require( "ui.uieditor.widgets.HUD.T6AmmoWidget.T6AmmoInfo" )

local SetBGBIcon = function ( controller, element )
	local bgb_display = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "bgb_display" ) )
	local bgb_current = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "bgb_current" ) )

	if bgb_display ~= nil and bgb_current ~= nil then
		if bgb_display == 1 then
			element:setImage( RegisterImage( GetItemImageFromIndex( bgb_current ) ) )
		else
			element:setImage( RegisterImage( "blacktransparent" ) )
		end
	end
end

local SetWeaponName = function ( controller, element )
	local weaponName = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.weaponName" ) )
	local aatIcon = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.aatIcon" ) )
	local MuleKick = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "T6.MuleKick" ) )

	if weaponName ~= nil and aatIcon ~= nil and MuleKick ~= nil then
		if MuleKick == 1 then
			element:setRGB( 0, 1, 0 )
		else
			element:setRGB( 1, 1, 1 )
		end
		
		if aatIcon ~= "blacktransparent" then
			aatIcon = aatIcon:gsub( "t7_icon_zm_aat_blast_furnace", "^1Blast Furnace^7" )
			aatIcon = aatIcon:gsub( "t7_icon_zm_aat_dead_wire", "^5Dead Wire^7" )
			aatIcon = aatIcon:gsub( "t7_icon_zm_aat_fire_works", "^3Fire Works^7" )
			aatIcon = aatIcon:gsub( "t7_icon_zm_aat_thunder_wall", "^4Thunder Wall^7" )
			aatIcon = aatIcon:gsub( "t7_icon_zm_aat_turned", "^2Turned^7" )

			weaponName = weaponName .. " (" .. aatIcon .. ")"
		end

		element:setText( Engine.Localize( weaponName ) )
	end
end

CoD.T6AmmoContainer = InheritFrom( LUI.UIElement )
CoD.T6AmmoContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.T6AmmoContainer )
	self.id = "T6AmmoContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true

	self.AmmoBG = LUI.UIImage.new()
	self.AmmoBG:setLeftRight( false, true, -300, 0 )
    self.AmmoBG:setTopBottom( false, true, -140, 10 )
	self.AmmoBG:setImage( RegisterImage( "hud_dpad_blood" ) )
	self.AmmoBG:setRGB( 0.21, 0, 0 )
	self:addElement( self.AmmoBG )

	self.DpadBG = LUI.UIImage.new()
	self.DpadBG:setLeftRight( true, false, 1204 - 52, 1228 + 52 )
    self.DpadBG:setTopBottom( true, false, 644 - 52, 668 + 52 )
	self.DpadBG:setImage( RegisterImage( "lui_dpad_circle" ) )
	self:addElement( self.DpadBG )

	self.DpadUp = LUI.UIImage.new()
	self.DpadUp:setLeftRight( true, false, 1212, 1220 )
    self.DpadUp:setTopBottom( true, false, 644, 652 )
	self.DpadUp:setImage( RegisterImage( "lui_arrow_global" ) )
	self:addElement( self.DpadUp )

	self.DpadDown = LUI.UIImage.new()
	self.DpadDown:setLeftRight( true, false, 1212, 1220 )
    self.DpadDown:setTopBottom( true, false, 660, 668 )
	self.DpadDown:setImage( RegisterImage( "lui_arrow_global" ) )
	self.DpadDown:setZRot( 180 )
	self:addElement( self.DpadDown )

	self.DpadLeft = LUI.UIImage.new()
	self.DpadLeft:setLeftRight( true, false, 1204, 1212 )
    self.DpadLeft:setTopBottom( true, false, 652, 660 )
	self.DpadLeft:setImage( RegisterImage( "lui_arrow_global" ) )
	self.DpadLeft:setZRot( 90 )
	self:addElement( self.DpadLeft )

	self.DpadRight = LUI.UIImage.new()
	self.DpadRight:setLeftRight( true, false, 1220, 1228 )
    self.DpadRight:setTopBottom( true, false, 652, 660 )
	self.DpadRight:setImage( RegisterImage( "lui_arrow_global" ) )
	self.DpadRight:setZRot( -90 )
	self:addElement( self.DpadRight )

	self.BBGumRing = LUI.UIImage.new()
	self.BBGumRing:setLeftRight( true, false, 1212 - 5, 1220 + 5 )
	self.BBGumRing:setTopBottom( true, false, 644 - 5 - 15, 652 + 5 - 15 )
	self.BBGumRing:setImage( RegisterImage( "blacktransparent" ) )
	self.BBGumRing:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	self.BBGumRing:setRGB( 1, 1, 0 )
	self.BBGumRing:setScale( 1.3 )
	self.BBGumRing:setShaderVector( 1, 0.5, 0, 0, 0 )
	self.BBGumRing:setShaderVector( 2, 0.5, 0, 0, 0 )
	self.BBGumRing:setShaderVector( 3, 0.08, 0, 0, 0 )
	self.BBGumRing:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "bgb_timer" ), function ( model )
		local bgb_timer = Engine.GetModelValue( model )

		if bgb_timer then
			if bgb_timer > 0 then
				self.BBGumRing:setImage( RegisterImage( "uie_t7_zm_hud_ammo_bbgummeterring" ) )
			else
				self.BBGumRing:setImage( RegisterImage( "blacktransparent" ) )
			end

			self.BBGumRing:setShaderVector( 0,
				CoD.GetVectorComponentFromString( bgb_timer, 1 ),
				CoD.GetVectorComponentFromString( bgb_timer, 2 ),
				CoD.GetVectorComponentFromString( bgb_timer, 3 ),
				CoD.GetVectorComponentFromString( bgb_timer, 4 ) )
		end
	end )
	self:addElement( self.BBGumRing )

	self.BBGumTexture = LUI.UIImage.new()
	self.BBGumTexture:setLeftRight( true, false, 1212 - 5, 1220 + 5 )
	self.BBGumTexture:setTopBottom( true, false, 644 - 5 - 15, 652 + 5 - 15 )
	self.BBGumTexture:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "bgb_display" ), function ( model )
		SetBGBIcon( controller, self.BBGumTexture )
	end )
	self.BBGumTexture:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "bgb_current" ), function ( model )
		SetBGBIcon( controller, self.BBGumTexture )
	end )
	self:addElement( self.BBGumTexture )

	self.BBGumCountText = LUI.UIText.new()
	self.BBGumCountText:setLeftRight( true, false, 1212 - 5, 1220 + 5 )
	self.BBGumCountText:setTopBottom( true, false, 644 - 5 - 32, 652 + 5 - 32 )
	self.BBGumCountText:setText( Engine.Localize( "" ) )
	self.BBGumCountText:setTTF( "fonts/bigFont.ttf" )
	self.BBGumCountText:setScale( 0.75 )
	self.BBGumCountText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self.BBGumCountText:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "bgb_activations_remaining" ), function ( model )
		local bgb_activations_remaining = Engine.GetModelValue( model )

		if bgb_activations_remaining then
			if bgb_activations_remaining > 0 then
				self.BBGumCountText:setText( Engine.Localize( bgb_activations_remaining ) )
			else
				self.BBGumCountText:setText( Engine.Localize( "" ) )
			end
		end
	end )
	self:addElement( self.BBGumCountText )

	self.ShieldHealth = LUI.UIImage.new()
	self.ShieldHealth:setLeftRight( true, false, 1212 - 5, 1220 + 5 )
	self.ShieldHealth:setTopBottom( true, false, 660 - 5 + 15, 668 + 5 + 15 )
	self.ShieldHealth:setImage( RegisterImage( "blacktransparent" ) )
	self.ShieldHealth:setRGB( 1, 1, 1 )
	self.ShieldHealth:setScale( 0.9 )
	self.ShieldHealth:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta_normal" ) )
	self.ShieldHealth:setShaderVector( 0, 0, 1, 0, 0 )
	self.ShieldHealth:setShaderVector( 1, 0, 0, 0, 0 )
	self.ShieldHealth:setShaderVector( 3, 0, 0, 0, 0 )
	self.ShieldHealth:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.showDpadDown" ), function ( model )
		local showDpadDown = Engine.GetModelValue( model )

		if showDpadDown then
			if showDpadDown == 1 then
				self.ShieldHealth:setImage( RegisterImage( "uie_t7_mp_icon_header_emblem" ) )
			else
				self.ShieldHealth:setImage( RegisterImage( "blacktransparent" ) )
			end
		end
	end )
	self.ShieldHealth:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "ZMInventory.shield_health" ), function ( model )
		local shield_health = Engine.GetModelValue( model )

		if shield_health then
			self.ShieldHealth:setShaderVector( 2, SetVectorComponent( 2, 1, SubtractVectorComponentFrom( 1, 0.5, ScaleVector( 0.5,
				CoD.GetVectorComponentFromString( shield_health, 1 ),
				CoD.GetVectorComponentFromString( shield_health, 2 ),
				CoD.GetVectorComponentFromString( shield_health, 3 ),
				CoD.GetVectorComponentFromString( shield_health, 4 ) ) ) ) )
		end
	end )
	self:addElement( self.ShieldHealth )

	self.DpadIconMine = LUI.UIImage.new()
    self.DpadIconMine:setLeftRight( true, false, 1220 - 5 + 15, 1228 + 5 + 15 )
    self.DpadIconMine:setTopBottom( true, false, 652 - 5, 660 + 5 )
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
    self.DpadIconMineCountText:setLeftRight( true, false, 1220 - 5 + 32, 1228 + 5 + 32 )
    self.DpadIconMineCountText:setTopBottom( true, false, 652 - 5, 660 + 5 )
	self.DpadIconMineCountText:setText( Engine.Localize( "" ) )
	self.DpadIconMineCountText:setTTF( "fonts/bigFont.ttf" )
	self.DpadIconMineCountText:setScale( 0.75 )
	self.DpadIconMineCountText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
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

	self.SpecialImageBG = LUI.UIImage.new()
	self.SpecialImageBG:setLeftRight( false, true, -50 - 230, 0 - 230 )
	self.SpecialImageBG:setTopBottom( false, true, -50, 0 )
	self.SpecialImageBG:setImage( RegisterImage( "blacktransparent" ) )
	self.SpecialImageBG:setScale( 0.75 )
	self.SpecialImageBG:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmhud.swordEnergy" ), function ( model )
		local swordEnergy = Engine.GetModelValue( model )

		if swordEnergy then
			if swordEnergy > 0 then
				self.SpecialImageBG:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_panelcircle" ) )
			else
				self.SpecialImageBG:setImage( RegisterImage( "blacktransparent" ) )
			end
		end
	end )
	self:addElement( self.SpecialImageBG )

	self.SpecialImage = LUI.UIImage.new()
	self.SpecialImage:setLeftRight( false, true, -50 - 230, 0 - 230 )
	self.SpecialImage:setTopBottom( false, true, -50, 0 )
	self.SpecialImage:setImage( RegisterImage( "blacktransparent" ) )
	self.SpecialImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiply" ) )
	self.SpecialImage:setScale( 0.8 )
	self.SpecialImage:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmhud.swordEnergy" ), function ( model )
		local swordEnergy = Engine.GetModelValue( model )

		if swordEnergy then
			if swordEnergy > 0 then
				self.SpecialImage:setImage( RegisterImage( "i_mtl_p7_zm_bgb_icon_arsenal_acelerator_c" ) )
			else
				self.SpecialImage:setImage( RegisterImage( "blacktransparent" ) )
			end
		end
	end )
	self:addElement( self.SpecialImage )

	self.SpecialMeter = LUI.UIImage.new()
	self.SpecialMeter:setLeftRight( false, true, -50 - 230, 0 - 230 )
	self.SpecialMeter:setTopBottom( false, true, -50, 0 )
	self.SpecialMeter:setImage( RegisterImage( "blacktransparent" ) )
	self.SpecialMeter:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	self.SpecialMeter:setShaderVector( 1, 0.5, 0, 0, 0 )
	self.SpecialMeter:setShaderVector( 2, 0.5, 0, 0, 0 )
	self.SpecialMeter:setShaderVector( 3, 0.08, 0, 0, 0 )
	self.SpecialMeter:setRGB( 1, 1, 0 )
	self.SpecialMeter:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmhud.swordEnergy" ), function ( model )
		local swordEnergy = Engine.GetModelValue( model )

		if swordEnergy then
			if swordEnergy > 0 then
				self.SpecialMeter:setImage( RegisterImage( "uie_t7_zm_hud_ammo_bbgummeterring" ) )
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

	self.WeaponName = LUI.UIText.new()
	self.WeaponName:setLeftRight( true, true, 0, -131 )
	self.WeaponName:setTopBottom( false, true, -118, -88 )
	self.WeaponName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	self.WeaponName:setTTF( "fonts/bigFont.ttf" )
	self.WeaponName:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.weaponName" ), function ( model )
		SetWeaponName( controller, self.WeaponName )
	end )
	self.WeaponName:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.aatIcon" ), function ( model )
		SetWeaponName( controller, self.WeaponName )
	end )
	self.WeaponName:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "T6.MuleKick" ), function ( model )
		SetWeaponName( controller, self.WeaponName )
	end )
	self:addElement( self.WeaponName )

	self.AmmoEquipment = CoD.T6AmmoEquipment.new( menu, controller )
	self.AmmoEquipment:setLeftRight( true, true, 0, 0 )
	self.AmmoEquipment:setTopBottom( true, true, 0, 0 )
	self:addElement( self.AmmoEquipment )

	self.AmmoInfo = CoD.T6AmmoInfo.new( menu, controller )
	self.AmmoInfo:setLeftRight( true, true, 0, 0 )
	self.AmmoInfo:setTopBottom( true, true, 0, 0 )
	self:addElement( self.AmmoInfo )

	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 18 )
				
				self.AmmoBG:completeAnimation()
				self.AmmoBG:setAlpha( 0 )
				self.clipFinished( self.AmmoBG, {} )

				self.DpadBG:completeAnimation()
				self.DpadBG:setAlpha( 0 )
				self.clipFinished( self.DpadBG, {} )

				self.DpadUp:completeAnimation()
				self.DpadUp:setAlpha( 0 )
				self.clipFinished( self.DpadUp, {} )

				self.DpadDown:completeAnimation()
				self.DpadDown:setAlpha( 0 )
				self.clipFinished( self.DpadDown, {} )

				self.DpadLeft:completeAnimation()
				self.DpadLeft:setAlpha( 0 )
				self.clipFinished( self.DpadLeft, {} )

				self.DpadRight:completeAnimation()
				self.DpadRight:setAlpha( 0 )
				self.clipFinished( self.DpadRight, {} )

				self.BBGumRing:completeAnimation()
				self.BBGumRing:setAlpha( 0 )
				self.clipFinished( self.BBGumRing, {} )

				self.BBGumTexture:completeAnimation()
				self.BBGumTexture:setAlpha( 0 )
				self.clipFinished( self.BBGumTexture, {} )

				self.BBGumCountText:completeAnimation()
				self.BBGumCountText:setAlpha( 0 )
				self.clipFinished( self.BBGumCountText, {} )

				self.ShieldHealth:completeAnimation()
				self.ShieldHealth:setAlpha( 0 )
				self.clipFinished( self.ShieldHealth, {} )

				self.DpadIconMine:completeAnimation()
				self.DpadIconMine:setAlpha( 0 )
				self.clipFinished( self.DpadIconMine, {} )

				self.DpadIconMineCountText:completeAnimation()
				self.DpadIconMineCountText:setAlpha( 0 )
				self.clipFinished( self.DpadIconMineCountText, {} )

				self.SpecialImageBG:completeAnimation()
				self.SpecialImageBG:setAlpha( 0 )
				self.clipFinished( self.SpecialImageBG, {} )

				self.SpecialImage:completeAnimation()
				self.SpecialImage:setAlpha( 0 )
				self.clipFinished( self.SpecialImage, {} )

				self.SpecialMeter:completeAnimation()
				self.SpecialMeter:setAlpha( 0 )
				self.clipFinished( self.SpecialMeter, {} )

				self.WeaponName:completeAnimation()
				self.WeaponName:setAlpha( 0 )
				self.clipFinished( self.WeaponName, {} )

				self.AmmoEquipment:completeAnimation()
				self.AmmoEquipment:setAlpha( 0 )
				self.clipFinished( self.AmmoEquipment, {} )

				self.AmmoInfo:completeAnimation()
				self.AmmoInfo:setAlpha( 0 )
				self.clipFinished( self.AmmoInfo, {} )
			end,
			HudStart = function ()
				self:setupElementClipCounter( 18 )
	
				local HudStartTransition = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
	
					element:setAlpha( 1 )
	
					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end

				self.AmmoBG:completeAnimation()
				self.AmmoBG:setAlpha( 0 )
				HudStartTransition( self.AmmoBG, {} )

				self.DpadBG:completeAnimation()
				self.DpadBG:setAlpha( 0 )
				HudStartTransition( self.DpadBG, {} )

				self.DpadUp:completeAnimation()
				self.DpadUp:setAlpha( 0 )
				HudStartTransition( self.DpadUp, {} )

				self.DpadDown:completeAnimation()
				self.DpadDown:setAlpha( 0 )
				HudStartTransition( self.DpadDown, {} )

				self.DpadLeft:completeAnimation()
				self.DpadLeft:setAlpha( 0 )
				HudStartTransition( self.DpadLeft, {} )

				self.DpadRight:completeAnimation()
				self.DpadRight:setAlpha( 0 )
				HudStartTransition( self.DpadRight, {} )

				self.BBGumRing:completeAnimation()
				self.BBGumRing:setAlpha( 0 )
				HudStartTransition( self.BBGumRing, {} )

				self.BBGumTexture:completeAnimation()
				self.BBGumTexture:setAlpha( 0 )
				HudStartTransition( self.BBGumTexture, {} )

				self.BBGumCountText:completeAnimation()
				self.BBGumCountText:setAlpha( 0 )
				HudStartTransition( self.BBGumCountText, {} )

				self.ShieldHealth:completeAnimation()
				self.ShieldHealth:setAlpha( 0 )
				HudStartTransition( self.ShieldHealth, {} )

				self.DpadIconMine:completeAnimation()
				self.DpadIconMine:setAlpha( 0 )
				HudStartTransition( self.DpadIconMine, {} )

				self.DpadIconMineCountText:completeAnimation()
				self.DpadIconMineCountText:setAlpha( 0 )
				HudStartTransition( self.DpadIconMineCountText, {} )

				self.SpecialImageBG:completeAnimation()
				self.SpecialImageBG:setAlpha( 0 )
				HudStartTransition( self.SpecialImageBG, {} )

				self.SpecialImage:completeAnimation()
				self.SpecialImage:setAlpha( 0 )
				HudStartTransition( self.SpecialImage, {} )

				self.SpecialMeter:completeAnimation()
				self.SpecialMeter:setAlpha( 0 )
				HudStartTransition( self.SpecialMeter, {} )

				self.WeaponName:completeAnimation()
				self.WeaponName:setAlpha( 0 )
				HudStartTransition( self.WeaponName, {} )

				self.AmmoEquipment:completeAnimation()
				self.AmmoEquipment:setAlpha( 0 )
				HudStartTransition( self.AmmoEquipment, {} )

				self.AmmoInfo:completeAnimation()
				self.AmmoInfo:setAlpha( 0 )
				HudStartTransition( self.AmmoInfo, {} )
			end
		},
		HudStart = {
			DefaultClip = function ()
				self:setupElementClipCounter( 18 )
				
				self.AmmoBG:completeAnimation()
				self.AmmoBG:setAlpha( 1 )
				self.clipFinished( self.AmmoBG, {} )
				
				self.DpadBG:completeAnimation()
				self.DpadBG:setAlpha( 1 )
				self.clipFinished( self.DpadBG, {} )
				
				self.DpadUp:completeAnimation()
				self.DpadUp:setAlpha( 1 )
				self.clipFinished( self.DpadUp, {} )
				
				self.DpadDown:completeAnimation()
				self.DpadDown:setAlpha( 1 )
				self.clipFinished( self.DpadDown, {} )
				
				self.DpadLeft:completeAnimation()
				self.DpadLeft:setAlpha( 1 )
				self.clipFinished( self.DpadLeft, {} )
				
				self.DpadRight:completeAnimation()
				self.DpadRight:setAlpha( 1 )
				self.clipFinished( self.DpadRight, {} )
				
				self.BBGumRing:completeAnimation()
				self.BBGumRing:setAlpha( 1 )
				self.clipFinished( self.BBGumRing, {} )
				
				self.BBGumTexture:completeAnimation()
				self.BBGumTexture:setAlpha( 1 )
				self.clipFinished( self.BBGumTexture, {} )
				
				self.BBGumCountText:completeAnimation()
				self.BBGumCountText:setAlpha( 1 )
				self.clipFinished( self.BBGumCountText, {} )
				
				self.ShieldHealth:completeAnimation()
				self.ShieldHealth:setAlpha( 1 )
				self.clipFinished( self.ShieldHealth, {} )
				
				self.DpadIconMine:completeAnimation()
				self.DpadIconMine:setAlpha( 1 )
				self.clipFinished( self.DpadIconMine, {} )
				
				self.DpadIconMineCountText:completeAnimation()
				self.DpadIconMineCountText:setAlpha( 1 )
				self.clipFinished( self.DpadIconMineCountText, {} )

				self.SpecialImageBG:completeAnimation()
				self.SpecialImageBG:setAlpha( 1 )
				self.clipFinished( self.SpecialImageBG, {} )

				self.SpecialImage:completeAnimation()
				self.SpecialImage:setAlpha( 1 )
				self.clipFinished( self.SpecialImage, {} )

				self.SpecialMeter:completeAnimation()
				self.SpecialMeter:setAlpha( 1 )
				self.clipFinished( self.SpecialMeter, {} )
				
				self.WeaponName:completeAnimation()
				self.WeaponName:setAlpha( 1 )
				self.clipFinished( self.WeaponName, {} )
				
				self.AmmoEquipment:completeAnimation()
				self.AmmoEquipment:setAlpha( 1 )
				self.clipFinished( self.AmmoEquipment, {} )
				
				self.AmmoInfo:completeAnimation()
				self.AmmoInfo:setAlpha( 1 )
				self.clipFinished( self.AmmoInfo, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 18 )
	
				local DefaultStateTransition = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
	
					element:setAlpha( 0 )
	
					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end

				self.AmmoBG:completeAnimation()
				self.AmmoBG:setAlpha( 1 )
				DefaultStateTransition( self.AmmoBG, {} )
				
				self.DpadBG:completeAnimation()
				self.DpadBG:setAlpha( 1 )
				DefaultStateTransition( self.DpadBG, {} )
				
				self.DpadUp:completeAnimation()
				self.DpadUp:setAlpha( 1 )
				DefaultStateTransition( self.DpadUp, {} )
				
				self.DpadDown:completeAnimation()
				self.DpadDown:setAlpha( 1 )
				DefaultStateTransition( self.DpadDown, {} )
				
				self.DpadLeft:completeAnimation()
				self.DpadLeft:setAlpha( 1 )
				DefaultStateTransition( self.DpadLeft, {} )
				
				self.DpadRight:completeAnimation()
				self.DpadRight:setAlpha( 1 )
				DefaultStateTransition( self.DpadRight, {} )
				
				self.BBGumRing:completeAnimation()
				self.BBGumRing:setAlpha( 1 )
				DefaultStateTransition( self.BBGumRing, {} )
				
				self.BBGumTexture:completeAnimation()
				self.BBGumTexture:setAlpha( 1 )
				DefaultStateTransition( self.BBGumTexture, {} )
				
				self.BBGumCountText:completeAnimation()
				self.BBGumCountText:setAlpha( 1 )
				DefaultStateTransition( self.BBGumCountText, {} )
				
				self.ShieldHealth:completeAnimation()
				self.ShieldHealth:setAlpha( 1 )
				DefaultStateTransition( self.ShieldHealth, {} )
				
				self.DpadIconMine:completeAnimation()
				self.DpadIconMine:setAlpha( 1 )
				DefaultStateTransition( self.DpadIconMine, {} )
				
				self.DpadIconMineCountText:completeAnimation()
				self.DpadIconMineCountText:setAlpha( 1 )
				DefaultStateTransition( self.DpadIconMineCountText, {} )

				self.SpecialImageBG:completeAnimation()
				self.SpecialImageBG:setAlpha( 1 )
				DefaultStateTransition( self.SpecialImageBG, {} )

				self.SpecialImage:completeAnimation()
				self.SpecialImage:setAlpha( 1 )
				DefaultStateTransition( self.SpecialImage, {} )

				self.SpecialMeter:completeAnimation()
				self.SpecialMeter:setAlpha( 1 )
				DefaultStateTransition( self.SpecialMeter, {} )
				
				self.WeaponName:completeAnimation()
				self.WeaponName:setAlpha( 1 )
				DefaultStateTransition( self.WeaponName, {} )
				
				self.AmmoEquipment:completeAnimation()
				self.AmmoEquipment:setAlpha( 1 )
				DefaultStateTransition( self.AmmoEquipment, {} )
				
				self.AmmoInfo:completeAnimation()
				self.AmmoInfo:setAlpha( 1 )
				DefaultStateTransition( self.AmmoInfo, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "HudStart",
			condition = function ( menu, element, event )
				if IsModelValueTrue( controller, "hudItems.playerSpawned" ) then
					if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE )
					and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE )
					and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE )
					and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED )
					and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM )
					and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN )
					and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM )
					and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED )
					and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE )
					and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_SCOPED )
					and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE )
					and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE )
					and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
					and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC )
					and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE ) then
						return true
					else
						return false
					end
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
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.playerSpawned" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.playerSpawned"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.AmmoBG:close()
		element.DpadBG:close()
		element.DpadUp:close()
		element.DpadDown:close()
		element.DpadLeft:close()
		element.DpadRight:close()
		element.BBGumRing:close()
		element.BBGumTexture:close()
		element.BBGumCountText:close()
		element.ShieldHealth:close()
		element.DpadIconMine:close()
		element.DpadIconMineCountText:close()
		element.SpecialImageBG:close()
		element.SpecialImage:close()
		element.SpecialMeter:close()
		element.WeaponName:close()
		element.AmmoEquipment:close()
		element.AmmoInfo:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
