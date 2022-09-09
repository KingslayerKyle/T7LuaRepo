-- b58cb8b1b93bf2d203939dbc942cb03b
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Identity_SubTitle" )
require( "ui.uieditor.widgets.CAC.cac_lock" )

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
	self:setLeftRight( true, false, 0, 350 )
	self:setTopBottom( true, false, 0, 216 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgInactive:setTopBottom( true, true, -2, 2 )
	BoxButtonLrgInactive:setRGB( 0.87, 0.97, 1 )
	BoxButtonLrgInactive:setAlpha( 0.4 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local BlackTint = LUI.UIImage.new()
	BlackTint:setLeftRight( true, true, 3, -2 )
	BlackTint:setTopBottom( true, true, 3, -3 )
	BlackTint:setRGB( 0, 0, 0 )
	BlackTint:setAlpha( 0.05 )
	self:addElement( BlackTint )
	self.BlackTint = BlackTint
	
	local tempimage = LUI.UIImage.new()
	tempimage:setLeftRight( false, false, -92.5, 91.5 )
	tempimage:setTopBottom( false, false, -105, 79 )
	tempimage:setImage( RegisterImage( "uie_t7_menu_mp_icons_gamemode_graphic_logowhite" ) )
	self:addElement( tempimage )
	self.tempimage = tempimage
	
	local ButtonTitleBG = LUI.UIImage.new()
	ButtonTitleBG:setLeftRight( true, true, 3, -2 )
	ButtonTitleBG:setTopBottom( true, true, 2, -3 )
	ButtonTitleBG:setRGB( 0, 0, 0 )
	ButtonTitleBG:setAlpha( 0.05 )
	self:addElement( ButtonTitleBG )
	self.ButtonTitleBG = ButtonTitleBG
	
	local BoxButtonLrgInactiveDiag = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag:setLeftRight( true, true, 0, -1 )
	BoxButtonLrgInactiveDiag:setTopBottom( true, true, 0, -1 )
	BoxButtonLrgInactiveDiag:setAlpha( 0 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
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
	
	local ButtonTitle = LUI.UIText.new()
	ButtonTitle:setLeftRight( true, true, 22, 6 )
	ButtonTitle:setTopBottom( false, true, -26.5, -6.5 )
	ButtonTitle:setAlpha( 0 )
	ButtonTitle:setText( Engine.Localize( "MENU_LEADERBOARDS" ) )
	ButtonTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ButtonTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ButtonTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ButtonTitle )
	self.ButtonTitle = ButtonTitle
	
	local StartMenuIdentitySubTitle0 = CoD.StartMenu_Identity_SubTitle.new( menu, controller )
	StartMenuIdentitySubTitle0:setLeftRight( true, true, 5, -2 )
	StartMenuIdentitySubTitle0:setTopBottom( false, true, -29, -3 )
	StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "Combat" ) )
	StartMenuIdentitySubTitle0.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( StartMenuIdentitySubTitle0 )
	self.StartMenuIdentitySubTitle0 = StartMenuIdentitySubTitle0
	
	local LeaderboardLockCover = LUI.UIImage.new()
	LeaderboardLockCover:setLeftRight( true, true, 0, 0 )
	LeaderboardLockCover:setTopBottom( true, true, 2, -2 )
	LeaderboardLockCover:setRGB( 0, 0, 0 )
	LeaderboardLockCover:setAlpha( 0 )
	self:addElement( LeaderboardLockCover )
	self.LeaderboardLockCover = LeaderboardLockCover
	
	local caclock0 = CoD.cac_lock.new( menu, controller )
	caclock0:setLeftRight( false, false, -32, 32 )
	caclock0:setTopBottom( false, false, -32, 32 )
	caclock0:setAlpha( 0 )
	self:addElement( caclock0 )
	self.caclock0 = caclock0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.4 )
				self.clipFinished( BoxButtonLrgInactive, {} )

				BlackTint:completeAnimation()
				self.BlackTint:setAlpha( 0.05 )
				self.clipFinished( BlackTint, {} )

				ButtonTitleBG:completeAnimation()
				self.ButtonTitleBG:setAlpha( 0 )
				self.clipFinished( ButtonTitleBG, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )

				LeaderboardLockCover:completeAnimation()
				self.LeaderboardLockCover:setAlpha( 0 )
				self.clipFinished( LeaderboardLockCover, {} )

				caclock0:completeAnimation()
				self.caclock0:setAlpha( 0 )
				self.clipFinished( caclock0, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 7 )

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

				LeaderboardLockCover:completeAnimation()
				self.LeaderboardLockCover:setAlpha( 0 )
				self.clipFinished( LeaderboardLockCover, {} )

				caclock0:completeAnimation()
				self.caclock0:setAlpha( 0 )
				self.clipFinished( caclock0, {} )
			end
		},
		Locked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.4 )
				self.clipFinished( BoxButtonLrgInactive, {} )

				ButtonTitleBG:completeAnimation()
				self.ButtonTitleBG:setAlpha( 0.05 )
				self.clipFinished( ButtonTitleBG, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )

				LeaderboardLockCover:completeAnimation()
				self.LeaderboardLockCover:setAlpha( 0.05 )
				self.clipFinished( LeaderboardLockCover, {} )

				caclock0:completeAnimation()
				self.caclock0:setAlpha( 1 )
				self.clipFinished( caclock0, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 6 )

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

				LeaderboardLockCover:completeAnimation()
				self.LeaderboardLockCover:setAlpha( 0 )
				self.clipFinished( LeaderboardLockCover, {} )

				caclock0:completeAnimation()
				self.caclock0:setAlpha( 1 )
				self.clipFinished( caclock0, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BoxButtonLrgInactive:close()
		element.BoxButtonLrgInactiveDiag:close()
		element.FocusBarT:close()
		element.FocusBarB:close()
		element.StartMenuIdentitySubTitle0:close()
		element.caclock0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
