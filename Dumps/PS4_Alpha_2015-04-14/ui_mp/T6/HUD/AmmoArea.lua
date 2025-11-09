CoD.AmmoArea = {}
CoD.AmmoArea.Right = -28
CoD.AmmoArea.Bottom = -7
CoD.AmmoArea.FireRateMaterials = {}
CoD.AmmoArea.FireRateRight = 0
CoD.AmmoArea.LowAmmoPulseDuration = 500
CoD.AmmoArea.WeaponLabelRight = CoD.AmmoArea.FireRateRight - 15
CoD.AmmoArea.WeaponLabelRightOffset = 58
CoD.AmmoArea.WeaponLabelSpacing = -98
CoD.AmmoArea.WeaponFontName = "SmallItalic"
CoD.AmmoArea.WeaponSelectionDelay = 2000
CoD.AmmoArea.WeaponSelectionDuration = 100
CoD.AmmoArea.AttachmentMoveDuration = 200
CoD.AmmoArea.StencilRightOffset = -45
CoD.AmmoArea.AttachmentCount = 4
LUI.createMenu.AmmoArea = function ( controller )
	CoD.AmmoArea.RegisterMaterials()
	local self = CoD.Menu.NewSafeAreaFromState( "AmmoArea", controller )
	self.scaleContainer = CoD.SplitscreenScaler.new( nil, CoD.SplitscreenMultiplier )
	self.scaleContainer:setLeftRight( false, true, 0, 0 )
	self.scaleContainer:setTopBottom( false, true, 0, 0 )
	self:addElement( self.scaleContainer )
	local rotationContainer = LUI.UIElement.new( {
		leftAnchor = false,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0,
		xRot = 0,
		yRot = 0,
		zRot = 0
	} )
	self.scaleContainer:addElement( rotationContainer )
	local oldSelf = self
	self = rotationContainer
	local backgroundRight = CoD.AmmoArea.Right + 25
	local backgroundBottom = 22
	local backgroundBlend = LUI.UIImage.new()
	backgroundBlend:setLeftRight( false, true, backgroundRight, backgroundRight - 300 )
	backgroundBlend:setTopBottom( false, true, backgroundBottom - 150, backgroundBottom )
	backgroundBlend:setImage( RegisterMaterial( "hud_mp_vis_right_lower_white" ) )
	self:addElement( backgroundBlend )
	local background = LUI.UIImage.new()
	background:setLeftRight( false, true, backgroundRight, backgroundRight - 300 )
	background:setTopBottom( false, true, backgroundBottom - 150, backgroundBottom )
	background:setImage( RegisterMaterial( "hud_mp_vis_right_lower" ) )
	self:addElement( background )
	local altFireRight = CoD.AmmoArea.Right - 118
	local altFireBottom = CoD.AmmoArea.Bottom + 22
	local altFireSize = 64
	self.altFireImage = LUI.UIImage.new()
	self.altFireImage:setLeftRight( false, true, altFireRight - altFireSize, altFireRight )
	self.altFireImage:setTopBottom( false, true, altFireBottom - altFireSize, altFireBottom )
	self.altFireImage:setAlpha( 0 )
	self:addElement( self.altFireImage )
	local altFireArrowRight = altFireRight - 64
	local altFireArrowBottom = CoD.AmmoArea.Bottom + 6
	self.altFireArrow = LUI.UIImage.new()
	self.altFireArrow:setLeftRight( false, true, altFireArrowRight, altFireArrowRight - 32 )
	self.altFireArrow:setTopBottom( false, true, altFireArrowBottom, altFireArrowBottom - 32 )
	self.altFireArrow:setImage( RegisterMaterial( "hud_mp_vis_ks_dpad_arrow" ) )
	self.altFireArrow:setAlpha( 0 )
	self:addElement( self.altFireArrow )
	if CoD.isPC then
		self.isPromptEnabled = false
		self.altFireKeyPrompt = LUI.UIText.new()
		self.altFireKeyPrompt:setLeftRight( false, true, altFireArrowRight - 160, altFireArrowRight )
		self.altFireKeyPrompt:setTopBottom( false, true, altFireArrowBottom - 3 - CoD.textSize.Default + 4, altFireArrowBottom - 3 )
		self.altFireKeyPrompt:setRGB( CoD.yellowGlow.r, CoD.yellowGlow.g, CoD.yellowGlow.b )
		self.altFireKeyPrompt:setFont( CoD.fonts.Condensed )
		self.altFireKeyPrompt:setAlpha( 0 )
		self.altFireKeyPrompt:setAlignment( LUI.Alignment.Right )
		self:addElement( self.altFireKeyPrompt )
		self:registerEventHandler( "input_source_changed", CoD.AmmoArea.InputSourceChanged )
		if CoD.useController and Engine.LastInput_Gamepad() then
			CoD.AmmoArea.InputSourceChanged( self, {
				source = 0
			} )
		else
			CoD.AmmoArea.InputSourceChanged( self, {
				source = 1
			} )
		end
	end
	local grenadesRight = CoD.AmmoArea.Right - 40
	local grenadesBottom = CoD.AmmoArea.Bottom
	local lethalGrenades = CoD.OffhandIcons.new( "lethal", {
		left = grenadesRight - CoD.OffhandIcons.Width,
		top = grenadesBottom - CoD.OffhandIcons.Size,
		right = grenadesRight,
		bottom = grenadesBottom,
		leftAnchor = false,
		topAnchor = false,
		rightAnchor = true,
		bottomAnchor = true
	} )
	self:addElement( lethalGrenades )
	grenadesRight = CoD.AmmoArea.Right - 94
	local tacticalGrenades = CoD.OffhandIcons.new( "tactical", {
		left = grenadesRight - CoD.OffhandIcons.Width,
		top = grenadesBottom - CoD.OffhandIcons.Size,
		right = grenadesRight,
		bottom = grenadesBottom,
		leftAnchor = false,
		topAnchor = false,
		rightAnchor = true,
		bottomAnchor = true
	} )
	self:addElement( tacticalGrenades )
	local ammoNumberTop = CoD.AmmoArea.Bottom + CoD.HUDDigit.BigBottomNumbersY
	local ammoNumberWidth = CoD.HUDDigit.Width
	local ammoNumberHeight = CoD.HUDDigit.BigNumbersHeight
	local ammoNumberSpacing = CoD.HUDDigit.Spacing
	self.ammoDigits = {}
	for i = 1, 11, 1 do
		local f1_local2 = i
		local digit = CoD.HUDDigit.new()
		digit:setLeftRight( false, true, -ammoNumberWidth, 0 )
		digit:setTopBottom( false, true, ammoNumberTop, ammoNumberTop + ammoNumberHeight )
		digit:setAlpha( 0 )
		self:addElement( digit )
		table.insert( self.ammoDigits, digit )
	end
	local fireRateRight = CoD.AmmoArea.Right + CoD.AmmoArea.FireRateRight
	local fireRateBottom = CoD.AmmoArea.Bottom - 47
	self.fireRateImage = LUI.UIImage.new()
	self.fireRateImage:setLeftRight( false, true, fireRateRight - 64, fireRateRight )
	self.fireRateImage:setTopBottom( false, true, fireRateBottom - 64, fireRateBottom )
	self.fireRateImage:setImage( CoD.AmmoArea.FireRateMaterials[1] )
	self.fireRateImage:registerAnimationState( "show", {
		alpha = 1
	} )
	self:addElement( self.fireRateImage )
	local fireRateImageWidth = CoD.AmmoArea.StencilRightOffset + CoD.AmmoArea.WeaponLabelRight
	local weaponLabelRight = CoD.AmmoArea.Right + CoD.AmmoArea.WeaponLabelRight + CoD.AmmoArea.WeaponLabelRightOffset + CoD.AmmoArea.StencilRightOffset
	local weaponLabelBottom = fireRateBottom
	self.weaponStencilContainer = LUI.UIElement.new()
	self.weaponStencilContainer:setLeftRight( false, true, -500 + fireRateImageWidth + weaponLabelRight, weaponLabelRight )
	self.weaponStencilContainer:setTopBottom( false, true, weaponLabelBottom - 64, weaponLabelBottom )
	self:addElement( self.weaponStencilContainer )
	self.customizedLabelContainer = CoD.AmmoArea.CreateWeaponLabelContainer( 6 )
	self.customizedLabelContainer:setAlpha( 0 )
	self.weaponStencilContainer:addElement( self.customizedLabelContainer )
	self.weaponLabelContainer = CoD.AmmoArea.CreateWeaponLabelContainer( 5 )
	self.weaponLabelContainer:setAlpha( 0 )
	self.weaponStencilContainer:addElement( self.weaponLabelContainer )
	self.attachmentLabelContainer = {}
	self.attachmentLabelContainer[1] = CoD.AmmoArea.CreateWeaponLabelContainer( 4 )
	self.attachmentLabelContainer[1]:setAlpha( 0 )
	self.weaponStencilContainer:addElement( self.attachmentLabelContainer[1] )
	self.attachmentLabelContainer[2] = CoD.AmmoArea.CreateWeaponLabelContainer( 3 )
	self.attachmentLabelContainer[2]:setAlpha( 0 )
	self.weaponStencilContainer:addElement( self.attachmentLabelContainer[2] )
	self.attachmentLabelContainer[3] = CoD.AmmoArea.CreateWeaponLabelContainer( 2 )
	self.attachmentLabelContainer[3]:setAlpha( 0 )
	self.weaponStencilContainer:addElement( self.attachmentLabelContainer[3] )
	self.attachmentLabelContainer[4] = CoD.AmmoArea.CreateWeaponLabelContainer( 1 )
	self.attachmentLabelContainer[4]:setAlpha( 0 )
	self.weaponStencilContainer:addElement( self.attachmentLabelContainer[4] )
	self:registerEventHandler( "hud_update_actionslots", CoD.AmmoArea.UpdateActionSlots )
	self:registerEventHandler( "hud_update_ammo", CoD.AmmoArea.UpdateAmmo )
	self:registerEventHandler( "hud_update_weapon", CoD.AmmoArea.UpdateWeapon )
	self:registerEventHandler( "hud_update_weapon_select", CoD.AmmoArea.UpdateWeaponSelect )
	self:registerEventHandler( "weapon_selection_done", CoD.AmmoArea.SwitchToCustomized )
	self:registerEventHandler( "hud_update_refresh", CoD.AmmoArea.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE, CoD.AmmoArea.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE, CoD.AmmoArea.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM, CoD.AmmoArea.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN, CoD.AmmoArea.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_IN_VEHICLE, CoD.AmmoArea.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE, CoD.AmmoArea.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC, CoD.AmmoArea.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_AMMO_COUNTER_HIDE, CoD.AmmoArea.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED, CoD.AmmoArea.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_UI_ACTIVE, CoD.AmmoArea.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT, CoD.AmmoArea.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN, CoD.AmmoArea.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_GAME_ENDED, CoD.AmmoArea.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_PLAYER_DEAD, CoD.AmmoArea.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE, CoD.AmmoArea.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_SELECTING_LOCATION, CoD.AmmoArea.UpdateVisibility )
	self:setAlpha( 0 )
	return oldSelf
