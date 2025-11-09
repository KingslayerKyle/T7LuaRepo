require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
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
	bg:setRGB( 1, 1, 1 )
	bg:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( bg )
	self.bg = bg
	
	local BoxButtonLrgInactiveDiag = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag:setLeftRight( true, true, 0, -1 )
	BoxButtonLrgInactiveDiag:setTopBottom( true, true, 0, -1 )
	BoxButtonLrgInactiveDiag:setRGB( 1, 1, 1 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	local ImageContainer = LUI.UIImage.new()
	ImageContainer:setLeftRight( true, true, 2, -1 )
	ImageContainer:setTopBottom( true, true, 1, -2.5 )
	ImageContainer:setRGB( 1, 1, 1 )
	ImageContainer:setAlpha( 0 )
	ImageContainer:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( ImageContainer )
	self.ImageContainer = ImageContainer
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( true, false, 11.73, 217.73 )
	Title:setTopBottom( false, true, -51, -29 )
	Title:setRGB( 1, 1, 1 )
	Title:setAlpha( 0 )
	Title:setText( Engine.Localize( "MENU_MULTIPLAYER_CAPS" ) )
	Title:setTTF( "fonts/Entovo.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Title )
	self.Title = Title
	
	local lockedIcon = CoD.cac_lock.new( menu, controller )
	lockedIcon:setLeftRight( false, false, -12, 12 )
	lockedIcon:setTopBottom( false, false, -16, 16 )
	lockedIcon:setRGB( 1, 1, 1 )
	self:addElement( lockedIcon )
	self.lockedIcon = lockedIcon
	
	local StartMenuIdentitySubTitle0 = CoD.StartMenu_Identity_SubTitle.new( menu, controller )
	StartMenuIdentitySubTitle0:setLeftRight( true, false, 5, 93 )
	StartMenuIdentitySubTitle0:setTopBottom( false, true, -32, -6 )
	StartMenuIdentitySubTitle0:setRGB( 1, 1, 1 )
	StartMenuIdentitySubTitle0:setAlpha( 0 )
	StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "Customize your campaign character" ) )
	self:addElement( StartMenuIdentitySubTitle0 )
	self.StartMenuIdentitySubTitle0 = StartMenuIdentitySubTitle0
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( true, true, 0, 0 )
	StartMenuframenoBG0:setTopBottom( true, true, 0, -1 )
	StartMenuframenoBG0:setRGB( 1, 1, 1 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local ImageText = LUI.UIText.new()
	ImageText:setLeftRight( true, true, 0, 0 )
	ImageText:setTopBottom( true, false, 0, 20 )
	ImageText:setRGB( 1, 1, 1 )
	ImageText:setText( Engine.Localize( "" ) )
	ImageText:setTTF( "fonts/default.ttf" )
	ImageText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ImageText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ImageText )
	self.ImageText = ImageText
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, 0, 0 )
	FocusBarT:setTopBottom( true, false, -1, 3 )
	FocusBarT:setRGB( 1, 1, 1 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, 0, 0 )
	FocusBarB:setTopBottom( false, true, -3, 1 )
	FocusBarB:setRGB( 1, 1, 1 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				ImageContainer:completeAnimation()
				self.ImageContainer:setAlpha( 0.8 )
				self.clipFinished( ImageContainer, {} )
				Title:completeAnimation()
				self.Title:setAlpha( 1 )
				self.clipFinished( Title, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
				StartMenuIdentitySubTitle0:completeAnimation()
				self.StartMenuIdentitySubTitle0:setAlpha( 1 )
				self.clipFinished( StartMenuIdentitySubTitle0, {} )
				ImageText:completeAnimation()
				self.ImageText:setAlpha( 0 )
				self.clipFinished( ImageText, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 5 )
				ImageContainer:completeAnimation()
				self.ImageContainer:setAlpha( 1 )
				self.clipFinished( ImageContainer, {} )
				Title:completeAnimation()
				self.Title:setAlpha( 1 )
				self.clipFinished( Title, {} )
				StartMenuIdentitySubTitle0:completeAnimation()
				self.StartMenuIdentitySubTitle0:setAlpha( 1 )
				self.clipFinished( StartMenuIdentitySubTitle0, {} )
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
				self:setupElementClipCounter( 8 )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				ImageContainer:completeAnimation()
				self.ImageContainer:setAlpha( 0 )
				self.clipFinished( ImageContainer, {} )
				Title:completeAnimation()
				self.Title:setAlpha( 0 )
				self.clipFinished( Title, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 1 )
				self.clipFinished( lockedIcon, {} )
				StartMenuIdentitySubTitle0:completeAnimation()
				self.StartMenuIdentitySubTitle0:setAlpha( 0 )
				self.clipFinished( StartMenuIdentitySubTitle0, {} )
				ImageText:completeAnimation()
				self.ImageText:setAlpha( 1 )
				self.clipFinished( ImageText, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 4 )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
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
	self.close = function ( self )
		self.BoxButtonLrgInactiveDiag:close()
		self.lockedIcon:close()
		self.StartMenuIdentitySubTitle0:close()
		self.StartMenuframenoBG0:close()
		self.FocusBarT:close()
		self.FocusBarB:close()
		CoD.StartMenu_Button_LG.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

