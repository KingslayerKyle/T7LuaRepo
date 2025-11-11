require( "ui.uieditor.widgets.Border" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberBackingFooter" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberBackingMask" )
require( "ui.uieditor.widgets.Lobby.MapVote.MapVoteLabelLower" )
require( "ui.uieditor.widgets.Lobby.MapVote.MapVoteLabelUpper" )

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
	self:setLeftRight( 0, 0, 0, 532 )
	self:setTopBottom( 0, 0, 0, 90 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local MapImage = LUI.UIImage.new()
	MapImage:setLeftRight( 0, 1, 0, 0 )
	MapImage:setTopBottom( 1, 1, -267, 0 )
	MapImage:setImage( RegisterImage( "img_t7_menu_mp_preview_sector" ) )
	MapImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( MapImage )
	self.MapImage = MapImage
	
	local LobbyMemberBackingMask0 = CoD.LobbyMemberBackingMask.new( menu, controller )
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
	LobbyMemberBackingMask0:setLeftRight( 1, 1, -74, 0 )
	LobbyMemberBackingMask0:setTopBottom( 0, 1, 0, 0 )
	LobbyMemberBackingMask0:setRGB( 0, 0, 0 )
	LobbyMemberBackingMask0:setAlpha( 0.5 )
	self:addElement( LobbyMemberBackingMask0 )
	self.LobbyMemberBackingMask0 = LobbyMemberBackingMask0
	
	local FocusBorder = CoD.Border.new( menu, controller )
	FocusBorder:setLeftRight( 0, 1, 0, 0 )
	FocusBorder:setTopBottom( 0, 1, 0, 0 )
	FocusBorder:setRGB( 1, 0.41, 0 )
	FocusBorder:setAlpha( 0 )
	self:addElement( FocusBorder )
	self.FocusBorder = FocusBorder
	
	local VoteType = LUI.UITightText.new()
	VoteType:setLeftRight( 1, 1, -572, -94 )
	VoteType:setTopBottom( 1, 1, -52, -28 )
	VoteType:setAlpha( 0.95 )
	VoteType:setText( Engine.Localize( "VOTE TYPE" ) )
	VoteType:setTTF( "fonts/escom.ttf" )
	VoteType:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	VoteType:setShaderVector( 0, 0.09, 0, 0, 0 )
	VoteType:setShaderVector( 1, 0.06, 0, 0, 0 )
	VoteType:setShaderVector( 2, 1, 0, 0, 0 )
	VoteType:setLetterSpacing( 2.5 )
	self:addElement( VoteType )
	self.VoteType = VoteType
	
	local voteCount = LUI.UIText.new()
	voteCount:setLeftRight( 1, 1, -68, -6 )
	voteCount:setTopBottom( 1, 1, -61, -23 )
	voteCount:setText( Engine.Localize( "00" ) )
	voteCount:setTTF( "fonts/escom.ttf" )
	voteCount:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	voteCount:setShaderVector( 0, 0.06, 0, 0, 0 )
	voteCount:setShaderVector( 1, 0.07, 0, 0, 0 )
	voteCount:setShaderVector( 2, 1, 0, 0, 0 )
	voteCount:setLetterSpacing( 2.2 )
	voteCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	voteCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( voteCount )
	self.voteCount = voteCount
	
	local Stroke = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	Stroke:setLeftRight( 0, 1, -2, 2 )
	Stroke:setTopBottom( 0, 1, -2, 2 )
	Stroke:setAlpha( 0 )
	self:addElement( Stroke )
	self.Stroke = Stroke
	
	local MapNameNew = CoD.MapVoteLabelUpper.new( menu, controller )
	MapNameNew:setLeftRight( 0, 0, 20, 300 )
	MapNameNew:setTopBottom( 1, 1, -74, -42 )
	MapNameNew.FEListHeaderGlow0:setAlpha( 0.72 )
	MapNameNew.btnDisplayTextStroke:setText( Engine.Localize( "FEATURED" ) )
	self:addElement( MapNameNew )
	self.MapNameNew = MapNameNew
	
	local GameModeNew = CoD.MapVoteLabelLower.new( menu, controller )
	GameModeNew:setLeftRight( 0, 0, 20, 300 )
	GameModeNew:setTopBottom( 1, 1, -39.5, -12.5 )
	GameModeNew.StartMenuIdentitySubtitleBG00:setAlpha( 0.42 )
	GameModeNew.SubTitle:setText( Engine.Localize( "SOMETHING" ) )
	GameModeNew.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( GameModeNew )
	self.GameModeNew = GameModeNew
	
	local LobbyMemberBackingFooter00 = CoD.LobbyMemberBackingFooter.new( menu, controller )
	LobbyMemberBackingFooter00:setLeftRight( 0, 1, -3, 3 )
	LobbyMemberBackingFooter00:setTopBottom( 0, 0, 0, 8 )
	self:addElement( LobbyMemberBackingFooter00 )
	self.LobbyMemberBackingFooter00 = LobbyMemberBackingFooter00
	
	local LobbyMemberBackingFooter0 = CoD.LobbyMemberBackingFooter.new( menu, controller )
	LobbyMemberBackingFooter0:setLeftRight( 0, 1, -3, 3 )
	LobbyMemberBackingFooter0:setTopBottom( 1, 1, -8, 0 )
	self:addElement( LobbyMemberBackingFooter0 )
	self.LobbyMemberBackingFooter0 = LobbyMemberBackingFooter0
	
	local black = LUI.UIImage.new()
	black:setLeftRight( 0, 0, 0, 532 )
	black:setTopBottom( 0, 0, 0, 90 )
	black:setRGB( 0, 0, 0 )
	black:setAlpha( 0 )
	self:addElement( black )
	self.black = black
	
	self.resetProperties = function ()
		LobbyMemberBackingFooter0:completeAnimation()
		LobbyMemberBackingFooter00:completeAnimation()
		voteCount:completeAnimation()
		LobbyMemberBackingMask0:completeAnimation()
		black:completeAnimation()
		LobbyMemberBackingFooter0:setAlpha( 1 )
		LobbyMemberBackingFooter00:setAlpha( 1 )
		voteCount:setRGB( 1, 1, 1 )
		LobbyMemberBackingMask0:setRGB( 0, 0, 0 )
		LobbyMemberBackingMask0:setAlpha( 0.5 )
		black:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				LobbyMemberBackingFooter00:completeAnimation()
				self.LobbyMemberBackingFooter00:setAlpha( 0 )
				self.clipFinished( LobbyMemberBackingFooter00, {} )
				LobbyMemberBackingFooter0:completeAnimation()
				self.LobbyMemberBackingFooter0:setAlpha( 0 )
				self.clipFinished( LobbyMemberBackingFooter0, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			GainFocus = function ()
				self.resetProperties()
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
				self.resetProperties()
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
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				LobbyMemberBackingMask0:completeAnimation()
				self.LobbyMemberBackingMask0:setRGB( 0.52, 0.84, 0.15 )
				self.LobbyMemberBackingMask0:setAlpha( 1 )
				self.clipFinished( LobbyMemberBackingMask0, {} )
				voteCount:completeAnimation()
				self.voteCount:setRGB( 0, 0, 0 )
				self.clipFinished( voteCount, {} )
				LobbyMemberBackingFooter00:completeAnimation()
				self.LobbyMemberBackingFooter00:setAlpha( 0 )
				self.clipFinished( LobbyMemberBackingFooter00, {} )
				LobbyMemberBackingFooter0:completeAnimation()
				self.LobbyMemberBackingFooter0:setAlpha( 0 )
				self.clipFinished( LobbyMemberBackingFooter0, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			GainFocus = function ()
				self.resetProperties()
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
				self.resetProperties()
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
		Unselectable = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				LobbyMemberBackingFooter00:completeAnimation()
				self.LobbyMemberBackingFooter00:setAlpha( 0 )
				self.clipFinished( LobbyMemberBackingFooter00, {} )
				LobbyMemberBackingFooter0:completeAnimation()
				self.LobbyMemberBackingFooter0:setAlpha( 0 )
				self.clipFinished( LobbyMemberBackingFooter0, {} )
				black:completeAnimation()
				self.black:setAlpha( 0.65 )
				self.clipFinished( black, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Selected",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Unselectable",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LobbyMemberBackingMask0:close()
		self.FocusBorder:close()
		self.Stroke:close()
		self.MapNameNew:close()
		self.GameModeNew:close()
		self.LobbyMemberBackingFooter00:close()
		self.LobbyMemberBackingFooter0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

