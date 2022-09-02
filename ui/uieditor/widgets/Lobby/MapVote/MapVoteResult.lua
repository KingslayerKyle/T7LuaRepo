-- f0062fe25e45b29a077d3cdd221242ce
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 303 )
	self:setTopBottom( true, false, 0, 151 )
	self.anyChildUsesUpdateState = true
	
	local BlackBack = LUI.UIImage.new()
	BlackBack:setLeftRight( true, true, 0, 0 )
	BlackBack:setTopBottom( true, true, 0, -1.5 )
	BlackBack:setRGB( 0, 0, 0 )
	BlackBack:setAlpha( 0.2 )
	self:addElement( BlackBack )
	self.BlackBack = BlackBack
	
	local FEMemberBlurPanelContainer0 = CoD.FE_MemberBlurPanelContainer.new( menu, controller )
	FEMemberBlurPanelContainer0:setLeftRight( true, true, 0, -1 )
	FEMemberBlurPanelContainer0:setTopBottom( true, true, 0, 0 )
	FEMemberBlurPanelContainer0:setRGB( 0.5, 0.5, 0.5 )
	FEMemberBlurPanelContainer0.FEMemberBlurPanel0:setShaderVector( 0, 0, 3, 0, 0 )
	self:addElement( FEMemberBlurPanelContainer0 )
	self.FEMemberBlurPanelContainer0 = FEMemberBlurPanelContainer0
	
	local MapImage = LUI.UIImage.new()
	MapImage:setLeftRight( true, true, 0, 0 )
	MapImage:setTopBottom( true, true, 0, 0 )
	MapImage:setAlpha( 0 )
	MapImage:setImage( RegisterImage( GetPostMatchMapImage( controller, "uie_img_t7_menu_mp_preview_sector" ) ) )
	self:addElement( MapImage )
	self.MapImage = MapImage
	
	local OutcomeGrey = LUI.UIText.new()
	OutcomeGrey:setLeftRight( true, false, 127, 298 )
	OutcomeGrey:setTopBottom( true, false, 39.5, 79.5 )
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
	OutcomeColor:setLeftRight( true, false, 127, 296 )
	OutcomeColor:setTopBottom( true, false, 39.5, 79.5 )
	OutcomeColor:setRGB( 1, 0, 0 )
	OutcomeColor:setText( Engine.Localize( "MP_DEFEAT_CAPS" ) )
	OutcomeColor:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	OutcomeColor:setLetterSpacing( -1 )
	OutcomeColor:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	OutcomeColor:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( OutcomeColor )
	self.OutcomeColor = OutcomeColor
	
	local GameModeIcon = LUI.UIImage.new()
	GameModeIcon:setLeftRight( true, false, 0, 127 )
	GameModeIcon:setTopBottom( true, false, 12, 139 )
	GameModeIcon:setImage( RegisterImage( GetPostMatchGameTypeImage( controller, "uie_t7_menu_mp_icons_gamemode_graphic_default" ) ) )
	self:addElement( GameModeIcon )
	self.GameModeIcon = GameModeIcon
	
	local Score = LUI.UIText.new()
	Score:setLeftRight( true, true, 129, -7 )
	Score:setTopBottom( true, false, 70.5, 110.5 )
	Score:setText( Engine.Localize( GetPostMatchScore( controller, "115 - 200" ) ) )
	Score:setTTF( "fonts/escom.ttf" )
	Score:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	Score:setShaderVector( 0, 0.09, 0, 0, 0 )
	Score:setShaderVector( 1, 0.06, 0, 0, 0 )
	Score:setShaderVector( 2, 1, 0, 0, 0 )
	Score:setLetterSpacing( 2.5 )
	Score:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Score:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Score )
	self.Score = Score
	
	local GameModeNew = CoD.MapVoteLabelLower.new( menu, controller )
	GameModeNew:setLeftRight( true, false, 13, 200 )
	GameModeNew:setTopBottom( false, true, -26.5, -8.5 )
	GameModeNew.StartMenuIdentitySubtitleBG00:setAlpha( 0.42 )
	GameModeNew.SubTitle:setText( Engine.Localize( LocalizeToUpperString( GetPostMatchGameType( controller, "Hardpoint" ) ) ) )
	GameModeNew.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( GameModeNew )
	self.GameModeNew = GameModeNew
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				MapImage:completeAnimation()
				self.MapImage:setAlpha( 0 )
				self.clipFinished( MapImage, {} )

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
				self:setupElementClipCounter( 4 )

				OutcomeGrey:completeAnimation()
				self.OutcomeGrey:setText( Engine.Localize( "MP_VICTORY_CAPS" ) )
				self.clipFinished( OutcomeGrey, {} )

				OutcomeColor:completeAnimation()
				self.OutcomeColor:setRGB( 0.36, 1, 0.15 )
				self.OutcomeColor:setAlpha( 0.7 )
				self.OutcomeColor:setText( Engine.Localize( "MP_VICTORY_CAPS" ) )
				self.clipFinished( OutcomeColor, {} )

				GameModeIcon:completeAnimation()
				self.GameModeIcon:setAlpha( 1 )
				self.clipFinished( GameModeIcon, {} )

				Score:completeAnimation()
				self.Score:setAlpha( 1 )
				self.clipFinished( Score, {} )
			end
		},
		Defeat = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				OutcomeGrey:completeAnimation()
				self.OutcomeGrey:setText( Engine.Localize( "MP_DEFEAT_CAPS" ) )
				self.clipFinished( OutcomeGrey, {} )

				OutcomeColor:completeAnimation()
				self.OutcomeColor:setRGB( 1, 0, 0 )
				self.OutcomeColor:setAlpha( 0.7 )
				self.clipFinished( OutcomeColor, {} )

				GameModeIcon:completeAnimation()
				self.GameModeIcon:setAlpha( 1 )
				self.clipFinished( GameModeIcon, {} )

				Score:completeAnimation()
				self.Score:setAlpha( 1 )
				self.clipFinished( Score, {} )
			end
		},
		Draw = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				OutcomeGrey:completeAnimation()
				self.OutcomeGrey:setAlpha( 0 )
				self.clipFinished( OutcomeGrey, {} )

				OutcomeColor:completeAnimation()
				self.OutcomeColor:setRGB( 0.8, 0.8, 0.8 )
				self.OutcomeColor:setText( Engine.Localize( "MP_DRAW_CAPS" ) )
				self.clipFinished( OutcomeColor, {} )

				GameModeIcon:completeAnimation()
				self.GameModeIcon:setAlpha( 1 )
				self.clipFinished( GameModeIcon, {} )

				Score:completeAnimation()
				self.Score:setAlpha( 1 )
				self.clipFinished( Score, {} )
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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEMemberBlurPanelContainer0:close()
		element.GameModeNew:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