end

CoD.AmmoArea.CreateWeaponLabelText = function ()
	local weaponFontName = CoD.AmmoArea.WeaponFontName
	local weaponFont = CoD.fonts[weaponFontName]
	local weaponTextSize = CoD.textSize[weaponFontName]
	local weaponText = LUI.UIText.new()
	weaponText:setLeftRight( true, true, -1, -1 )
	weaponText:setTopBottom( false, false, -weaponTextSize / 2, weaponTextSize / 2 )
	weaponText:setRGB( 0, 0, 0 )
	weaponText:setAlpha( 0.5 )
	weaponText:setFont( weaponFont )
	return weaponText
end

CoD.AmmoArea.CreateWeaponLabelContainer = function ( priority )
	local label = LUI.UIElement.new()
	label:setLeftRight( true, true, 0, 0 )
	label:setTopBottom( true, true, 0, 0 )
	label:setPriority( priority )
	local image_element = LUI.UIImage.new()
	image_element:setLeftRight( true, false, 0, 64 )
	image_element:setTopBottom( true, true, 0, 0 )
	image_element:setImage( RegisterMaterial( "hud_mp_vis_gun_title_left" ) )
	label:addElement( image_element )
	image_element = LUI.UIImage.new()
	image_element:setLeftRight( true, true, 64, -64 )
	image_element:setTopBottom( true, true, 0, 0 )
	image_element:setImage( RegisterMaterial( "hud_mp_vis_gun_title_mid" ) )
	label:addElement( image_element )
	image_element = LUI.UIImage.new()
	image_element:setLeftRight( false, true, -64, 0 )
	image_element:setTopBottom( true, true, 0, 0 )
	image_element:setImage( RegisterMaterial( "hud_mp_vis_gun_title_right" ) )
	label:addElement( image_element )
	label.weaponText = CoD.AmmoArea.CreateWeaponLabelText()
	label:addElement( label.weaponText )
	return label
