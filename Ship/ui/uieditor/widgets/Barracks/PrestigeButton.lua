-- af411d703c47c955ef5a9b3529f1fea7
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.CAC.cac_lock" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Identity_SubTitle" )

local PreLoadFunc = function ( self, controller )
	DataSources.PrestigeStats.getModel( controller )
end

CoD.PrestigeButton = InheritFrom( LUI.UIElement )
CoD.PrestigeButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.PrestigeButton )
	self.id = "PrestigeButton"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 350 )
	self:setTopBottom( true, false, 0, 216 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgInactive0 = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive0:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgInactive0:setTopBottom( true, true, -2, 2 )
	BoxButtonLrgInactive0:setRGB( 0.87, 0.97, 1 )
	BoxButtonLrgInactive0:setAlpha( 0.4 )
	self:addElement( BoxButtonLrgInactive0 )
	self.BoxButtonLrgInactive0 = BoxButtonLrgInactive0
	
	local BlackTint = LUI.UIImage.new()
	BlackTint:setLeftRight( true, true, 3, -2 )
	BlackTint:setTopBottom( true, true, 3, -3 )
	BlackTint:setRGB( 0, 0, 0 )
	BlackTint:setAlpha( 0.05 )
	self:addElement( BlackTint )
	self.BlackTint = BlackTint
	
	local BoxButtonLrgInactiveDiag = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag:setLeftRight( true, true, 0, -1 )
	BoxButtonLrgInactiveDiag:setTopBottom( true, true, 0, -1 )
	BoxButtonLrgInactiveDiag:setAlpha( 0 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	local LockIcon = CoD.cac_lock.new( menu, controller )
	LockIcon:setLeftRight( false, false, -64, 64 )
	LockIcon:setTopBottom( false, false, -78, 50 )
	LockIcon:setAlpha( 0 )
	LockIcon.lockedIcon:setAlpha( 0 )
	self:addElement( LockIcon )
	self.LockIcon = LockIcon
	
	local LockedHint = LUI.UIText.new()
	LockedHint:setLeftRight( false, false, -175, 175 )
	LockedHint:setTopBottom( false, false, 35, 52 )
	LockedHint:setRGB( 0.67, 0.67, 0.67 )
	LockedHint:setAlpha( 0 )
	LockedHint:setText( Engine.Localize( "MENU_PRESTIGE_MODE_LOCKED_HINT" ) )
	LockedHint:setTTF( "fonts/escom.ttf" )
	LockedHint:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	LockedHint:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( LockedHint )
	self.LockedHint = LockedHint
	
	local PrestigeMasterCard = LUI.UIImage.new()
	PrestigeMasterCard:setLeftRight( false, false, -160, 160 )
	PrestigeMasterCard:setTopBottom( false, false, -54, 26 )
	PrestigeMasterCard:setAlpha( 0 )
	PrestigeMasterCard:setImage( RegisterImage( "uie_t7_callingcard_prestige_skull" ) )
	self:addElement( PrestigeMasterCard )
	self.PrestigeMasterCard = PrestigeMasterCard
	
	local PrestigeIcon = LUI.UIImage.new()
	PrestigeIcon:setLeftRight( false, false, 17, 145 )
	PrestigeIcon:setTopBottom( false, false, -78, 50 )
	PrestigeIcon:subscribeToGlobalModel( controller, "PrestigeStats", "icon", function ( model )
		local icon = Engine.GetModelValue( model )
		if icon then
			PrestigeIcon:setImage( RegisterImage( SetToDisabledIfNotAtXPCap( controller, GetRankIconLarge( icon ) ) ) )
		end
	end )
	self:addElement( PrestigeIcon )
	self.PrestigeIcon = PrestigeIcon
	
	local PermanentUnlockTokens = LUI.UIText.new()
	PermanentUnlockTokens:setLeftRight( true, false, 11, 192 )
	PermanentUnlockTokens:setTopBottom( false, true, -93, -71 )
	PermanentUnlockTokens:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	PermanentUnlockTokens:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	PermanentUnlockTokens:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	PermanentUnlockTokens:subscribeToGlobalModel( controller, "PerController", "permanentUnlockTokensCount", function ( model )
		local permanentUnlockTokensCount = Engine.GetModelValue( model )
		if permanentUnlockTokensCount then
			PermanentUnlockTokens:setAlpha( HideIfPrestigeMaster( controller, HideIfNumEqualTo( 0, permanentUnlockTokensCount ) ) )
		end
	end )
	PermanentUnlockTokens:subscribeToGlobalModel( controller, "PerController", "permanentUnlockTokensCount", function ( model )
		local permanentUnlockTokensCount = Engine.GetModelValue( model )
		if permanentUnlockTokensCount then
			PermanentUnlockTokens:setText( Engine.Localize( GetPermanentUnlockTokenText( controller, permanentUnlockTokensCount ) ) )
		end
	end )
	self:addElement( PermanentUnlockTokens )
	self.PermanentUnlockTokens = PermanentUnlockTokens
	
	local AwardsAvailable = LUI.UIText.new()
	AwardsAvailable:setLeftRight( true, false, 11, 192 )
	AwardsAvailable:setTopBottom( true, false, 145, 167 )
	AwardsAvailable:setText( Engine.Localize( "MENU_AWARDS_AVAILABLE" ) )
	AwardsAvailable:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	AwardsAvailable:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	AwardsAvailable:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( AwardsAvailable )
	self.AwardsAvailable = AwardsAvailable
	
	local ButtonTitle = LUI.UIText.new()
	ButtonTitle:setLeftRight( true, true, 22, 6 )
	ButtonTitle:setTopBottom( false, true, -28, -5 )
	ButtonTitle:setAlpha( 0 )
	ButtonTitle:setText( Engine.Localize( "MPUI_PRESTIGE_MODE" ) )
	ButtonTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ButtonTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ButtonTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ButtonTitle )
	self.ButtonTitle = ButtonTitle
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, 0, 0 )
	FocusBarT:setTopBottom( true, false, -1, 3 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, 0, 0 )
	FocusBarB:setTopBottom( false, true, -3, 1 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local BlackLine = LUI.UIImage.new()
	BlackLine:setLeftRight( true, true, 3, -3 )
	BlackLine:setTopBottom( false, false, -25.5, 15 )
	BlackLine:setRGB( 0, 0, 0 )
	BlackLine:setAlpha( 0 )
	self:addElement( BlackLine )
	self.BlackLine = BlackLine
	
	local lockedIcon = CoD.cac_lock.new( menu, controller )
	lockedIcon:setLeftRight( false, false, -12.5, 18.5 )
	lockedIcon:setTopBottom( false, false, -21, 11 )
	lockedIcon:setAlpha( 0 )
	self:addElement( lockedIcon )
	self.lockedIcon = lockedIcon
	
	local StartMenuIdentitySubTitle0 = CoD.StartMenu_Identity_SubTitle.new( menu, controller )
	StartMenuIdentitySubTitle0:setLeftRight( true, false, 5, 347 )
	StartMenuIdentitySubTitle0:setTopBottom( true, false, 186.5, 212.5 )
	StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "Combat" ) )
	StartMenuIdentitySubTitle0.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( StartMenuIdentitySubTitle0 )
	self.StartMenuIdentitySubTitle0 = StartMenuIdentitySubTitle0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )

				BoxButtonLrgInactive0:completeAnimation()
				self.BoxButtonLrgInactive0:setAlpha( 0.4 )
				self.clipFinished( BoxButtonLrgInactive0, {} )

				BlackTint:completeAnimation()
				self.BlackTint:setAlpha( 0.05 )
				self.clipFinished( BlackTint, {} )

				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )

				LockIcon:completeAnimation()
				self.LockIcon:setAlpha( 0 )
				self.clipFinished( LockIcon, {} )

				LockedHint:completeAnimation()
				self.LockedHint:setAlpha( 0 )
				self.clipFinished( LockedHint, {} )

				PrestigeMasterCard:completeAnimation()
				self.PrestigeMasterCard:setAlpha( 0 )
				self.clipFinished( PrestigeMasterCard, {} )

				PrestigeIcon:completeAnimation()
				self.PrestigeIcon:setLeftRight( false, false, 17, 145 )
				self.PrestigeIcon:setTopBottom( false, false, -78, 50 )
				self.PrestigeIcon:setAlpha( 1 )
				self.clipFinished( PrestigeIcon, {} )

				AwardsAvailable:completeAnimation()
				self.AwardsAvailable:setAlpha( 1 )
				self.clipFinished( AwardsAvailable, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )

				BlackLine:completeAnimation()
				self.BlackLine:setAlpha( 0 )
				self.clipFinished( BlackLine, {} )

				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 12 )

				BoxButtonLrgInactive0:completeAnimation()
				self.BoxButtonLrgInactive0:setAlpha( 0.7 )
				self.clipFinished( BoxButtonLrgInactive0, {} )

				BlackTint:completeAnimation()
				self.BlackTint:setAlpha( 0 )
				self.clipFinished( BlackTint, {} )

				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0.05 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )

				LockIcon:completeAnimation()
				self.LockIcon:setAlpha( 0 )
				self.clipFinished( LockIcon, {} )

				LockedHint:completeAnimation()
				self.LockedHint:setAlpha( 0 )
				self.clipFinished( LockedHint, {} )

				PrestigeMasterCard:completeAnimation()
				self.PrestigeMasterCard:setAlpha( 0 )
				self.clipFinished( PrestigeMasterCard, {} )

				PrestigeIcon:completeAnimation()
				self.PrestigeIcon:setLeftRight( false, false, 17, 145 )
				self.PrestigeIcon:setTopBottom( false, false, -78, 50 )
				self.PrestigeIcon:setAlpha( 1 )
				self.clipFinished( PrestigeIcon, {} )

				AwardsAvailable:completeAnimation()
				self.AwardsAvailable:setAlpha( 1 )
				self.clipFinished( AwardsAvailable, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )

				BlackLine:completeAnimation()
				self.BlackLine:setAlpha( 0 )
				self.clipFinished( BlackLine, {} )

				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
			end
		},
		Locked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )

				BoxButtonLrgInactive0:completeAnimation()
				self.BoxButtonLrgInactive0:setAlpha( 0.4 )
				self.clipFinished( BoxButtonLrgInactive0, {} )

				BlackTint:completeAnimation()
				self.BlackTint:setAlpha( 0.05 )
				self.clipFinished( BlackTint, {} )

				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0.3 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )

				LockIcon:completeAnimation()
				self.LockIcon:setLeftRight( false, false, -64, 64 )
				self.LockIcon:setTopBottom( false, false, -82, 46 )
				self.LockIcon:setAlpha( 0 )
				self.clipFinished( LockIcon, {} )

				LockedHint:completeAnimation()
				self.LockedHint:setLeftRight( false, false, -175, 175 )
				self.LockedHint:setTopBottom( false, false, 31, 48 )
				self.LockedHint:setAlpha( 1 )
				self.clipFinished( LockedHint, {} )

				PrestigeMasterCard:completeAnimation()
				self.PrestigeMasterCard:setAlpha( 0 )
				self.clipFinished( PrestigeMasterCard, {} )

				PrestigeIcon:completeAnimation()
				self.PrestigeIcon:setAlpha( 0 )
				self.clipFinished( PrestigeIcon, {} )

				AwardsAvailable:completeAnimation()
				self.AwardsAvailable:setAlpha( 0 )
				self.clipFinished( AwardsAvailable, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )

				BlackLine:completeAnimation()
				self.BlackLine:setAlpha( 0.5 )
				self.clipFinished( BlackLine, {} )

				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 1 )
				self.clipFinished( lockedIcon, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 12 )

				BoxButtonLrgInactive0:completeAnimation()
				self.BoxButtonLrgInactive0:setAlpha( 0.7 )
				self.clipFinished( BoxButtonLrgInactive0, {} )

				BlackTint:completeAnimation()
				self.BlackTint:setAlpha( 0 )
				self.clipFinished( BlackTint, {} )

				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0.3 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )

				LockIcon:completeAnimation()
				self.LockIcon:setLeftRight( false, false, -64, 64 )
				self.LockIcon:setTopBottom( false, false, -82, 46 )
				self.LockIcon:setAlpha( 0 )
				self.clipFinished( LockIcon, {} )

				LockedHint:completeAnimation()
				self.LockedHint:setLeftRight( false, false, -175, 175 )
				self.LockedHint:setTopBottom( false, false, 31, 48 )
				self.LockedHint:setAlpha( 1 )
				self.clipFinished( LockedHint, {} )

				PrestigeMasterCard:completeAnimation()
				self.PrestigeMasterCard:setAlpha( 0 )
				self.clipFinished( PrestigeMasterCard, {} )

				PrestigeIcon:completeAnimation()
				self.PrestigeIcon:setAlpha( 0 )
				self.clipFinished( PrestigeIcon, {} )

				AwardsAvailable:completeAnimation()
				self.AwardsAvailable:setAlpha( 0 )
				self.clipFinished( AwardsAvailable, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )

				BlackLine:completeAnimation()
				self.BlackLine:setAlpha( 0.5 )
				self.clipFinished( BlackLine, {} )

				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 1 )
				self.clipFinished( lockedIcon, {} )
			end
		},
		FirstAvailable = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )

				BoxButtonLrgInactive0:completeAnimation()
				self.BoxButtonLrgInactive0:setAlpha( 0.4 )
				self.clipFinished( BoxButtonLrgInactive0, {} )

				BlackTint:completeAnimation()
				self.BlackTint:setAlpha( 0.05 )
				self.clipFinished( BlackTint, {} )

				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )

				LockIcon:completeAnimation()
				self.LockIcon:setAlpha( 0 )
				self.clipFinished( LockIcon, {} )

				LockedHint:completeAnimation()
				self.LockedHint:setAlpha( 0 )
				self.clipFinished( LockedHint, {} )

				PrestigeMasterCard:completeAnimation()
				self.PrestigeMasterCard:setAlpha( 0 )
				self.clipFinished( PrestigeMasterCard, {} )

				PrestigeIcon:completeAnimation()
				self.PrestigeIcon:setLeftRight( false, false, -64, 64 )
				self.PrestigeIcon:setTopBottom( false, false, -78, 50 )
				self.clipFinished( PrestigeIcon, {} )

				AwardsAvailable:completeAnimation()
				self.AwardsAvailable:setAlpha( 0 )
				self.clipFinished( AwardsAvailable, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )

				BlackLine:completeAnimation()
				self.BlackLine:setAlpha( 0 )
				self.clipFinished( BlackLine, {} )

				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 12 )

				BoxButtonLrgInactive0:completeAnimation()
				self.BoxButtonLrgInactive0:setAlpha( 0.7 )
				self.clipFinished( BoxButtonLrgInactive0, {} )

				BlackTint:completeAnimation()
				self.BlackTint:setAlpha( 0 )
				self.clipFinished( BlackTint, {} )

				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )

				LockIcon:completeAnimation()
				self.LockIcon:setAlpha( 0 )
				self.clipFinished( LockIcon, {} )

				LockedHint:completeAnimation()
				self.LockedHint:setAlpha( 0 )
				self.clipFinished( LockedHint, {} )

				PrestigeMasterCard:completeAnimation()
				self.PrestigeMasterCard:setAlpha( 0 )
				self.clipFinished( PrestigeMasterCard, {} )

				PrestigeIcon:completeAnimation()
				self.PrestigeIcon:setLeftRight( false, false, -64, 64 )
				self.PrestigeIcon:setTopBottom( false, false, -78, 50 )
				self.PrestigeIcon:setAlpha( 1 )
				self.clipFinished( PrestigeIcon, {} )

				AwardsAvailable:completeAnimation()
				self.AwardsAvailable:setAlpha( 0 )
				self.clipFinished( AwardsAvailable, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )

				BlackLine:completeAnimation()
				self.BlackLine:setAlpha( 0 )
				self.clipFinished( BlackLine, {} )

				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
			end
		},
		PrestigeMasterZM = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )

				BoxButtonLrgInactive0:completeAnimation()
				self.BoxButtonLrgInactive0:setAlpha( 0.4 )
				self.clipFinished( BoxButtonLrgInactive0, {} )

				BlackTint:completeAnimation()
				self.BlackTint:setAlpha( 0.05 )
				self.clipFinished( BlackTint, {} )

				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )

				LockIcon:completeAnimation()
				self.LockIcon:setAlpha( 0 )
				self.clipFinished( LockIcon, {} )

				LockedHint:completeAnimation()
				self.LockedHint:setAlpha( 0 )
				self.clipFinished( LockedHint, {} )

				PrestigeMasterCard:completeAnimation()
				self.PrestigeMasterCard:setAlpha( 0 )
				self.clipFinished( PrestigeMasterCard, {} )

				PrestigeIcon:completeAnimation()
				self.PrestigeIcon:setLeftRight( false, false, 17, 145 )
				self.PrestigeIcon:setTopBottom( false, false, -78, 50 )
				self.PrestigeIcon:setAlpha( 1 )
				self.clipFinished( PrestigeIcon, {} )

				AwardsAvailable:completeAnimation()
				self.AwardsAvailable:setAlpha( 1 )
				self.AwardsAvailable:setText( Engine.Localize( "MENU_FRESH_START_AVAILABLE" ) )
				self.clipFinished( AwardsAvailable, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )

				BlackLine:completeAnimation()
				self.BlackLine:setAlpha( 0 )
				self.clipFinished( BlackLine, {} )

				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 11 )

				BoxButtonLrgInactive0:completeAnimation()
				self.BoxButtonLrgInactive0:setAlpha( 0.7 )
				self.clipFinished( BoxButtonLrgInactive0, {} )

				BlackTint:completeAnimation()
				self.BlackTint:setAlpha( 0 )
				self.clipFinished( BlackTint, {} )

				LockIcon:completeAnimation()
				self.LockIcon:setAlpha( 0 )
				self.clipFinished( LockIcon, {} )

				LockedHint:completeAnimation()
				self.LockedHint:setAlpha( 0 )
				self.clipFinished( LockedHint, {} )

				PrestigeMasterCard:completeAnimation()
				self.PrestigeMasterCard:setAlpha( 0 )
				self.clipFinished( PrestigeMasterCard, {} )

				PrestigeIcon:completeAnimation()
				self.PrestigeIcon:setLeftRight( false, false, 17, 145 )
				self.PrestigeIcon:setTopBottom( false, false, -78, 50 )
				self.PrestigeIcon:setAlpha( 1 )
				self.clipFinished( PrestigeIcon, {} )

				AwardsAvailable:completeAnimation()
				self.AwardsAvailable:setAlpha( 1 )
				self.AwardsAvailable:setText( Engine.Localize( "MENU_FRESH_START_AVAILABLE" ) )
				self.clipFinished( AwardsAvailable, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )

				BlackLine:completeAnimation()
				self.BlackLine:setAlpha( 0 )
				self.clipFinished( BlackLine, {} )

				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
			end
		},
		PrestigeMaster = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )

				BoxButtonLrgInactive0:completeAnimation()
				self.BoxButtonLrgInactive0:setAlpha( 0.4 )
				self.clipFinished( BoxButtonLrgInactive0, {} )

				BlackTint:completeAnimation()
				self.BlackTint:setAlpha( 0.05 )
				self.clipFinished( BlackTint, {} )

				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )

				LockIcon:completeAnimation()
				self.LockIcon:setAlpha( 0 )
				self.clipFinished( LockIcon, {} )

				LockedHint:completeAnimation()
				self.LockedHint:setAlpha( 0 )
				self.clipFinished( LockedHint, {} )

				PrestigeMasterCard:completeAnimation()
				self.PrestigeMasterCard:setLeftRight( false, false, -160, 160 )
				self.PrestigeMasterCard:setTopBottom( false, false, -54, 26 )
				self.PrestigeMasterCard:setAlpha( 1 )
				self.clipFinished( PrestigeMasterCard, {} )

				PrestigeIcon:completeAnimation()
				self.PrestigeIcon:setLeftRight( false, false, 17, 145 )
				self.PrestigeIcon:setTopBottom( false, false, -78, 50 )
				self.PrestigeIcon:setAlpha( 0 )
				self.clipFinished( PrestigeIcon, {} )

				AwardsAvailable:completeAnimation()
				self.AwardsAvailable:setAlpha( 1 )
				self.AwardsAvailable:setText( Engine.Localize( "MENU_FRESH_START_AVAILABLE" ) )
				self.clipFinished( AwardsAvailable, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )

				BlackLine:completeAnimation()
				self.BlackLine:setAlpha( 0 )
				self.clipFinished( BlackLine, {} )

				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 11 )

				BoxButtonLrgInactive0:completeAnimation()
				self.BoxButtonLrgInactive0:setAlpha( 0.7 )
				self.clipFinished( BoxButtonLrgInactive0, {} )

				BlackTint:completeAnimation()
				self.BlackTint:setAlpha( 0 )
				self.clipFinished( BlackTint, {} )

				LockIcon:completeAnimation()
				self.LockIcon:setAlpha( 0 )
				self.clipFinished( LockIcon, {} )

				LockedHint:completeAnimation()
				self.LockedHint:setAlpha( 0 )
				self.clipFinished( LockedHint, {} )

				PrestigeMasterCard:completeAnimation()
				self.PrestigeMasterCard:setAlpha( 1 )
				self.clipFinished( PrestigeMasterCard, {} )

				PrestigeIcon:completeAnimation()
				self.PrestigeIcon:setLeftRight( false, false, 17, 145 )
				self.PrestigeIcon:setTopBottom( false, false, -78, 50 )
				self.PrestigeIcon:setAlpha( 0 )
				self.clipFinished( PrestigeIcon, {} )

				AwardsAvailable:completeAnimation()
				self.AwardsAvailable:setAlpha( 1 )
				self.AwardsAvailable:setText( Engine.Localize( "MENU_FRESH_START_AVAILABLE" ) )
				self.clipFinished( AwardsAvailable, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )

				BlackLine:completeAnimation()
				self.BlackLine:setAlpha( 0 )
				self.clipFinished( BlackLine, {} )

				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsPrestigeLevelAtZero( controller ) and not IsAtXPCap( controller )
			end
		},
		{
			stateName = "FirstAvailable",
			condition = function ( menu, element, event )
				return IsPrestigeLevelAtZero( controller ) and IsAtXPCap( controller )
			end
		},
		{
			stateName = "PrestigeMasterZM",
			condition = function ( menu, element, event )
				return IsMaxPrestigeLevel( controller ) and IsGlobalModelValueEqualToEnum( element, controller, "prestigeGameMode", Enum.eModes.MODE_ZOMBIES )
			end
		},
		{
			stateName = "PrestigeMaster",
			condition = function ( menu, element, event )
				return IsMaxPrestigeLevel( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "prestigeGameMode" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "prestigeGameMode"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BoxButtonLrgInactive0:close()
		element.BoxButtonLrgInactiveDiag:close()
		element.LockIcon:close()
		element.FocusBarT:close()
		element.FocusBarB:close()
		element.lockedIcon:close()
		element.StartMenuIdentitySubTitle0:close()
		element.PrestigeIcon:close()
		element.PermanentUnlockTokens:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
