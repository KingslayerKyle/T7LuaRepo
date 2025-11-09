require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberBackingMask" )
require( "ui.uieditor.widgets.Border" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )
require( "ui.uieditor.widgets.Lobby.MapVote.MapVoteLabelUpper" )
require( "ui.uieditor.widgets.Lobby.MapVote.MapVoteLabelLower" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberBackingFooter" )

CoD.MapVoteItem = InheritFrom( LUI.UIElement )
CoD.MapVoteItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.MapVoteItem )
	self.id = "MapVoteItem"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 355 )
	self:setTopBottom( true, false, 0, 60 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local MapImage = LUI.UIImage.new()
	MapImage:setLeftRight( true, true, 0, 0 )
	MapImage:setTopBottom( false, true, -178, 0 )
	MapImage:setRGB( 1, 1, 1 )
	MapImage:setAlpha( 0.78 )
	MapImage:setImage( RegisterImage( "uie_img_t7_menu_mp_preview_sector" ) )
	MapImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( MapImage )
	self.MapImage = MapImage
	
	local LobbyMemberBackingMask0 = CoD.LobbyMemberBackingMask.new( menu, controller )
	LobbyMemberBackingMask0:setLeftRight( false, true, -49, 0 )
	LobbyMemberBackingMask0:setTopBottom( true, true, 0, 0 )
	LobbyMemberBackingMask0:setRGB( 0, 0, 0 )
	LobbyMemberBackingMask0:setAlpha( 0.5 )
	LobbyMemberBackingMask0:mergeStateConditions( {
		{
			stateName = "PlayerCountState",
			condition = function ( menu, element, event )
				return true
			end
		},
		{
			stateName = "AddControllerState",
			condition = function ( menu, element, event )
				return true
			end
		},
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:addElement( LobbyMemberBackingMask0 )
	self.LobbyMemberBackingMask0 = LobbyMemberBackingMask0
	
	local FocusBorder = CoD.Border.new( menu, controller )
	FocusBorder:setLeftRight( true, true, 0, 0 )
	FocusBorder:setTopBottom( true, true, 0, 0 )
	FocusBorder:setRGB( 1, 0.41, 0 )
	FocusBorder:setAlpha( 0 )
	self:addElement( FocusBorder )
	self.FocusBorder = FocusBorder
	
	local VoteType = LUI.UIText.new()
	VoteType:setLeftRight( false, true, -381.5, -62.5 )
	VoteType:setTopBottom( false, true, -35, -19 )
	VoteType:setRGB( 1, 1, 1 )
	VoteType:setAlpha( 0.95 )
	VoteType:setText( Engine.Localize( "VOTE TYPE" ) )
	VoteType:setTTF( "fonts/Entovo.ttf" )
	VoteType:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	VoteType:setShaderVector( 0, 0.09, 0, 0, 0 )
	VoteType:setShaderVector( 1, 0.06, 0, 0, 0 )
	VoteType:setShaderVector( 2, 1, 0, 0, 0 )
	VoteType:setLetterSpacing( 2.5 )
	VoteType:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	VoteType:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( VoteType )
	self.VoteType = VoteType
	
	local voteCount = LUI.UIText.new()
	voteCount:setLeftRight( false, true, -45, -4 )
	voteCount:setTopBottom( false, true, -40.5, -15.5 )
	voteCount:setRGB( 1, 1, 1 )
	voteCount:setText( Engine.Localize( "00" ) )
	voteCount:setTTF( "fonts/Entovo.ttf" )
	voteCount:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	voteCount:setShaderVector( 0, 0.06, 0, 0, 0 )
	voteCount:setShaderVector( 1, 0.07, 0, 0, 0 )
	voteCount:setShaderVector( 2, 1, 0, 0, 0 )
	voteCount:setLetterSpacing( 2.2 )
	voteCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	voteCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( voteCount )
	self.voteCount = voteCount
	
	local Stroke = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	Stroke:setLeftRight( true, true, -1.23, 1.77 )
	Stroke:setTopBottom( true, true, -1, 1 )
	Stroke:setRGB( 1, 1, 1 )
	Stroke:setAlpha( 0 )
	self:addElement( Stroke )
	self.Stroke = Stroke
	
	local MapNameNew = CoD.MapVoteLabelUpper.new( menu, controller )
	MapNameNew:setLeftRight( true, false, 13, 130 )
	MapNameNew:setTopBottom( false, true, -49.32, -28 )
	MapNameNew:setRGB( 1, 1, 1 )
	MapNameNew.FEListHeaderGlow0:setAlpha( 0.72 )
	MapNameNew.btnDisplayTextStroke:setText( Engine.Localize( "FEATURED" ) )
	self:addElement( MapNameNew )
	self.MapNameNew = MapNameNew
	
	local GameModeNew = CoD.MapVoteLabelLower.new( menu, controller )
	GameModeNew:setLeftRight( true, false, 11, 101 )
	GameModeNew:setTopBottom( false, true, -26.5, -8.5 )
	GameModeNew:setRGB( 1, 1, 1 )
	GameModeNew.StartMenuIdentitySubtitleBG00:setAlpha( 0.42 )
	GameModeNew.SubTitle:setRGB( 1, 1, 1 )
	GameModeNew.SubTitle:setText( Engine.Localize( "SOMETHING" ) )
	GameModeNew.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( GameModeNew )
	self.GameModeNew = GameModeNew
	
	local LobbyMemberBackingFooter00 = CoD.LobbyMemberBackingFooter.new( menu, controller )
	LobbyMemberBackingFooter00:setLeftRight( true, true, -2, 2 )
	LobbyMemberBackingFooter00:setTopBottom( true, false, 0, 5 )
	LobbyMemberBackingFooter00:setRGB( 1, 1, 1 )
	self:addElement( LobbyMemberBackingFooter00 )
	self.LobbyMemberBackingFooter00 = LobbyMemberBackingFooter00
	
	local LobbyMemberBackingFooter0 = CoD.LobbyMemberBackingFooter.new( menu, controller )
	LobbyMemberBackingFooter0:setLeftRight( true, true, -2, 2 )
	LobbyMemberBackingFooter0:setTopBottom( false, true, -5, 0 )
	LobbyMemberBackingFooter0:setRGB( 1, 1, 1 )
	self:addElement( LobbyMemberBackingFooter0 )
	self.LobbyMemberBackingFooter0 = LobbyMemberBackingFooter0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				LobbyMemberBackingMask0:completeAnimation()
				self.LobbyMemberBackingMask0:setRGB( 0, 0, 0 )
				self.clipFinished( LobbyMemberBackingMask0, {} )
				voteCount:completeAnimation()
				self.voteCount:setRGB( 1, 1, 1 )
				self.clipFinished( voteCount, {} )
				LobbyMemberBackingFooter00:completeAnimation()
				self.LobbyMemberBackingFooter00:setAlpha( 0 )
				self.clipFinished( LobbyMemberBackingFooter00, {} )
				LobbyMemberBackingFooter0:completeAnimation()
				self.LobbyMemberBackingFooter0:setAlpha( 0 )
				self.clipFinished( LobbyMemberBackingFooter0, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 2 )
				LobbyMemberBackingFooter00:completeAnimation()
				self.LobbyMemberBackingFooter00:setLeftRight( true, true, -2, 2 )
				self.LobbyMemberBackingFooter00:setTopBottom( true, false, 0, 5 )
				self.LobbyMemberBackingFooter00:setAlpha( 1 )
				self.clipFinished( LobbyMemberBackingFooter00, {} )
				LobbyMemberBackingFooter0:completeAnimation()
				self.LobbyMemberBackingFooter0:setAlpha( 1 )
				self.clipFinished( LobbyMemberBackingFooter0, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 2 )
				local LobbyMemberBackingFooter00Frame2 = function ( LobbyMemberBackingFooter00, event )
					if not event.interrupted then
						LobbyMemberBackingFooter00:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Bounce )
					end
					LobbyMemberBackingFooter00:setLeftRight( true, true, -2, 2 )
					LobbyMemberBackingFooter00:setTopBottom( true, false, 0, 5 )
					LobbyMemberBackingFooter00:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBackingFooter00, event )
					else
						LobbyMemberBackingFooter00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBackingFooter00:completeAnimation()
				self.LobbyMemberBackingFooter00:setLeftRight( true, true, -2, 2 )
				self.LobbyMemberBackingFooter00:setTopBottom( true, false, 0, 5 )
				self.LobbyMemberBackingFooter00:setAlpha( 0 )
				LobbyMemberBackingFooter00Frame2( LobbyMemberBackingFooter00, {} )
				local LobbyMemberBackingFooter0Frame2 = function ( LobbyMemberBackingFooter0, event )
					if not event.interrupted then
						LobbyMemberBackingFooter0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Bounce )
					end
					LobbyMemberBackingFooter0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBackingFooter0, event )
					else
						LobbyMemberBackingFooter0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBackingFooter0:completeAnimation()
				self.LobbyMemberBackingFooter0:setAlpha( 0 )
				LobbyMemberBackingFooter0Frame2( LobbyMemberBackingFooter0, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 2 )
				local LobbyMemberBackingFooter00Frame2 = function ( LobbyMemberBackingFooter00, event )
					if not event.interrupted then
						LobbyMemberBackingFooter00:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Bounce )
					end
					LobbyMemberBackingFooter00:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBackingFooter00, event )
					else
						LobbyMemberBackingFooter00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBackingFooter00:completeAnimation()
				self.LobbyMemberBackingFooter00:setAlpha( 1 )
				LobbyMemberBackingFooter00Frame2( LobbyMemberBackingFooter00, {} )
				local LobbyMemberBackingFooter0Frame2 = function ( LobbyMemberBackingFooter0, event )
					if not event.interrupted then
						LobbyMemberBackingFooter0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Bounce )
					end
					LobbyMemberBackingFooter0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBackingFooter0, event )
					else
						LobbyMemberBackingFooter0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBackingFooter0:completeAnimation()
				self.LobbyMemberBackingFooter0:setAlpha( 1 )
				LobbyMemberBackingFooter0Frame2( LobbyMemberBackingFooter0, {} )
			end
		},
		Selected = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				LobbyMemberBackingMask0:completeAnimation()
				self.LobbyMemberBackingMask0:setRGB( 0.52, 0.84, 0.15 )
				self.LobbyMemberBackingMask0:setAlpha( 1 )
				self.clipFinished( LobbyMemberBackingMask0, {} )
				FocusBorder:completeAnimation()
				self.FocusBorder:setAlpha( 0 )
				self.clipFinished( FocusBorder, {} )
				voteCount:completeAnimation()
				self.voteCount:setRGB( 0, 0, 0 )
				self.voteCount:setZoom( 0 )
				self.clipFinished( voteCount, {} )
				LobbyMemberBackingFooter00:completeAnimation()
				self.LobbyMemberBackingFooter00:setAlpha( 0 )
				self.clipFinished( LobbyMemberBackingFooter00, {} )
				LobbyMemberBackingFooter0:completeAnimation()
				self.LobbyMemberBackingFooter0:setAlpha( 0 )
				self.clipFinished( LobbyMemberBackingFooter0, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 2 )
				LobbyMemberBackingFooter00:completeAnimation()
				self.LobbyMemberBackingFooter00:setAlpha( 1 )
				self.clipFinished( LobbyMemberBackingFooter00, {} )
				LobbyMemberBackingFooter0:completeAnimation()
				self.LobbyMemberBackingFooter0:setAlpha( 1 )
				self.clipFinished( LobbyMemberBackingFooter0, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 2 )
				local LobbyMemberBackingFooter00Frame2 = function ( LobbyMemberBackingFooter00, event )
					if not event.interrupted then
						LobbyMemberBackingFooter00:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Bounce )
					end
					LobbyMemberBackingFooter00:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBackingFooter00, event )
					else
						LobbyMemberBackingFooter00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBackingFooter00:completeAnimation()
				self.LobbyMemberBackingFooter00:setAlpha( 0 )
				LobbyMemberBackingFooter00Frame2( LobbyMemberBackingFooter00, {} )
				local LobbyMemberBackingFooter0Frame2 = function ( LobbyMemberBackingFooter0, event )
					if not event.interrupted then
						LobbyMemberBackingFooter0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Bounce )
					end
					LobbyMemberBackingFooter0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBackingFooter0, event )
					else
						LobbyMemberBackingFooter0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBackingFooter0:completeAnimation()
				self.LobbyMemberBackingFooter0:setAlpha( 0 )
				LobbyMemberBackingFooter0Frame2( LobbyMemberBackingFooter0, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 2 )
				local LobbyMemberBackingFooter00Frame2 = function ( LobbyMemberBackingFooter00, event )
					if not event.interrupted then
						LobbyMemberBackingFooter00:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Bounce )
					end
					LobbyMemberBackingFooter00:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBackingFooter00, event )
					else
						LobbyMemberBackingFooter00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBackingFooter00:completeAnimation()
				self.LobbyMemberBackingFooter00:setAlpha( 1 )
				LobbyMemberBackingFooter00Frame2( LobbyMemberBackingFooter00, {} )
				local LobbyMemberBackingFooter0Frame2 = function ( LobbyMemberBackingFooter0, event )
					if not event.interrupted then
						LobbyMemberBackingFooter0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Bounce )
					end
					LobbyMemberBackingFooter0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBackingFooter0, event )
					else
						LobbyMemberBackingFooter0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBackingFooter0:completeAnimation()
				self.LobbyMemberBackingFooter0:setAlpha( 1 )
				LobbyMemberBackingFooter0Frame2( LobbyMemberBackingFooter0, {} )
			end
		}
	}
	self.close = function ( self )
		self.LobbyMemberBackingMask0:close()
		self.FocusBorder:close()
		self.Stroke:close()
		self.MapNameNew:close()
		self.GameModeNew:close()
		self.LobbyMemberBackingFooter00:close()
		self.LobbyMemberBackingFooter0:close()
		CoD.MapVoteItem.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

