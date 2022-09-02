-- c799b7c89273d24ec4d43516aa467141
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.Challenges.Challenges_PercentCompleteWidget_MD" )
require( "ui.uieditor.widgets.CallingCards.CallingCards_FrameWidget" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.CAC.cac_lock" )
require( "ui.uieditor.widgets.Challenges.Challenges_Title" )

CoD.Challenges_OneHundredPercentWidget = InheritFrom( LUI.UIElement )
CoD.Challenges_OneHundredPercentWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Challenges_OneHundredPercentWidget )
	self.id = "Challenges_OneHundredPercentWidget"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 591 )
	self:setTopBottom( true, false, 0, 98 )
	self.anyChildUsesUpdateState = true
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( true, true, 0, 0 )
	StartMenuframenoBG0:setTopBottom( true, true, 0, -1 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( false, true, -289.8, -8 )
	BoxButtonLrgInactive:setTopBottom( true, false, 12, 85.5 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local PercentCompleteWidget = CoD.Challenges_PercentCompleteWidget_MD.new( menu, controller )
	PercentCompleteWidget:setLeftRight( true, false, 15, 85 )
	PercentCompleteWidget:setTopBottom( true, false, 14, 84 )
	PercentCompleteWidget.percentCompleteCircle:setAlpha( 1 )
	PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, 0.5, 0, 0, 0 )
	PercentCompleteWidget.percentText:setText( Engine.Localize( "50%" ) )
	self:addElement( PercentCompleteWidget )
	self.PercentCompleteWidget = PercentCompleteWidget
	
	local MasterCallingCardIcon = CoD.CallingCards_FrameWidget.new( menu, controller )
	MasterCallingCardIcon:setLeftRight( false, true, -149, -149 )
	MasterCallingCardIcon:setTopBottom( true, false, 48.5, 48.5 )
	MasterCallingCardIcon.CardIconFrame:setScale( 0.58 )
	MasterCallingCardIcon:subscribeToGlobalModel( controller, "OneHundredPercentCallingCard", nil, function ( model )
		MasterCallingCardIcon:setModel( model, controller )
	end )
	self:addElement( MasterCallingCardIcon )
	self.MasterCallingCardIcon = MasterCallingCardIcon
	
	local BoxButtonLrgInactiveDiag = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag:setLeftRight( false, true, -290.8, -7 )
	BoxButtonLrgInactiveDiag:setTopBottom( true, false, 12, 85.5 )
	BoxButtonLrgInactiveDiag:setAlpha( 0 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	local TitleBg = LUI.UIImage.new()
	TitleBg:setLeftRight( false, true, -288.8, -9 )
	TitleBg:setTopBottom( true, false, 33.08, 62.98 )
	TitleBg:setRGB( 0, 0, 0 )
	TitleBg:setAlpha( 0.4 )
	TitleBg:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	TitleBg:setShaderVector( 0, 0.02, 0.02, 0.02, 0.02 )
	self:addElement( TitleBg )
	self.TitleBg = TitleBg
	
	local LockedIcon = CoD.cac_lock.new( menu, controller )
	LockedIcon:setLeftRight( false, true, -154.8, -124.35 )
	LockedIcon:setTopBottom( true, false, 33.53, 63.98 )
	self:addElement( LockedIcon )
	self.LockedIcon = LockedIcon
	
	local featlineleft000 = LUI.UIImage.new()
	featlineleft000:setLeftRight( false, true, -148.9, -144.9 )
	featlineleft000:setTopBottom( true, false, -136.48, 203.53 )
	featlineleft000:setAlpha( 0.5 )
	featlineleft000:setZRot( -90 )
	featlineleft000:setScale( 0.85 )
	featlineleft000:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	featlineleft000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( featlineleft000 )
	self.featlineleft000 = featlineleft000
	
	local featlineleft0000 = LUI.UIImage.new()
	featlineleft0000:setLeftRight( false, true, -148.8, -144.8 )
	featlineleft0000:setTopBottom( true, false, -106.43, 233.58 )
	featlineleft0000:setAlpha( 0.5 )
	featlineleft0000:setZRot( -90 )
	featlineleft0000:setScale( 0.85 )
	featlineleft0000:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	featlineleft0000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( featlineleft0000 )
	self.featlineleft0000 = featlineleft0000
	
	local EmblemSubtitle = LUI.UIText.new()
	EmblemSubtitle:setLeftRight( true, false, 94.92, 291.42 )
	EmblemSubtitle:setTopBottom( true, false, 45.58, 65.58 )
	EmblemSubtitle:setText( Engine.Localize( "WEAPON_NULL" ) )
	EmblemSubtitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	EmblemSubtitle:setLetterSpacing( 0.5 )
	EmblemSubtitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	EmblemSubtitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( EmblemSubtitle )
	self.EmblemSubtitle = EmblemSubtitle
	
	local weaponNameLabel = LUI.UITightText.new()
	weaponNameLabel:setLeftRight( true, false, 95.92, 253.12 )
	weaponNameLabel:setTopBottom( true, false, 12, 44 )
	weaponNameLabel:setAlpha( 0.9 )
	weaponNameLabel:setText( Engine.Localize( "CHALLENGE_DARK_OPS_COMPLETED_ALL_CHALLENGES" ) )
	weaponNameLabel:setTTF( "fonts/escom.ttf" )
	weaponNameLabel:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	weaponNameLabel:setShaderVector( 0, 0.06, 0, 0, 0 )
	weaponNameLabel:setShaderVector( 1, 0.02, 0, 0, 0 )
	weaponNameLabel:setShaderVector( 2, 1, 0, 0, 0 )
	weaponNameLabel:setLetterSpacing( 0.6 )
	weaponNameLabel:registerEventHandler( "menu_loaded", function ( element, event )
		local f3_local0 = nil
		SetupAutoHorizontalAlignArabicText( element )
		if not f3_local0 then
			f3_local0 = element:dispatchEventToChildren( event )
		end
		return f3_local0
	end )

	LUI.OverrideFunction_CallOriginalFirst( weaponNameLabel, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 2 )
		SetStateFromText( self, element, "DefaultState", "NoText" )
	end )
	self:addElement( weaponNameLabel )
	self.weaponNameLabel = weaponNameLabel
	
	local ChallengesTitle = CoD.Challenges_Title.new( menu, controller )
	ChallengesTitle:setLeftRight( true, false, 3, 231 )
	ChallengesTitle:setTopBottom( true, false, -34.5, -2.25 )
	ChallengesTitle.weaponNameLabel:setText( Engine.Localize( "MENU_CHALLENGES_COMPLETED_CAPS" ) )
	self:addElement( ChallengesTitle )
	self.ChallengesTitle = ChallengesTitle
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactive, {} )

				MasterCallingCardIcon:completeAnimation()
				self.MasterCallingCardIcon:setAlpha( 1 )
				self.clipFinished( MasterCallingCardIcon, {} )

				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )

				TitleBg:completeAnimation()
				self.TitleBg:setAlpha( 0 )
				self.clipFinished( TitleBg, {} )

				LockedIcon:completeAnimation()
				self.LockedIcon:setAlpha( 0 )
				self.clipFinished( LockedIcon, {} )

				featlineleft000:completeAnimation()
				self.featlineleft000:setAlpha( 0 )
				self.clipFinished( featlineleft000, {} )

				featlineleft0000:completeAnimation()
				self.featlineleft0000:setAlpha( 0 )
				self.clipFinished( featlineleft0000, {} )
			end
		},
		Locked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				MasterCallingCardIcon:completeAnimation()
				self.MasterCallingCardIcon:setAlpha( 0 )
				self.clipFinished( MasterCallingCardIcon, {} )

				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0.2 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )

				TitleBg:completeAnimation()
				self.TitleBg:setAlpha( 0.4 )
				self.clipFinished( TitleBg, {} )

				LockedIcon:completeAnimation()
				self.LockedIcon:setAlpha( 1 )
				self.clipFinished( LockedIcon, {} )

				featlineleft000:completeAnimation()
				self.featlineleft000:setAlpha( 1 )
				self.clipFinished( featlineleft000, {} )

				featlineleft0000:completeAnimation()
				self.featlineleft0000:setAlpha( 1 )
				self.clipFinished( featlineleft0000, {} )

				ChallengesTitle:completeAnimation()
				self.ChallengesTitle:setAlpha( 1 )
				self.clipFinished( ChallengesTitle, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isLocked" )
			end
		}
	} )
	self:linkToElementModel( self, "isLocked", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isLocked"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuframenoBG0:close()
		element.BoxButtonLrgInactive:close()
		element.PercentCompleteWidget:close()
		element.MasterCallingCardIcon:close()
		element.BoxButtonLrgInactiveDiag:close()
		element.LockedIcon:close()
		element.ChallengesTitle:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

