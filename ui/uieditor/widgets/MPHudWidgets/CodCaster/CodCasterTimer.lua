-- cd497377eda607776d0697a7320cfb5b
-- This hash is used for caching, delete to decompile the file again

CoD.CodCasterTimer = InheritFrom( LUI.UIElement )
CoD.CodCasterTimer.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CodCasterTimer )
	self.id = "CodCasterTimer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 72 )
	self:setTopBottom( true, false, 0, 36 )
	
	local GameTimer = LUI.UITightText.new()
	GameTimer:setLeftRight( false, false, -30.5, 30.5 )
	GameTimer:setTopBottom( true, false, 0, 36 )
	GameTimer:setTTF( "fonts/default.ttf" )
	GameTimer:setupGameTimer()
	GameTimer:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self:addElement( GameTimer )
	self.GameTimer = GameTimer
	
	local NoTimeLimit0 = LUI.UIText.new()
	NoTimeLimit0:setLeftRight( true, false, -2.5, 74.5 )
	NoTimeLimit0:setTopBottom( true, false, 4, 26 )
	NoTimeLimit0:setText( Engine.Localize( "MPUI_UNLIMITED_TIME_CAPS" ) )
	NoTimeLimit0:setTTF( "fonts/default.ttf" )
	NoTimeLimit0:setLetterSpacing( -0.5 )
	NoTimeLimit0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	NoTimeLimit0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( NoTimeLimit0 )
	self.NoTimeLimit0 = NoTimeLimit0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				GameTimer:completeAnimation()
				self.GameTimer:setAlpha( 0 )
				self.clipFinished( GameTimer, {} )

				NoTimeLimit0:completeAnimation()
				self.NoTimeLimit0:setAlpha( 0 )
				self.clipFinished( NoTimeLimit0, {} )
			end
		},
		Active = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				GameTimer:completeAnimation()
				self.GameTimer:setRGB( 1, 1, 1 )
				self.GameTimer:setAlpha( 1 )
				self.clipFinished( GameTimer, {} )

				NoTimeLimit0:completeAnimation()
				self.NoTimeLimit0:setAlpha( 0 )
				self.clipFinished( NoTimeLimit0, {} )
			end
		},
		TimeLow = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				GameTimer:completeAnimation()
				self.GameTimer:setRGB( 1, 0, 0 )
				self.GameTimer:setAlpha( 1 )
				self.clipFinished( GameTimer, {} )

				NoTimeLimit0:completeAnimation()
				self.NoTimeLimit0:setAlpha( 0 )
				self.clipFinished( NoTimeLimit0, {} )
			end
		},
		NoTimeLimit = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				GameTimer:completeAnimation()
				self.GameTimer:setAlpha( 0 )
				self.clipFinished( GameTimer, {} )

				NoTimeLimit0:completeAnimation()
				self.NoTimeLimit0:setAlpha( 1 )
				self.clipFinished( NoTimeLimit0, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Active",
			condition = function ( menu, element, event )
				return IsModelValueGreaterThan( controller, "gameScore.gameTimeEnd", 0 ) and not IsModelValueEqualTo( controller, "gameScore.gameTimeLow", 1 )
			end
		},
		{
			stateName = "TimeLow",
			condition = function ( menu, element, event )
				return IsModelValueGreaterThan( controller, "gameScore.gameTimeEnd", 0 )
			end
		},
		{
			stateName = "NoTimeLimit",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "gameScore.gameTimeLimit", 0 )
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
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "gameScore.gameTimeLimit" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "gameScore.gameTimeLimit"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

