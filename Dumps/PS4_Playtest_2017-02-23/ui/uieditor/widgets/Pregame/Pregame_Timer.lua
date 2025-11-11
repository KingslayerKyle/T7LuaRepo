require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidget_Dot" )
require( "ui.uieditor.widgets.HUD.PrematchCountdown.PrematchCountdown_IconGlowPanel" )
require( "ui.uieditor.widgets.HUD.PrematchCountdown.PrematchCountdown_NumbersInternal" )

CoD.Pregame_Timer = InheritFrom( LUI.UIElement )
CoD.Pregame_Timer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Pregame_Timer )
	self.id = "Pregame_Timer"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 181 )
	self:setTopBottom( 0, 0, 0, 120 )
	
	local GlowPanel = CoD.PrematchCountdown_IconGlowPanel.new( menu, controller )
	GlowPanel:setLeftRight( 0, 0, -104, 308 )
	GlowPanel:setTopBottom( 0, 0, -133, 279 )
	self:addElement( GlowPanel )
	self.GlowPanel = GlowPanel
	
	local Numbers = CoD.PrematchCountdown_NumbersInternal.new( menu, controller )
	Numbers:setLeftRight( 0, 0, -2, 178 )
	Numbers:setTopBottom( 0, 0, 2.5, 107.5 )
	Numbers:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Numbers:setShaderVector( 0, 0.2, 0, 0, 0 )
	Numbers:setShaderVector( 1, 7.72, 0, 0, 0 )
	Numbers:setShaderVector( 2, -50, -100, 0, 0 )
	Numbers:setShaderVector( 3, 6.89, 9.87, 0, 0 )
	Numbers:setShaderVector( 4, 0, 0.02, 0, 0 )
	Numbers:subscribeToGlobalModel( controller, "PregameGlobal", "timeleft", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Numbers.Numbers:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Numbers )
	self.Numbers = Numbers
	
	local Dot61 = CoD.DamageWidget_Dot.new( menu, controller )
	Dot61:setLeftRight( 0, 0, -14, -8 )
	Dot61:setTopBottom( 0, 0, 121, 127 )
	Dot61:setZoom( 5 )
	self:addElement( Dot61 )
	self.Dot61 = Dot61
	
	local Dot600 = CoD.DamageWidget_Dot.new( menu, controller )
	Dot600:setLeftRight( 0, 0, 185, 191 )
	Dot600:setTopBottom( 0, 0, 121, 127 )
	Dot600:setZoom( 5 )
	self:addElement( Dot600 )
	self.Dot600 = Dot600
	
	local Dot62 = CoD.DamageWidget_Dot.new( menu, controller )
	Dot62:setLeftRight( 0, 0, -14, -8 )
	Dot62:setTopBottom( 0, 0, -35, -29 )
	Dot62:setZoom( 5 )
	self:addElement( Dot62 )
	self.Dot62 = Dot62
	
	local Dot601 = CoD.DamageWidget_Dot.new( menu, controller )
	Dot601:setLeftRight( 0, 0, 185, 191 )
	Dot601:setTopBottom( 0, 0, -35, -29 )
	Dot601:setZoom( 5 )
	self:addElement( Dot601 )
	self.Dot601 = Dot601
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 0, -7, 185 )
	Image0:setTopBottom( 0, 0, -36, 156 )
	Image0:setRGB( 0.2, 0.23, 0.29 )
	Image0:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image00 = LUI.UIImage.new()
	Image00:setLeftRight( 0, 0, -7, 185 )
	Image00:setTopBottom( 0, 0, -36, 156 )
	Image00:setRGB( 0.2, 0.23, 0.29 )
	Image00:setAlpha( 0.45 )
	Image00:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Image00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image00 )
	self.Image00 = Image00
	
	self.resetProperties = function ()
		Image0:completeAnimation()
		Dot601:completeAnimation()
		Dot62:completeAnimation()
		Dot600:completeAnimation()
		Dot61:completeAnimation()
		Numbers:completeAnimation()
		GlowPanel:completeAnimation()
		Image00:completeAnimation()
		Image0:setAlpha( 1 )
		Dot601:setAlpha( 1 )
		Dot62:setAlpha( 1 )
		Dot600:setAlpha( 1 )
		Dot61:setAlpha( 1 )
		Numbers:setRGB( 1, 1, 1 )
		Numbers:setAlpha( 1 )
		GlowPanel:setLeftRight( 0, 0, -104, 308 )
		GlowPanel:setTopBottom( 0, 0, -133, 279 )
		GlowPanel:setRGB( 1, 1, 1 )
		GlowPanel:setAlpha( 1 )
		Image00:setLeftRight( 0, 0, -7, 185 )
		Image00:setTopBottom( 0, 0, -36, 156 )
		Image00:setRGB( 0.2, 0.23, 0.29 )
		Image00:setAlpha( 0.45 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 8 )
				local GlowPanelFrame2 = function ( GlowPanel, event )
					if not event.interrupted then
						GlowPanel:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
					end
					GlowPanel:setLeftRight( 0, 0, -104, 308 )
					GlowPanel:setTopBottom( 0, 0, -133, 279 )
					GlowPanel:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( GlowPanel, event )
					else
						GlowPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GlowPanel:completeAnimation()
				self.GlowPanel:setLeftRight( 0, 0, -104, 308 )
				self.GlowPanel:setTopBottom( 0, 0, -0.5, 126.5 )
				self.GlowPanel:setAlpha( 0 )
				GlowPanelFrame2( GlowPanel, {} )
				local NumbersFrame2 = function ( Numbers, event )
					if not event.interrupted then
						Numbers:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
					end
					Numbers:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Numbers, event )
					else
						Numbers:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Numbers:completeAnimation()
				self.Numbers:setAlpha( 0 )
				NumbersFrame2( Numbers, {} )
				local Dot61Frame2 = function ( Dot61, event )
					if not event.interrupted then
						Dot61:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
					end
					Dot61:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Dot61, event )
					else
						Dot61:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dot61:completeAnimation()
				self.Dot61:setAlpha( 0 )
				Dot61Frame2( Dot61, {} )
				local Dot600Frame2 = function ( Dot600, event )
					if not event.interrupted then
						Dot600:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
					end
					Dot600:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Dot600, event )
					else
						Dot600:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dot600:completeAnimation()
				self.Dot600:setAlpha( 0 )
				Dot600Frame2( Dot600, {} )
				local Dot62Frame2 = function ( Dot62, event )
					if not event.interrupted then
						Dot62:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
					end
					Dot62:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Dot62, event )
					else
						Dot62:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dot62:completeAnimation()
				self.Dot62:setAlpha( 0 )
				Dot62Frame2( Dot62, {} )
				local Dot601Frame2 = function ( Dot601, event )
					if not event.interrupted then
						Dot601:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
					end
					Dot601:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Dot601, event )
					else
						Dot601:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dot601:completeAnimation()
				self.Dot601:setAlpha( 0 )
				Dot601Frame2( Dot601, {} )
				local Image0Frame2 = function ( Image0, event )
					if not event.interrupted then
						Image0:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
					end
					Image0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Image0, event )
					else
						Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setAlpha( 0 )
				Image0Frame2( Image0, {} )
				local Image00Frame2 = function ( Image00, event )
					if not event.interrupted then
						Image00:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
					end
					Image00:setLeftRight( 0, 0, -7, 185 )
					Image00:setTopBottom( 0, 0, -9, 127 )
					Image00:setAlpha( 0.45 )
					if event.interrupted then
						self.clipFinished( Image00, event )
					else
						Image00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image00:completeAnimation()
				self.Image00:setLeftRight( 0, 0, -7, 185 )
				self.Image00:setTopBottom( 0, 0, 59.5, 72.5 )
				self.Image00:setAlpha( 0 )
				Image00Frame2( Image00, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 8 )
				GlowPanel:completeAnimation()
				self.GlowPanel:setAlpha( 0 )
				self.clipFinished( GlowPanel, {} )
				Numbers:completeAnimation()
				self.Numbers:setAlpha( 0 )
				self.clipFinished( Numbers, {} )
				Dot61:completeAnimation()
				self.Dot61:setAlpha( 0 )
				self.clipFinished( Dot61, {} )
				Dot600:completeAnimation()
				self.Dot600:setAlpha( 0 )
				self.clipFinished( Dot600, {} )
				Dot62:completeAnimation()
				self.Dot62:setAlpha( 0 )
				self.clipFinished( Dot62, {} )
				Dot601:completeAnimation()
				self.Dot601:setAlpha( 0 )
				self.clipFinished( Dot601, {} )
				Image0:completeAnimation()
				self.Image0:setAlpha( 0 )
				self.clipFinished( Image0, {} )
				Image00:completeAnimation()
				self.Image00:setAlpha( 0 )
				self.clipFinished( Image00, {} )
			end
		},
		red = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				local GlowPanelFrame2 = function ( GlowPanel, event )
					local GlowPanelFrame3 = function ( GlowPanel, event )
						if not event.interrupted then
							GlowPanel:beginAnimation( "keyframe", 460, false, true, CoD.TweenType.Linear )
						end
						GlowPanel:setRGB( 1, 1, 1 )
						if event.interrupted then
							self.clipFinished( GlowPanel, event )
						else
							GlowPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						GlowPanelFrame3( GlowPanel, event )
						return 
					else
						GlowPanel:beginAnimation( "keyframe", 519, true, false, CoD.TweenType.Linear )
						GlowPanel:setRGB( 0.7, 0, 0 )
						GlowPanel:registerEventHandler( "transition_complete_keyframe", GlowPanelFrame3 )
					end
				end
				
				GlowPanel:completeAnimation()
				self.GlowPanel:setRGB( 1, 1, 1 )
				GlowPanelFrame2( GlowPanel, {} )
				local NumbersFrame2 = function ( Numbers, event )
					local NumbersFrame3 = function ( Numbers, event )
						if not event.interrupted then
							Numbers:beginAnimation( "keyframe", 460, false, true, CoD.TweenType.Linear )
						end
						Numbers:setRGB( 1, 1, 1 )
						if event.interrupted then
							self.clipFinished( Numbers, event )
						else
							Numbers:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						NumbersFrame3( Numbers, event )
						return 
					else
						Numbers:beginAnimation( "keyframe", 519, true, false, CoD.TweenType.Linear )
						Numbers:setRGB( 1, 0.23, 0.23 )
						Numbers:registerEventHandler( "transition_complete_keyframe", NumbersFrame3 )
					end
				end
				
				Numbers:completeAnimation()
				self.Numbers:setRGB( 1, 1, 1 )
				NumbersFrame2( Numbers, {} )
				local Image00Frame2 = function ( Image00, event )
					local Image00Frame3 = function ( Image00, event )
						if not event.interrupted then
							Image00:beginAnimation( "keyframe", 460, false, true, CoD.TweenType.Linear )
						end
						Image00:setRGB( 0.2, 0.23, 0.29 )
						if event.interrupted then
							self.clipFinished( Image00, event )
						else
							Image00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Image00Frame3( Image00, event )
						return 
					else
						Image00:beginAnimation( "keyframe", 519, true, false, CoD.TweenType.Linear )
						Image00:setRGB( 0.67, 0.03, 0 )
						Image00:registerEventHandler( "transition_complete_keyframe", Image00Frame3 )
					end
				end
				
				Image00:completeAnimation()
				self.Image00:setRGB( 0.2, 0.23, 0.29 )
				Image00Frame2( Image00, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueNonEmptyString( element, controller, "lobbyRoot.Pregame.timeleft" )
			end
		},
		{
			stateName = "red",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "lobbyRoot.Pregame.timeleft", 5 )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.timeleft" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.timeleft"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GlowPanel:close()
		self.Numbers:close()
		self.Dot61:close()
		self.Dot600:close()
		self.Dot62:close()
		self.Dot601:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

