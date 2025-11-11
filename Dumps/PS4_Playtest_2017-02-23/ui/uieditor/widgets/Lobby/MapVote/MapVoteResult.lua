require( "ui.uieditor.widgets.Lobby.Common.FE_MemberBlurPanelContainer" )
require( "ui.uieditor.widgets.Lobby.MapVote.MapVoteLabelLower" )

CoD.MapVoteResult = InheritFrom( LUI.UIElement )
CoD.MapVoteResult.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.MapVoteResult )
	self.id = "MapVoteResult"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 454 )
	self:setTopBottom( 0, 0, 0, 226 )
	self.anyChildUsesUpdateState = true
	
	local BlackBack = LUI.UIImage.new()
	BlackBack:setLeftRight( 0, 1, 0, 0 )
	BlackBack:setTopBottom( 0, 1, 0, -2 )
	BlackBack:setRGB( 0, 0, 0 )
	BlackBack:setAlpha( 0.2 )
	self:addElement( BlackBack )
	self.BlackBack = BlackBack
	
	local FEMemberBlurPanelContainer0 = CoD.FE_MemberBlurPanelContainer.new( menu, controller )
	FEMemberBlurPanelContainer0:setLeftRight( 0, 1, 0, -2 )
	FEMemberBlurPanelContainer0:setTopBottom( 0, 1, 0, 0 )
	FEMemberBlurPanelContainer0:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( FEMemberBlurPanelContainer0 )
	self.FEMemberBlurPanelContainer0 = FEMemberBlurPanelContainer0
	
	local MapImage = LUI.UIImage.new()
	MapImage:setLeftRight( 0, 1, 0, 0 )
	MapImage:setTopBottom( 0, 1, 0, 0 )
	MapImage:setAlpha( 0 )
	MapImage:setImage( RegisterImage( GetPostMatchMapImage( controller, "uie_img_t7_menu_mp_preview_sector" ) ) )
	self:addElement( MapImage )
	self.MapImage = MapImage
	
	local OutcomeGrey = LUI.UIText.new()
	OutcomeGrey:setLeftRight( 0, 0, 191, 447 )
	OutcomeGrey:setTopBottom( 0, 0, 59, 119 )
	OutcomeGrey:setRGB( 0.5, 0.5, 0.5 )
	OutcomeGrey:setAlpha( 0.7 )
	OutcomeGrey:setText( Engine.Localize( "MP_DEFEAT_CAPS" ) )
	OutcomeGrey:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	OutcomeGrey:setLetterSpacing( -1 )
	OutcomeGrey:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	OutcomeGrey:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( OutcomeGrey )
	self.OutcomeGrey = OutcomeGrey
	
	local OutcomeColor = LUI.UIText.new()
	OutcomeColor:setLeftRight( 0, 0, 190, 444 )
	OutcomeColor:setTopBottom( 0, 0, 59, 119 )
	OutcomeColor:setRGB( 1, 0, 0 )
	OutcomeColor:setText( Engine.Localize( "MP_DEFEAT_CAPS" ) )
	OutcomeColor:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	OutcomeColor:setLetterSpacing( -1 )
	OutcomeColor:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	OutcomeColor:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( OutcomeColor )
	self.OutcomeColor = OutcomeColor
	
	local GameModeIcon = LUI.UIImage.new()
	GameModeIcon:setLeftRight( 0, 0, 0, 190 )
	GameModeIcon:setTopBottom( 0, 0, 18, 208 )
	GameModeIcon:setImage( RegisterImage( GetPostMatchGameTypeImage( controller, "uie_t7_menu_mp_icons_gamemode_graphic_logowhite" ) ) )
	self:addElement( GameModeIcon )
	self.GameModeIcon = GameModeIcon
	
	local Score = LUI.UIText.new()
	Score:setLeftRight( 0, 1, 194, -10 )
	Score:setTopBottom( 0, 0, 106, 166 )
	Score:setText( Engine.Localize( GetPostMatchScore( controller, "115 - 200" ) ) )
	Score:setTTF( "fonts/escom.ttf" )
	Score:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	Score:setShaderVector( 0, 0.09, 0, 0, 0 )
	Score:setShaderVector( 1, 0.06, 0, 0, 0 )
	Score:setShaderVector( 2, 1, 0, 0, 0 )
	Score:setLetterSpacing( 2.5 )
	Score:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Score:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Score )
	self.Score = Score
	
	local GameModeNew = CoD.MapVoteLabelLower.new( menu, controller )
	GameModeNew:setLeftRight( 0, 0, 20, 300 )
	GameModeNew:setTopBottom( 1, 1, -39.5, -12.5 )
	GameModeNew.StartMenuIdentitySubtitleBG00:setAlpha( 0.42 )
	GameModeNew.SubTitle:setText( LocalizeToUpperString( GetPostMatchGameType( controller, "Hardpoint" ) ) )
	GameModeNew.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( GameModeNew )
	self.GameModeNew = GameModeNew
	
	self.resetProperties = function ()
		Score:completeAnimation()
		GameModeIcon:completeAnimation()
		OutcomeColor:completeAnimation()
		OutcomeGrey:completeAnimation()
		Score:setAlpha( 1 )
		GameModeIcon:setAlpha( 1 )
		OutcomeColor:setRGB( 1, 0, 0 )
		OutcomeColor:setAlpha( 1 )
		OutcomeColor:setText( Engine.Localize( "MP_DEFEAT_CAPS" ) )
		OutcomeGrey:setAlpha( 0.7 )
		OutcomeGrey:setText( Engine.Localize( "MP_DEFEAT_CAPS" ) )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				OutcomeGrey:completeAnimation()
				self.OutcomeGrey:setAlpha( 0 )
				self.clipFinished( OutcomeGrey, {} )
				OutcomeColor:completeAnimation()
				self.OutcomeColor:setAlpha( 0 )
				self.clipFinished( OutcomeColor, {} )
				GameModeIcon:completeAnimation()
				self.GameModeIcon:setAlpha( 0 )
				self.clipFinished( GameModeIcon, {} )
				Score:completeAnimation()
				self.Score:setAlpha( 0 )
				self.clipFinished( Score, {} )
			end
		},
		Victory = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				OutcomeGrey:completeAnimation()
				self.OutcomeGrey:setText( Engine.Localize( "MP_VICTORY_CAPS" ) )
				self.clipFinished( OutcomeGrey, {} )
				OutcomeColor:completeAnimation()
				self.OutcomeColor:setRGB( 0.36, 1, 0.15 )
				self.OutcomeColor:setAlpha( 0.7 )
				self.OutcomeColor:setText( Engine.Localize( "MP_VICTORY_CAPS" ) )
				self.clipFinished( OutcomeColor, {} )
			end
		},
		Defeat = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				OutcomeColor:completeAnimation()
				self.OutcomeColor:setAlpha( 0.7 )
				self.clipFinished( OutcomeColor, {} )
			end
		},
		Draw = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				OutcomeGrey:completeAnimation()
				self.OutcomeGrey:setAlpha( 0 )
				self.clipFinished( OutcomeGrey, {} )
				OutcomeColor:completeAnimation()
				self.OutcomeColor:setRGB( 0.8, 0.8, 0.8 )
				self.OutcomeColor:setText( Engine.Localize( "MP_DRAW_CAPS" ) )
				self.clipFinished( OutcomeColor, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Victory",
			condition = function ( menu, element, event )
				return WonLastTeamBasedMatch( controller )
			end
		},
		{
			stateName = "Defeat",
			condition = function ( menu, element, event )
				return LostLastTeamBasedMatch( controller )
			end
		},
		{
			stateName = "Draw",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FEMemberBlurPanelContainer0:close()
		self.GameModeNew:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

