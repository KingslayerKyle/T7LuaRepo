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
	self:setLeftRight( 0, 0, 0, 450 )
	self:setTopBottom( 0, 0, 0, 37 )
	
	local BaseLeaderboard = LUI.UITightText.new()
	BaseLeaderboard:setLeftRight( 0, 0, 0, 57 )
	BaseLeaderboard:setTopBottom( 0, 0, 0, 38 )
	BaseLeaderboard:setText( Engine.Localize( "MENU_NEW" ) )
	BaseLeaderboard:setTTF( "fonts/default.ttf" )
	self:addElement( BaseLeaderboard )
	self.BaseLeaderboard = BaseLeaderboard
	
	local Slash1 = LUI.UITightText.new()
	Slash1:setLeftRight( 0, 0, 65, 81 )
	Slash1:setTopBottom( 0, 0, 0, 38 )
	Slash1:setText( Engine.Localize( "MP_SLASH" ) )
	Slash1:setTTF( "fonts/default.ttf" )
	self:addElement( Slash1 )
	self.Slash1 = Slash1
	
	local DefaultSort = LUI.UITightText.new()
	DefaultSort:setLeftRight( 0, 0, 89, 146 )
	DefaultSort:setTopBottom( 0, 0, 0, 38 )
	DefaultSort:setText( Engine.Localize( "MENU_NEW" ) )
	DefaultSort:setTTF( "fonts/default.ttf" )
	self:addElement( DefaultSort )
	self.DefaultSort = DefaultSort
	
	local Slash2 = LUI.UITightText.new()
	Slash2:setLeftRight( 0, 0, 153, 169 )
	Slash2:setTopBottom( 0, 0, 0, 38 )
	Slash2:setText( Engine.Localize( "MP_SLASH" ) )
	Slash2:setTTF( "fonts/default.ttf" )
	self:addElement( Slash2 )
	self.Slash2 = Slash2
	
	local TimeFrame = LUI.UITightText.new()
	TimeFrame:setLeftRight( 0, 0, 177, 234 )
	TimeFrame:setTopBottom( 0, 0, 0, 38 )
	TimeFrame:setText( Engine.Localize( "MENU_NEW" ) )
	TimeFrame:setTTF( "fonts/default.ttf" )
	self:addElement( TimeFrame )
	self.TimeFrame = TimeFrame
	
	self.resetProperties = function ()
		BaseLeaderboard:completeAnimation()
		Slash1:completeAnimation()
		DefaultSort:completeAnimation()
		Slash2:completeAnimation()
		TimeFrame:completeAnimation()
		BaseLeaderboard:setRGB( 1, 1, 1 )
		Slash1:setAlpha( 1 )
		DefaultSort:setRGB( 1, 1, 1 )
		DefaultSort:setAlpha( 1 )
		Slash2:setAlpha( 1 )
		TimeFrame:setRGB( 1, 1, 1 )
		TimeFrame:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				BaseLeaderboard:completeAnimation()
				self.BaseLeaderboard:setRGB( 1, 0.41, 0 )
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
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				DefaultSort:completeAnimation()
				self.DefaultSort:setRGB( 1, 0.41, 0 )
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
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				TimeFrame:completeAnimation()
				self.TimeFrame:setRGB( 1, 0.41, 0 )
				self.clipFinished( TimeFrame, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

