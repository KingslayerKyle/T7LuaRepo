require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_ImageContainer" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Identity_SubTitle" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
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
	self:setLeftRight( true, false, 0, 1198 )
	self:setTopBottom( true, false, 0, 516 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgInactiveDiag = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgInactiveDiag:setTopBottom( true, true, -2, 2 )
	BoxButtonLrgInactiveDiag:setAlpha( 0 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	local imageContainer = CoD.StartMenu_ImageContainer.new( menu, controller )
	imageContainer:setLeftRight( true, true, 2, -2 )
	imageContainer:setTopBottom( true, true, 1.5, -2.5 )
	imageContainer.ImageContainer:setImage( RegisterImage( "uie_t7_menu_control_checkbox" ) )
	self:addElement( imageContainer )
	self.imageContainer = imageContainer
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( true, false, 11.73, 217.73 )
	Title:setTopBottom( false, true, -51, -29 )
	Title:setText( Engine.Localize( "MENU_MULTIPLAYER_CAPS" ) )
	Title:setTTF( "fonts/escom.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Title )
	self.Title = Title
	
	local StartMenuIdentitySubTitle0 = CoD.StartMenu_Identity_SubTitle.new( menu, controller )
	StartMenuIdentitySubTitle0:setLeftRight( true, false, 5, 93 )
	StartMenuIdentitySubTitle0:setTopBottom( false, true, -32, -6 )
	StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "Customize your campaign character" ) )
	StartMenuIdentitySubTitle0.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( StartMenuIdentitySubTitle0 )
	self.StartMenuIdentitySubTitle0 = StartMenuIdentitySubTitle0
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( true, true, 0, 0 )
	StartMenuframenoBG0:setTopBottom( true, true, 0, -1 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
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
	
	local BlackBar = LUI.UIImage.new()
	BlackBar:setLeftRight( true, true, 3, -3 )
	BlackBar:setTopBottom( false, false, -20, 19 )
	BlackBar:setRGB( 0, 0, 0 )
	BlackBar:setAlpha( 0 )
	self:addElement( BlackBar )
	self.BlackBar = BlackBar
	
	local lockedIcon = CoD.cac_lock.new( menu, controller )
	lockedIcon:setLeftRight( false, false, -12, 12 )
	lockedIcon:setTopBottom( false, false, -16, 16 )
	lockedIcon:setAlpha( 0 )
	self:addElement( lockedIcon )
	self.lockedIcon = lockedIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				imageContainer:completeAnimation()
				imageContainer.ImageContainer:completeAnimation()
				self.imageContainer.ImageContainer:setAlpha( 0.79 )
				self.clipFinished( imageContainer, {} )
				Title:completeAnimation()
				self.Title:setAlpha( 1 )
				self.clipFinished( Title, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				BlackBar:completeAnimation()
				self.BlackBar:setAlpha( 0 )
				self.clipFinished( BlackBar, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 5 )
				imageContainer:completeAnimation()
				imageContainer.ImageContainer:completeAnimation()
				self.imageContainer.ImageContainer:setAlpha( 1 )
				self.clipFinished( imageContainer, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				BlackBar:completeAnimation()
				self.BlackBar:setAlpha( 0 )
				self.clipFinished( BlackBar, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
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
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				BlackBar:completeAnimation()
				self.BlackBar:setAlpha( 0.7 )
				self.clipFinished( BlackBar, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 1 )
				self.clipFinished( lockedIcon, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 8 )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
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
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				BlackBar:completeAnimation()
				self.BlackBar:setAlpha( 0.7 )
				self.clipFinished( BlackBar, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0.8 )
				self.clipFinished( lockedIcon, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BoxButtonLrgInactiveDiag:close()
		element.imageContainer:close()
		element.StartMenuIdentitySubTitle0:close()
		element.StartMenuframenoBG0:close()
		element.FocusBarB:close()
		element.FocusBarT:close()
		element.lockedIcon:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

