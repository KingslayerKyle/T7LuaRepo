require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_ImageContainer" )
require( "ui.uieditor.widgets.CAC.cac_lock" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Identity_SubTitle" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

CoD.StartMenu_Button_LG = InheritFrom( LUI.UIElement )
CoD.StartMenu_Button_LG.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Button_LG )
	self.id = "StartMenu_Button_LG"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 300 )
	self:setTopBottom( true, false, 0, 140 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, true, 2, -2 )
	bg:setTopBottom( true, true, 2, -2 )
	self:addElement( bg )
	self.bg = bg
	
	local BoxButtonLrgInactiveDiag = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag:setLeftRight( true, true, 0, -1 )
	BoxButtonLrgInactiveDiag:setTopBottom( true, true, 0, -1 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	local ImageContainer = CoD.StartMenu_ImageContainer.new( menu, controller )
	ImageContainer:setLeftRight( true, true, 2, -1 )
	ImageContainer:setTopBottom( true, true, 1, -2.5 )
	self:addElement( ImageContainer )
	self.ImageContainer = ImageContainer
	
	local DisabledImage = CoD.StartMenu_ImageContainer.new( menu, controller )
	DisabledImage:setLeftRight( true, true, 3, 0 )
	DisabledImage:setTopBottom( true, true, 1, -2.5 )
	DisabledImage:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
	DisabledImage:setShaderVector( 0, 0.2, 0, 0, 0 )
	self:addElement( DisabledImage )
	self.DisabledImage = DisabledImage
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( true, false, 11.73, 217.73 )
	Title:setTopBottom( false, true, -51, -29 )
	Title:setText( Engine.Localize( "MENU_MULTIPLAYER_CAPS" ) )
	Title:setTTF( "fonts/escom.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Title )
	self.Title = Title
	
	local BlackBar = LUI.UIImage.new()
	BlackBar:setLeftRight( true, true, 3, -3 )
	BlackBar:setTopBottom( false, false, -20, 19 )
	BlackBar:setRGB( 0, 0, 0 )
	BlackBar:setAlpha( 0.7 )
	self:addElement( BlackBar )
	self.BlackBar = BlackBar
	
	local lockedIcon = CoD.cac_lock.new( menu, controller )
	lockedIcon:setLeftRight( false, false, -12, 12 )
	lockedIcon:setTopBottom( false, false, -16, 16 )
	self:addElement( lockedIcon )
	self.lockedIcon = lockedIcon
	
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
	
	local ImageText = LUI.UIText.new()
	ImageText:setLeftRight( true, true, 0, 0 )
	ImageText:setTopBottom( true, false, 0, 20 )
	ImageText:setText( Engine.Localize( "" ) )
	ImageText:setTTF( "fonts/default.ttf" )
	ImageText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ImageText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ImageText )
	self.ImageText = ImageText
	
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
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				ImageContainer:completeAnimation()
				ImageContainer.ImageContainer:completeAnimation()
				self.ImageContainer.ImageContainer:setAlpha( 0.79 )
				self.clipFinished( ImageContainer, {} )
				DisabledImage:completeAnimation()
				DisabledImage.ImageContainer:completeAnimation()
				self.DisabledImage.ImageContainer:setAlpha( 0 )
				self.clipFinished( DisabledImage, {} )
				BlackBar:completeAnimation()
				self.BlackBar:setAlpha( 0 )
				self.clipFinished( BlackBar, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 6 )
				ImageContainer:completeAnimation()
				ImageContainer.ImageContainer:completeAnimation()
				self.ImageContainer.ImageContainer:setAlpha( 1 )
				self.clipFinished( ImageContainer, {} )
				DisabledImage:completeAnimation()
				DisabledImage.ImageContainer:completeAnimation()
				self.DisabledImage.ImageContainer:setAlpha( 0 )
				self.clipFinished( DisabledImage, {} )
				BlackBar:completeAnimation()
				self.BlackBar:setAlpha( 0 )
				self.clipFinished( BlackBar, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				ImageContainer:completeAnimation()
				ImageContainer.ImageContainer:completeAnimation()
				self.ImageContainer.ImageContainer:setAlpha( 0 )
				self.clipFinished( ImageContainer, {} )
				DisabledImage:completeAnimation()
				DisabledImage.ImageContainer:completeAnimation()
				self.DisabledImage.ImageContainer:setAlpha( 0.79 )
				self.clipFinished( DisabledImage, {} )
				BlackBar:completeAnimation()
				self.BlackBar:setAlpha( 0.7 )
				self.clipFinished( BlackBar, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 1 )
				self.clipFinished( lockedIcon, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 6 )
				ImageContainer:completeAnimation()
				ImageContainer.ImageContainer:completeAnimation()
				self.ImageContainer.ImageContainer:setAlpha( 0 )
				self.clipFinished( ImageContainer, {} )
				DisabledImage:completeAnimation()
				DisabledImage.ImageContainer:completeAnimation()
				self.DisabledImage.ImageContainer:setAlpha( 1 )
				self.clipFinished( DisabledImage, {} )
				BlackBar:completeAnimation()
				self.BlackBar:setAlpha( 0.7 )
				self.clipFinished( BlackBar, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0.8 )
				self.clipFinished( lockedIcon, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BoxButtonLrgInactiveDiag:close()
		self.ImageContainer:close()
		self.DisabledImage:close()
		self.lockedIcon:close()
		self.StartMenuIdentitySubTitle0:close()
		self.StartMenuframenoBG0:close()
		self.FocusBarT:close()
		self.FocusBarB:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

