require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Identity_SubTitle" )

CoD.Challenges_DarkOps_Button = InheritFrom( LUI.UIElement )
CoD.Challenges_DarkOps_Button.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Challenges_DarkOps_Button )
	self.id = "Challenges_DarkOps_Button"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 525 )
	self:setTopBottom( 0, 0, 0, 300 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( 0, 1, -3, 3 )
	BoxButtonLrgInactive:setTopBottom( 0, 1, -3, 3 )
	BoxButtonLrgInactive:setRGB( 0.87, 0.97, 1 )
	BoxButtonLrgInactive:setAlpha( 0.7 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local BoxButtonLrgInactiveDiag = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag:setLeftRight( 0, 1, 0, -2 )
	BoxButtonLrgInactiveDiag:setTopBottom( 0, 1, 0, -2 )
	BoxButtonLrgInactiveDiag:setAlpha( 0.2 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	local CategoryIcon = LUI.UIImage.new()
	CategoryIcon:setLeftRight( 0.5, 0.5, -96, 96 )
	CategoryIcon:setTopBottom( 0.5, 0.5, -96, 96 )
	CategoryIcon:setImage( RegisterImage( "uie_t7_icons_challenges_mp_darkops" ) )
	self:addElement( CategoryIcon )
	self.CategoryIcon = CategoryIcon
	
	local BlackTint = LUI.UIImage.new()
	BlackTint:setLeftRight( 0, 1, 3, -3 )
	BlackTint:setTopBottom( 0, 1, 3, -5 )
	BlackTint:setRGB( 0, 0, 0 )
	BlackTint:setAlpha( 0.05 )
	self:addElement( BlackTint )
	self.BlackTint = BlackTint
	
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
	
	local StartMenuIdentitySubTitle0 = CoD.StartMenu_Identity_SubTitle.new( menu, controller )
	StartMenuIdentitySubTitle0:setLeftRight( 0, 0, 8, 140 )
	StartMenuIdentitySubTitle0:setTopBottom( 1, 1, -48, -9 )
	StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_DARKOPS" ) )
	StartMenuIdentitySubTitle0.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( StartMenuIdentitySubTitle0 )
	self.StartMenuIdentitySubTitle0 = StartMenuIdentitySubTitle0
	
	self.resetProperties = function ()
		BoxButtonLrgInactiveDiag:completeAnimation()
		BoxButtonLrgInactive:completeAnimation()
		FocusBarB:completeAnimation()
		FocusBarT:completeAnimation()
		BlackTint:completeAnimation()
		StartMenuIdentitySubTitle0:completeAnimation()
		CategoryIcon:completeAnimation()
		BoxButtonLrgInactiveDiag:setAlpha( 0.2 )
		BoxButtonLrgInactive:setAlpha( 0.7 )
		FocusBarB:setAlpha( 0 )
		FocusBarT:setAlpha( 0 )
		BlackTint:setAlpha( 0.05 )
		StartMenuIdentitySubTitle0:setAlpha( 1 )
		CategoryIcon:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.4 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				BlackTint:completeAnimation()
				self.BlackTint:setAlpha( 0 )
				self.clipFinished( BlackTint, {} )
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
				self:setupElementClipCounter( 3 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.4 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				CategoryIcon:completeAnimation()
				self.CategoryIcon:setAlpha( 0 )
				self.clipFinished( CategoryIcon, {} )
				StartMenuIdentitySubTitle0:completeAnimation()
				self.StartMenuIdentitySubTitle0:setAlpha( 0 )
				self.clipFinished( StartMenuIdentitySubTitle0, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0.1 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				CategoryIcon:completeAnimation()
				self.CategoryIcon:setAlpha( 0 )
				self.clipFinished( CategoryIcon, {} )
				BlackTint:completeAnimation()
				self.BlackTint:setAlpha( 0 )
				self.clipFinished( BlackTint, {} )
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
		self.FocusBarT:close()
		self.FocusBarB:close()
		self.StartMenuIdentitySubTitle0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

