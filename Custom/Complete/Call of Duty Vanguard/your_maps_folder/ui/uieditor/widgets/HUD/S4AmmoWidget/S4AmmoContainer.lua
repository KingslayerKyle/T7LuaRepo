require( "ui.uieditor.widgets.HUD.S4AmmoWidget.S4AmmoEquipment" )
require( "ui.uieditor.widgets.HUD.S4AmmoWidget.S4AmmoInfo" )
require( "ui.uieditor.widgets.HUD.S4AmmoWidget.S4AmmoWeaponImages" )
require( "ui.uieditor.widgets.HUD.ZM_AmmoWidget.ZmAmmo_BBGumMeterWidget" )

CoD.S4AmmoContainer = InheritFrom( LUI.UIElement )
CoD.S4AmmoContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.S4AmmoContainer )
	self.id = "S4AmmoContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true

	self.ZmAmmoBBGumMeterWidget = CoD.ZmAmmo_BBGumMeterWidget.new( menu, controller )
	self.ZmAmmoBBGumMeterWidget:setLeftRight( true, false, 1207, 0 )
	self.ZmAmmoBBGumMeterWidget:setTopBottom( true, false, 554 - 75, 0 )
	self:addElement( self.ZmAmmoBBGumMeterWidget )

	self.AmmoEquipment = CoD.S4AmmoEquipment.new( menu, controller )
	self.AmmoEquipment:setLeftRight( true, true, 0, 0 )
	self.AmmoEquipment:setTopBottom( true, true, 0, 0 )
	self:addElement( self.AmmoEquipment )

	self.AmmoInfo = CoD.S4AmmoInfo.new( menu, controller )
	self.AmmoInfo:setLeftRight( true, true, 0, 0 )
	self.AmmoInfo:setTopBottom( true, true, 0, 0 )
	self:addElement( self.AmmoInfo )

	self.WeaponName = LUI.UIText.new()
	self.WeaponName:setLeftRight( true, true, 0, 2533 )
	self.WeaponName:setTopBottom( false, true, -132, -100 )
	self.WeaponName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self.WeaponName:setTTF( "fonts/main_bold.ttf" )
	self.WeaponName:setScale( 0.5 )
	self.WeaponName:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.weaponName" ), function ( model )
		local weaponName = Engine.GetModelValue( model )

		if weaponName then
			self.WeaponName:setText( Engine.Localize( weaponName ) )
		end
	end )
	self:addElement( self.WeaponName )

	self.AATName = LUI.UIText.new()
	self.AATName:setLeftRight( true, true, 0, 2533 )
	self.AATName:setTopBottom( false, true, -132 + 20, -106 + 20 )
	self.AATName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self.AATName:setTTF( "fonts/main_bold.ttf" )
	self.AATName:setRGB( 0.99, 0.66, 0.29 )
	self.AATName:setScale( 0.5 )
	self.AATName:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.aatIcon" ), function ( model )
		local aatIcon = Engine.GetModelValue( model )
	
		if aatIcon then
			if aatIcon == "t7_icon_zm_aat_blast_furnace" then
				self.AATName:setText( "Blast Furnace" )

			elseif aatIcon == "t7_icon_zm_aat_dead_wire" then
				self.AATName:setText( "Dead Wire" )

			elseif aatIcon == "t7_icon_zm_aat_fire_works" then
				self.AATName:setText( "Fire Works" )

			elseif aatIcon == "t7_icon_zm_aat_thunder_wall" then
				self.AATName:setText( "Thunder Wall" )

			elseif aatIcon == "t7_icon_zm_aat_turned" then
				self.AATName:setText( "Turned" )

			else
				self.AATName:setText( "" )
			end
		end
	end )
	self:addElement( self.AATName )

	self.PAPImage = LUI.UIImage.new()
    self.PAPImage:setLeftRight( false, true, -326, -304 )
    self.PAPImage:setTopBottom( false, true, -59, -37 )
	self.PAPImage:setImage( RegisterImage( "blacktransparent" ) )
	self.PAPImage:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.viewmodelWeaponName" ), function ( model )
		local viewmodelWeaponName = Engine.GetModelValue( model )
		
		if viewmodelWeaponName then
			if viewmodelWeaponName:find( "_upgraded" )
			or viewmodelWeaponName:sub( -3 ) == "_up" then
				self.PAPImage:setImage( RegisterImage( "v_ui_icon_pap_white" ) )
			else
				self.PAPImage:setImage( RegisterImage( "blacktransparent" ) )
			end
		end
	end )
	self:addElement( self.PAPImage )

	self.WeaponImage = LUI.UIImage.new()
    self.WeaponImage:setLeftRight( false, true, -336, -205.5 )
    self.WeaponImage:setTopBottom( false, true, -88.5, -31.5 )
	self.WeaponImage:setImage( RegisterImage( "blacktransparent" ) )
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

			if CoD.S4AmmoWeaponImages then
				for key, value in pairs( CoD.S4AmmoWeaponImages ) do
					if viewmodelWeaponName == key then
						self.WeaponImage:setImage( RegisterImage( value ) )
					end
				end
			end
		end
	end )
    self:addElement( self.WeaponImage )

	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				self.ZmAmmoBBGumMeterWidget:completeAnimation()
				self.ZmAmmoBBGumMeterWidget:setAlpha( 0 )
				self.clipFinished( self.ZmAmmoBBGumMeterWidget, {} )

				self.AmmoEquipment:completeAnimation()
				self.AmmoEquipment:setAlpha( 0 )
				self.clipFinished( self.AmmoEquipment, {} )

				self.AmmoInfo:completeAnimation()
				self.AmmoInfo:setAlpha( 0 )
				self.clipFinished( self.AmmoInfo, {} )

				self.WeaponName:completeAnimation()
				self.WeaponName:setAlpha( 0 )
				self.clipFinished( self.WeaponName, {} )

				self.AATName:completeAnimation()
				self.AATName:setAlpha( 0 )
				self.clipFinished( self.AATName, {} )

				self.PAPImage:completeAnimation()
				self.PAPImage:setAlpha( 0 )
				self.clipFinished( self.PAPImage, {} )

				self.WeaponImage:completeAnimation()
				self.WeaponImage:setAlpha( 0 )
				self.clipFinished( self.WeaponImage, {} )
			end,
			HudStart = function ()
				self:setupElementClipCounter( 7 )

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

				self.ZmAmmoBBGumMeterWidget:completeAnimation()
				self.ZmAmmoBBGumMeterWidget:setAlpha( 0 )
				HudStartTransition( self.ZmAmmoBBGumMeterWidget, {} )

				self.AmmoEquipment:completeAnimation()
				self.AmmoEquipment:setAlpha( 0 )
				HudStartTransition( self.AmmoEquipment, {} )

				self.AmmoInfo:completeAnimation()
				self.AmmoInfo:setAlpha( 0 )
				HudStartTransition( self.AmmoInfo, {} )

				self.WeaponName:completeAnimation()
				self.WeaponName:setAlpha( 0 )
				HudStartTransition( self.WeaponName, {} )

				self.AATName:completeAnimation()
				self.AATName:setAlpha( 0 )
				HudStartTransition( self.AATName, {} )

				self.PAPImage:completeAnimation()
				self.PAPImage:setAlpha( 0 )
				HudStartTransition( self.PAPImage, {} )

				self.WeaponImage:completeAnimation()
				self.WeaponImage:setAlpha( 0 )
				HudStartTransition( self.WeaponImage, {} )
			end
		},
		HudStart = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				self.ZmAmmoBBGumMeterWidget:completeAnimation()
				self.ZmAmmoBBGumMeterWidget:setAlpha( 1 )
				self.clipFinished( self.ZmAmmoBBGumMeterWidget, {} )

				self.AmmoEquipment:completeAnimation()
				self.AmmoEquipment:setAlpha( 1 )
				self.clipFinished( self.AmmoEquipment, {} )

				self.AmmoInfo:completeAnimation()
				self.AmmoInfo:setAlpha( 1 )
				self.clipFinished( self.AmmoInfo, {} )

				self.WeaponName:completeAnimation()
				self.WeaponName:setAlpha( 1 )
				self.clipFinished( self.WeaponName, {} )

				self.AATName:completeAnimation()
				self.AATName:setAlpha( 1 )
				self.clipFinished( self.AATName, {} )

				self.PAPImage:completeAnimation()
				self.PAPImage:setAlpha( 1 )
				self.clipFinished( self.PAPImage, {} )

				self.WeaponImage:completeAnimation()
				self.WeaponImage:setAlpha( 1 )
				self.clipFinished( self.WeaponImage, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 7 )
				
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

				self.ZmAmmoBBGumMeterWidget:completeAnimation()
				self.ZmAmmoBBGumMeterWidget:setAlpha( 1 )
				DefaultStateTransition( self.ZmAmmoBBGumMeterWidget, {} )

				self.AmmoEquipment:completeAnimation()
				self.AmmoEquipment:setAlpha( 1 )
				DefaultStateTransition( self.AmmoEquipment, {} )

				self.AmmoInfo:completeAnimation()
				self.AmmoInfo:setAlpha( 1 )
				DefaultStateTransition( self.AmmoInfo, {} )

				self.WeaponName:completeAnimation()
				self.WeaponName:setAlpha( 1 )
				DefaultStateTransition( self.WeaponName, {} )

				self.AATName:completeAnimation()
				self.AATName:setAlpha( 1 )
				DefaultStateTransition( self.AATName, {} )

				self.PAPImage:completeAnimation()
				self.PAPImage:setAlpha( 1 )
				DefaultStateTransition( self.PAPImage, {} )

				self.WeaponImage:completeAnimation()
				self.WeaponImage:setAlpha( 1 )
				DefaultStateTransition( self.WeaponImage, {} )
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
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.playerSpawned" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.playerSpawned"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ZmAmmoBBGumMeterWidget:close()
		element.AmmoEquipment:close()
		element.AmmoInfo:close()
		element.WeaponName:close()
		element.AATName:close()
		element.PAPImage:close()
		element.WeaponImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
