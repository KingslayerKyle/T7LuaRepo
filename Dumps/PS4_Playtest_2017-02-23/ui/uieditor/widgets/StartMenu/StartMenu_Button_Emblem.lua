require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.CAC.cac_lock" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Identity_SubTitle" )

CoD.StartMenu_Button_Emblem = InheritFrom( LUI.UIElement )
CoD.StartMenu_Button_Emblem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Button_Emblem )
	self.id = "StartMenu_Button_Emblem"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 555 )
	self:setTopBottom( 0, 0, 0, 210 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local emblem0 = LUI.UIImage.new()
	emblem0:setLeftRight( 0, 1, 4, -4 )
	emblem0:setTopBottom( 0, 1, 4, -4 )
	self:addElement( emblem0 )
	self.emblem0 = emblem0
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( 0, 1, -3, 3 )
	BoxButtonLrgInactive:setTopBottom( 0, 1, -3, 3 )
	BoxButtonLrgInactive:setRGB( 0.87, 0.97, 1 )
	BoxButtonLrgInactive:setAlpha( 0.4 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local BoxButtonLrgInactiveDiag = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag:setLeftRight( 0, 1, 0, -2 )
	BoxButtonLrgInactiveDiag:setTopBottom( 0, 1, 0, -2 )
	BoxButtonLrgInactiveDiag:setAlpha( 0.2 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( 0, 0, 18, 327 )
	Title:setTopBottom( 1, 1, -77, -44 )
	Title:setText( Engine.Localize( "MENU_MULTIPLAYER_CAPS" ) )
	Title:setTTF( "fonts/escom.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Title )
	self.Title = Title
	
	local lockedIcon = CoD.cac_lock.new( menu, controller )
	lockedIcon:setLeftRight( 0.5, 0.5, -22, 24 )
	lockedIcon:setTopBottom( 0.5, 0.5, -24, 24 )
	self:addElement( lockedIcon )
	self.lockedIcon = lockedIcon
	
	local StartMenuIdentitySubTitle0 = CoD.StartMenu_Identity_SubTitle.new( menu, controller )
	StartMenuIdentitySubTitle0:mergeStateConditions( {
		{
			stateName = "HasNew",
			condition = function ( menu, element, event )
				return Emblems_IsAnyEmblemNew( controller )
			end
		}
	} )
	StartMenuIdentitySubTitle0:setLeftRight( 0, 0, 7, 549 )
	StartMenuIdentitySubTitle0:setTopBottom( 1, 1, -48, -9 )
	StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "Customize your campaign character" ) )
	StartMenuIdentitySubTitle0.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( StartMenuIdentitySubTitle0 )
	self.StartMenuIdentitySubTitle0 = StartMenuIdentitySubTitle0
	
	local ImageText = LUI.UIText.new()
	ImageText:setLeftRight( 0, 1, 0, 0 )
	ImageText:setTopBottom( 0, 0, 0, 30 )
	ImageText:setText( Engine.Localize( "" ) )
	ImageText:setTTF( "fonts/default.ttf" )
	ImageText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ImageText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ImageText )
	self.ImageText = ImageText
	
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
	
	self.resetProperties = function ()
		ImageText:completeAnimation()
		BoxButtonLrgInactiveDiag:completeAnimation()
		lockedIcon:completeAnimation()
		emblem0:completeAnimation()
		FocusBarB:completeAnimation()
		FocusBarT:completeAnimation()
		BoxButtonLrgInactive:completeAnimation()
		ImageText:setAlpha( 1 )
		BoxButtonLrgInactiveDiag:setAlpha( 0.2 )
		lockedIcon:setAlpha( 1 )
		emblem0:setRGB( 1, 1, 1 )
		FocusBarB:setAlpha( 0 )
		FocusBarT:setAlpha( 0 )
		BoxButtonLrgInactive:setAlpha( 0.4 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				emblem0:completeAnimation()
				self.emblem0:setRGB( 0.78, 0.78, 0.78 )
				self.clipFinished( emblem0, {} )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
				ImageText:completeAnimation()
				self.ImageText:setAlpha( 0 )
				self.clipFinished( ImageText, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.7 )
				self.clipFinished( BoxButtonLrgInactive, {} )
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
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				emblem0:completeAnimation()
				self.emblem0:setRGB( 0.78, 0.78, 0.78 )
				self.clipFinished( emblem0, {} )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0.4 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.7 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0.4 )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BoxButtonLrgInactive:close()
		self.BoxButtonLrgInactiveDiag:close()
		self.lockedIcon:close()
		self.StartMenuIdentitySubTitle0:close()
		self.FocusBarT:close()
		self.FocusBarB:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

