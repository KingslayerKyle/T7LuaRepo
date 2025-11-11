require( "ui.uieditor.widgets.Border" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgIdle" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )
require( "ui.uieditor.widgets.CAC.cac_lock" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponNameWidget" )
require( "ui.uieditor.widgets.Challenges.Challenges_TierIcon" )

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
	self:setLeftRight( 0, 0, 0, 535 )
	self:setTopBottom( 0, 0, 0, 696 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local black = LUI.UIImage.new()
	black:setLeftRight( 0, 1, 0, 0 )
	black:setTopBottom( 0, 1, 0, 0 )
	black:setRGB( 0, 0, 0 )
	black:setAlpha( 0.5 )
	black:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	black:setShaderVector( 0, 0.01, 0.01, 0.01, 0.01 )
	self:addElement( black )
	self.black = black
	
	local BoxButtonLrgInactiveDiag = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag:setLeftRight( 0, 1, 0, 0 )
	BoxButtonLrgInactiveDiag:setTopBottom( 0, 1, 0, 0 )
	BoxButtonLrgInactiveDiag:setAlpha( 0 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( 0, 1, 0, 0 )
	BoxButtonLrgInactive:setTopBottom( 0, 1, 0, 0 )
	BoxButtonLrgInactive:setAlpha( 0 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local BoxButtonLrgIdle = CoD.cac_ButtonBoxLrgIdle.new( menu, controller )
	BoxButtonLrgIdle:setLeftRight( 0, 1, 0, 0 )
	BoxButtonLrgIdle:setTopBottom( 0, 1, 0, 4 )
	BoxButtonLrgIdle:setAlpha( 0 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local cacButtonBoxLrgInactiveStroke0 = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	cacButtonBoxLrgInactiveStroke0:setLeftRight( 0, 1, 0, 0 )
	cacButtonBoxLrgInactiveStroke0:setTopBottom( 0, 1, 0, 0 )
	self:addElement( cacButtonBoxLrgInactiveStroke0 )
	self.cacButtonBoxLrgInactiveStroke0 = cacButtonBoxLrgInactiveStroke0
	
	local SelectedCardIcon = LUI.UIImage.new()
	SelectedCardIcon:setLeftRight( 0.5, 0.5, -262.5, 262.5 )
	SelectedCardIcon:setTopBottom( 0.5, 0.5, -343, -212 )
	self:addElement( SelectedCardIcon )
	self.SelectedCardIcon = SelectedCardIcon
	
	local TitleBg = LUI.UIImage.new()
	TitleBg:setLeftRight( 0.5, 0.5, -265, 265 )
	TitleBg:setTopBottom( 0.5, 0.5, -302, -257 )
	TitleBg:setRGB( 0, 0, 0 )
	TitleBg:setAlpha( 0.4 )
	TitleBg:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	TitleBg:setShaderVector( 0, 0.01, 0.02, 0.01, 0.02 )
	self:addElement( TitleBg )
	self.TitleBg = TitleBg
	
	local lockedIcon = CoD.cac_lock.new( menu, controller )
	lockedIcon:setLeftRight( 0, 0, 212, 260 )
	lockedIcon:setTopBottom( 0, 0, 46, 94 )
	self:addElement( lockedIcon )
	self.lockedIcon = lockedIcon
	
	local TierText = LUI.UIText.new()
	TierText:setLeftRight( 0, 0, 248, 384 )
	TierText:setTopBottom( 0, 0, 55, 91 )
	TierText:setText( Engine.Localize( "Tier III" ) )
	TierText:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	TierText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TierText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TierText )
	self.TierText = TierText
	
	local CardDescription = LUI.UIText.new()
	CardDescription:setLeftRight( 0, 0, 25, 523 )
	CardDescription:setTopBottom( 0, 0, 213, 243 )
	CardDescription:setText( Engine.Localize( "Complete challenge to earn card" ) )
	CardDescription:setTTF( "fonts/default.ttf" )
	CardDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	CardDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( CardDescription )
	self.CardDescription = CardDescription
	
	local ProgressBar = LUI.UIImage.new()
	ProgressBar:setLeftRight( 0, 0, 29, 527 )
	ProgressBar:setTopBottom( 0, 0, 433, 452 )
	ProgressBar:setRGB( 1, 0.35, 0 )
	ProgressBar:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	ProgressBar:setShaderVector( 0, 0.5, 0, 0, 0 )
	ProgressBar:setShaderVector( 1, 0, 0, 0, 0 )
	ProgressBar:setShaderVector( 2, 1, 0, 0, 0 )
	ProgressBar:setShaderVector( 3, 0, 0, 0, 0 )
	ProgressBar:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( ProgressBar )
	self.ProgressBar = ProgressBar
	
	local ProgressBarBorder = CoD.Border.new( menu, controller )
	ProgressBarBorder:setLeftRight( 0, 1, 28, -36 )
	ProgressBarBorder:setTopBottom( 0, 0, 433, 452 )
	self:addElement( ProgressBarBorder )
	self.ProgressBarBorder = ProgressBarBorder
	
	local ProgressFraction = LUI.UITightText.new()
	ProgressFraction:setLeftRight( 0, 0, 30, 142 )
	ProgressFraction:setTopBottom( 0, 0, 458, 488 )
	ProgressFraction:setText( Engine.Localize( "5/10" ) )
	ProgressFraction:setTTF( "fonts/default.ttf" )
	self:addElement( ProgressFraction )
	self.ProgressFraction = ProgressFraction
	
	local TierStatus = LUI.UIText.new()
	TierStatus:setLeftRight( 0, 0, 27, 327 )
	TierStatus:setTopBottom( 0, 0, 543, 581 )
	TierStatus:setText( Engine.Localize( "CHALLENGE_TIER_STATUS" ) )
	TierStatus:setTTF( "fonts/default.ttf" )
	TierStatus:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TierStatus:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TierStatus )
	self.TierStatus = TierStatus
	
	local TierList = LUI.UIList.new( menu, controller, -92, 0, nil, false, false, 0, 0, false, false )
	TierList:makeFocusable()
	TierList:setLeftRight( 0, 0, 28, 380 )
	TierList:setTopBottom( 0, 0, 581, 695 )
	TierList:setWidgetType( CoD.Challenges_TierIcon )
	TierList:setHorizontalCount( 5 )
	TierList:setSpacing( -92 )
	TierList:setDataSource( "TierIconList" )
	self:addElement( TierList )
	self.TierList = TierList
	
	local XPIcon = LUI.UIImage.new()
	XPIcon:setLeftRight( 0, 0, 27, 75 )
	XPIcon:setTopBottom( 0, 0, 514, 562 )
	XPIcon:setAlpha( 0 )
	XPIcon:setImage( RegisterImage( "uie_t7_hud_mp_notifications_xp" ) )
	self:addElement( XPIcon )
	self.XPIcon = XPIcon
	
	local XPText = LUI.UITightText.new()
	XPText:setLeftRight( 0, 0, 78, 171 )
	XPText:setTopBottom( 0, 0, 523, 553 )
	XPText:setAlpha( 0 )
	XPText:setText( LocalizeIntoString( "CPUI_XP_BONUS", "+5000 XP" ) )
	XPText:setTTF( "fonts/default.ttf" )
	self:addElement( XPText )
	self.XPText = XPText
	
	local BoxButtonLrgInactiveDiag0 = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag0:setLeftRight( 0.5, 0.5, -262.5, 262.5 )
	BoxButtonLrgInactiveDiag0:setTopBottom( 0.5, 0.5, -342, -213 )
	BoxButtonLrgInactiveDiag0:setAlpha( 0.3 )
	self:addElement( BoxButtonLrgInactiveDiag0 )
	self.BoxButtonLrgInactiveDiag0 = BoxButtonLrgInactiveDiag0
	
	local Image100 = LUI.UIImage.new()
	Image100:setLeftRight( 0, 1, 8, -8 )
	Image100:setTopBottom( 0.5, 0.5, 27, 30 )
	Image100:setAlpha( 0.5 )
	Image100:setImage( RegisterImage( "uie_t7_menu_frontend_titlelinem" ) )
	Image100:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image100 )
	self.Image100 = Image100
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 1, 5, -3 )
	Image0:setTopBottom( 0.5, 0.5, 168, 171 )
	Image0:setAlpha( 0.5 )
	Image0:setImage( RegisterImage( "uie_t7_menu_frontend_titlelinem" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image6 = LUI.UIImage.new()
	Image6:setLeftRight( 1, 1, -55, 0 )
	Image6:setTopBottom( 0.5, 0.5, 22, 34 )
	Image6:setAlpha( 0.66 )
	Image6:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image6:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image6 )
	self.Image6 = Image6
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( 1, 1, -55, 0 )
	Image1:setTopBottom( 0.5, 0.5, 164, 176 )
	Image1:setAlpha( 0.66 )
	Image1:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( 0, 0, 2, 57 )
	Image2:setTopBottom( 0.5, 0.5, 22, 34 )
	Image2:setAlpha( 0.66 )
	Image2:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( 0, 0, 2, 57 )
	Image3:setTopBottom( 0.5, 0.5, 164, 176 )
	Image3:setAlpha( 0.66 )
	Image3:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local EmblemName = CoD.WeaponNameWidget.new( menu, controller )
	EmblemName:setLeftRight( 0, 0, 27, 505 )
	EmblemName:setTopBottom( 0, 0, 154.5, 205.5 )
	EmblemName:linkToElementModel( self, "title", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			EmblemName.weaponNameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( EmblemName )
	self.EmblemName = EmblemName
	
	self.resetProperties = function ()
		ProgressBarBorder:completeAnimation()
		ProgressBar:completeAnimation()
		TierText:completeAnimation()
		lockedIcon:completeAnimation()
		TierList:completeAnimation()
		TierStatus:completeAnimation()
		BoxButtonLrgInactiveDiag0:completeAnimation()
		TitleBg:completeAnimation()
		Image100:completeAnimation()
		Image0:completeAnimation()
		Image6:completeAnimation()
		Image1:completeAnimation()
		Image2:completeAnimation()
		Image3:completeAnimation()
		ProgressFraction:completeAnimation()
		XPIcon:completeAnimation()
		XPText:completeAnimation()
		ProgressBarBorder:setAlpha( 1 )
		ProgressBar:setAlpha( 1 )
		TierText:setAlpha( 1 )
		lockedIcon:setLeftRight( 0, 0, 212, 260 )
		lockedIcon:setTopBottom( 0, 0, 46, 94 )
		lockedIcon:setAlpha( 1 )
		TierList:setAlpha( 1 )
		TierStatus:setAlpha( 1 )
		BoxButtonLrgInactiveDiag0:setAlpha( 0.3 )
		TitleBg:setAlpha( 0.4 )
		Image100:setAlpha( 0.5 )
		Image0:setLeftRight( 0, 1, 5, -3 )
		Image0:setTopBottom( 0.5, 0.5, 168, 171 )
		Image0:setAlpha( 0.5 )
		Image6:setAlpha( 0.66 )
		Image1:setLeftRight( 1, 1, -55, 0 )
		Image1:setTopBottom( 0.5, 0.5, 164, 176 )
		Image1:setAlpha( 0.66 )
		Image2:setAlpha( 0.66 )
		Image3:setLeftRight( 0, 0, 2, 57 )
		Image3:setTopBottom( 0.5, 0.5, 164, 176 )
		Image3:setAlpha( 0.66 )
		ProgressFraction:setAlpha( 1 )
		XPIcon:setAlpha( 0 )
		XPText:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 15 )
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
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				BoxButtonLrgInactiveDiag0:completeAnimation()
				self.BoxButtonLrgInactiveDiag0:setAlpha( 0.4 )
				self.clipFinished( BoxButtonLrgInactiveDiag0, {} )
			end
		},
		LockedOneTier = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 10 )
				lockedIcon:completeAnimation()
				self.lockedIcon:setLeftRight( 0, 0, 252, 300 )
				self.lockedIcon:setTopBottom( 0, 0, 45, 93 )
				self.clipFinished( lockedIcon, {} )
				TierText:completeAnimation()
				self.TierText:setAlpha( 0 )
				self.clipFinished( TierText, {} )
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
				Image0:completeAnimation()
				self.Image0:setLeftRight( 0, 1, 5, -3 )
				self.Image0:setTopBottom( 0.5, 0.5, 232, 235 )
				self.clipFinished( Image0, {} )
				Image1:completeAnimation()
				self.Image1:setLeftRight( 1, 1, -55, 0 )
				self.Image1:setTopBottom( 0.5, 0.5, 228, 240 )
				self.clipFinished( Image1, {} )
				Image3:completeAnimation()
				self.Image3:setLeftRight( 0, 0, 2, 57 )
				self.Image3:setTopBottom( 0.5, 0.5, 228, 240 )
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
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.TierList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BoxButtonLrgInactiveDiag:close()
		self.BoxButtonLrgInactive:close()
		self.BoxButtonLrgIdle:close()
		self.cacButtonBoxLrgInactiveStroke0:close()
		self.lockedIcon:close()
		self.ProgressBarBorder:close()
		self.TierList:close()
		self.BoxButtonLrgInactiveDiag0:close()
		self.EmblemName:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

