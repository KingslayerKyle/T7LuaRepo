-- d45d303d5755d323f60c45731cdb4e20
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidget_PanelContainer" )
require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidget_BackCircleOutter" )
require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidget_BackCircleInner" )
require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidget_HealthState" )
require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidget_Repair" )
require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidget_BodyIndicator" )
require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidget_EnviroHazardContainer" )
require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidget_Dot" )

CoD.DamageWidget = InheritFrom( LUI.UIElement )
CoD.DamageWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.DamageWidget )
	self.id = "DamageWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 266 )
	self:setTopBottom( true, false, 0, 106 )
	self.anyChildUsesUpdateState = true
	
	local PanelContainer = CoD.DamageWidget_PanelContainer.new( menu, controller )
	PanelContainer:setLeftRight( true, false, 4.83, 97.06 )
	PanelContainer:setTopBottom( true, false, 6.67, 101.34 )
	PanelContainer:setRGB( 0.79, 0.82, 0.85 )
	PanelContainer:setAlpha( 0.4 )
	PanelContainer:setZoom( -10 )
	PanelContainer:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2" ) )
	PanelContainer:setShaderVector( 0, 10, 10, 0, 0 )
	PanelContainer:mergeStateConditions( {
		{
			stateName = "Hess1",
			condition = function ( menu, element, event )
				return HasNumHessActive( controller, 1 )
			end
		},
		{
			stateName = "Hess2",
			condition = function ( menu, element, event )
				return HasNumHessActive( controller, 2 )
			end
		}
	} )
	PanelContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.hess1.type" ), function ( model )
		menu:updateElementState( PanelContainer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.hess1.type"
		} )
	end )
	PanelContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.hess2.type" ), function ( model )
		menu:updateElementState( PanelContainer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.hess2.type"
		} )
	end )
	self:addElement( PanelContainer )
	self.PanelContainer = PanelContainer
	
	local BackGlow = LUI.UIImage.new()
	BackGlow:setLeftRight( false, false, -128.33, -29.49 )
	BackGlow:setTopBottom( false, false, -47.25, 51.58 )
	BackGlow:setRGB( 0, 0, 0 )
	BackGlow:setAlpha( 0.2 )
	BackGlow:setScale( 1.4 )
	BackGlow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	self:addElement( BackGlow )
	self.BackGlow = BackGlow
	
	local UIGlow = LUI.UIImage.new()
	UIGlow:setLeftRight( true, false, -20, 153.33 )
	UIGlow:setTopBottom( true, false, -6.5, 122.83 )
	UIGlow:setAlpha( 0 )
	UIGlow:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_uiglow" ) )
	UIGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( UIGlow )
	self.UIGlow = UIGlow
	
	local BackCircleOutter = CoD.DamageWidget_BackCircleOutter.new( menu, controller )
	BackCircleOutter:setLeftRight( true, false, -2, 105 )
	BackCircleOutter:setTopBottom( true, false, 4.5, 111.5 )
	BackCircleOutter:setAlpha( -0.07 )
	BackCircleOutter:setZoom( 43.2 )
	self:addElement( BackCircleOutter )
	self.BackCircleOutter = BackCircleOutter
	
	local BackCircleInner = CoD.DamageWidget_BackCircleInner.new( menu, controller )
	BackCircleInner:setLeftRight( true, false, 6.17, 101.84 )
	BackCircleInner:setTopBottom( true, false, 8.5, 100.5 )
	BackCircleInner:setAlpha( 0.03 )
	BackCircleInner:setZoom( -18.49 )
	BackCircleInner:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	BackCircleInner:setShaderVector( 0, 0.1, 1, 0, 0 )
	BackCircleInner:setShaderVector( 1, 0, 0, 0, 0 )
	BackCircleInner:setShaderVector( 2, 0, 0, 0, 0 )
	BackCircleInner:setShaderVector( 3, 0, 0, 0, 0 )
	BackCircleInner:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( BackCircleInner )
	self.BackCircleInner = BackCircleInner
	
	local HealthState = CoD.DamageWidget_HealthState.new( menu, controller )
	HealthState:setLeftRight( true, false, 28.84, 76.84 )
	HealthState:setTopBottom( true, false, 25.17, 83.17 )
	HealthState:setAlpha( -0.19 )
	HealthState:setZoom( 47.5 )
	HealthState:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	HealthState:setShaderVector( 0, 0.2, 0, 0, 0 )
	HealthState:setShaderVector( 1, 0, 0, 0, 0 )
	HealthState:setShaderVector( 2, 0, 0, 0, 0 )
	HealthState:setShaderVector( 3, 0, 0, 0, 0 )
	HealthState:setShaderVector( 4, 0, 0, 0, 0 )
	HealthState:mergeStateConditions( {
		{
			stateName = "Normal",
			condition = function ( menu, element, event )
				return IsModelValueGreaterThanOrEqualTo( controller, "hudItems.health", 100 )
			end
		},
		{
			stateName = "Medium",
			condition = function ( menu, element, event )
				return IsModelValueGreaterThanOrEqualTo( controller, "hudItems.health", 65 )
			end
		},
		{
			stateName = "Severe",
			condition = function ( menu, element, event )
				return IsModelValueGreaterThanOrEqualTo( controller, "hudItems.health", 30 )
			end
		},
		{
			stateName = "Critical",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	HealthState:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.health" ), function ( model )
		menu:updateElementState( HealthState, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.health"
		} )
	end )
	self:addElement( HealthState )
	self.HealthState = HealthState
	
	local Repair = CoD.DamageWidget_Repair.new( menu, controller )
	Repair:setLeftRight( true, false, 8.17, 94.17 )
	Repair:setTopBottom( true, false, 5.5, 102.5 )
	Repair:setAlpha( 0 )
	Repair:setZoom( 35 )
	Repair:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Repair:setShaderVector( 0, 0.2, 1, 0, 0 )
	Repair:setShaderVector( 1, 0, 0, 0, 0 )
	Repair:setShaderVector( 2, 0, 0, 0, 0 )
	Repair:setShaderVector( 3, 0, 0, 0, 0 )
	Repair:setShaderVector( 4, 0, 0, 0, 0 )
	Repair:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( Repair )
	self.Repair = Repair
	
	local BodyIndicatorSolid = CoD.DamageWidget_BodyIndicator.new( menu, controller )
	BodyIndicatorSolid:setLeftRight( true, false, 41.17, 63.84 )
	BodyIndicatorSolid:setTopBottom( true, false, 27.17, 78.17 )
	BodyIndicatorSolid:setRGB( 0, 0, 0 )
	BodyIndicatorSolid:setAlpha( 0.07 )
	BodyIndicatorSolid:setZoom( 2 )
	self:addElement( BodyIndicatorSolid )
	self.BodyIndicatorSolid = BodyIndicatorSolid
	
	local BodyIndicator = CoD.DamageWidget_BodyIndicator.new( menu, controller )
	BodyIndicator:setLeftRight( true, false, 41.17, 63.84 )
	BodyIndicator:setTopBottom( true, false, 27.17, 78.17 )
	BodyIndicator:setAlpha( 0.08 )
	BodyIndicator:setZoom( 2 )
	BodyIndicator:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	BodyIndicator:setShaderVector( 0, 0.2, 0, 0, 0 )
	BodyIndicator:setShaderVector( 1, 0, 0, 0, 0 )
	BodyIndicator:setShaderVector( 2, 0, 0, 0, 0 )
	BodyIndicator:setShaderVector( 3, 0, 0, 0, 0 )
	BodyIndicator:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( BodyIndicator )
	self.BodyIndicator = BodyIndicator
	
	local EnviroHazardContainer = CoD.DamageWidget_EnviroHazardContainer.new( menu, controller )
	EnviroHazardContainer:setLeftRight( true, false, 88.84, 222.84 )
	EnviroHazardContainer:setTopBottom( true, false, 14.25, 94.25 )
	EnviroHazardContainer.DamageWidgetSemiCircle0:setAlpha( 0.08 )
	EnviroHazardContainer.AmmoWidgetBackLine:setAlpha( 0.14 )
	EnviroHazardContainer.AmmoWidgetBackLine:setZoom( -17.66 )
	EnviroHazardContainer.AmmoWidgetBackLine0:setAlpha( 0.14 )
	EnviroHazardContainer.AmmoWidgetBackLine0:setZoom( -17.66 )
	EnviroHazardContainer.DamageWidgetArrow0:setAlpha( 0.14 )
	EnviroHazardContainer:mergeStateConditions( {
		{
			stateName = "Hess1",
			condition = function ( menu, element, event )
				return HasNumHessActive( controller, 1 )
			end
		},
		{
			stateName = "Hess2",
			condition = function ( menu, element, event )
				return HasNumHessActive( controller, 2 )
			end
		}
	} )
	EnviroHazardContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.hess1.type" ), function ( model )
		menu:updateElementState( EnviroHazardContainer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.hess1.type"
		} )
	end )
	EnviroHazardContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.hess2.type" ), function ( model )
		menu:updateElementState( EnviroHazardContainer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.hess2.type"
		} )
	end )
	self:addElement( EnviroHazardContainer )
	self.EnviroHazardContainer = EnviroHazardContainer
	
	local Dot1 = CoD.DamageWidget_Dot.new( menu, controller )
	Dot1:setLeftRight( true, false, 5, 9 )
	Dot1:setTopBottom( true, false, 52.92, 56.92 )
	Dot1:setAlpha( 0.02 )
	Dot1:setZoom( 5 )
	Dot1:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Dot1:setShaderVector( 0, 0.2, 1, 0, 0 )
	Dot1:setShaderVector( 1, 0, 0, 0, 0 )
	Dot1:setShaderVector( 2, 0, 0, 0, 0 )
	Dot1:setShaderVector( 3, 0, 0, 0, 0 )
	Dot1:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( Dot1 )
	self.Dot1 = Dot1
	
	local Dot2 = CoD.DamageWidget_Dot.new( menu, controller )
	Dot2:setLeftRight( true, false, 15.57, 19.57 )
	Dot2:setTopBottom( true, false, 48.49, 52.49 )
	Dot2:setAlpha( 0.08 )
	Dot2:setZoom( 5 )
	Dot2:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Dot2:setShaderVector( 0, 0.2, 1, 0, 0 )
	Dot2:setShaderVector( 1, 0, 0, 0, 0 )
	Dot2:setShaderVector( 2, 0, 0, 0, 0 )
	Dot2:setShaderVector( 3, 0, 0, 0, 0 )
	Dot2:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( Dot2 )
	self.Dot2 = Dot2
	
	local Dot3 = CoD.DamageWidget_Dot.new( menu, controller )
	Dot3:setLeftRight( true, false, 6.84, 10.84 )
	Dot3:setTopBottom( true, false, 52.89, 56.89 )
	Dot3:setAlpha( 0.02 )
	Dot3:setZoom( 5 )
	Dot3:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Dot3:setShaderVector( 0, 0.2, 1, 0, 0 )
	Dot3:setShaderVector( 1, 0, 0, 0, 0 )
	Dot3:setShaderVector( 2, 0, 0, 0, 0 )
	Dot3:setShaderVector( 3, 0, 0, 0, 0 )
	Dot3:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( Dot3 )
	self.Dot3 = Dot3
	
	local Dot4 = CoD.DamageWidget_Dot.new( menu, controller )
	Dot4:setLeftRight( true, false, 5, 9 )
	Dot4:setTopBottom( true, false, 57.84, 61.84 )
	Dot4:setAlpha( 0.05 )
	Dot4:setZoom( 5 )
	Dot4:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Dot4:setShaderVector( 0, 0.2, 1, 0, 0 )
	Dot4:setShaderVector( 1, 0, 0, 0, 0 )
	Dot4:setShaderVector( 2, 0, 0, 0, 0 )
	Dot4:setShaderVector( 3, 0, 0, 0, 0 )
	Dot4:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( Dot4 )
	self.Dot4 = Dot4
	
	local Dot5 = CoD.DamageWidget_Dot.new( menu, controller )
	Dot5:setLeftRight( true, false, -16.02, -12.02 )
	Dot5:setTopBottom( true, false, 44.72, 48.72 )
	Dot5:setAlpha( -0.14 )
	Dot5:setZoom( 5 )
	Dot5:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Dot5:setShaderVector( 0, 0.2, 1, 0, 0 )
	Dot5:setShaderVector( 1, 0, 0, 0, 0 )
	Dot5:setShaderVector( 2, 0, 0, 0, 0 )
	Dot5:setShaderVector( 3, 0, 0, 0, 0 )
	Dot5:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( Dot5 )
	self.Dot5 = Dot5
	
	local Dot6 = CoD.DamageWidget_Dot.new( menu, controller )
	Dot6:setLeftRight( true, false, 2.67, 6.67 )
	Dot6:setTopBottom( true, false, 53.97, 57.97 )
	Dot6:setAlpha( 0 )
	Dot6:setZoom( 5 )
	Dot6:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Dot6:setShaderVector( 0, 0.2, 1, 0, 0 )
	Dot6:setShaderVector( 1, 0, 0, 0, 0 )
	Dot6:setShaderVector( 2, 0, 0, 0, 0 )
	Dot6:setShaderVector( 3, 0, 0, 0, 0 )
	Dot6:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( Dot6 )
	self.Dot6 = Dot6
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 16 )

				PanelContainer:completeAnimation()
				self.PanelContainer:setLeftRight( true, false, 4.83, 192.33 )
				self.PanelContainer:setTopBottom( true, false, 6.67, 101.34 )
				self.PanelContainer:setAlpha( 1 )
				self.PanelContainer:setZoom( -10 )
				self.clipFinished( PanelContainer, {} )
				local BackGlowFrame2 = function ( BackGlow, event )
					if not event.interrupted then
						BackGlow:beginAnimation( "keyframe", 1690, false, false, CoD.TweenType.Linear )
					end
					BackGlow:setLeftRight( false, false, -128.33, -29.49 )
					BackGlow:setTopBottom( false, false, -47.25, 51.58 )
					BackGlow:setAlpha( 0.2 )
					if event.interrupted then
						self.clipFinished( BackGlow, event )
					else
						BackGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BackGlow:completeAnimation()
				self.BackGlow:setLeftRight( false, false, -128.33, -29.49 )
				self.BackGlow:setTopBottom( false, false, -47.25, 51.58 )
				self.BackGlow:setAlpha( 0.2 )
				BackGlowFrame2( BackGlow, {} )

				UIGlow:completeAnimation()
				self.UIGlow:setLeftRight( true, false, -20, 153.33 )
				self.UIGlow:setTopBottom( true, false, -6.67, 122.67 )
				self.UIGlow:setAlpha( 0.6 )
				self.clipFinished( UIGlow, {} )

				BackCircleOutter:completeAnimation()
				self.BackCircleOutter:setAlpha( 1 )
				self.BackCircleOutter:setZoom( -5 )
				self.clipFinished( BackCircleOutter, {} )

				BackCircleInner:completeAnimation()
				self.BackCircleInner:setAlpha( 0.3 )
				self.BackCircleInner:setZoom( -2 )
				self.clipFinished( BackCircleInner, {} )

				HealthState:completeAnimation()
				self.HealthState:setAlpha( 1 )
				self.HealthState:setZRot( 0 )
				self.HealthState:setZoom( 0 )
				self.clipFinished( HealthState, {} )

				Repair:completeAnimation()
				self.Repair:setAlpha( 1 )
				self.Repair:setZRot( 0 )
				self.Repair:setZoom( 5 )
				self.clipFinished( Repair, {} )

				BodyIndicatorSolid:completeAnimation()
				self.BodyIndicatorSolid:setAlpha( 0.5 )
				self.BodyIndicatorSolid:setZoom( 2 )
				self.clipFinished( BodyIndicatorSolid, {} )

				BodyIndicator:completeAnimation()
				self.BodyIndicator:setAlpha( 1 )
				self.BodyIndicator:setZoom( 2 )
				self.clipFinished( BodyIndicator, {} )

				EnviroHazardContainer:completeAnimation()

				EnviroHazardContainer.EnviroHazard2:completeAnimation()

				EnviroHazardContainer.DamageWidgetSemiCircle0:completeAnimation()

				EnviroHazardContainer.AmmoWidgetBackLine:completeAnimation()

				EnviroHazardContainer.AmmoWidgetBackLine0:completeAnimation()

				EnviroHazardContainer.DamageWidgetArrow0:completeAnimation()
				self.EnviroHazardContainer.EnviroHazard2:setZoom( 0 )
				self.EnviroHazardContainer.DamageWidgetSemiCircle0:setAlpha( 0.6 )
				self.EnviroHazardContainer.AmmoWidgetBackLine:setAlpha( 1 )
				self.EnviroHazardContainer.AmmoWidgetBackLine:setZoom( -3 )
				self.EnviroHazardContainer.AmmoWidgetBackLine0:setAlpha( 1 )
				self.EnviroHazardContainer.AmmoWidgetBackLine0:setZoom( -3 )
				self.EnviroHazardContainer.DamageWidgetArrow0:setAlpha( 1 )
				self.clipFinished( EnviroHazardContainer, {} )

				Dot1:completeAnimation()
				self.Dot1:setLeftRight( true, false, 5, 9 )
				self.Dot1:setTopBottom( true, false, 14, 18 )
				self.Dot1:setAlpha( 0.6 )
				self.clipFinished( Dot1, {} )

				Dot2:completeAnimation()
				self.Dot2:setLeftRight( true, false, 88, 92 )
				self.Dot2:setTopBottom( true, false, 14, 18 )
				self.Dot2:setAlpha( 0.6 )
				self.clipFinished( Dot2, {} )

				Dot3:completeAnimation()
				self.Dot3:setLeftRight( true, false, 123.5, 127.5 )
				self.Dot3:setTopBottom( true, false, 14, 18 )
				self.Dot3:setAlpha( 0.6 )
				self.clipFinished( Dot3, {} )

				Dot4:completeAnimation()
				self.Dot4:setLeftRight( true, false, 5, 9 )
				self.Dot4:setTopBottom( true, false, 94.25, 98.25 )
				self.Dot4:setAlpha( 0.6 )
				self.clipFinished( Dot4, {} )

				Dot5:completeAnimation()
				self.Dot5:setLeftRight( true, false, 88, 92 )
				self.Dot5:setTopBottom( true, false, 94.25, 98.25 )
				self.Dot5:setAlpha( 0.6 )
				self.clipFinished( Dot5, {} )

				Dot6:completeAnimation()
				self.Dot6:setLeftRight( true, false, 123.5, 127.5 )
				self.Dot6:setTopBottom( true, false, 94.25, 98.25 )
				self.Dot6:setAlpha( 0.6 )
				self.clipFinished( Dot6, {} )
			end,
			Invisible = function ()
				self:setupElementClipCounter( 16 )

				local PanelContainerFrame2 = function ( PanelContainer, event )
					if not event.interrupted then
						PanelContainer:beginAnimation( "keyframe", 560, false, true, CoD.TweenType.Bounce )
					end
					PanelContainer:setLeftRight( true, false, 4.83, 94.33 )
					PanelContainer:setTopBottom( true, false, 6.67, 101.34 )
					PanelContainer:setAlpha( 0 )
					PanelContainer:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( PanelContainer, event )
					else
						PanelContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PanelContainer:completeAnimation()
				self.PanelContainer:setLeftRight( true, false, 4.83, 192.33 )
				self.PanelContainer:setTopBottom( true, false, 6.67, 101.34 )
				self.PanelContainer:setAlpha( 1 )
				self.PanelContainer:setZoom( -10 )
				PanelContainerFrame2( PanelContainer, {} )
				local BackGlowFrame2 = function ( BackGlow, event )
					if not event.interrupted then
						BackGlow:beginAnimation( "keyframe", 600, true, false, CoD.TweenType.Bounce )
					end
					BackGlow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( BackGlow, event )
					else
						BackGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BackGlow:completeAnimation()
				self.BackGlow:setAlpha( 0.2 )
				BackGlowFrame2( BackGlow, {} )
				local UIGlowFrame2 = function ( UIGlow, event )
					if not event.interrupted then
						UIGlow:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
					end
					UIGlow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( UIGlow, event )
					else
						UIGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				UIGlow:completeAnimation()
				self.UIGlow:setAlpha( 0.6 )
				UIGlowFrame2( UIGlow, {} )
				local BackCircleOutterFrame2 = function ( BackCircleOutter, event )
					if not event.interrupted then
						BackCircleOutter:beginAnimation( "keyframe", 500, false, true, CoD.TweenType.Back )
					end
					BackCircleOutter:setAlpha( 0 )
					BackCircleOutter:setZoom( 40 )
					if event.interrupted then
						self.clipFinished( BackCircleOutter, event )
					else
						BackCircleOutter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BackCircleOutter:completeAnimation()
				self.BackCircleOutter:setAlpha( 1 )
				self.BackCircleOutter:setZoom( -5 )
				BackCircleOutterFrame2( BackCircleOutter, {} )
				local BackCircleInnerFrame2 = function ( BackCircleInner, event )
					if not event.interrupted then
						BackCircleInner:beginAnimation( "keyframe", 529, false, true, CoD.TweenType.Bounce )
					end
					BackCircleInner:setAlpha( 0 )
					BackCircleInner:setZoom( -20 )
					if event.interrupted then
						self.clipFinished( BackCircleInner, event )
					else
						BackCircleInner:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BackCircleInner:completeAnimation()
				self.BackCircleInner:setAlpha( 0.3 )
				self.BackCircleInner:setZoom( -2 )
				BackCircleInnerFrame2( BackCircleInner, {} )
				local HealthStateFrame2 = function ( HealthState, event )
					if not event.interrupted then
						HealthState:beginAnimation( "keyframe", 569, false, true, CoD.TweenType.Back )
					end
					HealthState:setAlpha( 0 )
					HealthState:setZRot( 0 )
					HealthState:setZoom( 40 )
					if event.interrupted then
						self.clipFinished( HealthState, event )
					else
						HealthState:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HealthState:completeAnimation()
				self.HealthState:setAlpha( 1 )
				self.HealthState:setZRot( 0 )
				self.HealthState:setZoom( 0 )
				HealthStateFrame2( HealthState, {} )
				local RepairFrame2 = function ( Repair, event )
					if not event.interrupted then
						Repair:beginAnimation( "keyframe", 370, false, true, CoD.TweenType.Bounce )
					end
					Repair:setAlpha( 0 )
					Repair:setZRot( 0 )
					Repair:setZoom( 35 )
					if event.interrupted then
						self.clipFinished( Repair, event )
					else
						Repair:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Repair:completeAnimation()
				self.Repair:setAlpha( 1 )
				self.Repair:setZRot( 0 )
				self.Repair:setZoom( 5 )
				RepairFrame2( Repair, {} )
				local BodyIndicatorSolidFrame2 = function ( BodyIndicatorSolid, event )
					if not event.interrupted then
						BodyIndicatorSolid:beginAnimation( "keyframe", 600, false, true, CoD.TweenType.Bounce )
					end
					BodyIndicatorSolid:setAlpha( 0 )
					BodyIndicatorSolid:setZoom( 2 )
					if event.interrupted then
						self.clipFinished( BodyIndicatorSolid, event )
					else
						BodyIndicatorSolid:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BodyIndicatorSolid:completeAnimation()
				self.BodyIndicatorSolid:setAlpha( 0.5 )
				self.BodyIndicatorSolid:setZoom( 2 )
				BodyIndicatorSolidFrame2( BodyIndicatorSolid, {} )
				local BodyIndicatorFrame2 = function ( BodyIndicator, event )
					if not event.interrupted then
						BodyIndicator:beginAnimation( "keyframe", 529, false, true, CoD.TweenType.Bounce )
					end
					BodyIndicator:setAlpha( 0 )
					BodyIndicator:setZoom( 2 )
					if event.interrupted then
						self.clipFinished( BodyIndicator, event )
					else
						BodyIndicator:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BodyIndicator:completeAnimation()
				self.BodyIndicator:setAlpha( 1 )
				self.BodyIndicator:setZoom( 2 )
				BodyIndicatorFrame2( BodyIndicator, {} )
				local EnviroHazardContainerFrame2 = function ( EnviroHazardContainer, event )
					if not event.interrupted then
						EnviroHazardContainer:beginAnimation( "keyframe", 600, false, true, CoD.TweenType.Bounce )
						EnviroHazardContainer.EnviroHazard2:beginAnimation( "subkeyframe", 600, false, true, CoD.TweenType.Bounce )
						EnviroHazardContainer.DamageWidgetSemiCircle0:beginAnimation( "subkeyframe", 600, false, true, CoD.TweenType.Bounce )
						EnviroHazardContainer.AmmoWidgetBackLine:beginAnimation( "subkeyframe", 600, false, true, CoD.TweenType.Bounce )
						EnviroHazardContainer.AmmoWidgetBackLine0:beginAnimation( "subkeyframe", 600, false, true, CoD.TweenType.Bounce )
						EnviroHazardContainer.DamageWidgetArrow0:beginAnimation( "subkeyframe", 600, false, true, CoD.TweenType.Bounce )
					end
					EnviroHazardContainer.EnviroHazard2:setZoom( 0 )
					EnviroHazardContainer.DamageWidgetSemiCircle0:setAlpha( 0 )
					EnviroHazardContainer.AmmoWidgetBackLine:setAlpha( 0 )
					EnviroHazardContainer.AmmoWidgetBackLine:setZoom( -20 )
					EnviroHazardContainer.AmmoWidgetBackLine0:setAlpha( 0 )
					EnviroHazardContainer.AmmoWidgetBackLine0:setZoom( -20 )
					EnviroHazardContainer.DamageWidgetArrow0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( EnviroHazardContainer, event )
					else
						EnviroHazardContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				EnviroHazardContainer:completeAnimation()

				EnviroHazardContainer.EnviroHazard2:completeAnimation()

				EnviroHazardContainer.DamageWidgetSemiCircle0:completeAnimation()

				EnviroHazardContainer.AmmoWidgetBackLine:completeAnimation()

				EnviroHazardContainer.AmmoWidgetBackLine0:completeAnimation()

				EnviroHazardContainer.DamageWidgetArrow0:completeAnimation()
				self.EnviroHazardContainer.EnviroHazard2:setZoom( 0 )
				self.EnviroHazardContainer.DamageWidgetSemiCircle0:setAlpha( 0.6 )
				self.EnviroHazardContainer.AmmoWidgetBackLine:setAlpha( 1 )
				self.EnviroHazardContainer.AmmoWidgetBackLine:setZoom( -3 )
				self.EnviroHazardContainer.AmmoWidgetBackLine0:setAlpha( 1 )
				self.EnviroHazardContainer.AmmoWidgetBackLine0:setZoom( -3 )
				self.EnviroHazardContainer.DamageWidgetArrow0:setAlpha( 1 )
				EnviroHazardContainerFrame2( EnviroHazardContainer, {} )
				local Dot1Frame2 = function ( Dot1, event )
					if not event.interrupted then
						Dot1:beginAnimation( "keyframe", 430, false, true, CoD.TweenType.Bounce )
					end
					Dot1:setLeftRight( true, false, 5, 9 )
					Dot1:setTopBottom( true, false, 54, 58 )
					Dot1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Dot1, event )
					else
						Dot1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dot1:completeAnimation()
				self.Dot1:setLeftRight( true, false, 5, 9 )
				self.Dot1:setTopBottom( true, false, 14, 18 )
				self.Dot1:setAlpha( 0.6 )
				Dot1Frame2( Dot1, {} )
				local Dot2Frame2 = function ( Dot2, event )
					if not event.interrupted then
						Dot2:beginAnimation( "keyframe", 600, false, true, CoD.TweenType.Bounce )
					end
					Dot2:setLeftRight( true, false, 4, 8 )
					Dot2:setTopBottom( true, false, 54, 58 )
					Dot2:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Dot2, event )
					else
						Dot2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dot2:completeAnimation()
				self.Dot2:setLeftRight( true, false, 88, 92 )
				self.Dot2:setTopBottom( true, false, 14, 18 )
				self.Dot2:setAlpha( 0.6 )
				Dot2Frame2( Dot2, {} )
				local Dot3Frame2 = function ( Dot3, event )
					if not event.interrupted then
						Dot3:beginAnimation( "keyframe", 560, false, true, CoD.TweenType.Bounce )
					end
					Dot3:setLeftRight( true, false, 3.5, 7.5 )
					Dot3:setTopBottom( true, false, 54, 58 )
					Dot3:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Dot3, event )
					else
						Dot3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dot3:completeAnimation()
				self.Dot3:setLeftRight( true, false, 123.5, 127.5 )
				self.Dot3:setTopBottom( true, false, 14, 18 )
				self.Dot3:setAlpha( 0.6 )
				Dot3Frame2( Dot3, {} )
				local Dot4Frame2 = function ( Dot4, event )
					if not event.interrupted then
						Dot4:beginAnimation( "keyframe", 519, false, true, CoD.TweenType.Bounce )
					end
					Dot4:setLeftRight( true, false, 5, 9 )
					Dot4:setTopBottom( true, false, 54.25, 58.25 )
					Dot4:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Dot4, event )
					else
						Dot4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dot4:completeAnimation()
				self.Dot4:setLeftRight( true, false, 5, 9 )
				self.Dot4:setTopBottom( true, false, 94.25, 98.25 )
				self.Dot4:setAlpha( 0.6 )
				Dot4Frame2( Dot4, {} )
				local Dot5Frame2 = function ( Dot5, event )
					if not event.interrupted then
						Dot5:beginAnimation( "keyframe", 600, false, true, CoD.TweenType.Back )
					end
					Dot5:setLeftRight( true, false, 4, 8 )
					Dot5:setTopBottom( true, false, 54.25, 58.25 )
					Dot5:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Dot5, event )
					else
						Dot5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dot5:completeAnimation()
				self.Dot5:setLeftRight( true, false, 88, 92 )
				self.Dot5:setTopBottom( true, false, 94.25, 98.25 )
				self.Dot5:setAlpha( 0.6 )
				Dot5Frame2( Dot5, {} )
				local Dot6Frame2 = function ( Dot6, event )
					if not event.interrupted then
						Dot6:beginAnimation( "keyframe", 430, false, true, CoD.TweenType.Back )
					end
					Dot6:setLeftRight( true, false, 3.5, 7.5 )
					Dot6:setTopBottom( true, false, 54.25, 58.25 )
					Dot6:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Dot6, event )
					else
						Dot6:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dot6:completeAnimation()
				self.Dot6:setLeftRight( true, false, 123.5, 127.5 )
				self.Dot6:setTopBottom( true, false, 94.25, 98.25 )
				self.Dot6:setAlpha( 0.6 )
				Dot6Frame2( Dot6, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 16 )

				PanelContainer:completeAnimation()
				self.PanelContainer:setLeftRight( true, false, 4.83, 94.33 )
				self.PanelContainer:setTopBottom( true, false, 6.67, 101.34 )
				self.PanelContainer:setAlpha( 0 )
				self.PanelContainer:setZoom( -10 )
				self.clipFinished( PanelContainer, {} )

				BackGlow:completeAnimation()
				self.BackGlow:setAlpha( 0 )
				self.clipFinished( BackGlow, {} )

				UIGlow:completeAnimation()
				self.UIGlow:setLeftRight( true, false, -20, 153.33 )
				self.UIGlow:setTopBottom( true, false, -6.5, 122.83 )
				self.UIGlow:setAlpha( 0 )
				self.clipFinished( UIGlow, {} )

				BackCircleOutter:completeAnimation()
				self.BackCircleOutter:setAlpha( 0 )
				self.BackCircleOutter:setZoom( 40 )
				self.clipFinished( BackCircleOutter, {} )

				BackCircleInner:completeAnimation()
				self.BackCircleInner:setAlpha( 0 )
				self.BackCircleInner:setZoom( -2 )
				self.clipFinished( BackCircleInner, {} )

				HealthState:completeAnimation()
				self.HealthState:setAlpha( 0 )
				self.HealthState:setZRot( -90 )
				self.HealthState:setZoom( 40 )
				self.clipFinished( HealthState, {} )

				Repair:completeAnimation()
				self.Repair:setAlpha( 0 )
				self.Repair:setZRot( 90 )
				self.Repair:setZoom( 35 )
				self.clipFinished( Repair, {} )

				BodyIndicatorSolid:completeAnimation()
				self.BodyIndicatorSolid:setAlpha( 0 )
				self.BodyIndicatorSolid:setZoom( -27 )
				self.clipFinished( BodyIndicatorSolid, {} )

				BodyIndicator:completeAnimation()
				self.BodyIndicator:setAlpha( 0 )
				self.BodyIndicator:setZoom( 52 )
				self.clipFinished( BodyIndicator, {} )

				EnviroHazardContainer:completeAnimation()

				EnviroHazardContainer.DamageWidgetSemiCircle0:completeAnimation()

				EnviroHazardContainer.AmmoWidgetBackLine:completeAnimation()

				EnviroHazardContainer.AmmoWidgetBackLine0:completeAnimation()

				EnviroHazardContainer.DamageWidgetArrow0:completeAnimation()
				self.EnviroHazardContainer.DamageWidgetSemiCircle0:setAlpha( 0 )
				self.EnviroHazardContainer.AmmoWidgetBackLine:setAlpha( 0 )
				self.EnviroHazardContainer.AmmoWidgetBackLine:setZoom( -20 )
				self.EnviroHazardContainer.AmmoWidgetBackLine0:setAlpha( 0 )
				self.EnviroHazardContainer.AmmoWidgetBackLine0:setZoom( -20 )
				self.EnviroHazardContainer.DamageWidgetArrow0:setAlpha( 0 )
				self.clipFinished( EnviroHazardContainer, {} )

				Dot1:completeAnimation()
				self.Dot1:setLeftRight( true, false, 5, 9 )
				self.Dot1:setTopBottom( true, false, 54, 58 )
				self.Dot1:setAlpha( 0 )
				self.clipFinished( Dot1, {} )

				Dot2:completeAnimation()
				self.Dot2:setLeftRight( true, false, 4, 8 )
				self.Dot2:setTopBottom( true, false, 54, 58 )
				self.Dot2:setAlpha( 0 )
				self.clipFinished( Dot2, {} )

				Dot3:completeAnimation()
				self.Dot3:setLeftRight( true, false, 3.5, 7.5 )
				self.Dot3:setTopBottom( true, false, 54, 58 )
				self.Dot3:setAlpha( 0 )
				self.clipFinished( Dot3, {} )

				Dot4:completeAnimation()
				self.Dot4:setLeftRight( true, false, 5, 9 )
				self.Dot4:setTopBottom( true, false, 54.25, 58.25 )
				self.Dot4:setAlpha( 0 )
				self.clipFinished( Dot4, {} )

				Dot5:completeAnimation()
				self.Dot5:setLeftRight( true, false, 4, 8 )
				self.Dot5:setTopBottom( true, false, 54.25, 58.25 )
				self.Dot5:setAlpha( 0 )
				self.clipFinished( Dot5, {} )

				Dot6:completeAnimation()
				self.Dot6:setLeftRight( true, false, 3.5, 7.5 )
				self.Dot6:setTopBottom( true, false, 54.25, 58.25 )
				self.Dot6:setAlpha( 0 )
				self.clipFinished( Dot6, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 16 )

				local PanelContainerFrame2 = function ( PanelContainer, event )
					local PanelContainerFrame3 = function ( PanelContainer, event )
						local PanelContainerFrame4 = function ( PanelContainer, event )
							if not event.interrupted then
								PanelContainer:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Back )
							end
							PanelContainer:setLeftRight( true, false, 4.83, 192.33 )
							PanelContainer:setTopBottom( true, false, 6.67, 101.34 )
							PanelContainer:setAlpha( 1 )
							PanelContainer:setZoom( -10 )
							if event.interrupted then
								self.clipFinished( PanelContainer, event )
							else
								PanelContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							PanelContainerFrame4( PanelContainer, event )
							return 
						else
							PanelContainer:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
							PanelContainer:setAlpha( 1 )
							PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame4 )
						end
					end
					
					if event.interrupted then
						PanelContainerFrame3( PanelContainer, event )
						return 
					else
						PanelContainer:beginAnimation( "keyframe", 1509, false, false, CoD.TweenType.Linear )
						PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame3 )
					end
				end
				
				PanelContainer:completeAnimation()
				self.PanelContainer:setLeftRight( true, false, 4.83, 94.33 )
				self.PanelContainer:setTopBottom( true, false, 6.67, 101.34 )
				self.PanelContainer:setAlpha( 0 )
				self.PanelContainer:setZoom( -10 )
				PanelContainerFrame2( PanelContainer, {} )
				local BackGlowFrame2 = function ( BackGlow, event )
					local BackGlowFrame3 = function ( BackGlow, event )
						if not event.interrupted then
							BackGlow:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
						end
						BackGlow:setAlpha( 0.2 )
						if event.interrupted then
							self.clipFinished( BackGlow, event )
						else
							BackGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BackGlowFrame3( BackGlow, event )
						return 
					else
						BackGlow:beginAnimation( "keyframe", 1509, false, false, CoD.TweenType.Linear )
						BackGlow:registerEventHandler( "transition_complete_keyframe", BackGlowFrame3 )
					end
				end
				
				BackGlow:completeAnimation()
				self.BackGlow:setAlpha( 0 )
				BackGlowFrame2( BackGlow, {} )
				local UIGlowFrame2 = function ( UIGlow, event )
					local UIGlowFrame3 = function ( UIGlow, event )
						if not event.interrupted then
							UIGlow:beginAnimation( "keyframe", 880, false, false, CoD.TweenType.Linear )
						end
						UIGlow:setAlpha( 0.6 )
						if event.interrupted then
							self.clipFinished( UIGlow, event )
						else
							UIGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						UIGlowFrame3( UIGlow, event )
						return 
					else
						UIGlow:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
						UIGlow:registerEventHandler( "transition_complete_keyframe", UIGlowFrame3 )
					end
				end
				
				UIGlow:completeAnimation()
				self.UIGlow:setAlpha( 0 )
				UIGlowFrame2( UIGlow, {} )
				local BackCircleOutterFrame2 = function ( BackCircleOutter, event )
					local BackCircleOutterFrame3 = function ( BackCircleOutter, event )
						local BackCircleOutterFrame4 = function ( BackCircleOutter, event )
							local BackCircleOutterFrame5 = function ( BackCircleOutter, event )
								local BackCircleOutterFrame6 = function ( BackCircleOutter, event )
									if not event.interrupted then
										BackCircleOutter:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									end
									BackCircleOutter:setAlpha( 1 )
									BackCircleOutter:setZoom( -5 )
									if event.interrupted then
										self.clipFinished( BackCircleOutter, event )
									else
										BackCircleOutter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									BackCircleOutterFrame6( BackCircleOutter, event )
									return 
								else
									BackCircleOutter:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame6 )
								end
							end
							
							if event.interrupted then
								BackCircleOutterFrame5( BackCircleOutter, event )
								return 
							else
								BackCircleOutter:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								BackCircleOutter:setAlpha( 0 )
								BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame5 )
							end
						end
						
						if event.interrupted then
							BackCircleOutterFrame4( BackCircleOutter, event )
							return 
						else
							BackCircleOutter:beginAnimation( "keyframe", 110, false, true, CoD.TweenType.Back )
							BackCircleOutter:setAlpha( 1 )
							BackCircleOutter:setZoom( -5 )
							BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame4 )
						end
					end
					
					if event.interrupted then
						BackCircleOutterFrame3( BackCircleOutter, event )
						return 
					else
						BackCircleOutter:beginAnimation( "keyframe", 1340, false, false, CoD.TweenType.Linear )
						BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame3 )
					end
				end
				
				BackCircleOutter:completeAnimation()
				self.BackCircleOutter:setAlpha( 0 )
				self.BackCircleOutter:setZoom( 40 )
				BackCircleOutterFrame2( BackCircleOutter, {} )
				local BackCircleInnerFrame2 = function ( BackCircleInner, event )
					local BackCircleInnerFrame3 = function ( BackCircleInner, event )
						local BackCircleInnerFrame4 = function ( BackCircleInner, event )
							local BackCircleInnerFrame5 = function ( BackCircleInner, event )
								local BackCircleInnerFrame6 = function ( BackCircleInner, event )
									local BackCircleInnerFrame7 = function ( BackCircleInner, event )
										if not event.interrupted then
											BackCircleInner:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
										end
										BackCircleInner:setAlpha( 0.3 )
										BackCircleInner:setZoom( -2 )
										if event.interrupted then
											self.clipFinished( BackCircleInner, event )
										else
											BackCircleInner:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										BackCircleInnerFrame7( BackCircleInner, event )
										return 
									else
										BackCircleInner:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
										BackCircleInner:setAlpha( 0.3 )
										BackCircleInner:setZoom( -0.62 )
										BackCircleInner:registerEventHandler( "transition_complete_keyframe", BackCircleInnerFrame7 )
									end
								end
								
								if event.interrupted then
									BackCircleInnerFrame6( BackCircleInner, event )
									return 
								else
									BackCircleInner:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									BackCircleInner:setZoom( -0.23 )
									BackCircleInner:registerEventHandler( "transition_complete_keyframe", BackCircleInnerFrame6 )
								end
							end
							
							if event.interrupted then
								BackCircleInnerFrame5( BackCircleInner, event )
								return 
							else
								BackCircleInner:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								BackCircleInner:setAlpha( 0 )
								BackCircleInner:setZoom( -0.08 )
								BackCircleInner:registerEventHandler( "transition_complete_keyframe", BackCircleInnerFrame5 )
							end
						end
						
						if event.interrupted then
							BackCircleInnerFrame4( BackCircleInner, event )
							return 
						else
							BackCircleInner:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
							BackCircleInner:setAlpha( 0.3 )
							BackCircleInner:setZoom( 0 )
							BackCircleInner:registerEventHandler( "transition_complete_keyframe", BackCircleInnerFrame4 )
						end
					end
					
					if event.interrupted then
						BackCircleInnerFrame3( BackCircleInner, event )
						return 
					else
						BackCircleInner:beginAnimation( "keyframe", 1019, false, false, CoD.TweenType.Linear )
						BackCircleInner:registerEventHandler( "transition_complete_keyframe", BackCircleInnerFrame3 )
					end
				end
				
				BackCircleInner:completeAnimation()
				self.BackCircleInner:setAlpha( 0 )
				self.BackCircleInner:setZoom( -20 )
				BackCircleInnerFrame2( BackCircleInner, {} )
				local HealthStateFrame2 = function ( HealthState, event )
					local HealthStateFrame3 = function ( HealthState, event )
						local HealthStateFrame4 = function ( HealthState, event )
							local HealthStateFrame5 = function ( HealthState, event )
								local HealthStateFrame6 = function ( HealthState, event )
									local HealthStateFrame7 = function ( HealthState, event )
										local HealthStateFrame8 = function ( HealthState, event )
											local HealthStateFrame9 = function ( HealthState, event )
												local HealthStateFrame10 = function ( HealthState, event )
													if not event.interrupted then
														HealthState:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
													end
													HealthState:setAlpha( 1 )
													HealthState:setZRot( 0 )
													HealthState:setZoom( 0 )
													if event.interrupted then
														self.clipFinished( HealthState, event )
													else
														HealthState:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													HealthStateFrame10( HealthState, event )
													return 
												else
													HealthState:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													HealthState:registerEventHandler( "transition_complete_keyframe", HealthStateFrame10 )
												end
											end
											
											if event.interrupted then
												HealthStateFrame9( HealthState, event )
												return 
											else
												HealthState:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												HealthState:setAlpha( 0 )
												HealthState:registerEventHandler( "transition_complete_keyframe", HealthStateFrame9 )
											end
										end
										
										if event.interrupted then
											HealthStateFrame8( HealthState, event )
											return 
										else
											HealthState:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											HealthState:registerEventHandler( "transition_complete_keyframe", HealthStateFrame8 )
										end
									end
									
									if event.interrupted then
										HealthStateFrame7( HealthState, event )
										return 
									else
										HealthState:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										HealthState:setAlpha( 1 )
										HealthState:registerEventHandler( "transition_complete_keyframe", HealthStateFrame7 )
									end
								end
								
								if event.interrupted then
									HealthStateFrame6( HealthState, event )
									return 
								else
									HealthState:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									HealthState:registerEventHandler( "transition_complete_keyframe", HealthStateFrame6 )
								end
							end
							
							if event.interrupted then
								HealthStateFrame5( HealthState, event )
								return 
							else
								HealthState:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								HealthState:setAlpha( 0 )
								HealthState:registerEventHandler( "transition_complete_keyframe", HealthStateFrame5 )
							end
						end
						
						if event.interrupted then
							HealthStateFrame4( HealthState, event )
							return 
						else
							HealthState:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Back )
							HealthState:setAlpha( 1 )
							HealthState:setZRot( 0 )
							HealthState:setZoom( 0 )
							HealthState:registerEventHandler( "transition_complete_keyframe", HealthStateFrame4 )
						end
					end
					
					if event.interrupted then
						HealthStateFrame3( HealthState, event )
						return 
					else
						HealthState:beginAnimation( "keyframe", 879, false, false, CoD.TweenType.Linear )
						HealthState:registerEventHandler( "transition_complete_keyframe", HealthStateFrame3 )
					end
				end
				
				HealthState:completeAnimation()
				self.HealthState:setAlpha( 0 )
				self.HealthState:setZRot( -90 )
				self.HealthState:setZoom( 40 )
				HealthStateFrame2( HealthState, {} )
				local RepairFrame2 = function ( Repair, event )
					local RepairFrame3 = function ( Repair, event )
						local RepairFrame4 = function ( Repair, event )
							local RepairFrame5 = function ( Repair, event )
								local RepairFrame6 = function ( Repair, event )
									local RepairFrame7 = function ( Repair, event )
										local RepairFrame8 = function ( Repair, event )
											local RepairFrame9 = function ( Repair, event )
												local RepairFrame10 = function ( Repair, event )
													local RepairFrame11 = function ( Repair, event )
														local RepairFrame12 = function ( Repair, event )
															if not event.interrupted then
																Repair:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
															end
															Repair:setAlpha( 1 )
															Repair:setZRot( 0 )
															Repair:setZoom( 5 )
															if event.interrupted then
																self.clipFinished( Repair, event )
															else
																Repair:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															RepairFrame12( Repair, event )
															return 
														else
															Repair:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
															Repair:registerEventHandler( "transition_complete_keyframe", RepairFrame12 )
														end
													end
													
													if event.interrupted then
														RepairFrame11( Repair, event )
														return 
													else
														Repair:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														Repair:setAlpha( 0 )
														Repair:registerEventHandler( "transition_complete_keyframe", RepairFrame11 )
													end
												end
												
												if event.interrupted then
													RepairFrame10( Repair, event )
													return 
												else
													Repair:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													Repair:registerEventHandler( "transition_complete_keyframe", RepairFrame10 )
												end
											end
											
											if event.interrupted then
												RepairFrame9( Repair, event )
												return 
											else
												Repair:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												Repair:setAlpha( 1 )
												Repair:registerEventHandler( "transition_complete_keyframe", RepairFrame9 )
											end
										end
										
										if event.interrupted then
											RepairFrame8( Repair, event )
											return 
										else
											Repair:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											Repair:registerEventHandler( "transition_complete_keyframe", RepairFrame8 )
										end
									end
									
									if event.interrupted then
										RepairFrame7( Repair, event )
										return 
									else
										Repair:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										Repair:setAlpha( 0 )
										Repair:registerEventHandler( "transition_complete_keyframe", RepairFrame7 )
									end
								end
								
								if event.interrupted then
									RepairFrame6( Repair, event )
									return 
								else
									Repair:beginAnimation( "keyframe", 9, false, true, CoD.TweenType.Back )
									Repair:setZRot( 0 )
									Repair:setZoom( 5 )
									Repair:registerEventHandler( "transition_complete_keyframe", RepairFrame6 )
								end
							end
							
							if event.interrupted then
								RepairFrame5( Repair, event )
								return 
							else
								Repair:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
								Repair:setZoom( 4.92 )
								Repair:registerEventHandler( "transition_complete_keyframe", RepairFrame5 )
							end
						end
						
						if event.interrupted then
							RepairFrame4( Repair, event )
							return 
						else
							Repair:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Repair:setAlpha( 1 )
							Repair:registerEventHandler( "transition_complete_keyframe", RepairFrame4 )
						end
					end
					
					if event.interrupted then
						RepairFrame3( Repair, event )
						return 
					else
						Repair:beginAnimation( "keyframe", 680, false, false, CoD.TweenType.Linear )
						Repair:registerEventHandler( "transition_complete_keyframe", RepairFrame3 )
					end
				end
				
				Repair:completeAnimation()
				self.Repair:setAlpha( 0 )
				self.Repair:setZRot( 90 )
				self.Repair:setZoom( 35 )
				RepairFrame2( Repair, {} )
				local BodyIndicatorSolidFrame2 = function ( BodyIndicatorSolid, event )
					local BodyIndicatorSolidFrame3 = function ( BodyIndicatorSolid, event )
						if not event.interrupted then
							BodyIndicatorSolid:beginAnimation( "keyframe", 69, false, true, CoD.TweenType.Bounce )
						end
						BodyIndicatorSolid:setAlpha( 0.5 )
						BodyIndicatorSolid:setZoom( 2 )
						if event.interrupted then
							self.clipFinished( BodyIndicatorSolid, event )
						else
							BodyIndicatorSolid:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BodyIndicatorSolidFrame3( BodyIndicatorSolid, event )
						return 
					else
						BodyIndicatorSolid:beginAnimation( "keyframe", 560, false, false, CoD.TweenType.Linear )
						BodyIndicatorSolid:registerEventHandler( "transition_complete_keyframe", BodyIndicatorSolidFrame3 )
					end
				end
				
				BodyIndicatorSolid:completeAnimation()
				self.BodyIndicatorSolid:setAlpha( 0 )
				self.BodyIndicatorSolid:setZoom( -27 )
				BodyIndicatorSolidFrame2( BodyIndicatorSolid, {} )
				local BodyIndicatorFrame2 = function ( BodyIndicator, event )
					local BodyIndicatorFrame3 = function ( BodyIndicator, event )
						local BodyIndicatorFrame4 = function ( BodyIndicator, event )
							local BodyIndicatorFrame5 = function ( BodyIndicator, event )
								local BodyIndicatorFrame6 = function ( BodyIndicator, event )
									if not event.interrupted then
										BodyIndicator:beginAnimation( "keyframe", 60, false, true, CoD.TweenType.Back )
									end
									BodyIndicator:setAlpha( 1 )
									BodyIndicator:setZoom( 2 )
									if event.interrupted then
										self.clipFinished( BodyIndicator, event )
									else
										BodyIndicator:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									BodyIndicatorFrame6( BodyIndicator, event )
									return 
								else
									BodyIndicator:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									BodyIndicator:setAlpha( 0 )
									BodyIndicator:setZoom( -15.34 )
									BodyIndicator:registerEventHandler( "transition_complete_keyframe", BodyIndicatorFrame6 )
								end
							end
							
							if event.interrupted then
								BodyIndicatorFrame5( BodyIndicator, event )
								return 
							else
								BodyIndicator:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								BodyIndicator:setAlpha( 1 )
								BodyIndicator:setZoom( -15.12 )
								BodyIndicator:registerEventHandler( "transition_complete_keyframe", BodyIndicatorFrame5 )
							end
						end
						
						if event.interrupted then
							BodyIndicatorFrame4( BodyIndicator, event )
							return 
						else
							BodyIndicator:beginAnimation( "keyframe", 40, false, true, CoD.TweenType.Back )
							BodyIndicator:setZoom( -9.9 )
							BodyIndicator:registerEventHandler( "transition_complete_keyframe", BodyIndicatorFrame4 )
						end
					end
					
					if event.interrupted then
						BodyIndicatorFrame3( BodyIndicator, event )
						return 
					else
						BodyIndicator:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						BodyIndicator:registerEventHandler( "transition_complete_keyframe", BodyIndicatorFrame3 )
					end
				end
				
				BodyIndicator:completeAnimation()
				self.BodyIndicator:setAlpha( 0 )
				self.BodyIndicator:setZoom( 52 )
				BodyIndicatorFrame2( BodyIndicator, {} )
				local EnviroHazardContainerFrame2 = function ( EnviroHazardContainer, event )
					local EnviroHazardContainerFrame3 = function ( EnviroHazardContainer, event )
						local EnviroHazardContainerFrame4 = function ( EnviroHazardContainer, event )
							local EnviroHazardContainerFrame5 = function ( EnviroHazardContainer, event )
								local EnviroHazardContainerFrame6 = function ( EnviroHazardContainer, event )
									local EnviroHazardContainerFrame7 = function ( EnviroHazardContainer, event )
										local EnviroHazardContainerFrame8 = function ( EnviroHazardContainer, event )
											local EnviroHazardContainerFrame9 = function ( EnviroHazardContainer, event )
												if not event.interrupted then
													EnviroHazardContainer:beginAnimation( "keyframe", 40, false, true, CoD.TweenType.Back )
													EnviroHazardContainer.DamageWidgetSemiCircle0:beginAnimation( "subkeyframe", 40, false, true, CoD.TweenType.Back )
													EnviroHazardContainer.AmmoWidgetBackLine:beginAnimation( "subkeyframe", 40, false, true, CoD.TweenType.Back )
													EnviroHazardContainer.AmmoWidgetBackLine0:beginAnimation( "subkeyframe", 40, false, true, CoD.TweenType.Back )
													EnviroHazardContainer.DamageWidgetArrow0:beginAnimation( "subkeyframe", 40, false, true, CoD.TweenType.Back )
												end
												EnviroHazardContainer.DamageWidgetSemiCircle0:setAlpha( 0.6 )
												EnviroHazardContainer.AmmoWidgetBackLine:setAlpha( 1 )
												EnviroHazardContainer.AmmoWidgetBackLine:setZoom( -3 )
												EnviroHazardContainer.AmmoWidgetBackLine0:setAlpha( 1 )
												EnviroHazardContainer.AmmoWidgetBackLine0:setZoom( -3 )
												EnviroHazardContainer.DamageWidgetArrow0:setAlpha( 1 )
												if event.interrupted then
													self.clipFinished( EnviroHazardContainer, event )
												else
													EnviroHazardContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												EnviroHazardContainerFrame9( EnviroHazardContainer, event )
												return 
											else
												EnviroHazardContainer:beginAnimation( "keyframe", 29, false, true, CoD.TweenType.Back )
												EnviroHazardContainer.DamageWidgetSemiCircle0:beginAnimation( "subkeyframe", 29, false, true, CoD.TweenType.Back )
												EnviroHazardContainer.DamageWidgetArrow0:beginAnimation( "subkeyframe", 29, false, true, CoD.TweenType.Back )
												EnviroHazardContainer.DamageWidgetSemiCircle0:setAlpha( 0.6 )
												EnviroHazardContainer.DamageWidgetArrow0:setAlpha( 1.38 )
												EnviroHazardContainer:registerEventHandler( "transition_complete_keyframe", EnviroHazardContainerFrame9 )
											end
										end
										
										if event.interrupted then
											EnviroHazardContainerFrame8( EnviroHazardContainer, event )
											return 
										else
											EnviroHazardContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											EnviroHazardContainer.DamageWidgetSemiCircle0:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
											EnviroHazardContainer.AmmoWidgetBackLine:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
											EnviroHazardContainer.DamageWidgetArrow0:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
											EnviroHazardContainer.DamageWidgetSemiCircle0:setAlpha( 0.74 )
											EnviroHazardContainer.AmmoWidgetBackLine:setAlpha( 1 )
											EnviroHazardContainer.AmmoWidgetBackLine:setZoom( -3 )
											EnviroHazardContainer.DamageWidgetArrow0:setAlpha( 0.66 )
											EnviroHazardContainer:registerEventHandler( "transition_complete_keyframe", EnviroHazardContainerFrame8 )
										end
									end
									
									if event.interrupted then
										EnviroHazardContainerFrame7( EnviroHazardContainer, event )
										return 
									else
										EnviroHazardContainer:beginAnimation( "keyframe", 29, false, true, CoD.TweenType.Back )
										EnviroHazardContainer.DamageWidgetSemiCircle0:beginAnimation( "subkeyframe", 29, false, true, CoD.TweenType.Back )
										EnviroHazardContainer.AmmoWidgetBackLine:beginAnimation( "subkeyframe", 29, false, true, CoD.TweenType.Back )
										EnviroHazardContainer.DamageWidgetSemiCircle0:setAlpha( 0.83 )
										EnviroHazardContainer.AmmoWidgetBackLine:setAlpha( 0.88 )
										EnviroHazardContainer.AmmoWidgetBackLine:setZoom( -5.12 )
										EnviroHazardContainer:registerEventHandler( "transition_complete_keyframe", EnviroHazardContainerFrame7 )
									end
								end
								
								if event.interrupted then
									EnviroHazardContainerFrame6( EnviroHazardContainer, event )
									return 
								else
									EnviroHazardContainer:beginAnimation( "keyframe", 9, false, true, CoD.TweenType.Back )
									EnviroHazardContainer.DamageWidgetSemiCircle0:beginAnimation( "subkeyframe", 9, false, true, CoD.TweenType.Back )
									EnviroHazardContainer.AmmoWidgetBackLine:beginAnimation( "subkeyframe", 9, false, true, CoD.TweenType.Back )
									EnviroHazardContainer.AmmoWidgetBackLine0:beginAnimation( "subkeyframe", 9, false, true, CoD.TweenType.Back )
									EnviroHazardContainer.DamageWidgetSemiCircle0:setAlpha( 0.4 )
									EnviroHazardContainer.AmmoWidgetBackLine:setAlpha( 0.5 )
									EnviroHazardContainer.AmmoWidgetBackLine:setZoom( -11.5 )
									EnviroHazardContainer.AmmoWidgetBackLine0:setZoom( -3 )
									EnviroHazardContainer:registerEventHandler( "transition_complete_keyframe", EnviroHazardContainerFrame6 )
								end
							end
							
							if event.interrupted then
								EnviroHazardContainerFrame5( EnviroHazardContainer, event )
								return 
							else
								EnviroHazardContainer:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								EnviroHazardContainer.AmmoWidgetBackLine:beginAnimation( "subkeyframe", 30, false, false, CoD.TweenType.Linear )
								EnviroHazardContainer.AmmoWidgetBackLine0:beginAnimation( "subkeyframe", 30, false, false, CoD.TweenType.Linear )
								EnviroHazardContainer.AmmoWidgetBackLine:setAlpha( 0.38 )
								EnviroHazardContainer.AmmoWidgetBackLine:setZoom( -13.62 )
								EnviroHazardContainer.AmmoWidgetBackLine0:setAlpha( 1 )
								EnviroHazardContainer.AmmoWidgetBackLine0:setZoom( -2.92 )
								EnviroHazardContainer:registerEventHandler( "transition_complete_keyframe", EnviroHazardContainerFrame5 )
							end
						end
						
						if event.interrupted then
							EnviroHazardContainerFrame4( EnviroHazardContainer, event )
							return 
						else
							EnviroHazardContainer:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							EnviroHazardContainer.AmmoWidgetBackLine0:beginAnimation( "subkeyframe", 39, false, false, CoD.TweenType.Linear )
							EnviroHazardContainer.AmmoWidgetBackLine0:setAlpha( 1.38 )
							EnviroHazardContainer.AmmoWidgetBackLine0:setZoom( 3.38 )
							EnviroHazardContainer:registerEventHandler( "transition_complete_keyframe", EnviroHazardContainerFrame4 )
						end
					end
					
					if event.interrupted then
						EnviroHazardContainerFrame3( EnviroHazardContainer, event )
						return 
					else
						EnviroHazardContainer:beginAnimation( "keyframe", 1129, false, false, CoD.TweenType.Linear )
						EnviroHazardContainer:registerEventHandler( "transition_complete_keyframe", EnviroHazardContainerFrame3 )
					end
				end
				
				EnviroHazardContainer:completeAnimation()

				EnviroHazardContainer.DamageWidgetSemiCircle0:completeAnimation()

				EnviroHazardContainer.AmmoWidgetBackLine:completeAnimation()

				EnviroHazardContainer.AmmoWidgetBackLine0:completeAnimation()

				EnviroHazardContainer.DamageWidgetArrow0:completeAnimation()
				self.EnviroHazardContainer.DamageWidgetSemiCircle0:setAlpha( 0 )
				self.EnviroHazardContainer.AmmoWidgetBackLine:setAlpha( 0 )
				self.EnviroHazardContainer.AmmoWidgetBackLine:setZoom( -20 )
				self.EnviroHazardContainer.AmmoWidgetBackLine0:setAlpha( 0 )
				self.EnviroHazardContainer.AmmoWidgetBackLine0:setZoom( -20 )
				self.EnviroHazardContainer.DamageWidgetArrow0:setAlpha( 0 )
				EnviroHazardContainerFrame2( EnviroHazardContainer, {} )
				local Dot1Frame2 = function ( Dot1, event )
					local Dot1Frame3 = function ( Dot1, event )
						local Dot1Frame4 = function ( Dot1, event )
							if not event.interrupted then
								Dot1:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
							end
							Dot1:setLeftRight( true, false, 5, 9 )
							Dot1:setTopBottom( true, false, 14, 18 )
							Dot1:setAlpha( 0.6 )
							if event.interrupted then
								self.clipFinished( Dot1, event )
							else
								Dot1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Dot1Frame4( Dot1, event )
							return 
						else
							Dot1:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
							Dot1:setTopBottom( true, false, 41.91, 45.91 )
							Dot1:setAlpha( 0.6 )
							Dot1:registerEventHandler( "transition_complete_keyframe", Dot1Frame4 )
						end
					end
					
					if event.interrupted then
						Dot1Frame3( Dot1, event )
						return 
					else
						Dot1:beginAnimation( "keyframe", 70, false, true, CoD.TweenType.Back )
						Dot1:setAlpha( 0.21 )
						Dot1:registerEventHandler( "transition_complete_keyframe", Dot1Frame3 )
					end
				end
				
				Dot1:completeAnimation()
				self.Dot1:setLeftRight( true, false, 5, 9 )
				self.Dot1:setTopBottom( true, false, 54, 58 )
				self.Dot1:setAlpha( 0 )
				Dot1Frame2( Dot1, {} )
				local Dot2Frame2 = function ( Dot2, event )
					local Dot2Frame3 = function ( Dot2, event )
						local Dot2Frame4 = function ( Dot2, event )
							local Dot2Frame5 = function ( Dot2, event )
								if not event.interrupted then
									Dot2:beginAnimation( "keyframe", 240, false, true, CoD.TweenType.Linear )
								end
								Dot2:setLeftRight( true, false, 88, 92 )
								Dot2:setTopBottom( true, false, 14, 18 )
								Dot2:setAlpha( 0.6 )
								if event.interrupted then
									self.clipFinished( Dot2, event )
								else
									Dot2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Dot2Frame5( Dot2, event )
								return 
							else
								Dot2:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
								Dot2:setTopBottom( true, false, 14, 18 )
								Dot2:registerEventHandler( "transition_complete_keyframe", Dot2Frame5 )
							end
						end
						
						if event.interrupted then
							Dot2Frame4( Dot2, event )
							return 
						else
							Dot2:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
							Dot2:setTopBottom( true, false, 26.63, 30.63 )
							Dot2:setAlpha( 0.6 )
							Dot2:registerEventHandler( "transition_complete_keyframe", Dot2Frame4 )
						end
					end
					
					if event.interrupted then
						Dot2Frame3( Dot2, event )
						return 
					else
						Dot2:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						Dot2:setAlpha( 0.21 )
						Dot2:registerEventHandler( "transition_complete_keyframe", Dot2Frame3 )
					end
				end
				
				Dot2:completeAnimation()
				self.Dot2:setLeftRight( true, false, 4, 8 )
				self.Dot2:setTopBottom( true, false, 54, 58 )
				self.Dot2:setAlpha( 0 )
				Dot2Frame2( Dot2, {} )
				local Dot3Frame2 = function ( Dot3, event )
					local Dot3Frame3 = function ( Dot3, event )
						local Dot3Frame4 = function ( Dot3, event )
							local Dot3Frame5 = function ( Dot3, event )
								if not event.interrupted then
									Dot3:beginAnimation( "keyframe", 240, false, true, CoD.TweenType.Linear )
								end
								Dot3:setLeftRight( true, false, 123.5, 127.5 )
								Dot3:setTopBottom( true, false, 14, 18 )
								Dot3:setAlpha( 0.6 )
								if event.interrupted then
									self.clipFinished( Dot3, event )
								else
									Dot3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Dot3Frame5( Dot3, event )
								return 
							else
								Dot3:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
								Dot3:setTopBottom( true, false, 14, 18 )
								Dot3:registerEventHandler( "transition_complete_keyframe", Dot3Frame5 )
							end
						end
						
						if event.interrupted then
							Dot3Frame4( Dot3, event )
							return 
						else
							Dot3:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
							Dot3:setTopBottom( true, false, 26.63, 30.63 )
							Dot3:setAlpha( 0.6 )
							Dot3:registerEventHandler( "transition_complete_keyframe", Dot3Frame4 )
						end
					end
					
					if event.interrupted then
						Dot3Frame3( Dot3, event )
						return 
					else
						Dot3:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						Dot3:setAlpha( 0.21 )
						Dot3:registerEventHandler( "transition_complete_keyframe", Dot3Frame3 )
					end
				end
				
				Dot3:completeAnimation()
				self.Dot3:setLeftRight( true, false, 3.5, 7.5 )
				self.Dot3:setTopBottom( true, false, 54, 58 )
				self.Dot3:setAlpha( 0 )
				Dot3Frame2( Dot3, {} )
				local Dot4Frame2 = function ( Dot4, event )
					local Dot4Frame3 = function ( Dot4, event )
						local Dot4Frame4 = function ( Dot4, event )
							if not event.interrupted then
								Dot4:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
							end
							Dot4:setLeftRight( true, false, 5, 9 )
							Dot4:setTopBottom( true, false, 94.25, 98.25 )
							Dot4:setAlpha( 0.6 )
							if event.interrupted then
								self.clipFinished( Dot4, event )
							else
								Dot4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Dot4Frame4( Dot4, event )
							return 
						else
							Dot4:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
							Dot4:setTopBottom( true, false, 66.34, 70.34 )
							Dot4:setAlpha( 0.6 )
							Dot4:registerEventHandler( "transition_complete_keyframe", Dot4Frame4 )
						end
					end
					
					if event.interrupted then
						Dot4Frame3( Dot4, event )
						return 
					else
						Dot4:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						Dot4:setAlpha( 0.21 )
						Dot4:registerEventHandler( "transition_complete_keyframe", Dot4Frame3 )
					end
				end
				
				Dot4:completeAnimation()
				self.Dot4:setLeftRight( true, false, 5, 9 )
				self.Dot4:setTopBottom( true, false, 54.25, 58.25 )
				self.Dot4:setAlpha( 0 )
				Dot4Frame2( Dot4, {} )
				local Dot5Frame2 = function ( Dot5, event )
					local Dot5Frame3 = function ( Dot5, event )
						local Dot5Frame4 = function ( Dot5, event )
							local Dot5Frame5 = function ( Dot5, event )
								if not event.interrupted then
									Dot5:beginAnimation( "keyframe", 240, false, true, CoD.TweenType.Linear )
								end
								Dot5:setLeftRight( true, false, 88, 92 )
								Dot5:setTopBottom( true, false, 94.25, 98.25 )
								Dot5:setAlpha( 0.6 )
								if event.interrupted then
									self.clipFinished( Dot5, event )
								else
									Dot5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Dot5Frame5( Dot5, event )
								return 
							else
								Dot5:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
								Dot5:setTopBottom( true, false, 94.25, 98.25 )
								Dot5:registerEventHandler( "transition_complete_keyframe", Dot5Frame5 )
							end
						end
						
						if event.interrupted then
							Dot5Frame4( Dot5, event )
							return 
						else
							Dot5:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
							Dot5:setTopBottom( true, false, 81.62, 85.62 )
							Dot5:setAlpha( 0.6 )
							Dot5:registerEventHandler( "transition_complete_keyframe", Dot5Frame4 )
						end
					end
					
					if event.interrupted then
						Dot5Frame3( Dot5, event )
						return 
					else
						Dot5:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						Dot5:setAlpha( 0.21 )
						Dot5:registerEventHandler( "transition_complete_keyframe", Dot5Frame3 )
					end
				end
				
				Dot5:completeAnimation()
				self.Dot5:setLeftRight( true, false, 4, 8 )
				self.Dot5:setTopBottom( true, false, 54.25, 58.25 )
				self.Dot5:setAlpha( 0 )
				Dot5Frame2( Dot5, {} )
				local Dot6Frame2 = function ( Dot6, event )
					local Dot6Frame3 = function ( Dot6, event )
						local Dot6Frame4 = function ( Dot6, event )
							local Dot6Frame5 = function ( Dot6, event )
								if not event.interrupted then
									Dot6:beginAnimation( "keyframe", 240, false, true, CoD.TweenType.Linear )
								end
								Dot6:setLeftRight( true, false, 123.5, 127.5 )
								Dot6:setTopBottom( true, false, 94.25, 98.25 )
								Dot6:setAlpha( 0.6 )
								if event.interrupted then
									self.clipFinished( Dot6, event )
								else
									Dot6:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Dot6Frame5( Dot6, event )
								return 
							else
								Dot6:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
								Dot6:setTopBottom( true, false, 94.25, 98.25 )
								Dot6:registerEventHandler( "transition_complete_keyframe", Dot6Frame5 )
							end
						end
						
						if event.interrupted then
							Dot6Frame4( Dot6, event )
							return 
						else
							Dot6:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
							Dot6:setTopBottom( true, false, 81.62, 85.62 )
							Dot6:setAlpha( 0.6 )
							Dot6:registerEventHandler( "transition_complete_keyframe", Dot6Frame4 )
						end
					end
					
					if event.interrupted then
						Dot6Frame3( Dot6, event )
						return 
					else
						Dot6:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						Dot6:setAlpha( 0.21 )
						Dot6:registerEventHandler( "transition_complete_keyframe", Dot6Frame3 )
					end
				end
				
				Dot6:completeAnimation()
				self.Dot6:setLeftRight( true, false, 3.5, 7.5 )
				self.Dot6:setTopBottom( true, false, 54.25, 58.25 )
				self.Dot6:setAlpha( 0 )
				Dot6Frame2( Dot6, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.PanelContainer:close()
		element.BackCircleOutter:close()
		element.BackCircleInner:close()
		element.HealthState:close()
		element.Repair:close()
		element.BodyIndicatorSolid:close()
		element.BodyIndicator:close()
		element.EnviroHazardContainer:close()
		element.Dot1:close()
		element.Dot2:close()
		element.Dot3:close()
		element.Dot4:close()
		element.Dot5:close()
		element.Dot6:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
