require( "ui.uieditor.widgets.MPHudWidgets.WarScoreboard.WarScoreboard_TimerPanelInt" )

CoD.WarScoreInfoTimer = InheritFrom( LUI.UIElement )
CoD.WarScoreInfoTimer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.WarScoreInfoTimer )
	self.id = "WarScoreInfoTimer"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 112 )
	self:setTopBottom( 0, 0, 0, 53 )
	self.anyChildUsesUpdateState = true
	
	local TimerBG = CoD.WarScoreboard_TimerPanelInt.new( menu, controller )
	TimerBG:setLeftRight( 0, 0, 1, 109 )
	TimerBG:setTopBottom( 0, 0, 9, 45 )
	TimerBG:setRGB( 0.48, 0.54, 0.56 )
	self:addElement( TimerBG )
	self.TimerBG = TimerBG
	
	local GameTimer00 = LUI.UITightText.new()
	GameTimer00:setLeftRight( 0.5, 1.5, -56, -56 )
	GameTimer00:setTopBottom( 0.5, 1.01, -13, -13 )
	GameTimer00:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	GameTimer00:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	GameTimer00:setShaderVector( 0, 0, 0, 0, 0 )
	GameTimer00:setShaderVector( 1, 0, 0, 0, 0 )
	GameTimer00:setShaderVector( 2, 1, 0, 0, 0 )
	GameTimer00:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	GameTimer00:subscribeToGlobalModel( controller, "GameScore", "gameTimeEnd", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GameTimer00:setupGameTimer()
		end
	end )
	self:addElement( GameTimer00 )
	self.GameTimer00 = GameTimer00
	
	self.resetProperties = function ()
		GameTimer00:completeAnimation()
		TimerBG:completeAnimation()
		GameTimer00:setRGB( 1, 1, 1 )
		GameTimer00:setAlpha( 1 )
		TimerBG:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				TimerBG:completeAnimation()
				self.TimerBG:setAlpha( 0 )
				self.clipFinished( TimerBG, {} )
				GameTimer00:completeAnimation()
				self.GameTimer00:setAlpha( 0 )
				self.clipFinished( GameTimer00, {} )
			end,
			SpeedBoost = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		ActiveTimerLow = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				TimerBG:completeAnimation()
				self.TimerBG:setAlpha( 1 )
				self.clipFinished( TimerBG, {} )
				local GameTimer00Frame2 = function ( GameTimer00, event )
					local GameTimer00Frame3 = function ( GameTimer00, event )
						local GameTimer00Frame4 = function ( GameTimer00, event )
							if not event.interrupted then
								GameTimer00:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
							end
							GameTimer00:setRGB( 1, 1, 1 )
							if event.interrupted then
								self.clipFinished( GameTimer00, event )
							else
								GameTimer00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							GameTimer00Frame4( GameTimer00, event )
							return 
						else
							GameTimer00:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
							GameTimer00:setRGB( 1, 1, 1 )
							GameTimer00:registerEventHandler( "transition_complete_keyframe", GameTimer00Frame4 )
						end
					end
					
					if event.interrupted then
						GameTimer00Frame3( GameTimer00, event )
						return 
					else
						GameTimer00:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						GameTimer00:setRGB( 1, 0, 0 )
						GameTimer00:registerEventHandler( "transition_complete_keyframe", GameTimer00Frame3 )
					end
				end
				
				GameTimer00:completeAnimation()
				self.GameTimer00:setRGB( 1, 1, 1 )
				GameTimer00Frame2( GameTimer00, {} )
				self.nextClip = "DefaultClip"
			end
		},
		ActiveNormal = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "ActiveTimerLow",
			condition = function ( menu, element, event )
				return IsModelValueGreaterThan( controller, "gameScore.gameTimeEnd", 0 ) and IsModelValueEqualTo( controller, "gameScore.gameTimeLow", 1 )
			end
		},
		{
			stateName = "ActiveNormal",
			condition = function ( menu, element, event )
				return IsModelValueGreaterThan( controller, "gameScore.gameTimeEnd", 0 )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "gameScore.gameTimeEnd" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "gameScore.gameTimeEnd"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "gameScore.gameTimeLow" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "gameScore.gameTimeLow"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.TimerBG:close()
		self.GameTimer00:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

