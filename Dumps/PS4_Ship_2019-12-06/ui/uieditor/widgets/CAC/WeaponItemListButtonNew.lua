require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgIdle" )
require( "ui.uieditor.widgets.CAC.cac_ListButtonLabelCount" )
require( "ui.uieditor.widgets.Prestige.Prestige_PermanentUnlockTokenStatic" )
require( "ui.uieditor.widgets.CAC.cac_IconTokenStatic" )
require( "ui.uieditor.widgets.CAC.cac_ListButtonLabel" )
require( "ui.uieditor.widgets.CAC.cac_lock" )
require( "ui.uieditor.widgets.CAC.cac_LabelNew" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.widgets.CAC.RestrictedItemWarning" )
require( "ui.uieditor.widgets.Prestige.Prestige_TokenRefundHintWidget" )
require( "ui.uieditor.widgets.BlackMarket.BM_GoldBarMed" )
require( "ui.uieditor.widgets.BlackMarket.BM_Contracts_LockBars" )

CoD.WeaponItemListButtonNew = InheritFrom( LUI.UIElement )
CoD.WeaponItemListButtonNew.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.WeaponItemListButtonNew )
	self.id = "WeaponItemListButtonNew"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 280 )
	self:setTopBottom( true, false, 0, 65 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgInactiveDiag = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgInactiveDiag:setTopBottom( true, true, -2, 2 )
	BoxButtonLrgInactiveDiag:setAlpha( 0 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgInactive:setTopBottom( true, true, -2, 2 )
	BoxButtonLrgInactive:setAlpha( 0 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local BoxButtonLrgIdle = CoD.cac_ButtonBoxLrgIdle.new( menu, controller )
	BoxButtonLrgIdle:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgIdle:setTopBottom( true, true, -2, 2 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local itemImageSolid = LUI.UIImage.new()
	itemImageSolid:setLeftRight( true, false, 0, 65 )
	itemImageSolid:setTopBottom( true, true, 0, 0 )
	itemImageSolid:setRGB( 0, 0, 0 )
	itemImageSolid:setAlpha( 0 )
	itemImageSolid:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			itemImageSolid:setImage( RegisterImage( image ) )
		end
	end )
	self:addElement( itemImageSolid )
	self.itemImageSolid = itemImageSolid
	
	local itemImage = LUI.UIImage.new()
	itemImage:setLeftRight( true, false, 0, 65 )
	itemImage:setTopBottom( true, true, 0, 0 )
	itemImage:setAlpha( 0.3 )
	itemImage:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			itemImage:setImage( RegisterImage( image ) )
		end
	end )
	self:addElement( itemImage )
	self.itemImage = itemImage
	
	local itemImageLine = LUI.UIImage.new()
	itemImageLine:setLeftRight( true, false, 63, 67 )
	itemImageLine:setTopBottom( false, false, -33, 34 )
	itemImageLine:setAlpha( 0.3 )
	itemImageLine:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	itemImageLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( itemImageLine )
	self.itemImageLine = itemImageLine
	
	local LabelButtonCount = CoD.cac_ListButtonLabelCount.new( menu, controller )
	LabelButtonCount:setLeftRight( false, true, -116, -12 )
	LabelButtonCount:setTopBottom( false, false, -9.5, 10.5 )
	LabelButtonCount:linkToElementModel( self, nil, false, function ( model )
		LabelButtonCount:setModel( model, controller )
	end )
	LabelButtonCount:linkToElementModel( self, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			LabelButtonCount.ButtonLabelCount.itemName:setText( Engine.Localize( GetVariantCountByWeaponIndex( itemIndex ) ) )
		end
	end )
	LabelButtonCount:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f6_local0
				if not IsInPermanentUnlockMenu( controller ) then
					f6_local0 = IsCACWeaponVariantAvailable( element, controller )
				else
					f6_local0 = false
				end
				return f6_local0
			end
		}
	} )
	self:addElement( LabelButtonCount )
	self.LabelButtonCount = LabelButtonCount
	
	local tokenPermanentUnlock = CoD.Prestige_PermanentUnlockTokenStatic.new( menu, controller )
	tokenPermanentUnlock:setLeftRight( false, true, -41, -9 )
	tokenPermanentUnlock:setTopBottom( false, false, -16.25, 15.75 )
	tokenPermanentUnlock:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsInPermanentUnlockMenu( controller ) and not IsPermanentlyUnlocked( element, controller )
			end
		}
	} )
	self:addElement( tokenPermanentUnlock )
	self.tokenPermanentUnlock = tokenPermanentUnlock
	
	local tokenUnlock = CoD.cac_IconTokenStatic.new( menu, controller )
	tokenUnlock:setLeftRight( false, true, -263.5, -231.5 )
	tokenUnlock:setTopBottom( false, false, -15, 17 )
	tokenUnlock:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f8_local0
				if not IsCampaign() and not IsCACItemLocked( menu, element, controller ) and not IsCACItemPurchased( element, controller ) then
					f8_local0 = not IsInPermanentUnlockMenu( controller )
				else
					f8_local0 = false
				end
				return f8_local0
			end
		},
		{
			stateName = "VisibleCP",
			condition = function ( menu, element, event )
				local f9_local0 = IsCampaign()
				if f9_local0 then
					if not IsCACItemLocked( menu, element, controller ) and not IsCACItemPurchased( element, controller ) then
						f9_local0 = not IsInPermanentUnlockMenu( controller )
					else
						f9_local0 = false
					end
				end
				return f9_local0
			end
		}
	} )
	tokenUnlock:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( tokenUnlock, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	tokenUnlock:linkToElementModel( tokenUnlock, "itemIndex", true, function ( model )
		menu:updateElementState( tokenUnlock, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( tokenUnlock )
	self.tokenUnlock = tokenUnlock
	
	local LabelButton = CoD.cac_ListButtonLabel.new( menu, controller )
	LabelButton:setLeftRight( true, false, 79, 236 )
	LabelButton:setTopBottom( false, false, -9.5, 10.5 )
	LabelButton:linkToElementModel( self, nil, false, function ( model )
		LabelButton:setModel( model, controller )
	end )
	LabelButton:linkToElementModel( self, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			LabelButton.itemName:setText( Engine.Localize( name ) )
		end
	end )
	self:addElement( LabelButton )
	self.LabelButton = LabelButton
	
	local equippedIcon = LUI.UIImage.new()
	equippedIcon:setLeftRight( false, true, -16, -2 )
	equippedIcon:setTopBottom( true, false, 2, 16 )
	equippedIcon:setRGB( 0.56, 0.68, 0.27 )
	equippedIcon:setAlpha( 0 )
	equippedIcon:setImage( RegisterImage( "uie_t7_hud_cac_equipped_16" ) )
	self:addElement( equippedIcon )
	self.equippedIcon = equippedIcon
	
	local alertIcon = LUI.UIImage.new()
	alertIcon:setLeftRight( false, true, -16, -2 )
	alertIcon:setTopBottom( true, false, 2, 16 )
	alertIcon:setRGB( 1, 0.41, 0 )
	alertIcon:setAlpha( 0 )
	alertIcon:setImage( RegisterImage( "uie_t7_hud_cac_warning_16" ) )
	self:addElement( alertIcon )
	self.alertIcon = alertIcon
	
	local lockedIcon = CoD.cac_lock.new( menu, controller )
	lockedIcon:setLeftRight( true, false, 17, 47 )
	lockedIcon:setTopBottom( false, false, -16, 16 )
	lockedIcon:setAlpha( 0 )
	self:addElement( lockedIcon )
	self.lockedIcon = lockedIcon
	
	local IconNew = CoD.cac_LabelNew.new( menu, controller )
	IconNew:setLeftRight( true, false, 182, 247 )
	IconNew:setTopBottom( false, false, -11.5, 12.5 )
	self:addElement( IconNew )
	self.IconNew = IconNew
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, -2, 2 )
	FocusBarT:setTopBottom( true, false, -4, 0 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, -2, 2 )
	FocusBarB:setTopBottom( false, true, 0, 4 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local FocusBorder = CoD.FE_TitleNumBrdr.new( menu, controller )
	FocusBorder:setLeftRight( true, true, 0, 0 )
	FocusBorder:setTopBottom( true, true, -0.5, 0 )
	FocusBorder:setRGB( 1, 0.3, 0 )
	FocusBorder:setAlpha( 0 )
	self:addElement( FocusBorder )
	self.FocusBorder = FocusBorder
	
	local glitch = LUI.UIImage.new()
	glitch:setLeftRight( true, true, -12, 7 )
	glitch:setTopBottom( true, false, -8.75, 4.75 )
	glitch:setRGB( 1, 0.09, 0 )
	glitch:setAlpha( 0 )
	glitch:setImage( RegisterImage( "uie_t7_effect_glitches_menu10" ) )
	glitch:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glitch )
	self.glitch = glitch
	
	local glitch2 = LUI.UIImage.new()
	glitch2:setLeftRight( true, true, -8.5, 8.5 )
	glitch2:setTopBottom( false, true, -6, 9 )
	glitch2:setRGB( 1, 0.15, 0 )
	glitch2:setAlpha( 0 )
	glitch2:setImage( RegisterImage( "uie_t7_effect_glitches_menu10" ) )
	glitch2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glitch2 )
	self.glitch2 = glitch2
	
	local RestrictedItemWarning = CoD.RestrictedItemWarning.new( menu, controller )
	RestrictedItemWarning:setLeftRight( true, false, 0, 65 )
	RestrictedItemWarning:setTopBottom( true, false, 4.93, 61.07 )
	RestrictedItemWarning:linkToElementModel( self, nil, false, function ( model )
		RestrictedItemWarning:setModel( model, controller )
	end )
	RestrictedItemWarning:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return ItemIsBanned( menu, element, controller )
			end
		}
	} )
	RestrictedItemWarning:linkToElementModel( RestrictedItemWarning, nil, true, function ( model )
		menu:updateElementState( RestrictedItemWarning, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		} )
	end )
	RestrictedItemWarning:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" ), function ( model )
		menu:updateElementState( RestrictedItemWarning, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.Update"
		} )
	end )
	self:addElement( RestrictedItemWarning )
	self.RestrictedItemWarning = RestrictedItemWarning
	
	local TokenRefundHint = CoD.Prestige_TokenRefundHintWidget.new( menu, controller )
	TokenRefundHint:setLeftRight( false, true, 10, 198 )
	TokenRefundHint:setTopBottom( false, false, -16, 16 )
	TokenRefundHint:setAlpha( 0 )
	TokenRefundHint.textCenterAlign:setText( Engine.Localize( "MENU_PRESTIGE_UNLOCK_TOKEN_REFUND" ) )
	TokenRefundHint:mergeStateConditions( {
		{
			stateName = "Below",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Right",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		},
		{
			stateName = "Left",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:addElement( TokenRefundHint )
	self.TokenRefundHint = TokenRefundHint
	
	local blackMarketBackground = LUI.UIImage.new()
	blackMarketBackground:setLeftRight( true, true, 0, 0 )
	blackMarketBackground:setTopBottom( true, true, 0, 0 )
	blackMarketBackground:setRGB( 0, 0, 0 )
	blackMarketBackground:setAlpha( 0 )
	self:addElement( blackMarketBackground )
	self.blackMarketBackground = blackMarketBackground
	
	local BMGoldBarMed = CoD.BM_GoldBarMed.new( menu, controller )
	BMGoldBarMed:setLeftRight( false, false, -99, 99 )
	BMGoldBarMed:setTopBottom( false, false, -6.5, 6.5 )
	BMGoldBarMed:setAlpha( 0 )
	self:addElement( BMGoldBarMed )
	self.BMGoldBarMed = BMGoldBarMed
	
	local blackMarketBrandIcon = LUI.UIImage.new()
	blackMarketBrandIcon:setLeftRight( false, false, -23, 23 )
	blackMarketBrandIcon:setTopBottom( false, false, -23, 23 )
	blackMarketBrandIcon:setAlpha( 0 )
	blackMarketBrandIcon:setImage( RegisterImage( "uie_t7_icon_blackmarket_encryptedicon_large" ) )
	self:addElement( blackMarketBrandIcon )
	self.blackMarketBrandIcon = blackMarketBrandIcon
	
	local BMContractsLockBars = CoD.BM_Contracts_LockBars.new( menu, controller )
	BMContractsLockBars:setLeftRight( true, false, 148.8, 251.8 )
	BMContractsLockBars:setTopBottom( true, false, 13.25, 48.25 )
	BMContractsLockBars:setAlpha( 0 )
	self:addElement( BMContractsLockBars )
	self.BMContractsLockBars = BMContractsLockBars
	
	local BMContractsLockBars0 = CoD.BM_Contracts_LockBars.new( menu, controller )
	BMContractsLockBars0:setLeftRight( true, false, 28.8, 132.8 )
	BMContractsLockBars0:setTopBottom( true, false, 13.25, 48.25 )
	BMContractsLockBars0:setAlpha( 0 )
	BMContractsLockBars0:setYRot( 180 )
	self:addElement( BMContractsLockBars0 )
	self.BMContractsLockBars0 = BMContractsLockBars0
	
	local bmContractBrandIcon = LUI.UIImage.new()
	bmContractBrandIcon:setLeftRight( true, false, 107.25, 172.75 )
	bmContractBrandIcon:setTopBottom( true, false, -0.5, 65 )
	bmContractBrandIcon:setAlpha( 0 )
	bmContractBrandIcon:setImage( RegisterImage( "uie_t7_bm_special_contracts_logo" ) )
	self:addElement( bmContractBrandIcon )
	self.bmContractBrandIcon = bmContractBrandIcon
	
	BMContractsLockBars.navigation = {
		left = BMContractsLockBars0
	}
	BMContractsLockBars0.navigation = {
		right = BMContractsLockBars
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 21 )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				itemImageSolid:completeAnimation()
				self.itemImageSolid:setAlpha( 0 )
				self.clipFinished( itemImageSolid, {} )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0.8 )
				self.clipFinished( itemImage, {} )
				itemImageLine:completeAnimation()
				self.itemImageLine:setAlpha( 0.3 )
				self.clipFinished( itemImageLine, {} )
				LabelButtonCount:completeAnimation()
				self.LabelButtonCount:setAlpha( 1 )
				self.clipFinished( LabelButtonCount, {} )
				LabelButton:completeAnimation()
				self.LabelButton:setAlpha( 1 )
				self.clipFinished( LabelButton, {} )
				equippedIcon:completeAnimation()
				self.equippedIcon:setAlpha( 0 )
				self.clipFinished( equippedIcon, {} )
				alertIcon:completeAnimation()
				self.alertIcon:setAlpha( 0 )
				self.clipFinished( alertIcon, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
				IconNew:completeAnimation()
				self.IconNew:setAlpha( 0 )
				self.clipFinished( IconNew, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBorder:completeAnimation()
				self.FocusBorder:setAlpha( 0 )
				self.clipFinished( FocusBorder, {} )
				glitch:completeAnimation()
				self.glitch:setAlpha( 0 )
				self.clipFinished( glitch, {} )
				glitch2:completeAnimation()
				self.glitch2:setAlpha( 0 )
				self.clipFinished( glitch2, {} )
				TokenRefundHint:completeAnimation()
				self.TokenRefundHint:setAlpha( 0 )
				self.clipFinished( TokenRefundHint, {} )
				BMContractsLockBars:completeAnimation()
				self.BMContractsLockBars:setAlpha( 0 )
				self.clipFinished( BMContractsLockBars, {} )
				BMContractsLockBars0:completeAnimation()
				self.BMContractsLockBars0:setAlpha( 0 )
				self.clipFinished( BMContractsLockBars0, {} )
				bmContractBrandIcon:completeAnimation()
				self.bmContractBrandIcon:setAlpha( 0 )
				self.clipFinished( bmContractBrandIcon, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 7 )
				local BoxButtonLrgInactiveFrame2 = function ( BoxButtonLrgInactive, event )
					if not event.interrupted then
						BoxButtonLrgInactive:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					BoxButtonLrgInactive:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BoxButtonLrgInactive, event )
					else
						BoxButtonLrgInactive:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				BoxButtonLrgInactiveFrame2( BoxButtonLrgInactive, {} )
				local itemImageFrame2 = function ( itemImage, event )
					if not event.interrupted then
						itemImage:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
					end
					itemImage:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( itemImage, event )
					else
						itemImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0.8 )
				itemImageFrame2( itemImage, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					local FocusBarTFrame3 = function ( FocusBarT, event )
						local FocusBarTFrame4 = function ( FocusBarT, event )
							local FocusBarTFrame5 = function ( FocusBarT, event )
								local FocusBarTFrame6 = function ( FocusBarT, event )
									local FocusBarTFrame7 = function ( FocusBarT, event )
										if not event.interrupted then
											FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										end
										FocusBarT:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( FocusBarT, event )
										else
											FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										FocusBarTFrame7( FocusBarT, event )
										return 
									else
										FocusBarT:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBarTFrame6( FocusBarT, event )
									return 
								else
									FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									FocusBarT:setAlpha( 0.35 )
									FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarTFrame5( FocusBarT, event )
								return 
							else
								FocusBarT:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarTFrame4( FocusBarT, event )
							return 
						else
							FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FocusBarT:setAlpha( 0.57 )
							FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarTFrame3( FocusBarT, event )
						return 
					else
						FocusBarT:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame3 )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				FocusBarTFrame2( FocusBarT, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					local FocusBarBFrame3 = function ( FocusBarB, event )
						local FocusBarBFrame4 = function ( FocusBarB, event )
							local FocusBarBFrame5 = function ( FocusBarB, event )
								local FocusBarBFrame6 = function ( FocusBarB, event )
									local FocusBarBFrame7 = function ( FocusBarB, event )
										if not event.interrupted then
											FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										end
										FocusBarB:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( FocusBarB, event )
										else
											FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										FocusBarBFrame7( FocusBarB, event )
										return 
									else
										FocusBarB:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBarBFrame6( FocusBarB, event )
									return 
								else
									FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									FocusBarB:setAlpha( 0.21 )
									FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarBFrame5( FocusBarB, event )
								return 
							else
								FocusBarB:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarBFrame4( FocusBarB, event )
							return 
						else
							FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FocusBarB:setAlpha( 0.66 )
							FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarBFrame3( FocusBarB, event )
						return 
					else
						FocusBarB:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame3 )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBorderFrame2 = function ( FocusBorder, event )
					local FocusBorderFrame3 = function ( FocusBorder, event )
						local FocusBorderFrame4 = function ( FocusBorder, event )
							local FocusBorderFrame5 = function ( FocusBorder, event )
								local FocusBorderFrame6 = function ( FocusBorder, event )
									local FocusBorderFrame7 = function ( FocusBorder, event )
										local FocusBorderFrame8 = function ( FocusBorder, event )
											if not event.interrupted then
												FocusBorder:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
											end
											FocusBorder:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( FocusBorder, event )
											else
												FocusBorder:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											FocusBorderFrame8( FocusBorder, event )
											return 
										else
											FocusBorder:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											FocusBorder:setAlpha( 0.7 )
											FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame8 )
										end
									end
									
									if event.interrupted then
										FocusBorderFrame7( FocusBorder, event )
										return 
									else
										FocusBorder:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBorderFrame6( FocusBorder, event )
									return 
								else
									FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									FocusBorder:setAlpha( 0 )
									FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBorderFrame5( FocusBorder, event )
								return 
							else
								FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FocusBorder:setAlpha( 0.5 )
								FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBorderFrame4( FocusBorder, event )
							return 
						else
							FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FocusBorder:setAlpha( 1 )
							FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBorderFrame3( FocusBorder, event )
						return 
					else
						FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame3 )
					end
				end
				
				FocusBorder:completeAnimation()
				self.FocusBorder:setAlpha( 0 )
				FocusBorderFrame2( FocusBorder, {} )
				local glitchFrame2 = function ( glitch, event )
					local glitchFrame3 = function ( glitch, event )
						local glitchFrame4 = function ( glitch, event )
							local glitchFrame5 = function ( glitch, event )
								local glitchFrame6 = function ( glitch, event )
									local glitchFrame7 = function ( glitch, event )
										if not event.interrupted then
											glitch:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										end
										glitch:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( glitch, event )
										else
											glitch:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										glitchFrame7( glitch, event )
										return 
									else
										glitch:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame7 )
									end
								end
								
								if event.interrupted then
									glitchFrame6( glitch, event )
									return 
								else
									glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									glitch:setAlpha( 1 )
									glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame6 )
								end
							end
							
							if event.interrupted then
								glitchFrame5( glitch, event )
								return 
							else
								glitch:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame5 )
							end
						end
						
						if event.interrupted then
							glitchFrame4( glitch, event )
							return 
						else
							glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							glitch:setAlpha( 0 )
							glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame4 )
						end
					end
					
					if event.interrupted then
						glitchFrame3( glitch, event )
						return 
					else
						glitch:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame3 )
					end
				end
				
				glitch:completeAnimation()
				self.glitch:setAlpha( 1 )
				glitchFrame2( glitch, {} )
				local glitch2Frame2 = function ( glitch2, event )
					local glitch2Frame3 = function ( glitch2, event )
						local glitch2Frame4 = function ( glitch2, event )
							local glitch2Frame5 = function ( glitch2, event )
								local glitch2Frame6 = function ( glitch2, event )
									local glitch2Frame7 = function ( glitch2, event )
										if not event.interrupted then
											glitch2:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										end
										glitch2:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( glitch2, event )
										else
											glitch2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										glitch2Frame7( glitch2, event )
										return 
									else
										glitch2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame7 )
									end
								end
								
								if event.interrupted then
									glitch2Frame6( glitch2, event )
									return 
								else
									glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									glitch2:setAlpha( 1 )
									glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame6 )
								end
							end
							
							if event.interrupted then
								glitch2Frame5( glitch2, event )
								return 
							else
								glitch2:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame5 )
							end
						end
						
						if event.interrupted then
							glitch2Frame4( glitch2, event )
							return 
						else
							glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							glitch2:setAlpha( 0 )
							glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame4 )
						end
					end
					
					if event.interrupted then
						glitch2Frame3( glitch2, event )
						return 
					else
						glitch2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame3 )
					end
				end
				
				glitch2:completeAnimation()
				self.glitch2:setAlpha( 1 )
				glitch2Frame2( glitch2, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 9 )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 1 )
				self.clipFinished( itemImage, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
				IconNew:completeAnimation()
				self.IconNew:setAlpha( 0 )
				self.clipFinished( IconNew, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				TokenRefundHint:completeAnimation()
				self.TokenRefundHint:setAlpha( 0 )
				self.clipFinished( TokenRefundHint, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 7 )
				local BoxButtonLrgInactiveFrame2 = function ( BoxButtonLrgInactive, event )
					if not event.interrupted then
						BoxButtonLrgInactive:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					BoxButtonLrgInactive:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( BoxButtonLrgInactive, event )
					else
						BoxButtonLrgInactive:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				BoxButtonLrgInactiveFrame2( BoxButtonLrgInactive, {} )
				local itemImageFrame2 = function ( itemImage, event )
					if not event.interrupted then
						itemImage:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					itemImage:setAlpha( 0.8 )
					if event.interrupted then
						self.clipFinished( itemImage, event )
					else
						itemImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 1 )
				itemImageFrame2( itemImage, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					local FocusBarTFrame3 = function ( FocusBarT, event )
						local FocusBarTFrame4 = function ( FocusBarT, event )
							local FocusBarTFrame5 = function ( FocusBarT, event )
								local FocusBarTFrame6 = function ( FocusBarT, event )
									local FocusBarTFrame7 = function ( FocusBarT, event )
										if not event.interrupted then
											FocusBarT:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
										end
										FocusBarT:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( FocusBarT, event )
										else
											FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										FocusBarTFrame7( FocusBarT, event )
										return 
									else
										FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										FocusBarT:setAlpha( 0.35 )
										FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBarTFrame6( FocusBarT, event )
									return 
								else
									FocusBarT:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarTFrame5( FocusBarT, event )
								return 
							else
								FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FocusBarT:setAlpha( 0.57 )
								FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarTFrame4( FocusBarT, event )
							return 
						else
							FocusBarT:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							FocusBarT:setAlpha( 0 )
							FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarTFrame3( FocusBarT, event )
						return 
					else
						FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FocusBarT:setAlpha( 0.35 )
						FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame3 )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				FocusBarTFrame2( FocusBarT, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					local FocusBarBFrame3 = function ( FocusBarB, event )
						local FocusBarBFrame4 = function ( FocusBarB, event )
							local FocusBarBFrame5 = function ( FocusBarB, event )
								local FocusBarBFrame6 = function ( FocusBarB, event )
									local FocusBarBFrame7 = function ( FocusBarB, event )
										if not event.interrupted then
											FocusBarB:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
										end
										FocusBarB:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( FocusBarB, event )
										else
											FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										FocusBarBFrame7( FocusBarB, event )
										return 
									else
										FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										FocusBarB:setAlpha( 0.21 )
										FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBarBFrame6( FocusBarB, event )
									return 
								else
									FocusBarB:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarBFrame5( FocusBarB, event )
								return 
							else
								FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FocusBarB:setAlpha( 0.66 )
								FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarBFrame4( FocusBarB, event )
							return 
						else
							FocusBarB:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							FocusBarB:setAlpha( 0 )
							FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarBFrame3( FocusBarB, event )
						return 
					else
						FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FocusBarB:setAlpha( 0.21 )
						FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame3 )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBorderFrame2 = function ( FocusBorder, event )
					local FocusBorderFrame3 = function ( FocusBorder, event )
						local FocusBorderFrame4 = function ( FocusBorder, event )
							local FocusBorderFrame5 = function ( FocusBorder, event )
								local FocusBorderFrame6 = function ( FocusBorder, event )
									local FocusBorderFrame7 = function ( FocusBorder, event )
										local FocusBorderFrame8 = function ( FocusBorder, event )
											if not event.interrupted then
												FocusBorder:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
											end
											FocusBorder:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( FocusBorder, event )
											else
												FocusBorder:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											FocusBorderFrame8( FocusBorder, event )
											return 
										else
											FocusBorder:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											FocusBorder:setAlpha( 0.7 )
											FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame8 )
										end
									end
									
									if event.interrupted then
										FocusBorderFrame7( FocusBorder, event )
										return 
									else
										FocusBorder:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBorderFrame6( FocusBorder, event )
									return 
								else
									FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									FocusBorder:setAlpha( 0 )
									FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBorderFrame5( FocusBorder, event )
								return 
							else
								FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FocusBorder:setAlpha( 0.5 )
								FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBorderFrame4( FocusBorder, event )
							return 
						else
							FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FocusBorder:setAlpha( 1 )
							FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBorderFrame3( FocusBorder, event )
						return 
					else
						FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame3 )
					end
				end
				
				FocusBorder:completeAnimation()
				self.FocusBorder:setAlpha( 0 )
				FocusBorderFrame2( FocusBorder, {} )
				local glitchFrame2 = function ( glitch, event )
					local glitchFrame3 = function ( glitch, event )
						local glitchFrame4 = function ( glitch, event )
							local glitchFrame5 = function ( glitch, event )
								local glitchFrame6 = function ( glitch, event )
									local glitchFrame7 = function ( glitch, event )
										local glitchFrame8 = function ( glitch, event )
											if not event.interrupted then
												glitch:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
											end
											glitch:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( glitch, event )
											else
												glitch:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											glitchFrame8( glitch, event )
											return 
										else
											glitch:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											glitch:setAlpha( 0.4 )
											glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame8 )
										end
									end
									
									if event.interrupted then
										glitchFrame7( glitch, event )
										return 
									else
										glitch:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame7 )
									end
								end
								
								if event.interrupted then
									glitchFrame6( glitch, event )
									return 
								else
									glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									glitch:setAlpha( 0 )
									glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame6 )
								end
							end
							
							if event.interrupted then
								glitchFrame5( glitch, event )
								return 
							else
								glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame5 )
							end
						end
						
						if event.interrupted then
							glitchFrame4( glitch, event )
							return 
						else
							glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							glitch:setAlpha( 1 )
							glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame4 )
						end
					end
					
					if event.interrupted then
						glitchFrame3( glitch, event )
						return 
					else
						glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame3 )
					end
				end
				
				glitch:completeAnimation()
				self.glitch:setAlpha( 0 )
				glitchFrame2( glitch, {} )
				local glitch2Frame2 = function ( glitch2, event )
					local glitch2Frame3 = function ( glitch2, event )
						local glitch2Frame4 = function ( glitch2, event )
							local glitch2Frame5 = function ( glitch2, event )
								local glitch2Frame6 = function ( glitch2, event )
									local glitch2Frame7 = function ( glitch2, event )
										local glitch2Frame8 = function ( glitch2, event )
											if not event.interrupted then
												glitch2:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
											end
											glitch2:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( glitch2, event )
											else
												glitch2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											glitch2Frame8( glitch2, event )
											return 
										else
											glitch2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											glitch2:setAlpha( 0.57 )
											glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame8 )
										end
									end
									
									if event.interrupted then
										glitch2Frame7( glitch2, event )
										return 
									else
										glitch2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame7 )
									end
								end
								
								if event.interrupted then
									glitch2Frame6( glitch2, event )
									return 
								else
									glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									glitch2:setAlpha( 0 )
									glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame6 )
								end
							end
							
							if event.interrupted then
								glitch2Frame5( glitch2, event )
								return 
							else
								glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame5 )
							end
						end
						
						if event.interrupted then
							glitch2Frame4( glitch2, event )
							return 
						else
							glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							glitch2:setAlpha( 1 )
							glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame4 )
						end
					end
					
					if event.interrupted then
						glitch2Frame3( glitch2, event )
						return 
					else
						glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame3 )
					end
				end
				
				glitch2:completeAnimation()
				self.glitch2:setAlpha( 0 )
				glitch2Frame2( glitch2, {} )
			end
		},
		BMClassified = {
			DefaultClip = function ()
				self:setupElementClipCounter( 27 )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				itemImageSolid:completeAnimation()
				self.itemImageSolid:setAlpha( 0 )
				self.clipFinished( itemImageSolid, {} )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0 )
				self.clipFinished( itemImage, {} )
				itemImageLine:completeAnimation()
				self.itemImageLine:setAlpha( 0 )
				self.clipFinished( itemImageLine, {} )
				LabelButtonCount:completeAnimation()
				self.LabelButtonCount:setAlpha( 0 )
				self.clipFinished( LabelButtonCount, {} )
				tokenPermanentUnlock:completeAnimation()
				self.tokenPermanentUnlock:setAlpha( 0 )
				self.clipFinished( tokenPermanentUnlock, {} )
				tokenUnlock:completeAnimation()
				self.tokenUnlock:setAlpha( 0 )
				self.clipFinished( tokenUnlock, {} )
				LabelButton:completeAnimation()
				self.LabelButton:setAlpha( 0 )
				self.clipFinished( LabelButton, {} )
				equippedIcon:completeAnimation()
				self.equippedIcon:setAlpha( 0 )
				self.clipFinished( equippedIcon, {} )
				alertIcon:completeAnimation()
				self.alertIcon:setAlpha( 0 )
				self.clipFinished( alertIcon, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
				IconNew:completeAnimation()
				self.IconNew:setAlpha( 0 )
				self.clipFinished( IconNew, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBorder:completeAnimation()
				self.FocusBorder:setAlpha( 0 )
				self.clipFinished( FocusBorder, {} )
				glitch:completeAnimation()
				self.glitch:setAlpha( 0 )
				self.clipFinished( glitch, {} )
				glitch2:completeAnimation()
				self.glitch2:setAlpha( 0 )
				self.clipFinished( glitch2, {} )
				RestrictedItemWarning:completeAnimation()
				self.RestrictedItemWarning:setAlpha( 0 )
				self.clipFinished( RestrictedItemWarning, {} )
				TokenRefundHint:completeAnimation()
				self.TokenRefundHint:setAlpha( 0 )
				self.clipFinished( TokenRefundHint, {} )
				blackMarketBackground:completeAnimation()
				self.blackMarketBackground:setAlpha( 1 )
				self.clipFinished( blackMarketBackground, {} )
				BMGoldBarMed:completeAnimation()
				self.BMGoldBarMed:setLeftRight( false, false, -99, 99 )
				self.BMGoldBarMed:setTopBottom( false, false, -6.5, 6.5 )
				self.BMGoldBarMed:setAlpha( 0.9 )
				self.clipFinished( BMGoldBarMed, {} )
				blackMarketBrandIcon:completeAnimation()
				self.blackMarketBrandIcon:setLeftRight( false, false, -23, 23 )
				self.blackMarketBrandIcon:setTopBottom( false, false, -23, 23 )
				self.blackMarketBrandIcon:setAlpha( 0.9 )
				self.clipFinished( blackMarketBrandIcon, {} )
				BMContractsLockBars:completeAnimation()
				self.BMContractsLockBars:setAlpha( 0 )
				self.clipFinished( BMContractsLockBars, {} )
				BMContractsLockBars0:completeAnimation()
				self.BMContractsLockBars0:setAlpha( 0 )
				self.clipFinished( BMContractsLockBars0, {} )
				bmContractBrandIcon:completeAnimation()
				self.bmContractBrandIcon:setAlpha( 0 )
				self.clipFinished( bmContractBrandIcon, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 24 )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				itemImageSolid:completeAnimation()
				self.itemImageSolid:setAlpha( 0 )
				self.clipFinished( itemImageSolid, {} )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0 )
				self.clipFinished( itemImage, {} )
				itemImageLine:completeAnimation()
				self.itemImageLine:setAlpha( 0 )
				self.clipFinished( itemImageLine, {} )
				LabelButtonCount:completeAnimation()
				self.LabelButtonCount:setAlpha( 0 )
				self.clipFinished( LabelButtonCount, {} )
				tokenPermanentUnlock:completeAnimation()
				self.tokenPermanentUnlock:setAlpha( 0 )
				self.clipFinished( tokenPermanentUnlock, {} )
				tokenUnlock:completeAnimation()
				self.tokenUnlock:setAlpha( 0 )
				self.clipFinished( tokenUnlock, {} )
				LabelButton:completeAnimation()
				self.LabelButton:setAlpha( 0 )
				self.clipFinished( LabelButton, {} )
				equippedIcon:completeAnimation()
				self.equippedIcon:setAlpha( 0 )
				self.clipFinished( equippedIcon, {} )
				alertIcon:completeAnimation()
				self.alertIcon:setAlpha( 0 )
				self.clipFinished( alertIcon, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
				IconNew:completeAnimation()
				self.IconNew:setAlpha( 0 )
				self.clipFinished( IconNew, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBorder:completeAnimation()
				self.FocusBorder:setAlpha( 0 )
				self.clipFinished( FocusBorder, {} )
				glitch:completeAnimation()
				self.glitch:setAlpha( 0 )
				self.clipFinished( glitch, {} )
				glitch2:completeAnimation()
				self.glitch2:setAlpha( 0 )
				self.clipFinished( glitch2, {} )
				RestrictedItemWarning:completeAnimation()
				self.RestrictedItemWarning:setAlpha( 0 )
				self.clipFinished( RestrictedItemWarning, {} )
				TokenRefundHint:completeAnimation()
				self.TokenRefundHint:setAlpha( 0 )
				self.clipFinished( TokenRefundHint, {} )
				blackMarketBackground:completeAnimation()
				self.blackMarketBackground:setAlpha( 1 )
				self.clipFinished( blackMarketBackground, {} )
				BMGoldBarMed:completeAnimation()
				self.BMGoldBarMed:setAlpha( 1 )
				self.clipFinished( BMGoldBarMed, {} )
				blackMarketBrandIcon:completeAnimation()
				self.blackMarketBrandIcon:setAlpha( 1 )
				self.clipFinished( blackMarketBrandIcon, {} )
			end
		},
		ContractClassified = {
			DefaultClip = function ()
				self:setupElementClipCounter( 27 )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				itemImageSolid:completeAnimation()
				self.itemImageSolid:setAlpha( 0 )
				self.clipFinished( itemImageSolid, {} )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0 )
				self.clipFinished( itemImage, {} )
				itemImageLine:completeAnimation()
				self.itemImageLine:setAlpha( 0 )
				self.clipFinished( itemImageLine, {} )
				LabelButtonCount:completeAnimation()
				self.LabelButtonCount:setAlpha( 0 )
				self.clipFinished( LabelButtonCount, {} )
				tokenPermanentUnlock:completeAnimation()
				self.tokenPermanentUnlock:setAlpha( 0 )
				self.clipFinished( tokenPermanentUnlock, {} )
				tokenUnlock:completeAnimation()
				self.tokenUnlock:setAlpha( 0 )
				self.clipFinished( tokenUnlock, {} )
				LabelButton:completeAnimation()
				self.LabelButton:setAlpha( 0 )
				self.clipFinished( LabelButton, {} )
				equippedIcon:completeAnimation()
				self.equippedIcon:setAlpha( 0 )
				self.clipFinished( equippedIcon, {} )
				alertIcon:completeAnimation()
				self.alertIcon:setAlpha( 0 )
				self.clipFinished( alertIcon, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
				IconNew:completeAnimation()
				self.IconNew:setAlpha( 0 )
				self.clipFinished( IconNew, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBorder:completeAnimation()
				self.FocusBorder:setAlpha( 0 )
				self.clipFinished( FocusBorder, {} )
				glitch:completeAnimation()
				self.glitch:setAlpha( 0 )
				self.clipFinished( glitch, {} )
				glitch2:completeAnimation()
				self.glitch2:setAlpha( 0 )
				self.clipFinished( glitch2, {} )
				RestrictedItemWarning:completeAnimation()
				self.RestrictedItemWarning:setAlpha( 0 )
				self.clipFinished( RestrictedItemWarning, {} )
				TokenRefundHint:completeAnimation()
				self.TokenRefundHint:setAlpha( 0 )
				self.clipFinished( TokenRefundHint, {} )
				blackMarketBackground:completeAnimation()
				self.blackMarketBackground:setAlpha( 1 )
				self.clipFinished( blackMarketBackground, {} )
				BMGoldBarMed:completeAnimation()
				self.BMGoldBarMed:setLeftRight( false, false, -99, 99 )
				self.BMGoldBarMed:setTopBottom( false, false, -6.5, 6.5 )
				self.BMGoldBarMed:setAlpha( 0 )
				self.clipFinished( BMGoldBarMed, {} )
				blackMarketBrandIcon:completeAnimation()
				self.blackMarketBrandIcon:setLeftRight( false, false, -23, 23 )
				self.blackMarketBrandIcon:setTopBottom( false, false, -23, 23 )
				self.blackMarketBrandIcon:setAlpha( 0 )
				self.clipFinished( blackMarketBrandIcon, {} )
				BMContractsLockBars:completeAnimation()
				self.BMContractsLockBars:setAlpha( 1 )
				self.clipFinished( BMContractsLockBars, {} )
				BMContractsLockBars0:completeAnimation()
				self.BMContractsLockBars0:setAlpha( 1 )
				self.clipFinished( BMContractsLockBars0, {} )
				bmContractBrandIcon:completeAnimation()
				self.bmContractBrandIcon:setAlpha( 1 )
				self.clipFinished( bmContractBrandIcon, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 24 )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				itemImageSolid:completeAnimation()
				self.itemImageSolid:setAlpha( 0 )
				self.clipFinished( itemImageSolid, {} )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0 )
				self.clipFinished( itemImage, {} )
				itemImageLine:completeAnimation()
				self.itemImageLine:setAlpha( 0 )
				self.clipFinished( itemImageLine, {} )
				LabelButtonCount:completeAnimation()
				self.LabelButtonCount:setAlpha( 0 )
				self.clipFinished( LabelButtonCount, {} )
				tokenPermanentUnlock:completeAnimation()
				self.tokenPermanentUnlock:setAlpha( 0 )
				self.clipFinished( tokenPermanentUnlock, {} )
				tokenUnlock:completeAnimation()
				self.tokenUnlock:setAlpha( 0 )
				self.clipFinished( tokenUnlock, {} )
				LabelButton:completeAnimation()
				self.LabelButton:setAlpha( 0 )
				self.clipFinished( LabelButton, {} )
				equippedIcon:completeAnimation()
				self.equippedIcon:setAlpha( 0 )
				self.clipFinished( equippedIcon, {} )
				alertIcon:completeAnimation()
				self.alertIcon:setAlpha( 0 )
				self.clipFinished( alertIcon, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
				IconNew:completeAnimation()
				self.IconNew:setAlpha( 0 )
				self.clipFinished( IconNew, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBorder:completeAnimation()
				self.FocusBorder:setAlpha( 0 )
				self.clipFinished( FocusBorder, {} )
				glitch:completeAnimation()
				self.glitch:setAlpha( 0 )
				self.clipFinished( glitch, {} )
				glitch2:completeAnimation()
				self.glitch2:setAlpha( 0 )
				self.clipFinished( glitch2, {} )
				RestrictedItemWarning:completeAnimation()
				self.RestrictedItemWarning:setAlpha( 0 )
				self.clipFinished( RestrictedItemWarning, {} )
				TokenRefundHint:completeAnimation()
				self.TokenRefundHint:setAlpha( 0 )
				self.clipFinished( TokenRefundHint, {} )
				blackMarketBackground:completeAnimation()
				self.blackMarketBackground:setAlpha( 1 )
				self.clipFinished( blackMarketBackground, {} )
				BMGoldBarMed:completeAnimation()
				self.BMGoldBarMed:setAlpha( 0 )
				self.clipFinished( BMGoldBarMed, {} )
				blackMarketBrandIcon:completeAnimation()
				self.blackMarketBrandIcon:setAlpha( 0 )
				self.clipFinished( blackMarketBrandIcon, {} )
			end
		},
		Equipped = {
			DefaultClip = function ()
				self:setupElementClipCounter( 20 )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				itemImageSolid:completeAnimation()
				self.itemImageSolid:setAlpha( 0 )
				self.clipFinished( itemImageSolid, {} )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0.8 )
				self.clipFinished( itemImage, {} )
				itemImageLine:completeAnimation()
				self.itemImageLine:setAlpha( 0.3 )
				self.clipFinished( itemImageLine, {} )
				LabelButtonCount:completeAnimation()
				self.LabelButtonCount:setAlpha( 1 )
				self.clipFinished( LabelButtonCount, {} )
				LabelButton:completeAnimation()
				self.LabelButton:setAlpha( 1 )
				self.clipFinished( LabelButton, {} )
				equippedIcon:completeAnimation()
				self.equippedIcon:setAlpha( 1 )
				self.clipFinished( equippedIcon, {} )
				alertIcon:completeAnimation()
				self.alertIcon:setAlpha( 0 )
				self.clipFinished( alertIcon, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
				IconNew:completeAnimation()
				self.IconNew:setAlpha( 0 )
				self.clipFinished( IconNew, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBorder:completeAnimation()
				self.FocusBorder:setAlpha( 0 )
				self.clipFinished( FocusBorder, {} )
				glitch:completeAnimation()
				self.glitch:setAlpha( 0 )
				self.clipFinished( glitch, {} )
				glitch2:completeAnimation()
				self.glitch2:setAlpha( 0 )
				self.clipFinished( glitch2, {} )
				BMContractsLockBars:completeAnimation()
				self.BMContractsLockBars:setAlpha( 0 )
				self.clipFinished( BMContractsLockBars, {} )
				BMContractsLockBars0:completeAnimation()
				self.BMContractsLockBars0:setAlpha( 0 )
				self.clipFinished( BMContractsLockBars0, {} )
				bmContractBrandIcon:completeAnimation()
				self.bmContractBrandIcon:setAlpha( 0 )
				self.clipFinished( bmContractBrandIcon, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 7 )
				local BoxButtonLrgInactiveFrame2 = function ( BoxButtonLrgInactive, event )
					if not event.interrupted then
						BoxButtonLrgInactive:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					BoxButtonLrgInactive:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BoxButtonLrgInactive, event )
					else
						BoxButtonLrgInactive:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				BoxButtonLrgInactiveFrame2( BoxButtonLrgInactive, {} )
				local itemImageFrame2 = function ( itemImage, event )
					if not event.interrupted then
						itemImage:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
					end
					itemImage:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( itemImage, event )
					else
						itemImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0.8 )
				itemImageFrame2( itemImage, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					local FocusBarTFrame3 = function ( FocusBarT, event )
						local FocusBarTFrame4 = function ( FocusBarT, event )
							local FocusBarTFrame5 = function ( FocusBarT, event )
								local FocusBarTFrame6 = function ( FocusBarT, event )
									local FocusBarTFrame7 = function ( FocusBarT, event )
										if not event.interrupted then
											FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										end
										FocusBarT:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( FocusBarT, event )
										else
											FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										FocusBarTFrame7( FocusBarT, event )
										return 
									else
										FocusBarT:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBarTFrame6( FocusBarT, event )
									return 
								else
									FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									FocusBarT:setAlpha( 0.35 )
									FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarTFrame5( FocusBarT, event )
								return 
							else
								FocusBarT:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarTFrame4( FocusBarT, event )
							return 
						else
							FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FocusBarT:setAlpha( 0.57 )
							FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarTFrame3( FocusBarT, event )
						return 
					else
						FocusBarT:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame3 )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				FocusBarTFrame2( FocusBarT, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					local FocusBarBFrame3 = function ( FocusBarB, event )
						local FocusBarBFrame4 = function ( FocusBarB, event )
							local FocusBarBFrame5 = function ( FocusBarB, event )
								local FocusBarBFrame6 = function ( FocusBarB, event )
									local FocusBarBFrame7 = function ( FocusBarB, event )
										if not event.interrupted then
											FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										end
										FocusBarB:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( FocusBarB, event )
										else
											FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										FocusBarBFrame7( FocusBarB, event )
										return 
									else
										FocusBarB:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBarBFrame6( FocusBarB, event )
									return 
								else
									FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									FocusBarB:setAlpha( 0.21 )
									FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarBFrame5( FocusBarB, event )
								return 
							else
								FocusBarB:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarBFrame4( FocusBarB, event )
							return 
						else
							FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FocusBarB:setAlpha( 0.66 )
							FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarBFrame3( FocusBarB, event )
						return 
					else
						FocusBarB:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame3 )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBorderFrame2 = function ( FocusBorder, event )
					local FocusBorderFrame3 = function ( FocusBorder, event )
						local FocusBorderFrame4 = function ( FocusBorder, event )
							local FocusBorderFrame5 = function ( FocusBorder, event )
								local FocusBorderFrame6 = function ( FocusBorder, event )
									local FocusBorderFrame7 = function ( FocusBorder, event )
										local FocusBorderFrame8 = function ( FocusBorder, event )
											if not event.interrupted then
												FocusBorder:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
											end
											FocusBorder:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( FocusBorder, event )
											else
												FocusBorder:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											FocusBorderFrame8( FocusBorder, event )
											return 
										else
											FocusBorder:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											FocusBorder:setAlpha( 0.7 )
											FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame8 )
										end
									end
									
									if event.interrupted then
										FocusBorderFrame7( FocusBorder, event )
										return 
									else
										FocusBorder:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBorderFrame6( FocusBorder, event )
									return 
								else
									FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									FocusBorder:setAlpha( 0 )
									FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBorderFrame5( FocusBorder, event )
								return 
							else
								FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FocusBorder:setAlpha( 0.5 )
								FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBorderFrame4( FocusBorder, event )
							return 
						else
							FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FocusBorder:setAlpha( 1 )
							FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBorderFrame3( FocusBorder, event )
						return 
					else
						FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame3 )
					end
				end
				
				FocusBorder:completeAnimation()
				self.FocusBorder:setAlpha( 0 )
				FocusBorderFrame2( FocusBorder, {} )
				local glitchFrame2 = function ( glitch, event )
					local glitchFrame3 = function ( glitch, event )
						local glitchFrame4 = function ( glitch, event )
							local glitchFrame5 = function ( glitch, event )
								local glitchFrame6 = function ( glitch, event )
									local glitchFrame7 = function ( glitch, event )
										if not event.interrupted then
											glitch:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										end
										glitch:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( glitch, event )
										else
											glitch:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										glitchFrame7( glitch, event )
										return 
									else
										glitch:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame7 )
									end
								end
								
								if event.interrupted then
									glitchFrame6( glitch, event )
									return 
								else
									glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									glitch:setAlpha( 1 )
									glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame6 )
								end
							end
							
							if event.interrupted then
								glitchFrame5( glitch, event )
								return 
							else
								glitch:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame5 )
							end
						end
						
						if event.interrupted then
							glitchFrame4( glitch, event )
							return 
						else
							glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							glitch:setAlpha( 0 )
							glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame4 )
						end
					end
					
					if event.interrupted then
						glitchFrame3( glitch, event )
						return 
					else
						glitch:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame3 )
					end
				end
				
				glitch:completeAnimation()
				self.glitch:setAlpha( 1 )
				glitchFrame2( glitch, {} )
				local glitch2Frame2 = function ( glitch2, event )
					local glitch2Frame3 = function ( glitch2, event )
						local glitch2Frame4 = function ( glitch2, event )
							local glitch2Frame5 = function ( glitch2, event )
								local glitch2Frame6 = function ( glitch2, event )
									local glitch2Frame7 = function ( glitch2, event )
										if not event.interrupted then
											glitch2:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										end
										glitch2:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( glitch2, event )
										else
											glitch2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										glitch2Frame7( glitch2, event )
										return 
									else
										glitch2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame7 )
									end
								end
								
								if event.interrupted then
									glitch2Frame6( glitch2, event )
									return 
								else
									glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									glitch2:setAlpha( 1 )
									glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame6 )
								end
							end
							
							if event.interrupted then
								glitch2Frame5( glitch2, event )
								return 
							else
								glitch2:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame5 )
							end
						end
						
						if event.interrupted then
							glitch2Frame4( glitch2, event )
							return 
						else
							glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							glitch2:setAlpha( 0 )
							glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame4 )
						end
					end
					
					if event.interrupted then
						glitch2Frame3( glitch2, event )
						return 
					else
						glitch2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame3 )
					end
				end
				
				glitch2:completeAnimation()
				self.glitch2:setAlpha( 1 )
				glitch2Frame2( glitch2, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 4 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 1 )
				self.clipFinished( itemImage, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 7 )
				local BoxButtonLrgInactiveFrame2 = function ( BoxButtonLrgInactive, event )
					if not event.interrupted then
						BoxButtonLrgInactive:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
					end
					BoxButtonLrgInactive:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( BoxButtonLrgInactive, event )
					else
						BoxButtonLrgInactive:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				BoxButtonLrgInactiveFrame2( BoxButtonLrgInactive, {} )
				local itemImageFrame2 = function ( itemImage, event )
					if not event.interrupted then
						itemImage:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
					end
					itemImage:setAlpha( 0.8 )
					if event.interrupted then
						self.clipFinished( itemImage, event )
					else
						itemImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 1 )
				itemImageFrame2( itemImage, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					local FocusBarTFrame3 = function ( FocusBarT, event )
						local FocusBarTFrame4 = function ( FocusBarT, event )
							local FocusBarTFrame5 = function ( FocusBarT, event )
								local FocusBarTFrame6 = function ( FocusBarT, event )
									local FocusBarTFrame7 = function ( FocusBarT, event )
										if not event.interrupted then
											FocusBarT:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
										end
										FocusBarT:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( FocusBarT, event )
										else
											FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										FocusBarTFrame7( FocusBarT, event )
										return 
									else
										FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										FocusBarT:setAlpha( 0.35 )
										FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBarTFrame6( FocusBarT, event )
									return 
								else
									FocusBarT:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarTFrame5( FocusBarT, event )
								return 
							else
								FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FocusBarT:setAlpha( 0.57 )
								FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarTFrame4( FocusBarT, event )
							return 
						else
							FocusBarT:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							FocusBarT:setAlpha( 0 )
							FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarTFrame3( FocusBarT, event )
						return 
					else
						FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FocusBarT:setAlpha( 0.35 )
						FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame3 )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				FocusBarTFrame2( FocusBarT, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					local FocusBarBFrame3 = function ( FocusBarB, event )
						local FocusBarBFrame4 = function ( FocusBarB, event )
							local FocusBarBFrame5 = function ( FocusBarB, event )
								local FocusBarBFrame6 = function ( FocusBarB, event )
									local FocusBarBFrame7 = function ( FocusBarB, event )
										if not event.interrupted then
											FocusBarB:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
										end
										FocusBarB:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( FocusBarB, event )
										else
											FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										FocusBarBFrame7( FocusBarB, event )
										return 
									else
										FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										FocusBarB:setAlpha( 0.21 )
										FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBarBFrame6( FocusBarB, event )
									return 
								else
									FocusBarB:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarBFrame5( FocusBarB, event )
								return 
							else
								FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FocusBarB:setAlpha( 0.66 )
								FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarBFrame4( FocusBarB, event )
							return 
						else
							FocusBarB:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							FocusBarB:setAlpha( 0 )
							FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarBFrame3( FocusBarB, event )
						return 
					else
						FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FocusBarB:setAlpha( 0.21 )
						FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame3 )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBorderFrame2 = function ( FocusBorder, event )
					local FocusBorderFrame3 = function ( FocusBorder, event )
						local FocusBorderFrame4 = function ( FocusBorder, event )
							local FocusBorderFrame5 = function ( FocusBorder, event )
								local FocusBorderFrame6 = function ( FocusBorder, event )
									local FocusBorderFrame7 = function ( FocusBorder, event )
										local FocusBorderFrame8 = function ( FocusBorder, event )
											if not event.interrupted then
												FocusBorder:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
											end
											FocusBorder:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( FocusBorder, event )
											else
												FocusBorder:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											FocusBorderFrame8( FocusBorder, event )
											return 
										else
											FocusBorder:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											FocusBorder:setAlpha( 0.7 )
											FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame8 )
										end
									end
									
									if event.interrupted then
										FocusBorderFrame7( FocusBorder, event )
										return 
									else
										FocusBorder:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBorderFrame6( FocusBorder, event )
									return 
								else
									FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									FocusBorder:setAlpha( 0 )
									FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBorderFrame5( FocusBorder, event )
								return 
							else
								FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FocusBorder:setAlpha( 0.5 )
								FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBorderFrame4( FocusBorder, event )
							return 
						else
							FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FocusBorder:setAlpha( 1 )
							FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBorderFrame3( FocusBorder, event )
						return 
					else
						FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FocusBorder:setAlpha( 0 )
						FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame3 )
					end
				end
				
				FocusBorder:completeAnimation()
				self.FocusBorder:setAlpha( 0.7 )
				FocusBorderFrame2( FocusBorder, {} )
				local glitchFrame2 = function ( glitch, event )
					local glitchFrame3 = function ( glitch, event )
						local glitchFrame4 = function ( glitch, event )
							local glitchFrame5 = function ( glitch, event )
								local glitchFrame6 = function ( glitch, event )
									local glitchFrame7 = function ( glitch, event )
										local glitchFrame8 = function ( glitch, event )
											if not event.interrupted then
												glitch:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
											end
											glitch:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( glitch, event )
											else
												glitch:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											glitchFrame8( glitch, event )
											return 
										else
											glitch:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											glitch:setAlpha( 0.4 )
											glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame8 )
										end
									end
									
									if event.interrupted then
										glitchFrame7( glitch, event )
										return 
									else
										glitch:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame7 )
									end
								end
								
								if event.interrupted then
									glitchFrame6( glitch, event )
									return 
								else
									glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									glitch:setAlpha( 0 )
									glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame6 )
								end
							end
							
							if event.interrupted then
								glitchFrame5( glitch, event )
								return 
							else
								glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame5 )
							end
						end
						
						if event.interrupted then
							glitchFrame4( glitch, event )
							return 
						else
							glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							glitch:setAlpha( 1 )
							glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame4 )
						end
					end
					
					if event.interrupted then
						glitchFrame3( glitch, event )
						return 
					else
						glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame3 )
					end
				end
				
				glitch:completeAnimation()
				self.glitch:setAlpha( 0 )
				glitchFrame2( glitch, {} )
				local glitch2Frame2 = function ( glitch2, event )
					local glitch2Frame3 = function ( glitch2, event )
						local glitch2Frame4 = function ( glitch2, event )
							local glitch2Frame5 = function ( glitch2, event )
								local glitch2Frame6 = function ( glitch2, event )
									local glitch2Frame7 = function ( glitch2, event )
										local glitch2Frame8 = function ( glitch2, event )
											if not event.interrupted then
												glitch2:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
											end
											glitch2:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( glitch2, event )
											else
												glitch2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											glitch2Frame8( glitch2, event )
											return 
										else
											glitch2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											glitch2:setAlpha( 0.57 )
											glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame8 )
										end
									end
									
									if event.interrupted then
										glitch2Frame7( glitch2, event )
										return 
									else
										glitch2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame7 )
									end
								end
								
								if event.interrupted then
									glitch2Frame6( glitch2, event )
									return 
								else
									glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									glitch2:setAlpha( 0 )
									glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame6 )
								end
							end
							
							if event.interrupted then
								glitch2Frame5( glitch2, event )
								return 
							else
								glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame5 )
							end
						end
						
						if event.interrupted then
							glitch2Frame4( glitch2, event )
							return 
						else
							glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							glitch2:setAlpha( 1 )
							glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame4 )
						end
					end
					
					if event.interrupted then
						glitch2Frame3( glitch2, event )
						return 
					else
						glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame3 )
					end
				end
				
				glitch2:completeAnimation()
				self.glitch2:setAlpha( 0 )
				glitch2Frame2( glitch2, {} )
			end
		},
		New = {
			DefaultClip = function ()
				self:setupElementClipCounter( 20 )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				itemImageSolid:completeAnimation()
				self.itemImageSolid:setAlpha( 0 )
				self.clipFinished( itemImageSolid, {} )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0.3 )
				self.itemImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				self.clipFinished( itemImage, {} )
				itemImageLine:completeAnimation()
				self.itemImageLine:setAlpha( 0.3 )
				self.clipFinished( itemImageLine, {} )
				tokenUnlock:completeAnimation()
				self.tokenUnlock:setAlpha( 1 )
				self.clipFinished( tokenUnlock, {} )
				LabelButton:completeAnimation()
				self.LabelButton:setAlpha( 1 )
				self.clipFinished( LabelButton, {} )
				equippedIcon:completeAnimation()
				self.equippedIcon:setAlpha( 0 )
				self.clipFinished( equippedIcon, {} )
				alertIcon:completeAnimation()
				self.alertIcon:setAlpha( 0 )
				self.clipFinished( alertIcon, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
				IconNew:completeAnimation()
				self.IconNew:setAlpha( 1 )
				self.clipFinished( IconNew, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBorder:completeAnimation()
				self.FocusBorder:setAlpha( 0 )
				self.clipFinished( FocusBorder, {} )
				glitch:completeAnimation()
				self.glitch:setAlpha( 0 )
				self.clipFinished( glitch, {} )
				glitch2:completeAnimation()
				self.glitch2:setAlpha( 0 )
				self.clipFinished( glitch2, {} )
				BMContractsLockBars:completeAnimation()
				self.BMContractsLockBars:setAlpha( 0 )
				self.clipFinished( BMContractsLockBars, {} )
				BMContractsLockBars0:completeAnimation()
				self.BMContractsLockBars0:setAlpha( 0 )
				self.clipFinished( BMContractsLockBars0, {} )
				bmContractBrandIcon:completeAnimation()
				self.bmContractBrandIcon:setAlpha( 0 )
				self.clipFinished( bmContractBrandIcon, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 6 )
				local BoxButtonLrgInactiveFrame2 = function ( BoxButtonLrgInactive, event )
					if not event.interrupted then
						BoxButtonLrgInactive:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
					end
					BoxButtonLrgInactive:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BoxButtonLrgInactive, event )
					else
						BoxButtonLrgInactive:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				BoxButtonLrgInactiveFrame2( BoxButtonLrgInactive, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					local FocusBarTFrame3 = function ( FocusBarT, event )
						local FocusBarTFrame4 = function ( FocusBarT, event )
							local FocusBarTFrame5 = function ( FocusBarT, event )
								local FocusBarTFrame6 = function ( FocusBarT, event )
									local FocusBarTFrame7 = function ( FocusBarT, event )
										if not event.interrupted then
											FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										end
										FocusBarT:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( FocusBarT, event )
										else
											FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										FocusBarTFrame7( FocusBarT, event )
										return 
									else
										FocusBarT:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBarTFrame6( FocusBarT, event )
									return 
								else
									FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									FocusBarT:setAlpha( 0.35 )
									FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarTFrame5( FocusBarT, event )
								return 
							else
								FocusBarT:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarTFrame4( FocusBarT, event )
							return 
						else
							FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FocusBarT:setAlpha( 0.57 )
							FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarTFrame3( FocusBarT, event )
						return 
					else
						FocusBarT:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame3 )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				FocusBarTFrame2( FocusBarT, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					local FocusBarBFrame3 = function ( FocusBarB, event )
						local FocusBarBFrame4 = function ( FocusBarB, event )
							local FocusBarBFrame5 = function ( FocusBarB, event )
								local FocusBarBFrame6 = function ( FocusBarB, event )
									local FocusBarBFrame7 = function ( FocusBarB, event )
										if not event.interrupted then
											FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										end
										FocusBarB:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( FocusBarB, event )
										else
											FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										FocusBarBFrame7( FocusBarB, event )
										return 
									else
										FocusBarB:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBarBFrame6( FocusBarB, event )
									return 
								else
									FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									FocusBarB:setAlpha( 0.21 )
									FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarBFrame5( FocusBarB, event )
								return 
							else
								FocusBarB:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarBFrame4( FocusBarB, event )
							return 
						else
							FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FocusBarB:setAlpha( 0.66 )
							FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarBFrame3( FocusBarB, event )
						return 
					else
						FocusBarB:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame3 )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBorderFrame2 = function ( FocusBorder, event )
					local FocusBorderFrame3 = function ( FocusBorder, event )
						local FocusBorderFrame4 = function ( FocusBorder, event )
							local FocusBorderFrame5 = function ( FocusBorder, event )
								local FocusBorderFrame6 = function ( FocusBorder, event )
									local FocusBorderFrame7 = function ( FocusBorder, event )
										local FocusBorderFrame8 = function ( FocusBorder, event )
											if not event.interrupted then
												FocusBorder:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
											end
											FocusBorder:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( FocusBorder, event )
											else
												FocusBorder:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											FocusBorderFrame8( FocusBorder, event )
											return 
										else
											FocusBorder:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											FocusBorder:setAlpha( 0.7 )
											FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame8 )
										end
									end
									
									if event.interrupted then
										FocusBorderFrame7( FocusBorder, event )
										return 
									else
										FocusBorder:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBorderFrame6( FocusBorder, event )
									return 
								else
									FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									FocusBorder:setAlpha( 0 )
									FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBorderFrame5( FocusBorder, event )
								return 
							else
								FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FocusBorder:setAlpha( 0.5 )
								FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBorderFrame4( FocusBorder, event )
							return 
						else
							FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FocusBorder:setAlpha( 1 )
							FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBorderFrame3( FocusBorder, event )
						return 
					else
						FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame3 )
					end
				end
				
				FocusBorder:completeAnimation()
				self.FocusBorder:setAlpha( 0 )
				FocusBorderFrame2( FocusBorder, {} )
				local glitchFrame2 = function ( glitch, event )
					local glitchFrame3 = function ( glitch, event )
						local glitchFrame4 = function ( glitch, event )
							local glitchFrame5 = function ( glitch, event )
								local glitchFrame6 = function ( glitch, event )
									local glitchFrame7 = function ( glitch, event )
										if not event.interrupted then
											glitch:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										end
										glitch:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( glitch, event )
										else
											glitch:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										glitchFrame7( glitch, event )
										return 
									else
										glitch:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame7 )
									end
								end
								
								if event.interrupted then
									glitchFrame6( glitch, event )
									return 
								else
									glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									glitch:setAlpha( 1 )
									glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame6 )
								end
							end
							
							if event.interrupted then
								glitchFrame5( glitch, event )
								return 
							else
								glitch:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame5 )
							end
						end
						
						if event.interrupted then
							glitchFrame4( glitch, event )
							return 
						else
							glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							glitch:setAlpha( 0 )
							glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame4 )
						end
					end
					
					if event.interrupted then
						glitchFrame3( glitch, event )
						return 
					else
						glitch:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame3 )
					end
				end
				
				glitch:completeAnimation()
				self.glitch:setAlpha( 1 )
				glitchFrame2( glitch, {} )
				local glitch2Frame2 = function ( glitch2, event )
					local glitch2Frame3 = function ( glitch2, event )
						local glitch2Frame4 = function ( glitch2, event )
							local glitch2Frame5 = function ( glitch2, event )
								local glitch2Frame6 = function ( glitch2, event )
									local glitch2Frame7 = function ( glitch2, event )
										if not event.interrupted then
											glitch2:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										end
										glitch2:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( glitch2, event )
										else
											glitch2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										glitch2Frame7( glitch2, event )
										return 
									else
										glitch2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame7 )
									end
								end
								
								if event.interrupted then
									glitch2Frame6( glitch2, event )
									return 
								else
									glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									glitch2:setAlpha( 1 )
									glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame6 )
								end
							end
							
							if event.interrupted then
								glitch2Frame5( glitch2, event )
								return 
							else
								glitch2:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame5 )
							end
						end
						
						if event.interrupted then
							glitch2Frame4( glitch2, event )
							return 
						else
							glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							glitch2:setAlpha( 0 )
							glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame4 )
						end
					end
					
					if event.interrupted then
						glitch2Frame3( glitch2, event )
						return 
					else
						glitch2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame3 )
					end
				end
				
				glitch2:completeAnimation()
				self.glitch2:setAlpha( 1 )
				glitch2Frame2( glitch2, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 3 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 6 )
				local BoxButtonLrgInactiveFrame2 = function ( BoxButtonLrgInactive, event )
					if not event.interrupted then
						BoxButtonLrgInactive:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
					end
					BoxButtonLrgInactive:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( BoxButtonLrgInactive, event )
					else
						BoxButtonLrgInactive:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				BoxButtonLrgInactiveFrame2( BoxButtonLrgInactive, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					local FocusBarTFrame3 = function ( FocusBarT, event )
						local FocusBarTFrame4 = function ( FocusBarT, event )
							local FocusBarTFrame5 = function ( FocusBarT, event )
								local FocusBarTFrame6 = function ( FocusBarT, event )
									local FocusBarTFrame7 = function ( FocusBarT, event )
										if not event.interrupted then
											FocusBarT:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
										end
										FocusBarT:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( FocusBarT, event )
										else
											FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										FocusBarTFrame7( FocusBarT, event )
										return 
									else
										FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										FocusBarT:setAlpha( 0.35 )
										FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBarTFrame6( FocusBarT, event )
									return 
								else
									FocusBarT:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarTFrame5( FocusBarT, event )
								return 
							else
								FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FocusBarT:setAlpha( 0.57 )
								FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarTFrame4( FocusBarT, event )
							return 
						else
							FocusBarT:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							FocusBarT:setAlpha( 0 )
							FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarTFrame3( FocusBarT, event )
						return 
					else
						FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FocusBarT:setAlpha( 0.35 )
						FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame3 )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				FocusBarTFrame2( FocusBarT, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					local FocusBarBFrame3 = function ( FocusBarB, event )
						local FocusBarBFrame4 = function ( FocusBarB, event )
							local FocusBarBFrame5 = function ( FocusBarB, event )
								local FocusBarBFrame6 = function ( FocusBarB, event )
									local FocusBarBFrame7 = function ( FocusBarB, event )
										if not event.interrupted then
											FocusBarB:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
										end
										FocusBarB:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( FocusBarB, event )
										else
											FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										FocusBarBFrame7( FocusBarB, event )
										return 
									else
										FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										FocusBarB:setAlpha( 0.21 )
										FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBarBFrame6( FocusBarB, event )
									return 
								else
									FocusBarB:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarBFrame5( FocusBarB, event )
								return 
							else
								FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FocusBarB:setAlpha( 0.66 )
								FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarBFrame4( FocusBarB, event )
							return 
						else
							FocusBarB:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							FocusBarB:setAlpha( 0 )
							FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarBFrame3( FocusBarB, event )
						return 
					else
						FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FocusBarB:setAlpha( 0.21 )
						FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame3 )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBorderFrame2 = function ( FocusBorder, event )
					local FocusBorderFrame3 = function ( FocusBorder, event )
						local FocusBorderFrame4 = function ( FocusBorder, event )
							local FocusBorderFrame5 = function ( FocusBorder, event )
								local FocusBorderFrame6 = function ( FocusBorder, event )
									local FocusBorderFrame7 = function ( FocusBorder, event )
										local FocusBorderFrame8 = function ( FocusBorder, event )
											if not event.interrupted then
												FocusBorder:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
											end
											FocusBorder:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( FocusBorder, event )
											else
												FocusBorder:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											FocusBorderFrame8( FocusBorder, event )
											return 
										else
											FocusBorder:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											FocusBorder:setAlpha( 0.7 )
											FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame8 )
										end
									end
									
									if event.interrupted then
										FocusBorderFrame7( FocusBorder, event )
										return 
									else
										FocusBorder:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBorderFrame6( FocusBorder, event )
									return 
								else
									FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									FocusBorder:setAlpha( 0 )
									FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBorderFrame5( FocusBorder, event )
								return 
							else
								FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FocusBorder:setAlpha( 0.5 )
								FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBorderFrame4( FocusBorder, event )
							return 
						else
							FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FocusBorder:setAlpha( 1 )
							FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBorderFrame3( FocusBorder, event )
						return 
					else
						FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame3 )
					end
				end
				
				FocusBorder:completeAnimation()
				self.FocusBorder:setAlpha( 0 )
				FocusBorderFrame2( FocusBorder, {} )
				local glitchFrame2 = function ( glitch, event )
					local glitchFrame3 = function ( glitch, event )
						local glitchFrame4 = function ( glitch, event )
							local glitchFrame5 = function ( glitch, event )
								local glitchFrame6 = function ( glitch, event )
									local glitchFrame7 = function ( glitch, event )
										local glitchFrame8 = function ( glitch, event )
											if not event.interrupted then
												glitch:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
											end
											glitch:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( glitch, event )
											else
												glitch:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											glitchFrame8( glitch, event )
											return 
										else
											glitch:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											glitch:setAlpha( 0.4 )
											glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame8 )
										end
									end
									
									if event.interrupted then
										glitchFrame7( glitch, event )
										return 
									else
										glitch:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame7 )
									end
								end
								
								if event.interrupted then
									glitchFrame6( glitch, event )
									return 
								else
									glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									glitch:setAlpha( 0 )
									glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame6 )
								end
							end
							
							if event.interrupted then
								glitchFrame5( glitch, event )
								return 
							else
								glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame5 )
							end
						end
						
						if event.interrupted then
							glitchFrame4( glitch, event )
							return 
						else
							glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							glitch:setAlpha( 1 )
							glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame4 )
						end
					end
					
					if event.interrupted then
						glitchFrame3( glitch, event )
						return 
					else
						glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame3 )
					end
				end
				
				glitch:completeAnimation()
				self.glitch:setAlpha( 0 )
				glitchFrame2( glitch, {} )
				local glitch2Frame2 = function ( glitch2, event )
					local glitch2Frame3 = function ( glitch2, event )
						local glitch2Frame4 = function ( glitch2, event )
							local glitch2Frame5 = function ( glitch2, event )
								local glitch2Frame6 = function ( glitch2, event )
									local glitch2Frame7 = function ( glitch2, event )
										local glitch2Frame8 = function ( glitch2, event )
											if not event.interrupted then
												glitch2:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
											end
											glitch2:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( glitch2, event )
											else
												glitch2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											glitch2Frame8( glitch2, event )
											return 
										else
											glitch2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											glitch2:setAlpha( 0.57 )
											glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame8 )
										end
									end
									
									if event.interrupted then
										glitch2Frame7( glitch2, event )
										return 
									else
										glitch2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame7 )
									end
								end
								
								if event.interrupted then
									glitch2Frame6( glitch2, event )
									return 
								else
									glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									glitch2:setAlpha( 0 )
									glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame6 )
								end
							end
							
							if event.interrupted then
								glitch2Frame5( glitch2, event )
								return 
							else
								glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame5 )
							end
						end
						
						if event.interrupted then
							glitch2Frame4( glitch2, event )
							return 
						else
							glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							glitch2:setAlpha( 1 )
							glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame4 )
						end
					end
					
					if event.interrupted then
						glitch2Frame3( glitch2, event )
						return 
					else
						glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame3 )
					end
				end
				
				glitch2:completeAnimation()
				self.glitch2:setAlpha( 0 )
				glitch2Frame2( glitch2, {} )
			end
		},
		Locked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 18 )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				itemImageSolid:completeAnimation()
				self.itemImageSolid:setAlpha( 0 )
				self.clipFinished( itemImageSolid, {} )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0 )
				self.clipFinished( itemImage, {} )
				itemImageLine:completeAnimation()
				self.itemImageLine:setAlpha( 0.1 )
				self.clipFinished( itemImageLine, {} )
				LabelButtonCount:completeAnimation()
				self.LabelButtonCount:setAlpha( 0.6 )
				self.clipFinished( LabelButtonCount, {} )
				LabelButton:completeAnimation()
				self.LabelButton:setAlpha( 0.6 )
				self.clipFinished( LabelButton, {} )
				equippedIcon:completeAnimation()
				self.equippedIcon:setAlpha( 0 )
				self.clipFinished( equippedIcon, {} )
				alertIcon:completeAnimation()
				self.alertIcon:setAlpha( 0 )
				self.clipFinished( alertIcon, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0.8 )
				self.clipFinished( lockedIcon, {} )
				IconNew:completeAnimation()
				self.IconNew:setAlpha( 0 )
				self.clipFinished( IconNew, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBorder:completeAnimation()
				self.FocusBorder:setAlpha( 0 )
				self.clipFinished( FocusBorder, {} )
				glitch:completeAnimation()
				self.glitch:setAlpha( 0 )
				self.clipFinished( glitch, {} )
				glitch2:completeAnimation()
				self.glitch2:setAlpha( 0 )
				self.clipFinished( glitch2, {} )
				TokenRefundHint:completeAnimation()
				self.TokenRefundHint:setAlpha( 0 )
				self.clipFinished( TokenRefundHint, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 7 )
				local BoxButtonLrgInactiveFrame2 = function ( BoxButtonLrgInactive, event )
					if not event.interrupted then
						BoxButtonLrgInactive:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					BoxButtonLrgInactive:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BoxButtonLrgInactive, event )
					else
						BoxButtonLrgInactive:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				BoxButtonLrgInactiveFrame2( BoxButtonLrgInactive, {} )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					local FocusBarTFrame3 = function ( FocusBarT, event )
						local FocusBarTFrame4 = function ( FocusBarT, event )
							local FocusBarTFrame5 = function ( FocusBarT, event )
								local FocusBarTFrame6 = function ( FocusBarT, event )
									local FocusBarTFrame7 = function ( FocusBarT, event )
										if not event.interrupted then
											FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										end
										FocusBarT:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( FocusBarT, event )
										else
											FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										FocusBarTFrame7( FocusBarT, event )
										return 
									else
										FocusBarT:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBarTFrame6( FocusBarT, event )
									return 
								else
									FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									FocusBarT:setAlpha( 0.35 )
									FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarTFrame5( FocusBarT, event )
								return 
							else
								FocusBarT:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarTFrame4( FocusBarT, event )
							return 
						else
							FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FocusBarT:setAlpha( 0.57 )
							FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarTFrame3( FocusBarT, event )
						return 
					else
						FocusBarT:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame3 )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				FocusBarTFrame2( FocusBarT, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					local FocusBarBFrame3 = function ( FocusBarB, event )
						local FocusBarBFrame4 = function ( FocusBarB, event )
							local FocusBarBFrame5 = function ( FocusBarB, event )
								local FocusBarBFrame6 = function ( FocusBarB, event )
									local FocusBarBFrame7 = function ( FocusBarB, event )
										if not event.interrupted then
											FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										end
										FocusBarB:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( FocusBarB, event )
										else
											FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										FocusBarBFrame7( FocusBarB, event )
										return 
									else
										FocusBarB:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBarBFrame6( FocusBarB, event )
									return 
								else
									FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									FocusBarB:setAlpha( 0.21 )
									FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarBFrame5( FocusBarB, event )
								return 
							else
								FocusBarB:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarBFrame4( FocusBarB, event )
							return 
						else
							FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FocusBarB:setAlpha( 0.66 )
							FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarBFrame3( FocusBarB, event )
						return 
					else
						FocusBarB:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame3 )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBorderFrame2 = function ( FocusBorder, event )
					local FocusBorderFrame3 = function ( FocusBorder, event )
						local FocusBorderFrame4 = function ( FocusBorder, event )
							local FocusBorderFrame5 = function ( FocusBorder, event )
								local FocusBorderFrame6 = function ( FocusBorder, event )
									local FocusBorderFrame7 = function ( FocusBorder, event )
										local FocusBorderFrame8 = function ( FocusBorder, event )
											if not event.interrupted then
												FocusBorder:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
											end
											FocusBorder:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( FocusBorder, event )
											else
												FocusBorder:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											FocusBorderFrame8( FocusBorder, event )
											return 
										else
											FocusBorder:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											FocusBorder:setAlpha( 0.7 )
											FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame8 )
										end
									end
									
									if event.interrupted then
										FocusBorderFrame7( FocusBorder, event )
										return 
									else
										FocusBorder:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBorderFrame6( FocusBorder, event )
									return 
								else
									FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									FocusBorder:setAlpha( 0 )
									FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBorderFrame5( FocusBorder, event )
								return 
							else
								FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FocusBorder:setAlpha( 0.5 )
								FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBorderFrame4( FocusBorder, event )
							return 
						else
							FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FocusBorder:setAlpha( 1 )
							FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBorderFrame3( FocusBorder, event )
						return 
					else
						FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame3 )
					end
				end
				
				FocusBorder:completeAnimation()
				self.FocusBorder:setAlpha( 0 )
				FocusBorderFrame2( FocusBorder, {} )
				local glitchFrame2 = function ( glitch, event )
					local glitchFrame3 = function ( glitch, event )
						local glitchFrame4 = function ( glitch, event )
							local glitchFrame5 = function ( glitch, event )
								local glitchFrame6 = function ( glitch, event )
									local glitchFrame7 = function ( glitch, event )
										if not event.interrupted then
											glitch:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										end
										glitch:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( glitch, event )
										else
											glitch:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										glitchFrame7( glitch, event )
										return 
									else
										glitch:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame7 )
									end
								end
								
								if event.interrupted then
									glitchFrame6( glitch, event )
									return 
								else
									glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									glitch:setAlpha( 1 )
									glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame6 )
								end
							end
							
							if event.interrupted then
								glitchFrame5( glitch, event )
								return 
							else
								glitch:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame5 )
							end
						end
						
						if event.interrupted then
							glitchFrame4( glitch, event )
							return 
						else
							glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							glitch:setAlpha( 0 )
							glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame4 )
						end
					end
					
					if event.interrupted then
						glitchFrame3( glitch, event )
						return 
					else
						glitch:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame3 )
					end
				end
				
				glitch:completeAnimation()
				self.glitch:setAlpha( 1 )
				glitchFrame2( glitch, {} )
				local glitch2Frame2 = function ( glitch2, event )
					local glitch2Frame3 = function ( glitch2, event )
						local glitch2Frame4 = function ( glitch2, event )
							local glitch2Frame5 = function ( glitch2, event )
								local glitch2Frame6 = function ( glitch2, event )
									local glitch2Frame7 = function ( glitch2, event )
										if not event.interrupted then
											glitch2:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										end
										glitch2:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( glitch2, event )
										else
											glitch2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										glitch2Frame7( glitch2, event )
										return 
									else
										glitch2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame7 )
									end
								end
								
								if event.interrupted then
									glitch2Frame6( glitch2, event )
									return 
								else
									glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									glitch2:setAlpha( 1 )
									glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame6 )
								end
							end
							
							if event.interrupted then
								glitch2Frame5( glitch2, event )
								return 
							else
								glitch2:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame5 )
							end
						end
						
						if event.interrupted then
							glitch2Frame4( glitch2, event )
							return 
						else
							glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							glitch2:setAlpha( 0 )
							glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame4 )
						end
					end
					
					if event.interrupted then
						glitch2Frame3( glitch2, event )
						return 
					else
						glitch2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame3 )
					end
				end
				
				glitch2:completeAnimation()
				self.glitch2:setAlpha( 1 )
				glitch2Frame2( glitch2, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 5 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				TokenRefundHint:completeAnimation()
				self.TokenRefundHint:setAlpha( 0 )
				self.clipFinished( TokenRefundHint, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 7 )
				local BoxButtonLrgInactiveFrame2 = function ( BoxButtonLrgInactive, event )
					if not event.interrupted then
						BoxButtonLrgInactive:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
					end
					BoxButtonLrgInactive:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BoxButtonLrgInactive, event )
					else
						BoxButtonLrgInactive:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				BoxButtonLrgInactiveFrame2( BoxButtonLrgInactive, {} )
				local BoxButtonLrgIdleFrame2 = function ( BoxButtonLrgIdle, event )
					if not event.interrupted then
						BoxButtonLrgIdle:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
					end
					BoxButtonLrgIdle:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( BoxButtonLrgIdle, event )
					else
						BoxButtonLrgIdle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0 )
				BoxButtonLrgIdleFrame2( BoxButtonLrgIdle, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					local FocusBarTFrame3 = function ( FocusBarT, event )
						local FocusBarTFrame4 = function ( FocusBarT, event )
							local FocusBarTFrame5 = function ( FocusBarT, event )
								local FocusBarTFrame6 = function ( FocusBarT, event )
									local FocusBarTFrame7 = function ( FocusBarT, event )
										if not event.interrupted then
											FocusBarT:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
										end
										FocusBarT:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( FocusBarT, event )
										else
											FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										FocusBarTFrame7( FocusBarT, event )
										return 
									else
										FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										FocusBarT:setAlpha( 0.35 )
										FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBarTFrame6( FocusBarT, event )
									return 
								else
									FocusBarT:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarTFrame5( FocusBarT, event )
								return 
							else
								FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FocusBarT:setAlpha( 0.57 )
								FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarTFrame4( FocusBarT, event )
							return 
						else
							FocusBarT:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							FocusBarT:setAlpha( 0 )
							FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarTFrame3( FocusBarT, event )
						return 
					else
						FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FocusBarT:setAlpha( 0.35 )
						FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame3 )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				FocusBarTFrame2( FocusBarT, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					local FocusBarBFrame3 = function ( FocusBarB, event )
						local FocusBarBFrame4 = function ( FocusBarB, event )
							local FocusBarBFrame5 = function ( FocusBarB, event )
								local FocusBarBFrame6 = function ( FocusBarB, event )
									local FocusBarBFrame7 = function ( FocusBarB, event )
										if not event.interrupted then
											FocusBarB:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
										end
										FocusBarB:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( FocusBarB, event )
										else
											FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										FocusBarBFrame7( FocusBarB, event )
										return 
									else
										FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										FocusBarB:setAlpha( 0.21 )
										FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBarBFrame6( FocusBarB, event )
									return 
								else
									FocusBarB:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarBFrame5( FocusBarB, event )
								return 
							else
								FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FocusBarB:setAlpha( 0.66 )
								FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarBFrame4( FocusBarB, event )
							return 
						else
							FocusBarB:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							FocusBarB:setAlpha( 0 )
							FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarBFrame3( FocusBarB, event )
						return 
					else
						FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FocusBarB:setAlpha( 0.21 )
						FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame3 )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBorderFrame2 = function ( FocusBorder, event )
					local FocusBorderFrame3 = function ( FocusBorder, event )
						local FocusBorderFrame4 = function ( FocusBorder, event )
							local FocusBorderFrame5 = function ( FocusBorder, event )
								local FocusBorderFrame6 = function ( FocusBorder, event )
									local FocusBorderFrame7 = function ( FocusBorder, event )
										local FocusBorderFrame8 = function ( FocusBorder, event )
											if not event.interrupted then
												FocusBorder:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
											end
											FocusBorder:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( FocusBorder, event )
											else
												FocusBorder:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											FocusBorderFrame8( FocusBorder, event )
											return 
										else
											FocusBorder:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											FocusBorder:setAlpha( 0.7 )
											FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame8 )
										end
									end
									
									if event.interrupted then
										FocusBorderFrame7( FocusBorder, event )
										return 
									else
										FocusBorder:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBorderFrame6( FocusBorder, event )
									return 
								else
									FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									FocusBorder:setAlpha( 0 )
									FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBorderFrame5( FocusBorder, event )
								return 
							else
								FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FocusBorder:setAlpha( 0.5 )
								FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBorderFrame4( FocusBorder, event )
							return 
						else
							FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FocusBorder:setAlpha( 1 )
							FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBorderFrame3( FocusBorder, event )
						return 
					else
						FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame3 )
					end
				end
				
				FocusBorder:completeAnimation()
				self.FocusBorder:setAlpha( 0 )
				FocusBorderFrame2( FocusBorder, {} )
				local glitchFrame2 = function ( glitch, event )
					local glitchFrame3 = function ( glitch, event )
						local glitchFrame4 = function ( glitch, event )
							local glitchFrame5 = function ( glitch, event )
								local glitchFrame6 = function ( glitch, event )
									local glitchFrame7 = function ( glitch, event )
										local glitchFrame8 = function ( glitch, event )
											if not event.interrupted then
												glitch:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
											end
											glitch:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( glitch, event )
											else
												glitch:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											glitchFrame8( glitch, event )
											return 
										else
											glitch:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											glitch:setAlpha( 0.4 )
											glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame8 )
										end
									end
									
									if event.interrupted then
										glitchFrame7( glitch, event )
										return 
									else
										glitch:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame7 )
									end
								end
								
								if event.interrupted then
									glitchFrame6( glitch, event )
									return 
								else
									glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									glitch:setAlpha( 0 )
									glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame6 )
								end
							end
							
							if event.interrupted then
								glitchFrame5( glitch, event )
								return 
							else
								glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame5 )
							end
						end
						
						if event.interrupted then
							glitchFrame4( glitch, event )
							return 
						else
							glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							glitch:setAlpha( 1 )
							glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame4 )
						end
					end
					
					if event.interrupted then
						glitchFrame3( glitch, event )
						return 
					else
						glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame3 )
					end
				end
				
				glitch:completeAnimation()
				self.glitch:setAlpha( 0 )
				glitchFrame2( glitch, {} )
				local glitch2Frame2 = function ( glitch2, event )
					local glitch2Frame3 = function ( glitch2, event )
						local glitch2Frame4 = function ( glitch2, event )
							local glitch2Frame5 = function ( glitch2, event )
								local glitch2Frame6 = function ( glitch2, event )
									local glitch2Frame7 = function ( glitch2, event )
										local glitch2Frame8 = function ( glitch2, event )
											if not event.interrupted then
												glitch2:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
											end
											glitch2:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( glitch2, event )
											else
												glitch2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											glitch2Frame8( glitch2, event )
											return 
										else
											glitch2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											glitch2:setAlpha( 0.57 )
											glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame8 )
										end
									end
									
									if event.interrupted then
										glitch2Frame7( glitch2, event )
										return 
									else
										glitch2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame7 )
									end
								end
								
								if event.interrupted then
									glitch2Frame6( glitch2, event )
									return 
								else
									glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									glitch2:setAlpha( 0 )
									glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame6 )
								end
							end
							
							if event.interrupted then
								glitch2Frame5( glitch2, event )
								return 
							else
								glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame5 )
							end
						end
						
						if event.interrupted then
							glitch2Frame4( glitch2, event )
							return 
						else
							glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							glitch2:setAlpha( 1 )
							glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame4 )
						end
					end
					
					if event.interrupted then
						glitch2Frame3( glitch2, event )
						return 
					else
						glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame3 )
					end
				end
				
				glitch2:completeAnimation()
				self.glitch2:setAlpha( 0 )
				glitch2Frame2( glitch2, {} )
			end
		},
		NotAvailable = {
			DefaultClip = function ()
				self:setupElementClipCounter( 21 )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				itemImageSolid:completeAnimation()
				self.itemImageSolid:setAlpha( 0 )
				self.clipFinished( itemImageSolid, {} )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0.4 )
				self.clipFinished( itemImage, {} )
				itemImageLine:completeAnimation()
				self.itemImageLine:setAlpha( 0.1 )
				self.clipFinished( itemImageLine, {} )
				LabelButtonCount:completeAnimation()
				self.LabelButtonCount:setAlpha( 0 )
				self.clipFinished( LabelButtonCount, {} )
				tokenUnlock:completeAnimation()
				self.tokenUnlock:setAlpha( 1 )
				self.clipFinished( tokenUnlock, {} )
				LabelButton:completeAnimation()
				self.LabelButton:setAlpha( 0.6 )
				self.clipFinished( LabelButton, {} )
				equippedIcon:completeAnimation()
				self.equippedIcon:setAlpha( 0 )
				self.clipFinished( equippedIcon, {} )
				alertIcon:completeAnimation()
				self.alertIcon:setAlpha( 0 )
				self.clipFinished( alertIcon, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
				IconNew:completeAnimation()
				self.IconNew:setAlpha( 0 )
				self.clipFinished( IconNew, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBorder:completeAnimation()
				self.FocusBorder:setAlpha( 0 )
				self.clipFinished( FocusBorder, {} )
				glitch:completeAnimation()
				self.glitch:setAlpha( 0 )
				self.clipFinished( glitch, {} )
				glitch2:completeAnimation()
				self.glitch2:setAlpha( 0 )
				self.clipFinished( glitch2, {} )
				BMContractsLockBars:completeAnimation()
				self.BMContractsLockBars:setAlpha( 0 )
				self.clipFinished( BMContractsLockBars, {} )
				BMContractsLockBars0:completeAnimation()
				self.BMContractsLockBars0:setAlpha( 0 )
				self.clipFinished( BMContractsLockBars0, {} )
				bmContractBrandIcon:completeAnimation()
				self.bmContractBrandIcon:setAlpha( 0 )
				self.clipFinished( bmContractBrandIcon, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 9 )
				local BoxButtonLrgInactiveFrame2 = function ( BoxButtonLrgInactive, event )
					if not event.interrupted then
						BoxButtonLrgInactive:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					BoxButtonLrgInactive:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BoxButtonLrgInactive, event )
					else
						BoxButtonLrgInactive:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				BoxButtonLrgInactiveFrame2( BoxButtonLrgInactive, {} )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				LabelButtonCount:completeAnimation()
				self.LabelButtonCount:setAlpha( 0.6 )
				self.clipFinished( LabelButtonCount, {} )
				LabelButton:completeAnimation()
				self.LabelButton:setAlpha( 0.6 )
				self.clipFinished( LabelButton, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					local FocusBarTFrame3 = function ( FocusBarT, event )
						local FocusBarTFrame4 = function ( FocusBarT, event )
							local FocusBarTFrame5 = function ( FocusBarT, event )
								local FocusBarTFrame6 = function ( FocusBarT, event )
									if not event.interrupted then
										FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									end
									FocusBarT:setAlpha( 1 )
									if event.interrupted then
										self.clipFinished( FocusBarT, event )
									else
										FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									FocusBarTFrame6( FocusBarT, event )
									return 
								else
									FocusBarT:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									FocusBarT:setAlpha( 0.35 )
									FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarTFrame5( FocusBarT, event )
								return 
							else
								FocusBarT:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								FocusBarT:setAlpha( 0 )
								FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarTFrame4( FocusBarT, event )
							return 
						else
							FocusBarT:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							FocusBarT:setAlpha( 0.57 )
							FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarTFrame3( FocusBarT, event )
						return 
					else
						FocusBarT:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						FocusBarT:setAlpha( 0.35 )
						FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame3 )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				FocusBarTFrame2( FocusBarT, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					local FocusBarBFrame3 = function ( FocusBarB, event )
						local FocusBarBFrame4 = function ( FocusBarB, event )
							local FocusBarBFrame5 = function ( FocusBarB, event )
								local FocusBarBFrame6 = function ( FocusBarB, event )
									if not event.interrupted then
										FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									end
									FocusBarB:setAlpha( 1 )
									if event.interrupted then
										self.clipFinished( FocusBarB, event )
									else
										FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									FocusBarBFrame6( FocusBarB, event )
									return 
								else
									FocusBarB:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									FocusBarB:setAlpha( 0.21 )
									FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarBFrame5( FocusBarB, event )
								return 
							else
								FocusBarB:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								FocusBarB:setAlpha( 0 )
								FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarBFrame4( FocusBarB, event )
							return 
						else
							FocusBarB:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							FocusBarB:setAlpha( 0.66 )
							FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarBFrame3( FocusBarB, event )
						return 
					else
						FocusBarB:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						FocusBarB:setAlpha( 0.21 )
						FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame3 )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBorderFrame2 = function ( FocusBorder, event )
					local FocusBorderFrame3 = function ( FocusBorder, event )
						local FocusBorderFrame4 = function ( FocusBorder, event )
							local FocusBorderFrame5 = function ( FocusBorder, event )
								local FocusBorderFrame6 = function ( FocusBorder, event )
									local FocusBorderFrame7 = function ( FocusBorder, event )
										local FocusBorderFrame8 = function ( FocusBorder, event )
											if not event.interrupted then
												FocusBorder:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											end
											FocusBorder:setAlpha( 1 )
											if event.interrupted then
												self.clipFinished( FocusBorder, event )
											else
												FocusBorder:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											FocusBorderFrame8( FocusBorder, event )
											return 
										else
											FocusBorder:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											FocusBorder:setAlpha( 0 )
											FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame8 )
										end
									end
									
									if event.interrupted then
										FocusBorderFrame7( FocusBorder, event )
										return 
									else
										FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										FocusBorder:setAlpha( 1 )
										FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBorderFrame6( FocusBorder, event )
									return 
								else
									FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									FocusBorder:setAlpha( 0.5 )
									FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBorderFrame5( FocusBorder, event )
								return 
							else
								FocusBorder:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBorderFrame4( FocusBorder, event )
							return 
						else
							FocusBorder:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							FocusBorder:setAlpha( 0 )
							FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBorderFrame3( FocusBorder, event )
						return 
					else
						FocusBorder:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						FocusBorder:setAlpha( 0.7 )
						FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame3 )
					end
				end
				
				FocusBorder:completeAnimation()
				self.FocusBorder:setAlpha( 0 )
				FocusBorderFrame2( FocusBorder, {} )
				local glitchFrame2 = function ( glitch, event )
					local glitchFrame3 = function ( glitch, event )
						local glitchFrame4 = function ( glitch, event )
							local glitchFrame5 = function ( glitch, event )
								local glitchFrame6 = function ( glitch, event )
									local glitchFrame7 = function ( glitch, event )
										local glitchFrame8 = function ( glitch, event )
											if not event.interrupted then
												glitch:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											end
											glitch:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( glitch, event )
											else
												glitch:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											glitchFrame8( glitch, event )
											return 
										else
											glitch:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											glitch:setAlpha( 0 )
											glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame8 )
										end
									end
									
									if event.interrupted then
										glitchFrame7( glitch, event )
										return 
									else
										glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame7 )
									end
								end
								
								if event.interrupted then
									glitchFrame6( glitch, event )
									return 
								else
									glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									glitch:setAlpha( 1 )
									glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame6 )
								end
							end
							
							if event.interrupted then
								glitchFrame5( glitch, event )
								return 
							else
								glitch:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame5 )
							end
						end
						
						if event.interrupted then
							glitchFrame4( glitch, event )
							return 
						else
							glitch:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							glitch:setAlpha( 0 )
							glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame4 )
						end
					end
					
					if event.interrupted then
						glitchFrame3( glitch, event )
						return 
					else
						glitch:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						glitch:setAlpha( 0.4 )
						glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame3 )
					end
				end
				
				glitch:completeAnimation()
				self.glitch:setAlpha( 0 )
				glitchFrame2( glitch, {} )
				local glitch2Frame2 = function ( glitch2, event )
					local glitch2Frame3 = function ( glitch2, event )
						local glitch2Frame4 = function ( glitch2, event )
							local glitch2Frame5 = function ( glitch2, event )
								local glitch2Frame6 = function ( glitch2, event )
									local glitch2Frame7 = function ( glitch2, event )
										local glitch2Frame8 = function ( glitch2, event )
											if not event.interrupted then
												glitch2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											end
											glitch2:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( glitch2, event )
											else
												glitch2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											glitch2Frame8( glitch2, event )
											return 
										else
											glitch2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											glitch2:setAlpha( 0 )
											glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame8 )
										end
									end
									
									if event.interrupted then
										glitch2Frame7( glitch2, event )
										return 
									else
										glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame7 )
									end
								end
								
								if event.interrupted then
									glitch2Frame6( glitch2, event )
									return 
								else
									glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									glitch2:setAlpha( 1 )
									glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame6 )
								end
							end
							
							if event.interrupted then
								glitch2Frame5( glitch2, event )
								return 
							else
								glitch2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame5 )
							end
						end
						
						if event.interrupted then
							glitch2Frame4( glitch2, event )
							return 
						else
							glitch2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							glitch2:setAlpha( 0 )
							glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame4 )
						end
					end
					
					if event.interrupted then
						glitch2Frame3( glitch2, event )
						return 
					else
						glitch2:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						glitch2:setAlpha( 0.57 )
						glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame3 )
					end
				end
				
				glitch2:completeAnimation()
				self.glitch2:setAlpha( 0 )
				glitch2Frame2( glitch2, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 7 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0.4 )
				self.clipFinished( itemImage, {} )
				LabelButtonCount:completeAnimation()
				self.LabelButtonCount:setAlpha( 0.6 )
				self.clipFinished( LabelButtonCount, {} )
				LabelButton:completeAnimation()
				self.LabelButton:setAlpha( 0.6 )
				self.clipFinished( LabelButton, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 9 )
				local BoxButtonLrgInactiveFrame2 = function ( BoxButtonLrgInactive, event )
					if not event.interrupted then
						BoxButtonLrgInactive:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					BoxButtonLrgInactive:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( BoxButtonLrgInactive, event )
					else
						BoxButtonLrgInactive:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				BoxButtonLrgInactiveFrame2( BoxButtonLrgInactive, {} )
				local BoxButtonLrgIdleFrame2 = function ( BoxButtonLrgIdle, event )
					if not event.interrupted then
						BoxButtonLrgIdle:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					BoxButtonLrgIdle:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BoxButtonLrgIdle, event )
					else
						BoxButtonLrgIdle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 1 )
				BoxButtonLrgIdleFrame2( BoxButtonLrgIdle, {} )
				LabelButtonCount:completeAnimation()
				self.LabelButtonCount:setAlpha( 0.6 )
				self.clipFinished( LabelButtonCount, {} )
				LabelButton:completeAnimation()
				self.LabelButton:setAlpha( 0.6 )
				self.clipFinished( LabelButton, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					local FocusBarTFrame3 = function ( FocusBarT, event )
						local FocusBarTFrame4 = function ( FocusBarT, event )
							local FocusBarTFrame5 = function ( FocusBarT, event )
								local FocusBarTFrame6 = function ( FocusBarT, event )
									local FocusBarTFrame7 = function ( FocusBarT, event )
										if not event.interrupted then
											FocusBarT:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
										end
										FocusBarT:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( FocusBarT, event )
										else
											FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										FocusBarTFrame7( FocusBarT, event )
										return 
									else
										FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										FocusBarT:setAlpha( 0.35 )
										FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBarTFrame6( FocusBarT, event )
									return 
								else
									FocusBarT:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarTFrame5( FocusBarT, event )
								return 
							else
								FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FocusBarT:setAlpha( 0.57 )
								FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarTFrame4( FocusBarT, event )
							return 
						else
							FocusBarT:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							FocusBarT:setAlpha( 0 )
							FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarTFrame3( FocusBarT, event )
						return 
					else
						FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FocusBarT:setAlpha( 0.35 )
						FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame3 )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				FocusBarTFrame2( FocusBarT, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					local FocusBarBFrame3 = function ( FocusBarB, event )
						local FocusBarBFrame4 = function ( FocusBarB, event )
							local FocusBarBFrame5 = function ( FocusBarB, event )
								local FocusBarBFrame6 = function ( FocusBarB, event )
									local FocusBarBFrame7 = function ( FocusBarB, event )
										if not event.interrupted then
											FocusBarB:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
										end
										FocusBarB:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( FocusBarB, event )
										else
											FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										FocusBarBFrame7( FocusBarB, event )
										return 
									else
										FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										FocusBarB:setAlpha( 0.21 )
										FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBarBFrame6( FocusBarB, event )
									return 
								else
									FocusBarB:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarBFrame5( FocusBarB, event )
								return 
							else
								FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FocusBarB:setAlpha( 0.66 )
								FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarBFrame4( FocusBarB, event )
							return 
						else
							FocusBarB:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							FocusBarB:setAlpha( 0 )
							FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarBFrame3( FocusBarB, event )
						return 
					else
						FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FocusBarB:setAlpha( 0.21 )
						FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame3 )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBorderFrame2 = function ( FocusBorder, event )
					local FocusBorderFrame3 = function ( FocusBorder, event )
						local FocusBorderFrame4 = function ( FocusBorder, event )
							local FocusBorderFrame5 = function ( FocusBorder, event )
								local FocusBorderFrame6 = function ( FocusBorder, event )
									local FocusBorderFrame7 = function ( FocusBorder, event )
										local FocusBorderFrame8 = function ( FocusBorder, event )
											if not event.interrupted then
												FocusBorder:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
											end
											FocusBorder:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( FocusBorder, event )
											else
												FocusBorder:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											FocusBorderFrame8( FocusBorder, event )
											return 
										else
											FocusBorder:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											FocusBorder:setAlpha( 0.7 )
											FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame8 )
										end
									end
									
									if event.interrupted then
										FocusBorderFrame7( FocusBorder, event )
										return 
									else
										FocusBorder:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBorderFrame6( FocusBorder, event )
									return 
								else
									FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									FocusBorder:setAlpha( 0 )
									FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBorderFrame5( FocusBorder, event )
								return 
							else
								FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FocusBorder:setAlpha( 0.5 )
								FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBorderFrame4( FocusBorder, event )
							return 
						else
							FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FocusBorder:setAlpha( 1 )
							FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBorderFrame3( FocusBorder, event )
						return 
					else
						FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame3 )
					end
				end
				
				FocusBorder:completeAnimation()
				self.FocusBorder:setAlpha( 0 )
				FocusBorderFrame2( FocusBorder, {} )
				local glitchFrame2 = function ( glitch, event )
					local glitchFrame3 = function ( glitch, event )
						local glitchFrame4 = function ( glitch, event )
							local glitchFrame5 = function ( glitch, event )
								local glitchFrame6 = function ( glitch, event )
									local glitchFrame7 = function ( glitch, event )
										local glitchFrame8 = function ( glitch, event )
											if not event.interrupted then
												glitch:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
											end
											glitch:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( glitch, event )
											else
												glitch:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											glitchFrame8( glitch, event )
											return 
										else
											glitch:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											glitch:setAlpha( 0.4 )
											glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame8 )
										end
									end
									
									if event.interrupted then
										glitchFrame7( glitch, event )
										return 
									else
										glitch:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame7 )
									end
								end
								
								if event.interrupted then
									glitchFrame6( glitch, event )
									return 
								else
									glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									glitch:setAlpha( 0 )
									glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame6 )
								end
							end
							
							if event.interrupted then
								glitchFrame5( glitch, event )
								return 
							else
								glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame5 )
							end
						end
						
						if event.interrupted then
							glitchFrame4( glitch, event )
							return 
						else
							glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							glitch:setAlpha( 1 )
							glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame4 )
						end
					end
					
					if event.interrupted then
						glitchFrame3( glitch, event )
						return 
					else
						glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame3 )
					end
				end
				
				glitch:completeAnimation()
				self.glitch:setAlpha( 0 )
				glitchFrame2( glitch, {} )
				local glitch2Frame2 = function ( glitch2, event )
					local glitch2Frame3 = function ( glitch2, event )
						local glitch2Frame4 = function ( glitch2, event )
							local glitch2Frame5 = function ( glitch2, event )
								local glitch2Frame6 = function ( glitch2, event )
									local glitch2Frame7 = function ( glitch2, event )
										local glitch2Frame8 = function ( glitch2, event )
											if not event.interrupted then
												glitch2:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
											end
											glitch2:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( glitch2, event )
											else
												glitch2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											glitch2Frame8( glitch2, event )
											return 
										else
											glitch2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											glitch2:setAlpha( 0.57 )
											glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame8 )
										end
									end
									
									if event.interrupted then
										glitch2Frame7( glitch2, event )
										return 
									else
										glitch2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame7 )
									end
								end
								
								if event.interrupted then
									glitch2Frame6( glitch2, event )
									return 
								else
									glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									glitch2:setAlpha( 0 )
									glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame6 )
								end
							end
							
							if event.interrupted then
								glitch2Frame5( glitch2, event )
								return 
							else
								glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame5 )
							end
						end
						
						if event.interrupted then
							glitch2Frame4( glitch2, event )
							return 
						else
							glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							glitch2:setAlpha( 1 )
							glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame4 )
						end
					end
					
					if event.interrupted then
						glitch2Frame3( glitch2, event )
						return 
					else
						glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame3 )
					end
				end
				
				glitch2:completeAnimation()
				self.glitch2:setAlpha( 0 )
				glitch2Frame2( glitch2, {} )
			end
		},
		MutuallyExclusive = {
			DefaultClip = function ()
				self:setupElementClipCounter( 20 )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				itemImageSolid:completeAnimation()
				self.itemImageSolid:setAlpha( 0 )
				self.clipFinished( itemImageSolid, {} )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0.8 )
				self.clipFinished( itemImage, {} )
				itemImageLine:completeAnimation()
				self.itemImageLine:setAlpha( 0.3 )
				self.clipFinished( itemImageLine, {} )
				LabelButtonCount:completeAnimation()
				self.LabelButtonCount:setAlpha( 1 )
				self.clipFinished( LabelButtonCount, {} )
				LabelButton:completeAnimation()
				self.LabelButton:setAlpha( 1 )
				self.clipFinished( LabelButton, {} )
				equippedIcon:completeAnimation()
				self.equippedIcon:setAlpha( 0 )
				self.clipFinished( equippedIcon, {} )
				alertIcon:completeAnimation()
				self.alertIcon:setAlpha( 1 )
				self.clipFinished( alertIcon, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
				IconNew:completeAnimation()
				self.IconNew:setAlpha( 0 )
				self.clipFinished( IconNew, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBorder:completeAnimation()
				self.FocusBorder:setAlpha( 0 )
				self.clipFinished( FocusBorder, {} )
				glitch:completeAnimation()
				self.glitch:setAlpha( 0 )
				self.clipFinished( glitch, {} )
				glitch2:completeAnimation()
				self.glitch2:setAlpha( 0 )
				self.clipFinished( glitch2, {} )
				BMContractsLockBars:completeAnimation()
				self.BMContractsLockBars:setAlpha( 0 )
				self.clipFinished( BMContractsLockBars, {} )
				BMContractsLockBars0:completeAnimation()
				self.BMContractsLockBars0:setAlpha( 0 )
				self.clipFinished( BMContractsLockBars0, {} )
				bmContractBrandIcon:completeAnimation()
				self.bmContractBrandIcon:setAlpha( 0 )
				self.clipFinished( bmContractBrandIcon, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 7 )
				local BoxButtonLrgInactiveFrame2 = function ( BoxButtonLrgInactive, event )
					if not event.interrupted then
						BoxButtonLrgInactive:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					BoxButtonLrgInactive:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BoxButtonLrgInactive, event )
					else
						BoxButtonLrgInactive:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				BoxButtonLrgInactiveFrame2( BoxButtonLrgInactive, {} )
				local itemImageFrame2 = function ( itemImage, event )
					if not event.interrupted then
						itemImage:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
					end
					itemImage:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( itemImage, event )
					else
						itemImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0.8 )
				itemImageFrame2( itemImage, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					local FocusBarTFrame3 = function ( FocusBarT, event )
						local FocusBarTFrame4 = function ( FocusBarT, event )
							local FocusBarTFrame5 = function ( FocusBarT, event )
								local FocusBarTFrame6 = function ( FocusBarT, event )
									local FocusBarTFrame7 = function ( FocusBarT, event )
										if not event.interrupted then
											FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										end
										FocusBarT:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( FocusBarT, event )
										else
											FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										FocusBarTFrame7( FocusBarT, event )
										return 
									else
										FocusBarT:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBarTFrame6( FocusBarT, event )
									return 
								else
									FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									FocusBarT:setAlpha( 0.35 )
									FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarTFrame5( FocusBarT, event )
								return 
							else
								FocusBarT:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarTFrame4( FocusBarT, event )
							return 
						else
							FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FocusBarT:setAlpha( 0.57 )
							FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarTFrame3( FocusBarT, event )
						return 
					else
						FocusBarT:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame3 )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				FocusBarTFrame2( FocusBarT, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					local FocusBarBFrame3 = function ( FocusBarB, event )
						local FocusBarBFrame4 = function ( FocusBarB, event )
							local FocusBarBFrame5 = function ( FocusBarB, event )
								local FocusBarBFrame6 = function ( FocusBarB, event )
									local FocusBarBFrame7 = function ( FocusBarB, event )
										if not event.interrupted then
											FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										end
										FocusBarB:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( FocusBarB, event )
										else
											FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										FocusBarBFrame7( FocusBarB, event )
										return 
									else
										FocusBarB:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBarBFrame6( FocusBarB, event )
									return 
								else
									FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									FocusBarB:setAlpha( 0.21 )
									FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarBFrame5( FocusBarB, event )
								return 
							else
								FocusBarB:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarBFrame4( FocusBarB, event )
							return 
						else
							FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FocusBarB:setAlpha( 0.66 )
							FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarBFrame3( FocusBarB, event )
						return 
					else
						FocusBarB:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame3 )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBorderFrame2 = function ( FocusBorder, event )
					local FocusBorderFrame3 = function ( FocusBorder, event )
						local FocusBorderFrame4 = function ( FocusBorder, event )
							local FocusBorderFrame5 = function ( FocusBorder, event )
								local FocusBorderFrame6 = function ( FocusBorder, event )
									local FocusBorderFrame7 = function ( FocusBorder, event )
										local FocusBorderFrame8 = function ( FocusBorder, event )
											if not event.interrupted then
												FocusBorder:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
											end
											FocusBorder:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( FocusBorder, event )
											else
												FocusBorder:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											FocusBorderFrame8( FocusBorder, event )
											return 
										else
											FocusBorder:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											FocusBorder:setAlpha( 0.7 )
											FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame8 )
										end
									end
									
									if event.interrupted then
										FocusBorderFrame7( FocusBorder, event )
										return 
									else
										FocusBorder:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBorderFrame6( FocusBorder, event )
									return 
								else
									FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									FocusBorder:setAlpha( 0 )
									FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBorderFrame5( FocusBorder, event )
								return 
							else
								FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FocusBorder:setAlpha( 0.5 )
								FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBorderFrame4( FocusBorder, event )
							return 
						else
							FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FocusBorder:setAlpha( 1 )
							FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBorderFrame3( FocusBorder, event )
						return 
					else
						FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame3 )
					end
				end
				
				FocusBorder:completeAnimation()
				self.FocusBorder:setAlpha( 0 )
				FocusBorderFrame2( FocusBorder, {} )
				local glitchFrame2 = function ( glitch, event )
					local glitchFrame3 = function ( glitch, event )
						local glitchFrame4 = function ( glitch, event )
							local glitchFrame5 = function ( glitch, event )
								local glitchFrame6 = function ( glitch, event )
									local glitchFrame7 = function ( glitch, event )
										if not event.interrupted then
											glitch:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										end
										glitch:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( glitch, event )
										else
											glitch:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										glitchFrame7( glitch, event )
										return 
									else
										glitch:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame7 )
									end
								end
								
								if event.interrupted then
									glitchFrame6( glitch, event )
									return 
								else
									glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									glitch:setAlpha( 1 )
									glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame6 )
								end
							end
							
							if event.interrupted then
								glitchFrame5( glitch, event )
								return 
							else
								glitch:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame5 )
							end
						end
						
						if event.interrupted then
							glitchFrame4( glitch, event )
							return 
						else
							glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							glitch:setAlpha( 0 )
							glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame4 )
						end
					end
					
					if event.interrupted then
						glitchFrame3( glitch, event )
						return 
					else
						glitch:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame3 )
					end
				end
				
				glitch:completeAnimation()
				self.glitch:setAlpha( 1 )
				glitchFrame2( glitch, {} )
				local glitch2Frame2 = function ( glitch2, event )
					local glitch2Frame3 = function ( glitch2, event )
						local glitch2Frame4 = function ( glitch2, event )
							local glitch2Frame5 = function ( glitch2, event )
								local glitch2Frame6 = function ( glitch2, event )
									local glitch2Frame7 = function ( glitch2, event )
										if not event.interrupted then
											glitch2:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										end
										glitch2:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( glitch2, event )
										else
											glitch2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										glitch2Frame7( glitch2, event )
										return 
									else
										glitch2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame7 )
									end
								end
								
								if event.interrupted then
									glitch2Frame6( glitch2, event )
									return 
								else
									glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									glitch2:setAlpha( 1 )
									glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame6 )
								end
							end
							
							if event.interrupted then
								glitch2Frame5( glitch2, event )
								return 
							else
								glitch2:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame5 )
							end
						end
						
						if event.interrupted then
							glitch2Frame4( glitch2, event )
							return 
						else
							glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							glitch2:setAlpha( 0 )
							glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame4 )
						end
					end
					
					if event.interrupted then
						glitch2Frame3( glitch2, event )
						return 
					else
						glitch2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame3 )
					end
				end
				
				glitch2:completeAnimation()
				self.glitch2:setAlpha( 1 )
				glitch2Frame2( glitch2, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 4 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 1 )
				self.clipFinished( itemImage, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 7 )
				local BoxButtonLrgInactiveFrame2 = function ( BoxButtonLrgInactive, event )
					if not event.interrupted then
						BoxButtonLrgInactive:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
					end
					BoxButtonLrgInactive:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( BoxButtonLrgInactive, event )
					else
						BoxButtonLrgInactive:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				BoxButtonLrgInactiveFrame2( BoxButtonLrgInactive, {} )
				local itemImageFrame2 = function ( itemImage, event )
					if not event.interrupted then
						itemImage:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
					end
					itemImage:setAlpha( 0.8 )
					if event.interrupted then
						self.clipFinished( itemImage, event )
					else
						itemImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 1 )
				itemImageFrame2( itemImage, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					local FocusBarTFrame3 = function ( FocusBarT, event )
						local FocusBarTFrame4 = function ( FocusBarT, event )
							local FocusBarTFrame5 = function ( FocusBarT, event )
								local FocusBarTFrame6 = function ( FocusBarT, event )
									local FocusBarTFrame7 = function ( FocusBarT, event )
										if not event.interrupted then
											FocusBarT:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
										end
										FocusBarT:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( FocusBarT, event )
										else
											FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										FocusBarTFrame7( FocusBarT, event )
										return 
									else
										FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										FocusBarT:setAlpha( 0.35 )
										FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBarTFrame6( FocusBarT, event )
									return 
								else
									FocusBarT:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarTFrame5( FocusBarT, event )
								return 
							else
								FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FocusBarT:setAlpha( 0.57 )
								FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarTFrame4( FocusBarT, event )
							return 
						else
							FocusBarT:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							FocusBarT:setAlpha( 0 )
							FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarTFrame3( FocusBarT, event )
						return 
					else
						FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FocusBarT:setAlpha( 0.35 )
						FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame3 )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				FocusBarTFrame2( FocusBarT, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					local FocusBarBFrame3 = function ( FocusBarB, event )
						local FocusBarBFrame4 = function ( FocusBarB, event )
							local FocusBarBFrame5 = function ( FocusBarB, event )
								local FocusBarBFrame6 = function ( FocusBarB, event )
									local FocusBarBFrame7 = function ( FocusBarB, event )
										if not event.interrupted then
											FocusBarB:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
										end
										FocusBarB:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( FocusBarB, event )
										else
											FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										FocusBarBFrame7( FocusBarB, event )
										return 
									else
										FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										FocusBarB:setAlpha( 0.21 )
										FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBarBFrame6( FocusBarB, event )
									return 
								else
									FocusBarB:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarBFrame5( FocusBarB, event )
								return 
							else
								FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FocusBarB:setAlpha( 0.66 )
								FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarBFrame4( FocusBarB, event )
							return 
						else
							FocusBarB:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							FocusBarB:setAlpha( 0 )
							FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarBFrame3( FocusBarB, event )
						return 
					else
						FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FocusBarB:setAlpha( 0.21 )
						FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame3 )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBorderFrame2 = function ( FocusBorder, event )
					local FocusBorderFrame3 = function ( FocusBorder, event )
						local FocusBorderFrame4 = function ( FocusBorder, event )
							local FocusBorderFrame5 = function ( FocusBorder, event )
								local FocusBorderFrame6 = function ( FocusBorder, event )
									local FocusBorderFrame7 = function ( FocusBorder, event )
										local FocusBorderFrame8 = function ( FocusBorder, event )
											if not event.interrupted then
												FocusBorder:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
											end
											FocusBorder:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( FocusBorder, event )
											else
												FocusBorder:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											FocusBorderFrame8( FocusBorder, event )
											return 
										else
											FocusBorder:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											FocusBorder:setAlpha( 0.7 )
											FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame8 )
										end
									end
									
									if event.interrupted then
										FocusBorderFrame7( FocusBorder, event )
										return 
									else
										FocusBorder:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBorderFrame6( FocusBorder, event )
									return 
								else
									FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									FocusBorder:setAlpha( 0 )
									FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBorderFrame5( FocusBorder, event )
								return 
							else
								FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FocusBorder:setAlpha( 0.5 )
								FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBorderFrame4( FocusBorder, event )
							return 
						else
							FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FocusBorder:setAlpha( 1 )
							FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBorderFrame3( FocusBorder, event )
						return 
					else
						FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame3 )
					end
				end
				
				FocusBorder:completeAnimation()
				self.FocusBorder:setAlpha( 0 )
				FocusBorderFrame2( FocusBorder, {} )
				local glitchFrame2 = function ( glitch, event )
					local glitchFrame3 = function ( glitch, event )
						local glitchFrame4 = function ( glitch, event )
							local glitchFrame5 = function ( glitch, event )
								local glitchFrame6 = function ( glitch, event )
									local glitchFrame7 = function ( glitch, event )
										local glitchFrame8 = function ( glitch, event )
											if not event.interrupted then
												glitch:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
											end
											glitch:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( glitch, event )
											else
												glitch:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											glitchFrame8( glitch, event )
											return 
										else
											glitch:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											glitch:setAlpha( 0.4 )
											glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame8 )
										end
									end
									
									if event.interrupted then
										glitchFrame7( glitch, event )
										return 
									else
										glitch:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame7 )
									end
								end
								
								if event.interrupted then
									glitchFrame6( glitch, event )
									return 
								else
									glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									glitch:setAlpha( 0 )
									glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame6 )
								end
							end
							
							if event.interrupted then
								glitchFrame5( glitch, event )
								return 
							else
								glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame5 )
							end
						end
						
						if event.interrupted then
							glitchFrame4( glitch, event )
							return 
						else
							glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							glitch:setAlpha( 1 )
							glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame4 )
						end
					end
					
					if event.interrupted then
						glitchFrame3( glitch, event )
						return 
					else
						glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame3 )
					end
				end
				
				glitch:completeAnimation()
				self.glitch:setAlpha( 0 )
				glitchFrame2( glitch, {} )
				local glitch2Frame2 = function ( glitch2, event )
					local glitch2Frame3 = function ( glitch2, event )
						local glitch2Frame4 = function ( glitch2, event )
							local glitch2Frame5 = function ( glitch2, event )
								local glitch2Frame6 = function ( glitch2, event )
									local glitch2Frame7 = function ( glitch2, event )
										local glitch2Frame8 = function ( glitch2, event )
											if not event.interrupted then
												glitch2:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
											end
											glitch2:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( glitch2, event )
											else
												glitch2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											glitch2Frame8( glitch2, event )
											return 
										else
											glitch2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											glitch2:setAlpha( 0.57 )
											glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame8 )
										end
									end
									
									if event.interrupted then
										glitch2Frame7( glitch2, event )
										return 
									else
										glitch2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame7 )
									end
								end
								
								if event.interrupted then
									glitch2Frame6( glitch2, event )
									return 
								else
									glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									glitch2:setAlpha( 0 )
									glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame6 )
								end
							end
							
							if event.interrupted then
								glitch2Frame5( glitch2, event )
								return 
							else
								glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame5 )
							end
						end
						
						if event.interrupted then
							glitch2Frame4( glitch2, event )
							return 
						else
							glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							glitch2:setAlpha( 1 )
							glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame4 )
						end
					end
					
					if event.interrupted then
						glitch2Frame3( glitch2, event )
						return 
					else
						glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame3 )
					end
				end
				
				glitch2:completeAnimation()
				self.glitch2:setAlpha( 0 )
				glitch2Frame2( glitch2, {} )
			end
		},
		PermanentUnlockRefund = {
			DefaultClip = function ()
				self:setupElementClipCounter( 21 )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				itemImageSolid:completeAnimation()
				self.itemImageSolid:setAlpha( 0 )
				self.clipFinished( itemImageSolid, {} )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0.8 )
				self.clipFinished( itemImage, {} )
				itemImageLine:completeAnimation()
				self.itemImageLine:setAlpha( 0.3 )
				self.clipFinished( itemImageLine, {} )
				LabelButtonCount:completeAnimation()
				self.LabelButtonCount:setAlpha( 1 )
				self.clipFinished( LabelButtonCount, {} )
				LabelButton:completeAnimation()
				self.LabelButton:setAlpha( 1 )
				self.clipFinished( LabelButton, {} )
				equippedIcon:completeAnimation()
				self.equippedIcon:setAlpha( 0 )
				self.clipFinished( equippedIcon, {} )
				alertIcon:completeAnimation()
				self.alertIcon:setAlpha( 0 )
				self.clipFinished( alertIcon, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
				IconNew:completeAnimation()
				self.IconNew:setAlpha( 0 )
				self.clipFinished( IconNew, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBorder:completeAnimation()
				self.FocusBorder:setAlpha( 0 )
				self.clipFinished( FocusBorder, {} )
				glitch:completeAnimation()
				self.glitch:setAlpha( 0 )
				self.clipFinished( glitch, {} )
				glitch2:completeAnimation()
				self.glitch2:setAlpha( 0 )
				self.clipFinished( glitch2, {} )
				TokenRefundHint:completeAnimation()
				self.TokenRefundHint:setAlpha( 0 )
				self.clipFinished( TokenRefundHint, {} )
				BMContractsLockBars:completeAnimation()
				self.BMContractsLockBars:setAlpha( 0 )
				self.clipFinished( BMContractsLockBars, {} )
				BMContractsLockBars0:completeAnimation()
				self.BMContractsLockBars0:setAlpha( 0 )
				self.clipFinished( BMContractsLockBars0, {} )
				bmContractBrandIcon:completeAnimation()
				self.bmContractBrandIcon:setAlpha( 0 )
				self.clipFinished( bmContractBrandIcon, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 8 )
				local BoxButtonLrgInactiveFrame2 = function ( BoxButtonLrgInactive, event )
					if not event.interrupted then
						BoxButtonLrgInactive:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					BoxButtonLrgInactive:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BoxButtonLrgInactive, event )
					else
						BoxButtonLrgInactive:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				BoxButtonLrgInactiveFrame2( BoxButtonLrgInactive, {} )
				local itemImageFrame2 = function ( itemImage, event )
					if not event.interrupted then
						itemImage:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
					end
					itemImage:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( itemImage, event )
					else
						itemImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0.8 )
				itemImageFrame2( itemImage, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					local FocusBarTFrame3 = function ( FocusBarT, event )
						local FocusBarTFrame4 = function ( FocusBarT, event )
							local FocusBarTFrame5 = function ( FocusBarT, event )
								local FocusBarTFrame6 = function ( FocusBarT, event )
									local FocusBarTFrame7 = function ( FocusBarT, event )
										if not event.interrupted then
											FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										end
										FocusBarT:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( FocusBarT, event )
										else
											FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										FocusBarTFrame7( FocusBarT, event )
										return 
									else
										FocusBarT:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBarTFrame6( FocusBarT, event )
									return 
								else
									FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									FocusBarT:setAlpha( 0.35 )
									FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarTFrame5( FocusBarT, event )
								return 
							else
								FocusBarT:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarTFrame4( FocusBarT, event )
							return 
						else
							FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FocusBarT:setAlpha( 0.57 )
							FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarTFrame3( FocusBarT, event )
						return 
					else
						FocusBarT:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame3 )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				FocusBarTFrame2( FocusBarT, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					local FocusBarBFrame3 = function ( FocusBarB, event )
						local FocusBarBFrame4 = function ( FocusBarB, event )
							local FocusBarBFrame5 = function ( FocusBarB, event )
								local FocusBarBFrame6 = function ( FocusBarB, event )
									local FocusBarBFrame7 = function ( FocusBarB, event )
										if not event.interrupted then
											FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										end
										FocusBarB:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( FocusBarB, event )
										else
											FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										FocusBarBFrame7( FocusBarB, event )
										return 
									else
										FocusBarB:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBarBFrame6( FocusBarB, event )
									return 
								else
									FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									FocusBarB:setAlpha( 0.21 )
									FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarBFrame5( FocusBarB, event )
								return 
							else
								FocusBarB:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarBFrame4( FocusBarB, event )
							return 
						else
							FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FocusBarB:setAlpha( 0.66 )
							FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarBFrame3( FocusBarB, event )
						return 
					else
						FocusBarB:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame3 )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBorderFrame2 = function ( FocusBorder, event )
					local FocusBorderFrame3 = function ( FocusBorder, event )
						local FocusBorderFrame4 = function ( FocusBorder, event )
							local FocusBorderFrame5 = function ( FocusBorder, event )
								local FocusBorderFrame6 = function ( FocusBorder, event )
									local FocusBorderFrame7 = function ( FocusBorder, event )
										local FocusBorderFrame8 = function ( FocusBorder, event )
											if not event.interrupted then
												FocusBorder:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
											end
											FocusBorder:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( FocusBorder, event )
											else
												FocusBorder:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											FocusBorderFrame8( FocusBorder, event )
											return 
										else
											FocusBorder:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											FocusBorder:setAlpha( 0.7 )
											FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame8 )
										end
									end
									
									if event.interrupted then
										FocusBorderFrame7( FocusBorder, event )
										return 
									else
										FocusBorder:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBorderFrame6( FocusBorder, event )
									return 
								else
									FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									FocusBorder:setAlpha( 0 )
									FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBorderFrame5( FocusBorder, event )
								return 
							else
								FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FocusBorder:setAlpha( 0.5 )
								FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBorderFrame4( FocusBorder, event )
							return 
						else
							FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FocusBorder:setAlpha( 1 )
							FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBorderFrame3( FocusBorder, event )
						return 
					else
						FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame3 )
					end
				end
				
				FocusBorder:completeAnimation()
				self.FocusBorder:setAlpha( 0 )
				FocusBorderFrame2( FocusBorder, {} )
				local glitchFrame2 = function ( glitch, event )
					local glitchFrame3 = function ( glitch, event )
						local glitchFrame4 = function ( glitch, event )
							local glitchFrame5 = function ( glitch, event )
								local glitchFrame6 = function ( glitch, event )
									local glitchFrame7 = function ( glitch, event )
										if not event.interrupted then
											glitch:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										end
										glitch:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( glitch, event )
										else
											glitch:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										glitchFrame7( glitch, event )
										return 
									else
										glitch:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame7 )
									end
								end
								
								if event.interrupted then
									glitchFrame6( glitch, event )
									return 
								else
									glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									glitch:setAlpha( 1 )
									glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame6 )
								end
							end
							
							if event.interrupted then
								glitchFrame5( glitch, event )
								return 
							else
								glitch:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame5 )
							end
						end
						
						if event.interrupted then
							glitchFrame4( glitch, event )
							return 
						else
							glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							glitch:setAlpha( 0 )
							glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame4 )
						end
					end
					
					if event.interrupted then
						glitchFrame3( glitch, event )
						return 
					else
						glitch:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame3 )
					end
				end
				
				glitch:completeAnimation()
				self.glitch:setAlpha( 1 )
				glitchFrame2( glitch, {} )
				local glitch2Frame2 = function ( glitch2, event )
					local glitch2Frame3 = function ( glitch2, event )
						local glitch2Frame4 = function ( glitch2, event )
							local glitch2Frame5 = function ( glitch2, event )
								local glitch2Frame6 = function ( glitch2, event )
									local glitch2Frame7 = function ( glitch2, event )
										if not event.interrupted then
											glitch2:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										end
										glitch2:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( glitch2, event )
										else
											glitch2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										glitch2Frame7( glitch2, event )
										return 
									else
										glitch2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame7 )
									end
								end
								
								if event.interrupted then
									glitch2Frame6( glitch2, event )
									return 
								else
									glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									glitch2:setAlpha( 1 )
									glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame6 )
								end
							end
							
							if event.interrupted then
								glitch2Frame5( glitch2, event )
								return 
							else
								glitch2:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame5 )
							end
						end
						
						if event.interrupted then
							glitch2Frame4( glitch2, event )
							return 
						else
							glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							glitch2:setAlpha( 0 )
							glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame4 )
						end
					end
					
					if event.interrupted then
						glitch2Frame3( glitch2, event )
						return 
					else
						glitch2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame3 )
					end
				end
				
				glitch2:completeAnimation()
				self.glitch2:setAlpha( 1 )
				glitch2Frame2( glitch2, {} )
				local TokenRefundHintFrame2 = function ( TokenRefundHint, event )
					if not event.interrupted then
						TokenRefundHint:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
					end
					TokenRefundHint:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( TokenRefundHint, event )
					else
						TokenRefundHint:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TokenRefundHint:completeAnimation()
				self.TokenRefundHint:setAlpha( 0 )
				TokenRefundHintFrame2( TokenRefundHint, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 9 )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 1 )
				self.clipFinished( itemImage, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
				IconNew:completeAnimation()
				self.IconNew:setAlpha( 0 )
				self.clipFinished( IconNew, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				TokenRefundHint:completeAnimation()
				self.TokenRefundHint:setAlpha( 1 )
				self.clipFinished( TokenRefundHint, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 8 )
				local BoxButtonLrgInactiveFrame2 = function ( BoxButtonLrgInactive, event )
					if not event.interrupted then
						BoxButtonLrgInactive:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					BoxButtonLrgInactive:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( BoxButtonLrgInactive, event )
					else
						BoxButtonLrgInactive:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				BoxButtonLrgInactiveFrame2( BoxButtonLrgInactive, {} )
				local itemImageFrame2 = function ( itemImage, event )
					if not event.interrupted then
						itemImage:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					itemImage:setAlpha( 0.8 )
					if event.interrupted then
						self.clipFinished( itemImage, event )
					else
						itemImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 1 )
				itemImageFrame2( itemImage, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					local FocusBarTFrame3 = function ( FocusBarT, event )
						local FocusBarTFrame4 = function ( FocusBarT, event )
							local FocusBarTFrame5 = function ( FocusBarT, event )
								local FocusBarTFrame6 = function ( FocusBarT, event )
									local FocusBarTFrame7 = function ( FocusBarT, event )
										if not event.interrupted then
											FocusBarT:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
										end
										FocusBarT:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( FocusBarT, event )
										else
											FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										FocusBarTFrame7( FocusBarT, event )
										return 
									else
										FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										FocusBarT:setAlpha( 0.35 )
										FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBarTFrame6( FocusBarT, event )
									return 
								else
									FocusBarT:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarTFrame5( FocusBarT, event )
								return 
							else
								FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FocusBarT:setAlpha( 0.57 )
								FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarTFrame4( FocusBarT, event )
							return 
						else
							FocusBarT:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							FocusBarT:setAlpha( 0 )
							FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarTFrame3( FocusBarT, event )
						return 
					else
						FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FocusBarT:setAlpha( 0.35 )
						FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame3 )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				FocusBarTFrame2( FocusBarT, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					local FocusBarBFrame3 = function ( FocusBarB, event )
						local FocusBarBFrame4 = function ( FocusBarB, event )
							local FocusBarBFrame5 = function ( FocusBarB, event )
								local FocusBarBFrame6 = function ( FocusBarB, event )
									local FocusBarBFrame7 = function ( FocusBarB, event )
										if not event.interrupted then
											FocusBarB:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
										end
										FocusBarB:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( FocusBarB, event )
										else
											FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										FocusBarBFrame7( FocusBarB, event )
										return 
									else
										FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										FocusBarB:setAlpha( 0.21 )
										FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBarBFrame6( FocusBarB, event )
									return 
								else
									FocusBarB:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarBFrame5( FocusBarB, event )
								return 
							else
								FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FocusBarB:setAlpha( 0.66 )
								FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarBFrame4( FocusBarB, event )
							return 
						else
							FocusBarB:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							FocusBarB:setAlpha( 0 )
							FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarBFrame3( FocusBarB, event )
						return 
					else
						FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FocusBarB:setAlpha( 0.21 )
						FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame3 )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBorderFrame2 = function ( FocusBorder, event )
					local FocusBorderFrame3 = function ( FocusBorder, event )
						local FocusBorderFrame4 = function ( FocusBorder, event )
							local FocusBorderFrame5 = function ( FocusBorder, event )
								local FocusBorderFrame6 = function ( FocusBorder, event )
									local FocusBorderFrame7 = function ( FocusBorder, event )
										local FocusBorderFrame8 = function ( FocusBorder, event )
											if not event.interrupted then
												FocusBorder:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
											end
											FocusBorder:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( FocusBorder, event )
											else
												FocusBorder:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											FocusBorderFrame8( FocusBorder, event )
											return 
										else
											FocusBorder:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											FocusBorder:setAlpha( 0.7 )
											FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame8 )
										end
									end
									
									if event.interrupted then
										FocusBorderFrame7( FocusBorder, event )
										return 
									else
										FocusBorder:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBorderFrame6( FocusBorder, event )
									return 
								else
									FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									FocusBorder:setAlpha( 0 )
									FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBorderFrame5( FocusBorder, event )
								return 
							else
								FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FocusBorder:setAlpha( 0.5 )
								FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBorderFrame4( FocusBorder, event )
							return 
						else
							FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FocusBorder:setAlpha( 1 )
							FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBorderFrame3( FocusBorder, event )
						return 
					else
						FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame3 )
					end
				end
				
				FocusBorder:completeAnimation()
				self.FocusBorder:setAlpha( 0 )
				FocusBorderFrame2( FocusBorder, {} )
				local glitchFrame2 = function ( glitch, event )
					local glitchFrame3 = function ( glitch, event )
						local glitchFrame4 = function ( glitch, event )
							local glitchFrame5 = function ( glitch, event )
								local glitchFrame6 = function ( glitch, event )
									local glitchFrame7 = function ( glitch, event )
										local glitchFrame8 = function ( glitch, event )
											if not event.interrupted then
												glitch:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
											end
											glitch:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( glitch, event )
											else
												glitch:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											glitchFrame8( glitch, event )
											return 
										else
											glitch:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											glitch:setAlpha( 0.4 )
											glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame8 )
										end
									end
									
									if event.interrupted then
										glitchFrame7( glitch, event )
										return 
									else
										glitch:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame7 )
									end
								end
								
								if event.interrupted then
									glitchFrame6( glitch, event )
									return 
								else
									glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									glitch:setAlpha( 0 )
									glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame6 )
								end
							end
							
							if event.interrupted then
								glitchFrame5( glitch, event )
								return 
							else
								glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame5 )
							end
						end
						
						if event.interrupted then
							glitchFrame4( glitch, event )
							return 
						else
							glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							glitch:setAlpha( 1 )
							glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame4 )
						end
					end
					
					if event.interrupted then
						glitchFrame3( glitch, event )
						return 
					else
						glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame3 )
					end
				end
				
				glitch:completeAnimation()
				self.glitch:setAlpha( 0 )
				glitchFrame2( glitch, {} )
				local glitch2Frame2 = function ( glitch2, event )
					local glitch2Frame3 = function ( glitch2, event )
						local glitch2Frame4 = function ( glitch2, event )
							local glitch2Frame5 = function ( glitch2, event )
								local glitch2Frame6 = function ( glitch2, event )
									local glitch2Frame7 = function ( glitch2, event )
										local glitch2Frame8 = function ( glitch2, event )
											if not event.interrupted then
												glitch2:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
											end
											glitch2:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( glitch2, event )
											else
												glitch2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											glitch2Frame8( glitch2, event )
											return 
										else
											glitch2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											glitch2:setAlpha( 0.57 )
											glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame8 )
										end
									end
									
									if event.interrupted then
										glitch2Frame7( glitch2, event )
										return 
									else
										glitch2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame7 )
									end
								end
								
								if event.interrupted then
									glitch2Frame6( glitch2, event )
									return 
								else
									glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									glitch2:setAlpha( 0 )
									glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame6 )
								end
							end
							
							if event.interrupted then
								glitch2Frame5( glitch2, event )
								return 
							else
								glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame5 )
							end
						end
						
						if event.interrupted then
							glitch2Frame4( glitch2, event )
							return 
						else
							glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							glitch2:setAlpha( 1 )
							glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame4 )
						end
					end
					
					if event.interrupted then
						glitch2Frame3( glitch2, event )
						return 
					else
						glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame3 )
					end
				end
				
				glitch2:completeAnimation()
				self.glitch2:setAlpha( 0 )
				glitch2Frame2( glitch2, {} )
				local TokenRefundHintFrame2 = function ( TokenRefundHint, event )
					if not event.interrupted then
						TokenRefundHint:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					TokenRefundHint:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( TokenRefundHint, event )
					else
						TokenRefundHint:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TokenRefundHint:completeAnimation()
				self.TokenRefundHint:setAlpha( 1 )
				TokenRefundHintFrame2( TokenRefundHint, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "BMClassified",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isBMClassified" )
			end
		},
		{
			stateName = "ContractClassified",
			condition = function ( menu, element, event )
				return IsCACItemContractLocked( element, controller )
			end
		},
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				return IsCACItemEquipped( menu, element, controller ) and not IsInPermanentUnlockMenu( controller )
			end
		},
		{
			stateName = "New",
			condition = function ( menu, element, event )
				return IsCACItemNew( element, controller ) and not IsInPermanentUnlockMenu( controller )
			end
		},
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsCACItemLockedForBeta( menu, element, controller )
			end
		},
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				local f532_local0
				if not IsItemBlackMarketWeapon( element, controller ) then
					f532_local0 = not IsCACItemPurchased( element, controller )
				else
					f532_local0 = false
				end
				return f532_local0
			end
		},
		{
			stateName = "MutuallyExclusive",
			condition = function ( menu, element, event )
				return IsCACItemMutuallyExclusiveWithSelection( element, controller ) and not IsInPermanentUnlockMenu( controller )
			end
		},
		{
			stateName = "PermanentUnlockRefund",
			condition = function ( menu, element, event )
				local f534_local0 = IsInPermanentUnlockMenu( controller )
				if f534_local0 then
					if not IsPermanentlyUnlocked( element, controller ) then
						f534_local0 = HavePermanentUnlockTokens( controller )
						if f534_local0 then
							f534_local0 = IsCACItemPurchased( element, controller )
						end
					else
						f534_local0 = false
					end
				end
				return f534_local0
			end
		}
	} )
	self:linkToElementModel( self, "isBMClassified", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		} )
	end )
	self:linkToElementModel( self, "ref", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "ref"
		} )
	end )
	self:linkToElementModel( self, "itemIndex", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	BMContractsLockBars.id = "BMContractsLockBars"
	BMContractsLockBars0.id = "BMContractsLockBars0"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.BMContractsLockBars:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BoxButtonLrgInactiveDiag:close()
		element.BoxButtonLrgInactive:close()
		element.BoxButtonLrgIdle:close()
		element.LabelButtonCount:close()
		element.tokenPermanentUnlock:close()
		element.tokenUnlock:close()
		element.LabelButton:close()
		element.lockedIcon:close()
		element.IconNew:close()
		element.FocusBarT:close()
		element.FocusBarB:close()
		element.FocusBorder:close()
		element.RestrictedItemWarning:close()
		element.TokenRefundHint:close()
		element.BMGoldBarMed:close()
		element.BMContractsLockBars:close()
		element.BMContractsLockBars0:close()
		element.itemImageSolid:close()
		element.itemImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