end

CoD.AmmoArea.GetThreeDigits = function ( number )
	local hundreds = math.floor( number / 100 )
	number = number - hundreds * 100
	local tens = math.floor( number / 10 )
	return hundreds, tens, number - tens * 10
end

CoD.AmmoArea.UpdateActionSlots = function ( self, event )
	local actionSlotData = event.actionSlotData
	self.altFireImage:beginAnimation( "fade", 250 )
	self.altFireArrow:beginAnimation( "fade", 250 )
	if actionSlotData and actionSlotData[3] then
		self.altFireImage:setImage( actionSlotData[3].material )
		self.altFireImage:setAlpha( 1 )
		if CoD.isPC then
			self.isPromptEnabled = true
			if CoD.useController and Engine.LastInput_Gamepad() then
				CoD.AmmoArea.InputSourceChanged( self, {
					source = 0
				} )
			else
				CoD.AmmoArea.InputSourceChanged( self, {
					source = 1
				} )
			end
		else
			self.altFireArrow:setAlpha( 1 )
		end
	else
		self.altFireImage:setAlpha( 0 )
		self.altFireArrow:setAlpha( 0 )
		if CoD.isPC then
			self.isPromptEnabled = false
			self.altFireKeyPrompt:setAlpha( 0 )
		end
	end
