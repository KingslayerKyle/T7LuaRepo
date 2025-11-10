require( "ui.uieditor.widgets.CodCaster.CodCasterLoadoutItemBackground" )
require( "ui.uieditor.widgets.CodCaster.CodCasterLoadoutListContainerContainer" )
require( "ui.uieditor.widgets.HUD.DeadSpectate.DeadSpectate_SpectatingBar" )
require( "ui.uieditor.widgets.HUD.DeadSpectate.DeadSpectate_SpectatingBarPC" )

CoD.CodCasterSpectate = InheritFrom( LUI.UIElement )
CoD.CodCasterSpectate.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CodCasterSpectate )
	self.id = "CodCasterSpectate"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 279 )
	self:setTopBottom( true, false, 0, 72 )
	self.anyChildUsesUpdateState = true
	
	local bg = CoD.CodCasterLoadoutItemBackground.new( menu, controller )
	bg:setLeftRight( true, false, 149, 286 )
	bg:setTopBottom( true, false, 1, 73 )
	self:addElement( bg )
	self.bg = bg
	
	local White = LUI.UIImage.new()
	White:setLeftRight( true, false, 0, 212 )
	White:setTopBottom( true, false, 2, 73 )
	self:addElement( White )
	self.White = White
	
	local CodCasterLoadoutListContainerContainer = CoD.CodCasterLoadoutListContainerContainer.new( menu, controller )
	CodCasterLoadoutListContainerContainer:setLeftRight( true, false, 284, 726 )
	CodCasterLoadoutListContainerContainer:setTopBottom( true, false, -19, 53 )
	self:addElement( CodCasterLoadoutListContainerContainer )
	self.CodCasterLoadoutListContainerContainer = CodCasterLoadoutListContainerContainer
	
	local playerNameBG = LUI.UIImage.new()
	playerNameBG:setLeftRight( true, false, 49.5, 230 )
	playerNameBG:setTopBottom( true, false, 0, 76 )
	playerNameBG:setImage( RegisterImage( "uie_t7_codcaster_colorarrowbackingwhite" ) )
	self:addElement( playerNameBG )
	self.playerNameBG = playerNameBG
	
	local teamNameBG = LUI.UIImage.new()
	teamNameBG:setLeftRight( true, false, -3.94, 230 )
	teamNameBG:setTopBottom( true, false, 2, 44 )
	teamNameBG:setImage( RegisterImage( "uie_t7_codcaster_colorarrowbacking" ) )
	self:addElement( teamNameBG )
	self.teamNameBG = teamNameBG
	
	local teamColorArrow = LUI.UIImage.new()
	teamColorArrow:setLeftRight( true, false, -3.94, 181.7 )
	teamColorArrow:setTopBottom( true, false, 3, 44 )
	teamColorArrow:setImage( RegisterImage( "uie_t7_codcaster_colorarrow" ) )
	teamColorArrow:subscribeToGlobalModel( controller, "DeadSpectate", "playerIndex", function ( model )
		local playerIndex = Engine.GetModelValue( model )
		if playerIndex then
			teamColorArrow:setRGB( TeamColorFromPlayerIndex( controller, playerIndex ) )
		end
	end )
	self:addElement( teamColorArrow )
	self.teamColorArrow = teamColorArrow
	
	local teamColor = LUI.UIImage.new()
	teamColor:setLeftRight( true, false, -5, 230 )
	teamColor:setTopBottom( true, false, -1, 6 )
	teamColor:setImage( RegisterImage( "uie_t7_codcaster_teamcolorbar" ) )
	teamColor:subscribeToGlobalModel( controller, "DeadSpectate", "playerIndex", function ( model )
		local playerIndex = Engine.GetModelValue( model )
		if playerIndex then
			teamColor:setRGB( TeamColorFromPlayerIndex( controller, playerIndex ) )
		end
	end )
	self:addElement( teamColor )
	self.teamColor = teamColor
	
	local HeroLobbyClientExtraCamRender = LUI.UIImage.new()
	HeroLobbyClientExtraCamRender:setLeftRight( true, false, 224, 298 )
	HeroLobbyClientExtraCamRender:setTopBottom( true, false, -1, 71 )
	HeroLobbyClientExtraCamRender:subscribeToGlobalModel( controller, "DeadSpectate", "playerIndex", function ( model )
		local playerIndex = Engine.GetModelValue( model )
		if playerIndex then
			HeroLobbyClientExtraCamRender:setupCharacterExtraCamRenderForLobbyClient( GetClientGameLobbyXUIDForClientNum( playerIndex ) )
		end
	end )
	self:addElement( HeroLobbyClientExtraCamRender )
	self.HeroLobbyClientExtraCamRender = HeroLobbyClientExtraCamRender
	
	local spectatingBar = CoD.DeadSpectate_SpectatingBar.new( menu, controller )
	spectatingBar:setLeftRight( true, true, -6, -84.09 )
	spectatingBar:setTopBottom( true, false, -26.5, -1 )
	self:addElement( spectatingBar )
	self.spectatingBar = spectatingBar
	
	local DeadSpectateSpectatingBarPC = CoD.DeadSpectate_SpectatingBarPC.new( menu, controller )
	DeadSpectateSpectatingBarPC:setLeftRight( true, false, 60.95, 127.95 )
	DeadSpectateSpectatingBarPC:setTopBottom( true, false, -26.5, -1.5 )
	self:addElement( DeadSpectateSpectatingBarPC )
	self.DeadSpectateSpectatingBarPC = DeadSpectateSpectatingBarPC
	
	local arrow = LUI.UIImage.new()
	arrow:setLeftRight( true, false, -4.3, 20.3 )
	arrow:setTopBottom( true, false, 3, 44 )
	arrow:setImage( RegisterImage( "uie_t7_codcaster_whitearrow" ) )
	self:addElement( arrow )
	self.arrow = arrow
	
	local playerName = LUI.UIText.new()
	playerName:setLeftRight( false, false, -124.5, 76 )
	playerName:setTopBottom( true, false, 16, 32 )
	playerName:setRGB( ColorSet.GroupName.r, ColorSet.GroupName.g, ColorSet.GroupName.b )
	playerName:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	playerName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	playerName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	playerName:subscribeToGlobalModel( controller, "DeadSpectate", "playerIndex", function ( model )
		local playerIndex = Engine.GetModelValue( model )
		if playerIndex then
			playerName:setText( Engine.Localize( GetClientNameAndClanTag( controller, playerIndex ) ) )
		end
	end )
	self:addElement( playerName )
	self.playerName = playerName
	
	local teamName = LUI.UIText.new()
	teamName:setLeftRight( false, false, -128.65, 68.55 )
	teamName:setTopBottom( true, false, 51, 67 )
	teamName:setRGB( 0, 0, 0 )
	teamName:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	teamName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	teamName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	teamName:subscribeToGlobalModel( controller, "DeadSpectate", "playerIndex", function ( model )
		local playerIndex = Engine.GetModelValue( model )
		if playerIndex then
			teamName:setText( Engine.Localize( TeamStringFromPlayerIndex( controller, playerIndex ) ) )
		end
	end )
	self:addElement( teamName )
	self.teamName = teamName
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				bg:completeAnimation()
				self.bg:setAlpha( 0 )
				self.clipFinished( bg, {} )
				White:completeAnimation()
				self.White:setAlpha( 0 )
				self.clipFinished( White, {} )
				CodCasterLoadoutListContainerContainer:completeAnimation()
				self.CodCasterLoadoutListContainerContainer:setAlpha( 0 )
				self.clipFinished( CodCasterLoadoutListContainerContainer, {} )
				playerNameBG:completeAnimation()
				self.playerNameBG:setAlpha( 0 )
				self.clipFinished( playerNameBG, {} )
				teamNameBG:completeAnimation()
				self.teamNameBG:setAlpha( 0 )
				self.clipFinished( teamNameBG, {} )
				teamColorArrow:completeAnimation()
				self.teamColorArrow:setAlpha( 0 )
				self.clipFinished( teamColorArrow, {} )
				teamColor:completeAnimation()
				self.teamColor:setAlpha( 0 )
				self.clipFinished( teamColor, {} )
				HeroLobbyClientExtraCamRender:completeAnimation()
				self.HeroLobbyClientExtraCamRender:setAlpha( 0 )
				self.clipFinished( HeroLobbyClientExtraCamRender, {} )
				spectatingBar:completeAnimation()
				self.spectatingBar:setAlpha( 0 )
				self.clipFinished( spectatingBar, {} )
				DeadSpectateSpectatingBarPC:completeAnimation()
				self.DeadSpectateSpectatingBarPC:setAlpha( 0 )
				self.clipFinished( DeadSpectateSpectatingBarPC, {} )
				arrow:completeAnimation()
				self.arrow:setAlpha( 0 )
				self.clipFinished( arrow, {} )
				playerName:completeAnimation()
				self.playerName:setAlpha( 0 )
				self.clipFinished( playerName, {} )
				teamName:completeAnimation()
				self.teamName:setRGB( 0, 0, 0 )
				self.teamName:setAlpha( 0 )
				self.clipFinished( teamName, {} )
			end
		},
		ShowWithSpecialist = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				bg:completeAnimation()
				self.bg:setLeftRight( true, false, 159, 296 )
				self.bg:setTopBottom( true, false, 1, 73 )
				self.bg:setAlpha( 1 )
				self.clipFinished( bg, {} )
				White:completeAnimation()
				self.White:setAlpha( 1 )
				self.clipFinished( White, {} )
				CodCasterLoadoutListContainerContainer:completeAnimation()
				self.CodCasterLoadoutListContainerContainer:setLeftRight( true, false, 295, 737 )
				self.CodCasterLoadoutListContainerContainer:setTopBottom( true, false, -19, 53 )
				self.CodCasterLoadoutListContainerContainer:setAlpha( 1 )
				self.clipFinished( CodCasterLoadoutListContainerContainer, {} )
				playerNameBG:completeAnimation()
				self.playerNameBG:setAlpha( 1 )
				self.clipFinished( playerNameBG, {} )
				teamNameBG:completeAnimation()
				self.teamNameBG:setAlpha( 1 )
				self.clipFinished( teamNameBG, {} )
				teamColorArrow:completeAnimation()
				self.teamColorArrow:setAlpha( 1 )
				self.clipFinished( teamColorArrow, {} )
				teamColor:completeAnimation()
				self.teamColor:setAlpha( 1 )
				self.clipFinished( teamColor, {} )
				HeroLobbyClientExtraCamRender:completeAnimation()
				self.HeroLobbyClientExtraCamRender:setLeftRight( true, false, 223, 295 )
				self.HeroLobbyClientExtraCamRender:setTopBottom( true, false, 0, 72 )
				self.HeroLobbyClientExtraCamRender:setAlpha( 1 )
				self.clipFinished( HeroLobbyClientExtraCamRender, {} )
				spectatingBar:completeAnimation()
				self.spectatingBar:setAlpha( 1 )
				self.clipFinished( spectatingBar, {} )
				DeadSpectateSpectatingBarPC:completeAnimation()
				self.DeadSpectateSpectatingBarPC:setAlpha( 1 )
				self.clipFinished( DeadSpectateSpectatingBarPC, {} )
				arrow:completeAnimation()
				self.arrow:setAlpha( 1 )
				self.clipFinished( arrow, {} )
				playerName:completeAnimation()
				self.playerName:setAlpha( 1 )
				self.clipFinished( playerName, {} )
				teamName:completeAnimation()
				self.teamName:setAlpha( 1 )
				self.clipFinished( teamName, {} )
			end
		},
		ShowWithoutSpecialist = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )
				bg:completeAnimation()
				self.bg:setAlpha( 1 )
				self.clipFinished( bg, {} )
				White:completeAnimation()
				self.White:setAlpha( 1 )
				self.clipFinished( White, {} )
				CodCasterLoadoutListContainerContainer:completeAnimation()
				self.CodCasterLoadoutListContainerContainer:setLeftRight( true, false, 226, 668 )
				self.CodCasterLoadoutListContainerContainer:setTopBottom( true, false, -20, 52 )
				self.CodCasterLoadoutListContainerContainer:setAlpha( 1 )
				self.clipFinished( CodCasterLoadoutListContainerContainer, {} )
				playerNameBG:completeAnimation()
				self.playerNameBG:setAlpha( 1 )
				self.clipFinished( playerNameBG, {} )
				teamNameBG:completeAnimation()
				self.teamNameBG:setAlpha( 1 )
				self.clipFinished( teamNameBG, {} )
				teamColor:completeAnimation()
				self.teamColor:setAlpha( 1 )
				self.clipFinished( teamColor, {} )
				HeroLobbyClientExtraCamRender:completeAnimation()
				self.HeroLobbyClientExtraCamRender:setAlpha( 0 )
				self.clipFinished( HeroLobbyClientExtraCamRender, {} )
				spectatingBar:completeAnimation()
				self.spectatingBar:setAlpha( 1 )
				self.clipFinished( spectatingBar, {} )
				DeadSpectateSpectatingBarPC:completeAnimation()
				self.DeadSpectateSpectatingBarPC:setAlpha( 1 )
				self.clipFinished( DeadSpectateSpectatingBarPC, {} )
				playerName:completeAnimation()
				self.playerName:setAlpha( 1 )
				self.clipFinished( playerName, {} )
				teamName:completeAnimation()
				self.teamName:setAlpha( 1 )
				self.clipFinished( teamName, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "ShowWithSpecialist",
			condition = function ( menu, element, event )
				local f10_local0 = IsCodCasterProfileValueEqualTo( controller, "shoutcaster_lo_specialist", 1 )
				if f10_local0 then
					if not IsModelValueEqualTo( controller, "CodCaster.showQuickSettingsSideBar", 1 ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) then
						f10_local0 = IsCodCasterProfileValueEqualTo( controller, "shoutcaster_qs_playercard", 1 )
					else
						f10_local0 = false
					end
				end
				return f10_local0
			end
		},
		{
			stateName = "ShowWithoutSpecialist",
			condition = function ( menu, element, event )
				local f11_local0
				if not IsModelValueEqualTo( controller, "CodCaster.showQuickSettingsSideBar", 1 ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) then
					f11_local0 = IsCodCasterProfileValueEqualTo( controller, "shoutcaster_qs_playercard", 1 )
				else
					f11_local0 = false
				end
				return f11_local0
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CodCaster.profileSettingsUpdated" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CodCaster.profileSettingsUpdated"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CodCaster.showQuickSettingsSideBar" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CodCaster.showQuickSettingsSideBar"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.bg:close()
		element.CodCasterLoadoutListContainerContainer:close()
		element.spectatingBar:close()
		element.DeadSpectateSpectatingBarPC:close()
		element.teamColorArrow:close()
		element.teamColor:close()
		element.HeroLobbyClientExtraCamRender:close()
		element.playerName:close()
		element.teamName:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

