require( "ui.uieditor.widgets.HUD.PrematchCountdown.PrematchCountdown_IconGlowPanel" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.HUD.PrematchCountdown.PrematchCountdown_NumbersInternal" )
require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidget_Dot" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_BackLine" )

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
	self:setLeftRight( true, false, 0, 383 )
	self:setTopBottom( true, false, 0, 148 )
	self.anyChildUsesUpdateState = true
	
	local GlowPanel = CoD.PrematchCountdown_IconGlowPanel.new( menu, controller )
	GlowPanel:setLeftRight( true, false, 62, 336.5 )
	GlowPanel:setTopBottom( true, false, -56.75, 217.75 )
	self:addElement( GlowPanel )
	self.GlowPanel = GlowPanel
	
	local PanelAmmo = CoD.FE_ButtonPanel.new( menu, controller )
	PanelAmmo:setLeftRight( false, false, -72, 68 )
	PanelAmmo:setTopBottom( false, false, -39.5, 25.5 )
	PanelAmmo:setRGB( 0, 0, 0 )
	PanelAmmo:setAlpha( 0 )
	self:addElement( PanelAmmo )
	self.PanelAmmo = PanelAmmo
	
	local Numbers = CoD.PrematchCountdown_NumbersInternal.new( menu, controller )
	Numbers:setLeftRight( true, false, 129.5, 249.5 )
	Numbers:setTopBottom( true, false, 33.5, 103.5 )
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
	Check:setLeftRight( true, false, 164.5, 218.5 )
	Check:setTopBottom( true, false, 41.5, 95.5 )
	Check:setAlpha( 0 )
	Check:setImage( RegisterImage( "uie_t7_menu_mp_icons_gamemode_graphic_logowhite" ) )
	self:addElement( Check )
	self.Check = Check
	
	local Dot61 = CoD.DamageWidget_Dot.new( menu, controller )
	Dot61:setLeftRight( true, false, 121.5, 125.5 )
	Dot61:setTopBottom( true, false, 112.5, 116.5 )
	Dot61:setZoom( 5 )
	self:addElement( Dot61 )
	self.Dot61 = Dot61
	
	local Dot600 = CoD.DamageWidget_Dot.new( menu, controller )
	Dot600:setLeftRight( true, false, 254.5, 258.5 )
	Dot600:setTopBottom( true, false, 112.5, 116.5 )
	Dot600:setZoom( 5 )
	self:addElement( Dot600 )
	self.Dot600 = Dot600
	
	local Dot62 = CoD.DamageWidget_Dot.new( menu, controller )
	Dot62:setLeftRight( true, false, 121.5, 125.5 )
	Dot62:setTopBottom( true, false, 8.5, 12.5 )
	Dot62:setZoom( 5 )
	self:addElement( Dot62 )
	self.Dot62 = Dot62
	
	local Dot601 = CoD.DamageWidget_Dot.new( menu, controller )
	Dot601:setLeftRight( true, false, 254.5, 258.5 )
	Dot601:setTopBottom( true, false, 8.5, 12.5 )
	Dot601:setZoom( 5 )
	self:addElement( Dot601 )
	self.Dot601 = Dot601
	
	local LineTop = CoD.AmmoWidget_BackLine.new( menu, controller )
	LineTop:setLeftRight( true, false, 173.5, 205.5 )
	LineTop:setTopBottom( true, false, -12.86, -9.86 )
	LineTop:setZRot( -90 )
	self:addElement( LineTop )
	self.LineTop = LineTop
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 124.5, 252.5 )
	Image0:setTopBottom( true, false, 8, 136 )
	Image0:setRGB( 0.2, 0.23, 0.3 )
	Image0:setAlpha( 0.68 )
	Image0:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local TimerStatus = LUI.UIText.new()
	TimerStatus:setLeftRight( true, false, 0, 383 )
	TimerStatus:setTopBottom( true, false, 0.14, 22.14 )
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
	LineTop0:setLeftRight( false, false, -18, 14 )
	LineTop0:setTopBottom( false, false, 55.64, 58.64 )
	LineTop0:setZRot( -90 )
	self:addElement( LineTop0 )
	self.LineTop0 = LineTop0
	
	local ready = LUI.UIImage.new()
	ready:setLeftRight( true, false, 159.58, 219.5 )
	ready:setTopBottom( true, false, 42.82, 94.18 )
	ready:setAlpha( 0 )
	ready:setImage( RegisterImage( "uie_t7_icon_pregame_ready" ) )
	self:addElement( ready )
	self.ready = ready
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				Numbers:completeAnimation()
				self.Numbers:setAlpha( 1 )
				self.clipFinished( Numbers, {} )
				Check:completeAnimation()
				self.Check:setAlpha( 0 )
				self.clipFinished( Check, {} )
				LineTop0:completeAnimation()
				self.LineTop0:setLeftRight( false, false, -16, 16 )
				self.LineTop0:setTopBottom( false, false, 125.14, 128.14 )
				self.clipFinished( LineTop0, {} )
				ready:completeAnimation()
				self.ready:setAlpha( 0 )
				self.clipFinished( ready, {} )
			end
		},
		PostStage = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				Numbers:completeAnimation()
				self.Numbers:setAlpha( 0 )
				self.clipFinished( Numbers, {} )
				Check:completeAnimation()
				self.Check:setLeftRight( true, false, 164.5, 218.5 )
				self.Check:setTopBottom( true, false, 42, 96 )
				self.Check:setRGB( 1, 1, 1 )
				self.Check:setAlpha( 0 )
				self.clipFinished( Check, {} )
				ready:completeAnimation()
				self.ready:setAlpha( 0 )
				self.clipFinished( ready, {} )
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

