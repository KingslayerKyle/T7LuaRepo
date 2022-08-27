-- 3a0cb474a46d990300e0fd30420d2332
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.core_MapWidget.MapWidget_PanelVignetteLeft" )
require( "ui.uieditor.widgets.HUD.core_MapWidget.MapWidgetContainer" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0:registerEventHandler( "finished_movie_playback", function ( element, event )
		element.PanelVignetteLeft:playClip( "HudStop" )
		element.MapWidgetContainer.MapWidget:playClip( "HudStop" )
		element.MapWidgetContainer.MapWidget:registerEventHandler( "clip_over", function ( element, event )
			Engine.SendMenuResponse( f1_arg1, element.menuName, "finished_movie_playback" )
		end )
	end )
	f1_arg0.Movie:linkToElementModel( f1_arg0, "movieName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			f1_arg0.Movie:setAlpha( 0 )
			f1_arg0.PanelVignetteLeft:playClip( "HudStart" )
			f1_arg0.MapWidgetContainer.MapWidget:playClip( "HudStart" )
			f1_arg0.MapWidgetContainer.MapWidget:registerEventHandler( "clip_over", function ( element, event )
				local f5_local0 = CoD.SafeGetModelValue( f1_arg0:getModel(), "additive" )
				f5_local0 = f5_local0 and f5_local0 ~= 0
				local f5_local1 = CoD.SafeGetModelValue( f1_arg0:getModel(), "looping" )
				f1_arg0.Movie:setupMoviePlayback( modelValue, f5_local0, f5_local1 and f5_local1 ~= 0 )
				f1_arg0.Movie:setAlpha( 1 )
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
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "PiPMenu.buttonPrompts" )
	local f6_local1 = self
	self.anyChildUsesUpdateState = true
	
	local PanelVignetteLeft = CoD.MapWidget_PanelVignetteLeft.new( f6_local1, controller )
	PanelVignetteLeft:setLeftRight( false, false, -677, -83 )
	PanelVignetteLeft:setTopBottom( false, false, -371, 36 )
	self:addElement( PanelVignetteLeft )
	self.PanelVignetteLeft = PanelVignetteLeft
	
	local MapWidgetContainer = CoD.MapWidgetContainer.new( f6_local1, controller )
	MapWidgetContainer:setLeftRight( true, false, 19, 302 )
	MapWidgetContainer:setTopBottom( true, false, 4.67, 208.67 )
	self:addElement( MapWidgetContainer )
	self.MapWidgetContainer = MapWidgetContainer
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 37.95, 285.05 )
	Image0:setTopBottom( true, false, 26, 165 )
	Image0:setAlpha( 0 )
	Image0:setXRot( -17 )
	Image0:setYRot( 21 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Movie = LUI.UIImage.new()
	Movie:setLeftRight( true, false, 32.61, 290.39 )
	Movie:setTopBottom( true, false, 23.16, 168 )
	Movie:setXRot( -17 )
	Movie:setYRot( 21 )
	Movie:setupMoviePlayback( "" )
	self:addElement( Movie )
	self.Movie = Movie
	
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f7_local0 = nil
		SizeToSafeArea( element, controller )
		if not f7_local0 then
			f7_local0 = element:dispatchEventToChildren( event )
		end
		return f7_local0
	end )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f6_local1
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.PanelVignetteLeft:close()
		element.MapWidgetContainer:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "PiPMenu.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