end

CoD.AmmoArea.UpdateAmmo = function ( self, event )
	local numDigits = #self.ammoDigits
	if self.hideAmmo then
		for i = 1, numDigits, 1 do
			self.ammoDigits[i]:setAlpha( 0 )
		end
		return 
	else
		local lowClip = event.lowClip
		local numberRight = CoD.AmmoArea.Right - 20
		local ammoNumberWidth = CoD.HUDDigit.Width
		local ammoNumberSpacing = CoD.HUDDigit.Spacing
		local ammoNumberTop = CoD.HUDDigit.BigBottomNumbersY
		local ammoNumberHeight = CoD.HUDDigit.BigNumbersHeight
		local stockNumberWidth = ammoNumberWidth * CoD.HUDDigit.SmallDigitScale
		local stockNumberSpacing = ammoNumberSpacing * CoD.HUDDigit.SmallDigitScale
		local stockNumberTop = ammoNumberTop + CoD.HUDDigit.SmallDigitHeightDifference
		local stockNumberHeight = ammoNumberHeight * CoD.HUDDigit.SmallDigitScale
		local hundreds, tens, ones = CoD.AmmoArea.GetThreeDigits( event.ammoStock )
		local digitsUsed = 1
		self.ammoDigits[1]:setDigit( ones )
		self.ammoDigits[1]:setLeftRight( false, true, numberRight - stockNumberWidth, numberRight )
		self.ammoDigits[1]:setTopBottom( false, true, stockNumberTop, stockNumberTop + stockNumberHeight )
		numberRight = numberRight - stockNumberSpacing
		if hundreds > 0 or tens > 0 then
			self.ammoDigits[2]:setDigit( tens )
			self.ammoDigits[2]:setLeftRight( false, true, numberRight - stockNumberWidth, numberRight )
			self.ammoDigits[2]:setTopBottom( false, true, stockNumberTop, stockNumberTop + stockNumberHeight )
			numberRight = numberRight - stockNumberSpacing
			digitsUsed = 2
		end
		if hundreds > 0 then
			self.ammoDigits[3]:setDigit( hundreds )
			self.ammoDigits[3]:setLeftRight( false, true, numberRight - stockNumberWidth, numberRight )
			self.ammoDigits[3]:setTopBottom( false, true, stockNumberTop, stockNumberTop + stockNumberHeight )
			numberRight = numberRight - stockNumberSpacing
			digitsUsed = 3
		end
		digitsUsed = digitsUsed + 1
		self.ammoDigits[digitsUsed]:setDigit( CoD.HUDDigit.Slash )
		self.ammoDigits[digitsUsed]:setLeftRight( false, true, numberRight - stockNumberWidth, numberRight )
		self.ammoDigits[digitsUsed]:setTopBottom( false, true, stockNumberTop, stockNumberTop + stockNumberHeight )
		numberRight = numberRight - stockNumberSpacing
		digitsUsed = digitsUsed + 1
		hundreds, tens, ones = CoD.AmmoArea.GetThreeDigits( event.ammoInClip )
		self.ammoDigits[digitsUsed]:setDigit( ones, lowClip )
		self.ammoDigits[digitsUsed]:setLeftRight( false, true, numberRight - ammoNumberWidth, numberRight )
		self.ammoDigits[digitsUsed]:setTopBottom( false, true, ammoNumberTop, ammoNumberTop + ammoNumberHeight )
		numberRight = numberRight - ammoNumberSpacing
		if hundreds > 0 or tens > 0 then
			digitsUsed = digitsUsed + 1
			self.ammoDigits[digitsUsed]:setDigit( tens, lowClip )
			self.ammoDigits[digitsUsed]:setLeftRight( false, true, numberRight - ammoNumberWidth, numberRight )
			self.ammoDigits[digitsUsed]:setTopBottom( false, true, ammoNumberTop, ammoNumberTop + ammoNumberHeight )
			numberRight = numberRight - ammoNumberSpacing
		end
		if hundreds > 0 then
			digitsUsed = digitsUsed + 1
			self.ammoDigits[digitsUsed]:setDigit( hundreds, lowClip )
			self.ammoDigits[digitsUsed]:setLeftRight( false, true, numberRight - ammoNumberWidth, numberRight )
			self.ammoDigits[digitsUsed]:setTopBottom( false, true, ammoNumberTop, ammoNumberTop + ammoNumberHeight )
			numberRight = numberRight - ammoNumberSpacing
		end
		if event.ammoInDWClip then
			digitsUsed = digitsUsed + 1
			self.ammoDigits[digitsUsed]:setDigit( CoD.HUDDigit.Line )
			self.ammoDigits[digitsUsed]:setLeftRight( false, true, numberRight - ammoNumberWidth, numberRight )
			self.ammoDigits[digitsUsed]:setTopBottom( false, true, ammoNumberTop, ammoNumberTop + ammoNumberHeight )
			numberRight = numberRight - ammoNumberSpacing
			local lowDWClip = event.lowDWClip
			digitsUsed = digitsUsed + 1
			hundreds, tens, ones = CoD.AmmoArea.GetThreeDigits( event.ammoInDWClip )
			self.ammoDigits[digitsUsed]:setDigit( ones, lowDWClip )
			self.ammoDigits[digitsUsed]:setLeftRight( false, true, numberRight - ammoNumberWidth, numberRight )
			self.ammoDigits[digitsUsed]:setTopBottom( false, true, ammoNumberTop, ammoNumberTop + ammoNumberHeight )
			numberRight = numberRight - ammoNumberSpacing
			if hundreds > 0 or tens > 0 then
				digitsUsed = digitsUsed + 1
				self.ammoDigits[digitsUsed]:setDigit( tens, lowDWClip )
				self.ammoDigits[digitsUsed]:setLeftRight( false, true, numberRight - ammoNumberWidth, numberRight )
				self.ammoDigits[digitsUsed]:setTopBottom( false, true, ammoNumberTop, ammoNumberTop + ammoNumberHeight )
				numberRight = numberRight - ammoNumberSpacing
			end
			if hundreds > 0 then
				digitsUsed = digitsUsed + 1
				self.ammoDigits[digitsUsed]:setDigit( hundreds, lowDWClip )
				self.ammoDigits[digitsUsed]:setLeftRight( false, true, numberRight - ammoNumberWidth, numberRight )
				self.ammoDigits[digitsUsed]:setTopBottom( false, true, ammoNumberTop, ammoNumberTop + ammoNumberHeight )
				numberRight = numberRight - ammoNumberSpacing
			end
		end
		for i = digitsUsed + 1, numDigits, 1 do
			self.ammoDigits[i]:setAlpha( 0 )
		end
		self:dispatchEventToChildren( event )
	end
