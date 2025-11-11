CoD.LeaderboardMakerProgressBar = InheritFrom( LUI.UIElement )
CoD.LeaderboardMakerProgressBar.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LeaderboardMakerProgressBar )
	self.id = "LeaderboardMakerProgressBar"
	self.soundSet = "HUD"
	self:setLeftRight( 0, 0, 0, 243 )
	self:setTopBottom( 0, 0, 0, 37 )
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( 0, 0, 105, 144 )
	Background:setTopBottom( 0, 0, 0, 38 )
	Background:setRGB( 1, 0.41, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local Step = LUI.UIText.new()
	Step:setLeftRight( 0, 0, 0, 105 )
	Step:setTopBottom( 0, 0, 0, 38 )
	Step:setRGB( 1, 0.41, 0 )
	Step:setText( Engine.Localize( "GROUPS_STEP_CAPS" ) )
	Step:setTTF( "fonts/default.ttf" )
	Step:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Step:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Step )
	self.Step = Step
	
	local One = LUI.UITightText.new()
	One:setLeftRight( 0, 0, 115, 133 )
	One:setTopBottom( 0, 0, 0, 38 )
	One:setRGB( 1, 0.41, 0 )
	One:setText( Engine.Localize( "1" ) )
	One:setTTF( "fonts/default.ttf" )
	self:addElement( One )
	self.One = One
	
	local Two = LUI.UITightText.new()
	Two:setLeftRight( 0, 0, 172, 190 )
	Two:setTopBottom( 0, 0, 0, 38 )
	Two:setRGB( 1, 0.41, 0 )
	Two:setText( Engine.Localize( "2" ) )
	Two:setTTF( "fonts/default.ttf" )
	self:addElement( Two )
	self.Two = Two
	
	local Three = LUI.UITightText.new()
	Three:setLeftRight( 0, 0, 213, 231 )
	Three:setTopBottom( 0, 0, 0, 38 )
	Three:setRGB( 1, 0.41, 0 )
	Three:setText( Engine.Localize( "3" ) )
	Three:setTTF( "fonts/default.ttf" )
	self:addElement( Three )
	self.Three = Three
	
	self.resetProperties = function ()
		One:completeAnimation()
		Background:completeAnimation()
		Two:completeAnimation()
		Three:completeAnimation()
		One:setRGB( 1, 0.41, 0 )
		Background:setLeftRight( 0, 0, 105, 144 )
		Background:setTopBottom( 0, 0, 0, 38 )
		Two:setRGB( 1, 0.41, 0 )
		Three:setRGB( 1, 0.41, 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				One:completeAnimation()
				self.One:setRGB( 0, 0, 0 )
				self.clipFinished( One, {} )
			end
		},
		StepTwo = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				Background:completeAnimation()
				self.Background:setLeftRight( 0, 0, 161, 200 )
				self.Background:setTopBottom( 0, 0, 0, 38 )
				self.clipFinished( Background, {} )
				Two:completeAnimation()
				self.Two:setRGB( 0, 0, 0 )
				self.clipFinished( Two, {} )
			end
		},
		StepThree = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				Background:completeAnimation()
				self.Background:setLeftRight( 0, 0, 202, 241 )
				self.Background:setTopBottom( 0, 0, 0, 38 )
				self.clipFinished( Background, {} )
				Three:completeAnimation()
				self.Three:setRGB( 0, 0, 0 )
				self.clipFinished( Three, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

