require( "ui.uieditor.widgets.HUD.core_MapWidget.MapWidget_PanelVignetteLeft" )
require( "ui.uieditor.widgets.HUD.core_MapWidget.MapWidgetContainer" )

local PostLoadFunc = function ( self, controller )
	self:registerEventHandler( "finished_movie_playback", function ( self, event )
		self.PanelVignetteLeft:playClip( "HudStop" )
		self.MapWidgetContainer.MapWidget:playClip( "HudStop" )
		self.MapWidgetContainer.MapWidget:registerEventHandler( "clip_over", function ( mapWidget, event )
			Engine.SendMenuResponse( controller, self.menuName, "finished_movie_playback" )
		end )
	end )
	self.Movie:linkToElementModel( self, "movieName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			self.Movie:setAlpha( 0 )
			self.PanelVignetteLeft:playClip( "HudStart" )
			self.MapWidgetContainer.MapWidget:playClip( "HudStart" )
			self.MapWidgetContainer.MapWidget:registerEventHandler( "clip_over", function ( mapWidget, event )
				self.Movie:setupMoviePlayback( modelValue, true )
				self.Movie:setAlpha( 1 )
			end )
		end
	end )
end

LUI.createMenu.PiPMenu = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "PiPMenu" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "HUD"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local PanelVignetteLeft = CoD.MapWidget_PanelVignetteLeft.new( self, controller )
	PanelVignetteLeft:setLeftRight( false, false, -677, -83 )
	PanelVignetteLeft:setTopBottom( false, false, -371, 36 )
	PanelVignetteLeft:setRGB( 1, 1, 1 )
	self:addElement( PanelVignetteLeft )
	self.PanelVignetteLeft = PanelVignetteLeft
	
	local MapWidgetContainer = CoD.MapWidgetContainer.new( self, controller )
	MapWidgetContainer:setLeftRight( true, false, 19, 302 )
	MapWidgetContainer:setTopBottom( true, false, 4.67, 208.67 )
	MapWidgetContainer:setRGB( 1, 1, 1 )
	self:addElement( MapWidgetContainer )
	self.MapWidgetContainer = MapWidgetContainer
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 37.95, 285.05 )
	Image0:setTopBottom( true, false, 26, 165 )
	Image0:setRGB( 1, 1, 1 )
	Image0:setAlpha( 0 )
	Image0:setXRot( -17 )
	Image0:setYRot( 21 )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Movie = LUI.UIImage.new()
	Movie:setLeftRight( true, false, 32.61, 290.39 )
	Movie:setTopBottom( true, false, 23.16, 168 )
	Movie:setRGB( 1, 1, 1 )
	Movie:setXRot( -17 )
	Movie:setYRot( 21 )
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
		menu = self
	} )
	self.close = function ( self )
		self.PanelVignetteLeft:close()
		self.MapWidgetContainer:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

