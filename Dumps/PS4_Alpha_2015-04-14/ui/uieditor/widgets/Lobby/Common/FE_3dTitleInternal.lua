require( "ui.uieditor.widgets.Lobby.Common.FE_3dTitleBoxOverlay" )

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
	Label0:setLeftRight( true, false, 4.38, 147.38 )
	Label0:setTopBottom( true, false, 0, 58 )
	Label0:setRGB( 0.87, 0.9, 0.9 )
	Label0:setAlpha( 0 )
	Label0:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	Label0:setLetterSpacing( -2.2 )
	Label0:subscribeToGlobalModel( controller, "Lobby", "lobbyTitle", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Label0:setText( Engine.Localize( modelValue ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( Label0, "setText", function ( element, text )
		if not IsMainModeInvalid() then
			ScaleParentWidgetToLabel( self, element, 30 )
		end
	end )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	local playlistName = LUI.UITightText.new()
	playlistName:setLeftRight( true, false, 4.38, 147.38 )
	playlistName:setTopBottom( true, false, 0, 58 )
	playlistName:setRGB( 0.87, 0.9, 0.9 )
	playlistName:setAlpha( 0 )
	playlistName:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	playlistName:setLetterSpacing( -2.2 )
	playlistName:subscribeToGlobalModel( controller, "LobbyPlaylistName", "name", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			playlistName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( playlistName )
	self.playlistName = playlistName
	
	local bo3logo = LUI.UIImage.new()
	bo3logo:setLeftRight( true, false, 9, 363.67 )
	bo3logo:setTopBottom( true, false, 9.05, 42.95 )
	bo3logo:setRGB( 0.87, 0.9, 0.9 )
	bo3logo:setImage( RegisterImage( "uie_img_t7_menu_frontend_asset_bo3logo" ) )
	bo3logo:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( bo3logo )
	self.bo3logo = bo3logo
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 739 )
	Image0:setTopBottom( true, false, 26, 27 )
	Image0:setRGB( 0, 0, 0 )
	Image0:setAlpha( 0.5 )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local FE3dTitleBoxOverlay0 = CoD.FE_3dTitleBoxOverlay.new( menu, controller )
	FE3dTitleBoxOverlay0:setLeftRight( true, false, 4.38, 743 )
	FE3dTitleBoxOverlay0:setTopBottom( true, false, -28.75, 99.25 )
	FE3dTitleBoxOverlay0:setRGB( 1, 1, 1 )
	FE3dTitleBoxOverlay0:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		PlayClipOnElement( self, {
			elementName = "FE3dTitleBoxOverlay0",
			clipName = "Intro"
		}, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( FE3dTitleBoxOverlay0 )
	self.FE3dTitleBoxOverlay0 = FE3dTitleBoxOverlay0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				Label0:completeAnimation()
				self.Label0:setAlpha( 1 )
				self.clipFinished( Label0, {} )
				playlistName:completeAnimation()
				self.playlistName:setAlpha( 0 )
				self.clipFinished( playlistName, {} )
				bo3logo:completeAnimation()
				self.bo3logo:setAlpha( 0 )
				self.clipFinished( bo3logo, {} )
			end
		},
		LogoVisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				Label0:completeAnimation()
				self.Label0:setAlpha( 0 )
				self.clipFinished( Label0, {} )
				playlistName:completeAnimation()
				self.playlistName:setAlpha( 0 )
				self.clipFinished( playlistName, {} )
				bo3logo:completeAnimation()
				self.bo3logo:setAlpha( 1 )
				self.clipFinished( bo3logo, {} )
			end
		},
		Playlist = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				Label0:completeAnimation()
				self.Label0:setAlpha( 0 )
				self.clipFinished( Label0, {} )
				playlistName:completeAnimation()
				self.playlistName:setAlpha( 1 )
				self.clipFinished( playlistName, {} )
				bo3logo:completeAnimation()
				self.bo3logo:setAlpha( 0 )
				self.clipFinished( bo3logo, {} )
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
	self.close = function ( self )
		self.FE3dTitleBoxOverlay0:close()
		self.Label0:close()
		self.playlistName:close()
		CoD.FE_3dTitleInternal.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

