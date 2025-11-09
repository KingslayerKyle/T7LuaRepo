local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0:registerEventHandler( "finished_movie_playback", function ( element, event )
		Engine.SendMenuResponse( f1_arg1, element.menuName, "finished_movie_playback" )
	end )
	f1_arg0.Movie:linkToElementModel( f1_arg0, "movieName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			local f3_local1 = CoD.SafeGetModelValue( f1_arg0:getModel(), "additive" )
			f3_local1 = f3_local1 and f3_local1 ~= 0
			local f3_local2 = CoD.SafeGetModelValue( f1_arg0:getModel(), "looping" )
			f3_local2 = f3_local2 and f3_local2 ~= 0
			if f3_local1 and Engine.IsSplitscreen() then
				f1_arg0.SplitscreenSideBarLeft:setAlpha( 100 )
				f1_arg0.SplitscreenSideBarRight:setAlpha( 100 )
			end
			f1_arg0.Movie:setupMoviePlayback( modelValue, f3_local1, f3_local2, CoD.SafeGetModelValue( f1_arg0:getModel(), "movieKey" ) or "" )
		end
	end )
	f1_arg0.BlackBg:linkToElementModel( f1_arg0, "showBlackScreen", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if not modelValue or modelValue == 0 then
			f1_arg0.BlackBg:setAlpha( 0 )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( f1_arg0, "close", function ( element )
		element.Movie:close()
	end )
end

LUI.createMenu.FullscreenMovie = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "FullscreenMovie" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "HUD"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "FullscreenMovie.buttonPrompts" )
	local f6_local1 = self
	
	local SplitscreenSideBarRight = LUI.UIImage.new()
	SplitscreenSideBarRight:setLeftRight( false, false, 640, 1115 )
	SplitscreenSideBarRight:setTopBottom( false, false, -360, 360 )
	SplitscreenSideBarRight:setRGB( 0, 0, 0 )
	SplitscreenSideBarRight:setAlpha( 0 )
	self:addElement( SplitscreenSideBarRight )
	self.SplitscreenSideBarRight = SplitscreenSideBarRight
	
	local SplitscreenSideBarLeft = LUI.UIImage.new()
	SplitscreenSideBarLeft:setLeftRight( false, false, -1141, -640 )
	SplitscreenSideBarLeft:setTopBottom( false, false, -360, 360 )
	SplitscreenSideBarLeft:setRGB( 0, 0, 0 )
	SplitscreenSideBarLeft:setAlpha( 0 )
	self:addElement( SplitscreenSideBarLeft )
	self.SplitscreenSideBarLeft = SplitscreenSideBarLeft
	
	local BlackBg = LUI.UIImage.new()
	BlackBg:setLeftRight( true, true, 0, 0 )
	BlackBg:setTopBottom( true, true, 0, 0 )
	BlackBg:setRGB( 0, 0, 0 )
	self:addElement( BlackBg )
	self.BlackBg = BlackBg
	
	local Movie = LUI.UIImage.new()
	Movie:setLeftRight( false, false, -640, 640 )
	Movie:setTopBottom( false, false, -360, 360 )
	Movie:setupMoviePlayback( "" )
	self:addElement( Movie )
	self.Movie = Movie
	
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f6_local1
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "FullscreenMovie.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

