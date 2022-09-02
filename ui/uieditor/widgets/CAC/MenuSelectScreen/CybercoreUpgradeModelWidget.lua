-- 88c90439151f3574c703b7f7babc98f1
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.CAC.SystemOverloardHeader" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.CAC.cac_lock" )
require( "ui.uieditor.widgets.AbilityWheel.AbilityWheel_ColorPanel" )

CoD.CybercoreUpgradeModelWidget = InheritFrom( LUI.UIElement )
CoD.CybercoreUpgradeModelWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CybercoreUpgradeModelWidget )
	self.id = "CybercoreUpgradeModelWidget"
	self.soundSet = "CAC_LethalGrenade"
	self:setLeftRight( true, false, 0, 120 )
	self:setTopBottom( true, false, 0, 120 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgIdle0 = LUI.UIImage.new()
	BoxButtonLrgIdle0:setLeftRight( true, true, 0, 0 )
	BoxButtonLrgIdle0:setTopBottom( true, true, 0, 0 )
	BoxButtonLrgIdle0:setAlpha( 0.8 )
	BoxButtonLrgIdle0:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrgidlefull" ) )
	BoxButtonLrgIdle0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	BoxButtonLrgIdle0:setShaderVector( 0, 0.12, 0.12, 0, 0 )
	self:addElement( BoxButtonLrgIdle0 )
	self.BoxButtonLrgIdle0 = BoxButtonLrgIdle0
	
	local Outline = LUI.UIImage.new()
	Outline:setLeftRight( true, false, 2.38, 118.46 )
	Outline:setTopBottom( true, false, 3.96, 117.04 )
	Outline:setAlpha( 0 )
	Outline:setImage( RegisterImage( "uie_cp_outline_upgrade" ) )
	self:addElement( Outline )
	self.Outline = Outline
	
	local BoxButtonLrgInactive = LUI.UIImage.new()
	BoxButtonLrgInactive:setLeftRight( true, true, -0.62, 0 )
	BoxButtonLrgInactive:setTopBottom( true, true, 0, 0 )
	BoxButtonLrgInactive:setAlpha( 0 )
	BoxButtonLrgInactive:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrginactivefull" ) )
	BoxButtonLrgInactive:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	BoxButtonLrgInactive:setShaderVector( 0, 0.12, 0.12, 0, 0 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local abilityImage = LUI.UIImage.new()
	abilityImage:setLeftRight( true, true, 4.37, -31.63 )
	abilityImage:setTopBottom( true, true, 8, -32 )
	abilityImage:setAlpha( 0.85 )
	abilityImage:setupUIStreamedImage( 0 )
	abilityImage:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			abilityImage:setImage( RegisterImage( image ) )
		end
	end )
	self:addElement( abilityImage )
	self.abilityImage = abilityImage
	
	local debugImage = LUI.UIImage.new()
	debugImage:setLeftRight( false, false, -10, 10 )
	debugImage:setTopBottom( false, false, -10, 10 )
	debugImage:setRGB( 0, 1, 0 )
	debugImage:setAlpha( 0 )
	self:addElement( debugImage )
	self.debugImage = debugImage
	
	local LineLeft0 = LUI.UIImage.new()
	LineLeft0:setLeftRight( true, true, 47, 16.92 )
	LineLeft0:setTopBottom( false, true, -74.85, -70.85 )
	LineLeft0:setAlpha( 0.55 )
	LineLeft0:setZRot( 90 )
	LineLeft0:setImage( RegisterImage( "uie_t7_menu_frontend_featuredframeum" ) )
	LineLeft0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineLeft0 )
	self.LineLeft0 = LineLeft0
	
	local BlackBox = LUI.UIImage.new()
	BlackBox:setLeftRight( true, true, 3, -3 )
	BlackBox:setTopBottom( false, true, -28, -2 )
	BlackBox:setRGB( 0.06, 0.03, 0.03 )
	BlackBox:setAlpha( 0.8 )
	self:addElement( BlackBox )
	self.BlackBox = BlackBox
	
	local AbilityName = LUI.UIText.new()
	AbilityName:setLeftRight( true, true, 8, -4 )
	AbilityName:setTopBottom( false, true, -23, -7 )
	AbilityName:setScale( 1 )
	AbilityName:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	AbilityName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	AbilityName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	AbilityName:linkToElementModel( self, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			AbilityName:setText( Engine.Localize( AppendStringIfRefExists( "_SHORT_NAME", name ) ) )
		end
	end )
	self:addElement( AbilityName )
	self.AbilityName = AbilityName
	
	local BoxButtonLrgInactiveDiag = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgInactiveDiag:setTopBottom( true, true, -2, 2 )
	BoxButtonLrgInactiveDiag:setAlpha( 0 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	local Selected = LUI.UIImage.new()
	Selected:setLeftRight( true, false, -24.19, 140.92 )
	Selected:setTopBottom( true, false, -21.11, 144 )
	Selected:setAlpha( 0 )
	Selected:setImage( RegisterImage( "uie_cp_outline_upgrade" ) )
	Selected:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_fractal" ) )
	Selected:setShaderVector( 0, 1.51, 0, 0, 0 )
	self:addElement( Selected )
	self.Selected = Selected
	
	local TokenImage0 = LUI.UIImage.new()
	TokenImage0:setLeftRight( true, false, 5, 27 )
	TokenImage0:setTopBottom( false, true, -52, -30 )
	TokenImage0:setImage( RegisterImage( "uie_img_t7_menu_cacselection_icontokenlarge_cp" ) )
	TokenImage0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TokenImage0 )
	self.TokenImage0 = TokenImage0
	
	local SystemOverloardHeader = CoD.SystemOverloardHeader.new( menu, controller )
	SystemOverloardHeader:setLeftRight( true, true, 3.13, -4.25 )
	SystemOverloardHeader:setTopBottom( true, true, 7, -98 )
	SystemOverloardHeader:setAlpha( 0 )
	self:addElement( SystemOverloardHeader )
	self.SystemOverloardHeader = SystemOverloardHeader
	
	local TitleImagebacking = LUI.UIImage.new()
	TitleImagebacking:setLeftRight( true, false, 2.38, 117.16 )
	TitleImagebacking:setTopBottom( true, false, 3, 26 )
	TitleImagebacking:setRGB( 0.03, 0.02, 0.02 )
	TitleImagebacking:setAlpha( 0 )
	self:addElement( TitleImagebacking )
	self.TitleImagebacking = TitleImagebacking
	
	local TokenImage = LUI.UIImage.new()
	TokenImage:setLeftRight( false, true, -26, -4 )
	TokenImage:setTopBottom( false, true, -52, -30 )
	TokenImage:setImage( RegisterImage( "uie_img_t7_menu_cacselection_icontokenlarge_cp" ) )
	TokenImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TokenImage )
	self.TokenImage = TokenImage
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, -1.12, 1 )
	FocusBarB:setTopBottom( true, false, 118.31, 123 )
	FocusBarB:setAlpha( 0 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, -1.12, 2 )
	FocusBarT:setTopBottom( true, false, -2.19, 0 )
	FocusBarT:setAlpha( 0 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local EquippedIcon = LUI.UIImage.new()
	EquippedIcon:setLeftRight( false, true, -25.75, -4.25 )
	EquippedIcon:setTopBottom( true, false, 6.96, 28.46 )
	EquippedIcon:setRGB( 0.5, 0.5, 0.5 )
	EquippedIcon:setAlpha( 0.5 )
	EquippedIcon:setScale( 0.8 )
	EquippedIcon:setImage( RegisterImage( "uie_t7_hud_cac_equipped_16" ) )
	self:addElement( EquippedIcon )
	self.EquippedIcon = EquippedIcon
	
	local lockedIcon = CoD.cac_lock.new( menu, controller )
	lockedIcon:setLeftRight( false, false, -24, 24 )
	lockedIcon:setTopBottom( false, false, -34.54, 21 )
	lockedIcon:setAlpha( 0 )
	lockedIcon.lockedIcon:setAlpha( 0 )
	self:addElement( lockedIcon )
	self.lockedIcon = lockedIcon
	
	local PanelGlow = LUI.UIImage.new()
	PanelGlow:setLeftRight( true, false, 6, 90 )
	PanelGlow:setTopBottom( true, false, 4, 84 )
	PanelGlow:setRGB( 0.97, 0.36, 0.07 )
	PanelGlow:setAlpha( 0 )
	PanelGlow:setScale( 0.9 )
	PanelGlow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	PanelGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( PanelGlow )
	self.PanelGlow = PanelGlow
	
	local AbilityWheelColorPanel0 = CoD.AbilityWheel_ColorPanel.new( menu, controller )
	AbilityWheelColorPanel0:setLeftRight( true, true, 0, 0 )
	AbilityWheelColorPanel0:setTopBottom( true, true, 0, 0 )
	AbilityWheelColorPanel0:setAlpha( 0.85 )
	AbilityWheelColorPanel0:linkToElementModel( self, nil, false, function ( model )
		AbilityWheelColorPanel0:setModel( model, controller )
	end )
	AbilityWheelColorPanel0:mergeStateConditions( {
		{
			stateName = "ControlCore",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "core", "cybercore_control" )
			end
		},
		{
			stateName = "MartialCore",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "core", "cybercore_martial" )
			end
		},
		{
			stateName = "ChaosCore",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "core", "cybercore_chaos" )
			end
		}
	} )
	AbilityWheelColorPanel0:linkToElementModel( AbilityWheelColorPanel0, "core", true, function ( model )
		menu:updateElementState( AbilityWheelColorPanel0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "core"
		} )
	end )
	self:addElement( AbilityWheelColorPanel0 )
	self.AbilityWheelColorPanel0 = AbilityWheelColorPanel0
	
	local UpgradedIndicator = LUI.UIImage.new()
	UpgradedIndicator:setLeftRight( true, false, 96, 114 )
	UpgradedIndicator:setTopBottom( true, false, 8, 26 )
	UpgradedIndicator:setAlpha( 0.5 )
	UpgradedIndicator:setImage( RegisterImage( "uie_t7_cac_cp_upgrade0_icon" ) )
	self:addElement( UpgradedIndicator )
	self.UpgradedIndicator = UpgradedIndicator
	
	local UpgradableIcon = LUI.UIImage.new()
	UpgradableIcon:setLeftRight( true, false, 95.5, 114 )
	UpgradableIcon:setTopBottom( true, false, 8, 26 )
	UpgradableIcon:setAlpha( 0 )
	UpgradableIcon:setImage( RegisterImage( "uie_t7_cac_cp_upgrade_icon" ) )
	self:addElement( UpgradableIcon )
	self.UpgradableIcon = UpgradableIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 17 )

				Outline:completeAnimation()
				self.Outline:setAlpha( 0 )
				self.clipFinished( Outline, {} )

				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactive, {} )

				abilityImage:completeAnimation()
				self.abilityImage:setAlpha( 0.85 )
				self.clipFinished( abilityImage, {} )

				debugImage:completeAnimation()
				self.debugImage:setRGB( 1, 1, 1 )
				self.clipFinished( debugImage, {} )

				Selected:completeAnimation()
				self.Selected:setAlpha( 0 )
				self.clipFinished( Selected, {} )

				TokenImage0:completeAnimation()
				self.TokenImage0:setAlpha( 0 )
				self.clipFinished( TokenImage0, {} )

				SystemOverloardHeader:completeAnimation()
				self.SystemOverloardHeader:setRGB( 1, 1, 1 )
				self.SystemOverloardHeader:setAlpha( 0 )
				self.clipFinished( SystemOverloardHeader, {} )

				TitleImagebacking:completeAnimation()
				self.TitleImagebacking:setAlpha( 0 )
				self.clipFinished( TitleImagebacking, {} )

				TokenImage:completeAnimation()
				self.TokenImage:setAlpha( 0 )
				self.clipFinished( TokenImage, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )

				EquippedIcon:completeAnimation()
				self.EquippedIcon:setAlpha( 0 )
				self.clipFinished( EquippedIcon, {} )

				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )

				PanelGlow:completeAnimation()
				self.PanelGlow:setAlpha( 0 )
				self.clipFinished( PanelGlow, {} )

				AbilityWheelColorPanel0:completeAnimation()
				self.AbilityWheelColorPanel0:setAlpha( 0 )
				self.clipFinished( AbilityWheelColorPanel0, {} )

				UpgradedIndicator:completeAnimation()
				self.UpgradedIndicator:setAlpha( 0 )
				self.clipFinished( UpgradedIndicator, {} )

				UpgradableIcon:completeAnimation()
				self.UpgradableIcon:setLeftRight( true, false, -169.23, -41.23 )
				self.UpgradableIcon:setTopBottom( true, false, -76, 52 )
				self.clipFinished( UpgradableIcon, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 13 )

				Outline:completeAnimation()
				self.Outline:setAlpha( 0 )
				self.clipFinished( Outline, {} )

				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactive, {} )

				abilityImage:completeAnimation()
				self.abilityImage:setAlpha( 0.82 )
				self.clipFinished( abilityImage, {} )

				Selected:completeAnimation()
				self.Selected:setAlpha( 0 )
				self.clipFinished( Selected, {} )

				TokenImage0:completeAnimation()
				self.TokenImage0:setAlpha( 0 )
				self.clipFinished( TokenImage0, {} )

				SystemOverloardHeader:completeAnimation()
				self.SystemOverloardHeader:setAlpha( 0 )
				self.clipFinished( SystemOverloardHeader, {} )

				TitleImagebacking:completeAnimation()
				self.TitleImagebacking:setAlpha( 0 )
				self.clipFinished( TitleImagebacking, {} )

				TokenImage:completeAnimation()
				self.TokenImage:setAlpha( 0 )
				self.clipFinished( TokenImage, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, true, -3.12, 2 )
				self.FocusBarB:setTopBottom( true, false, 119.31, 124 )
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					if not event.interrupted then
						FocusBarT:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
					end
					FocusBarT:setLeftRight( true, true, -1.12, 1 )
					FocusBarT:setTopBottom( true, false, -2.19, 0 )
					FocusBarT:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBarT, event )
					else
						FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, true, -1.12, 1 )
				self.FocusBarT:setTopBottom( true, false, -2.19, 0 )
				self.FocusBarT:setAlpha( 1 )
				FocusBarTFrame2( FocusBarT, {} )

				EquippedIcon:completeAnimation()
				self.EquippedIcon:setAlpha( 0 )
				self.clipFinished( EquippedIcon, {} )

				PanelGlow:completeAnimation()
				self.PanelGlow:setLeftRight( true, false, 3.13, 121.59 )
				self.PanelGlow:setTopBottom( true, false, 0, 120 )
				self.PanelGlow:setAlpha( 0 )
				self.clipFinished( PanelGlow, {} )
				local AbilityWheelColorPanel0Frame2 = function ( AbilityWheelColorPanel0, event )
					local AbilityWheelColorPanel0Frame3 = function ( AbilityWheelColorPanel0, event )
						if not event.interrupted then
							AbilityWheelColorPanel0:beginAnimation( "keyframe", 559, false, false, CoD.TweenType.Linear )
						end
						AbilityWheelColorPanel0:setAlpha( 0.8 )
						if event.interrupted then
							self.clipFinished( AbilityWheelColorPanel0, event )
						else
							AbilityWheelColorPanel0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						AbilityWheelColorPanel0Frame3( AbilityWheelColorPanel0, event )
						return 
					else
						AbilityWheelColorPanel0:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
						AbilityWheelColorPanel0:setAlpha( 1 )
						AbilityWheelColorPanel0:registerEventHandler( "transition_complete_keyframe", AbilityWheelColorPanel0Frame3 )
					end
				end
				
				AbilityWheelColorPanel0:completeAnimation()
				self.AbilityWheelColorPanel0:setAlpha( 0 )
				AbilityWheelColorPanel0Frame2( AbilityWheelColorPanel0, {} )
			end
		},
		Unavailable = {
			DefaultClip = function ()
				self:setupElementClipCounter( 19 )

				Outline:completeAnimation()
				self.Outline:setLeftRight( true, false, 2.38, 118.46 )
				self.Outline:setTopBottom( true, false, 3.96, 130.04 )
				self.Outline:setAlpha( 0 )
				self.clipFinished( Outline, {} )

				abilityImage:completeAnimation()
				self.abilityImage:setAlpha( 0 )
				self.clipFinished( abilityImage, {} )

				debugImage:completeAnimation()
				self.debugImage:setRGB( 0, 0, 0 )
				self.clipFinished( debugImage, {} )

				LineLeft0:completeAnimation()
				self.LineLeft0:setAlpha( 0 )
				self.clipFinished( LineLeft0, {} )

				AbilityName:completeAnimation()
				self.AbilityName:setAlpha( 0.5 )
				self.clipFinished( AbilityName, {} )

				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )

				Selected:completeAnimation()
				self.Selected:setLeftRight( true, false, -25.19, 141 )
				self.Selected:setTopBottom( true, false, -21.19, 145 )
				self.Selected:setAlpha( 0 )
				self.clipFinished( Selected, {} )

				TokenImage0:completeAnimation()
				self.TokenImage0:setAlpha( 0 )
				self.clipFinished( TokenImage0, {} )

				SystemOverloardHeader:completeAnimation()
				self.SystemOverloardHeader:setAlpha( 0 )
				self.clipFinished( SystemOverloardHeader, {} )

				TitleImagebacking:completeAnimation()
				self.TitleImagebacking:setAlpha( 0 )
				self.clipFinished( TitleImagebacking, {} )

				TokenImage:completeAnimation()
				self.TokenImage:setAlpha( 0 )
				self.clipFinished( TokenImage, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )

				EquippedIcon:completeAnimation()
				self.EquippedIcon:setAlpha( 0 )
				self.clipFinished( EquippedIcon, {} )

				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0.82 )
				self.clipFinished( lockedIcon, {} )

				PanelGlow:completeAnimation()
				self.PanelGlow:setAlpha( 0 )
				self.clipFinished( PanelGlow, {} )

				AbilityWheelColorPanel0:completeAnimation()
				self.AbilityWheelColorPanel0:setAlpha( 0 )
				self.clipFinished( AbilityWheelColorPanel0, {} )

				UpgradedIndicator:completeAnimation()
				self.UpgradedIndicator:setAlpha( 0 )
				self.clipFinished( UpgradedIndicator, {} )

				UpgradableIcon:completeAnimation()
				self.UpgradableIcon:setAlpha( 0 )
				self.clipFinished( UpgradableIcon, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 15 )

				abilityImage:completeAnimation()
				self.abilityImage:setAlpha( 0 )
				self.clipFinished( abilityImage, {} )

				debugImage:completeAnimation()
				self.debugImage:setRGB( 0, 0, 0 )
				self.clipFinished( debugImage, {} )

				AbilityName:completeAnimation()
				self.AbilityName:setAlpha( 0.5 )
				self.clipFinished( AbilityName, {} )

				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )

				Selected:completeAnimation()
				self.Selected:setAlpha( 0 )
				self.clipFinished( Selected, {} )

				TokenImage0:completeAnimation()
				self.TokenImage0:setAlpha( 0 )
				self.clipFinished( TokenImage0, {} )

				SystemOverloardHeader:completeAnimation()
				self.SystemOverloardHeader:setAlpha( 0 )
				self.clipFinished( SystemOverloardHeader, {} )

				TitleImagebacking:completeAnimation()
				self.TitleImagebacking:setAlpha( 0 )
				self.clipFinished( TitleImagebacking, {} )

				TokenImage:completeAnimation()
				self.TokenImage:setAlpha( 0 )
				self.clipFinished( TokenImage, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, true, -2.12, 3 )
				self.FocusBarB:setTopBottom( true, false, 120.31, 125 )
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )

				EquippedIcon:completeAnimation()
				self.EquippedIcon:setAlpha( 0 )
				self.clipFinished( EquippedIcon, {} )

				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 1 )
				self.clipFinished( lockedIcon, {} )

				AbilityWheelColorPanel0:completeAnimation()
				self.AbilityWheelColorPanel0:setAlpha( 0 )
				self.clipFinished( AbilityWheelColorPanel0, {} )

				UpgradableIcon:completeAnimation()
				self.UpgradableIcon:setAlpha( 0 )
				self.clipFinished( UpgradableIcon, {} )
			end
		},
		Purchasable = {
			DefaultClip = function ()
				self:setupElementClipCounter( 20 )

				Outline:completeAnimation()
				self.Outline:setAlpha( 0 )
				self.clipFinished( Outline, {} )

				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactive, {} )

				abilityImage:completeAnimation()
				self.abilityImage:setAlpha( 0.85 )
				self.clipFinished( abilityImage, {} )

				debugImage:completeAnimation()
				self.debugImage:setRGB( 0, 1, 0 )
				self.debugImage:setAlpha( 0 )
				self.clipFinished( debugImage, {} )

				LineLeft0:completeAnimation()
				self.LineLeft0:setAlpha( 0.55 )
				self.clipFinished( LineLeft0, {} )

				AbilityName:completeAnimation()
				self.AbilityName:setAlpha( 1 )
				self.clipFinished( AbilityName, {} )

				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )

				Selected:completeAnimation()
				self.Selected:setAlpha( 0 )
				self.clipFinished( Selected, {} )

				TokenImage0:completeAnimation()
				self.TokenImage0:setAlpha( 1 )
				self.clipFinished( TokenImage0, {} )

				SystemOverloardHeader:completeAnimation()
				self.SystemOverloardHeader:setAlpha( 0 )
				self.clipFinished( SystemOverloardHeader, {} )

				TitleImagebacking:completeAnimation()
				self.TitleImagebacking:setAlpha( 0 )
				self.clipFinished( TitleImagebacking, {} )

				TokenImage:completeAnimation()
				self.TokenImage:setAlpha( 0 )
				self.clipFinished( TokenImage, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )

				EquippedIcon:completeAnimation()
				self.EquippedIcon:setRGB( 0.5, 0.5, 0.5 )
				self.EquippedIcon:setAlpha( 0 )
				self.clipFinished( EquippedIcon, {} )

				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )

				PanelGlow:completeAnimation()
				self.PanelGlow:setAlpha( 0 )
				self.clipFinished( PanelGlow, {} )

				AbilityWheelColorPanel0:completeAnimation()
				self.AbilityWheelColorPanel0:setAlpha( 0 )
				self.clipFinished( AbilityWheelColorPanel0, {} )

				UpgradedIndicator:completeAnimation()
				self.UpgradedIndicator:setAlpha( 0 )
				self.clipFinished( UpgradedIndicator, {} )

				UpgradableIcon:completeAnimation()
				self.UpgradableIcon:setAlpha( 0 )
				self.clipFinished( UpgradableIcon, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 15 )

				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactive, {} )

				abilityImage:completeAnimation()
				self.abilityImage:setAlpha( 0.82 )
				self.clipFinished( abilityImage, {} )

				debugImage:completeAnimation()
				self.debugImage:setRGB( 0, 1, 0 )
				self.clipFinished( debugImage, {} )

				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )

				Selected:completeAnimation()
				self.Selected:setAlpha( 0 )
				self.clipFinished( Selected, {} )

				TokenImage0:completeAnimation()
				self.TokenImage0:setAlpha( 1 )
				self.clipFinished( TokenImage0, {} )

				SystemOverloardHeader:completeAnimation()
				self.SystemOverloardHeader:setAlpha( 0 )
				self.clipFinished( SystemOverloardHeader, {} )

				TitleImagebacking:completeAnimation()
				self.TitleImagebacking:setAlpha( 0 )
				self.clipFinished( TitleImagebacking, {} )

				TokenImage:completeAnimation()
				self.TokenImage:setAlpha( 0 )
				self.clipFinished( TokenImage, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )

				EquippedIcon:completeAnimation()
				self.EquippedIcon:setRGB( 0.5, 0.5, 0.5 )
				self.EquippedIcon:setAlpha( 0 )
				self.clipFinished( EquippedIcon, {} )

				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )

				AbilityWheelColorPanel0:completeAnimation()
				self.AbilityWheelColorPanel0:setAlpha( 0 )
				self.clipFinished( AbilityWheelColorPanel0, {} )

				UpgradableIcon:completeAnimation()
				self.UpgradableIcon:setAlpha( 0 )
				self.clipFinished( UpgradableIcon, {} )
			end
		},
		Upgradable = {
			DefaultClip = function ()
				self:setupElementClipCounter( 19 )

				Outline:completeAnimation()
				self.Outline:setLeftRight( true, false, 2.38, 118.46 )
				self.Outline:setTopBottom( true, false, 3.96, 117.04 )
				self.clipFinished( Outline, {} )

				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactive, {} )

				abilityImage:completeAnimation()
				self.abilityImage:setAlpha( 0.85 )
				self.clipFinished( abilityImage, {} )

				debugImage:completeAnimation()
				self.debugImage:setRGB( 0, 0, 1 )
				self.debugImage:setAlpha( 0 )
				self.clipFinished( debugImage, {} )

				LineLeft0:completeAnimation()
				self.LineLeft0:setAlpha( 0.55 )
				self.clipFinished( LineLeft0, {} )

				AbilityName:completeAnimation()
				self.AbilityName:setAlpha( 1 )
				self.clipFinished( AbilityName, {} )

				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )

				Selected:completeAnimation()
				self.Selected:setLeftRight( true, false, -24.19, 140.92 )
				self.Selected:setTopBottom( true, false, -21.11, 144 )
				self.Selected:setAlpha( 0 )
				self.Selected:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_fractal" ) )
				self.Selected:setShaderVector( 0, 1.51, 0, 0, 0 )
				self.clipFinished( Selected, {} )

				TokenImage0:completeAnimation()
				self.TokenImage0:setAlpha( 0 )
				self.clipFinished( TokenImage0, {} )

				SystemOverloardHeader:completeAnimation()
				self.SystemOverloardHeader:setAlpha( 0 )
				self.clipFinished( SystemOverloardHeader, {} )

				TitleImagebacking:completeAnimation()
				self.TitleImagebacking:setRGB( 0.03, 0.02, 0.02 )
				self.TitleImagebacking:setAlpha( 0 )
				self.clipFinished( TitleImagebacking, {} )

				TokenImage:completeAnimation()
				self.TokenImage:setAlpha( 1 )
				self.clipFinished( TokenImage, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )

				EquippedIcon:completeAnimation()
				self.EquippedIcon:setRGB( 0.5, 0.5, 0.5 )
				self.EquippedIcon:setAlpha( 0 )
				self.clipFinished( EquippedIcon, {} )

				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )

				AbilityWheelColorPanel0:completeAnimation()
				self.AbilityWheelColorPanel0:setAlpha( 0.7 )
				self.clipFinished( AbilityWheelColorPanel0, {} )

				UpgradedIndicator:completeAnimation()
				self.UpgradedIndicator:setAlpha( 1 )
				self.clipFinished( UpgradedIndicator, {} )

				UpgradableIcon:completeAnimation()
				self.UpgradableIcon:setAlpha( 0 )
				self.clipFinished( UpgradableIcon, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 16 )

				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactive, {} )

				abilityImage:completeAnimation()
				self.abilityImage:setAlpha( 0.8 )
				self.clipFinished( abilityImage, {} )

				debugImage:completeAnimation()
				self.debugImage:setRGB( 0, 0, 1 )
				self.debugImage:setAlpha( 0 )
				self.clipFinished( debugImage, {} )

				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )

				Selected:completeAnimation()
				self.Selected:setAlpha( 0 )
				self.clipFinished( Selected, {} )

				TokenImage0:completeAnimation()
				self.TokenImage0:setAlpha( 0 )
				self.clipFinished( TokenImage0, {} )

				SystemOverloardHeader:completeAnimation()
				self.SystemOverloardHeader:setAlpha( 0 )
				self.clipFinished( SystemOverloardHeader, {} )

				TitleImagebacking:completeAnimation()
				self.TitleImagebacking:setAlpha( 0 )
				self.clipFinished( TitleImagebacking, {} )

				TokenImage:completeAnimation()
				self.TokenImage:setAlpha( 1 )
				self.clipFinished( TokenImage, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )

				EquippedIcon:completeAnimation()
				self.EquippedIcon:setRGB( 0.5, 0.5, 0.5 )
				self.EquippedIcon:setAlpha( 0 )
				self.clipFinished( EquippedIcon, {} )

				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )

				AbilityWheelColorPanel0:completeAnimation()
				self.AbilityWheelColorPanel0:setAlpha( 0.5 )
				self.clipFinished( AbilityWheelColorPanel0, {} )

				UpgradedIndicator:completeAnimation()
				self.UpgradedIndicator:setAlpha( 1 )
				self.clipFinished( UpgradedIndicator, {} )

				UpgradableIcon:completeAnimation()
				self.UpgradableIcon:setAlpha( 0 )
				self.clipFinished( UpgradableIcon, {} )
			end
		},
		Upgraded = {
			DefaultClip = function ()
				self:setupElementClipCounter( 18 )

				Outline:completeAnimation()
				self.Outline:setLeftRight( true, false, 2.34, 118.42 )
				self.Outline:setTopBottom( true, false, 3.96, 118 )
				self.Outline:setAlpha( 0 )
				self.clipFinished( Outline, {} )

				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactive, {} )

				abilityImage:completeAnimation()
				self.abilityImage:setAlpha( 0.85 )
				self.clipFinished( abilityImage, {} )

				debugImage:completeAnimation()
				self.debugImage:setRGB( 1, 0, 0 )
				self.clipFinished( debugImage, {} )

				LineLeft0:completeAnimation()
				self.LineLeft0:setAlpha( 0.55 )
				self.clipFinished( LineLeft0, {} )

				AbilityName:completeAnimation()
				self.AbilityName:setAlpha( 1 )
				self.clipFinished( AbilityName, {} )

				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )

				Selected:completeAnimation()
				self.Selected:setAlpha( 0 )
				self.Selected:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_fractal" ) )
				self.Selected:setShaderVector( 0, 1.51, 0, 0, 0 )
				self.clipFinished( Selected, {} )

				TokenImage0:completeAnimation()
				self.TokenImage0:setAlpha( 0 )
				self.clipFinished( TokenImage0, {} )

				TitleImagebacking:completeAnimation()
				self.TitleImagebacking:setAlpha( 0 )
				self.clipFinished( TitleImagebacking, {} )

				TokenImage:completeAnimation()
				self.TokenImage:setAlpha( 0 )
				self.clipFinished( TokenImage, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )

				EquippedIcon:completeAnimation()
				self.EquippedIcon:setRGB( 0.55, 0.77, 0.25 )
				self.EquippedIcon:setAlpha( 0 )
				self.clipFinished( EquippedIcon, {} )

				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )

				AbilityWheelColorPanel0:completeAnimation()
				self.AbilityWheelColorPanel0:setAlpha( 0.7 )
				self.clipFinished( AbilityWheelColorPanel0, {} )

				UpgradedIndicator:completeAnimation()
				self.UpgradedIndicator:setAlpha( 0 )
				self.clipFinished( UpgradedIndicator, {} )

				UpgradableIcon:completeAnimation()
				self.UpgradableIcon:setAlpha( 1 )
				self.clipFinished( UpgradableIcon, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 17 )

				Outline:completeAnimation()
				self.Outline:setLeftRight( true, false, 2.38, 118.46 )
				self.Outline:setTopBottom( true, false, 3.96, 118 )
				self.Outline:setAlpha( 0 )
				self.clipFinished( Outline, {} )

				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactive, {} )

				abilityImage:completeAnimation()
				self.abilityImage:setAlpha( 0.8 )
				self.clipFinished( abilityImage, {} )

				debugImage:completeAnimation()
				self.debugImage:setRGB( 1, 0, 0 )
				self.clipFinished( debugImage, {} )

				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )

				Selected:completeAnimation()
				self.Selected:setLeftRight( true, false, -26.72, 141.47 )
				self.Selected:setTopBottom( true, false, -22.19, 144 )
				self.Selected:setAlpha( 0 )
				self.Selected:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_fractal" ) )
				self.Selected:setShaderVector( 0, 1.51, 0, 0, 0 )
				self.clipFinished( Selected, {} )

				TokenImage0:completeAnimation()
				self.TokenImage0:setAlpha( 0 )
				self.clipFinished( TokenImage0, {} )

				SystemOverloardHeader:completeAnimation()
				self.SystemOverloardHeader:setAlpha( 0 )
				self.clipFinished( SystemOverloardHeader, {} )

				TitleImagebacking:completeAnimation()
				self.TitleImagebacking:setAlpha( 0 )
				self.clipFinished( TitleImagebacking, {} )

				TokenImage:completeAnimation()
				self.TokenImage:setAlpha( 0 )
				self.clipFinished( TokenImage, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.FocusBarB:setZoom( 0 )
				self.clipFinished( FocusBarB, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )

				EquippedIcon:completeAnimation()
				self.EquippedIcon:setRGB( 0.55, 0.77, 0.25 )
				self.EquippedIcon:setAlpha( 0 )
				self.clipFinished( EquippedIcon, {} )

				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )

				AbilityWheelColorPanel0:completeAnimation()
				self.AbilityWheelColorPanel0:setAlpha( 0.5 )
				self.clipFinished( AbilityWheelColorPanel0, {} )

				UpgradedIndicator:completeAnimation()
				self.UpgradedIndicator:setAlpha( 0 )
				self.clipFinished( UpgradedIndicator, {} )

				UpgradableIcon:completeAnimation()
				self.UpgradableIcon:setAlpha( 1 )
				self.clipFinished( UpgradableIcon, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 12 )

				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )

				Selected:completeAnimation()
				self.Selected:setLeftRight( true, false, -25.19, 141 )
				self.Selected:setTopBottom( true, false, -22.19, 144 )
				self.Selected:setAlpha( 0 )
				self.clipFinished( Selected, {} )

				TokenImage0:completeAnimation()
				self.TokenImage0:setAlpha( 0 )
				self.clipFinished( TokenImage0, {} )

				SystemOverloardHeader:completeAnimation()
				self.SystemOverloardHeader:setAlpha( 0 )
				self.clipFinished( SystemOverloardHeader, {} )

				TitleImagebacking:completeAnimation()
				self.TitleImagebacking:setAlpha( 0 )
				self.clipFinished( TitleImagebacking, {} )

				TokenImage:completeAnimation()
				self.TokenImage:setAlpha( 0 )
				self.clipFinished( TokenImage, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )

				EquippedIcon:completeAnimation()
				self.EquippedIcon:setRGB( 0.55, 0.77, 0.25 )
				self.EquippedIcon:setAlpha( 0 )
				self.clipFinished( EquippedIcon, {} )

				AbilityWheelColorPanel0:completeAnimation()
				self.AbilityWheelColorPanel0:setAlpha( 0.7 )
				self.clipFinished( AbilityWheelColorPanel0, {} )

				UpgradedIndicator:completeAnimation()
				self.UpgradedIndicator:setAlpha( 0 )
				self.clipFinished( UpgradedIndicator, {} )

				UpgradableIcon:completeAnimation()
				self.UpgradableIcon:setAlpha( 1 )
				self.clipFinished( UpgradableIcon, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Unavailable",
			condition = function ( menu, element, event )
				return not IsCybercoreAbilityAvailable( element, controller )
			end
		},
		{
			stateName = "Purchasable",
			condition = function ( menu, element, event )
				return IsCybercoreAbilityPurchasable( element, controller )
			end
		},
		{
			stateName = "Upgradable",
			condition = function ( menu, element, event )
				return IsCybercoreAbilityUpgradable( element, controller )
			end
		},
		{
			stateName = "Upgraded",
			condition = function ( menu, element, event )
				return IsCybercoreAbilityUpgraded( element, controller )
			end
		}
	} )
	SystemOverloardHeader.id = "SystemOverloardHeader"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.SystemOverloardHeader:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BoxButtonLrgInactiveDiag:close()
		element.SystemOverloardHeader:close()
		element.FocusBarB:close()
		element.FocusBarT:close()
		element.lockedIcon:close()
		element.AbilityWheelColorPanel0:close()
		element.abilityImage:close()
		element.AbilityName:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

