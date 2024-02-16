-- 078e9e8702ec9e5bb64d40f39ce36ce1
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgIdle" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )
require( "ui.uieditor.widgets.CAC.cac_lock" )
require( "ui.uieditor.widgets.Border" )
require( "ui.uieditor.widgets.Challenges.Challenges_TierIcon" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponNameWidget" )

CoD.Challenges_CallingCardProfiler_NearCompletion = InheritFrom( LUI.UIElement )
CoD.Challenges_CallingCardProfiler_NearCompletion.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Challenges_CallingCardProfiler_NearCompletion )
	self.id = "Challenges_CallingCardProfiler_NearCompletion"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 357 )
	self:setTopBottom( true, false, 0, 464 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local black = LUI.UIImage.new()
	black:setLeftRight( true, true, 0, 0 )
	black:setTopBottom( true, true, 0, 0 )
	black:setRGB( 0, 0, 0 )
	black:setAlpha( 0.5 )
	black:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	black:setShaderVector( 0, 0.01, 0.01, 0.01, 0.01 )
	self:addElement( black )
	self.black = black
	
	local BoxButtonLrgInactiveDiag = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag:setLeftRight( true, true, 0, 0 )
	BoxButtonLrgInactiveDiag:setTopBottom( true, true, 0, 0 )
	BoxButtonLrgInactiveDiag:setAlpha( 0 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( true, true, 0, 0 )
	BoxButtonLrgInactive:setTopBottom( true, true, 0, 0 )
	BoxButtonLrgInactive:setAlpha( 0 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local BoxButtonLrgIdle = CoD.cac_ButtonBoxLrgIdle.new( menu, controller )
	BoxButtonLrgIdle:setLeftRight( true, true, 0, 0 )
	BoxButtonLrgIdle:setTopBottom( true, true, 0, 2 )
	BoxButtonLrgIdle:setAlpha( 0 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local cacButtonBoxLrgInactiveStroke0 = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	cacButtonBoxLrgInactiveStroke0:setLeftRight( true, true, 0, 0 )
	cacButtonBoxLrgInactiveStroke0:setTopBottom( true, true, 0, 0 )
	self:addElement( cacButtonBoxLrgInactiveStroke0 )
	self.cacButtonBoxLrgInactiveStroke0 = cacButtonBoxLrgInactiveStroke0
	
	local SelectedCardIcon = LUI.UIImage.new()
	SelectedCardIcon:setLeftRight( false, false, -175, 175 )
	SelectedCardIcon:setTopBottom( false, false, -229, -141.5 )
	SelectedCardIcon:setImage( RegisterImage( "uie_emblem_bg_blackops" ) )
	self:addElement( SelectedCardIcon )
	self.SelectedCardIcon = SelectedCardIcon
	
	local TitleBg = LUI.UIImage.new()
	TitleBg:setLeftRight( false, false, -176.75, 176.5 )
	TitleBg:setTopBottom( false, false, -201.5, -171.6 )
	TitleBg:setRGB( 0, 0, 0 )
	TitleBg:setAlpha( 0.4 )
	TitleBg:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	TitleBg:setShaderVector( 0, 0.01, 0.02, 0.01, 0.02 )
	self:addElement( TitleBg )
	self.TitleBg = TitleBg
	
	local lockedIcon = CoD.cac_lock.new( menu, controller )
	lockedIcon:setLeftRight( true, false, 141, 173 )
	lockedIcon:setTopBottom( true, false, 30.4, 62.4 )
	self:addElement( lockedIcon )
	self.lockedIcon = lockedIcon
	
	local TierText = LUI.UIText.new()
	TierText:setLeftRight( true, false, 165, 256 )
	TierText:setTopBottom( true, false, 36.5, 60.5 )
	TierText:setText( Engine.Localize( "Tier III" ) )
	TierText:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	TierText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TierText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TierText )
	self.TierText = TierText
	
	local CardDescription = LUI.UIText.new()
	CardDescription:setLeftRight( true, false, 17, 349 )
	CardDescription:setTopBottom( true, false, 142, 162 )
	CardDescription:setText( Engine.Localize( "Complete challenge to earn card" ) )
	CardDescription:setTTF( "fonts/default.ttf" )
	CardDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	CardDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( CardDescription )
	self.CardDescription = CardDescription
	
	local ProgressBar = LUI.UIImage.new()
	ProgressBar:setLeftRight( true, true, 18, -24 )
	ProgressBar:setTopBottom( true, false, 288.75, 301.25 )
	ProgressBar:setRGB( 1, 0.35, 0 )
	ProgressBar:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	ProgressBar:setShaderVector( 0, 0.5, 0, 0, 0 )
	ProgressBar:setShaderVector( 1, 0, 0, 0, 0 )
	ProgressBar:setShaderVector( 2, 1, 0, 0, 0 )
	ProgressBar:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( ProgressBar )
	self.ProgressBar = ProgressBar
	
	local ProgressBarBorder = CoD.Border.new( menu, controller )
	ProgressBarBorder:setLeftRight( true, true, 18, -24 )
	ProgressBarBorder:setTopBottom( true, false, 288.75, 301.25 )
	self:addElement( ProgressBarBorder )
	self.ProgressBarBorder = ProgressBarBorder
	
	local ProgressFraction = LUI.UITightText.new()
	ProgressFraction:setLeftRight( true, false, 20, 95 )
	ProgressFraction:setTopBottom( true, false, 305.25, 325.25 )
	ProgressFraction:setText( Engine.Localize( "5/10" ) )
	ProgressFraction:setTTF( "fonts/default.ttf" )
	self:addElement( ProgressFraction )
	self.ProgressFraction = ProgressFraction
	
	local TierStatus = LUI.UIText.new()
	TierStatus:setLeftRight( true, false, 18, 218 )
	TierStatus:setTopBottom( true, false, 362.5, 387.5 )
	TierStatus:setText( Engine.Localize( "CHALLENGE_TIER_STATUS" ) )
	TierStatus:setTTF( "fonts/default.ttf" )
	TierStatus:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TierStatus:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TierStatus )
	self.TierStatus = TierStatus
	
	local TierList = LUI.UIList.new( menu, controller, -61, 0, nil, false, false, 0, 0, false, true )
	TierList:makeFocusable()
	TierList:setLeftRight( true, false, 18, 254 )
	TierList:setTopBottom( true, false, 387.5, 463.5 )
	TierList:setWidgetType( CoD.Challenges_TierIcon )
	TierList:setHorizontalCount( 5 )
	TierList:setSpacing( -61 )
	TierList:setDataSource( "TierIconList" )
	self:addElement( TierList )
	self.TierList = TierList
	
	local XPIcon = LUI.UIImage.new()
	XPIcon:setLeftRight( true, false, 18, 50 )
	XPIcon:setTopBottom( true, false, 343, 375 )
	XPIcon:setAlpha( 0 )
	XPIcon:setImage( RegisterImage( "uie_t7_hud_mp_notifications_xp" ) )
	self:addElement( XPIcon )
	self.XPIcon = XPIcon
	
	local XPText = LUI.UITightText.new()
	XPText:setLeftRight( true, false, 52, 114 )
	XPText:setTopBottom( true, false, 349, 369 )
	XPText:setAlpha( 0 )
	XPText:setText( LocalizeIntoString( "CPUI_XP_BONUS", "+5000 XP" ) )
	XPText:setTTF( "fonts/default.ttf" )
	self:addElement( XPText )
	self.XPText = XPText
	
	local BoxButtonLrgInactiveDiag0 = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag0:setLeftRight( false, false, -175, 175 )
	BoxButtonLrgInactiveDiag0:setTopBottom( false, false, -228, -141.9 )
	BoxButtonLrgInactiveDiag0:setAlpha( 0.3 )
	self:addElement( BoxButtonLrgInactiveDiag0 )
	self.BoxButtonLrgInactiveDiag0 = BoxButtonLrgInactiveDiag0
	
	local Image100 = LUI.UIImage.new()
	Image100:setLeftRight( true, true, 5, -5 )
	Image100:setTopBottom( false, false, 17.75, 19.75 )
	Image100:setAlpha( 0.5 )
	Image100:setImage( RegisterImage( "uie_t7_menu_frontend_titlelinem" ) )
	Image100:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image100 )
	self.Image100 = Image100
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, true, 3, -2 )
	Image0:setTopBottom( false, false, 112, 114 )
	Image0:setAlpha( 0.5 )
	Image0:setImage( RegisterImage( "uie_t7_menu_frontend_titlelinem" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image6 = LUI.UIImage.new()
	Image6:setLeftRight( false, true, -36.5, 0 )
	Image6:setTopBottom( false, false, 14.75, 22.75 )
	Image6:setAlpha( 0.66 )
	Image6:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image6:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image6 )
	self.Image6 = Image6
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( false, true, -36.5, 0 )
	Image1:setTopBottom( false, false, 109, 117 )
	Image1:setAlpha( 0.66 )
	Image1:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, false, 1.75, 38.25 )
	Image2:setTopBottom( false, false, 14.75, 22.75 )
	Image2:setAlpha( 0.66 )
	Image2:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, false, 1.75, 38.25 )
	Image3:setTopBottom( false, false, 109, 117 )
	Image3:setAlpha( 0.66 )
	Image3:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local EmblemName = CoD.WeaponNameWidget.new( menu, controller )
	EmblemName:setLeftRight( true, false, 18, 336.5 )
	EmblemName:setTopBottom( true, false, 103, 137 )
	EmblemName:linkToElementModel( self, "title", true, function ( model )
		local title = Engine.GetModelValue( model )
		if title then
			EmblemName.weaponNameLabel:setText( Engine.Localize( title ) )
		end
	end )
	self:addElement( EmblemName )
	self.EmblemName = EmblemName
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 17 )

				TitleBg:completeAnimation()
				self.TitleBg:setAlpha( 0 )
				self.clipFinished( TitleBg, {} )

				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )

				TierText:completeAnimation()
				self.TierText:setAlpha( 0 )
				self.clipFinished( TierText, {} )

				ProgressBar:completeAnimation()
				self.ProgressBar:setAlpha( 0 )
				self.clipFinished( ProgressBar, {} )

				ProgressBarBorder:completeAnimation()
				self.ProgressBarBorder:setAlpha( 0 )
				self.clipFinished( ProgressBarBorder, {} )

				ProgressFraction:completeAnimation()
				self.ProgressFraction:setAlpha( 0 )
				self.clipFinished( ProgressFraction, {} )

				TierStatus:completeAnimation()
				self.TierStatus:setAlpha( 0 )
				self.clipFinished( TierStatus, {} )

				TierList:completeAnimation()
				self.TierList:setAlpha( 0 )
				self.clipFinished( TierList, {} )

				XPIcon:completeAnimation()
				self.XPIcon:setAlpha( 0 )
				self.clipFinished( XPIcon, {} )

				XPText:completeAnimation()
				self.XPText:setAlpha( 0 )
				self.clipFinished( XPText, {} )

				BoxButtonLrgInactiveDiag0:completeAnimation()
				self.BoxButtonLrgInactiveDiag0:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag0, {} )

				Image100:completeAnimation()
				self.Image100:setAlpha( 0 )
				self.clipFinished( Image100, {} )

				Image0:completeAnimation()
				self.Image0:setAlpha( 0 )
				self.clipFinished( Image0, {} )

				Image6:completeAnimation()
				self.Image6:setAlpha( 0 )
				self.clipFinished( Image6, {} )

				Image1:completeAnimation()
				self.Image1:setAlpha( 0 )
				self.clipFinished( Image1, {} )

				Image2:completeAnimation()
				self.Image2:setAlpha( 0 )
				self.clipFinished( Image2, {} )

				Image3:completeAnimation()
				self.Image3:setAlpha( 0 )
				self.clipFinished( Image3, {} )
			end
		},
		Locked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 17 )

				TitleBg:completeAnimation()
				self.TitleBg:setAlpha( 0.4 )
				self.clipFinished( TitleBg, {} )

				lockedIcon:completeAnimation()
				self.lockedIcon:setLeftRight( true, false, 141, 173 )
				self.lockedIcon:setTopBottom( true, false, 30.4, 62.4 )
				self.lockedIcon:setAlpha( 1 )
				self.clipFinished( lockedIcon, {} )

				TierText:completeAnimation()
				self.TierText:setLeftRight( true, false, 165, 256 )
				self.TierText:setTopBottom( true, false, 36.5, 60.5 )
				self.TierText:setAlpha( 1 )
				self.clipFinished( TierText, {} )

				ProgressBar:completeAnimation()
				self.ProgressBar:setAlpha( 1 )
				self.clipFinished( ProgressBar, {} )

				ProgressBarBorder:completeAnimation()
				self.ProgressBarBorder:setAlpha( 1 )
				self.clipFinished( ProgressBarBorder, {} )

				ProgressFraction:completeAnimation()
				self.ProgressFraction:setAlpha( 1 )
				self.clipFinished( ProgressFraction, {} )

				TierStatus:completeAnimation()
				self.TierStatus:setAlpha( 1 )
				self.clipFinished( TierStatus, {} )

				TierList:completeAnimation()
				self.TierList:setAlpha( 1 )
				self.clipFinished( TierList, {} )

				XPIcon:completeAnimation()
				self.XPIcon:setAlpha( 0 )
				self.clipFinished( XPIcon, {} )

				XPText:completeAnimation()
				self.XPText:setAlpha( 0 )
				self.clipFinished( XPText, {} )

				BoxButtonLrgInactiveDiag0:completeAnimation()
				self.BoxButtonLrgInactiveDiag0:setAlpha( 0.4 )
				self.clipFinished( BoxButtonLrgInactiveDiag0, {} )

				Image100:completeAnimation()
				self.Image100:setAlpha( 0.5 )
				self.clipFinished( Image100, {} )

				Image0:completeAnimation()
				self.Image0:setLeftRight( true, true, 3, -2 )
				self.Image0:setTopBottom( false, false, 112, 114 )
				self.Image0:setAlpha( 0.5 )
				self.clipFinished( Image0, {} )

				Image6:completeAnimation()
				self.Image6:setAlpha( 0.66 )
				self.clipFinished( Image6, {} )

				Image1:completeAnimation()
				self.Image1:setLeftRight( false, true, -36.5, 0 )
				self.Image1:setTopBottom( false, false, 109, 117 )
				self.Image1:setAlpha( 0.66 )
				self.clipFinished( Image1, {} )

				Image2:completeAnimation()
				self.Image2:setAlpha( 0.66 )
				self.clipFinished( Image2, {} )

				Image3:completeAnimation()
				self.Image3:setLeftRight( true, false, 1.75, 38.25 )
				self.Image3:setTopBottom( false, false, 109, 117 )
				self.Image3:setAlpha( 0.66 )
				self.clipFinished( Image3, {} )
			end
		},
		LockedOneTier = {
			DefaultClip = function ()
				self:setupElementClipCounter( 17 )

				TitleBg:completeAnimation()
				self.TitleBg:setAlpha( 0.4 )
				self.clipFinished( TitleBg, {} )

				lockedIcon:completeAnimation()
				self.lockedIcon:setLeftRight( true, false, 168, 200 )
				self.lockedIcon:setTopBottom( true, false, 30, 62 )
				self.lockedIcon:setAlpha( 1 )
				self.clipFinished( lockedIcon, {} )

				TierText:completeAnimation()
				self.TierText:setAlpha( 0 )
				self.clipFinished( TierText, {} )

				ProgressBar:completeAnimation()
				self.ProgressBar:setAlpha( 1 )
				self.clipFinished( ProgressBar, {} )

				ProgressBarBorder:completeAnimation()
				self.ProgressBarBorder:setAlpha( 1 )
				self.clipFinished( ProgressBarBorder, {} )

				ProgressFraction:completeAnimation()
				self.ProgressFraction:setAlpha( 1 )
				self.clipFinished( ProgressFraction, {} )

				TierStatus:completeAnimation()
				self.TierStatus:setAlpha( 0 )
				self.clipFinished( TierStatus, {} )

				TierList:completeAnimation()
				self.TierList:setAlpha( 0 )
				self.clipFinished( TierList, {} )

				XPIcon:completeAnimation()
				self.XPIcon:setAlpha( 1 )
				self.clipFinished( XPIcon, {} )

				XPText:completeAnimation()
				self.XPText:setAlpha( 1 )
				self.clipFinished( XPText, {} )

				BoxButtonLrgInactiveDiag0:completeAnimation()
				self.BoxButtonLrgInactiveDiag0:setAlpha( 0.4 )
				self.clipFinished( BoxButtonLrgInactiveDiag0, {} )

				Image100:completeAnimation()
				self.Image100:setAlpha( 0.5 )
				self.clipFinished( Image100, {} )

				Image0:completeAnimation()
				self.Image0:setLeftRight( true, true, 3, -2 )
				self.Image0:setTopBottom( false, false, 155, 157 )
				self.Image0:setAlpha( 0.5 )
				self.clipFinished( Image0, {} )

				Image6:completeAnimation()
				self.Image6:setAlpha( 0.66 )
				self.clipFinished( Image6, {} )

				Image1:completeAnimation()
				self.Image1:setLeftRight( false, true, -36.5, 0 )
				self.Image1:setTopBottom( false, false, 152, 160 )
				self.Image1:setAlpha( 0.66 )
				self.clipFinished( Image1, {} )

				Image2:completeAnimation()
				self.Image2:setAlpha( 0.66 )
				self.clipFinished( Image2, {} )

				Image3:completeAnimation()
				self.Image3:setLeftRight( true, false, 1.75, 38.25 )
				self.Image3:setTopBottom( false, false, 152, 160 )
				self.Image3:setAlpha( 0.66 )
				self.clipFinished( Image3, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThan( element, controller, "maxTier", 0 )
			end
		},
		{
			stateName = "LockedOneTier",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "maxTier", 0 )
			end
		}
	} )
	self:linkToElementModel( self, "maxTier", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "maxTier"
		} )
	end )
	TierList.id = "TierList"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.TierList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BoxButtonLrgInactiveDiag:close()
		element.BoxButtonLrgInactive:close()
		element.BoxButtonLrgIdle:close()
		element.cacButtonBoxLrgInactiveStroke0:close()
		element.lockedIcon:close()
		element.ProgressBarBorder:close()
		element.TierList:close()
		element.BoxButtonLrgInactiveDiag0:close()
		element.EmblemName:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