end

CoD.AmmoArea.UpdateVisibility = function ( self, event )
	local controller = event.controller
	if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_AMMO_COUNTER_HIDE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE ) and (not CoD.IsShoutcaster( controller ) or CoD.ExeProfileVarBool( controller, "shoutcaster_inventory" ) and Engine.IsSpectatingActiveClient( controller )) and CoD.FSM_VISIBILITY( controller ) == 0 then
		if self.visible ~= true then
			self:setAlpha( 1 )
			self.visible = true
		end
	elseif self.visible == true then
		self:setAlpha( 0 )
		self.visible = nil
	end
	self:dispatchEventToChildren( event )
end

CoD.AmmoArea.UpdateWeapon = function ( self, event )
	if event.fireTypeMaterial ~= nil then
		self.fireRateImage:setImage( event.fireTypeMaterial )
		self.fireTypeMaterial = event.fireTypeMaterial
	else
		self.fireTypeMaterial = nil
	end
	if event.weapon and (Engine.IsWeaponType( event.weapon, "melee" ) or Engine.IsWeaponType( event.weapon, "riotshield" ) or Engine.IsWeaponType( event.weapon, "grenade" )) then
		self.hideAmmo = true
	else
		self.hideAmmo = nil
	end
	CoD.AmmoArea.UpdateVisibility( self, event )
	self:dispatchEventToChildren( event )
