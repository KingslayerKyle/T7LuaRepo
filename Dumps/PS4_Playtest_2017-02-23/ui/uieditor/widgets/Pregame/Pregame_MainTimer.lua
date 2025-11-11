require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_BackLine" )
require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidget_Dot" )
require( "ui.uieditor.widgets.HUD.PrematchCountdown.PrematchCountdown_IconGlowPanel" )
require( "ui.uieditor.widgets.HUD.PrematchCountdown.PrematchCountdown_NumbersInternal" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )

CoD.Pregame_MainTimer = InheritFrom( LUI.UIElement )
CoD.Pregame_MainTimer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Pregame_MainTimer )
	self.id = "Pregame_MainTimer"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 574 )
	self:setTopBottom( 0, 0, 0, 222 )
	
	local GlowPanel = CoD.PrematchCountdown_IconGlowPanel.new( menu, controller )
	GlowPanel:setLeftRight( 0, 0, 93, 505 )
	GlowPanel:setTopBottom( 0, 0, -85, 327 )
	self:addElement( GlowPanel )
	self.GlowPanel = GlowPanel
	
	local PanelAmmo = CoD.FE_ButtonPanel.new( menu, controller )
	PanelAmmo:setLeftRight( 0.5, 0.5, -108, 102 )
	PanelAmmo:setTopBottom( 0.5, 0.5, -59, 39 )
	PanelAmmo:setRGB( 0, 0, 0 )
	PanelAmmo:setAlpha( 0 )
	self:addElement( PanelAmmo )
	self.PanelAmmo = PanelAmmo
	
	local Numbers = CoD.PrematchCountdown_NumbersInternal.new( menu, controller )
	Numbers:setLeftRight( 0, 0, 194, 374 )
	Numbers:setTopBottom( 0, 0, 50.5, 155.5 )
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
	
	local Check = LUI.UIImage.new()
	Check:setLeftRight( 0, 0, 247, 328 )
	Check:setTopBottom( 0, 0, 62, 143 )
	Check:setAlpha( 0 )
	Check:setImage( RegisterImage( "playlist_sticksnstones" ) )
	self:addElement( Check )
	self.Check = Check
	
	local Dot61 = CoD.DamageWidget_Dot.new( menu, controller )
	Dot61:setLeftRight( 0, 0, 182, 188 )
	Dot61:setTopBottom( 0, 0, 169, 175 )
	Dot61:setZoom( 5 )
	self:addElement( Dot61 )
	self.Dot61 = Dot61
	
	local Dot600 = CoD.DamageWidget_Dot.new( menu, controller )
	Dot600:setLeftRight( 0, 0, 382, 388 )
	Dot600:setTopBottom( 0, 0, 169, 175 )
	Dot600:setZoom( 5 )
	self:addElement( Dot600 )
	self.Dot600 = Dot600
	
	local Dot62 = CoD.DamageWidget_Dot.new( menu, controller )
	Dot62:setLeftRight( 0, 0, 182, 188 )
	Dot62:setTopBottom( 0, 0, 13, 19 )
	Dot62:setZoom( 5 )
	self:addElement( Dot62 )
	self.Dot62 = Dot62
	
	local Dot601 = CoD.DamageWidget_Dot.new( menu, controller )
	Dot601:setLeftRight( 0, 0, 382, 388 )
	Dot601:setTopBottom( 0, 0, 13, 19 )
	Dot601:setZoom( 5 )
	self:addElement( Dot601 )
	self.Dot601 = Dot601
	
	local LineTop = CoD.AmmoWidget_BackLine.new( menu, controller )
	LineTop:setLeftRight( 0, 0, 260, 308 )
	LineTop:setTopBottom( 0, 0, -19, -15 )
	LineTop:setZRot( -90 )
	self:addElement( LineTop )
	self.LineTop = LineTop
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 0, 187, 379 )
	Image0:setTopBottom( 0, 0, 12, 204 )
	Image0:setRGB( 0.2, 0.23, 0.3 )
	Image0:setAlpha( 0.68 )
	Image0:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local TimerStatus = LUI.UIText.new()
	TimerStatus:setLeftRight( 0, 0, 0, 574 )
	TimerStatus:setTopBottom( 0, 0, 0, 33 )
	TimerStatus:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TimerStatus:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TimerStatus:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	TimerStatus:subscribeToGlobalModel( controller, "PregameGlobal", "status", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TimerStatus:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( TimerStatus )
	self.TimerStatus = TimerStatus
	
	local LineTop0 = CoD.AmmoWidget_BackLine.new( menu, controller )
	LineTop0:setLeftRight( 0.5, 0.5, -27, 21 )
	LineTop0:setTopBottom( 0.5, 0.5, 84, 88 )
	LineTop0:setZRot( -90 )
	self:addElement( LineTop0 )
	self.LineTop0 = LineTop0
	
	local ready = LUI.UIImage.new()
	ready:setLeftRight( 0, 0, 239, 329 )
	ready:setTopBottom( 0, 0, 64, 141 )
	ready:setAlpha( 0 )
	ready:setImage( RegisterImage( "uie_t7_icon_pregame_ready" ) )
	self:addElement( ready )
	self.ready = ready
	
	self.resetProperties = function ()
		LineTop0:completeAnimation()
		Check:completeAnimation()
		Numbers:completeAnimation()
		LineTop0:setLeftRight( 0.5, 0.5, -27, 21 )
		LineTop0:setTopBottom( 0.5, 0.5, 84, 88 )
		Check:setLeftRight( 0, 0, 247, 328 )
		Check:setTopBottom( 0, 0, 62, 143 )
		Numbers:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				LineTop0:completeAnimation()
				self.LineTop0:setLeftRight( 0.5, 0.5, -24, 24 )
				self.LineTop0:setTopBottom( 0.5, 0.5, 188, 192 )
				self.clipFinished( LineTop0, {} )
			end
		},
		PostStage = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				Numbers:completeAnimation()
				self.Numbers:setAlpha( 0 )
				self.clipFinished( Numbers, {} )
				Check:completeAnimation()
				self.Check:setLeftRight( 0, 0, 247, 328 )
				self.Check:setTopBottom( 0, 0, 63, 144 )
				self.clipFinished( Check, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "PostStage",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "lobbyRoot.Pregame.stage", 3 )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.stage" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.stage"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GlowPanel:close()
		self.PanelAmmo:close()
		self.Numbers:close()
		self.Dot61:close()
		self.Dot600:close()
		self.Dot62:close()
		self.Dot601:close()
		self.LineTop:close()
		self.LineTop0:close()
		self.TimerStatus:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

