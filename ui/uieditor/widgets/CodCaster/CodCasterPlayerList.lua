-- 038bf273a56f336409c7c58d8b3bc87f
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CodCaster.CodCasterPlayerListHeaderWidgetContainer" )
require( "ui.uieditor.widgets.CodCaster.CodCasterPlayerListRowWidget" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	if Engine.GetCurrentTeamCount() < 2 then
		f1_arg0.Team2Header:close()
		f1_arg0.Team2:close()
	end
	f1_arg0.Team1.navigation.up = f1_arg0.Team2
	f1_arg0.Team2.navigation.down = f1_arg0.Team1
end

CoD.CodCasterPlayerList = InheritFrom( LUI.UIElement )
CoD.CodCasterPlayerList.new = function ( menu, controller )
	local self = LUI.UIVerticalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 0
	} )
	self:setAlignment( LUI.Alignment.Top )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CodCasterPlayerList )
	self.id = "CodCasterPlayerList"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 310 )
	self:setTopBottom( true, false, 0, 481 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Team1Header = CoD.CodCasterPlayerListHeaderWidgetContainer.new( menu, controller )
	Team1Header:setLeftRight( false, true, -343, -1 )
	Team1Header:setTopBottom( true, false, 0, 24 )
	Team1Header.Header.whiteBG:setRGB( 0.27, 0.27, 0.27 )
	Team1Header:subscribeToGlobalModel( controller, "Factions", "alliesFactionColor", function ( model )
		local alliesFactionColor = Engine.GetModelValue( model )
		if alliesFactionColor then
			Team1Header.Header.whiteBGAccent2:setRGB( CodcasterGetAccentColorForTeamColor( controller, "team1", alliesFactionColor ) )
		end
	end )
	Team1Header:subscribeToGlobalModel( controller, "Factions", "alliesFactionColor", function ( model )
		local alliesFactionColor = Engine.GetModelValue( model )
		if alliesFactionColor then
			Team1Header.Header.whiteBGcolor:setRGB( alliesFactionColor )
		end
	end )
	Team1Header:subscribeToGlobalModel( controller, "Factions", "alliesFactionDisplayName", function ( model )
		local alliesFactionDisplayName = Engine.GetModelValue( model )
		if alliesFactionDisplayName then
			Team1Header.Header.TeamName:setText( Engine.Localize( alliesFactionDisplayName ) )
		end
	end )
	Team1Header:subscribeToGlobalModel( controller, "Factions", "alliesFactionColor", function ( model )
		local alliesFactionColor = Engine.GetModelValue( model )
		if alliesFactionColor then
			Team1Header.Header.TeamColor:setRGB( alliesFactionColor )
		end
	end )
	Team1Header:mergeStateConditions( {
		{
			stateName = "VisibleSelectedTeam",
			condition = function ( menu, element, event )
				local f7_local0 = IsGlobalModelValueGreaterThan( controller, "scoreboard.team1.count", 0 )
				if f7_local0 then
					if not IsGlobalModelValueTrue( element, controller, "scoreboard.team1.shoutcasterListenInActive" ) then
						f7_local0 = IsCodCasterSpectatingPlayerInTeam( controller, Enum.team_t.TEAM_ALLIES )
					else
						f7_local0 = false
					end
				end
				return f7_local0
			end
		},
		{
			stateName = "VisibleSelectedTeamWithListenIn",
			condition = function ( menu, element, event )
				local f8_local0 = IsGlobalModelValueGreaterThan( controller, "scoreboard.team1.count", 0 )
				if f8_local0 then
					f8_local0 = IsGlobalModelValueTrue( element, controller, "scoreboard.team1.shoutcasterListenInActive" )
					if f8_local0 then
						f8_local0 = IsCodCasterSpectatingPlayerInTeam( controller, Enum.team_t.TEAM_ALLIES )
					end
				end
				return f8_local0
			end
		},
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsGlobalModelValueGreaterThan( controller, "scoreboard.team1.count", 0 ) and not IsGlobalModelValueTrue( element, controller, "scoreboard.team1.shoutcasterListenInActive" )
			end
		},
		{
			stateName = "VisibleWithListenIn",
			condition = function ( menu, element, event )
				return IsGlobalModelValueGreaterThan( controller, "scoreboard.team1.count", 0 ) and IsGlobalModelValueTrue( element, controller, "scoreboard.team1.shoutcasterListenInActive" )
			end
		}
	} )
	Team1Header:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "scoreboard.team1.count" ), function ( model )
		menu:updateElementState( Team1Header, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "scoreboard.team1.count"
		} )
	end )
	Team1Header:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "scoreboard.team1.shoutcasterListenInActive" ), function ( model )
		menu:updateElementState( Team1Header, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "scoreboard.team1.shoutcasterListenInActive"
		} )
	end )
	Team1Header:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "deadSpectator.playerTeam" ), function ( model )
		menu:updateElementState( Team1Header, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "deadSpectator.playerTeam"
		} )
	end )
	self:addElement( Team1Header )
	self.Team1Header = Team1Header
	
	local Team1 = LUI.UIList.new( menu, controller, -0.5, 0, nil, false, false, 0, 0, false, false )
	Team1:makeFocusable()
	Team1:setLeftRight( false, true, -331, -1 )
	Team1:setTopBottom( true, false, 24, 375.5 )
	Team1:setWidgetType( CoD.CodCasterPlayerListRowWidget )
	Team1:setVerticalCount( 18 )
	Team1:setSpacing( -0.5 )
	Team1:setDataSource( "CodCasterScoreboardTeam1List" )
	Team1:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f14_local0 = nil
		SetShoutcastHighlightedPlayer( self, element, controller )
		return f14_local0
	end )
	Team1:registerEventHandler( "gain_focus", function ( element, event )
		local f15_local0 = nil
		if element.gainFocus then
			f15_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f15_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_NONE )
		return f15_local0
	end )
	Team1:registerEventHandler( "lose_focus", function ( element, event )
		local f16_local0 = nil
		if element.loseFocus then
			f16_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f16_local0 = element.super:loseFocus( event )
		end
		return f16_local0
	end )
	menu:AddButtonCallbackFunction( Team1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f17_arg0, f17_arg1, f17_arg2, f17_arg3 )
		SpectateSelectedPlayer( self, f17_arg0, f17_arg2 )
		return true
	end, function ( f18_arg0, f18_arg1, f18_arg2 )
		CoD.Menu.SetButtonLabel( f18_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
		return false
	end, false )
	menu:AddButtonCallbackFunction( Team1, controller, Enum.LUIButton.LUI_KEY_NONE, "ENTER", function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3 )
		SpectateSelectedPlayer( self, f19_arg0, f19_arg2 )
		return true
	end, function ( f20_arg0, f20_arg1, f20_arg2 )
		CoD.Menu.SetButtonLabel( f20_arg1, Enum.LUIButton.LUI_KEY_NONE, "" )
		return false
	end, false, true )
	self:addElement( Team1 )
	self.Team1 = Team1
	
	local spacer = LUI.UIImage.new()
	spacer:setLeftRight( true, false, 19, 301 )
	spacer:setTopBottom( true, false, 375.5, 387.5 )
	spacer:setAlpha( 0 )
	self:addElement( spacer )
	self.spacer = spacer
	
	local Team2Header = CoD.CodCasterPlayerListHeaderWidgetContainer.new( menu, controller )
	Team2Header:setLeftRight( false, true, -347, -1 )
	Team2Header:setTopBottom( true, false, 387.5, 411.5 )
	Team2Header.Header.whiteBG:setRGB( 0.27, 0.27, 0.27 )
	Team2Header:subscribeToGlobalModel( controller, "Factions", "axisFactionColor", function ( model )
		local axisFactionColor = Engine.GetModelValue( model )
		if axisFactionColor then
			Team2Header.Header.whiteBGAccent2:setRGB( CodcasterGetAccentColorForTeamColor( controller, "team2", axisFactionColor ) )
		end
	end )
	Team2Header:subscribeToGlobalModel( controller, "Factions", "axisFactionColor", function ( model )
		local axisFactionColor = Engine.GetModelValue( model )
		if axisFactionColor then
			Team2Header.Header.whiteBGcolor:setRGB( axisFactionColor )
		end
	end )
	Team2Header:subscribeToGlobalModel( controller, "Factions", "axisFactionDisplayName", function ( model )
		local axisFactionDisplayName = Engine.GetModelValue( model )
		if axisFactionDisplayName then
			Team2Header.Header.TeamName:setText( Engine.Localize( axisFactionDisplayName ) )
		end
	end )
	Team2Header:subscribeToGlobalModel( controller, "Factions", "axisFactionColor", function ( model )
		local axisFactionColor = Engine.GetModelValue( model )
		if axisFactionColor then
			Team2Header.Header.TeamColor:setRGB( axisFactionColor )
		end
	end )
	Team2Header:mergeStateConditions( {
		{
			stateName = "VisibleSelectedTeam",
			condition = function ( menu, element, event )
				local f25_local0 = IsGlobalModelValueGreaterThan( controller, "scoreboard.team2.count", 0 )
				if f25_local0 then
					if not IsGlobalModelValueTrue( element, controller, "scoreboard.team2.shoutcasterListenInActive" ) then
						f25_local0 = IsCodCasterSpectatingPlayerInTeam( controller, Enum.team_t.TEAM_AXIS )
					else
						f25_local0 = false
					end
				end
				return f25_local0
			end
		},
		{
			stateName = "VisibleSelectedTeamWithListenIn",
			condition = function ( menu, element, event )
				local f26_local0 = IsGlobalModelValueGreaterThan( controller, "scoreboard.team2.count", 0 )
				if f26_local0 then
					f26_local0 = IsGlobalModelValueTrue( element, controller, "scoreboard.team2.shoutcasterListenInActive" )
					if f26_local0 then
						f26_local0 = IsCodCasterSpectatingPlayerInTeam( controller, Enum.team_t.TEAM_AXIS )
					end
				end
				return f26_local0
			end
		},
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsGlobalModelValueGreaterThan( controller, "scoreboard.team2.count", 0 ) and not IsGlobalModelValueTrue( element, controller, "scoreboard.team2.shoutcasterListenInActive" )
			end
		},
		{
			stateName = "VisibleWithListenIn",
			condition = function ( menu, element, event )
				return IsGlobalModelValueGreaterThan( controller, "scoreboard.team2.count", 0 ) and IsGlobalModelValueTrue( element, controller, "scoreboard.team2.shoutcasterListenInActive" )
			end
		}
	} )
	Team2Header:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "scoreboard.team2.count" ), function ( model )
		menu:updateElementState( Team2Header, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "scoreboard.team2.count"
		} )
	end )
	Team2Header:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "scoreboard.team2.shoutcasterListenInActive" ), function ( model )
		menu:updateElementState( Team2Header, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "scoreboard.team2.shoutcasterListenInActive"
		} )
	end )
	Team2Header:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "deadSpectator.playerTeam" ), function ( model )
		menu:updateElementState( Team2Header, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "deadSpectator.playerTeam"
		} )
	end )
	self:addElement( Team2Header )
	self.Team2Header = Team2Header
	
	local Team2 = LUI.UIList.new( menu, controller, -0.5, 0, nil, false, false, 0, 0, false, false )
	Team2:makeFocusable()
	Team2:setLeftRight( false, true, -331, -1 )
	Team2:setTopBottom( true, false, 411.5, 763 )
	Team2:setWidgetType( CoD.CodCasterPlayerListRowWidget )
	Team2:setVerticalCount( 18 )
	Team2:setSpacing( -0.5 )
	Team2:setDataSource( "CodCasterScoreboardTeam2List" )
	Team2:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f32_local0 = nil
		SetShoutcastHighlightedPlayer( self, element, controller )
		return f32_local0
	end )
	Team2:registerEventHandler( "gain_focus", function ( element, event )
		local f33_local0 = nil
		if element.gainFocus then
			f33_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f33_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_NONE )
		return f33_local0
	end )
	Team2:registerEventHandler( "lose_focus", function ( element, event )
		local f34_local0 = nil
		if element.loseFocus then
			f34_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f34_local0 = element.super:loseFocus( event )
		end
		return f34_local0
	end )
	menu:AddButtonCallbackFunction( Team2, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f35_arg0, f35_arg1, f35_arg2, f35_arg3 )
		SpectateSelectedPlayer( self, f35_arg0, f35_arg2 )
		return true
	end, function ( f36_arg0, f36_arg1, f36_arg2 )
		CoD.Menu.SetButtonLabel( f36_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
		return false
	end, false )
	menu:AddButtonCallbackFunction( Team2, controller, Enum.LUIButton.LUI_KEY_NONE, "ENTER", function ( f37_arg0, f37_arg1, f37_arg2, f37_arg3 )
		SpectateSelectedPlayer( self, f37_arg0, f37_arg2 )
		return true
	end, function ( f38_arg0, f38_arg1, f38_arg2 )
		CoD.Menu.SetButtonLabel( f38_arg1, Enum.LUIButton.LUI_KEY_NONE, "" )
		return false
	end, false, true )
	self:addElement( Team2 )
	self.Team2 = Team2
	
	Team1.navigation = {
		down = Team2
	}
	Team2.navigation = {
		up = Team1
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				Team1Header:completeAnimation()
				self.Team1Header:setAlpha( 0 )
				self.clipFinished( Team1Header, {} )
				Team1:completeAnimation()
				self.Team1:setAlpha( 0 )
				self.clipFinished( Team1, {} )
				Team2Header:completeAnimation()
				self.Team2Header:setAlpha( 0 )
				self.clipFinished( Team2Header, {} )
				Team2:completeAnimation()
				self.Team2:setAlpha( 0 )
				self.clipFinished( Team2, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				Team1Header:completeAnimation()
				self.Team1Header:setAlpha( 1 )
				self.clipFinished( Team1Header, {} )
				Team1:completeAnimation()
				self.Team1:setAlpha( 1 )
				self.clipFinished( Team1, {} )
				spacer:completeAnimation()
				self.spacer:setAlpha( 0 )
				self.clipFinished( spacer, {} )
				Team2Header:completeAnimation()
				self.Team2Header:setAlpha( 1 )
				self.clipFinished( Team2Header, {} )
				Team2:completeAnimation()
				self.Team2:setAlpha( 1 )
				self.clipFinished( Team2, {} )
			end
		}
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, controller )
		if IsElementInState( element, "DefaultState" ) then
			DisableNavigation( self, "Team1" )
			DisableNavigation( self, "Team2" )
		else
			EnableNavigation( self, "Team1" )
			EnableNavigation( self, "Team2" )
		end
	end )
	Team1.id = "Team1"
	Team2.id = "Team2"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.Team1:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Team1Header:close()
		element.Team1:close()
		element.Team2Header:close()
		element.Team2:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