end

CoD.AmmoArea.UpdateWeaponSelect = function ( self, event )
	local localizedWeaponName = Engine.ToUpper( Engine.Localize( event.weaponDisplayName ) )
	local localizedAttachment1Name = ""
	local localizedAttachment2Name = ""
	local localizedAttachment3Name = ""
	local localizedAttachment4Name = ""
	if event.attachment1DisplayName ~= nil then
		localizedAttachment1Name = Engine.ToUpper( Engine.Localize( event.attachment1DisplayName ) )
	end
	if event.attachment2DisplayName ~= nil then
		localizedAttachment2Name = Engine.ToUpper( Engine.Localize( event.attachment2DisplayName ) )
	end
	if event.attachment3DisplayName ~= nil then
		localizedAttachment3Name = Engine.ToUpper( Engine.Localize( event.attachment3DisplayName ) )
	end
	if event.attachment4DisplayName ~= nil then
		localizedAttachment4Name = Engine.ToUpper( Engine.Localize( event.attachment4DisplayName ) )
	end
	if self.localizedWeaponName ~= localizedWeaponName or self.localizedAttachment1Name ~= localizedAttachment1Name or self.localizedAttachment2Name ~= localizedAttachment2Name or self.localizedAttachment3Name ~= localizedAttachment3Name then
		self.localizedWeaponName = localizedWeaponName
		self.localizedAttachment1Name = localizedAttachment1Name
		self.localizedAttachment2Name = localizedAttachment2Name
		self.localizedAttachment3Name = localizedAttachment3Name
		self.localizedAttachment4Name = localizedAttachment4Name
		self.weaponStencilContainer.visibleWidth = 0
		CoD.AmmoArea.SetWeaponLabel( self.weaponStencilContainer, self.customizedLabelContainer, Engine.Localize( "MENU_CUSTOMIZED_CAPS" ), 0 )
		CoD.AmmoArea.SetWeaponLabel( self.weaponStencilContainer, self.weaponLabelContainer, localizedWeaponName, 1 )
		CoD.AmmoArea.SetWeaponLabel( self.weaponStencilContainer, self.attachmentLabelContainer[1], localizedAttachment1Name, 1 )
		CoD.AmmoArea.SetWeaponLabel( self.weaponStencilContainer, self.attachmentLabelContainer[2], localizedAttachment2Name, 1 )
		CoD.AmmoArea.SetWeaponLabel( self.weaponStencilContainer, self.attachmentLabelContainer[3], localizedAttachment3Name, 1 )
		CoD.AmmoArea.SetWeaponLabel( self.weaponStencilContainer, self.attachmentLabelContainer[4], localizedAttachment4Name, 1 )
		local attachmentWidth = self.weaponStencilContainer.visibleWidth - self.weaponLabelContainer.visibleWidth
		if attachmentWidth ~= 0 then
			for i = 1, CoD.AmmoArea.AttachmentCount, 1 do
				self.attachmentLabelContainer[i].slideTime = CoD.AmmoArea.AttachmentMoveDuration * self.attachmentLabelContainer[i].visibleWidth / attachmentWidth
			end
		end
		local weaponLabelRight = 0
		for i = 1, CoD.AmmoArea.AttachmentCount, 1 do
			weaponLabelRight = weaponLabelRight - self.attachmentLabelContainer[i].visibleWidth
		end
		weaponLabelRight = weaponLabelRight + self.weaponLabelContainer.trimWidth
		self.weaponLabelContainer:setLeftRight( false, true, -self.weaponLabelContainer.fullWidth + weaponLabelRight, weaponLabelRight )
		for i = 1, CoD.AmmoArea.AttachmentCount, 1 do
			weaponLabelRight = weaponLabelRight + self.attachmentLabelContainer[i].visibleWidth
			self.attachmentLabelContainer[i]:setLeftRight( false, true, -self.attachmentLabelContainer[i].fullWidth + weaponLabelRight, weaponLabelRight )
		end
		self.fireRateImage:completeAnimation()
		self.fireRateImage:setAlpha( 0 )
		self.animationSequence = 4
		self:completeAnimation()
		if not self.weaponSelectionTimer then
			self.weaponSelectionTimer = LUI.UITimer.new( CoD.AmmoArea.WeaponSelectionDelay, "weapon_selection_done", true, self )
		else
			self.weaponSelectionTimer:reset()
		end
		self:addElement( self.weaponSelectionTimer )
	end
	self:dispatchEventToChildren( event )
