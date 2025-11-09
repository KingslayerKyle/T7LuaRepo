require( "ui.uieditor.widgets.EndGameFlow.KillcamWidgetVignetteTop" )
require( "ui.uieditor.widgets.EndGameFlow.KillcamWidgetTitle" )
require( "ui.uieditor.widgets.Effects.fxGlitch1_Main" )

CoD.KillcamHeader = InheritFrom( LUI.UIElement )
CoD.KillcamHeader.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.KillcamHeader )
	self.id = "KillcamHeader"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 128 )
	self.anyChildUsesUpdateState = true
	
	local KillcamWidgetVignetteTop0 = CoD.KillcamWidgetVignetteTop.new( menu, controller )
	KillcamWidgetVignetteTop0:setLeftRight( false, false, -640, 640 )
	KillcamWidgetVignetteTop0:setTopBottom( false, false, -64, 48 )
	KillcamWidgetVignetteTop0:setRGB( 1, 1, 1 )
	self:addElement( KillcamWidgetVignetteTop0 )
	self.KillcamWidgetVignetteTop0 = KillcamWidgetVignetteTop0
	
	local KillcamWidgetTitle0 = CoD.KillcamWidgetTitle.new( menu, controller )
	KillcamWidgetTitle0:setLeftRight( false, false, -150, 150 )
	KillcamWidgetTitle0:setTopBottom( true, false, 29, 82 )
	KillcamWidgetTitle0:setRGB( 1, 1, 1 )
	KillcamWidgetTitle0.KillcamText0:setText( Engine.Localize( "MP_KILLCAM_CAPS" ) )
	self:addElement( KillcamWidgetTitle0 )
	self.KillcamWidgetTitle0 = KillcamWidgetTitle0
	
	local Glitch = CoD.fxGlitch1_Main.new( menu, controller )
	Glitch:setLeftRight( true, false, 322.5, 879.5 )
	Glitch:setTopBottom( true, false, -32, 175 )
	Glitch:setRGB( 1, 1, 1 )
	self:addElement( Glitch )
	self.Glitch = Glitch
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Killcam = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				KillcamWidgetTitle0:completeAnimation()
				KillcamWidgetTitle0.KillcamText0:completeAnimation()
				self.KillcamWidgetTitle0.KillcamText0:setText( Engine.Localize( "MP_KILLCAM_CAPS" ) )
				self.clipFinished( KillcamWidgetTitle0, {} )
			end
		},
		FinalKillcam = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				KillcamWidgetTitle0:completeAnimation()
				KillcamWidgetTitle0.KillcamText0:completeAnimation()
				self.KillcamWidgetTitle0.KillcamText0:setText( Engine.Localize( "MP_FINAL_KILLCAM_CAPS" ) )
				self.clipFinished( KillcamWidgetTitle0, {} )
			end
		},
		NemesisKillcam = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				KillcamWidgetTitle0:completeAnimation()
				KillcamWidgetTitle0.KillcamText0:completeAnimation()
				self.KillcamWidgetTitle0.KillcamText0:setText( Engine.Localize( "MP_NEMESIS_KILLCAM_CAPS" ) )
				self.clipFinished( KillcamWidgetTitle0, {} )
			end
		},
		RoundEndingKillcam = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				KillcamWidgetTitle0:completeAnimation()
				KillcamWidgetTitle0.KillcamText0:completeAnimation()
				self.KillcamWidgetTitle0.KillcamText0:setText( Engine.Localize( "MP_ROUND_END_KILLCAM" ) )
				self.clipFinished( KillcamWidgetTitle0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Killcam",
			condition = function ( menu, element, event )
				local f7_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM )
				if f7_local0 then
					if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_NEMESIS_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ) then
						f7_local0 = not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM )
					else
						f7_local0 = false
					end
				end
				return f7_local0
			end
		},
		{
			stateName = "FinalKillcam",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_FINAL_KILLCAM )
			end
		},
		{
			stateName = "NemesisKillcam",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_NEMESIS_KILLCAM )
			end
		},
		{
			stateName = "RoundEndingKillcam",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM )
			end
		}
	} )
	if self.m_eventHandlers.hud_update_refresh then
		local currentEv = self.m_eventHandlers.hud_update_refresh
		self:registerEventHandler( "hud_update_refresh", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		self:registerEventHandler( "hud_update_refresh", LUI.UIElement.updateState )
	end
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_NEMESIS_KILLCAM ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_NEMESIS_KILLCAM
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_FINAL_KILLCAM
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM
		} )
	end )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, state )
		if IsElementInState( element, "Killcam" ) then
			PlayClipOnElement( self, {
				elementName = "Glitch",
				clipName = "GlitchSmall2Slow"
			}, controller )
		end
	end )
	self.close = function ( self )
		self.KillcamWidgetVignetteTop0:close()
		self.KillcamWidgetTitle0:close()
		self.Glitch:close()
		CoD.KillcamHeader.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

