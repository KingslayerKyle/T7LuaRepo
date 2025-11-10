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
	self:setLeftRight( true, false, 0, 162 )
	self:setTopBottom( true, false, 0, 25 )
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, false, 70, 96 )
	Background:setTopBottom( true, false, 0, 25 )
	Background:setRGB( 1, 0.41, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local Step = LUI.UIText.new()
	Step:setLeftRight( true, false, 0, 70 )
	Step:setTopBottom( true, false, 0, 25 )
	Step:setRGB( 1, 0.41, 0 )
	Step:setText( Engine.Localize( "GROUPS_STEP_CAPS" ) )
	Step:setTTF( "fonts/default.ttf" )
	Step:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Step:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Step )
	self.Step = Step
	
	local One = LUI.UITightText.new()
	One:setLeftRight( true, false, 76.5, 88.5 )
	One:setTopBottom( true, false, 0, 25 )
	One:setRGB( 1, 0.41, 0 )
	One:setText( Engine.Localize( "1" ) )
	One:setTTF( "fonts/default.ttf" )
	self:addElement( One )
	self.One = One
	
	local Two = LUI.UITightText.new()
	Two:setLeftRight( true, false, 114.5, 126.5 )
	Two:setTopBottom( true, false, 0, 25 )
	Two:setRGB( 1, 0.41, 0 )
	Two:setText( Engine.Localize( "2" ) )
	Two:setTTF( "fonts/default.ttf" )
	self:addElement( Two )
	self.Two = Two
	
	local Three = LUI.UITightText.new()
	Three:setLeftRight( true, false, 142, 154 )
	Three:setTopBottom( true, false, 0, 25 )
	Three:setRGB( 1, 0.41, 0 )
	Three:setText( Engine.Localize( "3" ) )
	Three:setTTF( "fonts/default.ttf" )
	self:addElement( Three )
	self.Three = Three
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				Background:completeAnimation()
				self.Background:setLeftRight( true, false, 70, 96 )
				self.Background:setTopBottom( true, false, 0, 25 )
				self.Background:setAlpha( 1 )
				self.clipFinished( Background, {} )
				One:completeAnimation()
				self.One:setRGB( 0, 0, 0 )
				self.clipFinished( One, {} )
				Two:completeAnimation()
				self.Two:setRGB( 1, 0.41, 0 )
				self.clipFinished( Two, {} )
				Three:completeAnimation()
				self.Three:setRGB( 1, 0.41, 0 )
				self.clipFinished( Three, {} )
			end
		},
		StepTwo = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				Background:completeAnimation()
				self.Background:setLeftRight( true, false, 107.5, 133.5 )
				self.Background:setTopBottom( true, false, 0, 25 )
				self.Background:setAlpha( 1 )
				self.clipFinished( Background, {} )
				One:completeAnimation()
				self.One:setRGB( 1, 0.41, 0 )
				self.clipFinished( One, {} )
				Two:completeAnimation()
				self.Two:setRGB( 0, 0, 0 )
				self.clipFinished( Two, {} )
				Three:completeAnimation()
				self.Three:setRGB( 1, 0.41, 0 )
				self.clipFinished( Three, {} )
			end
		},
		StepThree = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				Background:completeAnimation()
				self.Background:setLeftRight( true, false, 135, 161 )
				self.Background:setTopBottom( true, false, 0, 25 )
				self.Background:setAlpha( 1 )
				self.clipFinished( Background, {} )
				One:completeAnimation()
				self.One:setRGB( 1, 0.41, 0 )
				self.clipFinished( One, {} )
				Two:completeAnimation()
				self.Two:setRGB( 1, 0.41, 0 )
				self.clipFinished( Two, {} )
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