end

CoD.AmmoArea.SetWeaponLabel = function ( parent, label, text, alpha )
	local weaponFontName = CoD.AmmoArea.WeaponFontName
	local weaponFont = CoD.fonts[weaponFontName]
	local weaponTextSize = CoD.textSize[weaponFontName]
	local textLeft, textTop, textRight, textBottom = GetTextDimensions( text, weaponFont, weaponTextSize )
	local textWidth = textLeft + textRight - 18
	if textWidth < 0 then
		textWidth = 0
	end
	label.fullWidth = textWidth + 128
	label:setLeftRight( false, true, -label.fullWidth, 0 )
	label.weaponText:setText( text )
	label:setAlpha( alpha )
	label.slideTime = 0
	if text == "" then
		label.visibleWidth = 0
		label:close()
	else
		label:completeAnimation()
		label.visibleWidth = textWidth + 30
		label.trimWidth = (label.fullWidth - label.visibleWidth) / 2
		parent:addElement( label )
		parent.visibleWidth = parent.visibleWidth + label.visibleWidth
	end
end

CoD.AmmoArea.SwitchToCustomized = function ( self, event )
	local animTime = CoD.AmmoArea.WeaponSelectionDuration
	local f11_local0 = self.attachmentLabelContainer[2].visibleWidth ~= 0
	local weaponLabelRight = 0
	if f11_local0 then
		for i = 1, CoD.AmmoArea.AttachmentCount, 1 do
			weaponLabelRight = weaponLabelRight + self.attachmentLabelContainer[i].visibleWidth
			self.attachmentLabelContainer[i]:beginAnimation( "attachment_fade_out", animTime / 2 )
			self.attachmentLabelContainer[i]:setAlpha( 0 )
		end
		self.customizedLabelContainer:setLeftRight( false, true, -self.customizedLabelContainer.fullWidth + self.weaponLabelContainer.trimWidth, self.weaponLabelContainer.trimWidth )
		self.customizedLabelContainer:beginAnimation( "customized_fade_in", animTime, false, false )
		self.customizedLabelContainer:setAlpha( 1 )
		if self.fireTypeMaterial == nil then
			local weaponLabelRight = self.weaponLabelContainer.trimWidth - self.customizedLabelContainer.visibleWidth
			self.weaponLabelContainer:beginAnimation( "attachment_firetype", animTime, false, false )
			self.weaponLabelContainer:setLeftRight( false, true, -self.weaponLabelContainer.fullWidth + weaponLabelRight, weaponLabelRight )
		end
	end
	if self.fireTypeMaterial ~= nil then
		weaponLabelRight = 0
		if f11_local0 then
			weaponLabelRight = weaponLabelRight - self.customizedLabelContainer.visibleWidth
		else
			weaponLabelRight = weaponLabelRight - self.attachmentLabelContainer[1].visibleWidth
		end
		weaponLabelRight = weaponLabelRight - 64 + self.weaponLabelContainer.trimWidth
		self.fireRateImage:animateToState( "show", animTime * 2, true, false )
		self:beginAnimation( "firetype", animTime, false, false )
		self.weaponLabelContainer:beginAnimation( "attachment_firetype", animTime, false, false )
		self.weaponLabelContainer:setLeftRight( false, true, -self.weaponLabelContainer.fullWidth + weaponLabelRight, weaponLabelRight )
		if f11_local0 then
			weaponLabelRight = weaponLabelRight + self.customizedLabelContainer.visibleWidth
			self.customizedLabelContainer:setLeftRight( false, true, -self.customizedLabelContainer.fullWidth + weaponLabelRight, weaponLabelRight )
		else
			weaponLabelRight = weaponLabelRight + self.attachmentLabelContainer[1].visibleWidth
			self.attachmentLabelContainer[1]:beginAnimation( "attachment_firetype", animTime, false, false )
			self.attachmentLabelContainer[1]:setLeftRight( false, true, -self.attachmentLabelContainer[1].fullWidth + weaponLabelRight, weaponLabelRight )
		end
	end
