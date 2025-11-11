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
	self:setLeftRight( 0, 0, 0, 525 )
	self:setTopBottom( 0, 0, 0, 324 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgInactive0 = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive0:setLeftRight( 0, 1, -3, 3 )
	BoxButtonLrgInactive0:setTopBottom( 0, 1, -3, 3 )
	BoxButtonLrgInactive0:setRGB( 0.87, 0.97, 1 )
	BoxButtonLrgInactive0:setAlpha( 0.4 )
	self:addElement( BoxButtonLrgInactive0 )
	self.BoxButtonLrgInactive0 = BoxButtonLrgInactive0
	
	local BlackTint = LUI.UIImage.new()
	BlackTint:setLeftRight( 0, 1, 5, -3 )
	BlackTint:setTopBottom( 0, 1, 4, -4 )
	BlackTint:setRGB( 0, 0, 0 )
	BlackTint:setAlpha( 0.05 )
	self:addElement( BlackTint )
	self.BlackTint = BlackTint
	
	local BoxButtonLrgInactiveDiag = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag:setLeftRight( 0, 1, 0, -2 )
	BoxButtonLrgInactiveDiag:setTopBottom( 0, 1, 0, -2 )
	BoxButtonLrgInactiveDiag:setAlpha( 0 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	local LockIcon = CoD.cac_lock.new( menu, controller )
	LockIcon:setLeftRight( 0.5, 0.5, -96, 96 )
	LockIcon:setTopBottom( 0.5, 0.5, -117, 75 )
	LockIcon:setAlpha( 0 )
	LockIcon.lockedIcon:setAlpha( 0 )
	self:addElement( LockIcon )
	self.LockIcon = LockIcon
	
	local LockedHint = LUI.UIText.new()
	LockedHint:setLeftRight( 0.5, 0.5, -262.5, 262.5 )
	LockedHint:setTopBottom( 0.5, 0.5, 53, 78 )
	LockedHint:setRGB( 0.67, 0.67, 0.67 )
	LockedHint:setAlpha( 0 )
	LockedHint:setText( Engine.Localize( "MENU_PRESTIGE_MODE_LOCKED_HINT" ) )
	LockedHint:setTTF( "fonts/escom.ttf" )
	LockedHint:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	LockedHint:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( LockedHint )
	self.LockedHint = LockedHint
	
	local PrestigeMasterCard = LUI.UIImage.new()
	PrestigeMasterCard:setLeftRight( 0.5, 0.5, -240, 240 )
	PrestigeMasterCard:setTopBottom( 0.5, 0.5, -81, 39 )
	PrestigeMasterCard:setAlpha( 0 )
	PrestigeMasterCard:setImage( RegisterImage( "uie_t7_callingcard_prestige_skull" ) )
	self:addElement( PrestigeMasterCard )
	self.PrestigeMasterCard = PrestigeMasterCard
	
	local PrestigeIcon = LUI.UIImage.new()
	PrestigeIcon:setLeftRight( 0.5, 0.5, 26, 218 )
	PrestigeIcon:setTopBottom( 0.5, 0.5, -117, 75 )
	PrestigeIcon:subscribeToGlobalModel( controller, "PrestigeStats", "icon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PrestigeIcon:setImage( RegisterImage( SetToDisabledIfNotAtXPCap( controller, GetRankIconLarge( modelValue ) ) ) )
		end
	end )
	self:addElement( PrestigeIcon )
	self.PrestigeIcon = PrestigeIcon
	
	local PermanentUnlockTokens = LUI.UIText.new()
	PermanentUnlockTokens:setLeftRight( 0, 0, 16, 288 )
	PermanentUnlockTokens:setTopBottom( 1, 1, -139, -106 )
	PermanentUnlockTokens:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	PermanentUnlockTokens:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	PermanentUnlockTokens:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	PermanentUnlockTokens:subscribeToGlobalModel( controller, "PerController", "permanentUnlockTokensCount", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PermanentUnlockTokens:setAlpha( HideIfPrestigeMaster( controller, HideIfNumEqualTo( 0, modelValue ) ) )
		end
	end )
	PermanentUnlockTokens:subscribeToGlobalModel( controller, "PerController", "permanentUnlockTokensCount", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PermanentUnlockTokens:setText( GetPermanentUnlockTokenText( controller, modelValue ) )
		end
	end )
	self:addElement( PermanentUnlockTokens )
	self.PermanentUnlockTokens = PermanentUnlockTokens
	
	local AwardsAvailable = LUI.UIText.new()
	AwardsAvailable:setLeftRight( 0, 0, 16, 288 )
	AwardsAvailable:setTopBottom( 0, 0, 217, 250 )
	AwardsAvailable:setText( Engine.Localize( "MENU_AWARDS_AVAILABLE" ) )
	AwardsAvailable:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	AwardsAvailable:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	AwardsAvailable:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( AwardsAvailable )
	self.AwardsAvailable = AwardsAvailable
	
	local ButtonTitle = LUI.UIText.new()
	ButtonTitle:setLeftRight( 0, 1, 33, 9 )
	ButtonTitle:setTopBottom( 1, 1, -42, -8 )
	ButtonTitle:setAlpha( 0 )
	ButtonTitle:setText( Engine.Localize( "MPUI_PRESTIGE_MODE" ) )
	ButtonTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ButtonTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ButtonTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ButtonTitle )
	self.ButtonTitle = ButtonTitle
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( 0, 1, 0, 0 )
	FocusBarT:setTopBottom( 0, 0, -1, 5 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( 0, 1, 0, 0 )
	FocusBarB:setTopBottom( 1, 1, -5, 1 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local BlackLine = LUI.UIImage.new()
	BlackLine:setLeftRight( 0, 1, 4, -4 )
	BlackLine:setTopBottom( 0.5, 0.5, -38, 23 )
	BlackLine:setRGB( 0, 0, 0 )
	BlackLine:setAlpha( 0 )
	self:addElement( BlackLine )
	self.BlackLine = BlackLine
	
	local lockedIcon = CoD.cac_lock.new( menu, controller )
	lockedIcon:setLeftRight( 0.5, 0.5, -19, 27 )
	lockedIcon:setTopBottom( 0.5, 0.5, -32, 16 )
	lockedIcon:setAlpha( 0 )
	self:addElement( lockedIcon )
	self.lockedIcon = lockedIcon
	
	local StartMenuIdentitySubTitle0 = CoD.StartMenu_Identity_SubTitle.new( menu, controller )
	StartMenuIdentitySubTitle0:setLeftRight( 0, 0, 7, 520 )
	StartMenuIdentitySubTitle0:setTopBottom( 0, 0, 280, 319 )
	StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "Combat" ) )
	StartMenuIdentitySubTitle0.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( StartMenuIdentitySubTitle0 )
	self.StartMenuIdentitySubTitle0 = StartMenuIdentitySubTitle0
	
	self.resetProperties = function ()
		FocusBarB:completeAnimation()
		FocusBarT:completeAnimation()
		BoxButtonLrgInactiveDiag:completeAnimation()
		BoxButtonLrgInactive0:completeAnimation()
		BlackTint:completeAnimation()
		LockIcon:completeAnimation()
		PrestigeIcon:completeAnimation()
		AwardsAvailable:completeAnimation()
		LockedHint:completeAnimation()
		lockedIcon:completeAnimation()
		BlackLine:completeAnimation()
		PrestigeMasterCard:completeAnimation()
		FocusBarB:setAlpha( 0 )
		FocusBarT:setAlpha( 0 )
		BoxButtonLrgInactiveDiag:setAlpha( 0 )
		BoxButtonLrgInactive0:setAlpha( 0.4 )
		BlackTint:setAlpha( 0.05 )
		LockIcon:setLeftRight( 0.5, 0.5, -96, 96 )
		LockIcon:setTopBottom( 0.5, 0.5, -117, 75 )
		PrestigeIcon:setLeftRight( 0.5, 0.5, 26, 218 )
		PrestigeIcon:setTopBottom( 0.5, 0.5, -117, 75 )
		PrestigeIcon:setAlpha( 1 )
		AwardsAvailable:setAlpha( 1 )
		AwardsAvailable:setText( Engine.Localize( "MENU_AWARDS_AVAILABLE" ) )
		LockedHint:setLeftRight( 0.5, 0.5, -262.5, 262.5 )
		LockedHint:setTopBottom( 0.5, 0.5, 53, 78 )
		LockedHint:setAlpha( 0 )
		lockedIcon:setAlpha( 0 )
		BlackLine:setAlpha( 0 )
		PrestigeMasterCard:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				BoxButtonLrgInactive0:completeAnimation()
				self.BoxButtonLrgInactive0:setAlpha( 0.7 )
				self.clipFinished( BoxButtonLrgInactive0, {} )
				BlackTint:completeAnimation()
				self.BlackTint:setAlpha( 0 )
				self.clipFinished( BlackTint, {} )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0.05 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end
		},
		Locked = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0.3 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				LockIcon:completeAnimation()
				self.LockIcon:setLeftRight( 0.5, 0.5, -96, 96 )
				self.LockIcon:setTopBottom( 0.5, 0.5, -123, 69 )
				self.clipFinished( LockIcon, {} )
				LockedHint:completeAnimation()
				self.LockedHint:setLeftRight( 0.5, 0.5, -263, 262 )
				self.LockedHint:setTopBottom( 0.5, 0.5, 46.5, 72.5 )
				self.LockedHint:setAlpha( 1 )
				self.clipFinished( LockedHint, {} )
				PrestigeIcon:completeAnimation()
				self.PrestigeIcon:setAlpha( 0 )
				self.clipFinished( PrestigeIcon, {} )
				AwardsAvailable:completeAnimation()
				self.AwardsAvailable:setAlpha( 0 )
				self.clipFinished( AwardsAvailable, {} )
				BlackLine:completeAnimation()
				self.BlackLine:setAlpha( 0.5 )
				self.clipFinished( BlackLine, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 1 )
				self.clipFinished( lockedIcon, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 11 )
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
				self.LockIcon:setLeftRight( 0.5, 0.5, -96, 96 )
				self.LockIcon:setTopBottom( 0.5, 0.5, -123, 69 )
				self.clipFinished( LockIcon, {} )
				LockedHint:completeAnimation()
				self.LockedHint:setLeftRight( 0.5, 0.5, -263, 262 )
				self.LockedHint:setTopBottom( 0.5, 0.5, 46.5, 72.5 )
				self.LockedHint:setAlpha( 1 )
				self.clipFinished( LockedHint, {} )
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
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				PrestigeIcon:completeAnimation()
				self.PrestigeIcon:setLeftRight( 0.5, 0.5, -96, 96 )
				self.PrestigeIcon:setTopBottom( 0.5, 0.5, -117, 75 )
				self.clipFinished( PrestigeIcon, {} )
				AwardsAvailable:completeAnimation()
				self.AwardsAvailable:setAlpha( 0 )
				self.clipFinished( AwardsAvailable, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				BoxButtonLrgInactive0:completeAnimation()
				self.BoxButtonLrgInactive0:setAlpha( 0.7 )
				self.clipFinished( BoxButtonLrgInactive0, {} )
				BlackTint:completeAnimation()
				self.BlackTint:setAlpha( 0 )
				self.clipFinished( BlackTint, {} )
				PrestigeIcon:completeAnimation()
				self.PrestigeIcon:setLeftRight( 0.5, 0.5, -96, 96 )
				self.PrestigeIcon:setTopBottom( 0.5, 0.5, -117, 75 )
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
			end
		},
		PrestigeMasterZM = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				AwardsAvailable:completeAnimation()
				self.AwardsAvailable:setText( Engine.Localize( "MENU_FRESH_START_AVAILABLE" ) )
				self.clipFinished( AwardsAvailable, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				BoxButtonLrgInactive0:completeAnimation()
				self.BoxButtonLrgInactive0:setAlpha( 0.7 )
				self.clipFinished( BoxButtonLrgInactive0, {} )
				BlackTint:completeAnimation()
				self.BlackTint:setAlpha( 0 )
				self.clipFinished( BlackTint, {} )
				AwardsAvailable:completeAnimation()
				self.AwardsAvailable:setText( Engine.Localize( "MENU_FRESH_START_AVAILABLE" ) )
				self.clipFinished( AwardsAvailable, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end
		},
		PrestigeMaster = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				PrestigeMasterCard:completeAnimation()
				self.PrestigeMasterCard:setAlpha( 1 )
				self.clipFinished( PrestigeMasterCard, {} )
				PrestigeIcon:completeAnimation()
				self.PrestigeIcon:setAlpha( 0 )
				self.clipFinished( PrestigeIcon, {} )
				AwardsAvailable:completeAnimation()
				self.AwardsAvailable:setText( Engine.Localize( "MENU_FRESH_START_AVAILABLE" ) )
				self.clipFinished( AwardsAvailable, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				BoxButtonLrgInactive0:completeAnimation()
				self.BoxButtonLrgInactive0:setAlpha( 0.7 )
				self.clipFinished( BoxButtonLrgInactive0, {} )
				BlackTint:completeAnimation()
				self.BlackTint:setAlpha( 0 )
				self.clipFinished( BlackTint, {} )
				PrestigeMasterCard:completeAnimation()
				self.PrestigeMasterCard:setAlpha( 1 )
				self.clipFinished( PrestigeMasterCard, {} )
				PrestigeIcon:completeAnimation()
				self.PrestigeIcon:setAlpha( 0 )
				self.clipFinished( PrestigeIcon, {} )
				AwardsAvailable:completeAnimation()
				self.AwardsAvailable:setText( Engine.Localize( "MENU_FRESH_START_AVAILABLE" ) )
				self.clipFinished( AwardsAvailable, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BoxButtonLrgInactive0:close()
		self.BoxButtonLrgInactiveDiag:close()
		self.LockIcon:close()
		self.FocusBarT:close()
		self.FocusBarB:close()
		self.lockedIcon:close()
		self.StartMenuIdentitySubTitle0:close()
		self.PrestigeIcon:close()
		self.PermanentUnlockTokens:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

