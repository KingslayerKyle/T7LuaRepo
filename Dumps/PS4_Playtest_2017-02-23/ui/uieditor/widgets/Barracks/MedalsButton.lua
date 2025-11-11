require( "ui.uieditor.widgets.Barracks.CombatRecordMedal" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Identity_SubTitle" )

CoD.MedalsButton = InheritFrom( LUI.UIElement )
CoD.MedalsButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MedalsButton )
	self.id = "MedalsButton"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 1060 )
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
	BlackTint:setAlpha( 0 )
	self:addElement( BlackTint )
	self.BlackTint = BlackTint
	
	local BlackBox = LUI.UIImage.new()
	BlackBox:setLeftRight( 0, 1, 4, -4 )
	BlackBox:setTopBottom( 0, 1, 2, -6 )
	BlackBox:setRGB( 0, 0, 0 )
	BlackBox:setAlpha( 0.05 )
	self:addElement( BlackBox )
	self.BlackBox = BlackBox
	
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
	
	local ButtonTitleBG = LUI.UIImage.new()
	ButtonTitleBG:setLeftRight( 0, 1, 8, -8 )
	ButtonTitleBG:setTopBottom( 1, 1, -42, -8 )
	ButtonTitleBG:setRGB( 0, 0, 0 )
	ButtonTitleBG:setAlpha( 0 )
	self:addElement( ButtonTitleBG )
	self.ButtonTitleBG = ButtonTitleBG
	
	local ButtonTitle = LUI.UIText.new()
	ButtonTitle:setLeftRight( 0, 1, 36, 12 )
	ButtonTitle:setTopBottom( 1, 1, -42, -8 )
	ButtonTitle:setAlpha( 0 )
	ButtonTitle:setText( Engine.Localize( "MENU_MEDALS" ) )
	ButtonTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ButtonTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ButtonTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ButtonTitle )
	self.ButtonTitle = ButtonTitle
	
	local CombatRecordMedal1 = CoD.CombatRecordMedal.new( menu, controller )
	CombatRecordMedal1:setLeftRight( 0, 0, 30, 210 )
	CombatRecordMedal1:setTopBottom( 0, 0, 28, 258 )
	CombatRecordMedal1:subscribeToGlobalModel( controller, "CombatRecordMPMedal1", nil, function ( model )
		CombatRecordMedal1:setModel( model, controller )
	end )
	self:addElement( CombatRecordMedal1 )
	self.CombatRecordMedal1 = CombatRecordMedal1
	
	local CombatRecordMedal2 = CoD.CombatRecordMedal.new( menu, controller )
	CombatRecordMedal2:setLeftRight( 0, 0, 238, 418 )
	CombatRecordMedal2:setTopBottom( 0, 0, 28, 258 )
	CombatRecordMedal2:subscribeToGlobalModel( controller, "CombatRecordMPMedal2", nil, function ( model )
		CombatRecordMedal2:setModel( model, controller )
	end )
	self:addElement( CombatRecordMedal2 )
	self.CombatRecordMedal2 = CombatRecordMedal2
	
	local CombatRecordMedal3 = CoD.CombatRecordMedal.new( menu, controller )
	CombatRecordMedal3:setLeftRight( 0, 0, 445, 625 )
	CombatRecordMedal3:setTopBottom( 0, 0, 28, 258 )
	CombatRecordMedal3:subscribeToGlobalModel( controller, "CombatRecordMPMedal3", nil, function ( model )
		CombatRecordMedal3:setModel( model, controller )
	end )
	self:addElement( CombatRecordMedal3 )
	self.CombatRecordMedal3 = CombatRecordMedal3
	
	local CombatRecordMedal4 = CoD.CombatRecordMedal.new( menu, controller )
	CombatRecordMedal4:setLeftRight( 0, 0, 648, 828 )
	CombatRecordMedal4:setTopBottom( 0, 0, 28, 258 )
	CombatRecordMedal4:subscribeToGlobalModel( controller, "CombatRecordMPMedal4", nil, function ( model )
		CombatRecordMedal4:setModel( model, controller )
	end )
	self:addElement( CombatRecordMedal4 )
	self.CombatRecordMedal4 = CombatRecordMedal4
	
	local CombatRecordMedal5 = CoD.CombatRecordMedal.new( menu, controller )
	CombatRecordMedal5:setLeftRight( 0, 0, 850, 1030 )
	CombatRecordMedal5:setTopBottom( 0, 0, 28, 258 )
	CombatRecordMedal5:subscribeToGlobalModel( controller, "CombatRecordMPMedal5", nil, function ( model )
		CombatRecordMedal5:setModel( model, controller )
	end )
	self:addElement( CombatRecordMedal5 )
	self.CombatRecordMedal5 = CombatRecordMedal5
	
	local ButtonTitleBG0 = LUI.UIImage.new()
	ButtonTitleBG0:setLeftRight( 0, 1, 5, -3 )
	ButtonTitleBG0:setTopBottom( 0, 1, 3, -5 )
	ButtonTitleBG0:setRGB( 0, 0, 0 )
	ButtonTitleBG0:setAlpha( 0 )
	self:addElement( ButtonTitleBG0 )
	self.ButtonTitleBG0 = ButtonTitleBG0
	
	local StartMenuIdentitySubTitle0 = CoD.StartMenu_Identity_SubTitle.new( menu, controller )
	StartMenuIdentitySubTitle0:setLeftRight( 0, 0, 8, 1007 )
	StartMenuIdentitySubTitle0:setTopBottom( 0, 0, 278, 317 )
	StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "Combat" ) )
	StartMenuIdentitySubTitle0.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( StartMenuIdentitySubTitle0 )
	self.StartMenuIdentitySubTitle0 = StartMenuIdentitySubTitle0
	
	self.resetProperties = function ()
		FocusBarB:completeAnimation()
		FocusBarT:completeAnimation()
		BlackBox:completeAnimation()
		BoxButtonLrgInactive:completeAnimation()
		FocusBarB:setAlpha( 0 )
		FocusBarT:setAlpha( 0 )
		BlackBox:setAlpha( 0.05 )
		BoxButtonLrgInactive:setAlpha( 0.4 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.7 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				BlackBox:completeAnimation()
				self.BlackBox:setAlpha( 0 )
				self.clipFinished( BlackBox, {} )
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
		self.CombatRecordMedal1:close()
		self.CombatRecordMedal2:close()
		self.CombatRecordMedal3:close()
		self.CombatRecordMedal4:close()
		self.CombatRecordMedal5:close()
		self.StartMenuIdentitySubTitle0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

