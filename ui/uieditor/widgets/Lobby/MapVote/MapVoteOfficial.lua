-- bc923260185930df13bcb9963d0ae9e4
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.StartMenu.StartMenu_Identity_Subtitle_BG" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	local f1_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings.Update" )
	if f1_arg0.gametypeSettingsUpdateSubscription then
		f1_arg0:removeSubscription( f1_arg0.gametypeSettingsUpdateSubscription )
	end
	f1_arg0.gametypeSettingsUpdateSubscription = f1_arg0:subscribeToModel( f1_local0, function ()
		local f2_local0 = Engine.GetModel( Engine.GetGlobalModel(), "MapVote" )
		Engine.LobbyHost_SetOfficialCustomGame( false )
		Engine.LobbyHost_SetCustomGameName( "" )
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
	self:setLeftRight( true, false, 0, 130 )
	self:setTopBottom( true, false, 0, 20 )
	self.anyChildUsesUpdateState = true
	
	local StartMenuIdentitySubtitleBG00 = CoD.StartMenu_Identity_Subtitle_BG.new( menu, controller )
	StartMenuIdentitySubtitleBG00:setLeftRight( true, true, -7, 8 )
	StartMenuIdentitySubtitleBG00:setTopBottom( true, false, -2, 22 )
	StartMenuIdentitySubtitleBG00:setRGB( 0, 0, 0 )
	StartMenuIdentitySubtitleBG00:setAlpha( 0.55 )
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
	self:addElement( StartMenuIdentitySubtitleBG00 )
	self.StartMenuIdentitySubtitleBG00 = StartMenuIdentitySubtitleBG00
	
	local officialIcon = LUI.UIImage.new()
	officialIcon:setLeftRight( true, false, 7, 23 )
	officialIcon:setTopBottom( true, false, 2, 18 )
	officialIcon:setImage( RegisterImage( "uie_t7_icon_shield_official" ) )
	self:addElement( officialIcon )
	self.officialIcon = officialIcon
	
	local Official = LUI.UIText.new()
	Official:setLeftRight( true, true, 28, 0 )
	Official:setTopBottom( true, false, -1, 20 )
	Official:setText( Engine.Localize( "MENU_OFFICIAL_CAPS" ) )
	Official:setTTF( "fonts/default.ttf" )
	Official:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Official:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Official )
	self.Official = Official
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
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
				self:setupElementClipCounter( 3 )

				StartMenuIdentitySubtitleBG00:completeAnimation()
				self.StartMenuIdentitySubtitleBG00:setAlpha( 0.55 )
				self.clipFinished( StartMenuIdentitySubtitleBG00, {} )

				officialIcon:completeAnimation()
				self.officialIcon:setAlpha( 1 )
				self.clipFinished( officialIcon, {} )

				Official:completeAnimation()
				self.Official:setAlpha( 1 )
				self.clipFinished( Official, {} )
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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuIdentitySubtitleBG00:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

