require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.BackgroundFrames.Header_Kicker" )
require( "ui.uieditor.widgets.Lobby.Common.FE_3dTitleFeatureIcon" )

local PreLoadFunc = function ( self, controller )
	Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyTitle" )
	Engine.CreateModel( Engine.GetGlobalModel(), "lobbyPlaylist.name" )
	Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
end

CoD.FE_3dTitleInternal = InheritFrom( LUI.UIElement )
CoD.FE_3dTitleInternal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_3dTitleInternal )
	self.id = "FE_3dTitleInternal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 739 )
	self:setTopBottom( true, false, 0, 51 )
	self.anyChildUsesUpdateState = true
	
	local Label0 = LUI.UITightText.new()
	Label0:setLeftRight( true, false, 7.2, 741.82 )
	Label0:setTopBottom( true, false, 4.25, 44 )
	Label0:setRGB( 0.87, 0.9, 0.9 )
	Label0:setAlpha( 0 )
	Label0:setText( Engine.Localize( "MENU_MULTIPLAYER_CAPS" ) )
	Label0:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	Label0:setLetterSpacing( -2.2 )
	LUI.OverrideFunction_CallOriginalFirst( Label0, "setText", function ( element, controller )
		if IsGlobalModelValueNonEmptyString( element, controller, "lobbyRoot.lobbyTitle" ) and not IsCurrentLanguageArabic() and not IsSelfInState( self, "Playlist" ) then
			ScaleParentWidgetToLabel( self, element, 10 )
		elseif not IsCurrentMenu( menu, "Lobby" ) and not IsCurrentLanguageArabic() and not IsSelfInState( self, "Playlist" ) then
			ScaleParentWidgetToLabel( self, element, 10 )
		end
	end )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	local playlistName0 = LUI.UITightText.new()
	playlistName0:setLeftRight( true, false, 0, 734.62 )
	playlistName0:setTopBottom( true, false, 0, 58 )
	playlistName0:setRGB( 0.87, 0.9, 0.9 )
	playlistName0:setAlpha( 0 )
	playlistName0:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	playlistName0:setLetterSpacing( -2.2 )
	playlistName0:subscribeToGlobalModel( controller, "LobbyPlaylistName", "name", function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			playlistName0:setText( PrependArenaToPlaylist( name ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( playlistName0, "setText", function ( element, controller )
		if IsSelfInState( self, "Playlist" ) and not IsCurrentLanguageArabic() then
			ScaleParentWidgetToLabel( self, element, 10 )
		end
	end )
	self:addElement( playlistName0 )
	self.playlistName0 = playlistName0
	
	local bo3logo = LUI.UIImage.new()
	bo3logo:setLeftRight( true, false, 14.83, 330.23 )
	bo3logo:setTopBottom( true, false, 10.3, 40.45 )
	bo3logo:setRGB( 0.87, 0.9, 0.9 )
	bo3logo:setImage( RegisterImage( "uie_img_t7_menu_frontend_asset_bo3logo" ) )
	self:addElement( bo3logo )
	self.bo3logo = bo3logo
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( true, false, 16.07, 61.35 )
	StartMenuframenoBG0:setTopBottom( true, false, 3.25, 47.75 )
	StartMenuframenoBG0:setAlpha( 0 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local StartMenuframenoBG00 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG00:setLeftRight( true, false, 16.07, 61.35 )
	StartMenuframenoBG00:setTopBottom( true, false, 3.25, 47.75 )
	StartMenuframenoBG00:setAlpha( 0 )
	self:addElement( StartMenuframenoBG00 )
	self.StartMenuframenoBG00 = StartMenuframenoBG00
	
	local HeaderKicker = CoD.Header_Kicker.new( menu, controller )
	HeaderKicker:setLeftRight( true, false, 66, 186 )
	HeaderKicker:setTopBottom( true, false, 4.25, 20.25 )
	HeaderKicker:setAlpha( 0 )
	HeaderKicker:subscribeToGlobalModel( controller, "LobbyRoot", "headingKickerText", function ( model )
		local headingKickerText = Engine.GetModelValue( model )
		if headingKickerText then
			HeaderKicker.Kickertxt:setText( headingKickerText )
		end
	end )
	self:addElement( HeaderKicker )
	self.HeaderKicker = HeaderKicker
	
	local FeatureIcon = CoD.FE_3dTitleFeatureIcon.new( menu, controller )
	FeatureIcon:setLeftRight( true, false, 21.2, 56.2 )
	FeatureIcon:setTopBottom( true, false, 7, 44 )
	self:addElement( FeatureIcon )
	self.FeatureIcon = FeatureIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				Label0:completeAnimation()
				self.Label0:setLeftRight( true, false, 9.2, 742.82 )
				self.Label0:setTopBottom( true, false, -1.5, 53.5 )
				self.Label0:setAlpha( 1 )
				self.clipFinished( Label0, {} )
				playlistName0:completeAnimation()
				self.playlistName0:setLeftRight( true, false, -0.62, 741.82 )
				self.playlistName0:setTopBottom( true, false, 0, 51 )
				self.playlistName0:setAlpha( 0 )
				self.clipFinished( playlistName0, {} )
				bo3logo:completeAnimation()
				self.bo3logo:setAlpha( 0 )
				self.clipFinished( bo3logo, {} )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setAlpha( 0 )
				self.clipFinished( StartMenuframenoBG0, {} )
				StartMenuframenoBG00:completeAnimation()
				self.StartMenuframenoBG00:setAlpha( 0 )
				self.clipFinished( StartMenuframenoBG00, {} )
				HeaderKicker:completeAnimation()
				self.HeaderKicker:setAlpha( 0.03 )
				self.clipFinished( HeaderKicker, {} )
				FeatureIcon:completeAnimation()
				self.FeatureIcon:setAlpha( 0 )
				self.clipFinished( FeatureIcon, {} )
			end
		},
		LogoVisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				Label0:completeAnimation()
				self.Label0:setAlpha( 0 )
				self.clipFinished( Label0, {} )
				playlistName0:completeAnimation()
				self.playlistName0:setAlpha( 0 )
				self.clipFinished( playlistName0, {} )
				bo3logo:completeAnimation()
				self.bo3logo:setAlpha( 1 )
				self.clipFinished( bo3logo, {} )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setLeftRight( true, false, 16.07, 61.35 )
				self.StartMenuframenoBG0:setTopBottom( true, false, 3.25, 47.75 )
				self.StartMenuframenoBG0:setAlpha( 0 )
				self.clipFinished( StartMenuframenoBG0, {} )
				StartMenuframenoBG00:completeAnimation()
				self.StartMenuframenoBG00:setAlpha( 0 )
				self.clipFinished( StartMenuframenoBG00, {} )
				HeaderKicker:completeAnimation()
				self.HeaderKicker:setAlpha( 0 )
				self.clipFinished( HeaderKicker, {} )
				FeatureIcon:completeAnimation()
				self.FeatureIcon:setAlpha( 0 )
				self.clipFinished( FeatureIcon, {} )
			end
		},
		Playlist = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				Label0:completeAnimation()
				self.Label0:setLeftRight( true, false, 7.2, 741.82 )
				self.Label0:setTopBottom( true, false, 7, 47 )
				self.Label0:setAlpha( 0 )
				self.Label0:setXRot( 0 )
				self.clipFinished( Label0, {} )
				playlistName0:completeAnimation()
				self.playlistName0:setAlpha( 1 )
				self.clipFinished( playlistName0, {} )
				bo3logo:completeAnimation()
				self.bo3logo:setAlpha( 0 )
				self.clipFinished( bo3logo, {} )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setLeftRight( true, false, 16.07, 61.35 )
				self.StartMenuframenoBG0:setTopBottom( true, false, 3.25, 47.75 )
				self.StartMenuframenoBG0:setAlpha( 0 )
				self.clipFinished( StartMenuframenoBG0, {} )
				StartMenuframenoBG00:completeAnimation()
				self.StartMenuframenoBG00:setAlpha( 0 )
				self.clipFinished( StartMenuframenoBG00, {} )
				HeaderKicker:completeAnimation()
				self.HeaderKicker:setAlpha( 0 )
				self.clipFinished( HeaderKicker, {} )
				FeatureIcon:completeAnimation()
				self.FeatureIcon:setAlpha( 0 )
				self.clipFinished( FeatureIcon, {} )
			end
		},
		ArenaPlaylist = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				Label0:completeAnimation()
				self.Label0:setLeftRight( true, false, 63, 797.62 )
				self.Label0:setTopBottom( true, false, 17, 57 )
				self.Label0:setAlpha( 1 )
				self.Label0:setXRot( 0 )
				self.clipFinished( Label0, {} )
				playlistName0:completeAnimation()
				self.playlistName0:setAlpha( 0 )
				self.clipFinished( playlistName0, {} )
				bo3logo:completeAnimation()
				self.bo3logo:setAlpha( 0 )
				self.clipFinished( bo3logo, {} )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setLeftRight( true, false, 16.07, 61.35 )
				self.StartMenuframenoBG0:setTopBottom( true, false, 3.25, 47.75 )
				self.StartMenuframenoBG0:setAlpha( 1 )
				self.clipFinished( StartMenuframenoBG0, {} )
				StartMenuframenoBG00:completeAnimation()
				self.StartMenuframenoBG00:setAlpha( 1 )
				self.clipFinished( StartMenuframenoBG00, {} )
				HeaderKicker:completeAnimation()
				self.HeaderKicker:setAlpha( 1 )
				self.clipFinished( HeaderKicker, {} )
				FeatureIcon:completeAnimation()
				self.FeatureIcon:setAlpha( 1 )
				self.clipFinished( FeatureIcon, {} )
			end
		},
		Updated_Header = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				Label0:completeAnimation()
				self.Label0:setLeftRight( true, false, 63.33, 797.95 )
				self.Label0:setTopBottom( true, false, 17, 57 )
				self.Label0:setAlpha( 1 )
				self.clipFinished( Label0, {} )
				playlistName0:completeAnimation()
				self.playlistName0:setAlpha( 0 )
				self.clipFinished( playlistName0, {} )
				bo3logo:completeAnimation()
				self.bo3logo:setAlpha( 0 )
				self.clipFinished( bo3logo, {} )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setLeftRight( true, false, 16.07, 61.35 )
				self.StartMenuframenoBG0:setTopBottom( true, false, 3.25, 47.75 )
				self.StartMenuframenoBG0:setAlpha( 1 )
				self.clipFinished( StartMenuframenoBG0, {} )
				StartMenuframenoBG00:completeAnimation()
				self.StartMenuframenoBG00:setAlpha( 1 )
				self.clipFinished( StartMenuframenoBG00, {} )
				HeaderKicker:completeAnimation()
				self.HeaderKicker:setAlpha( 1 )
				self.clipFinished( HeaderKicker, {} )
				FeatureIcon:completeAnimation()
				self.FeatureIcon:setAlpha( 1 )
				self.clipFinished( FeatureIcon, {} )
			end
		},
		Updated_HeaderNoKicker = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				Label0:completeAnimation()
				self.Label0:setLeftRight( true, false, 63.33, 797.95 )
				self.Label0:setTopBottom( true, false, 7, 47 )
				self.Label0:setAlpha( 1 )
				self.clipFinished( Label0, {} )
				playlistName0:completeAnimation()
				self.playlistName0:setAlpha( 0 )
				self.clipFinished( playlistName0, {} )
				bo3logo:completeAnimation()
				self.bo3logo:setAlpha( 0 )
				self.clipFinished( bo3logo, {} )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setLeftRight( true, false, 16.07, 61.35 )
				self.StartMenuframenoBG0:setTopBottom( true, false, 3.25, 47.75 )
				self.StartMenuframenoBG0:setAlpha( 1 )
				self.clipFinished( StartMenuframenoBG0, {} )
				StartMenuframenoBG00:completeAnimation()
				self.StartMenuframenoBG00:setAlpha( 1 )
				self.clipFinished( StartMenuframenoBG00, {} )
				HeaderKicker:completeAnimation()
				self.HeaderKicker:setAlpha( 0 )
				self.clipFinished( HeaderKicker, {} )
				FeatureIcon:completeAnimation()
				self.FeatureIcon:setAlpha( 1 )
				self.clipFinished( FeatureIcon, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "LogoVisible",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueNonEmptyString( element, controller, "lobbyRoot.lobbyTitle" )
			end
		},
		{
			stateName = "Playlist",
			condition = function ( menu, element, event )
				return ShouldShowPlaylistName()
			end
		},
		{
			stateName = "ArenaPlaylist",
			condition = function ( menu, element, event )
				local f15_local0 = IsArenaMode()
				if f15_local0 then
					f15_local0 = ShowHeaderKicker( menu )
					if f15_local0 then
						f15_local0 = ShowHeaderIcon( menu )
					end
				end
				return f15_local0
			end
		},
		{
			stateName = "Updated_Header",
			condition = function ( menu, element, event )
				return ShowHeaderIcon( menu ) and ShowHeaderKicker( menu )
			end
		},
		{
			stateName = "Updated_HeaderNoKicker",
			condition = function ( menu, element, event )
				return ShowHeaderIcon( menu )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyTitle" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyTitle"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	if self.m_eventHandlers.menu_loaded then
		local f2_local8 = self.m_eventHandlers.menu_loaded
		self:registerEventHandler( "menu_loaded", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return f2_local8( self, event )
		end )
	else
		self:registerEventHandler( "menu_loaded", LUI.UIElement.updateState )
	end
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, controller )
		if IsSelfInState( self, "Playlist" ) and not IsCurrentLanguageArabic() then
			ScaleParentWidgetToElementLabel( self, "playlistName0", 10 )
		elseif IsSelfInState( self, "DefaultState" ) and not IsCurrentLanguageArabic() then
			ScaleParentWidgetToElementLabel( self, "Label0", 10 )
		elseif IsSelfInState( self, "LogoVisible" ) and not IsCurrentLanguageArabic() then
			RestoreParentToOriginalWidth( self )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuframenoBG0:close()
		element.StartMenuframenoBG00:close()
		element.HeaderKicker:close()
		element.FeatureIcon:close()
		element.playlistName0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

