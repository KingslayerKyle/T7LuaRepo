require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_MemberBlurPanelContainer" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.IconJoinable" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyLeaderIcon" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberGamertag" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberPartyMemberIconNew" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberTeamColor" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.QuickJoinRank" )

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
	self:setLeftRight( 0, 0, 0, 735 )
	self:setTopBottom( 0, 0, 0, 40 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local LobbyLeaderIcon = CoD.LobbyLeaderIcon.new( menu, controller )
	LobbyLeaderIcon:setLeftRight( 0, 0, 616, 652 )
	LobbyLeaderIcon:setTopBottom( 0, 0, 1, 39 )
	LobbyLeaderIcon:linkToElementModel( self, "isMemberLeader", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LobbyLeaderIcon.Leader:setAlpha( modelValue )
		end
	end )
	self:addElement( LobbyLeaderIcon )
	self.LobbyLeaderIcon = LobbyLeaderIcon
	
	local PartyMemberIconNew = CoD.LobbyMemberPartyMemberIconNew.new( menu, controller )
	PartyMemberIconNew:setLeftRight( 0, 0, 618.5, 633.5 )
	PartyMemberIconNew:setTopBottom( 0, 0, 0, 38 )
	self:addElement( PartyMemberIconNew )
	self.PartyMemberIconNew = PartyMemberIconNew
	
	local score = LUI.UIText.new()
	score:setLeftRight( 0, 0, 529, 622 )
	score:setTopBottom( 0, 0, 7, 37 )
	score:setAlpha( 0 )
	score:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	score:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	score:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( score )
	self.score = score
	
	local FEMemberBlurPanelContainer0 = CoD.FE_MemberBlurPanelContainer.new( menu, controller )
	FEMemberBlurPanelContainer0:setLeftRight( 0, 1, 90, -122 )
	FEMemberBlurPanelContainer0:setTopBottom( 0.5, 0.5, -21, 20 )
	self:addElement( FEMemberBlurPanelContainer0 )
	self.FEMemberBlurPanelContainer0 = FEMemberBlurPanelContainer0
	
	local VSpanel = CoD.FE_ButtonPanel.new( menu, controller )
	VSpanel:setLeftRight( 0, 1, 90, -122 )
	VSpanel:setTopBottom( 0.5, 0.5, -21, 21 )
	VSpanel:setRGB( 0.5, 0.5, 0.5 )
	VSpanel:setAlpha( 0.2 )
	self:addElement( VSpanel )
	self.VSpanel = VSpanel
	
	local LobbyMemberTeamColor = CoD.LobbyMemberTeamColor.new( menu, controller )
	LobbyMemberTeamColor:setLeftRight( 0, 0, 90, 612 )
	LobbyMemberTeamColor:setTopBottom( 0, 0, -1, 41 )
	LobbyMemberTeamColor:linkToElementModel( self, nil, false, function ( model )
		LobbyMemberTeamColor:setModel( model, controller )
	end )
	self:addElement( LobbyMemberTeamColor )
	self.LobbyMemberTeamColor = LobbyMemberTeamColor
	
	local LobbyMemberBacking = CoD.FE_ButtonPanel.new( menu, controller )
	LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
	LobbyMemberBacking:setTopBottom( 0, 0, -1, 43 )
	LobbyMemberBacking:setRGB( 0.22, 0.22, 0.22 )
	LobbyMemberBacking:setAlpha( 0 )
	self:addElement( LobbyMemberBacking )
	self.LobbyMemberBacking = LobbyMemberBacking
	
	local clanTag = LUI.UITightText.new()
	clanTag:setLeftRight( 0, 0, 164, 266 )
	clanTag:setTopBottom( 0, 0, 4, 36 )
	clanTag:setRGB( 0.87, 0.9, 0.9 )
	clanTag:setAlpha( 0 )
	clanTag:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( clanTag )
	self.clanTag = clanTag
	
	local PrimaryGroup = LUI.UIText.new()
	PrimaryGroup:setLeftRight( 0, 0, 135, 443 )
	PrimaryGroup:setTopBottom( 0, 0, 33, 57 )
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
	addControllerText:setLeftRight( 0, 0, 86, 686 )
	addControllerText:setTopBottom( 0, 0, 3, 29 )
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
	MorePlaying:setLeftRight( 0, 0, 28, 763 )
	MorePlaying:setTopBottom( 0, 0, 3, 29 )
	MorePlaying:setRGB( 0.42, 0.52, 0.62 )
	MorePlaying:setAlpha( 0 )
	MorePlaying:setZoom( 10 )
	MorePlaying:setText( Engine.Localize( "MENU_LOBBY_MORECOUNT" ) )
	MorePlaying:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	MorePlaying:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	MorePlaying:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( MorePlaying )
	self.MorePlaying = MorePlaying
	
	local playerCountText = LUI.UIText.new()
	playerCountText:setLeftRight( 0, 0, 86, 612 )
	playerCountText:setTopBottom( 0, 0, 10, 36 )
	playerCountText:setRGB( 0.42, 0.52, 0.62 )
	playerCountText:setAlpha( 0 )
	playerCountText:setText( Engine.Localize( "MENU_LOBBY_PLAYERCOUNT" ) )
	playerCountText:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	playerCountText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	playerCountText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( playerCountText )
	self.playerCountText = playerCountText
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( 0, 0, 87, 615 )
	FocusBarB:setTopBottom( 0, 0, 39, 43 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( 0, 0, 87, 615 )
	FocusBarT:setTopBottom( 0, 0, -6, 0 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local IconJoinable = CoD.IconJoinable.new( menu, controller )
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
	IconJoinable:setLeftRight( 0, 0, 584, 620 )
	IconJoinable:setTopBottom( 0, 0, 2, 40 )
	IconJoinable:linkToElementModel( self, nil, false, function ( model )
		IconJoinable:setModel( model, controller )
	end )
	self:addElement( IconJoinable )
	self.IconJoinable = IconJoinable
	
	local rank = CoD.QuickJoinRank.new( menu, controller )
	rank:setLeftRight( 1, 1, -641.5, -566.5 )
	rank:setTopBottom( 0, 0, 1, 39 )
	rank:linkToElementModel( self, nil, false, function ( model )
		rank:setModel( model, controller )
	end )
	self:addElement( rank )
	self.rank = rank
	
	local gamertag = CoD.LobbyMemberGamertag.new( menu, controller )
	gamertag:setLeftRight( 0, 0, 173, 579 )
	gamertag:setTopBottom( 0, 0, 1, 39 )
	gamertag:setRGB( 0.87, 0.9, 0.9 )
	gamertag:linkToElementModel( self, nil, false, function ( model )
		gamertag:setModel( model, controller )
	end )
	self:addElement( gamertag )
	self.gamertag = gamertag
	
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
	self.resetProperties = function ()
		LobbyLeaderIcon:completeAnimation()
		LobbyMemberBacking:completeAnimation()
		FEMemberBlurPanelContainer0:completeAnimation()
		PrimaryGroup:completeAnimation()
		FocusBarT:completeAnimation()
		FocusBarB:completeAnimation()
		LobbyMemberTeamColor:completeAnimation()
		VSpanel:completeAnimation()
		clanTag:completeAnimation()
		LobbyLeaderIcon:setAlpha( 1 )
		LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
		LobbyMemberBacking:setTopBottom( 0, 0, -1, 43 )
		LobbyMemberBacking:setAlpha( 0 )
		LobbyMemberBacking:setZoom( 0 )
		FEMemberBlurPanelContainer0:setLeftRight( 0, 1, 90, -122 )
		FEMemberBlurPanelContainer0:setTopBottom( 0.5, 0.5, -21, 20 )
		PrimaryGroup:setLeftRight( 0, 0, 135, 443 )
		PrimaryGroup:setTopBottom( 0, 0, 33, 57 )
		PrimaryGroup:setAlpha( 0 )
		FocusBarT:setLeftRight( 0, 0, 87, 615 )
		FocusBarT:setTopBottom( 0, 0, -6, 0 )
		FocusBarT:setAlpha( 0 )
		FocusBarB:setLeftRight( 0, 0, 87, 615 )
		FocusBarB:setTopBottom( 0, 0, 39, 43 )
		FocusBarB:setAlpha( 0 )
		LobbyMemberTeamColor:setLeftRight( 0, 0, 90, 612 )
		LobbyMemberTeamColor:setTopBottom( 0, 0, -1, 41 )
		LobbyMemberTeamColor:setAlpha( 1 )
		LobbyMemberTeamColor:setZoom( 0 )
		VSpanel:setLeftRight( 0, 1, 90, -122 )
		VSpanel:setTopBottom( 0.5, 0.5, -21, 21 )
		clanTag:setRGB( 0.87, 0.9, 0.9 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				LobbyLeaderIcon:completeAnimation()
				self.LobbyLeaderIcon:setAlpha( 0 )
				self.clipFinished( LobbyLeaderIcon, {} )
				PartyMemberIconNew:completeAnimation()
				self.clipFinished( PartyMemberIconNew, {} )
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( 0, 1, 90, -122 )
				self.FEMemberBlurPanelContainer0:setTopBottom( 0, 1, -0.5, -0.5 )
				self.clipFinished( FEMemberBlurPanelContainer0, {} )
				LobbyMemberTeamColor:completeAnimation()
				self.clipFinished( LobbyMemberTeamColor, {} )
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberBacking:setTopBottom( 0, 0, -0.5, 40.5 )
				self.clipFinished( LobbyMemberBacking, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( 0, 1, 90, -122 )
				self.FEMemberBlurPanelContainer0:setTopBottom( 0.5, 0.5, -21, 40 )
				self.clipFinished( FEMemberBlurPanelContainer0, {} )
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( 0, 1, 90, -122 )
				self.VSpanel:setTopBottom( 0.5, 0.5, -21.5, 39.5 )
				self.clipFinished( VSpanel, {} )
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberTeamColor:setTopBottom( 0, 0, -0.5, 60.5 )
				self.clipFinished( LobbyMemberTeamColor, {} )
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberBacking:setTopBottom( 0, 0, -0.5, 60.5 )
				self.clipFinished( LobbyMemberBacking, {} )
				PrimaryGroup:completeAnimation()
				self.PrimaryGroup:setAlpha( 1 )
				self.clipFinished( PrimaryGroup, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( 0, 0, 87, 615 )
				self.FocusBarB:setTopBottom( 0, 0, 60, 66 )
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				local FEMemberBlurPanelContainer0Frame2 = function ( FEMemberBlurPanelContainer0, event )
					if not event.interrupted then
						FEMemberBlurPanelContainer0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FEMemberBlurPanelContainer0:setLeftRight( 0, 1, 90, -122 )
					FEMemberBlurPanelContainer0:setTopBottom( 0, 1, -0.5, 19.5 )
					if event.interrupted then
						self.clipFinished( FEMemberBlurPanelContainer0, event )
					else
						FEMemberBlurPanelContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( 0, 1, 90, -122 )
				self.FEMemberBlurPanelContainer0:setTopBottom( 0, 1, -0.5, -0.5 )
				FEMemberBlurPanelContainer0Frame2( FEMemberBlurPanelContainer0, {} )
				local LobbyMemberTeamColorFrame2 = function ( LobbyMemberTeamColor, event )
					if not event.interrupted then
						LobbyMemberTeamColor:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					LobbyMemberTeamColor:setLeftRight( 0, 0, 90, 612 )
					LobbyMemberTeamColor:setTopBottom( 0, 0, -0.5, 60.5 )
					if event.interrupted then
						self.clipFinished( LobbyMemberTeamColor, event )
					else
						LobbyMemberTeamColor:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberTeamColor:setTopBottom( 0, 0, -1, 41 )
				LobbyMemberTeamColorFrame2( LobbyMemberTeamColor, {} )
				local LobbyMemberBackingFrame2 = function ( LobbyMemberBacking, event )
					if not event.interrupted then
						LobbyMemberBacking:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
					LobbyMemberBacking:setTopBottom( 0, 0, -0.5, 60.5 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking, event )
					else
						LobbyMemberBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberBacking:setTopBottom( 0, 0, -0.5, 40.5 )
				LobbyMemberBackingFrame2( LobbyMemberBacking, {} )
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
					FocusBarB:setLeftRight( 0, 0, 87, 615 )
					FocusBarB:setTopBottom( 0, 0, 60, 66 )
					FocusBarB:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBarB, event )
					else
						FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( 0, 0, 87, 615 )
				self.FocusBarB:setTopBottom( 0, 0, 18, 22 )
				self.FocusBarB:setAlpha( 0 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					if not event.interrupted then
						FocusBarT:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					FocusBarT:setLeftRight( 0, 0, 87, 615 )
					FocusBarT:setTopBottom( 0, 0, -6, 0 )
					FocusBarT:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBarT, event )
					else
						FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( 0, 0, 89, 615 )
				self.FocusBarT:setTopBottom( 0, 0, 18, 24 )
				self.FocusBarT:setAlpha( 0 )
				FocusBarTFrame2( FocusBarT, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				local FEMemberBlurPanelContainer0Frame2 = function ( FEMemberBlurPanelContainer0, event )
					if not event.interrupted then
						FEMemberBlurPanelContainer0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
					end
					FEMemberBlurPanelContainer0:setLeftRight( 0, 1, 90, -122 )
					FEMemberBlurPanelContainer0:setTopBottom( 0, 1, -0.5, -0.5 )
					if event.interrupted then
						self.clipFinished( FEMemberBlurPanelContainer0, event )
					else
						FEMemberBlurPanelContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( 0, 1, 90, -122 )
				self.FEMemberBlurPanelContainer0:setTopBottom( 0, 1, -0.5, 19.5 )
				FEMemberBlurPanelContainer0Frame2( FEMemberBlurPanelContainer0, {} )
				local LobbyMemberTeamColorFrame2 = function ( LobbyMemberTeamColor, event )
					if not event.interrupted then
						LobbyMemberTeamColor:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberTeamColor:setLeftRight( 0, 0, 90, 612 )
					LobbyMemberTeamColor:setTopBottom( 0, 0, -1, 41 )
					LobbyMemberTeamColor:setAlpha( 1 )
					LobbyMemberTeamColor:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberTeamColor, event )
					else
						LobbyMemberTeamColor:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberTeamColor:setTopBottom( 0, 0, -0.5, 60.5 )
				self.LobbyMemberTeamColor:setAlpha( 1 )
				self.LobbyMemberTeamColor:setZoom( 0 )
				LobbyMemberTeamColorFrame2( LobbyMemberTeamColor, {} )
				local LobbyMemberBackingFrame2 = function ( LobbyMemberBacking, event )
					if not event.interrupted then
						LobbyMemberBacking:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
					LobbyMemberBacking:setTopBottom( 0, 0, -0.5, 40.5 )
					LobbyMemberBacking:setAlpha( 0 )
					LobbyMemberBacking:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking, event )
					else
						LobbyMemberBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberBacking:setTopBottom( 0, 0, -0.5, 60.5 )
				self.LobbyMemberBacking:setAlpha( 0 )
				self.LobbyMemberBacking:setZoom( 0 )
				LobbyMemberBackingFrame2( LobbyMemberBacking, {} )
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
					FocusBarB:setLeftRight( 0, 0, 87, 615 )
					FocusBarB:setTopBottom( 0, 0, 39, 43 )
					FocusBarB:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusBarB, event )
					else
						FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( 0, 0, 87, 615 )
				self.FocusBarB:setTopBottom( 0, 0, 60, 66 )
				self.FocusBarB:setAlpha( 1 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					if not event.interrupted then
						FocusBarT:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
					end
					FocusBarT:setLeftRight( 0, 0, 87, 615 )
					FocusBarT:setTopBottom( 0, 0, -6, 0 )
					FocusBarT:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusBarT, event )
					else
						FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( 0, 0, 87, 615 )
				self.FocusBarT:setTopBottom( 0, 0, -6, 0 )
				self.FocusBarT:setAlpha( 1 )
				FocusBarTFrame2( FocusBarT, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		IsSelf = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				PartyMemberIconNew:completeAnimation()
				self.clipFinished( PartyMemberIconNew, {} )
				LobbyMemberTeamColor:completeAnimation()
				self.clipFinished( LobbyMemberTeamColor, {} )
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberBacking:setTopBottom( 0, 0, -0.5, 40.5 )
				self.clipFinished( LobbyMemberBacking, {} )
				clanTag:completeAnimation()
				self.clanTag:setRGB( 0.96, 1, 0.33 )
				self.clipFinished( clanTag, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( 0, 1, 90, -122 )
				self.FEMemberBlurPanelContainer0:setTopBottom( 0, 1, -8.5, 7.5 )
				self.clipFinished( FEMemberBlurPanelContainer0, {} )
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( 0, 1, 90, -122 )
				self.VSpanel:setTopBottom( 0.5, 0.5, -28, 28 )
				self.clipFinished( VSpanel, {} )
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberTeamColor:setTopBottom( 0, 0, -8, 48 )
				self.clipFinished( LobbyMemberTeamColor, {} )
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberBacking:setTopBottom( 0, 0, -8, 48 )
				self.clipFinished( LobbyMemberBacking, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( 0, 0, 87, 615 )
				self.FocusBarB:setTopBottom( 0, 0, 43, 49 )
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( 0, 0, 87, 615 )
				self.FocusBarT:setTopBottom( 0, 0, -9, -3 )
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				local FEMemberBlurPanelContainer0Frame2 = function ( FEMemberBlurPanelContainer0, event )
					if not event.interrupted then
						FEMemberBlurPanelContainer0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FEMemberBlurPanelContainer0:setLeftRight( 0, 1, 90, -122 )
					FEMemberBlurPanelContainer0:setTopBottom( 0, 1, -8.5, 7.5 )
					if event.interrupted then
						self.clipFinished( FEMemberBlurPanelContainer0, event )
					else
						FEMemberBlurPanelContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( 0, 1, 90, -122 )
				self.FEMemberBlurPanelContainer0:setTopBottom( 0, 1, -0.5, -0.5 )
				FEMemberBlurPanelContainer0Frame2( FEMemberBlurPanelContainer0, {} )
				local VSpanelFrame2 = function ( VSpanel, event )
					if not event.interrupted then
						VSpanel:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					VSpanel:setLeftRight( 0, 1, 90, -122 )
					VSpanel:setTopBottom( 0.5, 0.5, -28, 28 )
					if event.interrupted then
						self.clipFinished( VSpanel, event )
					else
						VSpanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( 0, 1, 90, -122 )
				self.VSpanel:setTopBottom( 0.5, 0.5, -21, 21 )
				VSpanelFrame2( VSpanel, {} )
				local LobbyMemberTeamColorFrame2 = function ( LobbyMemberTeamColor, event )
					if not event.interrupted then
						LobbyMemberTeamColor:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					LobbyMemberTeamColor:setLeftRight( 0, 0, 90, 612 )
					LobbyMemberTeamColor:setTopBottom( 0, 0, -8, 48 )
					if event.interrupted then
						self.clipFinished( LobbyMemberTeamColor, event )
					else
						LobbyMemberTeamColor:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberTeamColor:setTopBottom( 0, 0, -1, 41 )
				LobbyMemberTeamColorFrame2( LobbyMemberTeamColor, {} )
				local LobbyMemberBackingFrame2 = function ( LobbyMemberBacking, event )
					if not event.interrupted then
						LobbyMemberBacking:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
					LobbyMemberBacking:setTopBottom( 0, 0, -8, 48 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking, event )
					else
						LobbyMemberBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberBacking:setTopBottom( 0, 0, -0.5, 40.5 )
				LobbyMemberBackingFrame2( LobbyMemberBacking, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					if not event.interrupted then
						FocusBarB:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					FocusBarB:setLeftRight( 0, 0, 87, 615 )
					FocusBarB:setTopBottom( 0, 0, 43, 49 )
					FocusBarB:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBarB, event )
					else
						FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( 0, 0, 87, 615 )
				self.FocusBarB:setTopBottom( 0, 0, 18, 22 )
				self.FocusBarB:setAlpha( 0 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					if not event.interrupted then
						FocusBarT:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					FocusBarT:setLeftRight( 0, 0, 87, 615 )
					FocusBarT:setTopBottom( 0, 0, -9, -3 )
					FocusBarT:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBarT, event )
					else
						FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( 0, 0, 89, 615 )
				self.FocusBarT:setTopBottom( 0, 0, 18, 24 )
				self.FocusBarT:setAlpha( 0 )
				FocusBarTFrame2( FocusBarT, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				local FEMemberBlurPanelContainer0Frame2 = function ( FEMemberBlurPanelContainer0, event )
					if not event.interrupted then
						FEMemberBlurPanelContainer0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FEMemberBlurPanelContainer0:setLeftRight( 0, 1, 90, -122 )
					FEMemberBlurPanelContainer0:setTopBottom( 0.5, 0.5, -21, 20 )
					if event.interrupted then
						self.clipFinished( FEMemberBlurPanelContainer0, event )
					else
						FEMemberBlurPanelContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( 0, 1, 90, -122 )
				self.FEMemberBlurPanelContainer0:setTopBottom( 0.5, 0.5, -28.5, 27.5 )
				FEMemberBlurPanelContainer0Frame2( FEMemberBlurPanelContainer0, {} )
				local VSpanelFrame2 = function ( VSpanel, event )
					if not event.interrupted then
						VSpanel:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					VSpanel:setLeftRight( 0, 1, 90, -122 )
					VSpanel:setTopBottom( 0.5, 0.5, -21, 21 )
					if event.interrupted then
						self.clipFinished( VSpanel, event )
					else
						VSpanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( 0, 1, 90, -122 )
				self.VSpanel:setTopBottom( 0.5, 0.5, -28, 28 )
				VSpanelFrame2( VSpanel, {} )
				local LobbyMemberTeamColorFrame2 = function ( LobbyMemberTeamColor, event )
					if not event.interrupted then
						LobbyMemberTeamColor:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberTeamColor:setLeftRight( 0, 0, 90, 612 )
					LobbyMemberTeamColor:setTopBottom( 0, 0, -1, 41 )
					LobbyMemberTeamColor:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberTeamColor, event )
					else
						LobbyMemberTeamColor:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberTeamColor:setTopBottom( 0, 0, -8, 48 )
				self.LobbyMemberTeamColor:setZoom( 0 )
				LobbyMemberTeamColorFrame2( LobbyMemberTeamColor, {} )
				local LobbyMemberBackingFrame2 = function ( LobbyMemberBacking, event )
					if not event.interrupted then
						LobbyMemberBacking:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
					LobbyMemberBacking:setTopBottom( 0, 0, -0.5, 40.5 )
					LobbyMemberBacking:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking, event )
					else
						LobbyMemberBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberBacking:setTopBottom( 0, 0, -8, 48 )
				self.LobbyMemberBacking:setZoom( 0 )
				LobbyMemberBackingFrame2( LobbyMemberBacking, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					if not event.interrupted then
						FocusBarB:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FocusBarB:setLeftRight( 0, 0, 87, 615 )
					FocusBarB:setTopBottom( 0, 0, 18, 22 )
					FocusBarB:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusBarB, event )
					else
						FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( 0, 0, 87, 615 )
				self.FocusBarB:setTopBottom( 0, 0, 43, 49 )
				self.FocusBarB:setAlpha( 1 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					if not event.interrupted then
						FocusBarT:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FocusBarT:setLeftRight( 0, 0, 89, 615 )
					FocusBarT:setTopBottom( 0, 0, 18, 24 )
					FocusBarT:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusBarT, event )
					else
						FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( 0, 0, 87, 615 )
				self.FocusBarT:setTopBottom( 0, 0, -9, -3 )
				self.FocusBarT:setAlpha( 1 )
				FocusBarTFrame2( FocusBarT, {} )
			end
		},
		IsFriend = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				LobbyLeaderIcon:completeAnimation()
				self.LobbyLeaderIcon:setAlpha( 0 )
				self.clipFinished( LobbyLeaderIcon, {} )
				PartyMemberIconNew:completeAnimation()
				self.clipFinished( PartyMemberIconNew, {} )
				LobbyMemberTeamColor:completeAnimation()
				self.clipFinished( LobbyMemberTeamColor, {} )
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberBacking:setTopBottom( 0, 0, -0.5, 40.5 )
				self.LobbyMemberBacking:setAlpha( 0.3 )
				self.clipFinished( LobbyMemberBacking, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( 0, 1, 90, -122 )
				self.FEMemberBlurPanelContainer0:setTopBottom( 0, 1, -8.5, 7.5 )
				self.clipFinished( FEMemberBlurPanelContainer0, {} )
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( 0, 1, 90, -122 )
				self.VSpanel:setTopBottom( 0.5, 0.5, -28, 28 )
				self.clipFinished( VSpanel, {} )
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberTeamColor:setTopBottom( 0, 0, -8, 48 )
				self.clipFinished( LobbyMemberTeamColor, {} )
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberBacking:setTopBottom( 0, 0, -8, 48 )
				self.clipFinished( LobbyMemberBacking, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( 0, 0, 87, 615 )
				self.FocusBarB:setTopBottom( 0, 0, 43, 49 )
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( 0, 0, 87, 615 )
				self.FocusBarT:setTopBottom( 0, 0, -9, -3 )
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				local FEMemberBlurPanelContainer0Frame2 = function ( FEMemberBlurPanelContainer0, event )
					if not event.interrupted then
						FEMemberBlurPanelContainer0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FEMemberBlurPanelContainer0:setLeftRight( 0, 1, 90, -122 )
					FEMemberBlurPanelContainer0:setTopBottom( 0, 1, -8.5, 7.5 )
					if event.interrupted then
						self.clipFinished( FEMemberBlurPanelContainer0, event )
					else
						FEMemberBlurPanelContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( 0, 1, 90, -122 )
				self.FEMemberBlurPanelContainer0:setTopBottom( 0, 1, -1.5, 0.5 )
				FEMemberBlurPanelContainer0Frame2( FEMemberBlurPanelContainer0, {} )
				local VSpanelFrame2 = function ( VSpanel, event )
					if not event.interrupted then
						VSpanel:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					VSpanel:setLeftRight( 0, 1, 90, -122 )
					VSpanel:setTopBottom( 0.5, 0.5, -28, 28 )
					if event.interrupted then
						self.clipFinished( VSpanel, event )
					else
						VSpanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( 0, 1, 90, -122 )
				self.VSpanel:setTopBottom( 0.5, 0.5, -21, 21 )
				VSpanelFrame2( VSpanel, {} )
				local LobbyMemberTeamColorFrame2 = function ( LobbyMemberTeamColor, event )
					if not event.interrupted then
						LobbyMemberTeamColor:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					LobbyMemberTeamColor:setLeftRight( 0, 0, 90, 612 )
					LobbyMemberTeamColor:setTopBottom( 0, 0, -8, 48 )
					if event.interrupted then
						self.clipFinished( LobbyMemberTeamColor, event )
					else
						LobbyMemberTeamColor:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberTeamColor:setTopBottom( 0, 0, -1, 41 )
				LobbyMemberTeamColorFrame2( LobbyMemberTeamColor, {} )
				local LobbyMemberBackingFrame2 = function ( LobbyMemberBacking, event )
					if not event.interrupted then
						LobbyMemberBacking:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
					LobbyMemberBacking:setTopBottom( 0, 0, -8, 48 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking, event )
					else
						LobbyMemberBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberBacking:setTopBottom( 0, 0, -0.5, 40.5 )
				LobbyMemberBackingFrame2( LobbyMemberBacking, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					if not event.interrupted then
						FocusBarB:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					FocusBarB:setLeftRight( 0, 0, 87, 615 )
					FocusBarB:setTopBottom( 0, 0, 43, 49 )
					FocusBarB:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBarB, event )
					else
						FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( 0, 0, 87, 615 )
				self.FocusBarB:setTopBottom( 0, 0, 18, 22 )
				self.FocusBarB:setAlpha( 0 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					if not event.interrupted then
						FocusBarT:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					FocusBarT:setLeftRight( 0, 0, 87, 615 )
					FocusBarT:setTopBottom( 0, 0, -9, -3 )
					FocusBarT:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBarT, event )
					else
						FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( 0, 0, 89, 615 )
				self.FocusBarT:setTopBottom( 0, 0, 18, 24 )
				self.FocusBarT:setAlpha( 0 )
				FocusBarTFrame2( FocusBarT, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				local FEMemberBlurPanelContainer0Frame2 = function ( FEMemberBlurPanelContainer0, event )
					if not event.interrupted then
						FEMemberBlurPanelContainer0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FEMemberBlurPanelContainer0:setLeftRight( 0, 1, 90, -122 )
					FEMemberBlurPanelContainer0:setTopBottom( 0, 1, -1.5, 0.5 )
					if event.interrupted then
						self.clipFinished( FEMemberBlurPanelContainer0, event )
					else
						FEMemberBlurPanelContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( 0, 1, 90, -122 )
				self.FEMemberBlurPanelContainer0:setTopBottom( 0, 1, -8.5, 7.5 )
				FEMemberBlurPanelContainer0Frame2( FEMemberBlurPanelContainer0, {} )
				local VSpanelFrame2 = function ( VSpanel, event )
					if not event.interrupted then
						VSpanel:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					VSpanel:setLeftRight( 0, 1, 90, -122 )
					VSpanel:setTopBottom( 0.5, 0.5, -21, 21 )
					if event.interrupted then
						self.clipFinished( VSpanel, event )
					else
						VSpanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( 0, 1, 90, -122 )
				self.VSpanel:setTopBottom( 0.5, 0.5, -28, 28 )
				VSpanelFrame2( VSpanel, {} )
				local LobbyMemberTeamColorFrame2 = function ( LobbyMemberTeamColor, event )
					if not event.interrupted then
						LobbyMemberTeamColor:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberTeamColor:setLeftRight( 0, 0, 90, 612 )
					LobbyMemberTeamColor:setTopBottom( 0, 0, -1, 41 )
					LobbyMemberTeamColor:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberTeamColor, event )
					else
						LobbyMemberTeamColor:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberTeamColor:setTopBottom( 0, 0, -8, 48 )
				self.LobbyMemberTeamColor:setZoom( 0 )
				LobbyMemberTeamColorFrame2( LobbyMemberTeamColor, {} )
				local LobbyMemberBackingFrame2 = function ( LobbyMemberBacking, event )
					if not event.interrupted then
						LobbyMemberBacking:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
					LobbyMemberBacking:setTopBottom( 0, 0, -0.5, 40.5 )
					LobbyMemberBacking:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking, event )
					else
						LobbyMemberBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberBacking:setTopBottom( 0, 0, -8, 48 )
				self.LobbyMemberBacking:setZoom( 0 )
				LobbyMemberBackingFrame2( LobbyMemberBacking, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					if not event.interrupted then
						FocusBarB:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FocusBarB:setLeftRight( 0, 0, 87, 615 )
					FocusBarB:setTopBottom( 0, 0, 18, 22 )
					FocusBarB:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusBarB, event )
					else
						FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( 0, 0, 87, 615 )
				self.FocusBarB:setTopBottom( 0, 0, 43, 49 )
				self.FocusBarB:setAlpha( 1 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					if not event.interrupted then
						FocusBarT:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FocusBarT:setLeftRight( 0, 0, 89, 615 )
					FocusBarT:setTopBottom( 0, 0, 18, 24 )
					FocusBarT:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusBarT, event )
					else
						FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( 0, 0, 87, 615 )
				self.FocusBarT:setTopBottom( 0, 0, -9, -3 )
				self.FocusBarT:setAlpha( 1 )
				FocusBarTFrame2( FocusBarT, {} )
			end
		},
		IsGroupMember = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				LobbyLeaderIcon:completeAnimation()
				self.LobbyLeaderIcon:setAlpha( 0 )
				self.clipFinished( LobbyLeaderIcon, {} )
				PartyMemberIconNew:completeAnimation()
				self.clipFinished( PartyMemberIconNew, {} )
				LobbyMemberTeamColor:completeAnimation()
				self.clipFinished( LobbyMemberTeamColor, {} )
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberBacking:setTopBottom( 0, 0, -0.5, 40.5 )
				self.LobbyMemberBacking:setAlpha( 0.05 )
				self.clipFinished( LobbyMemberBacking, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( 0, 1, 90, -122 )
				self.FEMemberBlurPanelContainer0:setTopBottom( 0, 1, -11.5, 10.5 )
				self.clipFinished( FEMemberBlurPanelContainer0, {} )
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( 0, 1, 90, -122 )
				self.VSpanel:setTopBottom( 0.5, 0.5, -31.5, 31.5 )
				self.clipFinished( VSpanel, {} )
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberTeamColor:setTopBottom( 0, 0, -12, 52 )
				self.clipFinished( LobbyMemberTeamColor, {} )
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberBacking:setTopBottom( 0, 0, -12, 52 )
				self.clipFinished( LobbyMemberBacking, {} )
				PrimaryGroup:completeAnimation()
				self.PrimaryGroup:setLeftRight( 0, 0, 135, 443 )
				self.PrimaryGroup:setTopBottom( 0, 0, 24, 48 )
				self.PrimaryGroup:setAlpha( 1 )
				self.clipFinished( PrimaryGroup, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( 0, 0, 87, 615 )
				self.FocusBarB:setTopBottom( 0, 0, 50, 54 )
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( 0, 0, 87, 615 )
				self.FocusBarT:setTopBottom( 0, 0, -13, -7 )
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				local FEMemberBlurPanelContainer0Frame2 = function ( FEMemberBlurPanelContainer0, event )
					if not event.interrupted then
						FEMemberBlurPanelContainer0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FEMemberBlurPanelContainer0:setLeftRight( 0, 1, 90, -122 )
					FEMemberBlurPanelContainer0:setTopBottom( 0, 1, -12.5, 11.5 )
					if event.interrupted then
						self.clipFinished( FEMemberBlurPanelContainer0, event )
					else
						FEMemberBlurPanelContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( 0, 1, 90, -122 )
				self.FEMemberBlurPanelContainer0:setTopBottom( 0, 1, -0.5, -0.5 )
				FEMemberBlurPanelContainer0Frame2( FEMemberBlurPanelContainer0, {} )
				local VSpanelFrame2 = function ( VSpanel, event )
					if not event.interrupted then
						VSpanel:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					VSpanel:setLeftRight( 0, 1, 90, -122 )
					VSpanel:setTopBottom( 0.5, 0.5, -31.5, 31.5 )
					if event.interrupted then
						self.clipFinished( VSpanel, event )
					else
						VSpanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( 0, 1, 90, -122 )
				self.VSpanel:setTopBottom( 0.5, 0.5, -21, 21 )
				VSpanelFrame2( VSpanel, {} )
				local LobbyMemberTeamColorFrame2 = function ( LobbyMemberTeamColor, event )
					if not event.interrupted then
						LobbyMemberTeamColor:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberTeamColor:setLeftRight( 0, 0, 90, 612 )
					LobbyMemberTeamColor:setTopBottom( 0, 0, -12, 52 )
					if event.interrupted then
						self.clipFinished( LobbyMemberTeamColor, event )
					else
						LobbyMemberTeamColor:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberTeamColor:setTopBottom( 0, 0, -1, 41 )
				LobbyMemberTeamColorFrame2( LobbyMemberTeamColor, {} )
				local LobbyMemberBackingFrame2 = function ( LobbyMemberBacking, event )
					if not event.interrupted then
						LobbyMemberBacking:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
					LobbyMemberBacking:setTopBottom( 0, 0, -12, 52 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking, event )
					else
						LobbyMemberBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberBacking:setTopBottom( 0, 0, -0.5, 40.5 )
				LobbyMemberBackingFrame2( LobbyMemberBacking, {} )
				local PrimaryGroupFrame2 = function ( PrimaryGroup, event )
					if not event.interrupted then
						PrimaryGroup:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					PrimaryGroup:setLeftRight( 0, 0, 135, 443 )
					PrimaryGroup:setTopBottom( 0, 0, 24, 48 )
					PrimaryGroup:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( PrimaryGroup, event )
					else
						PrimaryGroup:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PrimaryGroup:completeAnimation()
				self.PrimaryGroup:setLeftRight( 0, 0, 135, 443 )
				self.PrimaryGroup:setTopBottom( 0, 0, 24, 48 )
				self.PrimaryGroup:setAlpha( 0 )
				PrimaryGroupFrame2( PrimaryGroup, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					if not event.interrupted then
						FocusBarB:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FocusBarB:setLeftRight( 0, 0, 87, 615 )
					FocusBarB:setTopBottom( 0, 0, 50, 54 )
					FocusBarB:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBarB, event )
					else
						FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( 0, 0, 87, 615 )
				self.FocusBarB:setTopBottom( 0, 0, 20, 24 )
				self.FocusBarB:setAlpha( 0 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					if not event.interrupted then
						FocusBarT:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FocusBarT:setLeftRight( 0, 0, 89, 615 )
					FocusBarT:setTopBottom( 0, 0, -13, -7 )
					FocusBarT:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBarT, event )
					else
						FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( 0, 0, 89, 615 )
				self.FocusBarT:setTopBottom( 0, 0, 18, 24 )
				self.FocusBarT:setAlpha( 0 )
				FocusBarTFrame2( FocusBarT, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				local FEMemberBlurPanelContainer0Frame2 = function ( FEMemberBlurPanelContainer0, event )
					if not event.interrupted then
						FEMemberBlurPanelContainer0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FEMemberBlurPanelContainer0:setLeftRight( 0, 1, 90, -122 )
					FEMemberBlurPanelContainer0:setTopBottom( 0, 1, -0.5, -0.5 )
					if event.interrupted then
						self.clipFinished( FEMemberBlurPanelContainer0, event )
					else
						FEMemberBlurPanelContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( 0, 1, 90, -122 )
				self.FEMemberBlurPanelContainer0:setTopBottom( 0, 1, -12.5, 11.5 )
				FEMemberBlurPanelContainer0Frame2( FEMemberBlurPanelContainer0, {} )
				local VSpanelFrame2 = function ( VSpanel, event )
					if not event.interrupted then
						VSpanel:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					VSpanel:setLeftRight( 0, 1, 90, -122 )
					VSpanel:setTopBottom( 0.5, 0.5, -21, 21 )
					if event.interrupted then
						self.clipFinished( VSpanel, event )
					else
						VSpanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( 0, 1, 90, -122 )
				self.VSpanel:setTopBottom( 0.5, 0.5, -31.5, 31.5 )
				VSpanelFrame2( VSpanel, {} )
				local LobbyMemberTeamColorFrame2 = function ( LobbyMemberTeamColor, event )
					if not event.interrupted then
						LobbyMemberTeamColor:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberTeamColor:setLeftRight( 0, 0, 90, 612 )
					LobbyMemberTeamColor:setTopBottom( 0, 0, -1, 41 )
					if event.interrupted then
						self.clipFinished( LobbyMemberTeamColor, event )
					else
						LobbyMemberTeamColor:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberTeamColor:setTopBottom( 0, 0, -12, 52 )
				LobbyMemberTeamColorFrame2( LobbyMemberTeamColor, {} )
				local LobbyMemberBackingFrame2 = function ( LobbyMemberBacking, event )
					if not event.interrupted then
						LobbyMemberBacking:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
					LobbyMemberBacking:setTopBottom( 0, 0, -0.5, 40.5 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking, event )
					else
						LobbyMemberBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberBacking:setTopBottom( 0, 0, -12, 52 )
				LobbyMemberBackingFrame2( LobbyMemberBacking, {} )
				local PrimaryGroupFrame2 = function ( PrimaryGroup, event )
					if not event.interrupted then
						PrimaryGroup:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					PrimaryGroup:setLeftRight( 0, 0, 135, 443 )
					PrimaryGroup:setTopBottom( 0, 0, 24, 48 )
					PrimaryGroup:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PrimaryGroup, event )
					else
						PrimaryGroup:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PrimaryGroup:completeAnimation()
				self.PrimaryGroup:setLeftRight( 0, 0, 135, 443 )
				self.PrimaryGroup:setTopBottom( 0, 0, 24, 48 )
				self.PrimaryGroup:setAlpha( 1 )
				PrimaryGroupFrame2( PrimaryGroup, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					if not event.interrupted then
						FocusBarB:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FocusBarB:setLeftRight( 0, 0, 87, 615 )
					FocusBarB:setTopBottom( 0, 0, 20, 24 )
					FocusBarB:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusBarB, event )
					else
						FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( 0, 0, 87, 615 )
				self.FocusBarB:setTopBottom( 0, 0, 50, 54 )
				self.FocusBarB:setAlpha( 1 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					if not event.interrupted then
						FocusBarT:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FocusBarT:setLeftRight( 0, 0, 89, 615 )
					FocusBarT:setTopBottom( 0, 0, 18, 24 )
					FocusBarT:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusBarT, event )
					else
						FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( 0, 0, 89, 615 )
				self.FocusBarT:setTopBottom( 0, 0, -13, -7 )
				self.FocusBarT:setAlpha( 1 )
				FocusBarTFrame2( FocusBarT, {} )
			end
		},
		IsOtherPartyMember = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				PartyMemberIconNew:completeAnimation()
				self.clipFinished( PartyMemberIconNew, {} )
				LobbyMemberTeamColor:completeAnimation()
				self.clipFinished( LobbyMemberTeamColor, {} )
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberBacking:setTopBottom( 0, 0, -0.5, 40.5 )
				self.clipFinished( LobbyMemberBacking, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( 0, 1, 90, -122 )
				self.FEMemberBlurPanelContainer0:setTopBottom( 0.5, 0.5, -27.5, 26.5 )
				self.clipFinished( FEMemberBlurPanelContainer0, {} )
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( 0, 1, 90, -122 )
				self.VSpanel:setTopBottom( 0.5, 0.5, -27, 27 )
				self.clipFinished( VSpanel, {} )
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberTeamColor:setTopBottom( 0, 0, -6, 46 )
				self.clipFinished( LobbyMemberTeamColor, {} )
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberBacking:setTopBottom( 0, 0, -6, 46 )
				self.clipFinished( LobbyMemberBacking, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( 0, 0, 87, 615 )
				self.FocusBarB:setTopBottom( 0, 0, 43, 49 )
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( 0, 0, 87, 615 )
				self.FocusBarT:setTopBottom( 0, 0, -9, -3 )
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				local FEMemberBlurPanelContainer0Frame2 = function ( FEMemberBlurPanelContainer0, event )
					if not event.interrupted then
						FEMemberBlurPanelContainer0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FEMemberBlurPanelContainer0:setLeftRight( 0, 1, 90, -122 )
					FEMemberBlurPanelContainer0:setTopBottom( 0, 1, -8.5, 7.5 )
					if event.interrupted then
						self.clipFinished( FEMemberBlurPanelContainer0, event )
					else
						FEMemberBlurPanelContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( 0, 1, 90, -122 )
				self.FEMemberBlurPanelContainer0:setTopBottom( 0, 1, -1.5, 0.5 )
				FEMemberBlurPanelContainer0Frame2( FEMemberBlurPanelContainer0, {} )
				local VSpanelFrame2 = function ( VSpanel, event )
					if not event.interrupted then
						VSpanel:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					VSpanel:setLeftRight( 0, 1, 90, -122 )
					VSpanel:setTopBottom( 0.5, 0.5, -27, 27 )
					if event.interrupted then
						self.clipFinished( VSpanel, event )
					else
						VSpanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( 0, 1, 90, -122 )
				self.VSpanel:setTopBottom( 0.5, 0.5, -20.5, 20.5 )
				VSpanelFrame2( VSpanel, {} )
				local LobbyMemberTeamColorFrame2 = function ( LobbyMemberTeamColor, event )
					if not event.interrupted then
						LobbyMemberTeamColor:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					LobbyMemberTeamColor:setLeftRight( 0, 0, 90, 612 )
					LobbyMemberTeamColor:setTopBottom( 0, 0, -6, 46 )
					if event.interrupted then
						self.clipFinished( LobbyMemberTeamColor, event )
					else
						LobbyMemberTeamColor:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberTeamColor:setTopBottom( 0, 0, -1, 41 )
				LobbyMemberTeamColorFrame2( LobbyMemberTeamColor, {} )
				local LobbyMemberBackingFrame2 = function ( LobbyMemberBacking, event )
					if not event.interrupted then
						LobbyMemberBacking:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
					LobbyMemberBacking:setTopBottom( 0, 0, -0.5, 60.5 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking, event )
					else
						LobbyMemberBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberBacking:setTopBottom( 0, 0, -0.5, 40.5 )
				LobbyMemberBackingFrame2( LobbyMemberBacking, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					if not event.interrupted then
						FocusBarB:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					FocusBarB:setLeftRight( 0, 0, 87, 615 )
					FocusBarB:setTopBottom( 0, 0, 43, 49 )
					FocusBarB:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBarB, event )
					else
						FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( 0, 0, 87, 615 )
				self.FocusBarB:setTopBottom( 0, 0, 18, 22 )
				self.FocusBarB:setAlpha( 0 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					if not event.interrupted then
						FocusBarT:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					FocusBarT:setLeftRight( 0, 0, 87, 615 )
					FocusBarT:setTopBottom( 0, 0, -9, -3 )
					FocusBarT:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBarT, event )
					else
						FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( 0, 0, 89, 615 )
				self.FocusBarT:setTopBottom( 0, 0, 18, 24 )
				self.FocusBarT:setAlpha( 0 )
				FocusBarTFrame2( FocusBarT, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				local FEMemberBlurPanelContainer0Frame2 = function ( FEMemberBlurPanelContainer0, event )
					if not event.interrupted then
						FEMemberBlurPanelContainer0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FEMemberBlurPanelContainer0:setLeftRight( 0, 1, 90, -122 )
					FEMemberBlurPanelContainer0:setTopBottom( 0, 1, -1.5, 0.5 )
					if event.interrupted then
						self.clipFinished( FEMemberBlurPanelContainer0, event )
					else
						FEMemberBlurPanelContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( 0, 1, 90, -122 )
				self.FEMemberBlurPanelContainer0:setTopBottom( 0, 1, -8.5, 7.5 )
				FEMemberBlurPanelContainer0Frame2( FEMemberBlurPanelContainer0, {} )
				local VSpanelFrame2 = function ( VSpanel, event )
					if not event.interrupted then
						VSpanel:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					VSpanel:setLeftRight( 0, 1, 90, -122 )
					VSpanel:setTopBottom( 0.5, 0.5, -20.5, 20.5 )
					if event.interrupted then
						self.clipFinished( VSpanel, event )
					else
						VSpanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( 0, 1, 90, -122 )
				self.VSpanel:setTopBottom( 0.5, 0.5, -27, 27 )
				VSpanelFrame2( VSpanel, {} )
				local LobbyMemberTeamColorFrame2 = function ( LobbyMemberTeamColor, event )
					if not event.interrupted then
						LobbyMemberTeamColor:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberTeamColor:setLeftRight( 0, 0, 90, 612 )
					LobbyMemberTeamColor:setTopBottom( 0, 0, -1, 41 )
					LobbyMemberTeamColor:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberTeamColor, event )
					else
						LobbyMemberTeamColor:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberTeamColor:setTopBottom( 0, 0, -6, 46 )
				self.LobbyMemberTeamColor:setZoom( 0 )
				LobbyMemberTeamColorFrame2( LobbyMemberTeamColor, {} )
				local LobbyMemberBackingFrame2 = function ( LobbyMemberBacking, event )
					if not event.interrupted then
						LobbyMemberBacking:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
					LobbyMemberBacking:setTopBottom( 0, 0, -0.5, 40.5 )
					LobbyMemberBacking:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking, event )
					else
						LobbyMemberBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberBacking:setTopBottom( 0, 0, -0.5, 60.5 )
				self.LobbyMemberBacking:setZoom( 0 )
				LobbyMemberBackingFrame2( LobbyMemberBacking, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					if not event.interrupted then
						FocusBarB:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FocusBarB:setLeftRight( 0, 0, 87, 615 )
					FocusBarB:setTopBottom( 0, 0, 18, 22 )
					FocusBarB:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusBarB, event )
					else
						FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( 0, 0, 87, 615 )
				self.FocusBarB:setTopBottom( 0, 0, 43, 49 )
				self.FocusBarB:setAlpha( 1 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					if not event.interrupted then
						FocusBarT:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FocusBarT:setLeftRight( 0, 0, 89, 615 )
					FocusBarT:setTopBottom( 0, 0, 18, 24 )
					FocusBarT:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusBarT, event )
					else
						FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( 0, 0, 87, 615 )
				self.FocusBarT:setTopBottom( 0, 0, -9, -3 )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LobbyLeaderIcon:close()
		self.PartyMemberIconNew:close()
		self.FEMemberBlurPanelContainer0:close()
		self.VSpanel:close()
		self.LobbyMemberTeamColor:close()
		self.LobbyMemberBacking:close()
		self.FocusBarB:close()
		self.FocusBarT:close()
		self.IconJoinable:close()
		self.rank:close()
		self.gamertag:close()
		self.score:close()
		self.clanTag:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

