require( "ui.uieditor.widgets.CAC.cac_IconTokenStatic" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseCharacter_LoadoutListItem_MouseHoverIcon" )
require( "ui.uieditor.widgets.Competitive.Competitive_CharacterDraft_Drafted" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_AbilityGlow" )
require( "ui.uieditor.widgets.Prestige.Prestige_PermanentUnlockTokenStatic" )
require( "ui.uieditor.widgets.Prestige.Prestige_TokenRefundHintWidget" )

local PCSpecific = function ( self, controller )
	self:setHandleMouse( true )
	self.m_forceMouseEventDispatch = true
end

local PostLoadFunc = function ( self, controller, menu )
	if CursorInputEnabledForBuild() then
		PCSpecific( self, controller )
	end
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RIGHT, nil, function ( self, menu, controller, model )
		if FirstTimeSetup_ChangedCharacter( controller ) then
			FirstTimeSetup_SetComplete( controller )
			return false
		else
			
		end
	end )
end

CoD.ChooseCharacter_LoadoutListItem = InheritFrom( LUI.UIElement )
CoD.ChooseCharacter_LoadoutListItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChooseCharacter_LoadoutListItem )
	self.id = "ChooseCharacter_LoadoutListItem"
	self.soundSet = "none"
	self:setLeftRight( 0, 0, 0, 135 )
	self:setTopBottom( 0, 0, 0, 135 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local MouseHoverIcon = CoD.ChooseCharacter_LoadoutListItem_MouseHoverIcon.new( menu, controller )
	MouseHoverIcon:setLeftRight( 0, 1, 0, 0 )
	MouseHoverIcon:setTopBottom( 0, 1, 0, 0 )
	MouseHoverIcon:setAlpha( 0 )
	self:addElement( MouseHoverIcon )
	self.MouseHoverIcon = MouseHoverIcon
	
	local OrangeGlow = LUI.UIImage.new()
	OrangeGlow:setLeftRight( 0, 0, 10, 125 )
	OrangeGlow:setTopBottom( 0, 0, 10, 125 )
	OrangeGlow:setAlpha( 0 )
	OrangeGlow:setImage( RegisterImage( "uie_img_t7_hud_mp_weapon_hero_orangering" ) )
	self:addElement( OrangeGlow )
	self.OrangeGlow = OrangeGlow
	
	local OrangeGlow0 = LUI.UIImage.new()
	OrangeGlow0:setLeftRight( 0, 0, -18, 153 )
	OrangeGlow0:setTopBottom( 0, 0, -18, 153 )
	OrangeGlow0:setAlpha( 0 )
	OrangeGlow0:setImage( RegisterImage( "uie_img_t7_hud_mp_weapon_hero_orangering" ) )
	OrangeGlow0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( OrangeGlow0 )
	self.OrangeGlow0 = OrangeGlow0
	
	local itemOff = LUI.UIImage.new()
	itemOff:setLeftRight( 0, 1, 15, -15 )
	itemOff:setTopBottom( 0, 1, 15, -15 )
	itemOff:setAlpha( 0 )
	itemOff:linkToElementModel( self, "gameImageOff", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemOff:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( itemOff )
	self.itemOff = itemOff
	
	local itemOn = LUI.UIImage.new()
	itemOn:setLeftRight( 0, 1, 0, 0 )
	itemOn:setTopBottom( 0, 1, 0, 0 )
	itemOn:setZoom( -30 )
	itemOn:linkToElementModel( self, "gameImageOn", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemOn:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( itemOn )
	self.itemOn = itemOn
	
	local Glow0 = CoD.AmmoWidget_AbilityGlow.new( menu, controller )
	Glow0:setLeftRight( 0, 1, 6, -6 )
	Glow0:setTopBottom( 0, 1, 6, -6 )
	Glow0:setRGB( 1, 0.65, 0 )
	Glow0:setAlpha( 0 )
	Glow0:setZoom( 13 )
	Glow0:setScale( 1.2 )
	Glow0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow0 )
	self.Glow0 = Glow0
	
	local tokenPermanentUnlock = CoD.Prestige_PermanentUnlockTokenStatic.new( menu, controller )
	tokenPermanentUnlock:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsInPermanentUnlockMenu( controller ) and not IsPermanentlyUnlocked( element, controller )
			end
		}
	} )
	tokenPermanentUnlock:setLeftRight( 0.5, 0.5, -24, 24 )
	tokenPermanentUnlock:setTopBottom( 0.5, 0.5, -24, 24 )
	self:addElement( tokenPermanentUnlock )
	self.tokenPermanentUnlock = tokenPermanentUnlock
	
	local cacToken = CoD.cac_IconTokenStatic.new( menu, controller )
	cacToken:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f8_local0
				if not IsCampaign() then
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
				return IsCampaign() and not IsInPermanentUnlockMenu( controller )
			end
		}
	} )
	cacToken:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( cacToken, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	cacToken:setLeftRight( 0.5, 0.5, -24, 24 )
	cacToken:setTopBottom( 0.5, 0.5, -24, 24 )
	cacToken:setAlpha( 0 )
	self:addElement( cacToken )
	self.cacToken = cacToken
	
	local lock = LUI.UIImage.new()
	lock:setLeftRight( 0.5, 0.5, -24, 24 )
	lock:setTopBottom( 0.5, 0.5, -24, 24 )
	lock:setAlpha( HideIfInPermanentUnlockMenu( 0 ) )
	lock:setImage( RegisterImage( "t7_hud_cac_lock_64" ) )
	self:addElement( lock )
	self.lock = lock
	
	local CompetitiveCharacterDraftDrafted = CoD.Competitive_CharacterDraft_Drafted.new( menu, controller )
	CompetitiveCharacterDraftDrafted:setLeftRight( 0, 0, 0.5, 135.5 )
	CompetitiveCharacterDraftDrafted:setTopBottom( 0, 0, 0.5, 135.5 )
	CompetitiveCharacterDraftDrafted:linkToElementModel( self, nil, false, function ( model )
		CompetitiveCharacterDraftDrafted:setModel( model, controller )
	end )
	self:addElement( CompetitiveCharacterDraftDrafted )
	self.CompetitiveCharacterDraftDrafted = CompetitiveCharacterDraftDrafted
	
	local TokenRefundHint = CoD.Prestige_TokenRefundHintWidget.new( menu, controller )
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
				return AlwaysFalse()
			end
		},
		{
			stateName = "Left",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Above",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	TokenRefundHint:setLeftRight( 0.5, 0.5, -141, 141 )
	TokenRefundHint:setTopBottom( 0, 0, -72, -24 )
	TokenRefundHint:setAlpha( 0 )
	TokenRefundHint.textCenterAlign:setText( Engine.Localize( "MENU_PRESTIGE_UNLOCK_TOKEN_REFUND" ) )
	self:addElement( TokenRefundHint )
	self.TokenRefundHint = TokenRefundHint
	
	self.resetProperties = function ()
		itemOff:completeAnimation()
		itemOn:completeAnimation()
		CompetitiveCharacterDraftDrafted:completeAnimation()
		Glow0:completeAnimation()
		lock:completeAnimation()
		OrangeGlow:completeAnimation()
		OrangeGlow0:completeAnimation()
		cacToken:completeAnimation()
		TokenRefundHint:completeAnimation()
		itemOff:setLeftRight( 0, 1, 15, -15 )
		itemOff:setTopBottom( 0, 1, 15, -15 )
		itemOff:setAlpha( 0 )
		itemOff:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
		itemOn:setLeftRight( 0, 1, 0, 0 )
		itemOn:setTopBottom( 0, 1, 0, 0 )
		itemOn:setAlpha( 1 )
		itemOn:setZoom( -30 )
		CompetitiveCharacterDraftDrafted:setLeftRight( 0, 0, 0.5, 135.5 )
		CompetitiveCharacterDraftDrafted:setTopBottom( 0, 0, 0.5, 135.5 )
		Glow0:setLeftRight( 0, 1, 6, -6 )
		Glow0:setTopBottom( 0, 1, 6, -6 )
		Glow0:setAlpha( 0 )
		Glow0:setZoom( 13 )
		Glow0:setScale( 1.2 )
		lock:setAlpha( HideIfInPermanentUnlockMenu( 0 ) )
		OrangeGlow:setLeftRight( 0, 0, 10, 125 )
		OrangeGlow:setTopBottom( 0, 0, 10, 125 )
		OrangeGlow:setAlpha( 0 )
		OrangeGlow:setScale( 1 )
		OrangeGlow0:setLeftRight( 0, 0, -18, 153 )
		OrangeGlow0:setTopBottom( 0, 0, -18, 153 )
		OrangeGlow0:setAlpha( 0 )
		OrangeGlow0:setScale( 1 )
		OrangeGlow0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
		cacToken:setAlpha( 0 )
		TokenRefundHint:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				itemOff:completeAnimation()
				self.itemOff:setLeftRight( 0, 1, 0, 0 )
				self.itemOff:setTopBottom( 0, 1, 0, 0 )
				self.itemOff:setAlpha( 1 )
				self.itemOff:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				self.clipFinished( itemOff, {} )
				itemOn:completeAnimation()
				self.itemOn:setAlpha( 0 )
				self.clipFinished( itemOn, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				itemOff:completeAnimation()
				self.itemOff:setLeftRight( 0, 1, 0, 0 )
				self.itemOff:setTopBottom( 0, 1, 0, 0 )
				self.itemOff:setAlpha( 1 )
				self.clipFinished( itemOff, {} )
				local itemOnFrame2 = function ( itemOn, event )
					local itemOnFrame3 = function ( itemOn, event )
						if not event.interrupted then
							itemOn:beginAnimation( "keyframe", 79, true, false, CoD.TweenType.Back )
						end
						itemOn:setLeftRight( 0, 1, -22, 22 )
						itemOn:setTopBottom( 0, 1, -22, 22 )
						itemOn:setAlpha( 1 )
						itemOn:setZoom( 0 )
						if event.interrupted then
							self.clipFinished( itemOn, event )
						else
							itemOn:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						itemOnFrame3( itemOn, event )
						return 
					else
						itemOn:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						itemOn:setLeftRight( 0, 1, -30.02, 30.02 )
						itemOn:setTopBottom( 0, 1, -30.02, 30.02 )
						itemOn:setAlpha( 1.37 )
						itemOn:registerEventHandler( "transition_complete_keyframe", itemOnFrame3 )
					end
				end
				
				itemOn:completeAnimation()
				self.itemOn:setLeftRight( 0, 1, 0, 0 )
				self.itemOn:setTopBottom( 0, 1, 0, 0 )
				self.itemOn:setAlpha( 0 )
				self.itemOn:setZoom( 0 )
				itemOnFrame2( itemOn, {} )
				local Glow0Frame2 = function ( Glow0, event )
					local Glow0Frame3 = function ( Glow0, event )
						if not event.interrupted then
							Glow0:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
						end
						Glow0:setLeftRight( 0, 1, 6, -6 )
						Glow0:setTopBottom( 0, 1, 6, -6 )
						Glow0:setAlpha( 0 )
						Glow0:setZoom( 13 )
						Glow0:setScale( 1.7 )
						if event.interrupted then
							self.clipFinished( Glow0, event )
						else
							Glow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Glow0Frame3( Glow0, event )
						return 
					else
						Glow0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						Glow0:setAlpha( 1 )
						Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame3 )
					end
				end
				
				Glow0:completeAnimation()
				self.Glow0:setLeftRight( 0, 1, 6, -6 )
				self.Glow0:setTopBottom( 0, 1, 6, -6 )
				self.Glow0:setAlpha( 0.13 )
				self.Glow0:setZoom( 13 )
				self.Glow0:setScale( 1.3 )
				Glow0Frame2( Glow0, {} )
				CompetitiveCharacterDraftDrafted:completeAnimation()
				self.CompetitiveCharacterDraftDrafted:setLeftRight( 0, 0, -25.5, 161.5 )
				self.CompetitiveCharacterDraftDrafted:setTopBottom( 0, 0, -22, 158 )
				self.clipFinished( CompetitiveCharacterDraftDrafted, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				itemOff:completeAnimation()
				self.itemOff:setAlpha( 1 )
				self.clipFinished( itemOff, {} )
				itemOn:completeAnimation()
				self.itemOn:setAlpha( 0 )
				self.clipFinished( itemOn, {} )
				lock:completeAnimation()
				self.lock:setAlpha( HideIfInPermanentUnlockMenu( 1 ) )
				self.clipFinished( lock, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				local OrangeGlowFrame2 = function ( OrangeGlow, event )
					local OrangeGlowFrame3 = function ( OrangeGlow, event )
						if not event.interrupted then
							OrangeGlow:beginAnimation( "keyframe", 79, true, false, CoD.TweenType.Back )
						end
						OrangeGlow:setLeftRight( 0, 0, -18, 153 )
						OrangeGlow:setTopBottom( 0, 0, -18, 153 )
						OrangeGlow:setAlpha( 1 )
						OrangeGlow:setScale( 1 )
						if event.interrupted then
							self.clipFinished( OrangeGlow, event )
						else
							OrangeGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						OrangeGlowFrame3( OrangeGlow, event )
						return 
					else
						OrangeGlow:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						OrangeGlow:setAlpha( 1 )
						OrangeGlow:setScale( 1.15 )
						OrangeGlow:registerEventHandler( "transition_complete_keyframe", OrangeGlowFrame3 )
					end
				end
				
				OrangeGlow:completeAnimation()
				self.OrangeGlow:setLeftRight( 0, 0, -18, 153 )
				self.OrangeGlow:setTopBottom( 0, 0, -18, 153 )
				self.OrangeGlow:setAlpha( 0 )
				self.OrangeGlow:setScale( 0.6 )
				OrangeGlowFrame2( OrangeGlow, {} )
				local OrangeGlow0Frame2 = function ( OrangeGlow0, event )
					local OrangeGlow0Frame3 = function ( OrangeGlow0, event )
						if not event.interrupted then
							OrangeGlow0:beginAnimation( "keyframe", 130, false, false, CoD.TweenType.Linear )
						end
						OrangeGlow0:setLeftRight( 0, 0, -18, 153 )
						OrangeGlow0:setTopBottom( 0, 0, -18, 153 )
						OrangeGlow0:setAlpha( 0.25 )
						OrangeGlow0:setScale( 1 )
						OrangeGlow0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
						if event.interrupted then
							self.clipFinished( OrangeGlow0, event )
						else
							OrangeGlow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						OrangeGlow0Frame3( OrangeGlow0, event )
						return 
					else
						OrangeGlow0:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
						OrangeGlow0:setAlpha( 0.1 )
						OrangeGlow0:registerEventHandler( "transition_complete_keyframe", OrangeGlow0Frame3 )
					end
				end
				
				OrangeGlow0:completeAnimation()
				self.OrangeGlow0:setLeftRight( 0, 0, -18, 153 )
				self.OrangeGlow0:setTopBottom( 0, 0, -18, 153 )
				self.OrangeGlow0:setAlpha( 0 )
				self.OrangeGlow0:setScale( 1 )
				self.OrangeGlow0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
				OrangeGlow0Frame2( OrangeGlow0, {} )
				local itemOffFrame2 = function ( itemOff, event )
					if not event.interrupted then
						itemOff:beginAnimation( "keyframe", 170, true, false, CoD.TweenType.Back )
					end
					itemOff:setLeftRight( 0, 1, -22, 22 )
					itemOff:setTopBottom( 0, 1, -22, 22 )
					itemOff:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( itemOff, event )
					else
						itemOff:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemOff:completeAnimation()
				self.itemOff:setLeftRight( 0, 1, 15, -15 )
				self.itemOff:setTopBottom( 0, 1, 15, -15 )
				self.itemOff:setAlpha( 1 )
				itemOffFrame2( itemOff, {} )
				itemOn:completeAnimation()
				self.itemOn:setAlpha( 0 )
				self.clipFinished( itemOn, {} )
				local Glow0Frame2 = function ( Glow0, event )
					local Glow0Frame3 = function ( Glow0, event )
						if not event.interrupted then
							Glow0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						end
						Glow0:setAlpha( 0 )
						Glow0:setScale( 1.7 )
						if event.interrupted then
							self.clipFinished( Glow0, event )
						else
							Glow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Glow0Frame3( Glow0, event )
						return 
					else
						Glow0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						Glow0:setAlpha( 1 )
						Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame3 )
					end
				end
				
				Glow0:completeAnimation()
				self.Glow0:setAlpha( 0 )
				self.Glow0:setScale( 1.3 )
				Glow0Frame2( Glow0, {} )
				lock:completeAnimation()
				self.lock:setAlpha( HideIfInPermanentUnlockMenu( 1 ) )
				self.clipFinished( lock, {} )
			end
		},
		NotAvailable = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				itemOff:completeAnimation()
				self.itemOff:setAlpha( 1 )
				self.clipFinished( itemOff, {} )
				itemOn:completeAnimation()
				self.itemOn:setAlpha( 0 )
				self.clipFinished( itemOn, {} )
				cacToken:completeAnimation()
				self.cacToken:setAlpha( 1 )
				self.clipFinished( cacToken, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				local OrangeGlowFrame2 = function ( OrangeGlow, event )
					local OrangeGlowFrame3 = function ( OrangeGlow, event )
						if not event.interrupted then
							OrangeGlow:beginAnimation( "keyframe", 79, true, false, CoD.TweenType.Back )
						end
						OrangeGlow:setLeftRight( 0, 0, -18, 153 )
						OrangeGlow:setTopBottom( 0, 0, -18, 153 )
						OrangeGlow:setAlpha( 1 )
						OrangeGlow:setScale( 1 )
						if event.interrupted then
							self.clipFinished( OrangeGlow, event )
						else
							OrangeGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						OrangeGlowFrame3( OrangeGlow, event )
						return 
					else
						OrangeGlow:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						OrangeGlow:setAlpha( 1 )
						OrangeGlow:setScale( 1.15 )
						OrangeGlow:registerEventHandler( "transition_complete_keyframe", OrangeGlowFrame3 )
					end
				end
				
				OrangeGlow:completeAnimation()
				self.OrangeGlow:setLeftRight( 0, 0, -18, 153 )
				self.OrangeGlow:setTopBottom( 0, 0, -18, 153 )
				self.OrangeGlow:setAlpha( 0 )
				self.OrangeGlow:setScale( 0.6 )
				OrangeGlowFrame2( OrangeGlow, {} )
				local OrangeGlow0Frame2 = function ( OrangeGlow0, event )
					local OrangeGlow0Frame3 = function ( OrangeGlow0, event )
						if not event.interrupted then
							OrangeGlow0:beginAnimation( "keyframe", 130, false, false, CoD.TweenType.Linear )
						end
						OrangeGlow0:setLeftRight( 0, 0, -18, 153 )
						OrangeGlow0:setTopBottom( 0, 0, -18, 153 )
						OrangeGlow0:setAlpha( 0.25 )
						OrangeGlow0:setScale( 1 )
						OrangeGlow0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
						if event.interrupted then
							self.clipFinished( OrangeGlow0, event )
						else
							OrangeGlow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						OrangeGlow0Frame3( OrangeGlow0, event )
						return 
					else
						OrangeGlow0:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
						OrangeGlow0:setAlpha( 0.1 )
						OrangeGlow0:registerEventHandler( "transition_complete_keyframe", OrangeGlow0Frame3 )
					end
				end
				
				OrangeGlow0:completeAnimation()
				self.OrangeGlow0:setLeftRight( 0, 0, -18, 153 )
				self.OrangeGlow0:setTopBottom( 0, 0, -18, 153 )
				self.OrangeGlow0:setAlpha( 0 )
				self.OrangeGlow0:setScale( 1 )
				self.OrangeGlow0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
				OrangeGlow0Frame2( OrangeGlow0, {} )
				local itemOffFrame2 = function ( itemOff, event )
					if not event.interrupted then
						itemOff:beginAnimation( "keyframe", 170, true, false, CoD.TweenType.Back )
					end
					itemOff:setLeftRight( 0, 1, -22, 22 )
					itemOff:setTopBottom( 0, 1, -22, 22 )
					itemOff:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( itemOff, event )
					else
						itemOff:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemOff:completeAnimation()
				self.itemOff:setLeftRight( 0, 1, 15, -15 )
				self.itemOff:setTopBottom( 0, 1, 15, -15 )
				self.itemOff:setAlpha( 1 )
				itemOffFrame2( itemOff, {} )
				itemOn:completeAnimation()
				self.itemOn:setAlpha( 0 )
				self.clipFinished( itemOn, {} )
				local Glow0Frame2 = function ( Glow0, event )
					local Glow0Frame3 = function ( Glow0, event )
						if not event.interrupted then
							Glow0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						end
						Glow0:setAlpha( 0 )
						Glow0:setScale( 1.7 )
						if event.interrupted then
							self.clipFinished( Glow0, event )
						else
							Glow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Glow0Frame3( Glow0, event )
						return 
					else
						Glow0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						Glow0:setAlpha( 1 )
						Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame3 )
					end
				end
				
				Glow0:completeAnimation()
				self.Glow0:setAlpha( 0 )
				self.Glow0:setScale( 1.3 )
				Glow0Frame2( Glow0, {} )
				cacToken:completeAnimation()
				self.cacToken:setAlpha( 1 )
				self.clipFinished( cacToken, {} )
			end
		},
		PermanentUnlockRefund = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				itemOff:completeAnimation()
				self.itemOff:setLeftRight( 0, 1, 0, 0 )
				self.itemOff:setTopBottom( 0, 1, 0, 0 )
				self.itemOff:setAlpha( 1 )
				self.itemOff:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				self.clipFinished( itemOff, {} )
				itemOn:completeAnimation()
				self.itemOn:setAlpha( 0 )
				self.clipFinished( itemOn, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				itemOff:completeAnimation()
				self.itemOff:setLeftRight( 0, 1, 0, 0 )
				self.itemOff:setTopBottom( 0, 1, 0, 0 )
				self.itemOff:setAlpha( 1 )
				self.clipFinished( itemOff, {} )
				local itemOnFrame2 = function ( itemOn, event )
					local itemOnFrame3 = function ( itemOn, event )
						if not event.interrupted then
							itemOn:beginAnimation( "keyframe", 79, true, false, CoD.TweenType.Back )
						end
						itemOn:setLeftRight( 0, 1, -22, 22 )
						itemOn:setTopBottom( 0, 1, -22, 22 )
						itemOn:setAlpha( 1 )
						itemOn:setZoom( 0 )
						if event.interrupted then
							self.clipFinished( itemOn, event )
						else
							itemOn:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						itemOnFrame3( itemOn, event )
						return 
					else
						itemOn:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						itemOn:setLeftRight( 0, 1, -30.02, 30.02 )
						itemOn:setTopBottom( 0, 1, -30.02, 30.02 )
						itemOn:setAlpha( 1.37 )
						itemOn:registerEventHandler( "transition_complete_keyframe", itemOnFrame3 )
					end
				end
				
				itemOn:completeAnimation()
				self.itemOn:setLeftRight( 0, 1, 0, 0 )
				self.itemOn:setTopBottom( 0, 1, 0, 0 )
				self.itemOn:setAlpha( 0 )
				self.itemOn:setZoom( 0 )
				itemOnFrame2( itemOn, {} )
				local Glow0Frame2 = function ( Glow0, event )
					local Glow0Frame3 = function ( Glow0, event )
						if not event.interrupted then
							Glow0:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
						end
						Glow0:setLeftRight( 0, 1, 6, -6 )
						Glow0:setTopBottom( 0, 1, 6, -6 )
						Glow0:setAlpha( 0 )
						Glow0:setZoom( 13 )
						Glow0:setScale( 1.7 )
						if event.interrupted then
							self.clipFinished( Glow0, event )
						else
							Glow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Glow0Frame3( Glow0, event )
						return 
					else
						Glow0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						Glow0:setAlpha( 1 )
						Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame3 )
					end
				end
				
				Glow0:completeAnimation()
				self.Glow0:setLeftRight( 0, 1, 6, -6 )
				self.Glow0:setTopBottom( 0, 1, 6, -6 )
				self.Glow0:setAlpha( 0.13 )
				self.Glow0:setZoom( 13 )
				self.Glow0:setScale( 1.3 )
				Glow0Frame2( Glow0, {} )
				CompetitiveCharacterDraftDrafted:completeAnimation()
				self.CompetitiveCharacterDraftDrafted:setLeftRight( 0, 0, -25.5, 161.5 )
				self.CompetitiveCharacterDraftDrafted:setTopBottom( 0, 0, -22, 158 )
				self.clipFinished( CompetitiveCharacterDraftDrafted, {} )
				local TokenRefundHintFrame2 = function ( TokenRefundHint, event )
					if not event.interrupted then
						TokenRefundHint:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
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
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return IsDisabled( element, controller )
			end
		},
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				return IsHeroWeaponAbilityNotAvailable( element, controller )
			end
		},
		{
			stateName = "PermanentUnlockRefund",
			condition = function ( menu, element, event )
				local f50_local0 = IsInPermanentUnlockMenu( controller )
				if f50_local0 then
					if not IsPermanentlyUnlocked( element, controller ) then
						f50_local0 = HavePermanentUnlockTokens( controller )
						if f50_local0 then
							f50_local0 = IsCACItemPurchased( element, controller )
						end
					else
						f50_local0 = false
					end
				end
				return f50_local0
			end
		}
	} )
	self:linkToElementModel( self, "disabled", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.MouseHoverIcon:close()
		self.Glow0:close()
		self.tokenPermanentUnlock:close()
		self.cacToken:close()
		self.CompetitiveCharacterDraftDrafted:close()
		self.TokenRefundHint:close()
		self.itemOff:close()
		self.itemOn:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

