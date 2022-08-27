-- 61b2d115a485694de65b45dabb06f439
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberTeamColorBackground_OnChange" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberTeamColorBackground" )

local PostLoadFunc = function ( self, controller, menu )
	self.SetupTeamSwitch = function ( f2_arg0, f2_arg1 )
		if f2_arg1 == Enum.team_t.TEAM_ALLIES then
			f2_arg0.TeamColorBackground:setState( "Allies" )
		elseif f2_arg1 == Enum.team_t.TEAM_AXIS then
			f2_arg0.TeamColorBackground:setState( "Axis" )
		elseif f2_arg1 == Enum.team_t.TEAM_SPECTATOR then
			f2_arg0.TeamColorBackground:setState( "Spectator" )
		end
		f2_arg0:playClip( "TeamSwitch" )
	end
	
	self.SetupTeamColorBackground = function ( f3_arg0, f3_arg1 )
		f3_arg0.TeamColorBackground:SetupTeamColors( f3_arg1 )
	end
	
end

CoD.LobbyMemberTeamColor = InheritFrom( LUI.UIElement )
CoD.LobbyMemberTeamColor.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LobbyMemberTeamColor )
	self.id = "LobbyMemberTeamColor"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 400 )
	self:setTopBottom( true, false, 0, 25 )
	self.anyChildUsesUpdateState = true
	
	local Dimmer = LUI.UIImage.new()
	Dimmer:setLeftRight( true, true, 0, 0 )
	Dimmer:setTopBottom( true, true, 0, 0 )
	Dimmer:setRGB( 0.11, 0.11, 0.11 )
	Dimmer:setAlpha( 0 )
	Dimmer:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	Dimmer:setShaderVector( 0, 0.02, 0.02, 0.02, 0.02 )
	self:addElement( Dimmer )
	self.Dimmer = Dimmer
	
	local LobbyMemberTeamColorBackgroundOnChange = CoD.LobbyMemberTeamColorBackground_OnChange.new( menu, controller )
	LobbyMemberTeamColorBackgroundOnChange:setLeftRight( true, false, 0, 400 )
	LobbyMemberTeamColorBackgroundOnChange:setTopBottom( true, false, 0, 25 )
	self:addElement( LobbyMemberTeamColorBackgroundOnChange )
	self.LobbyMemberTeamColorBackgroundOnChange = LobbyMemberTeamColorBackgroundOnChange
	
	local FEButtonPanelShaderContainer0 = CoD.FE_ButtonPanelShaderContainer.new( menu, controller )
	FEButtonPanelShaderContainer0:setLeftRight( true, true, 0, 0 )
	FEButtonPanelShaderContainer0:setTopBottom( true, true, 0, 0 )
	FEButtonPanelShaderContainer0:setAlpha( 0 )
	self:addElement( FEButtonPanelShaderContainer0 )
	self.FEButtonPanelShaderContainer0 = FEButtonPanelShaderContainer0
	
	local TeamColorBackground = CoD.LobbyMemberTeamColorBackground.new( menu, controller )
	TeamColorBackground:setLeftRight( true, true, 0, 0 )
	TeamColorBackground:setTopBottom( true, true, 0, 0 )
	TeamColorBackground:linkToElementModel( self, nil, false, function ( model )
		TeamColorBackground:setModel( model, controller )
	end )
	TeamColorBackground:mergeStateConditions( {
		{
			stateName = "Axis",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "teamSwitch", Enum.team_t.TEAM_AXIS )
			end
		},
		{
			stateName = "Allies",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "teamSwitch", Enum.team_t.TEAM_ALLIES )
			end
		},
		{
			stateName = "Spectator",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "teamSwitch", Enum.team_t.TEAM_SPECTATOR )
			end
		}
	} )
	TeamColorBackground:linkToElementModel( TeamColorBackground, "teamSwitch", true, function ( model )
		menu:updateElementState( TeamColorBackground, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "teamSwitch"
		} )
	end )
	self:addElement( TeamColorBackground )
	self.TeamColorBackground = TeamColorBackground
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			TeamSwitch = function ()
				self:setupElementClipCounter( 2 )
				local DimmerFrame2 = function ( Dimmer, event )
					local DimmerFrame3 = function ( Dimmer, event )
						if not event.interrupted then
							Dimmer:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						end
						Dimmer:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Dimmer, event )
						else
							Dimmer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						DimmerFrame3( Dimmer, event )
						return 
					else
						Dimmer:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						Dimmer:registerEventHandler( "transition_complete_keyframe", DimmerFrame3 )
					end
				end
				
				Dimmer:completeAnimation()
				self.Dimmer:setAlpha( 0.75 )
				DimmerFrame2( Dimmer, {} )
				local LobbyMemberTeamColorBackgroundOnChangeFrame2 = function ( LobbyMemberTeamColorBackgroundOnChange, event )
					local LobbyMemberTeamColorBackgroundOnChangeFrame3 = function ( LobbyMemberTeamColorBackgroundOnChange, event )
						if not event.interrupted then
							LobbyMemberTeamColorBackgroundOnChange:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						end
						LobbyMemberTeamColorBackgroundOnChange:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( LobbyMemberTeamColorBackgroundOnChange, event )
						else
							LobbyMemberTeamColorBackgroundOnChange:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LobbyMemberTeamColorBackgroundOnChangeFrame3( LobbyMemberTeamColorBackgroundOnChange, event )
						return 
					else
						LobbyMemberTeamColorBackgroundOnChange:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						LobbyMemberTeamColorBackgroundOnChange:registerEventHandler( "transition_complete_keyframe", LobbyMemberTeamColorBackgroundOnChangeFrame3 )
					end
				end
				
				LobbyMemberTeamColorBackgroundOnChange:completeAnimation()
				self.LobbyMemberTeamColorBackgroundOnChange:setAlpha( 1 )
				LobbyMemberTeamColorBackgroundOnChangeFrame2( LobbyMemberTeamColorBackgroundOnChange, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				Dimmer:completeAnimation()
				self.Dimmer:setAlpha( 0 )
				self.clipFinished( Dimmer, {} )
				LobbyMemberTeamColorBackgroundOnChange:completeAnimation()
				self.LobbyMemberTeamColorBackgroundOnChange:setAlpha( 0 )
				self.clipFinished( LobbyMemberTeamColorBackgroundOnChange, {} )
				TeamColorBackground:completeAnimation()
				self.TeamColorBackground:setAlpha( 0 )
				self.clipFinished( TeamColorBackground, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return not IsGameLobby()
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LobbyMemberTeamColorBackgroundOnChange:close()
		element.FEButtonPanelShaderContainer0:close()
		element.TeamColorBackground:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

