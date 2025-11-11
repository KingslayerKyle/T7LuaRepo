require( "ui.uieditor.widgets.BackgroundFrames.Header_Kicker" )
require( "ui.uieditor.widgets.Lobby.Common.FE_3dTitleFeatureIcon" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )

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
	self:setLeftRight( 0, 0, 0, 1108 )
	self:setTopBottom( 0, 0, 0, 76 )
	self.anyChildUsesUpdateState = true
	
	local Label0 = LUI.UITightText.new()
	Label0:setLeftRight( 0, 0, 11, 1113 )
	Label0:setTopBottom( 0, 0, 6, 66 )
	Label0:setRGB( 0.87, 0.9, 0.9 )
	Label0:setAlpha( 0 )
	Label0:setText( Engine.Localize( "MENU_MULTIPLAYER_CAPS" ) )
	Label0:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	Label0:setLetterSpacing( -2.2 )
	LUI.OverrideFunction_CallOriginalFirst( Label0, "setText", function ( element, text )
		if IsGlobalModelValueNonEmptyString( element, controller, "lobbyRoot.lobbyTitle" ) and not IsCurrentLanguageArabic() and not IsSelfInState( self, "Playlist" ) then
			ScaleParentWidgetToLabel( self, element, 10 )
		elseif not IsCurrentMenu( menu, "Lobby" ) and not IsCurrentLanguageArabic() and not IsSelfInState( self, "Playlist" ) then
			ScaleParentWidgetToLabel( self, element, 10 )
		end
	end )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	local playlistName0 = LUI.UITightText.new()
	playlistName0:setLeftRight( 0, 0, 0, 1102 )
	playlistName0:setTopBottom( 0, 0, 0, 87 )
	playlistName0:setRGB( 0.87, 0.9, 0.9 )
	playlistName0:setAlpha( 0 )
	playlistName0:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	playlistName0:setLetterSpacing( -2.2 )
	playlistName0:subscribeToGlobalModel( controller, "LobbyPlaylistName", "name", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			playlistName0:setText( PrependArenaToPlaylist( modelValue ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( playlistName0, "setText", function ( element, text )
		if IsSelfInState( self, "Playlist" ) and not IsCurrentLanguageArabic() then
			ScaleParentWidgetToLabel( self, element, 10 )
		end
	end )
	self:addElement( playlistName0 )
	self.playlistName0 = playlistName0
	
	local bo3logo = LUI.UIImage.new()
	bo3logo:setLeftRight( 0, 0, 22, 495 )
	bo3logo:setTopBottom( 0, 0, 16, 61 )
	bo3logo:setRGB( 0.87, 0.9, 0.9 )
	bo3logo:setImage( RegisterImage( "uie_img_t7_menu_frontend_asset_bo3logo" ) )
	self:addElement( bo3logo )
	self.bo3logo = bo3logo
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( 0, 0, 24, 92 )
	StartMenuframenoBG0:setTopBottom( 0, 0, 5, 72 )
	StartMenuframenoBG0:setAlpha( 0 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local StartMenuframenoBG00 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG00:setLeftRight( 0, 0, 24, 92 )
	StartMenuframenoBG00:setTopBottom( 0, 0, 5, 72 )
	StartMenuframenoBG00:setAlpha( 0 )
	self:addElement( StartMenuframenoBG00 )
	self.StartMenuframenoBG00 = StartMenuframenoBG00
	
	local HeaderKicker = CoD.Header_Kicker.new( menu, controller )
	HeaderKicker:setLeftRight( 0, 0, 99, 279 )
	HeaderKicker:setTopBottom( 0, 0, 6, 30 )
	HeaderKicker:setAlpha( 0 )
	HeaderKicker:subscribeToGlobalModel( controller, "LobbyRoot", "headingKickerText", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			HeaderKicker.Kickertxt:setText( modelValue )
		end
	end )
	self:addElement( HeaderKicker )
	self.HeaderKicker = HeaderKicker
	
	local FeatureIcon = CoD.FE_3dTitleFeatureIcon.new( menu, controller )
	FeatureIcon:setLeftRight( 0, 0, 32, 84 )
	FeatureIcon:setTopBottom( 0, 0, 10, 66 )
	self:addElement( FeatureIcon )
	self.FeatureIcon = FeatureIcon
	
	self.resetProperties = function ()
		Label0:completeAnimation()
		bo3logo:completeAnimation()
		HeaderKicker:completeAnimation()
		playlistName0:completeAnimation()
		FeatureIcon:completeAnimation()
		StartMenuframenoBG0:completeAnimation()
		StartMenuframenoBG00:completeAnimation()
		Label0:setLeftRight( 0, 0, 11, 1113 )
		Label0:setTopBottom( 0, 0, 6, 66 )
		Label0:setAlpha( 0 )
		bo3logo:setAlpha( 1 )
		HeaderKicker:setAlpha( 0 )
		playlistName0:setLeftRight( 0, 0, 0, 1102 )
		playlistName0:setTopBottom( 0, 0, 0, 87 )
		playlistName0:setAlpha( 0 )
		FeatureIcon:setAlpha( 1 )
		StartMenuframenoBG0:setAlpha( 0 )
		StartMenuframenoBG00:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				Label0:completeAnimation()
				self.Label0:setLeftRight( 0, 0, 14, 1114 )
				self.Label0:setTopBottom( 0, 0, -2, 80 )
				self.Label0:setAlpha( 1 )
				self.clipFinished( Label0, {} )
				playlistName0:completeAnimation()
				self.playlistName0:setLeftRight( 0, 0, -1, 1113 )
				self.playlistName0:setTopBottom( 0, 0, 0.5, 76.5 )
				self.clipFinished( playlistName0, {} )
				bo3logo:completeAnimation()
				self.bo3logo:setAlpha( 0 )
				self.clipFinished( bo3logo, {} )
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
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				FeatureIcon:completeAnimation()
				self.FeatureIcon:setAlpha( 0 )
				self.clipFinished( FeatureIcon, {} )
			end
		},
		Playlist = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				Label0:completeAnimation()
				self.Label0:setLeftRight( 0, 0, 11, 1113 )
				self.Label0:setTopBottom( 0, 0, 10, 70 )
				self.clipFinished( Label0, {} )
				playlistName0:completeAnimation()
				self.playlistName0:setAlpha( 1 )
				self.clipFinished( playlistName0, {} )
				bo3logo:completeAnimation()
				self.bo3logo:setAlpha( 0 )
				self.clipFinished( bo3logo, {} )
				FeatureIcon:completeAnimation()
				self.FeatureIcon:setAlpha( 0 )
				self.clipFinished( FeatureIcon, {} )
			end
		},
		ArenaPlaylist = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				Label0:completeAnimation()
				self.Label0:setLeftRight( 0, 0, 94, 1196 )
				self.Label0:setTopBottom( 0, 0, 26, 86 )
				self.Label0:setAlpha( 1 )
				self.clipFinished( Label0, {} )
				bo3logo:completeAnimation()
				self.bo3logo:setAlpha( 0 )
				self.clipFinished( bo3logo, {} )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setAlpha( 1 )
				self.clipFinished( StartMenuframenoBG0, {} )
				StartMenuframenoBG00:completeAnimation()
				self.StartMenuframenoBG00:setAlpha( 1 )
				self.clipFinished( StartMenuframenoBG00, {} )
				HeaderKicker:completeAnimation()
				self.HeaderKicker:setAlpha( 1 )
				self.clipFinished( HeaderKicker, {} )
			end
		},
		Updated_Header = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				Label0:completeAnimation()
				self.Label0:setLeftRight( 0, 0, 95, 1197 )
				self.Label0:setTopBottom( 0, 0, 26, 86 )
				self.Label0:setAlpha( 1 )
				self.clipFinished( Label0, {} )
				bo3logo:completeAnimation()
				self.bo3logo:setAlpha( 0 )
				self.clipFinished( bo3logo, {} )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setAlpha( 1 )
				self.clipFinished( StartMenuframenoBG0, {} )
				StartMenuframenoBG00:completeAnimation()
				self.StartMenuframenoBG00:setAlpha( 1 )
				self.clipFinished( StartMenuframenoBG00, {} )
				HeaderKicker:completeAnimation()
				self.HeaderKicker:setAlpha( 1 )
				self.clipFinished( HeaderKicker, {} )
			end
		},
		Updated_HeaderNoKicker = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				Label0:completeAnimation()
				self.Label0:setLeftRight( 0, 0, 95, 1197 )
				self.Label0:setTopBottom( 0, 0, 10, 70 )
				self.Label0:setAlpha( 1 )
				self.clipFinished( Label0, {} )
				bo3logo:completeAnimation()
				self.bo3logo:setAlpha( 0 )
				self.clipFinished( bo3logo, {} )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setAlpha( 1 )
				self.clipFinished( StartMenuframenoBG0, {} )
				StartMenuframenoBG00:completeAnimation()
				self.StartMenuframenoBG00:setAlpha( 1 )
				self.clipFinished( StartMenuframenoBG00, {} )
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
				local f16_local0 = IsArenaMode()
				if f16_local0 then
					f16_local0 = ShowHeaderKicker( menu )
					if f16_local0 then
						f16_local0 = ShowHeaderIcon( menu )
					end
				end
				return f16_local0
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
		local currentEv = self.m_eventHandlers.menu_loaded
		self:registerEventHandler( "menu_loaded", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		self:registerEventHandler( "menu_loaded", LUI.UIElement.updateState )
	end
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, state )
		if IsSelfInState( self, "Playlist" ) and not IsCurrentLanguageArabic() then
			ScaleParentWidgetToElementLabel( self, "playlistName0", 10 )
		elseif IsSelfInState( self, "DefaultState" ) and not IsCurrentLanguageArabic() then
			ScaleParentWidgetToElementLabel( self, "Label0", 10 )
		elseif IsSelfInState( self, "LogoVisible" ) and not IsCurrentLanguageArabic() then
			RestoreParentToOriginalWidth( self )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.StartMenuframenoBG0:close()
		self.StartMenuframenoBG00:close()
		self.HeaderKicker:close()
		self.FeatureIcon:close()
		self.playlistName0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

