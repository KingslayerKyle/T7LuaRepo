-- 3e9230cdf6b7136e9b1bbca0d05e8688
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgIdle" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.Challenges.Challenges_PercentCompleteWidget_SM" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Identity_SubTitle" )
require( "ui.uieditor.widgets.CAC.cac_lock" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0:registerEventHandler( "set_unlock_instructions", function ( element, event )
		local f2_local0 = ""
		if event.unlockRank == nil or event.unlockPLevel == nil then
			f2_local0 = Engine.Localize( "MENU_CHALLENGE_CATEGORY_NOT_FOUND" )
		elseif event.plevel < event.unlockPLevel then
			f2_local0 = Engine.Localize( "MENU_CHALLENGE_PRESTIGE_HINTTEXT_LOCK", event.unlockPLevel )
		elseif event.rank < event.unlockRank then
			f2_local0 = Engine.Localize( "MENU_UNLOCKED_AT", CoD.GetRankName( event.unlockRank, event.plevel, event.mode ), event.unlockRank + 1 )
		end
		element.UnlockInstructions:setText( f2_local0 )
	end )
end

CoD.Challenges_Category_Button_SM = InheritFrom( LUI.UIElement )
CoD.Challenges_Category_Button_SM.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Challenges_Category_Button_SM )
	self.id = "Challenges_Category_Button_SM"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 350 )
	self:setTopBottom( true, false, 0, 150 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgInactive:setTopBottom( true, true, -2, 2 )
	BoxButtonLrgInactive:setRGB( 0.87, 0.97, 1 )
	BoxButtonLrgInactive:setAlpha( 0.7 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local BoxButtonLrgIdle = CoD.cac_ButtonBoxLrgIdle.new( menu, controller )
	BoxButtonLrgIdle:setLeftRight( true, true, 0, 0 )
	BoxButtonLrgIdle:setTopBottom( true, true, 0, 0 )
	BoxButtonLrgIdle:setAlpha( 0 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local BoxButtonLrgInactiveDiag = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag:setLeftRight( true, true, 0, 0 )
	BoxButtonLrgInactiveDiag:setTopBottom( true, true, 0, 0 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	local CategoryIcon = LUI.UIImage.new()
	CategoryIcon:setLeftRight( false, false, -64, 64 )
	CategoryIcon:setTopBottom( false, false, -64, 64 )
	self:addElement( CategoryIcon )
	self.CategoryIcon = CategoryIcon
	
	local PercentCompleteWidget = CoD.Challenges_PercentCompleteWidget_SM.new( menu, controller )
	PercentCompleteWidget:setLeftRight( false, true, -56, -8 )
	PercentCompleteWidget:setTopBottom( false, true, -56, -8 )
	PercentCompleteWidget.percentCompleteCircle:setAlpha( 1 )
	PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, 0.5, 0, 0, 0 )
	PercentCompleteWidget.percentText:setText( Engine.Localize( "50%" ) )
	self:addElement( PercentCompleteWidget )
	self.PercentCompleteWidget = PercentCompleteWidget
	
	local UnlockInstructions = LUI.UIText.new()
	UnlockInstructions:setLeftRight( true, true, 6, 6 )
	UnlockInstructions:setTopBottom( false, true, -52, -34 )
	UnlockInstructions:setAlpha( 0 )
	UnlockInstructions:setText( Engine.Localize( "MENU_CHALLENGES_WEAPON_HINTTEXT_LOCK" ) )
	UnlockInstructions:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	UnlockInstructions:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	UnlockInstructions:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( UnlockInstructions )
	self.UnlockInstructions = UnlockInstructions
	
	local BlackTint = LUI.UIImage.new()
	BlackTint:setLeftRight( true, true, 2, -2 )
	BlackTint:setTopBottom( true, true, 2, -3 )
	BlackTint:setRGB( 0, 0, 0 )
	BlackTint:setAlpha( 0.05 )
	self:addElement( BlackTint )
	self.BlackTint = BlackTint
	
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
	
	local StartMenuIdentitySubTitle0 = CoD.StartMenu_Identity_SubTitle.new( menu, controller )
	StartMenuIdentitySubTitle0:setLeftRight( true, false, 5, 93 )
	StartMenuIdentitySubTitle0:setTopBottom( false, true, -32, -6 )
	StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_DARKOPS" ) )
	StartMenuIdentitySubTitle0.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( StartMenuIdentitySubTitle0 )
	self.StartMenuIdentitySubTitle0 = StartMenuIdentitySubTitle0
	
	local BlackLine = LUI.UIImage.new()
	BlackLine:setLeftRight( true, true, 3, -3 )
	BlackLine:setTopBottom( false, false, -25.5, 15 )
	BlackLine:setRGB( 0, 0, 0 )
	BlackLine:setAlpha( 0 )
	self:addElement( BlackLine )
	self.BlackLine = BlackLine
	
	local lockedIcon = CoD.cac_lock.new( menu, controller )
	lockedIcon:setLeftRight( false, false, -12.5, 18.5 )
	lockedIcon:setTopBottom( false, false, -21, 11 )
	lockedIcon:setAlpha( 0 )
	self:addElement( lockedIcon )
	self.lockedIcon = lockedIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )

				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.4 )
				self.clipFinished( BoxButtonLrgInactive, {} )

				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgIdle, {} )

				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )

				CategoryIcon:completeAnimation()
				self.CategoryIcon:setAlpha( 1 )
				self.clipFinished( CategoryIcon, {} )

				PercentCompleteWidget:completeAnimation()
				self.PercentCompleteWidget:setAlpha( 1 )
				self.clipFinished( PercentCompleteWidget, {} )

				UnlockInstructions:completeAnimation()
				self.UnlockInstructions:setAlpha( 0 )
				self.clipFinished( UnlockInstructions, {} )

				BlackTint:completeAnimation()
				self.BlackTint:setAlpha( 0.05 )
				self.clipFinished( BlackTint, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )

				BlackLine:completeAnimation()
				self.BlackLine:setAlpha( 0 )
				self.clipFinished( BlackLine, {} )

				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 8 )

				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.7 )
				self.clipFinished( BoxButtonLrgInactive, {} )

				PercentCompleteWidget:completeAnimation()
				self.PercentCompleteWidget:setAlpha( 1 )
				self.clipFinished( PercentCompleteWidget, {} )

				UnlockInstructions:completeAnimation()
				self.UnlockInstructions:setAlpha( 0 )
				self.clipFinished( UnlockInstructions, {} )

				BlackTint:completeAnimation()
				self.BlackTint:setAlpha( 0 )
				self.clipFinished( BlackTint, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )

				BlackLine:completeAnimation()
				self.BlackLine:setAlpha( 0 )
				self.clipFinished( BlackLine, {} )

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

				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgIdle, {} )

				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )

				CategoryIcon:completeAnimation()
				self.CategoryIcon:setAlpha( 0 )
				self.clipFinished( CategoryIcon, {} )

				PercentCompleteWidget:completeAnimation()
				self.PercentCompleteWidget:setAlpha( 0 )
				self.clipFinished( PercentCompleteWidget, {} )

				UnlockInstructions:completeAnimation()
				self.UnlockInstructions:setAlpha( 0 )
				self.clipFinished( UnlockInstructions, {} )

				BlackTint:completeAnimation()
				self.BlackTint:setAlpha( 0.05 )
				self.clipFinished( BlackTint, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )

				StartMenuIdentitySubTitle0:completeAnimation()
				self.StartMenuIdentitySubTitle0:setAlpha( 1 )
				self.clipFinished( StartMenuIdentitySubTitle0, {} )

				BlackLine:completeAnimation()
				self.BlackLine:setAlpha( 0.5 )
				self.clipFinished( BlackLine, {} )

				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 1 )
				self.clipFinished( lockedIcon, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 10 )

				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.7 )
				self.clipFinished( BoxButtonLrgInactive, {} )

				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 1 )
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

				BlackTint:completeAnimation()
				self.BlackTint:setAlpha( 0 )
				self.clipFinished( BlackTint, {} )

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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BoxButtonLrgInactive:close()
		element.BoxButtonLrgIdle:close()
		element.BoxButtonLrgInactiveDiag:close()
		element.PercentCompleteWidget:close()
		element.FocusBarT:close()
		element.FocusBarB:close()
		element.StartMenuIdentitySubTitle0:close()
		element.lockedIcon:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
