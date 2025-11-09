require( "ui.uieditor.widgets.HUD.T8AmmoWidget.T8AmmoEquipment" )
require( "ui.uieditor.widgets.HUD.T8AmmoWidget.T8AmmoInfo" )
require( "ui.uieditor.widgets.HUD.T8AmmoWidget.T8AmmoWeaponImages" )
require( "ui.uieditor.widgets.HUD.ZM_AmmoWidget.ZmAmmo_BBGumMeterWidget" )

CoD.T8AmmoContainer = InheritFrom( LUI.UIElement )
CoD.T8AmmoContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.T8AmmoContainer )
	self.id = "T8AmmoContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true

    self.AmmoBGGlow = LUI.UIImage.new()
    self.AmmoBGGlow:setLeftRight( false, true, -237, -25.5 )
    self.AmmoBGGlow:setTopBottom( false, true, -96, -23 )
    self.AmmoBGGlow:setImage( RegisterImage( "t8_hud_ammowidget_bg_glow" ) )
    self.AmmoBGGlow:setAlpha( 0.5 )
    self:addElement( self.AmmoBGGlow )

    self.AmmoBG = LUI.UIImage.new()
    self.AmmoBG:setLeftRight( false, true, -237, -25.5 )
    self.AmmoBG:setTopBottom( false, true, -96, -23 )
    self.AmmoBG:setImage( RegisterImage( "t8_hud_ammowidget_bg" ) )
    self:addElement( self.AmmoBG )

	self.AmmoInfo = CoD.T8AmmoInfo.new( menu, controller )
	self.AmmoInfo:setLeftRight( true, true, 0, 0 )
	self.AmmoInfo:setTopBottom( true, true, 0, 0 )
	self:addElement( self.AmmoInfo )

    self.WeaponImage = LUI.UIImage.new()
    self.WeaponImage:setLeftRight( false, true, -212, -98 )
    self.WeaponImage:setTopBottom( false, true, -78.5, -32.5 )
	self.WeaponImage:setImage( RegisterImage( "blacktransparent" ) )
	self.WeaponImage:setScale( 0.75 )
	self.WeaponImage:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.viewmodelWeaponName" ), function ( model )
		local viewmodelWeaponName = Engine.GetModelValue( model )

		if viewmodelWeaponName then
			if viewmodelWeaponName:find( "^" .. "pistol_" )
			or viewmodelWeaponName:find( "^" .. "ar_" )
			or viewmodelWeaponName:find( "^" .. "smg_" )
			or viewmodelWeaponName:find( "^" .. "shotgun_" )
			or viewmodelWeaponName:find( "^" .. "lmg_" )
			or viewmodelWeaponName:find( "^" .. "sniper_" ) then
				if viewmodelWeaponName:find( "_upgraded" ) then
					self.WeaponImage:setImage( RegisterImage( "t7_icon_weapon_" .. tostring( viewmodelWeaponName ):gsub( "_upgraded_zm", "_pu" ) ) )
				else
					self.WeaponImage:setImage( RegisterImage( "t7_icon_weapon_" .. tostring( viewmodelWeaponName ):gsub( "_zm", "_pu" ) ) )
				end
			else
				self.WeaponImage:setImage( RegisterImage( "blacktransparent" ) )
			end

			if CoD.T8AmmoWeaponImages then
				for key, value in pairs( CoD.T8AmmoWeaponImages ) do
					if viewmodelWeaponName == key then
						self.WeaponImage:setImage( RegisterImage( value ) )
					end
				end
			end
		end
	end )
    self:addElement( self.WeaponImage )

	self.WeaponName = LUI.UIText.new()
	self.WeaponName:setLeftRight( false, true, -235, -70 )
	self.WeaponName:setTopBottom( false, true, -80, -70 )
	self.WeaponName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self.WeaponName:setTTF( "fonts/skorzhen.ttf" )
	self.WeaponName:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.weaponName" ), function ( model )
		local weaponName = Engine.GetModelValue( model )

		if weaponName then
			self.WeaponName:setText( Engine.Localize( weaponName ) )
		end
	end )
	self:addElement( self.WeaponName )

	self.BGBBG = LUI.UIImage.new()
	self.BGBBG:setLeftRight( false, true, -154.5, -74.5 )
	self.BGBBG:setTopBottom( false, true, -187.25, -121.25 )
	self.BGBBG:setImage( RegisterImage( "blacktransparent" ) )
	self.BGBBG:setScale( 0.8 )
	self.BGBBG:setYRot( 180 )
	self.BGBBG:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "bgb_display" ), function ( model )
		local bgb_display = Engine.GetModelValue( model )

		if bgb_display then
			if bgb_display > 0 then
				self.BGBBG:setImage( RegisterImage( "t8_hud_bgb_bg" ) )
			else
				self.BGBBG:setImage( RegisterImage( "blacktransparent" ) )
			end
		end
	end )
	self:addElement( self.BGBBG )

	self.BGBFrame = LUI.UIImage.new()
	self.BGBFrame:setLeftRight( false, true, -146.5, -39 )
	self.BGBFrame:setTopBottom( false, true, -183, -125.5 )
	self.BGBFrame:setImage( RegisterImage( "blacktransparent" ) )
	self.BGBFrame:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "bgb_display" ), function ( model )
		local bgb_display = Engine.GetModelValue( model )

		if bgb_display then
			if bgb_display > 0 then
				self.BGBFrame:setImage( RegisterImage( "t8_hud_bgb_frame" ) )
			else
				self.BGBFrame:setImage( RegisterImage( "blacktransparent" ) )
			end
		end
	end )
	self:addElement( self.BGBFrame )
	
	self.BGBMeterBG = LUI.UIImage.new()
	self.BGBMeterBG:setLeftRight( false, true, -92.5, -39.5 )
	self.BGBMeterBG:setTopBottom( false, true, -180, -128 )
	self.BGBMeterBG:setImage( RegisterImage( "blacktransparent" ) )
	self.BGBMeterBG:setYRot( 180 )
	self.BGBMeterBG:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "bgb_display" ), function ( model )
		local bgb_display = Engine.GetModelValue( model )

		if bgb_display then
			if bgb_display > 0 then
				self.BGBMeterBG:setImage( RegisterImage( "t8_hud_bgb_meter_bg" ) )
			else
				self.BGBMeterBG:setImage( RegisterImage( "blacktransparent" ) )
			end
		end
	end )
	self:addElement( self.BGBMeterBG )

	self.BGBWidget = CoD.ZmAmmo_BBGumMeterWidget.new( menu, controller )
	self.BGBWidget:setLeftRight( false, true, -92.5, 0 )
	self.BGBWidget:setTopBottom( false, true, -180, -130.5 )
	self:addElement( self.BGBWidget )

	self.BGBPrompt = LUI.UIText.new()
	self.BGBPrompt:setLeftRight( true, true, 0, -101 )
	self.BGBPrompt:setTopBottom( false, true, -163.5, -142.5 )
	self.BGBPrompt:setText( Engine.Localize( "" ) )
	self.BGBPrompt:setTTF("fonts/ttmussels_demibold.ttf")
	self.BGBPrompt:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	self.BGBPrompt:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "bgb_display" ), function ( model )
		local bgb_display = Engine.GetModelValue( model )

		if bgb_display then
			if bgb_display > 0 then
				self.BGBPrompt:setText( Engine.Localize( "[{+actionslot 1}]" ) )
			else
				self.BGBPrompt:setText( Engine.Localize( "" ) )
			end
		end
	end )
	self:addElement( self.BGBPrompt )

	self.AmmoEquipment = CoD.T8AmmoEquipment.new( menu, controller )
	self.AmmoEquipment:setLeftRight( true, true, 0, 0 )
	self.AmmoEquipment:setTopBottom( true, true, 0, 0 )
	self:addElement( self.AmmoEquipment )

	self.ShieldImage = LUI.UIImage.new()
	self.ShieldImage:setLeftRight( false, true, -475, -421.5 )
	self.ShieldImage:setTopBottom( false, true, -87, -33 )
	self.ShieldImage:setImage( RegisterImage( "blacktransparent" ) )
	self.ShieldImage:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.showDpadDown" ), function ( model )
		local showDpadDown = Engine.GetModelValue( model )

		if showDpadDown == 1 then
			self.ShieldImage:setImage( RegisterImage( "ui_icon_weapons_zm_rocket_shield_health" ) )
		else
			self.ShieldImage:setImage( RegisterImage( "blacktransparent" ) )
		end
	end )
	self:addElement( self.ShieldImage )

	self.ShieldMeterBG = LUI.UIImage.new()
	self.ShieldMeterBG:setLeftRight( false, true, -475, -421.5 )
	self.ShieldMeterBG:setTopBottom( false, true, -45, -28 )
	self.ShieldMeterBG:setImage( RegisterImage( "blacktransparent" ) )
	self.ShieldMeterBG:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.showDpadDown" ), function ( model )
		local showDpadDown = Engine.GetModelValue( model )

		if showDpadDown == 1 then
			self.ShieldMeterBG:setImage( RegisterImage( "t8_hud_shieldmeterbg" ) )
		else
			self.ShieldMeterBG:setImage( RegisterImage( "blacktransparent" ) )
		end
	end )
	self:addElement( self.ShieldMeterBG )

	self.ShieldMeter = LUI.UIImage.new()
	self.ShieldMeter:setLeftRight( false, true, -475, -421.5 )
	self.ShieldMeter:setTopBottom( false, true, -45, -28 )
	self.ShieldMeter:setImage( RegisterImage( "blacktransparent" ) )
	self.ShieldMeter:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	self.ShieldMeter:setRGB( 0.72, 0.72, 0.12 )
	self.ShieldMeter:setShaderVector( 1, 0, 0, 0, 0 )
	self.ShieldMeter:setShaderVector( 2, 1, 0, 0, 0 )
	self.ShieldMeter:setShaderVector( 3, 0, 0, 0, 0 )
	self.ShieldMeter:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.showDpadDown" ), function ( model )
		local showDpadDown = Engine.GetModelValue( model )

		if showDpadDown == 1 then
			self.ShieldMeter:setImage( RegisterImage( "t8_hud_shieldmeter" ) )
		else
			self.ShieldMeter:setImage( RegisterImage( "blacktransparent" ) )
		end
	end )
	self.ShieldMeter:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "ZMInventory.shield_health" ), function ( model )
		local shield_health = Engine.GetModelValue( model )

		if shield_health then
			self.ShieldMeter:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )

			self.ShieldMeter:setShaderVector( 0, AdjustStartEnd( 0, 1,
				CoD.GetVectorComponentFromString( shield_health, 1 ),
				CoD.GetVectorComponentFromString( shield_health, 2 ),
				CoD.GetVectorComponentFromString( shield_health, 3 ),
				CoD.GetVectorComponentFromString( shield_health, 4 ) ) )
		end
	end )
	self:addElement( self.ShieldMeter )

	self.MuleKickIcon = LUI.UIImage.new()
	self.MuleKickIcon:setLeftRight( false, true, -208.5, -182 )
	self.MuleKickIcon:setTopBottom( false, true, -122, -95.5 )
	self.MuleKickIcon:setImage( RegisterImage( "blacktransparent" ) )
	self.MuleKickIcon:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "T8.MuleKick" ), function ( model )
		local mulekick = Engine.GetModelValue( model )

		if mulekick then
			if mulekick == 1 then
				self.MuleKickIcon:setImage( RegisterImage( "specialty_giant_three_guns_zombies" ) )
			else
				self.MuleKickIcon:setImage( RegisterImage( "blacktransparent" ) )
			end
		end
	end )
	self:addElement( self.MuleKickIcon )

	self.AATIcon = LUI.UIImage.new()
	self.AATIcon:setLeftRight( false, true, -177, -146.5 )
	self.AATIcon:setTopBottom( false, true, -123, -96 )
	self.AATIcon:setImage( RegisterImage( "blacktransparent" ) )
	self.AATIcon:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.aatIcon" ), function ( model )
		local aatIcon = Engine.GetModelValue( model )

		if aatIcon then
			self.AATIcon:setImage( RegisterImage( aatIcon ) )
		end
	end )
	self:addElement( self.AATIcon )

	self.AATName = LUI.UIText.new()
	self.AATName:setLeftRight( false, true, -144, 0 )
	self.AATName:setTopBottom( false, true, -115, -101 )
	self.AATName:setText( Engine.Localize( "" ) )
	self.AATName:setTTF( "fonts/skorzhen.ttf" )
	self.AATName:setRGB( 1, 0.86, 0.52 )
	self.AATName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self.AATName:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.aatIcon" ), function ( model )
		local aatIcon = Engine.GetModelValue( model )

		if aatIcon then
			if aatIcon == "t7_icon_zm_aat_blast_furnace" then
				self.AATName:setText( Engine.Localize( "Blast Furnace" ) )

			elseif aatIcon == "t7_icon_zm_aat_dead_wire" then
				self.AATName:setText( Engine.Localize( "Dead Wire" ) )

			elseif aatIcon == "t7_icon_zm_aat_fire_works" then
				self.AATName:setText( Engine.Localize( "Fireworks" ) )

			elseif aatIcon == "t7_icon_zm_aat_thunder_wall" then
				self.AATName:setText( Engine.Localize( "Thunder Wall" ) )

			elseif aatIcon == "t7_icon_zm_aat_turned" then
				self.AATName:setText( Engine.Localize( "Turned" ) )

			else
				self.AATName:setText( Engine.Localize( "" ) )
			end
		end
	end )
	self:addElement( self.AATName )

	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 17 )

				self.AmmoBGGlow:completeAnimation()
				self.AmmoBGGlow:setAlpha( 0 )
				self.clipFinished( self.AmmoBGGlow, {} )

				self.AmmoBG:completeAnimation()
				self.AmmoBG:setAlpha( 0 )
				self.clipFinished( self.AmmoBG, {} )

				self.AmmoInfo:completeAnimation()
				self.AmmoInfo:setAlpha( 0 )
				self.clipFinished( self.AmmoInfo, {} )

				self.WeaponImage:completeAnimation()
				self.WeaponImage:setAlpha( 0 )
				self.clipFinished( self.WeaponImage, {} )

				self.WeaponName:completeAnimation()
				self.WeaponName:setAlpha( 0 )
				self.clipFinished( self.WeaponName, {} )

				self.BGBBG:completeAnimation()
				self.BGBBG:setAlpha( 0 )
				self.clipFinished( self.BGBBG, {} )

				self.BGBFrame:completeAnimation()
				self.BGBFrame:setAlpha( 0 )
				self.clipFinished( self.BGBFrame, {} )

				self.BGBMeterBG:completeAnimation()
				self.BGBMeterBG:setAlpha( 0 )
				self.clipFinished( self.BGBMeterBG, {} )

				self.BGBWidget:completeAnimation()
				self.BGBWidget:setAlpha( 0 )
				self.clipFinished( self.BGBWidget, {} )

				self.BGBPrompt:completeAnimation()
				self.BGBPrompt:setAlpha( 0 )
				self.clipFinished( self.BGBPrompt, {} )

				self.AmmoEquipment:completeAnimation()
				self.AmmoEquipment:setAlpha( 0 )
				self.clipFinished( self.AmmoEquipment, {} )

				self.ShieldImage:completeAnimation()
				self.ShieldImage:setAlpha( 0 )
				self.clipFinished( self.ShieldImage, {} )

				self.ShieldMeterBG:completeAnimation()
				self.ShieldMeterBG:setAlpha( 0 )
				self.clipFinished( self.ShieldMeterBG, {} )

				self.ShieldMeter:completeAnimation()
				self.ShieldMeter:setAlpha( 0 )
				self.clipFinished( self.ShieldMeter, {} )

				self.MuleKickIcon:completeAnimation()
				self.MuleKickIcon:setAlpha( 0 )
				self.clipFinished( self.MuleKickIcon, {} )

				self.AATIcon:completeAnimation()
				self.AATIcon:setAlpha( 0 )
				self.clipFinished( self.AATIcon, {} )

				self.AATName:completeAnimation()
				self.AATName:setAlpha( 0 )
				self.clipFinished( self.AATName, {} )
			end,
			HudStart = function ()
				self:setupElementClipCounter( 17 )

				local AmmoBGGlowHudStartTransition = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
	
					element:setAlpha( 0.5 )
	
					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end

				self.AmmoBGGlow:completeAnimation()
				self.AmmoBGGlow:setAlpha( 0 )
				AmmoBGGlowHudStartTransition( self.AmmoBGGlow, {} )

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
				
				self.AmmoInfo:completeAnimation()
				self.AmmoInfo:setAlpha( 0 )
				HudStartTransition( self.AmmoInfo, {} )
				
				self.WeaponImage:completeAnimation()
				self.WeaponImage:setAlpha( 0 )
				HudStartTransition( self.WeaponImage, {} )
				
				self.WeaponName:completeAnimation()
				self.WeaponName:setAlpha( 0 )
				HudStartTransition( self.WeaponName, {} )
				
				self.BGBBG:completeAnimation()
				self.BGBBG:setAlpha( 0 )
				HudStartTransition( self.BGBBG, {} )
				
				self.BGBFrame:completeAnimation()
				self.BGBFrame:setAlpha( 0 )
				HudStartTransition( self.BGBFrame, {} )
				
				self.BGBMeterBG:completeAnimation()
				self.BGBMeterBG:setAlpha( 0 )
				HudStartTransition( self.BGBMeterBG, {} )
				
				self.BGBWidget:completeAnimation()
				self.BGBWidget:setAlpha( 0 )
				HudStartTransition( self.BGBWidget, {} )
				
				self.BGBPrompt:completeAnimation()
				self.BGBPrompt:setAlpha( 0 )
				HudStartTransition( self.BGBPrompt, {} )
				
				self.AmmoEquipment:completeAnimation()
				self.AmmoEquipment:setAlpha( 0 )
				HudStartTransition( self.AmmoEquipment, {} )
				
				self.ShieldImage:completeAnimation()
				self.ShieldImage:setAlpha( 0 )
				HudStartTransition( self.ShieldImage, {} )
				
				self.ShieldMeterBG:completeAnimation()
				self.ShieldMeterBG:setAlpha( 0 )
				HudStartTransition( self.ShieldMeterBG, {} )
				
				self.ShieldMeter:completeAnimation()
				self.ShieldMeter:setAlpha( 0 )
				HudStartTransition( self.ShieldMeter, {} )
				
				self.MuleKickIcon:completeAnimation()
				self.MuleKickIcon:setAlpha( 0 )
				HudStartTransition( self.MuleKickIcon, {} )
				
				self.AATIcon:completeAnimation()
				self.AATIcon:setAlpha( 0 )
				HudStartTransition( self.AATIcon, {} )
				
				self.AATName:completeAnimation()
				self.AATName:setAlpha( 0 )
				HudStartTransition( self.AATName, {} )
			end
		},
		HudStart = {
			DefaultClip = function ()
				self:setupElementClipCounter( 17 )

				self.AmmoBGGlow:completeAnimation()
				self.AmmoBGGlow:setAlpha( 0.5 )
				self.clipFinished( self.AmmoBGGlow, {} )

				self.AmmoBG:completeAnimation()
				self.AmmoBG:setAlpha( 1 )
				self.clipFinished( self.AmmoBG, {} )

				self.AmmoInfo:completeAnimation()
				self.AmmoInfo:setAlpha( 1 )
				self.clipFinished( self.AmmoInfo, {} )

				self.WeaponImage:completeAnimation()
				self.WeaponImage:setAlpha( 1 )
				self.clipFinished( self.WeaponImage, {} )

				self.WeaponName:completeAnimation()
				self.WeaponName:setAlpha( 1 )
				self.clipFinished( self.WeaponName, {} )

				self.BGBBG:completeAnimation()
				self.BGBBG:setAlpha( 1 )
				self.clipFinished( self.BGBBG, {} )

				self.BGBFrame:completeAnimation()
				self.BGBFrame:setAlpha( 1 )
				self.clipFinished( self.BGBFrame, {} )

				self.BGBMeterBG:completeAnimation()
				self.BGBMeterBG:setAlpha( 1 )
				self.clipFinished( self.BGBMeterBG, {} )

				self.BGBWidget:completeAnimation()
				self.BGBWidget:setAlpha( 1 )
				self.clipFinished( self.BGBWidget, {} )

				self.BGBPrompt:completeAnimation()
				self.BGBPrompt:setAlpha( 1 )
				self.clipFinished( self.BGBPrompt, {} )

				self.AmmoEquipment:completeAnimation()
				self.AmmoEquipment:setAlpha( 1 )
				self.clipFinished( self.AmmoEquipment, {} )

				self.ShieldImage:completeAnimation()
				self.ShieldImage:setAlpha( 1 )
				self.clipFinished( self.ShieldImage, {} )

				self.ShieldMeterBG:completeAnimation()
				self.ShieldMeterBG:setAlpha( 1 )
				self.clipFinished( self.ShieldMeterBG, {} )

				self.ShieldMeter:completeAnimation()
				self.ShieldMeter:setAlpha( 1 )
				self.clipFinished( self.ShieldMeter, {} )

				self.MuleKickIcon:completeAnimation()
				self.MuleKickIcon:setAlpha( 1 )
				self.clipFinished( self.MuleKickIcon, {} )

				self.AATIcon:completeAnimation()
				self.AATIcon:setAlpha( 1 )
				self.clipFinished( self.AATIcon, {} )

				self.AATName:completeAnimation()
				self.AATName:setAlpha( 1 )
				self.clipFinished( self.AATName, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 17 )
				
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

				self.AmmoBGGlow:completeAnimation()
				self.AmmoBGGlow:setAlpha( 0.5 )
				DefaultStateTransition( self.AmmoBGGlow, {} )

				self.AmmoBG:completeAnimation()
				self.AmmoBG:setAlpha( 1 )
				DefaultStateTransition( self.AmmoBG, {} )

				self.AmmoInfo:completeAnimation()
				self.AmmoInfo:setAlpha( 1 )
				DefaultStateTransition( self.AmmoInfo, {} )

				self.WeaponImage:completeAnimation()
				self.WeaponImage:setAlpha( 1 )
				DefaultStateTransition( self.WeaponImage, {} )

				self.WeaponName:completeAnimation()
				self.WeaponName:setAlpha( 1 )
				DefaultStateTransition( self.WeaponName, {} )

				self.BGBBG:completeAnimation()
				self.BGBBG:setAlpha( 1 )
				DefaultStateTransition( self.BGBBG, {} )

				self.BGBFrame:completeAnimation()
				self.BGBFrame:setAlpha( 1 )
				DefaultStateTransition( self.BGBFrame, {} )

				self.BGBMeterBG:completeAnimation()
				self.BGBMeterBG:setAlpha( 1 )
				DefaultStateTransition( self.BGBMeterBG, {} )

				self.BGBWidget:completeAnimation()
				self.BGBWidget:setAlpha( 1 )
				DefaultStateTransition( self.BGBWidget, {} )

				self.BGBPrompt:completeAnimation()
				self.BGBPrompt:setAlpha( 1 )
				DefaultStateTransition( self.BGBPrompt, {} )

				self.AmmoEquipment:completeAnimation()
				self.AmmoEquipment:setAlpha( 1 )
				DefaultStateTransition( self.AmmoEquipment, {} )

				self.ShieldImage:completeAnimation()
				self.ShieldImage:setAlpha( 1 )
				DefaultStateTransition( self.ShieldImage, {} )

				self.ShieldMeterBG:completeAnimation()
				self.ShieldMeterBG:setAlpha( 1 )
				DefaultStateTransition( self.ShieldMeterBG, {} )

				self.ShieldMeter:completeAnimation()
				self.ShieldMeter:setAlpha( 1 )
				DefaultStateTransition( self.ShieldMeter, {} )

				self.MuleKickIcon:completeAnimation()
				self.MuleKickIcon:setAlpha( 1 )
				DefaultStateTransition( self.MuleKickIcon, {} )

				self.AATIcon:completeAnimation()
				self.AATIcon:setAlpha( 1 )
				DefaultStateTransition( self.AATIcon, {} )

				self.AATName:completeAnimation()
				self.AATName:setAlpha( 1 )
				DefaultStateTransition( self.AATName, {} )
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
		element.AmmoBGGlow:close()
		element.AmmoBG:close()
		element.AmmoInfo:close()
		element.WeaponImage:close()
		element.WeaponName:close()
		element.BGBBG:close()
		element.BGBFrame:close()
		element.BGBMeterBG:close()
		element.BGBWidget:close()
		element.BGBPrompt:close()
		element.AmmoEquipment:close()
		element.ShieldImage:close()
		element.ShieldMeterBG:close()
		element.ShieldMeter:close()
		element.MuleKickIcon:close()
		element.AATIcon:close()
		element.AATName:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
