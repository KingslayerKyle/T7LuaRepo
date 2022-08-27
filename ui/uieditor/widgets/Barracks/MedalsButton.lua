-- c8b51803319ba44589abfc3eeb9c7199
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.Barracks.CombatRecordMedal" )
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
	self:setLeftRight( true, false, 0, 707 )
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
	BlackTint:setAlpha( 0 )
	self:addElement( BlackTint )
	self.BlackTint = BlackTint
	
	local BlackBox = LUI.UIImage.new()
	BlackBox:setLeftRight( true, true, 3, -3 )
	BlackBox:setTopBottom( true, true, 2, -4 )
	BlackBox:setRGB( 0, 0, 0 )
	BlackBox:setAlpha( 0.05 )
	self:addElement( BlackBox )
	self.BlackBox = BlackBox
	
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
	
	local ButtonTitleBG = LUI.UIImage.new()
	ButtonTitleBG:setLeftRight( true, true, 5, -5 )
	ButtonTitleBG:setTopBottom( false, true, -28, -5 )
	ButtonTitleBG:setRGB( 0, 0, 0 )
	ButtonTitleBG:setAlpha( 0 )
	self:addElement( ButtonTitleBG )
	self.ButtonTitleBG = ButtonTitleBG
	
	local ButtonTitle = LUI.UIText.new()
	ButtonTitle:setLeftRight( true, true, 24, 8 )
	ButtonTitle:setTopBottom( false, true, -28, -5 )
	ButtonTitle:setAlpha( 0 )
	ButtonTitle:setText( Engine.Localize( "MENU_MEDALS" ) )
	ButtonTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ButtonTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ButtonTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ButtonTitle )
	self.ButtonTitle = ButtonTitle
	
	local CombatRecordMedal1 = CoD.CombatRecordMedal.new( menu, controller )
	CombatRecordMedal1:setLeftRight( true, false, 20, 140 )
	CombatRecordMedal1:setTopBottom( true, false, 19, 172 )
	CombatRecordMedal1:subscribeToGlobalModel( controller, "CombatRecordMPMedal1", nil, function ( model )
		CombatRecordMedal1:setModel( model, controller )
	end )
	self:addElement( CombatRecordMedal1 )
	self.CombatRecordMedal1 = CombatRecordMedal1
	
	local CombatRecordMedal2 = CoD.CombatRecordMedal.new( menu, controller )
	CombatRecordMedal2:setLeftRight( true, false, 159, 279 )
	CombatRecordMedal2:setTopBottom( true, false, 19, 172 )
	CombatRecordMedal2:subscribeToGlobalModel( controller, "CombatRecordMPMedal2", nil, function ( model )
		CombatRecordMedal2:setModel( model, controller )
	end )
	self:addElement( CombatRecordMedal2 )
	self.CombatRecordMedal2 = CombatRecordMedal2
	
	local CombatRecordMedal3 = CoD.CombatRecordMedal.new( menu, controller )
	CombatRecordMedal3:setLeftRight( true, false, 296.5, 416.5 )
	CombatRecordMedal3:setTopBottom( true, false, 19, 172 )
	CombatRecordMedal3:subscribeToGlobalModel( controller, "CombatRecordMPMedal3", nil, function ( model )
		CombatRecordMedal3:setModel( model, controller )
	end )
	self:addElement( CombatRecordMedal3 )
	self.CombatRecordMedal3 = CombatRecordMedal3
	
	local CombatRecordMedal4 = CoD.CombatRecordMedal.new( menu, controller )
	CombatRecordMedal4:setLeftRight( true, false, 432, 552 )
	CombatRecordMedal4:setTopBottom( true, false, 19, 172 )
	CombatRecordMedal4:subscribeToGlobalModel( controller, "CombatRecordMPMedal4", nil, function ( model )
		CombatRecordMedal4:setModel( model, controller )
	end )
	self:addElement( CombatRecordMedal4 )
	self.CombatRecordMedal4 = CombatRecordMedal4
	
	local CombatRecordMedal5 = CoD.CombatRecordMedal.new( menu, controller )
	CombatRecordMedal5:setLeftRight( true, false, 567, 687 )
	CombatRecordMedal5:setTopBottom( true, false, 19, 172 )
	CombatRecordMedal5:subscribeToGlobalModel( controller, "CombatRecordMPMedal5", nil, function ( model )
		CombatRecordMedal5:setModel( model, controller )
	end )
	self:addElement( CombatRecordMedal5 )
	self.CombatRecordMedal5 = CombatRecordMedal5
	
	local ButtonTitleBG0 = LUI.UIImage.new()
	ButtonTitleBG0:setLeftRight( true, true, 3, -2 )
	ButtonTitleBG0:setTopBottom( true, true, 2, -3 )
	ButtonTitleBG0:setRGB( 0, 0, 0 )
	ButtonTitleBG0:setAlpha( 0 )
	self:addElement( ButtonTitleBG0 )
	self.ButtonTitleBG0 = ButtonTitleBG0
	
	local StartMenuIdentitySubTitle0 = CoD.StartMenu_Identity_SubTitle.new( menu, controller )
	StartMenuIdentitySubTitle0:setLeftRight( true, false, 5, 671 )
	StartMenuIdentitySubTitle0:setTopBottom( true, false, 185, 211 )
	StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "Combat" ) )
	StartMenuIdentitySubTitle0.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( StartMenuIdentitySubTitle0 )
	self.StartMenuIdentitySubTitle0 = StartMenuIdentitySubTitle0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.4 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				BlackBox:completeAnimation()
				self.BlackBox:setAlpha( 0.05 )
				self.clipFinished( BlackBox, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				ButtonTitleBG0:completeAnimation()
				self.ButtonTitleBG0:setAlpha( 0 )
				self.clipFinished( ButtonTitleBG0, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 5 )
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
				ButtonTitleBG0:completeAnimation()
				self.ButtonTitleBG0:setAlpha( 0 )
				self.clipFinished( ButtonTitleBG0, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BoxButtonLrgInactive:close()
		element.BoxButtonLrgInactiveDiag:close()
		element.FocusBarT:close()
		element.FocusBarB:close()
		element.CombatRecordMedal1:close()
		element.CombatRecordMedal2:close()
		element.CombatRecordMedal3:close()
		element.CombatRecordMedal4:close()
		element.CombatRecordMedal5:close()
		element.StartMenuIdentitySubTitle0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

