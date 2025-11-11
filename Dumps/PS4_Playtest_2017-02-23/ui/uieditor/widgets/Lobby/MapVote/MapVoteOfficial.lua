require( "ui.uieditor.widgets.StartMenu.StartMenu_Identity_Subtitle_BG" )

local PostLoadFunc = function ( self, controller )
	local gametypeSettingsUpdateModel = Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings.Update" )
	if self.gametypeSettingsUpdateSubscription then
		self:removeSubscription( self.gametypeSettingsUpdateSubscription )
	end
	self.gametypeSettingsUpdateSubscription = self:subscribeToModel( gametypeSettingsUpdateModel, function ()
		local mapVote = Engine.GetModel( Engine.GetGlobalModel(), "MapVote" )
		local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_HOST )
		Engine.LobbyHostSetOfficialCustomGame( lobbyType, false )
	end, false )
end

CoD.MapVoteOfficial = InheritFrom( LUI.UIElement )
CoD.MapVoteOfficial.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MapVoteOfficial )
	self.id = "MapVoteOfficial"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 195 )
	self:setTopBottom( 0, 0, 0, 30 )
	self.anyChildUsesUpdateState = true
	
	local StartMenuIdentitySubtitleBG00 = CoD.StartMenu_Identity_Subtitle_BG.new( menu, controller )
	StartMenuIdentitySubtitleBG00:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return IsFreeRunLobby()
			end
		}
	} )
	StartMenuIdentitySubtitleBG00:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( StartMenuIdentitySubtitleBG00, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	StartMenuIdentitySubtitleBG00:setLeftRight( 0, 1, -10, 12 )
	StartMenuIdentitySubtitleBG00:setTopBottom( 0, 0, -3, 33 )
	StartMenuIdentitySubtitleBG00:setRGB( 0, 0, 0 )
	StartMenuIdentitySubtitleBG00:setAlpha( 0.55 )
	self:addElement( StartMenuIdentitySubtitleBG00 )
	self.StartMenuIdentitySubtitleBG00 = StartMenuIdentitySubtitleBG00
	
	local officialIcon = LUI.UIImage.new()
	officialIcon:setLeftRight( 0, 0, 11, 35 )
	officialIcon:setTopBottom( 0, 0, 3, 27 )
	officialIcon:setImage( RegisterImage( "uie_t7_icon_shield_official" ) )
	self:addElement( officialIcon )
	self.officialIcon = officialIcon
	
	local Official = LUI.UIText.new()
	Official:setLeftRight( 0, 1, 42, 0 )
	Official:setTopBottom( 0, 0, -2, 30 )
	Official:setText( Engine.Localize( "MENU_OFFICIAL_CAPS" ) )
	Official:setTTF( "fonts/default.ttf" )
	Official:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Official:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Official )
	self.Official = Official
	
	self.resetProperties = function ()
		officialIcon:completeAnimation()
		Official:completeAnimation()
		StartMenuIdentitySubtitleBG00:completeAnimation()
		officialIcon:setAlpha( 1 )
		Official:setAlpha( 1 )
		StartMenuIdentitySubtitleBG00:setAlpha( 0.55 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				StartMenuIdentitySubtitleBG00:completeAnimation()
				self.StartMenuIdentitySubtitleBG00:setAlpha( 0 )
				self.clipFinished( StartMenuIdentitySubtitleBG00, {} )
				officialIcon:completeAnimation()
				self.officialIcon:setAlpha( 0 )
				self.clipFinished( officialIcon, {} )
				Official:completeAnimation()
				self.Official:setAlpha( 0 )
				self.clipFinished( Official, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsCustomMPLobby() and IsGlobalModelValueTrue( element, controller, "MapVote.isOfficialVariant" )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "MapVote.isOfficialVariant" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "MapVote.isOfficialVariant"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.StartMenuIdentitySubtitleBG00:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

