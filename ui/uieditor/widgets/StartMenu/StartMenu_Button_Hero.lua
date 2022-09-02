-- c5c93f70480b7def8989b62961d8c9fa
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_ImageContainer" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Identity_SubTitle" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_OnlineOnly" )
require( "ui.uieditor.widgets.CAC.cac_lock" )

CoD.StartMenu_Button_Hero = InheritFrom( LUI.UIElement )
CoD.StartMenu_Button_Hero.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Button_Hero )
	self.id = "StartMenu_Button_Hero"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 731 )
	self:setTopBottom( true, false, 0, 328 )
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
	BoxButtonLrgInactive:setRGB( 0.87, 0.97, 1 )
	BoxButtonLrgInactive:setAlpha( 0.4 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local imageContainer = CoD.StartMenu_ImageContainer.new( menu, controller )
	imageContainer:setLeftRight( true, true, 2, -2 )
	imageContainer:setTopBottom( true, true, 1.5, -2.5 )
	imageContainer.ImageContainer:setImage( RegisterImage( "uie_t7_menu_control_checkbox" ) )
	self:addElement( imageContainer )
	self.imageContainer = imageContainer
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( true, false, 18.86, 716 )
	Title:setTopBottom( false, true, -52, -32 )
	Title:setText( Engine.Localize( "MENU_MULTIPLAYER_CAPS" ) )
	Title:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Title:setLetterSpacing( 0.5 )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Title )
	self.Title = Title
	
	local StartMenuIdentitySubTitle0 = CoD.StartMenu_Identity_SubTitle.new( menu, controller )
	StartMenuIdentitySubTitle0:setLeftRight( true, false, 11.86, 724 )
	StartMenuIdentitySubTitle0:setTopBottom( false, true, -32, -6 )
	StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "Customize your campaign character" ) )
	StartMenuIdentitySubTitle0.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( StartMenuIdentitySubTitle0 )
	self.StartMenuIdentitySubTitle0 = StartMenuIdentitySubTitle0
	
	local LOCKBlackboxBG = LUI.UIImage.new()
	LOCKBlackboxBG:setLeftRight( true, true, 2, 0 )
	LOCKBlackboxBG:setTopBottom( true, true, 3, -3 )
	LOCKBlackboxBG:setRGB( 0, 0, 0 )
	LOCKBlackboxBG:setAlpha( 0 )
	self:addElement( LOCKBlackboxBG )
	self.LOCKBlackboxBG = LOCKBlackboxBG
	
	local LockBackground = LUI.UIImage.new()
	LockBackground:setLeftRight( true, true, 2, -2 )
	LockBackground:setTopBottom( true, true, 3, -3 )
	LockBackground:setRGB( 0, 0, 0 )
	LockBackground:setAlpha( 0.05 )
	self:addElement( LockBackground )
	self.LockBackground = LockBackground
	
	local LOCKBlackCircle = LUI.UIImage.new()
	LOCKBlackCircle:setLeftRight( false, false, -22.5, 22.5 )
	LOCKBlackCircle:setTopBottom( false, false, -24, 21 )
	LOCKBlackCircle:setRGB( 0, 0, 0 )
	LOCKBlackCircle:setAlpha( 0.3 )
	LOCKBlackCircle:setScale( 0.9 )
	LOCKBlackCircle:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_panelcircle" ) )
	self:addElement( LOCKBlackCircle )
	self.LOCKBlackCircle = LOCKBlackCircle
	
	local BlackLine = LUI.UIImage.new()
	BlackLine:setLeftRight( true, true, 3, -3 )
	BlackLine:setTopBottom( false, false, -22.5, 18 )
	BlackLine:setRGB( 0, 0, 0 )
	BlackLine:setAlpha( 0.5 )
	self:addElement( BlackLine )
	self.BlackLine = BlackLine
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, 0, 0 )
	FocusBarB:setTopBottom( false, true, -3, 1 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, 0, 0 )
	FocusBarT:setTopBottom( true, false, -1, 3 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local StartMenuOnlineOnly = CoD.StartMenu_OnlineOnly.new( menu, controller )
	StartMenuOnlineOnly:setLeftRight( false, false, -48, 48 )
	StartMenuOnlineOnly:setTopBottom( false, false, -16.25, 11.75 )
	StartMenuOnlineOnly:setScale( 0.9 )
	StartMenuOnlineOnly.TextBox0:setText( LocalizeToUpperString( "MENU_ONLINE_ONLY" ) )
	self:addElement( StartMenuOnlineOnly )
	self.StartMenuOnlineOnly = StartMenuOnlineOnly
	
	local lockedIcon = CoD.cac_lock.new( menu, controller )
	lockedIcon:setLeftRight( false, false, -16, 16 )
	lockedIcon:setTopBottom( false, false, -16, 16 )
	self:addElement( lockedIcon )
	self.lockedIcon = lockedIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )

				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )

				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.4 )
				self.clipFinished( BoxButtonLrgInactive, {} )

				imageContainer:completeAnimation()

				imageContainer.ImageContainer:completeAnimation()
				self.imageContainer.ImageContainer:setAlpha( 0.79 )
				self.clipFinished( imageContainer, {} )

				Title:completeAnimation()
				self.Title:setAlpha( 1 )
				self.clipFinished( Title, {} )

				LOCKBlackboxBG:completeAnimation()
				self.LOCKBlackboxBG:setLeftRight( true, true, 2, 0 )
				self.LOCKBlackboxBG:setTopBottom( true, true, 3, -3 )
				self.clipFinished( LOCKBlackboxBG, {} )

				LockBackground:completeAnimation()
				self.LockBackground:setAlpha( 0.05 )
				self.clipFinished( LockBackground, {} )

				LOCKBlackCircle:completeAnimation()
				self.LOCKBlackCircle:setAlpha( 0 )
				self.clipFinished( LOCKBlackCircle, {} )

				BlackLine:completeAnimation()
				self.BlackLine:setAlpha( 0 )
				self.clipFinished( BlackLine, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )

				StartMenuOnlineOnly:completeAnimation()
				self.StartMenuOnlineOnly:setAlpha( 0 )
				self.clipFinished( StartMenuOnlineOnly, {} )

				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 9 )

				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.7 )
				self.clipFinished( BoxButtonLrgInactive, {} )

				imageContainer:completeAnimation()

				imageContainer.ImageContainer:completeAnimation()
				self.imageContainer.ImageContainer:setAlpha( 1 )
				self.clipFinished( imageContainer, {} )

				LockBackground:completeAnimation()
				self.LockBackground:setAlpha( 0 )
				self.clipFinished( LockBackground, {} )

				LOCKBlackCircle:completeAnimation()
				self.LOCKBlackCircle:setAlpha( 0 )
				self.clipFinished( LOCKBlackCircle, {} )

				BlackLine:completeAnimation()
				self.BlackLine:setAlpha( 0 )
				self.clipFinished( BlackLine, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )

				StartMenuOnlineOnly:completeAnimation()
				self.StartMenuOnlineOnly:setAlpha( 0 )
				self.clipFinished( StartMenuOnlineOnly, {} )

				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )

				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.4 )
				self.clipFinished( BoxButtonLrgInactive, {} )

				imageContainer:completeAnimation()

				imageContainer.ImageContainer:completeAnimation()
				self.imageContainer.ImageContainer:setAlpha( 0.79 )
				self.clipFinished( imageContainer, {} )

				Title:completeAnimation()
				self.Title:setAlpha( 1 )
				self.clipFinished( Title, {} )

				StartMenuIdentitySubTitle0:completeAnimation()
				self.StartMenuIdentitySubTitle0:setAlpha( 1 )
				self.clipFinished( StartMenuIdentitySubTitle0, {} )

				LOCKBlackboxBG:completeAnimation()
				self.LOCKBlackboxBG:setLeftRight( true, true, 2, 0 )
				self.LOCKBlackboxBG:setTopBottom( true, true, 3, -3 )
				self.LOCKBlackboxBG:setAlpha( 0.1 )
				self.clipFinished( LOCKBlackboxBG, {} )

				LockBackground:completeAnimation()
				self.LockBackground:setAlpha( 0.1 )
				self.clipFinished( LockBackground, {} )

				LOCKBlackCircle:completeAnimation()
				self.LOCKBlackCircle:setAlpha( 0.3 )
				self.clipFinished( LOCKBlackCircle, {} )

				BlackLine:completeAnimation()
				self.BlackLine:setAlpha( 0.5 )
				self.clipFinished( BlackLine, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )

				StartMenuOnlineOnly:completeAnimation()
				self.StartMenuOnlineOnly:setAlpha( 0 )
				self.clipFinished( StartMenuOnlineOnly, {} )

				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 1 )
				self.clipFinished( lockedIcon, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 13 )

				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )

				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.7 )
				self.clipFinished( BoxButtonLrgInactive, {} )

				imageContainer:completeAnimation()

				imageContainer.ImageContainer:completeAnimation()
				self.imageContainer:setAlpha( 1 )
				self.imageContainer.ImageContainer:setAlpha( 1 )
				self.clipFinished( imageContainer, {} )

				Title:completeAnimation()
				self.Title:setAlpha( 1 )
				self.clipFinished( Title, {} )

				StartMenuIdentitySubTitle0:completeAnimation()
				self.StartMenuIdentitySubTitle0:setAlpha( 1 )
				self.clipFinished( StartMenuIdentitySubTitle0, {} )

				LOCKBlackboxBG:completeAnimation()
				self.LOCKBlackboxBG:setAlpha( 0.1 )
				self.clipFinished( LOCKBlackboxBG, {} )

				LockBackground:completeAnimation()
				self.LockBackground:setAlpha( 0 )
				self.clipFinished( LockBackground, {} )

				LOCKBlackCircle:completeAnimation()
				self.LOCKBlackCircle:setAlpha( 0.3 )
				self.clipFinished( LOCKBlackCircle, {} )

				BlackLine:completeAnimation()
				self.BlackLine:setAlpha( 0.5 )
				self.clipFinished( BlackLine, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )

				StartMenuOnlineOnly:completeAnimation()
				self.StartMenuOnlineOnly:setAlpha( 0 )
				self.clipFinished( StartMenuOnlineOnly, {} )

				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 1 )
				self.clipFinished( lockedIcon, {} )
			end
		},
		OnlineOnly = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )

				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )

				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.4 )
				self.clipFinished( BoxButtonLrgInactive, {} )

				imageContainer:completeAnimation()

				imageContainer.ImageContainer:completeAnimation()
				self.imageContainer.ImageContainer:setAlpha( 0.79 )
				self.clipFinished( imageContainer, {} )

				Title:completeAnimation()
				self.Title:setAlpha( 1 )
				self.clipFinished( Title, {} )

				LOCKBlackboxBG:completeAnimation()
				self.LOCKBlackboxBG:setLeftRight( true, true, 2, 0 )
				self.LOCKBlackboxBG:setTopBottom( true, true, 3, -3 )
				self.LOCKBlackboxBG:setAlpha( 0.1 )
				self.clipFinished( LOCKBlackboxBG, {} )

				LockBackground:completeAnimation()
				self.LockBackground:setAlpha( 0.1 )
				self.clipFinished( LockBackground, {} )

				LOCKBlackCircle:completeAnimation()
				self.LOCKBlackCircle:setAlpha( 0 )
				self.clipFinished( LOCKBlackCircle, {} )

				BlackLine:completeAnimation()
				self.BlackLine:setAlpha( 0.5 )
				self.clipFinished( BlackLine, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )

				StartMenuOnlineOnly:completeAnimation()
				self.StartMenuOnlineOnly:setLeftRight( false, false, -48, 48 )
				self.StartMenuOnlineOnly:setTopBottom( false, false, -16.25, 11.75 )
				self.StartMenuOnlineOnly:setAlpha( 1 )
				self.clipFinished( StartMenuOnlineOnly, {} )

				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 10 )

				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.7 )
				self.clipFinished( BoxButtonLrgInactive, {} )

				imageContainer:completeAnimation()

				imageContainer.ImageContainer:completeAnimation()
				self.imageContainer.ImageContainer:setAlpha( 1 )
				self.clipFinished( imageContainer, {} )

				LOCKBlackboxBG:completeAnimation()
				self.LOCKBlackboxBG:setAlpha( 0.1 )
				self.clipFinished( LOCKBlackboxBG, {} )

				LockBackground:completeAnimation()
				self.LockBackground:setAlpha( 0 )
				self.clipFinished( LockBackground, {} )

				LOCKBlackCircle:completeAnimation()
				self.LOCKBlackCircle:setAlpha( 0 )
				self.clipFinished( LOCKBlackCircle, {} )

				BlackLine:completeAnimation()
				self.BlackLine:setAlpha( 0.5 )
				self.clipFinished( BlackLine, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )

				StartMenuOnlineOnly:completeAnimation()
				self.StartMenuOnlineOnly:setAlpha( 1 )
				self.clipFinished( StartMenuOnlineOnly, {} )

				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
			end
		}
	}
	StartMenuOnlineOnly.id = "StartMenuOnlineOnly"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.StartMenuOnlineOnly:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BoxButtonLrgInactiveDiag:close()
		element.BoxButtonLrgInactive:close()
		element.imageContainer:close()
		element.StartMenuIdentitySubTitle0:close()
		element.FocusBarB:close()
		element.FocusBarT:close()
		element.StartMenuOnlineOnly:close()
		element.lockedIcon:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