end

CoD.AmmoArea.RegisterMaterials = function ()
	CoD.AmmoArea.FireRateMaterials[1] = RegisterMaterial( "hud_mp_firerate_single" )
	CoD.AmmoArea.FireRateMaterials[2] = RegisterMaterial( "hud_mp_firerate_burst" )
	CoD.AmmoArea.FireRateMaterials[3] = RegisterMaterial( "hud_mp_firerate_auto" )
	CoD.AmmoArea.FireRateMaterials[4] = RegisterMaterial( "hud_mp_firerate_free" )
	CoD.AmmoArea.FireRateMaterials[5] = RegisterMaterial( "hud_mp_firerate_lock" )
	CoD.AmmoArea.FireRateMaterials[6] = RegisterMaterial( "hud_mp_firerate_pump" )
	CoD.AmmoArea.FireRateMaterials[7] = RegisterMaterial( "hud_mp_firerate_bolt" )
end

CoD.AmmoArea.SetKeyBind = function ( self )
	local text, binding = nil
	if self.altFireKeyPrompt ~= nil then
		binding = "+actionslot 3"
		if binding ~= nil then
			self.altFireKeyPrompt:setText( Engine.GetKeyBindingLocalizedString( 0, binding, 0 ) )
		end
	end
end

CoD.AmmoArea.InputSourceChanged = function ( self, event )
	if CoD.isPC and self.isPromptEnabled then
		if CoD.useController and event.source == 0 then
			if self.altFireKeyPrompt ~= nil then
				self.altFireKeyPrompt:setAlpha( 0 )
			end
			if self.altFireArrow ~= nil then
				self.altFireArrow:setAlpha( 1 )
			end
		else
			CoD.AmmoArea.SetKeyBind( self )
			if self.altFireKeyPrompt ~= nil then
				self.altFireKeyPrompt:setAlpha( 1 )
			end
			if self.altFireArrow ~= nil then
				self.altFireArrow:setAlpha( 0 )
			end
		end
	end
end

