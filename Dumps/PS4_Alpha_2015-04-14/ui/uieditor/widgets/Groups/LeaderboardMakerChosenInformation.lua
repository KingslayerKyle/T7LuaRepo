CoD.LeaderboardMakerChosenInformation = InheritFrom( LUI.UIElement )
CoD.LeaderboardMakerChosenInformation.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 5
	} )
	self:setAlignment( LUI.Alignment.Left )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LeaderboardMakerChosenInformation )
	self.id = "LeaderboardMakerChosenInformation"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 300 )
	self:setTopBottom( true, false, 0, 25 )
	
	local BaseLeaderboard = LUI.UITightText.new()
	BaseLeaderboard:setLeftRight( true, false, 0, 38 )
	BaseLeaderboard:setTopBottom( true, false, 0, 25 )
	BaseLeaderboard:setRGB( 1, 1, 1 )
	BaseLeaderboard:setText( Engine.Localize( "MENU_NEW" ) )
	BaseLeaderboard:setTTF( "fonts/default.ttf" )
	self:addElement( BaseLeaderboard )
	self.BaseLeaderboard = BaseLeaderboard
	
	local Slash1 = LUI.UITightText.new()
	Slash1:setLeftRight( true, false, 43, 54 )
	Slash1:setTopBottom( true, false, 0, 25 )
	Slash1:setRGB( 1, 1, 1 )
	Slash1:setText( Engine.Localize( "MP_SLASH" ) )
	Slash1:setTTF( "fonts/default.ttf" )
	self:addElement( Slash1 )
	self.Slash1 = Slash1
	
	local DefaultSort = LUI.UITightText.new()
	DefaultSort:setLeftRight( true, false, 59, 97 )
	DefaultSort:setTopBottom( true, false, 0, 25 )
	DefaultSort:setRGB( 1, 1, 1 )
	DefaultSort:setText( Engine.Localize( "MENU_NEW" ) )
	DefaultSort:setTTF( "fonts/default.ttf" )
	self:addElement( DefaultSort )
	self.DefaultSort = DefaultSort
	
	local Slash2 = LUI.UITightText.new()
	Slash2:setLeftRight( true, false, 102, 113 )
	Slash2:setTopBottom( true, false, 0, 25 )
	Slash2:setRGB( 1, 1, 1 )
	Slash2:setText( Engine.Localize( "MP_SLASH" ) )
	Slash2:setTTF( "fonts/default.ttf" )
	self:addElement( Slash2 )
	self.Slash2 = Slash2
	
	local TimeFrame = LUI.UITightText.new()
	TimeFrame:setLeftRight( true, false, 118, 156 )
	TimeFrame:setTopBottom( true, false, 0, 25 )
	TimeFrame:setRGB( 1, 1, 1 )
	TimeFrame:setText( Engine.Localize( "MENU_NEW" ) )
	TimeFrame:setTTF( "fonts/default.ttf" )
	self:addElement( TimeFrame )
	self.TimeFrame = TimeFrame
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				BaseLeaderboard:completeAnimation()
				self.BaseLeaderboard:setRGB( 1, 0.41, 0 )
				self.BaseLeaderboard:setAlpha( 1 )
				self.clipFinished( BaseLeaderboard, {} )
				Slash1:completeAnimation()
				self.Slash1:setAlpha( 0 )
				self.clipFinished( Slash1, {} )
				DefaultSort:completeAnimation()
				self.DefaultSort:setAlpha( 0 )
				self.clipFinished( DefaultSort, {} )
				Slash2:completeAnimation()
				self.Slash2:setAlpha( 0 )
				self.clipFinished( Slash2, {} )
				TimeFrame:completeAnimation()
				self.TimeFrame:setAlpha( 0 )
				self.clipFinished( TimeFrame, {} )
			end
		},
		StepTwo = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				BaseLeaderboard:completeAnimation()
				self.BaseLeaderboard:setRGB( 1, 1, 1 )
				self.BaseLeaderboard:setAlpha( 1 )
				self.clipFinished( BaseLeaderboard, {} )
				Slash1:completeAnimation()
				self.Slash1:setAlpha( 1 )
				self.clipFinished( Slash1, {} )
				DefaultSort:completeAnimation()
				self.DefaultSort:setRGB( 1, 0.41, 0 )
				self.DefaultSort:setAlpha( 1 )
				self.clipFinished( DefaultSort, {} )
				Slash2:completeAnimation()
				self.Slash2:setAlpha( 0 )
				self.clipFinished( Slash2, {} )
				TimeFrame:completeAnimation()
				self.TimeFrame:setAlpha( 0 )
				self.clipFinished( TimeFrame, {} )
			end
		},
		StepThree = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				BaseLeaderboard:completeAnimation()
				self.BaseLeaderboard:setRGB( 1, 1, 1 )
				self.BaseLeaderboard:setAlpha( 1 )
				self.clipFinished( BaseLeaderboard, {} )
				Slash1:completeAnimation()
				self.Slash1:setAlpha( 1 )
				self.clipFinished( Slash1, {} )
				DefaultSort:completeAnimation()
				self.DefaultSort:setRGB( 1, 1, 1 )
				self.DefaultSort:setAlpha( 1 )
				self.clipFinished( DefaultSort, {} )
				Slash2:completeAnimation()
				self.Slash2:setAlpha( 1 )
				self.clipFinished( Slash2, {} )
				TimeFrame:completeAnimation()
				self.TimeFrame:setRGB( 1, 0.41, 0 )
				self.TimeFrame:setAlpha( 1 )
				self.clipFinished( TimeFrame, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

