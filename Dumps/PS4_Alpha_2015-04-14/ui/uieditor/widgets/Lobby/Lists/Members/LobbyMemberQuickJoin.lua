require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyLeaderIcon" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberPartyMemberIconNew" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberTeamColor" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.IconControllerContainer" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.IconJoinable" )

CoD.LobbyMemberQuickJoin = InheritFrom( LUI.UIElement )
CoD.LobbyMemberQuickJoin.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LobbyMemberQuickJoin )
	self.id = "LobbyMemberQuickJoin"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 490 )
	self:setTopBottom( true, false, 0, 27 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local LobbyLeaderIcon = CoD.LobbyLeaderIcon.new( menu, controller )
	LobbyLeaderIcon:setLeftRight( true, false, 411, 435 )
	LobbyLeaderIcon:setTopBottom( true, false, 1, 26 )
	LobbyLeaderIcon:setRGB( 1, 1, 1 )
	LobbyLeaderIcon:linkToElementModel( self, "isMemberLeader", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LobbyLeaderIcon.Leader:setAlpha( modelValue )
		end
	end )
	self:addElement( LobbyLeaderIcon )
	self.LobbyLeaderIcon = LobbyLeaderIcon
	
	local PartyMemberIconNew = CoD.LobbyMemberPartyMemberIconNew.new( menu, controller )
	PartyMemberIconNew:setLeftRight( true, false, 412, 422 )
	PartyMemberIconNew:setTopBottom( true, false, 0, 25 )
	PartyMemberIconNew:setRGB( 1, 1, 1 )
	PartyMemberIconNew.Icon:setRGB( 0.76, 0.76, 0.76 )
	PartyMemberIconNew:linkToElementModel( self, "isMember", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PartyMemberIconNew:setAlpha( modelValue )
		end
	end )
	PartyMemberIconNew:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsParentPartyMemberItem( element, controller )
			end
		}
	} )
	self:addElement( PartyMemberIconNew )
	self.PartyMemberIconNew = PartyMemberIconNew
	
	local score = LUI.UIText.new()
	score:setLeftRight( true, false, 353, 415 )
	score:setTopBottom( true, false, 5, 25 )
	score:setRGB( 1, 1, 1 )
	score:setAlpha( 0 )
	score:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	score:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	score:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( score )
	self.score = score
	
	local Panel = CoD.FE_ButtonPanelShaderContainer.new( menu, controller )
	Panel:setLeftRight( true, true, 60, -82 )
	Panel:setTopBottom( false, false, -14, 13.5 )
	Panel:setRGB( 0.5, 0.5, 0.5 )
	Panel.FEButtonPanel:setShaderVector( 0, 24.98, 25, 0, 0 )
	self:addElement( Panel )
	self.Panel = Panel
	
	local LobbyMemberBacking = CoD.FE_ButtonPanel.new( menu, controller )
	LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
	LobbyMemberBacking:setTopBottom( true, false, -0.5, 27 )
	LobbyMemberBacking:setRGB( 0.62, 0.62, 0.62 )
	LobbyMemberBacking:setAlpha( 0 )
	self:addElement( LobbyMemberBacking )
	self.LobbyMemberBacking = LobbyMemberBacking
	
	local LobbyMemberTeamColor = CoD.LobbyMemberTeamColor.new( menu, controller )
	LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
	LobbyMemberTeamColor:setTopBottom( true, false, -0.5, 27.5 )
	LobbyMemberTeamColor:setRGB( 1, 1, 1 )
	LobbyMemberTeamColor.FEButtonPanelShaderContainer0:setAlpha( 0 )
	LobbyMemberTeamColor:linkToElementModel( self, nil, false, function ( model )
		LobbyMemberTeamColor:setModel( model, controller )
	end )
	self:addElement( LobbyMemberTeamColor )
	self.LobbyMemberTeamColor = LobbyMemberTeamColor
	
	local clanTag = LUI.UITightText.new()
	clanTag:setLeftRight( true, false, 90, 158 )
	clanTag:setTopBottom( true, false, 3, 24 )
	clanTag:setRGB( 0.87, 0.9, 0.9 )
	clanTag:setAlpha( 0 )
	clanTag:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( clanTag )
	self.clanTag = clanTag
	
	local gamertag = LUI.UITightText.new()
	gamertag:setLeftRight( true, false, 90, 361 )
	gamertag:setTopBottom( true, false, 0, 25 )
	gamertag:setRGB( 0.87, 0.9, 0.9 )
	gamertag:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( gamertag )
	self.gamertag = gamertag
	
	local PrimaryGroup = LUI.UIText.new()
	PrimaryGroup:setLeftRight( true, false, 90, 295 )
	PrimaryGroup:setTopBottom( true, false, 22, 38 )
	PrimaryGroup:setRGB( 0.87, 0.9, 0.9 )
	PrimaryGroup:setAlpha( 0 )
	PrimaryGroup:setText( Engine.Localize( "Group Here" ) )
	PrimaryGroup:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	PrimaryGroup:setLetterSpacing( 1 )
	PrimaryGroup:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	PrimaryGroup:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( PrimaryGroup )
	self.PrimaryGroup = PrimaryGroup
	
	local addControllerText = LUI.UIText.new()
	addControllerText:setLeftRight( true, false, 57, 457 )
	addControllerText:setTopBottom( true, false, 2.5, 19.5 )
	addControllerText:setRGB( 0.42, 0.52, 0.62 )
	addControllerText:setAlpha( 0 )
	addControllerText:setZoom( 10 )
	addControllerText:setText( Engine.Localize( "PLATFORM_FEEDER_SECONDARY_CONTROLLER_PLUGIN" ) )
	addControllerText:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	addControllerText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	addControllerText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( addControllerText )
	self.addControllerText = addControllerText
	
	local MorePlaying = LUI.UIText.new()
	MorePlaying:setLeftRight( true, false, 19, 509 )
	MorePlaying:setTopBottom( true, false, 2.5, 19.5 )
	MorePlaying:setRGB( 0.42, 0.52, 0.62 )
	MorePlaying:setAlpha( 0 )
	MorePlaying:setZoom( 10 )
	MorePlaying:setText( Engine.Localize( "MENU_LOBBY_MORECOUNT" ) )
	MorePlaying:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	MorePlaying:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	MorePlaying:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( MorePlaying )
	self.MorePlaying = MorePlaying
	
	local playerCountText = LUI.UITightText.new()
	playerCountText:setLeftRight( true, false, 57, 329 )
	playerCountText:setTopBottom( true, false, 7, 24 )
	playerCountText:setRGB( 0.42, 0.52, 0.62 )
	playerCountText:setAlpha( 0 )
	playerCountText:setText( Engine.Localize( "MENU_LOBBY_PLAYERCOUNT" ) )
	playerCountText:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	self:addElement( playerCountText )
	self.playerCountText = playerCountText
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, false, 58, 410 )
	FocusBarB:setTopBottom( true, false, 26, 29 )
	FocusBarB:setRGB( 1, 1, 1 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, false, 58, 410 )
	FocusBarT:setTopBottom( true, false, -4, 0 )
	FocusBarT:setRGB( 1, 1, 1 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local IconControllerContainer = CoD.IconControllerContainer.new( menu, controller )
	IconControllerContainer:setLeftRight( true, false, 2, 59 )
	IconControllerContainer:setTopBottom( true, false, -3, 29 )
	IconControllerContainer:setRGB( 0.74, 0.78, 0.79 )
	self:addElement( IconControllerContainer )
	self.IconControllerContainer = IconControllerContainer
	
	local IconJoinable = CoD.IconJoinable.new( menu, controller )
	IconJoinable:setLeftRight( true, false, 389, 413 )
	IconJoinable:setTopBottom( true, false, 1.5, 26.5 )
	IconJoinable:setRGB( 1, 1, 1 )
	IconJoinable:linkToElementModel( self, nil, false, function ( model )
		IconJoinable:setModel( model, controller )
	end )
	IconJoinable:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "isJoinable", 1 )
			end
		}
	} )
	IconJoinable:linkToElementModel( IconJoinable, "isJoinable", true, function ( model )
		menu:updateElementState( IconJoinable, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isJoinable"
		} )
	end )
	self:addElement( IconJoinable )
	self.IconJoinable = IconJoinable
	
	local rankIcon = LUI.UIImage.new()
	rankIcon:setLeftRight( true, false, 64, 87 )
	rankIcon:setTopBottom( true, false, 1, 24 )
	rankIcon:setRGB( 1, 1, 1 )
	rankIcon:setImage( RegisterImage( "uie_t7_menu_frontend_iconmodebo3" ) )
	rankIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( rankIcon )
	self.rankIcon = rankIcon
	
	self.score:linkToElementModel( self, "score", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			score:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.clanTag:linkToElementModel( self, "clanTag", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			clanTag:setText( modelValue )
		end
	end )
	self.gamertag:linkToElementModel( self, "gamertag", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			gamertag:setText( modelValue )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				LobbyLeaderIcon:completeAnimation()
				self.LobbyLeaderIcon:setAlpha( 0 )
				self.clipFinished( LobbyLeaderIcon, {} )
				PartyMemberIconNew:completeAnimation()
				PartyMemberIconNew.Icon:completeAnimation()
				self.PartyMemberIconNew.Icon:setRGB( 0.29, 0.38, 0.68 )
				self.clipFinished( PartyMemberIconNew, {} )
				Panel:completeAnimation()
				self.Panel:setLeftRight( true, true, 60, -82 )
				self.Panel:setTopBottom( false, false, -14, 13.5 )
				self.Panel:setZoom( 0 )
				self.clipFinished( Panel, {} )
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBacking:setTopBottom( true, false, -0.5, 27 )
				self.LobbyMemberBacking:setAlpha( 0 )
				self.LobbyMemberBacking:setZoom( 0 )
				self.clipFinished( LobbyMemberBacking, {} )
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberTeamColor:setTopBottom( true, false, -0.5, 27.5 )
				self.LobbyMemberTeamColor:setAlpha( 1 )
				self.LobbyMemberTeamColor:setZoom( 0 )
				self.clipFinished( LobbyMemberTeamColor, {} )
				clanTag:completeAnimation()
				self.clanTag:setRGB( 0.87, 0.9, 0.9 )
				self.clanTag:setAlpha( 0 )
				self.clanTag:setZoom( 0 )
				self.clipFinished( clanTag, {} )
				gamertag:completeAnimation()
				self.gamertag:setRGB( 0.87, 0.9, 0.9 )
				self.gamertag:setAlpha( 1 )
				self.gamertag:setZoom( 0 )
				self.clipFinished( gamertag, {} )
				PrimaryGroup:completeAnimation()
				self.PrimaryGroup:setAlpha( 0 )
				self.clipFinished( PrimaryGroup, {} )
				addControllerText:completeAnimation()
				self.addControllerText:setAlpha( 0 )
				self.clipFinished( addControllerText, {} )
				MorePlaying:completeAnimation()
				self.MorePlaying:setAlpha( 0 )
				self.clipFinished( MorePlaying, {} )
				playerCountText:completeAnimation()
				self.playerCountText:setAlpha( 0 )
				self.clipFinished( playerCountText, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, false, 58, 410 )
				self.FocusBarB:setTopBottom( true, false, 26, 29 )
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, false, 58, 410 )
				self.FocusBarT:setTopBottom( true, false, -4, 0 )
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 6 )
				Panel:completeAnimation()
				self.Panel:setLeftRight( true, true, 60, -82 )
				self.Panel:setTopBottom( false, false, -14, 26.5 )
				self.clipFinished( Panel, {} )
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBacking:setTopBottom( true, false, -0.5, 40 )
				self.clipFinished( LobbyMemberBacking, {} )
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberTeamColor:setTopBottom( true, false, -0.5, 40 )
				self.clipFinished( LobbyMemberTeamColor, {} )
				PrimaryGroup:completeAnimation()
				self.PrimaryGroup:setAlpha( 1 )
				self.clipFinished( PrimaryGroup, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, false, 58, 410 )
				self.FocusBarB:setTopBottom( true, false, 40, 44 )
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, false, 58, 410 )
				self.FocusBarT:setTopBottom( true, false, -4, 0 )
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 6 )
				local PanelFrame2 = function ( Panel, event )
					if not event.interrupted then
						Panel:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					Panel:setLeftRight( true, true, 60, -82 )
					Panel:setTopBottom( false, false, -14, 26.5 )
					Panel:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( Panel, event )
					else
						Panel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Panel:completeAnimation()
				self.Panel:setLeftRight( true, true, 60, -82 )
				self.Panel:setTopBottom( false, false, -14, 13.5 )
				self.Panel:setZoom( 0 )
				PanelFrame2( Panel, {} )
				local LobbyMemberBackingFrame2 = function ( LobbyMemberBacking, event )
					if not event.interrupted then
						LobbyMemberBacking:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
					LobbyMemberBacking:setTopBottom( true, false, -0.5, 40 )
					LobbyMemberBacking:setAlpha( 0 )
					LobbyMemberBacking:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking, event )
					else
						LobbyMemberBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBacking:setTopBottom( true, false, -0.5, 27 )
				self.LobbyMemberBacking:setAlpha( 0 )
				self.LobbyMemberBacking:setZoom( 0 )
				LobbyMemberBackingFrame2( LobbyMemberBacking, {} )
				local LobbyMemberTeamColorFrame2 = function ( LobbyMemberTeamColor, event )
					if not event.interrupted then
						LobbyMemberTeamColor:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
					LobbyMemberTeamColor:setTopBottom( true, false, -0.5, 40 )
					LobbyMemberTeamColor:setAlpha( 1 )
					LobbyMemberTeamColor:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberTeamColor, event )
					else
						LobbyMemberTeamColor:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberTeamColor:setTopBottom( true, false, -0.5, 27.5 )
				self.LobbyMemberTeamColor:setAlpha( 1 )
				self.LobbyMemberTeamColor:setZoom( 0 )
				LobbyMemberTeamColorFrame2( LobbyMemberTeamColor, {} )
				local PrimaryGroupFrame2 = function ( PrimaryGroup, event )
					if not event.interrupted then
						PrimaryGroup:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					PrimaryGroup:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( PrimaryGroup, event )
					else
						PrimaryGroup:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PrimaryGroup:completeAnimation()
				self.PrimaryGroup:setAlpha( 0 )
				PrimaryGroupFrame2( PrimaryGroup, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					if not event.interrupted then
						FocusBarB:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					FocusBarB:setLeftRight( true, false, 58, 410 )
					FocusBarB:setTopBottom( true, false, 40, 44 )
					FocusBarB:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBarB, event )
					else
						FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, false, 58, 410 )
				self.FocusBarB:setTopBottom( true, false, 12, 15 )
				self.FocusBarB:setAlpha( 0 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					if not event.interrupted then
						FocusBarT:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					FocusBarT:setLeftRight( true, false, 58, 410 )
					FocusBarT:setTopBottom( true, false, -4, 0 )
					FocusBarT:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBarT, event )
					else
						FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, false, 59, 410 )
				self.FocusBarT:setTopBottom( true, false, 12, 16 )
				self.FocusBarT:setAlpha( 0 )
				FocusBarTFrame2( FocusBarT, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 6 )
				local PanelFrame2 = function ( Panel, event )
					if not event.interrupted then
						Panel:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
					end
					Panel:setLeftRight( true, true, 60, -82 )
					Panel:setTopBottom( false, false, -14, 13.5 )
					Panel:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( Panel, event )
					else
						Panel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Panel:completeAnimation()
				self.Panel:setLeftRight( true, true, 60, -82 )
				self.Panel:setTopBottom( false, false, -14, 26.5 )
				self.Panel:setZoom( 0 )
				PanelFrame2( Panel, {} )
				local LobbyMemberBackingFrame2 = function ( LobbyMemberBacking, event )
					if not event.interrupted then
						LobbyMemberBacking:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
					LobbyMemberBacking:setTopBottom( true, false, -0.5, 27 )
					LobbyMemberBacking:setAlpha( 0 )
					LobbyMemberBacking:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking, event )
					else
						LobbyMemberBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBacking:setTopBottom( true, false, -0.5, 40 )
				self.LobbyMemberBacking:setAlpha( 0 )
				self.LobbyMemberBacking:setZoom( 0 )
				LobbyMemberBackingFrame2( LobbyMemberBacking, {} )
				local LobbyMemberTeamColorFrame2 = function ( LobbyMemberTeamColor, event )
					if not event.interrupted then
						LobbyMemberTeamColor:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
					LobbyMemberTeamColor:setTopBottom( true, false, -0.5, 27.5 )
					LobbyMemberTeamColor:setAlpha( 1 )
					LobbyMemberTeamColor:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberTeamColor, event )
					else
						LobbyMemberTeamColor:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberTeamColor:setTopBottom( true, false, -0.5, 40 )
				self.LobbyMemberTeamColor:setAlpha( 1 )
				self.LobbyMemberTeamColor:setZoom( 0 )
				LobbyMemberTeamColorFrame2( LobbyMemberTeamColor, {} )
				local PrimaryGroupFrame2 = function ( PrimaryGroup, event )
					if not event.interrupted then
						PrimaryGroup:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
					end
					PrimaryGroup:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PrimaryGroup, event )
					else
						PrimaryGroup:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PrimaryGroup:completeAnimation()
				self.PrimaryGroup:setAlpha( 1 )
				PrimaryGroupFrame2( PrimaryGroup, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					if not event.interrupted then
						FocusBarB:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
					end
					FocusBarB:setLeftRight( true, false, 58, 410 )
					FocusBarB:setTopBottom( true, false, 26, 29 )
					FocusBarB:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusBarB, event )
					else
						FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, false, 58, 410 )
				self.FocusBarB:setTopBottom( true, false, 40, 44 )
				self.FocusBarB:setAlpha( 1 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					if not event.interrupted then
						FocusBarT:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
					end
					FocusBarT:setLeftRight( true, false, 58, 410 )
					FocusBarT:setTopBottom( true, false, -4, 0 )
					FocusBarT:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusBarT, event )
					else
						FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, false, 58, 410 )
				self.FocusBarT:setTopBottom( true, false, -4, 0 )
				self.FocusBarT:setAlpha( 1 )
				FocusBarTFrame2( FocusBarT, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		IsSelf = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				LobbyLeaderIcon:completeAnimation()
				self.LobbyLeaderIcon:setAlpha( 1 )
				self.clipFinished( LobbyLeaderIcon, {} )
				PartyMemberIconNew:completeAnimation()
				PartyMemberIconNew.Icon:completeAnimation()
				self.PartyMemberIconNew.Icon:setRGB( 0.29, 0.38, 0.68 )
				self.clipFinished( PartyMemberIconNew, {} )
				Panel:completeAnimation()
				self.Panel:setLeftRight( true, true, 60, -82 )
				self.Panel:setTopBottom( false, false, -14, 13.5 )
				self.Panel:setZoom( 0 )
				self.clipFinished( Panel, {} )
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBacking:setTopBottom( true, false, -0.5, 27 )
				self.LobbyMemberBacking:setAlpha( 0 )
				self.LobbyMemberBacking:setZoom( 0 )
				self.clipFinished( LobbyMemberBacking, {} )
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberTeamColor:setTopBottom( true, false, -0.5, 27.5 )
				self.LobbyMemberTeamColor:setAlpha( 1 )
				self.LobbyMemberTeamColor:setZoom( 0 )
				self.clipFinished( LobbyMemberTeamColor, {} )
				clanTag:completeAnimation()
				self.clanTag:setRGB( 0.96, 1, 0.33 )
				self.clanTag:setAlpha( 0 )
				self.clanTag:setZoom( 0 )
				self.clipFinished( clanTag, {} )
				gamertag:completeAnimation()
				self.gamertag:setRGB( 0.96, 1, 0.33 )
				self.gamertag:setAlpha( 1 )
				self.gamertag:setZoom( 0 )
				self.clipFinished( gamertag, {} )
				PrimaryGroup:completeAnimation()
				self.PrimaryGroup:setAlpha( 0 )
				self.clipFinished( PrimaryGroup, {} )
				addControllerText:completeAnimation()
				self.addControllerText:setAlpha( 0 )
				self.clipFinished( addControllerText, {} )
				MorePlaying:completeAnimation()
				self.MorePlaying:setAlpha( 0 )
				self.clipFinished( MorePlaying, {} )
				playerCountText:completeAnimation()
				self.playerCountText:setAlpha( 0 )
				self.clipFinished( playerCountText, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, false, 58, 410 )
				self.FocusBarB:setTopBottom( true, false, 26, 29 )
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, false, 58, 410 )
				self.FocusBarT:setTopBottom( true, false, -4, 0 )
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 6 )
				Panel:completeAnimation()
				self.Panel:setLeftRight( true, true, 60, -82 )
				self.Panel:setTopBottom( false, false, -14, 26.5 )
				self.clipFinished( Panel, {} )
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBacking:setTopBottom( true, false, -0.5, 40 )
				self.clipFinished( LobbyMemberBacking, {} )
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberTeamColor:setTopBottom( true, false, -0.5, 40 )
				self.clipFinished( LobbyMemberTeamColor, {} )
				PrimaryGroup:completeAnimation()
				self.PrimaryGroup:setAlpha( 1 )
				self.clipFinished( PrimaryGroup, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, false, 58, 410 )
				self.FocusBarB:setTopBottom( true, false, 40, 44 )
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, false, 58, 410 )
				self.FocusBarT:setTopBottom( true, false, -4, 0 )
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 6 )
				local PanelFrame2 = function ( Panel, event )
					if not event.interrupted then
						Panel:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					Panel:setLeftRight( true, true, 60, -82 )
					Panel:setTopBottom( false, false, -14, 26.5 )
					Panel:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( Panel, event )
					else
						Panel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Panel:completeAnimation()
				self.Panel:setLeftRight( true, true, 60, -82 )
				self.Panel:setTopBottom( false, false, -14, 13.5 )
				self.Panel:setZoom( 0 )
				PanelFrame2( Panel, {} )
				local LobbyMemberBackingFrame2 = function ( LobbyMemberBacking, event )
					if not event.interrupted then
						LobbyMemberBacking:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
					LobbyMemberBacking:setTopBottom( true, false, -0.5, 40 )
					LobbyMemberBacking:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking, event )
					else
						LobbyMemberBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBacking:setTopBottom( true, false, -0.5, 27 )
				self.LobbyMemberBacking:setZoom( 0 )
				LobbyMemberBackingFrame2( LobbyMemberBacking, {} )
				local LobbyMemberTeamColorFrame2 = function ( LobbyMemberTeamColor, event )
					if not event.interrupted then
						LobbyMemberTeamColor:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
					LobbyMemberTeamColor:setTopBottom( true, false, -0.5, 40 )
					LobbyMemberTeamColor:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberTeamColor, event )
					else
						LobbyMemberTeamColor:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberTeamColor:setTopBottom( true, false, -0.5, 27.5 )
				self.LobbyMemberTeamColor:setZoom( 0 )
				LobbyMemberTeamColorFrame2( LobbyMemberTeamColor, {} )
				local PrimaryGroupFrame2 = function ( PrimaryGroup, event )
					if not event.interrupted then
						PrimaryGroup:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					PrimaryGroup:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( PrimaryGroup, event )
					else
						PrimaryGroup:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PrimaryGroup:completeAnimation()
				self.PrimaryGroup:setAlpha( 0 )
				PrimaryGroupFrame2( PrimaryGroup, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					if not event.interrupted then
						FocusBarB:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					FocusBarB:setLeftRight( true, false, 58, 410 )
					FocusBarB:setTopBottom( true, false, 40, 44 )
					FocusBarB:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBarB, event )
					else
						FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, false, 58, 410 )
				self.FocusBarB:setTopBottom( true, false, 12, 15 )
				self.FocusBarB:setAlpha( 0 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					if not event.interrupted then
						FocusBarT:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					FocusBarT:setLeftRight( true, false, 58, 410 )
					FocusBarT:setTopBottom( true, false, -4, 0 )
					FocusBarT:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBarT, event )
					else
						FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, false, 59, 410 )
				self.FocusBarT:setTopBottom( true, false, 12, 16 )
				self.FocusBarT:setAlpha( 0 )
				FocusBarTFrame2( FocusBarT, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 6 )
				local PanelFrame2 = function ( Panel, event )
					if not event.interrupted then
						Panel:beginAnimation( "keyframe", 200, true, true, CoD.TweenType.Linear )
					end
					Panel:setLeftRight( true, true, 60, -82 )
					Panel:setTopBottom( false, false, -14, 13.5 )
					Panel:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( Panel, event )
					else
						Panel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Panel:completeAnimation()
				self.Panel:setLeftRight( true, true, 60, -82 )
				self.Panel:setTopBottom( false, false, -14, 26.5 )
				self.Panel:setZoom( 0 )
				PanelFrame2( Panel, {} )
				local LobbyMemberBackingFrame2 = function ( LobbyMemberBacking, event )
					if not event.interrupted then
						LobbyMemberBacking:beginAnimation( "keyframe", 200, true, true, CoD.TweenType.Linear )
					end
					LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
					LobbyMemberBacking:setTopBottom( true, false, -0.5, 27 )
					LobbyMemberBacking:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking, event )
					else
						LobbyMemberBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBacking:setTopBottom( true, false, -0.5, 40 )
				self.LobbyMemberBacking:setZoom( 0 )
				LobbyMemberBackingFrame2( LobbyMemberBacking, {} )
				local LobbyMemberTeamColorFrame2 = function ( LobbyMemberTeamColor, event )
					if not event.interrupted then
						LobbyMemberTeamColor:beginAnimation( "keyframe", 200, true, true, CoD.TweenType.Linear )
					end
					LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
					LobbyMemberTeamColor:setTopBottom( true, false, -0.5, 27.5 )
					LobbyMemberTeamColor:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberTeamColor, event )
					else
						LobbyMemberTeamColor:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberTeamColor:setTopBottom( true, false, -0.5, 40 )
				self.LobbyMemberTeamColor:setZoom( 0 )
				LobbyMemberTeamColorFrame2( LobbyMemberTeamColor, {} )
				local PrimaryGroupFrame2 = function ( PrimaryGroup, event )
					if not event.interrupted then
						PrimaryGroup:beginAnimation( "keyframe", 200, true, true, CoD.TweenType.Linear )
					end
					PrimaryGroup:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PrimaryGroup, event )
					else
						PrimaryGroup:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PrimaryGroup:completeAnimation()
				self.PrimaryGroup:setAlpha( 1 )
				PrimaryGroupFrame2( PrimaryGroup, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					if not event.interrupted then
						FocusBarB:beginAnimation( "keyframe", 109, true, true, CoD.TweenType.Linear )
					end
					FocusBarB:setLeftRight( true, false, 58, 410 )
					FocusBarB:setTopBottom( true, false, 26, 29 )
					FocusBarB:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusBarB, event )
					else
						FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, false, 58, 410 )
				self.FocusBarB:setTopBottom( true, false, 40, 44 )
				self.FocusBarB:setAlpha( 1 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					if not event.interrupted then
						FocusBarT:beginAnimation( "keyframe", 109, true, true, CoD.TweenType.Linear )
					end
					FocusBarT:setLeftRight( true, false, 58, 410 )
					FocusBarT:setTopBottom( true, false, -4, 0 )
					FocusBarT:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusBarT, event )
					else
						FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, false, 58, 410 )
				self.FocusBarT:setTopBottom( true, false, -4, 0 )
				self.FocusBarT:setAlpha( 1 )
				FocusBarTFrame2( FocusBarT, {} )
			end
		},
		IsFriend = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				LobbyLeaderIcon:completeAnimation()
				self.LobbyLeaderIcon:setAlpha( 0 )
				self.clipFinished( LobbyLeaderIcon, {} )
				PartyMemberIconNew:completeAnimation()
				PartyMemberIconNew.Icon:completeAnimation()
				self.PartyMemberIconNew.Icon:setRGB( 0.29, 0.38, 0.68 )
				self.clipFinished( PartyMemberIconNew, {} )
				Panel:completeAnimation()
				self.Panel:setLeftRight( true, true, 60, -82 )
				self.Panel:setTopBottom( false, false, -14, 13.5 )
				self.Panel:setZoom( 0 )
				self.clipFinished( Panel, {} )
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBacking:setTopBottom( true, false, -0.5, 27 )
				self.LobbyMemberBacking:setAlpha( 0.3 )
				self.LobbyMemberBacking:setZoom( 0 )
				self.clipFinished( LobbyMemberBacking, {} )
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberTeamColor:setTopBottom( true, false, -0.5, 27.5 )
				self.LobbyMemberTeamColor:setAlpha( 1 )
				self.LobbyMemberTeamColor:setZoom( 0 )
				self.clipFinished( LobbyMemberTeamColor, {} )
				clanTag:completeAnimation()
				self.clanTag:setRGB( 0.87, 0.9, 0.9 )
				self.clanTag:setAlpha( 0 )
				self.clanTag:setZoom( 0 )
				self.clipFinished( clanTag, {} )
				gamertag:completeAnimation()
				self.gamertag:setRGB( 0.87, 0.9, 0.9 )
				self.gamertag:setAlpha( 1 )
				self.gamertag:setZoom( 0 )
				self.clipFinished( gamertag, {} )
				PrimaryGroup:completeAnimation()
				self.PrimaryGroup:setAlpha( 0 )
				self.clipFinished( PrimaryGroup, {} )
				addControllerText:completeAnimation()
				self.addControllerText:setAlpha( 0 )
				self.clipFinished( addControllerText, {} )
				MorePlaying:completeAnimation()
				self.MorePlaying:setAlpha( 0 )
				self.clipFinished( MorePlaying, {} )
				playerCountText:completeAnimation()
				self.playerCountText:setAlpha( 0 )
				self.clipFinished( playerCountText, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, false, 58, 410 )
				self.FocusBarB:setTopBottom( true, false, 26, 29 )
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, false, 58, 410 )
				self.FocusBarT:setTopBottom( true, false, -4, 0 )
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 6 )
				Panel:completeAnimation()
				self.Panel:setLeftRight( true, true, 60, -82 )
				self.Panel:setTopBottom( false, false, -14, 26.5 )
				self.clipFinished( Panel, {} )
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBacking:setTopBottom( true, false, -0.5, 40 )
				self.clipFinished( LobbyMemberBacking, {} )
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberTeamColor:setTopBottom( true, false, -0.5, 40 )
				self.clipFinished( LobbyMemberTeamColor, {} )
				PrimaryGroup:completeAnimation()
				self.PrimaryGroup:setAlpha( 1 )
				self.clipFinished( PrimaryGroup, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, false, 58, 410 )
				self.FocusBarB:setTopBottom( true, false, 40, 44 )
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, false, 58, 410 )
				self.FocusBarT:setTopBottom( true, false, -4, 0 )
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 6 )
				local PanelFrame2 = function ( Panel, event )
					if not event.interrupted then
						Panel:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					Panel:setLeftRight( true, true, 60, -82 )
					Panel:setTopBottom( false, false, -14, 26.5 )
					Panel:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( Panel, event )
					else
						Panel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Panel:completeAnimation()
				self.Panel:setLeftRight( true, true, 60, -82 )
				self.Panel:setTopBottom( false, false, -14, 13.5 )
				self.Panel:setZoom( 0 )
				PanelFrame2( Panel, {} )
				local LobbyMemberBackingFrame2 = function ( LobbyMemberBacking, event )
					if not event.interrupted then
						LobbyMemberBacking:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
					LobbyMemberBacking:setTopBottom( true, false, -0.5, 40 )
					LobbyMemberBacking:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking, event )
					else
						LobbyMemberBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBacking:setTopBottom( true, false, -0.5, 27 )
				self.LobbyMemberBacking:setZoom( 0 )
				LobbyMemberBackingFrame2( LobbyMemberBacking, {} )
				local LobbyMemberTeamColorFrame2 = function ( LobbyMemberTeamColor, event )
					if not event.interrupted then
						LobbyMemberTeamColor:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
					LobbyMemberTeamColor:setTopBottom( true, false, -0.5, 40 )
					LobbyMemberTeamColor:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberTeamColor, event )
					else
						LobbyMemberTeamColor:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberTeamColor:setTopBottom( true, false, -0.5, 27.5 )
				self.LobbyMemberTeamColor:setZoom( 0 )
				LobbyMemberTeamColorFrame2( LobbyMemberTeamColor, {} )
				local PrimaryGroupFrame2 = function ( PrimaryGroup, event )
					if not event.interrupted then
						PrimaryGroup:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					PrimaryGroup:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( PrimaryGroup, event )
					else
						PrimaryGroup:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PrimaryGroup:completeAnimation()
				self.PrimaryGroup:setAlpha( 0 )
				PrimaryGroupFrame2( PrimaryGroup, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					if not event.interrupted then
						FocusBarB:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					FocusBarB:setLeftRight( true, false, 58, 410 )
					FocusBarB:setTopBottom( true, false, 40, 44 )
					FocusBarB:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBarB, event )
					else
						FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, false, 58, 410 )
				self.FocusBarB:setTopBottom( true, false, 12, 15 )
				self.FocusBarB:setAlpha( 0 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					if not event.interrupted then
						FocusBarT:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					FocusBarT:setLeftRight( true, false, 58, 410 )
					FocusBarT:setTopBottom( true, false, -4, 0 )
					FocusBarT:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBarT, event )
					else
						FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, false, 59, 410 )
				self.FocusBarT:setTopBottom( true, false, 12, 16 )
				self.FocusBarT:setAlpha( 0 )
				FocusBarTFrame2( FocusBarT, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 6 )
				local PanelFrame2 = function ( Panel, event )
					if not event.interrupted then
						Panel:beginAnimation( "keyframe", 200, true, true, CoD.TweenType.Linear )
					end
					Panel:setLeftRight( true, true, 60, -82 )
					Panel:setTopBottom( false, false, -14, 13.5 )
					Panel:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( Panel, event )
					else
						Panel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Panel:completeAnimation()
				self.Panel:setLeftRight( true, true, 60, -82 )
				self.Panel:setTopBottom( false, false, -14, 26.5 )
				self.Panel:setZoom( 0 )
				PanelFrame2( Panel, {} )
				local LobbyMemberBackingFrame2 = function ( LobbyMemberBacking, event )
					if not event.interrupted then
						LobbyMemberBacking:beginAnimation( "keyframe", 200, true, true, CoD.TweenType.Linear )
					end
					LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
					LobbyMemberBacking:setTopBottom( true, false, -0.5, 27 )
					LobbyMemberBacking:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking, event )
					else
						LobbyMemberBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBacking:setTopBottom( true, false, -0.5, 40 )
				self.LobbyMemberBacking:setZoom( 0 )
				LobbyMemberBackingFrame2( LobbyMemberBacking, {} )
				local LobbyMemberTeamColorFrame2 = function ( LobbyMemberTeamColor, event )
					if not event.interrupted then
						LobbyMemberTeamColor:beginAnimation( "keyframe", 200, true, true, CoD.TweenType.Linear )
					end
					LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
					LobbyMemberTeamColor:setTopBottom( true, false, -0.5, 27.5 )
					LobbyMemberTeamColor:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberTeamColor, event )
					else
						LobbyMemberTeamColor:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberTeamColor:setTopBottom( true, false, -0.5, 40 )
				self.LobbyMemberTeamColor:setZoom( 0 )
				LobbyMemberTeamColorFrame2( LobbyMemberTeamColor, {} )
				local PrimaryGroupFrame2 = function ( PrimaryGroup, event )
					if not event.interrupted then
						PrimaryGroup:beginAnimation( "keyframe", 200, true, true, CoD.TweenType.Linear )
					end
					PrimaryGroup:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PrimaryGroup, event )
					else
						PrimaryGroup:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PrimaryGroup:completeAnimation()
				self.PrimaryGroup:setAlpha( 1 )
				PrimaryGroupFrame2( PrimaryGroup, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					if not event.interrupted then
						FocusBarB:beginAnimation( "keyframe", 109, true, true, CoD.TweenType.Linear )
					end
					FocusBarB:setLeftRight( true, false, 58, 410 )
					FocusBarB:setTopBottom( true, false, 26, 29 )
					FocusBarB:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusBarB, event )
					else
						FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, false, 58, 410 )
				self.FocusBarB:setTopBottom( true, false, 40, 44 )
				self.FocusBarB:setAlpha( 1 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					if not event.interrupted then
						FocusBarT:beginAnimation( "keyframe", 109, true, true, CoD.TweenType.Linear )
					end
					FocusBarT:setLeftRight( true, false, 58, 410 )
					FocusBarT:setTopBottom( true, false, -4, 0 )
					FocusBarT:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusBarT, event )
					else
						FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, false, 58, 410 )
				self.FocusBarT:setTopBottom( true, false, -4, 0 )
				self.FocusBarT:setAlpha( 1 )
				FocusBarTFrame2( FocusBarT, {} )
			end
		},
		IsGroupMember = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				LobbyLeaderIcon:completeAnimation()
				self.LobbyLeaderIcon:setAlpha( 0 )
				self.clipFinished( LobbyLeaderIcon, {} )
				PartyMemberIconNew:completeAnimation()
				PartyMemberIconNew.Icon:completeAnimation()
				self.PartyMemberIconNew.Icon:setRGB( 0.29, 0.38, 0.68 )
				self.clipFinished( PartyMemberIconNew, {} )
				Panel:completeAnimation()
				self.Panel:setLeftRight( true, true, 60, -82 )
				self.Panel:setTopBottom( false, false, -14, 13.5 )
				self.Panel:setZoom( 0 )
				self.clipFinished( Panel, {} )
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBacking:setTopBottom( true, false, -0.5, 27 )
				self.LobbyMemberBacking:setAlpha( 0.05 )
				self.LobbyMemberBacking:setZoom( 0 )
				self.clipFinished( LobbyMemberBacking, {} )
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberTeamColor:setTopBottom( true, false, -0.5, 27.5 )
				self.LobbyMemberTeamColor:setAlpha( 1 )
				self.LobbyMemberTeamColor:setZoom( 0 )
				self.clipFinished( LobbyMemberTeamColor, {} )
				clanTag:completeAnimation()
				self.clanTag:setRGB( 0.87, 0.9, 0.9 )
				self.clanTag:setAlpha( 0 )
				self.clanTag:setZoom( 0 )
				self.clipFinished( clanTag, {} )
				gamertag:completeAnimation()
				self.gamertag:setRGB( 0.87, 0.9, 0.9 )
				self.gamertag:setAlpha( 1 )
				self.gamertag:setZoom( 0 )
				self.clipFinished( gamertag, {} )
				PrimaryGroup:completeAnimation()
				self.PrimaryGroup:setAlpha( 0 )
				self.clipFinished( PrimaryGroup, {} )
				addControllerText:completeAnimation()
				self.addControllerText:setAlpha( 0 )
				self.clipFinished( addControllerText, {} )
				MorePlaying:completeAnimation()
				self.MorePlaying:setAlpha( 0 )
				self.clipFinished( MorePlaying, {} )
				playerCountText:completeAnimation()
				self.playerCountText:setAlpha( 0 )
				self.clipFinished( playerCountText, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, false, 58, 410 )
				self.FocusBarB:setTopBottom( true, false, 26, 29 )
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, false, 58, 410 )
				self.FocusBarT:setTopBottom( true, false, -4, 0 )
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 6 )
				Panel:completeAnimation()
				self.Panel:setLeftRight( true, true, 60, -82 )
				self.Panel:setTopBottom( false, false, -14, 26.5 )
				self.clipFinished( Panel, {} )
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBacking:setTopBottom( true, false, -0.5, 40 )
				self.clipFinished( LobbyMemberBacking, {} )
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberTeamColor:setTopBottom( true, false, -0.5, 40 )
				self.clipFinished( LobbyMemberTeamColor, {} )
				PrimaryGroup:completeAnimation()
				self.PrimaryGroup:setAlpha( 1 )
				self.clipFinished( PrimaryGroup, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, false, 58, 410 )
				self.FocusBarB:setTopBottom( true, false, 40, 44 )
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, false, 58, 410 )
				self.FocusBarT:setTopBottom( true, false, -4, 0 )
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 6 )
				local PanelFrame2 = function ( Panel, event )
					if not event.interrupted then
						Panel:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					Panel:setLeftRight( true, true, 60, -82 )
					Panel:setTopBottom( false, false, -14, 26.5 )
					Panel:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( Panel, event )
					else
						Panel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Panel:completeAnimation()
				self.Panel:setLeftRight( true, true, 60, -82 )
				self.Panel:setTopBottom( false, false, -14, 13.5 )
				self.Panel:setZoom( 0 )
				PanelFrame2( Panel, {} )
				local LobbyMemberBackingFrame2 = function ( LobbyMemberBacking, event )
					if not event.interrupted then
						LobbyMemberBacking:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
					LobbyMemberBacking:setTopBottom( true, false, -0.5, 40 )
					LobbyMemberBacking:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking, event )
					else
						LobbyMemberBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBacking:setTopBottom( true, false, -0.5, 27 )
				self.LobbyMemberBacking:setZoom( 0 )
				LobbyMemberBackingFrame2( LobbyMemberBacking, {} )
				local LobbyMemberTeamColorFrame2 = function ( LobbyMemberTeamColor, event )
					if not event.interrupted then
						LobbyMemberTeamColor:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
					LobbyMemberTeamColor:setTopBottom( true, false, -0.5, 40 )
					LobbyMemberTeamColor:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberTeamColor, event )
					else
						LobbyMemberTeamColor:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberTeamColor:setTopBottom( true, false, -0.5, 27.5 )
				self.LobbyMemberTeamColor:setZoom( 0 )
				LobbyMemberTeamColorFrame2( LobbyMemberTeamColor, {} )
				local PrimaryGroupFrame2 = function ( PrimaryGroup, event )
					if not event.interrupted then
						PrimaryGroup:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					PrimaryGroup:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( PrimaryGroup, event )
					else
						PrimaryGroup:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PrimaryGroup:completeAnimation()
				self.PrimaryGroup:setAlpha( 0 )
				PrimaryGroupFrame2( PrimaryGroup, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					if not event.interrupted then
						FocusBarB:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					FocusBarB:setLeftRight( true, false, 58, 410 )
					FocusBarB:setTopBottom( true, false, 40, 44 )
					FocusBarB:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBarB, event )
					else
						FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, false, 58, 410 )
				self.FocusBarB:setTopBottom( true, false, 12, 15 )
				self.FocusBarB:setAlpha( 0 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					if not event.interrupted then
						FocusBarT:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					FocusBarT:setLeftRight( true, false, 58, 410 )
					FocusBarT:setTopBottom( true, false, -4, 0 )
					FocusBarT:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBarT, event )
					else
						FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, false, 59, 410 )
				self.FocusBarT:setTopBottom( true, false, 12, 16 )
				self.FocusBarT:setAlpha( 0 )
				FocusBarTFrame2( FocusBarT, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 6 )
				local PanelFrame2 = function ( Panel, event )
					if not event.interrupted then
						Panel:beginAnimation( "keyframe", 200, true, true, CoD.TweenType.Linear )
					end
					Panel:setLeftRight( true, true, 60, -82 )
					Panel:setTopBottom( false, false, -14, 13.5 )
					Panel:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( Panel, event )
					else
						Panel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Panel:completeAnimation()
				self.Panel:setLeftRight( true, true, 60, -82 )
				self.Panel:setTopBottom( false, false, -14, 26.5 )
				self.Panel:setZoom( 0 )
				PanelFrame2( Panel, {} )
				local LobbyMemberBackingFrame2 = function ( LobbyMemberBacking, event )
					if not event.interrupted then
						LobbyMemberBacking:beginAnimation( "keyframe", 200, true, true, CoD.TweenType.Linear )
					end
					LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
					LobbyMemberBacking:setTopBottom( true, false, -0.5, 27 )
					LobbyMemberBacking:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking, event )
					else
						LobbyMemberBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBacking:setTopBottom( true, false, -0.5, 40 )
				self.LobbyMemberBacking:setZoom( 0 )
				LobbyMemberBackingFrame2( LobbyMemberBacking, {} )
				local LobbyMemberTeamColorFrame2 = function ( LobbyMemberTeamColor, event )
					if not event.interrupted then
						LobbyMemberTeamColor:beginAnimation( "keyframe", 200, true, true, CoD.TweenType.Linear )
					end
					LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
					LobbyMemberTeamColor:setTopBottom( true, false, -0.5, 27.5 )
					LobbyMemberTeamColor:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberTeamColor, event )
					else
						LobbyMemberTeamColor:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberTeamColor:setTopBottom( true, false, -0.5, 40 )
				self.LobbyMemberTeamColor:setZoom( 0 )
				LobbyMemberTeamColorFrame2( LobbyMemberTeamColor, {} )
				local PrimaryGroupFrame2 = function ( PrimaryGroup, event )
					if not event.interrupted then
						PrimaryGroup:beginAnimation( "keyframe", 200, true, true, CoD.TweenType.Linear )
					end
					PrimaryGroup:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PrimaryGroup, event )
					else
						PrimaryGroup:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PrimaryGroup:completeAnimation()
				self.PrimaryGroup:setAlpha( 1 )
				PrimaryGroupFrame2( PrimaryGroup, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					if not event.interrupted then
						FocusBarB:beginAnimation( "keyframe", 109, true, true, CoD.TweenType.Linear )
					end
					FocusBarB:setLeftRight( true, false, 58, 410 )
					FocusBarB:setTopBottom( true, false, 26, 29 )
					FocusBarB:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusBarB, event )
					else
						FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, false, 58, 410 )
				self.FocusBarB:setTopBottom( true, false, 40, 44 )
				self.FocusBarB:setAlpha( 1 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					if not event.interrupted then
						FocusBarT:beginAnimation( "keyframe", 109, true, true, CoD.TweenType.Linear )
					end
					FocusBarT:setLeftRight( true, false, 58, 410 )
					FocusBarT:setTopBottom( true, false, -4, 0 )
					FocusBarT:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusBarT, event )
					else
						FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, false, 58, 410 )
				self.FocusBarT:setTopBottom( true, false, -4, 0 )
				self.FocusBarT:setAlpha( 1 )
				FocusBarTFrame2( FocusBarT, {} )
			end
		},
		IsOtherPartyMember = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				LobbyLeaderIcon:completeAnimation()
				self.LobbyLeaderIcon:setAlpha( 1 )
				self.clipFinished( LobbyLeaderIcon, {} )
				PartyMemberIconNew:completeAnimation()
				PartyMemberIconNew.Icon:completeAnimation()
				self.PartyMemberIconNew.Icon:setRGB( 0.76, 0.76, 0.76 )
				self.clipFinished( PartyMemberIconNew, {} )
				Panel:completeAnimation()
				self.Panel:setLeftRight( true, true, 60, -82 )
				self.Panel:setTopBottom( false, false, -14, 13.5 )
				self.Panel:setZoom( 0 )
				self.clipFinished( Panel, {} )
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBacking:setTopBottom( true, false, -0.5, 27 )
				self.LobbyMemberBacking:setAlpha( 0 )
				self.LobbyMemberBacking:setZoom( 0 )
				self.clipFinished( LobbyMemberBacking, {} )
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberTeamColor:setTopBottom( true, false, -0.5, 27.5 )
				self.LobbyMemberTeamColor:setAlpha( 1 )
				self.LobbyMemberTeamColor:setZoom( 0 )
				self.clipFinished( LobbyMemberTeamColor, {} )
				clanTag:completeAnimation()
				self.clanTag:setRGB( 0.87, 0.9, 0.9 )
				self.clanTag:setAlpha( 0 )
				self.clanTag:setZoom( 0 )
				self.clipFinished( clanTag, {} )
				gamertag:completeAnimation()
				self.gamertag:setRGB( 0.87, 0.9, 0.9 )
				self.gamertag:setAlpha( 1 )
				self.gamertag:setZoom( 0 )
				self.clipFinished( gamertag, {} )
				PrimaryGroup:completeAnimation()
				self.PrimaryGroup:setAlpha( 0 )
				self.clipFinished( PrimaryGroup, {} )
				addControllerText:completeAnimation()
				self.addControllerText:setAlpha( 0 )
				self.clipFinished( addControllerText, {} )
				MorePlaying:completeAnimation()
				self.MorePlaying:setAlpha( 0 )
				self.clipFinished( MorePlaying, {} )
				playerCountText:completeAnimation()
				self.playerCountText:setAlpha( 0 )
				self.clipFinished( playerCountText, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, false, 58, 410 )
				self.FocusBarB:setTopBottom( true, false, 26, 29 )
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, false, 58, 410 )
				self.FocusBarT:setTopBottom( true, false, -4, 0 )
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 6 )
				Panel:completeAnimation()
				self.Panel:setLeftRight( true, true, 60, -82 )
				self.Panel:setTopBottom( false, false, -14, 26.5 )
				self.clipFinished( Panel, {} )
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBacking:setTopBottom( true, false, -0.5, 40 )
				self.clipFinished( LobbyMemberBacking, {} )
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberTeamColor:setTopBottom( true, false, -0.5, 40 )
				self.clipFinished( LobbyMemberTeamColor, {} )
				PrimaryGroup:completeAnimation()
				self.PrimaryGroup:setAlpha( 1 )
				self.clipFinished( PrimaryGroup, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, false, 58, 410 )
				self.FocusBarB:setTopBottom( true, false, 40, 44 )
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, false, 58, 410 )
				self.FocusBarT:setTopBottom( true, false, -4, 0 )
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 6 )
				local PanelFrame2 = function ( Panel, event )
					if not event.interrupted then
						Panel:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					Panel:setLeftRight( true, true, 60, -82 )
					Panel:setTopBottom( false, false, -14, 26.5 )
					Panel:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( Panel, event )
					else
						Panel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Panel:completeAnimation()
				self.Panel:setLeftRight( true, true, 60, -82 )
				self.Panel:setTopBottom( false, false, -14, 13.5 )
				self.Panel:setZoom( 0 )
				PanelFrame2( Panel, {} )
				local LobbyMemberBackingFrame2 = function ( LobbyMemberBacking, event )
					if not event.interrupted then
						LobbyMemberBacking:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
					LobbyMemberBacking:setTopBottom( true, false, -0.5, 40 )
					LobbyMemberBacking:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking, event )
					else
						LobbyMemberBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBacking:setTopBottom( true, false, -0.5, 27 )
				self.LobbyMemberBacking:setZoom( 0 )
				LobbyMemberBackingFrame2( LobbyMemberBacking, {} )
				local LobbyMemberTeamColorFrame2 = function ( LobbyMemberTeamColor, event )
					if not event.interrupted then
						LobbyMemberTeamColor:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
					LobbyMemberTeamColor:setTopBottom( true, false, -0.5, 40 )
					LobbyMemberTeamColor:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberTeamColor, event )
					else
						LobbyMemberTeamColor:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberTeamColor:setTopBottom( true, false, -0.5, 27.5 )
				self.LobbyMemberTeamColor:setZoom( 0 )
				LobbyMemberTeamColorFrame2( LobbyMemberTeamColor, {} )
				local PrimaryGroupFrame2 = function ( PrimaryGroup, event )
					if not event.interrupted then
						PrimaryGroup:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					PrimaryGroup:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( PrimaryGroup, event )
					else
						PrimaryGroup:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PrimaryGroup:completeAnimation()
				self.PrimaryGroup:setAlpha( 0 )
				PrimaryGroupFrame2( PrimaryGroup, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					if not event.interrupted then
						FocusBarB:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					FocusBarB:setLeftRight( true, false, 58, 410 )
					FocusBarB:setTopBottom( true, false, 40, 44 )
					FocusBarB:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBarB, event )
					else
						FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, false, 58, 410 )
				self.FocusBarB:setTopBottom( true, false, 12, 15 )
				self.FocusBarB:setAlpha( 0 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					if not event.interrupted then
						FocusBarT:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					FocusBarT:setLeftRight( true, false, 58, 410 )
					FocusBarT:setTopBottom( true, false, -4, 0 )
					FocusBarT:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBarT, event )
					else
						FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, false, 59, 410 )
				self.FocusBarT:setTopBottom( true, false, 12, 16 )
				self.FocusBarT:setAlpha( 0 )
				FocusBarTFrame2( FocusBarT, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 6 )
				local PanelFrame2 = function ( Panel, event )
					if not event.interrupted then
						Panel:beginAnimation( "keyframe", 200, true, true, CoD.TweenType.Linear )
					end
					Panel:setLeftRight( true, true, 60, -82 )
					Panel:setTopBottom( false, false, -14, 13.5 )
					Panel:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( Panel, event )
					else
						Panel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Panel:completeAnimation()
				self.Panel:setLeftRight( true, true, 60, -82 )
				self.Panel:setTopBottom( false, false, -14, 26.5 )
				self.Panel:setZoom( 0 )
				PanelFrame2( Panel, {} )
				local LobbyMemberBackingFrame2 = function ( LobbyMemberBacking, event )
					if not event.interrupted then
						LobbyMemberBacking:beginAnimation( "keyframe", 200, true, true, CoD.TweenType.Linear )
					end
					LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
					LobbyMemberBacking:setTopBottom( true, false, -0.5, 27 )
					LobbyMemberBacking:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking, event )
					else
						LobbyMemberBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBacking:setTopBottom( true, false, -0.5, 40 )
				self.LobbyMemberBacking:setZoom( 0 )
				LobbyMemberBackingFrame2( LobbyMemberBacking, {} )
				local LobbyMemberTeamColorFrame2 = function ( LobbyMemberTeamColor, event )
					if not event.interrupted then
						LobbyMemberTeamColor:beginAnimation( "keyframe", 200, true, true, CoD.TweenType.Linear )
					end
					LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
					LobbyMemberTeamColor:setTopBottom( true, false, -0.5, 27.5 )
					LobbyMemberTeamColor:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberTeamColor, event )
					else
						LobbyMemberTeamColor:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberTeamColor:setTopBottom( true, false, -0.5, 40 )
				self.LobbyMemberTeamColor:setZoom( 0 )
				LobbyMemberTeamColorFrame2( LobbyMemberTeamColor, {} )
				local PrimaryGroupFrame2 = function ( PrimaryGroup, event )
					if not event.interrupted then
						PrimaryGroup:beginAnimation( "keyframe", 200, true, true, CoD.TweenType.Linear )
					end
					PrimaryGroup:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PrimaryGroup, event )
					else
						PrimaryGroup:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PrimaryGroup:completeAnimation()
				self.PrimaryGroup:setAlpha( 1 )
				PrimaryGroupFrame2( PrimaryGroup, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					if not event.interrupted then
						FocusBarB:beginAnimation( "keyframe", 109, true, true, CoD.TweenType.Linear )
					end
					FocusBarB:setLeftRight( true, false, 58, 410 )
					FocusBarB:setTopBottom( true, false, 26, 29 )
					FocusBarB:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusBarB, event )
					else
						FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, false, 58, 410 )
				self.FocusBarB:setTopBottom( true, false, 40, 44 )
				self.FocusBarB:setAlpha( 1 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					if not event.interrupted then
						FocusBarT:beginAnimation( "keyframe", 109, true, true, CoD.TweenType.Linear )
					end
					FocusBarT:setLeftRight( true, false, 58, 410 )
					FocusBarT:setTopBottom( true, false, -4, 0 )
					FocusBarT:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusBarT, event )
					else
						FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, false, 58, 410 )
				self.FocusBarT:setTopBottom( true, false, -4, 0 )
				self.FocusBarT:setAlpha( 1 )
				FocusBarTFrame2( FocusBarT, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return not IsCurrentMenu( menu, "ModeSelect" )
			end
		},
		{
			stateName = "IsSelf",
			condition = function ( menu, element, event )
				return IsSelfItem( element, controller )
			end
		},
		{
			stateName = "IsFriend",
			condition = function ( menu, element, event )
				return IsFriendItem( element )
			end
		},
		{
			stateName = "IsGroupMember",
			condition = function ( menu, element, event )
				return IsGroupsItem( element )
			end
		},
		{
			stateName = "IsOtherPartyMember",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self.close = function ( self )
		self.LobbyLeaderIcon:close()
		self.PartyMemberIconNew:close()
		self.Panel:close()
		self.LobbyMemberBacking:close()
		self.LobbyMemberTeamColor:close()
		self.FocusBarB:close()
		self.FocusBarT:close()
		self.IconControllerContainer:close()
		self.IconJoinable:close()
		self.score:close()
		self.clanTag:close()
		self.gamertag:close()
		CoD.LobbyMemberQuickJoin.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

