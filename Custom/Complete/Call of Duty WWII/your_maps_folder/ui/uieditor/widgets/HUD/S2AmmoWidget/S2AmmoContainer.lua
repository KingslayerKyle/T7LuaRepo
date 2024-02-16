require( "ui.uieditor.widgets.HUD.S2AmmoWidget.S2AmmoEquipment" )
require( "ui.uieditor.widgets.HUD.S2AmmoWidget.S2AmmoInfo" )
require( "ui.uieditor.widgets.HUD.ZM_AmmoWidget.ZmAmmo_BBGumMeterWidget" )

CoD.S2AmmoContainer = InheritFrom( LUI.UIElement )
CoD.S2AmmoContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.S2AmmoContainer )
	self.id = "S2AmmoContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true

	self.AmmoInfo = CoD.S2AmmoInfo.new( menu, controller )
	self.AmmoInfo:setLeftRight( true, true, 0, 0 )
	self.AmmoInfo:setTopBottom( true, true, 0, 0 )
	self:addElement( self.AmmoInfo )

	self.WeaponNameShadow = LUI.UIText.new()
	self.WeaponNameShadow:setLeftRight( true, true, 0, -112 )
	self.WeaponNameShadow:setTopBottom( false, true, -100.5, -87.5 )
	self.WeaponNameShadow:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	self.WeaponNameShadow:setTTF( "fonts/dinnextltpro-regular.ttf" )
	self.WeaponNameShadow:setRGB( 0.11, 0.11, 0.11 )
	self.WeaponNameShadow:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.weaponName" ), function ( model )
		local weaponName = Engine.GetModelValue( model )

		if weaponName then
			self.WeaponNameShadow:setText( Engine.Localize( weaponName ) )
		end
	end )
	self:addElement( self.WeaponNameShadow )

	self.WeaponName = LUI.UIText.new()
	self.WeaponName:setLeftRight( true, true, 0, -111.5 )
	self.WeaponName:setTopBottom( false, true, -101, -88 )
	self.WeaponName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	self.WeaponName:setTTF( "fonts/dinnextltpro-regular.ttf" )
	self.WeaponName:setRGB( 0.66, 0.66, 0.66 )
	self.WeaponName:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.weaponName" ), function ( model )
		local weaponName = Engine.GetModelValue( model )

		if weaponName then
			self.WeaponName:setText( Engine.Localize( weaponName ) )
		end
	end )
	self:addElement( self.WeaponName )

	self.BGBWidget = CoD.ZmAmmo_BBGumMeterWidget.new( menu, controller )
	self.BGBWidget:setLeftRight( false, true, -92.5, 0 )
	self.BGBWidget:setTopBottom( false, true, -250, -200 )
	self:addElement( self.BGBWidget )

	self.BGBPromptShadow = LUI.UIText.new()
	self.BGBPromptShadow:setLeftRight( true, true, 0, -100.5 )
	self.BGBPromptShadow:setTopBottom( false, true, -234.5, -214.5 )
	self.BGBPromptShadow:setText( Engine.Localize( "" ) )
	self.BGBPromptShadow:setTTF("fonts/dinnextltpro-regular.ttf")
	self.BGBPromptShadow:setRGB( 0.11, 0.11, 0.11 )
	self.BGBPromptShadow:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	self.BGBPromptShadow:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "bgb_display" ), function ( model )
		local bgb_display = Engine.GetModelValue( model )

		if bgb_display then
			if Engine.LastInput_Gamepad() then
				self.BGBPromptShadow:setText( Engine.Localize( "" ) )
			else
				if bgb_display == 1 then
					self.BGBPromptShadow:setText( Engine.Localize( "[{+actionslot 1}]" ) )
				else
					self.BGBPromptShadow:setText( Engine.Localize( "" ) )
				end
			end
		end
	end )
	self:addElement( self.BGBPromptShadow )

	self.BGBPrompt = LUI.UIText.new()
	self.BGBPrompt:setLeftRight( true, true, 0, -100 )
	self.BGBPrompt:setTopBottom( false, true, -235, -215 )
	self.BGBPrompt:setText( Engine.Localize( "" ) )
	self.BGBPrompt:setTTF("fonts/dinnextltpro-regular.ttf")
	self.BGBPrompt:setRGB( 0.65, 0.63, 0.57 )
	self.BGBPrompt:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	self.BGBPrompt:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "bgb_display" ), function ( model )
		local bgb_display = Engine.GetModelValue( model )

		if bgb_display then
			if bgb_display == 1 then
				self.BGBPrompt:setText( Engine.Localize( "[{+actionslot 1}]" ) )
			else
				self.BGBPrompt:setText( Engine.Localize( "" ) )
			end
		end
	end )
	self:addElement( self.BGBPrompt )

	self.AmmoEquipment = CoD.S2AmmoEquipment.new( menu, controller )
	self.AmmoEquipment:setLeftRight( true, true, 0, 0 )
	self.AmmoEquipment:setTopBottom( true, true, 0, 0 )
	self:addElement( self.AmmoEquipment )

	self.MuleKickIcon = LUI.UIImage.new()
	self.MuleKickIcon:setLeftRight( false, true, -173.5, -150.5 )
	self.MuleKickIcon:setTopBottom( false, true, -80, -57 )
	self.MuleKickIcon:setImage( RegisterImage( "blacktransparent" ) )
	self.MuleKickIcon:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "S2.MuleKick" ), function ( model )
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
	self.AATIcon:setLeftRight( false, true, -137.5, -114.5 )
	self.AATIcon:setTopBottom( false, true, -80, -57 )
	self.AATIcon:setImage( RegisterImage( "blacktransparent" ) )
	self.AATIcon:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.aatIcon" ), function ( model )
		local aatIcon = Engine.GetModelValue( model )

		if aatIcon then
			self.AATIcon:setImage( RegisterImage( aatIcon ) )
		end
	end )
	self:addElement( self.AATIcon )

	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )

				self.AmmoInfo:completeAnimation()
				self.AmmoInfo:setAlpha( 0 )
				self.clipFinished( self.AmmoInfo, {} )
				
				self.WeaponNameShadow:completeAnimation()
				self.WeaponNameShadow:setAlpha( 0 )
				self.clipFinished( self.WeaponNameShadow, {} )
				
				self.WeaponName:completeAnimation()
				self.WeaponName:setAlpha( 0 )
				self.clipFinished( self.WeaponName, {} )
				
				self.BGBWidget:completeAnimation()
				self.BGBWidget:setAlpha( 0 )
				self.clipFinished( self.BGBWidget, {} )
				
				self.BGBPromptShadow:completeAnimation()
				self.BGBPromptShadow:setAlpha( 0 )
				self.clipFinished( self.BGBPromptShadow, {} )

				self.BGBPrompt:completeAnimation()
				self.BGBPrompt:setAlpha( 0 )
				self.clipFinished( self.BGBPrompt, {} )
				
				self.AmmoEquipment:completeAnimation()
				self.AmmoEquipment:setAlpha( 0 )
				self.clipFinished( self.AmmoEquipment, {} )
				
				self.MuleKickIcon:completeAnimation()
				self.MuleKickIcon:setAlpha( 0 )
				self.clipFinished( self.MuleKickIcon, {} )
				
				self.AATIcon:completeAnimation()
				self.AATIcon:setAlpha( 0 )
				self.clipFinished( self.AATIcon, {} )
			end,
			HudStart = function ()
				self:setupElementClipCounter( 9 )
	
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

				self.AmmoInfo:completeAnimation()
				self.AmmoInfo:setAlpha( 0 )
				HudStartTransition( self.AmmoInfo, {} )
				
				self.WeaponNameShadow:completeAnimation()
				self.WeaponNameShadow:setAlpha( 0 )
				HudStartTransition( self.WeaponNameShadow, {} )
				
				self.WeaponName:completeAnimation()
				self.WeaponName:setAlpha( 0 )
				HudStartTransition( self.WeaponName, {} )
				
				self.BGBWidget:completeAnimation()
				self.BGBWidget:setAlpha( 0 )
				HudStartTransition( self.BGBWidget, {} )
				
				self.BGBPromptShadow:completeAnimation()
				self.BGBPromptShadow:setAlpha( 0 )
				HudStartTransition( self.BGBPromptShadow, {} )

				self.BGBPrompt:completeAnimation()
				self.BGBPrompt:setAlpha( 0 )
				HudStartTransition( self.BGBPrompt, {} )
				
				self.AmmoEquipment:completeAnimation()
				self.AmmoEquipment:setAlpha( 0 )
				HudStartTransition( self.AmmoEquipment, {} )
				
				self.MuleKickIcon:completeAnimation()
				self.MuleKickIcon:setAlpha( 0 )
				HudStartTransition( self.MuleKickIcon, {} )
				
				self.AATIcon:completeAnimation()
				self.AATIcon:setAlpha( 0 )
				HudStartTransition( self.AATIcon, {} )
			end
		},
		HudStart = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )

				self.AmmoInfo:completeAnimation()
				self.AmmoInfo:setAlpha( 1 )
				self.clipFinished( self.AmmoInfo, {} )
				
				self.WeaponNameShadow:completeAnimation()
				self.WeaponNameShadow:setAlpha( 1 )
				self.clipFinished( self.WeaponNameShadow, {} )
				
				self.WeaponName:completeAnimation()
				self.WeaponName:setAlpha( 1 )
				self.clipFinished( self.WeaponName, {} )
				
				self.BGBWidget:completeAnimation()
				self.BGBWidget:setAlpha( 1 )
				self.clipFinished( self.BGBWidget, {} )
				
				self.BGBPromptShadow:completeAnimation()
				self.BGBPromptShadow:setAlpha( 1 )
				self.clipFinished( self.BGBPromptShadow, {} )

				self.BGBPrompt:completeAnimation()
				self.BGBPrompt:setAlpha( 1 )
				self.clipFinished( self.BGBPrompt, {} )
				
				self.AmmoEquipment:completeAnimation()
				self.AmmoEquipment:setAlpha( 1 )
				self.clipFinished( self.AmmoEquipment, {} )
				
				self.MuleKickIcon:completeAnimation()
				self.MuleKickIcon:setAlpha( 1 )
				self.clipFinished( self.MuleKickIcon, {} )
				
				self.AATIcon:completeAnimation()
				self.AATIcon:setAlpha( 1 )
				self.clipFinished( self.AATIcon, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 9 )
	
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

				self.AmmoInfo:completeAnimation()
				self.AmmoInfo:setAlpha( 1 )
				DefaultStateTransition( self.AmmoInfo, {} )

				self.WeaponNameShadow:completeAnimation()
				self.WeaponNameShadow:setAlpha( 1 )
				DefaultStateTransition( self.WeaponNameShadow, {} )

				self.WeaponName:completeAnimation()
				self.WeaponName:setAlpha( 1 )
				DefaultStateTransition( self.WeaponName, {} )

				self.BGBWidget:completeAnimation()
				self.BGBWidget:setAlpha( 1 )
				DefaultStateTransition( self.BGBWidget, {} )

				self.BGBPromptShadow:completeAnimation()
				self.BGBPromptShadow:setAlpha( 1 )
				DefaultStateTransition( self.BGBPromptShadow, {} )

				self.BGBPrompt:completeAnimation()
				self.BGBPrompt:setAlpha( 1 )
				DefaultStateTransition( self.BGBPrompt, {} )

				self.AmmoEquipment:completeAnimation()
				self.AmmoEquipment:setAlpha( 1 )
				DefaultStateTransition( self.AmmoEquipment, {} )

				self.MuleKickIcon:completeAnimation()
				self.MuleKickIcon:setAlpha( 1 )
				DefaultStateTransition( self.MuleKickIcon, {} )

				self.AATIcon:completeAnimation()
				self.AATIcon:setAlpha( 1 )
				DefaultStateTransition( self.AATIcon, {} )
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
		element.AmmoInfo:close()
		element.WeaponNameShadow:close()
		element.WeaponName:close()
		element.BGBWidget:close()
		element.BGBPromptShadow:close()
		element.BGBPrompt:close()
		element.AmmoEquipment:close()
		element.MuleKickIcon:close()
		element.AATIcon:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
