require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_ImageContainer" )
require( "ui.uieditor.widgets.CAC.cac_lock" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Identity_SubTitle" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

CoD.StartMenu_Button_SM = InheritFrom( LUI.UIElement )
CoD.StartMenu_Button_SM.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Button_SM )
	self.id = "StartMenu_Button_SM"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 134 )
	self:setTopBottom( true, false, 0, 124 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgInactive:setTopBottom( true, true, -2, 2 )
	BoxButtonLrgInactive:setRGB( 0, 0, 0 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local BoxButtonLrgInactiveDiag = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgInactiveDiag:setTopBottom( true, true, -2, 2 )
	BoxButtonLrgInactiveDiag:setAlpha( 0.01 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	local ImageText = LUI.UIText.new()
	ImageText:setLeftRight( true, true, 0, 0 )
	ImageText:setTopBottom( true, false, 0, 20 )
	ImageText:setText( Engine.Localize( "" ) )
	ImageText:setTTF( "fonts/default.ttf" )
	ImageText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ImageText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ImageText )
	self.ImageText = ImageText
	
	local ImageContainer = CoD.StartMenu_ImageContainer.new( menu, controller )
	ImageContainer:setLeftRight( true, true, 1, -1 )
	ImageContainer:setTopBottom( true, true, 1, -1 )
	self:addElement( ImageContainer )
	self.ImageContainer = ImageContainer
	
	local DisabledImage = CoD.StartMenu_ImageContainer.new( menu, controller )
	DisabledImage:setLeftRight( true, true, 1, -1 )
	DisabledImage:setTopBottom( true, true, 1, -1 )
	DisabledImage:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
	DisabledImage:setShaderVector( 0, 0.2, 0, 0, 0 )
	self:addElement( DisabledImage )
	self.DisabledImage = DisabledImage
	
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
	lockedIcon:setAlpha( 0 )
	lockedIcon.lockedIcon:setAlpha( 0.56 )
	self:addElement( lockedIcon )
	self.lockedIcon = lockedIcon
	
	local StartMenuIdentitySubTitle0 = CoD.StartMenu_Identity_SubTitle.new( menu, controller )
	StartMenuIdentitySubTitle0:setLeftRight( true, false, 8, 96 )
	StartMenuIdentitySubTitle0:setTopBottom( false, true, -32, -6 )
	StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "SOMETHING" ) )
	StartMenuIdentitySubTitle0.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( StartMenuIdentitySubTitle0 )
	self.StartMenuIdentitySubTitle0 = StartMenuIdentitySubTitle0
	
	local ClanTag = LUI.UIText.new()
	ClanTag:setLeftRight( true, true, 0, 0 )
	ClanTag:setTopBottom( false, false, -16, 9 )
	ClanTag:setText( Engine.Localize( "MENU_NEW" ) )
	ClanTag:setTTF( "fonts/escom.ttf" )
	ClanTag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ClanTag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ClanTag )
	self.ClanTag = ClanTag
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( true, true, 0, 0 )
	StartMenuframenoBG0:setTopBottom( true, true, 0, -1 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, 0, 0 )
	FocusBarB:setTopBottom( false, true, -4, 0 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, 0, 0 )
	FocusBarT:setTopBottom( true, false, -1, 3 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0.01 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				ImageText:completeAnimation()
				self.ImageText:setAlpha( 1 )
				self.clipFinished( ImageText, {} )
				ImageContainer:completeAnimation()
				ImageContainer.ImageContainer:completeAnimation()
				self.ImageContainer:setAlpha( 1 )
				self.ImageContainer.ImageContainer:setAlpha( 0.79 )
				self.clipFinished( ImageContainer, {} )
				DisabledImage:completeAnimation()
				DisabledImage.ImageContainer:completeAnimation()
				self.DisabledImage:setAlpha( 0 )
				self.DisabledImage.ImageContainer:setAlpha( 0 )
				self.clipFinished( DisabledImage, {} )
				BlackBar:completeAnimation()
				self.BlackBar:setAlpha( 0 )
				self.clipFinished( BlackBar, {} )
				lockedIcon:completeAnimation()
				lockedIcon.lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.lockedIcon.lockedIcon:setAlpha( 0.56 )
				self.clipFinished( lockedIcon, {} )
				StartMenuIdentitySubTitle0:completeAnimation()
				self.StartMenuIdentitySubTitle0:setAlpha( 1 )
				self.clipFinished( StartMenuIdentitySubTitle0, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 7 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				ImageContainer:completeAnimation()
				ImageContainer.ImageContainer:completeAnimation()
				self.ImageContainer:setAlpha( 1 )
				self.ImageContainer.ImageContainer:setAlpha( 1 )
				self.clipFinished( ImageContainer, {} )
				DisabledImage:completeAnimation()
				DisabledImage.ImageContainer:completeAnimation()
				self.DisabledImage:setAlpha( 0 )
				self.DisabledImage.ImageContainer:setAlpha( 0 )
				self.clipFinished( DisabledImage, {} )
				BlackBar:completeAnimation()
				self.BlackBar:setAlpha( 0 )
				self.clipFinished( BlackBar, {} )
				StartMenuIdentitySubTitle0:completeAnimation()
				self.StartMenuIdentitySubTitle0:setAlpha( 1 )
				self.clipFinished( StartMenuIdentitySubTitle0, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				ImageContainer:completeAnimation()
				ImageContainer.ImageContainer:completeAnimation()
				self.ImageContainer:setAlpha( 0 )
				self.ImageContainer.ImageContainer:setAlpha( 0 )
				self.clipFinished( ImageContainer, {} )
				DisabledImage:completeAnimation()
				DisabledImage.ImageContainer:completeAnimation()
				self.DisabledImage:setAlpha( 1 )
				self.DisabledImage.ImageContainer:setAlpha( 0.79 )
				self.clipFinished( DisabledImage, {} )
				BlackBar:completeAnimation()
				self.BlackBar:setAlpha( 0.7 )
				self.clipFinished( BlackBar, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 1 )
				self.clipFinished( lockedIcon, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 6 )
				ImageContainer:completeAnimation()
				ImageContainer.ImageContainer:completeAnimation()
				self.ImageContainer.ImageContainer:setAlpha( 0 )
				self.clipFinished( ImageContainer, {} )
				DisabledImage:completeAnimation()
				DisabledImage.ImageContainer:completeAnimation()
				self.DisabledImage:setAlpha( 1 )
				self.DisabledImage.ImageContainer:setAlpha( 1 )
				self.clipFinished( DisabledImage, {} )
				BlackBar:completeAnimation()
				self.BlackBar:setAlpha( 0.7 )
				self.clipFinished( BlackBar, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0.8 )
				self.clipFinished( lockedIcon, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BoxButtonLrgInactive:close()
		self.BoxButtonLrgInactiveDiag:close()
		self.ImageContainer:close()
		self.DisabledImage:close()
		self.lockedIcon:close()
		self.StartMenuIdentitySubTitle0:close()
		self.StartMenuframenoBG0:close()
		self.FocusBarB:close()
		self.FocusBarT:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

