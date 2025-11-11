require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgIdle" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.CAC.cac_lock" )
require( "ui.uieditor.widgets.Challenges.Challenges_PercentCompleteWidget_MD" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Identity_SubTitle" )

local PostLoadFunc = function ( self, controller )
	self:registerEventHandler( "set_unlock_instructions", function ( self, event )
		local unlockText = ""
		if event.unlockRank == nil or event.unlockPLevel == nil then
			unlockText = Engine.Localize( "MENU_CHALLENGE_CATEGORY_NOT_FOUND" )
		elseif event.plevel < event.unlockPLevel then
			unlockText = Engine.Localize( "MENU_CHALLENGE_PRESTIGE_HINTTEXT_LOCK", event.unlockPLevel )
		elseif event.rank < event.unlockRank then
			local rankName = CoD.GetRankName( event.unlockRank, event.plevel, event.mode )
			unlockText = Engine.Localize( "MENU_UNLOCKED_AT", rankName, event.unlockRank + 1 )
		end
		self.UnlockInstructions:setText( unlockText )
	end )
end

CoD.Challenges_Category_Button = InheritFrom( LUI.UIElement )
CoD.Challenges_Category_Button.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Challenges_Category_Button )
	self.id = "Challenges_Category_Button"
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
	
	local BoxButtonLrgIdle = CoD.cac_ButtonBoxLrgIdle.new( menu, controller )
	BoxButtonLrgIdle:setLeftRight( 0, 1, 0, 0 )
	BoxButtonLrgIdle:setTopBottom( 0, 1, 0, 0 )
	BoxButtonLrgIdle:setAlpha( 0 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local BoxButtonLrgInactiveDiag = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag:setLeftRight( 0, 1, 0, 0 )
	BoxButtonLrgInactiveDiag:setTopBottom( 0, 1, 0, 0 )
	BoxButtonLrgInactiveDiag:setAlpha( 0.2 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	local CategoryIcon = LUI.UIImage.new()
	CategoryIcon:setLeftRight( 0.5, 0.5, -121, 121 )
	CategoryIcon:setTopBottom( 0.5, 0.5, -122, 120 )
	self:addElement( CategoryIcon )
	self.CategoryIcon = CategoryIcon
	
	local PercentCompleteWidget = CoD.Challenges_PercentCompleteWidget_MD.new( menu, controller )
	PercentCompleteWidget:setLeftRight( 1, 1, -114, -18 )
	PercentCompleteWidget:setTopBottom( 1, 1, -114, -18 )
	PercentCompleteWidget.percentCompleteCircle:setAlpha( 1 )
	PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, 0.5, 0, 0, 0 )
	PercentCompleteWidget.percentText:setText( Engine.Localize( "50%" ) )
	self:addElement( PercentCompleteWidget )
	self.PercentCompleteWidget = PercentCompleteWidget
	
	local UnlockInstructions = LUI.UIText.new()
	UnlockInstructions:setLeftRight( 0, 1, 9, -9 )
	UnlockInstructions:setTopBottom( 1, 1, -121, -96 )
	UnlockInstructions:setAlpha( 0 )
	UnlockInstructions:setText( Engine.Localize( "MENU_CHALLENGES_WEAPON_HINTTEXT_LOCK" ) )
	UnlockInstructions:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	UnlockInstructions:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	UnlockInstructions:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( UnlockInstructions )
	self.UnlockInstructions = UnlockInstructions
	
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
	StartMenuIdentitySubTitle0:setTopBottom( 1, 1, -48, -8 )
	StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_DARKOPS" ) )
	StartMenuIdentitySubTitle0.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( StartMenuIdentitySubTitle0 )
	self.StartMenuIdentitySubTitle0 = StartMenuIdentitySubTitle0
	
	local BlackLine = LUI.UIImage.new()
	BlackLine:setLeftRight( 0, 1, 4, -4 )
	BlackLine:setTopBottom( 0.5, 0.5, -38, 23 )
	BlackLine:setRGB( 0, 0, 0 )
	BlackLine:setAlpha( 0 )
	self:addElement( BlackLine )
	self.BlackLine = BlackLine
	
	local lockedIcon = CoD.cac_lock.new( menu, controller )
	lockedIcon:setLeftRight( 0.5, 0.5, -19, 27 )
	lockedIcon:setTopBottom( 0.5, 0.5, -32, 16 )
	lockedIcon:setAlpha( 0 )
	self:addElement( lockedIcon )
	self.lockedIcon = lockedIcon
	
	self.resetProperties = function ()
		BoxButtonLrgInactiveDiag:completeAnimation()
		BoxButtonLrgInactive:completeAnimation()
		FocusBarB:completeAnimation()
		FocusBarT:completeAnimation()
		BlackTint:completeAnimation()
		CategoryIcon:completeAnimation()
		PercentCompleteWidget:completeAnimation()
		lockedIcon:completeAnimation()
		BlackLine:completeAnimation()
		UnlockInstructions:completeAnimation()
		BoxButtonLrgInactiveDiag:setAlpha( 0.2 )
		BoxButtonLrgInactive:setAlpha( 0.7 )
		FocusBarB:setAlpha( 0 )
		FocusBarT:setAlpha( 0 )
		BlackTint:setAlpha( 0.05 )
		CategoryIcon:setAlpha( 1 )
		PercentCompleteWidget:setAlpha( 1 )
		lockedIcon:setAlpha( 0 )
		BlackLine:setAlpha( 0 )
		UnlockInstructions:setAlpha( 0 )
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
				self:setupElementClipCounter( 5 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.4 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				CategoryIcon:completeAnimation()
				self.CategoryIcon:setAlpha( 0 )
				self.clipFinished( CategoryIcon, {} )
				PercentCompleteWidget:completeAnimation()
				self.PercentCompleteWidget:setAlpha( 0 )
				self.clipFinished( PercentCompleteWidget, {} )
				BlackLine:completeAnimation()
				self.BlackLine:setAlpha( 0.5 )
				self.clipFinished( BlackLine, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 1 )
				self.clipFinished( lockedIcon, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 8 )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0.1 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				CategoryIcon:completeAnimation()
				self.CategoryIcon:setAlpha( 0 )
				self.clipFinished( CategoryIcon, {} )
				PercentCompleteWidget:completeAnimation()
				self.PercentCompleteWidget:setAlpha( 0 )
				self.clipFinished( PercentCompleteWidget, {} )
				UnlockInstructions:completeAnimation()
				self.UnlockInstructions:setAlpha( 1 )
				self.clipFinished( UnlockInstructions, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				BlackLine:completeAnimation()
				self.BlackLine:setAlpha( 0.5 )
				self.clipFinished( BlackLine, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 1 )
				self.clipFinished( lockedIcon, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BoxButtonLrgInactive:close()
		self.BoxButtonLrgIdle:close()
		self.BoxButtonLrgInactiveDiag:close()
		self.PercentCompleteWidget:close()
		self.FocusBarT:close()
		self.FocusBarB:close()
		self.StartMenuIdentitySubTitle0:close()
		self.lockedIcon:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

