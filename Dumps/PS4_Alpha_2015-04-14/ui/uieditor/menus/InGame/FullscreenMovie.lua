local PostLoadFunc = function ( self, controller )
	self:registerEventHandler( "finished_movie_playback", function ( self, event )
		Engine.SendMenuResponse( controller, self.menuName, "finished_movie_playback" )
	end )
	self.Movie:linkToElementModel( self, "movieName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			self.Movie:setupMoviePlayback( modelValue )
		end
	end )
	self.BlackBg:linkToElementModel( self, "showBlackScreen", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if not modelValue or modelValue == 0 then
			self.BlackBg:setAlpha( 0 )
		end
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
	self:playSound( "menu_open" )
	local menu = self
	
	local BlackBg = LUI.UIImage.new()
	BlackBg:setLeftRight( true, true, 0, 0 )
	BlackBg:setTopBottom( true, true, 0, 0 )
	BlackBg:setRGB( 0, 0, 0 )
	BlackBg:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( BlackBg )
	self.BlackBg = BlackBg
	
	local Movie = LUI.UIImage.new()
	Movie:setLeftRight( false, false, -640, 640 )
	Movie:setTopBottom( false, false, -360, 360 )
	Movie:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	Movie:setupMoviePlayback( "" )
	self:addElement( Movie )
	self.Movie = Movie
	
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = menu
	} )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

