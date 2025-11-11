require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.CAC.cac_lock" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Identity_SubTitle" )

CoD.LeaderboardsButton = InheritFrom( LUI.UIElement )
CoD.LeaderboardsButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.LeaderboardsButton )
	self.id = "LeaderboardsButton"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 525 )
	self:setTopBottom( 0, 0, 0, 324 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( 0, 1, -3, 3 )
	BoxButtonLrgInactive:setTopBottom( 0, 1, -3, 3 )
	BoxButtonLrgInactive:setRGB( 0.87, 0.97, 1 )
	BoxButtonLrgInactive:setAlpha( 0.4 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local BlackTint = LUI.UIImage.new()
	BlackTint:setLeftRight( 0, 1, 5, -3 )
	BlackTint:setTopBottom( 0, 1, 4, -4 )
	BlackTint:setRGB( 0, 0, 0 )
	BlackTint:setAlpha( 0.05 )
	self:addElement( BlackTint )
	self.BlackTint = BlackTint
	
	local tempimage = LUI.UIImage.new()
	tempimage:setLeftRight( 0.5, 0.5, -139, 137 )
	tempimage:setTopBottom( 0.5, 0.5, -158, 118 )
	tempimage:setImage( RegisterImage( "playlist_sticksnstones" ) )
	self:addElement( tempimage )
	self.tempimage = tempimage
	
	local ButtonTitleBG = LUI.UIImage.new()
	ButtonTitleBG:setLeftRight( 0, 1, 5, -3 )
	ButtonTitleBG:setTopBottom( 0, 1, 3, -5 )
	ButtonTitleBG:setRGB( 0, 0, 0 )
	ButtonTitleBG:setAlpha( 0.05 )
	self:addElement( ButtonTitleBG )
	self.ButtonTitleBG = ButtonTitleBG
	
	local BoxButtonLrgInactiveDiag = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag:setLeftRight( 0, 1, 0, -2 )
	BoxButtonLrgInactiveDiag:setTopBottom( 0, 1, 0, -2 )
	BoxButtonLrgInactiveDiag:setAlpha( 0 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
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
	
	local ButtonTitle = LUI.UIText.new()
	ButtonTitle:setLeftRight( 0, 1, 33.5, 9.5 )
	ButtonTitle:setTopBottom( 1, 1, -40, -10 )
	ButtonTitle:setAlpha( 0 )
	ButtonTitle:setText( Engine.Localize( "MENU_LEADERBOARDS" ) )
	ButtonTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ButtonTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ButtonTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ButtonTitle )
	self.ButtonTitle = ButtonTitle
	
	local StartMenuIdentitySubTitle0 = CoD.StartMenu_Identity_SubTitle.new( menu, controller )
	StartMenuIdentitySubTitle0:setLeftRight( 0, 1, 7, -3 )
	StartMenuIdentitySubTitle0:setTopBottom( 1, 1, -44, -5 )
	StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "Combat" ) )
	StartMenuIdentitySubTitle0.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( StartMenuIdentitySubTitle0 )
	self.StartMenuIdentitySubTitle0 = StartMenuIdentitySubTitle0
	
	local LeaderboardLockCover = LUI.UIImage.new()
	LeaderboardLockCover:setLeftRight( 0, 1, 0, 0 )
	LeaderboardLockCover:setTopBottom( 0, 1, 3, -3 )
	LeaderboardLockCover:setRGB( 0, 0, 0 )
	LeaderboardLockCover:setAlpha( 0 )
	self:addElement( LeaderboardLockCover )
	self.LeaderboardLockCover = LeaderboardLockCover
	
	local caclock0 = CoD.cac_lock.new( menu, controller )
	caclock0:setLeftRight( 0.5, 0.5, -48, 48 )
	caclock0:setTopBottom( 0.5, 0.5, -48, 48 )
	caclock0:setAlpha( 0 )
	self:addElement( caclock0 )
	self.caclock0 = caclock0
	
	self.resetProperties = function ()
		ButtonTitleBG:completeAnimation()
		FocusBarB:completeAnimation()
		FocusBarT:completeAnimation()
		BlackTint:completeAnimation()
		BoxButtonLrgInactive:completeAnimation()
		caclock0:completeAnimation()
		LeaderboardLockCover:completeAnimation()
		ButtonTitleBG:setAlpha( 0.05 )
		FocusBarB:setAlpha( 0 )
		FocusBarT:setAlpha( 0 )
		BlackTint:setAlpha( 0.05 )
		BoxButtonLrgInactive:setAlpha( 0.4 )
		caclock0:setAlpha( 0 )
		LeaderboardLockCover:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				ButtonTitleBG:completeAnimation()
				self.ButtonTitleBG:setAlpha( 0 )
				self.clipFinished( ButtonTitleBG, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.7 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				BlackTint:completeAnimation()
				self.BlackTint:setAlpha( 0 )
				self.clipFinished( BlackTint, {} )
				ButtonTitleBG:completeAnimation()
				self.ButtonTitleBG:setAlpha( 0 )
				self.clipFinished( ButtonTitleBG, {} )
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
				self:setupElementClipCounter( 2 )
				LeaderboardLockCover:completeAnimation()
				self.LeaderboardLockCover:setAlpha( 0.05 )
				self.clipFinished( LeaderboardLockCover, {} )
				caclock0:completeAnimation()
				self.caclock0:setAlpha( 1 )
				self.clipFinished( caclock0, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.7 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				ButtonTitleBG:completeAnimation()
				self.ButtonTitleBG:setAlpha( 0 )
				self.clipFinished( ButtonTitleBG, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				caclock0:completeAnimation()
				self.caclock0:setAlpha( 1 )
				self.clipFinished( caclock0, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BoxButtonLrgInactive:close()
		self.BoxButtonLrgInactiveDiag:close()
		self.FocusBarT:close()
		self.FocusBarB:close()
		self.StartMenuIdentitySubTitle0:close()
		self.caclock0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

