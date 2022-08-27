-- 9a782da56de6360e906b938b8343602e
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.EndGameFlow.KillcamWidgetPnlRT" )
require( "ui.uieditor.widgets.playercard.YouAndKiller_Widget" )
require( "ui.uieditor.widgets.Notifications.PlayerCard.PlayerCard" )
require( "ui.uieditor.widgets.EndGameFlow.KillcamWidgetNumbers" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ListHeaderGlow" )
require( "ui.uieditor.widgets.Effects.fxGlitch1_Main" )

CoD.KillcamPlayerInfo = InheritFrom( LUI.UIElement )
CoD.KillcamPlayerInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.KillcamPlayerInfo )
	self.id = "KillcamPlayerInfo"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 56 )
	self.anyChildUsesUpdateState = true
	
	local NemesisShadow = LUI.UIImage.new()
	NemesisShadow:setLeftRight( true, false, 493, 787 )
	NemesisShadow:setTopBottom( true, false, -123, 64 )
	NemesisShadow:setRGB( 0, 0, 0 )
	NemesisShadow:setAlpha( 0.23 )
	NemesisShadow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	self:addElement( NemesisShadow )
	self.NemesisShadow = NemesisShadow
	
	local NemesisLine2 = LUI.UIImage.new()
	NemesisLine2:setLeftRight( false, false, -686.78, -60 )
	NemesisLine2:setTopBottom( false, false, -71, -47 )
	NemesisLine2:setYRot( 180 )
	NemesisLine2:setImage( RegisterImage( "uie_t7_cp_hud_weakpoint_newreddash" ) )
	NemesisLine2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	NemesisLine2:setShaderVector( 0, 200, 4.83, 0, 0 )
	NemesisLine2:setShaderVector( 1, 6.02, 0, 0, 0 )
	self:addElement( NemesisLine2 )
	self.NemesisLine2 = NemesisLine2
	
	local NemesisImageNormal = LUI.UIImage.new()
	NemesisImageNormal:setLeftRight( true, false, 578.22, 701.78 )
	NemesisImageNormal:setTopBottom( true, false, -71, 9 )
	NemesisImageNormal:setAlpha( 0.6 )
	NemesisImageNormal:setImage( RegisterImage( "uie_t7_hud_mp_notifications_endgame_nemesis" ) )
	self:addElement( NemesisImageNormal )
	self.NemesisImageNormal = NemesisImageNormal
	
	local NemesisImageAdd = LUI.UIImage.new()
	NemesisImageAdd:setLeftRight( true, false, 578.22, 701.78 )
	NemesisImageAdd:setTopBottom( true, false, -71, 9 )
	NemesisImageAdd:setImage( RegisterImage( "uie_t7_hud_mp_notifications_endgame_nemesis" ) )
	NemesisImageAdd:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( NemesisImageAdd )
	self.NemesisImageAdd = NemesisImageAdd
	
	local NemesisGlow = LUI.UIImage.new()
	NemesisGlow:setLeftRight( true, false, 546, 740 )
	NemesisGlow:setTopBottom( true, false, -97, 31 )
	NemesisGlow:setRGB( 0.29, 0.01, 0 )
	NemesisGlow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	NemesisGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( NemesisGlow )
	self.NemesisGlow = NemesisGlow
	
	local NemesLine1 = LUI.UIImage.new()
	NemesLine1:setLeftRight( false, false, 59, 649.5 )
	NemesLine1:setTopBottom( false, false, -71, -47 )
	NemesLine1:setImage( RegisterImage( "uie_t7_cp_hud_weakpoint_newreddash" ) )
	NemesLine1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	NemesLine1:setShaderVector( 0, 200, 4.83, 0, 0 )
	NemesLine1:setShaderVector( 1, 6.02, 0, 0, 0 )
	self:addElement( NemesLine1 )
	self.NemesLine1 = NemesLine1
	
	local LeftPanelR = CoD.KillcamWidgetPnlRT.new( menu, controller )
	LeftPanelR:setLeftRight( true, false, -35, 640 )
	LeftPanelR:setTopBottom( true, false, -12, 68 )
	LeftPanelR:setRGB( 0.5, 0.5, 0.5 )
	LeftPanelR.KillcamWidgetPnlRTInt0:setShaderVector( 0, 0, 3, 0, 0 )
	self:addElement( LeftPanelR )
	self.LeftPanelR = LeftPanelR
	
	local LeftPanelR0 = CoD.KillcamWidgetPnlRT.new( menu, controller )
	LeftPanelR0:setLeftRight( true, false, 640, 1315 )
	LeftPanelR0:setTopBottom( true, false, -12, 68 )
	LeftPanelR0:setRGB( 0.5, 0.5, 0.5 )
	LeftPanelR0:setYRot( 180 )
	LeftPanelR0.KillcamWidgetPnlRTInt0:setShaderVector( 0, 0, 3, 0, 0 )
	self:addElement( LeftPanelR0 )
	self.LeftPanelR0 = LeftPanelR0
	
	local YouAndKillerWidget0 = CoD.YouAndKiller_Widget.new( menu, controller )
	YouAndKillerWidget0:setLeftRight( true, false, 864, 1088 )
	YouAndKillerWidget0:setTopBottom( true, false, -15, 11 )
	YouAndKillerWidget0.KillerYouLabels:setText( Engine.Localize( "MENU_YOU_CAPS" ) )
	self:addElement( YouAndKillerWidget0 )
	self.YouAndKillerWidget0 = YouAndKillerWidget0
	
	local YouAndKillerWidget00 = CoD.YouAndKiller_Widget.new( menu, controller )
	YouAndKillerWidget00:setLeftRight( true, false, 287, 505 )
	YouAndKillerWidget00:setTopBottom( true, false, -15, 11 )
	YouAndKillerWidget00.KillerYouLabels:setText( Engine.Localize( LocalizeToUpperString( "MPUI_KILLER" ) ) )
	self:addElement( YouAndKillerWidget00 )
	self.YouAndKillerWidget00 = YouAndKillerWidget00
	
	local VictimPlayerCard = CoD.PlayerCard.new( menu, controller )
	VictimPlayerCard:setLeftRight( true, false, 779, 1098 )
	VictimPlayerCard:setTopBottom( true, false, 3, 62 )
	VictimPlayerCard:subscribeToGlobalModel( controller, "Victim", nil, function ( model )
		VictimPlayerCard:setModel( model, controller )
	end )
	VictimPlayerCard:subscribeToGlobalModel( controller, "KillcamInfo", "victimFactionColor", function ( model )
		local victimFactionColor = Engine.GetModelValue( model )
		if victimFactionColor then
			VictimPlayerCard.TeamColor:setRGB( victimFactionColor )
		end
	end )
	VictimPlayerCard:linkToElementModel( self, "heading", true, function ( model )
		local heading = Engine.GetModelValue( model )
		if heading then
			VictimPlayerCard.CalloutHeading:setText( Engine.Localize( heading ) )
		end
	end )
	self:addElement( VictimPlayerCard )
	self.VictimPlayerCard = VictimPlayerCard
	
	local AttackerPlayerCard = CoD.PlayerCard.new( menu, controller )
	AttackerPlayerCard:setLeftRight( true, false, 198, 521 )
	AttackerPlayerCard:setTopBottom( true, false, 3, 62 )
	AttackerPlayerCard:subscribeToGlobalModel( controller, "Attacker", nil, function ( model )
		AttackerPlayerCard:setModel( model, controller )
	end )
	AttackerPlayerCard:linkToElementModel( self, "heading", true, function ( model )
		local heading = Engine.GetModelValue( model )
		if heading then
			AttackerPlayerCard.CalloutHeading:setText( Engine.Localize( heading ) )
		end
	end )
	self:addElement( AttackerPlayerCard )
	self.AttackerPlayerCard = AttackerPlayerCard
	
	local KillsLabel2 = LUI.UIText.new()
	KillsLabel2:setLeftRight( true, false, 689, 736 )
	KillsLabel2:setTopBottom( true, false, 0, 16 )
	KillsLabel2:setRGB( 0.83, 0.87, 0.95 )
	KillsLabel2:setText( Engine.Localize( "MENU_KILLS_CAPS" ) )
	KillsLabel2:setTTF( "fonts/escom.ttf" )
	KillsLabel2:setLetterSpacing( 1 )
	KillsLabel2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	KillsLabel2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( KillsLabel2 )
	self.KillsLabel2 = KillsLabel2
	
	local KillsLabel1 = LUI.UIText.new()
	KillsLabel1:setLeftRight( true, false, 546.72, 593.72 )
	KillsLabel1:setTopBottom( true, false, 0, 16 )
	KillsLabel1:setRGB( 0.83, 0.87, 0.95 )
	KillsLabel1:setText( Engine.Localize( "MENU_KILLS_CAPS" ) )
	KillsLabel1:setTTF( "fonts/escom.ttf" )
	KillsLabel1:setLetterSpacing( 1 )
	KillsLabel1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	KillsLabel1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( KillsLabel1 )
	self.KillsLabel1 = KillsLabel1
	
	local AttackerKillsNew = CoD.KillcamWidgetNumbers.new( menu, controller )
	AttackerKillsNew:setLeftRight( false, false, -130.78, -10.78 )
	AttackerKillsNew:setTopBottom( false, false, -17, 37 )
	AttackerKillsNew:subscribeToGlobalModel( controller, "Attacker", "kills", function ( model )
		local kills = Engine.GetModelValue( model )
		if kills then
			AttackerKillsNew.Numbers:setText( Engine.Localize( kills ) )
		end
	end )
	self:addElement( AttackerKillsNew )
	self.AttackerKillsNew = AttackerKillsNew
	
	local VictimKillsNew = CoD.KillcamWidgetNumbers.new( menu, controller )
	VictimKillsNew:setLeftRight( false, false, 12.22, 132.22 )
	VictimKillsNew:setTopBottom( false, false, -17, 37 )
	VictimKillsNew:subscribeToGlobalModel( controller, "Victim", "kills", function ( model )
		local kills = Engine.GetModelValue( model )
		if kills then
			VictimKillsNew.Numbers:setText( Engine.Localize( kills ) )
		end
	end )
	self:addElement( VictimKillsNew )
	self.VictimKillsNew = VictimKillsNew
	
	local VSBanner = CoD.FE_ListHeaderGlow.new( menu, controller )
	VSBanner:setLeftRight( true, false, 619.5, 660.5 )
	VSBanner:setTopBottom( true, false, 14, 42 )
	self:addElement( VSBanner )
	self.VSBanner = VSBanner
	
	local VSLabel = LUI.UITightText.new()
	VSLabel:setLeftRight( false, false, -13.5, 17.5 )
	VSLabel:setTopBottom( true, false, 16, 41 )
	VSLabel:setRGB( 0, 0, 0 )
	VSLabel:setText( Engine.Localize( "MP_VERSUS" ) )
	VSLabel:setTTF( "fonts/escom.ttf" )
	VSLabel:setLetterSpacing( 2 )
	self:addElement( VSLabel )
	self.VSLabel = VSLabel
	
	local Glitch = CoD.fxGlitch1_Main.new( menu, controller )
	Glitch:setLeftRight( true, false, 159, 1127 )
	Glitch:setTopBottom( true, false, -83.5, 138.5 )
	self:addElement( Glitch )
	self.Glitch = Glitch
	
	local KillsLabel20 = LUI.UIText.new()
	KillsLabel20:setLeftRight( true, false, 578.22, 697.72 )
	KillsLabel20:setTopBottom( true, false, -39, -23 )
	KillsLabel20:setRGB( 0, 0, 0 )
	KillsLabel20:setText( Engine.Localize( "MPUI_NEMESIS_TITLE_CAPS" ) )
	KillsLabel20:setTTF( "fonts/escom.ttf" )
	KillsLabel20:setLetterSpacing( 1 )
	KillsLabel20:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	KillsLabel20:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( KillsLabel20 )
	self.KillsLabel20 = KillsLabel20
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 19 )
				NemesisShadow:completeAnimation()
				self.NemesisShadow:setAlpha( 0 )
				self.clipFinished( NemesisShadow, {} )
				NemesisLine2:completeAnimation()
				self.NemesisLine2:setLeftRight( false, false, -63.78, -60 )
				self.NemesisLine2:setTopBottom( false, false, -71, -47 )
				self.NemesisLine2:setAlpha( 0 )
				self.clipFinished( NemesisLine2, {} )
				NemesisImageNormal:completeAnimation()
				self.NemesisImageNormal:setAlpha( 0 )
				self.clipFinished( NemesisImageNormal, {} )
				NemesisImageAdd:completeAnimation()
				self.NemesisImageAdd:setAlpha( 0 )
				self.clipFinished( NemesisImageAdd, {} )
				NemesisGlow:completeAnimation()
				self.NemesisGlow:setAlpha( 0 )
				self.clipFinished( NemesisGlow, {} )
				NemesLine1:completeAnimation()
				self.NemesLine1:setLeftRight( false, false, 59, 79.5 )
				self.NemesLine1:setTopBottom( false, false, -71, -47 )
				self.NemesLine1:setAlpha( 0 )
				self.clipFinished( NemesLine1, {} )
				LeftPanelR:completeAnimation()
				self.LeftPanelR:setLeftRight( true, false, 356, 500 )
				self.LeftPanelR:setTopBottom( true, false, -12, 68 )
				self.LeftPanelR:setAlpha( 0 )
				self.clipFinished( LeftPanelR, {} )
				LeftPanelR0:completeAnimation()
				self.LeftPanelR0:setLeftRight( true, false, 790, 934 )
				self.LeftPanelR0:setTopBottom( true, false, -12, 68 )
				self.LeftPanelR0:setAlpha( 0 )
				self.clipFinished( LeftPanelR0, {} )
				YouAndKillerWidget0:completeAnimation()
				self.YouAndKillerWidget0:setAlpha( 0 )
				self.clipFinished( YouAndKillerWidget0, {} )
				YouAndKillerWidget00:completeAnimation()
				self.YouAndKillerWidget00:setAlpha( 0 )
				self.clipFinished( YouAndKillerWidget00, {} )
				VictimPlayerCard:completeAnimation()
				self.VictimPlayerCard:setLeftRight( true, false, 929, 1205 )
				self.VictimPlayerCard:setTopBottom( true, false, -2, 57 )
				self.VictimPlayerCard:setAlpha( 0 )
				self.clipFinished( VictimPlayerCard, {} )
				AttackerPlayerCard:completeAnimation()
				self.AttackerPlayerCard:setLeftRight( true, false, 93.36, 360.36 )
				self.AttackerPlayerCard:setTopBottom( true, false, -2, 57 )
				self.AttackerPlayerCard:setAlpha( 0 )
				self.clipFinished( AttackerPlayerCard, {} )
				KillsLabel2:completeAnimation()
				self.KillsLabel2:setAlpha( 0 )
				self.clipFinished( KillsLabel2, {} )
				KillsLabel1:completeAnimation()
				self.KillsLabel1:setAlpha( 0 )
				self.clipFinished( KillsLabel1, {} )
				AttackerKillsNew:completeAnimation()
				self.AttackerKillsNew:setAlpha( 0 )
				self.clipFinished( AttackerKillsNew, {} )
				VictimKillsNew:completeAnimation()
				self.VictimKillsNew:setAlpha( 0 )
				self.clipFinished( VictimKillsNew, {} )
				VSBanner:completeAnimation()
				self.VSBanner:setAlpha( 0 )
				self.clipFinished( VSBanner, {} )
				VSLabel:completeAnimation()
				self.VSLabel:setAlpha( 0 )
				self.clipFinished( VSLabel, {} )
				KillsLabel20:completeAnimation()
				self.KillsLabel20:setAlpha( 0 )
				self.clipFinished( KillsLabel20, {} )
			end
		},
		Killcam = {
			DefaultClip = function ()
				self:setupElementClipCounter( 19 )
				NemesisShadow:completeAnimation()
				self.NemesisShadow:setAlpha( 0 )
				self.clipFinished( NemesisShadow, {} )
				NemesisLine2:completeAnimation()
				self.NemesisLine2:setLeftRight( false, false, -63.78, -60 )
				self.NemesisLine2:setTopBottom( false, false, -71, -47 )
				self.NemesisLine2:setAlpha( 0 )
				self.clipFinished( NemesisLine2, {} )
				NemesisImageNormal:completeAnimation()
				self.NemesisImageNormal:setAlpha( 0 )
				self.clipFinished( NemesisImageNormal, {} )
				NemesisImageAdd:completeAnimation()
				self.NemesisImageAdd:setAlpha( 0 )
				self.clipFinished( NemesisImageAdd, {} )
				NemesisGlow:completeAnimation()
				self.NemesisGlow:setAlpha( 0 )
				self.clipFinished( NemesisGlow, {} )
				NemesLine1:completeAnimation()
				self.NemesLine1:setLeftRight( false, false, 59, 79.5 )
				self.NemesLine1:setTopBottom( false, false, -71, -47 )
				self.NemesLine1:setAlpha( 0 )
				self.clipFinished( NemesLine1, {} )
				local LeftPanelRFrame2 = function ( LeftPanelR, event )
					if not event.interrupted then
						LeftPanelR:beginAnimation( "keyframe", 699, false, true, CoD.TweenType.Bounce )
					end
					LeftPanelR:setLeftRight( true, false, -35, 640 )
					LeftPanelR:setTopBottom( true, false, -12, 68 )
					LeftPanelR:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LeftPanelR, event )
					else
						LeftPanelR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftPanelR:completeAnimation()
				self.LeftPanelR:setLeftRight( true, false, -31, 500 )
				self.LeftPanelR:setTopBottom( true, false, -12, 68 )
				self.LeftPanelR:setAlpha( 0 )
				LeftPanelRFrame2( LeftPanelR, {} )
				local LeftPanelR0Frame2 = function ( LeftPanelR0, event )
					if not event.interrupted then
						LeftPanelR0:beginAnimation( "keyframe", 699, false, true, CoD.TweenType.Bounce )
					end
					LeftPanelR0:setLeftRight( true, false, 640, 1315 )
					LeftPanelR0:setTopBottom( true, false, -12, 68 )
					LeftPanelR0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LeftPanelR0, event )
					else
						LeftPanelR0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftPanelR0:completeAnimation()
				self.LeftPanelR0:setLeftRight( true, false, 790, 1311 )
				self.LeftPanelR0:setTopBottom( true, false, -12, 68 )
				self.LeftPanelR0:setAlpha( 0 )
				LeftPanelR0Frame2( LeftPanelR0, {} )
				local YouAndKillerWidget0Frame2 = function ( YouAndKillerWidget0, event )
					if not event.interrupted then
						YouAndKillerWidget0:beginAnimation( "keyframe", 699, true, true, CoD.TweenType.Bounce )
					end
					YouAndKillerWidget0:setLeftRight( true, false, 863, 1087 )
					YouAndKillerWidget0:setTopBottom( true, false, -13, 13 )
					YouAndKillerWidget0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( YouAndKillerWidget0, event )
					else
						YouAndKillerWidget0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				YouAndKillerWidget0:completeAnimation()
				self.YouAndKillerWidget0:setLeftRight( true, false, 1020, 1237 )
				self.YouAndKillerWidget0:setTopBottom( true, false, -13, 13 )
				self.YouAndKillerWidget0:setAlpha( 0 )
				YouAndKillerWidget0Frame2( YouAndKillerWidget0, {} )
				local YouAndKillerWidget00Frame2 = function ( YouAndKillerWidget00, event )
					if not event.interrupted then
						YouAndKillerWidget00:beginAnimation( "keyframe", 699, true, true, CoD.TweenType.Bounce )
					end
					YouAndKillerWidget00:setLeftRight( true, false, 283, 506 )
					YouAndKillerWidget00:setTopBottom( true, false, -13, 13 )
					YouAndKillerWidget00:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( YouAndKillerWidget00, event )
					else
						YouAndKillerWidget00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				YouAndKillerWidget00:completeAnimation()
				self.YouAndKillerWidget00:setLeftRight( true, false, 184, 401 )
				self.YouAndKillerWidget00:setTopBottom( true, false, -13, 13 )
				self.YouAndKillerWidget00:setAlpha( 0 )
				YouAndKillerWidget00Frame2( YouAndKillerWidget00, {} )
				local VictimPlayerCardFrame2 = function ( VictimPlayerCard, event )
					if not event.interrupted then
						VictimPlayerCard:beginAnimation( "keyframe", 699, true, true, CoD.TweenType.Bounce )
					end
					VictimPlayerCard:setLeftRight( true, false, 779, 1098 )
					VictimPlayerCard:setTopBottom( true, false, 6, 65 )
					VictimPlayerCard:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( VictimPlayerCard, event )
					else
						VictimPlayerCard:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VictimPlayerCard:completeAnimation()
				self.VictimPlayerCard:setLeftRight( true, false, 929, 1205 )
				self.VictimPlayerCard:setTopBottom( true, false, 6, 65 )
				self.VictimPlayerCard:setAlpha( 0 )
				VictimPlayerCardFrame2( VictimPlayerCard, {} )
				local AttackerPlayerCardFrame2 = function ( AttackerPlayerCard, event )
					if not event.interrupted then
						AttackerPlayerCard:beginAnimation( "keyframe", 699, true, true, CoD.TweenType.Bounce )
					end
					AttackerPlayerCard:setLeftRight( true, false, 198, 521 )
					AttackerPlayerCard:setTopBottom( true, false, 6, 65 )
					AttackerPlayerCard:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( AttackerPlayerCard, event )
					else
						AttackerPlayerCard:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AttackerPlayerCard:completeAnimation()
				self.AttackerPlayerCard:setLeftRight( true, false, 93, 360 )
				self.AttackerPlayerCard:setTopBottom( true, false, 6, 65 )
				self.AttackerPlayerCard:setAlpha( 0 )
				AttackerPlayerCardFrame2( AttackerPlayerCard, {} )
				local KillsLabel2Frame2 = function ( KillsLabel2, event )
					local KillsLabel2Frame3 = function ( KillsLabel2, event )
						if not event.interrupted then
							KillsLabel2:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Bounce )
						end
						KillsLabel2:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( KillsLabel2, event )
						else
							KillsLabel2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						KillsLabel2Frame3( KillsLabel2, event )
						return 
					else
						KillsLabel2:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
						KillsLabel2:registerEventHandler( "transition_complete_keyframe", KillsLabel2Frame3 )
					end
				end
				
				KillsLabel2:completeAnimation()
				self.KillsLabel2:setAlpha( 0 )
				KillsLabel2Frame2( KillsLabel2, {} )
				local KillsLabel1Frame2 = function ( KillsLabel1, event )
					local KillsLabel1Frame3 = function ( KillsLabel1, event )
						if not event.interrupted then
							KillsLabel1:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Bounce )
						end
						KillsLabel1:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( KillsLabel1, event )
						else
							KillsLabel1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						KillsLabel1Frame3( KillsLabel1, event )
						return 
					else
						KillsLabel1:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
						KillsLabel1:registerEventHandler( "transition_complete_keyframe", KillsLabel1Frame3 )
					end
				end
				
				KillsLabel1:completeAnimation()
				self.KillsLabel1:setAlpha( 0 )
				KillsLabel1Frame2( KillsLabel1, {} )
				local AttackerKillsNewFrame2 = function ( AttackerKillsNew, event )
					local AttackerKillsNewFrame3 = function ( AttackerKillsNew, event )
						if not event.interrupted then
							AttackerKillsNew:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Bounce )
						end
						AttackerKillsNew:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( AttackerKillsNew, event )
						else
							AttackerKillsNew:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						AttackerKillsNewFrame3( AttackerKillsNew, event )
						return 
					else
						AttackerKillsNew:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
						AttackerKillsNew:registerEventHandler( "transition_complete_keyframe", AttackerKillsNewFrame3 )
					end
				end
				
				AttackerKillsNew:completeAnimation()
				self.AttackerKillsNew:setAlpha( 0 )
				AttackerKillsNewFrame2( AttackerKillsNew, {} )
				local VictimKillsNewFrame2 = function ( VictimKillsNew, event )
					local VictimKillsNewFrame3 = function ( VictimKillsNew, event )
						if not event.interrupted then
							VictimKillsNew:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Bounce )
						end
						VictimKillsNew:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( VictimKillsNew, event )
						else
							VictimKillsNew:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						VictimKillsNewFrame3( VictimKillsNew, event )
						return 
					else
						VictimKillsNew:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
						VictimKillsNew:registerEventHandler( "transition_complete_keyframe", VictimKillsNewFrame3 )
					end
				end
				
				VictimKillsNew:completeAnimation()
				self.VictimKillsNew:setAlpha( 0 )
				VictimKillsNewFrame2( VictimKillsNew, {} )
				local VSBannerFrame2 = function ( VSBanner, event )
					local VSBannerFrame3 = function ( VSBanner, event )
						if not event.interrupted then
							VSBanner:beginAnimation( "keyframe", 279, false, false, CoD.TweenType.Bounce )
						end
						VSBanner:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( VSBanner, event )
						else
							VSBanner:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						VSBannerFrame3( VSBanner, event )
						return 
					else
						VSBanner:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
						VSBanner:registerEventHandler( "transition_complete_keyframe", VSBannerFrame3 )
					end
				end
				
				VSBanner:completeAnimation()
				self.VSBanner:setAlpha( 0 )
				VSBannerFrame2( VSBanner, {} )
				local VSLabelFrame2 = function ( VSLabel, event )
					local VSLabelFrame3 = function ( VSLabel, event )
						if not event.interrupted then
							VSLabel:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Bounce )
						end
						VSLabel:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( VSLabel, event )
						else
							VSLabel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						VSLabelFrame3( VSLabel, event )
						return 
					else
						VSLabel:beginAnimation( "keyframe", 649, false, false, CoD.TweenType.Linear )
						VSLabel:registerEventHandler( "transition_complete_keyframe", VSLabelFrame3 )
					end
				end
				
				VSLabel:completeAnimation()
				self.VSLabel:setAlpha( 0 )
				VSLabelFrame2( VSLabel, {} )
				KillsLabel20:completeAnimation()
				self.KillsLabel20:setAlpha( 0 )
				self.clipFinished( KillsLabel20, {} )
			end
		},
		NemesisKillcam = {
			DefaultClip = function ()
				self:setupElementClipCounter( 18 )
				local NemesisShadowFrame2 = function ( NemesisShadow, event )
					if not event.interrupted then
						NemesisShadow:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
					end
					NemesisShadow:setAlpha( 0.23 )
					if event.interrupted then
						self.clipFinished( NemesisShadow, event )
					else
						NemesisShadow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				NemesisShadow:completeAnimation()
				self.NemesisShadow:setAlpha( 0 )
				NemesisShadowFrame2( NemesisShadow, {} )
				local NemesisLine2Frame2 = function ( NemesisLine2, event )
					if not event.interrupted then
						NemesisLine2:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
					end
					NemesisLine2:setLeftRight( false, false, -686.78, -60 )
					NemesisLine2:setTopBottom( false, false, -71, -47 )
					NemesisLine2:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( NemesisLine2, event )
					else
						NemesisLine2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				NemesisLine2:completeAnimation()
				self.NemesisLine2:setLeftRight( false, false, -63.78, -60 )
				self.NemesisLine2:setTopBottom( false, false, -71, -47 )
				self.NemesisLine2:setAlpha( 0 )
				NemesisLine2Frame2( NemesisLine2, {} )
				local NemesisImageNormalFrame2 = function ( NemesisImageNormal, event )
					local NemesisImageNormalFrame3 = function ( NemesisImageNormal, event )
						if not event.interrupted then
							NemesisImageNormal:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Bounce )
						end
						NemesisImageNormal:setAlpha( 0.6 )
						if event.interrupted then
							self.clipFinished( NemesisImageNormal, event )
						else
							NemesisImageNormal:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						NemesisImageNormalFrame3( NemesisImageNormal, event )
						return 
					else
						NemesisImageNormal:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						NemesisImageNormal:registerEventHandler( "transition_complete_keyframe", NemesisImageNormalFrame3 )
					end
				end
				
				NemesisImageNormal:completeAnimation()
				self.NemesisImageNormal:setAlpha( 0 )
				NemesisImageNormalFrame2( NemesisImageNormal, {} )
				local NemesisImageAddFrame2 = function ( NemesisImageAdd, event )
					if not event.interrupted then
						NemesisImageAdd:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Bounce )
					end
					NemesisImageAdd:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( NemesisImageAdd, event )
					else
						NemesisImageAdd:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				NemesisImageAdd:completeAnimation()
				self.NemesisImageAdd:setAlpha( 0 )
				NemesisImageAddFrame2( NemesisImageAdd, {} )
				local NemesisGlowFrame2 = function ( NemesisGlow, event )
					if not event.interrupted then
						NemesisGlow:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
					end
					NemesisGlow:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( NemesisGlow, event )
					else
						NemesisGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				NemesisGlow:completeAnimation()
				self.NemesisGlow:setAlpha( 0 )
				NemesisGlowFrame2( NemesisGlow, {} )
				local NemesLine1Frame2 = function ( NemesLine1, event )
					if not event.interrupted then
						NemesLine1:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
					end
					NemesLine1:setLeftRight( false, false, 59, 649.5 )
					NemesLine1:setTopBottom( false, false, -71, -47 )
					NemesLine1:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( NemesLine1, event )
					else
						NemesLine1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				NemesLine1:completeAnimation()
				self.NemesLine1:setLeftRight( false, false, 59, 79.5 )
				self.NemesLine1:setTopBottom( false, false, -71, -47 )
				self.NemesLine1:setAlpha( 0 )
				NemesLine1Frame2( NemesLine1, {} )
				local LeftPanelRFrame2 = function ( LeftPanelR, event )
					if not event.interrupted then
						LeftPanelR:beginAnimation( "keyframe", 699, true, true, CoD.TweenType.Bounce )
					end
					LeftPanelR:setLeftRight( true, false, -35, 640 )
					LeftPanelR:setTopBottom( true, false, -12, 68 )
					LeftPanelR:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LeftPanelR, event )
					else
						LeftPanelR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftPanelR:completeAnimation()
				self.LeftPanelR:setLeftRight( true, false, -31, 500 )
				self.LeftPanelR:setTopBottom( true, false, -12, 68 )
				self.LeftPanelR:setAlpha( 0 )
				LeftPanelRFrame2( LeftPanelR, {} )
				local LeftPanelR0Frame2 = function ( LeftPanelR0, event )
					if not event.interrupted then
						LeftPanelR0:beginAnimation( "keyframe", 699, true, true, CoD.TweenType.Bounce )
					end
					LeftPanelR0:setLeftRight( true, false, 640, 1315 )
					LeftPanelR0:setTopBottom( true, false, -12, 68 )
					LeftPanelR0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LeftPanelR0, event )
					else
						LeftPanelR0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftPanelR0:completeAnimation()
				self.LeftPanelR0:setLeftRight( true, false, 790, 1311 )
				self.LeftPanelR0:setTopBottom( true, false, -12, 68 )
				self.LeftPanelR0:setAlpha( 0 )
				LeftPanelR0Frame2( LeftPanelR0, {} )
				local YouAndKillerWidget0Frame2 = function ( YouAndKillerWidget0, event )
					if not event.interrupted then
						YouAndKillerWidget0:beginAnimation( "keyframe", 699, true, true, CoD.TweenType.Bounce )
					end
					YouAndKillerWidget0:setLeftRight( true, false, 867, 1087 )
					YouAndKillerWidget0:setTopBottom( true, false, -13, 13 )
					YouAndKillerWidget0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( YouAndKillerWidget0, event )
					else
						YouAndKillerWidget0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				YouAndKillerWidget0:completeAnimation()
				self.YouAndKillerWidget0:setLeftRight( true, false, 1020, 1237 )
				self.YouAndKillerWidget0:setTopBottom( true, false, -13, 13 )
				self.YouAndKillerWidget0:setAlpha( 0 )
				YouAndKillerWidget0Frame2( YouAndKillerWidget0, {} )
				local YouAndKillerWidget00Frame2 = function ( YouAndKillerWidget00, event )
					if not event.interrupted then
						YouAndKillerWidget00:beginAnimation( "keyframe", 699, true, true, CoD.TweenType.Bounce )
					end
					YouAndKillerWidget00:setLeftRight( true, false, 287, 505 )
					YouAndKillerWidget00:setTopBottom( true, false, -13, 13 )
					YouAndKillerWidget00:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( YouAndKillerWidget00, event )
					else
						YouAndKillerWidget00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				YouAndKillerWidget00:completeAnimation()
				self.YouAndKillerWidget00:setLeftRight( true, false, 184, 401 )
				self.YouAndKillerWidget00:setTopBottom( true, false, -13, 13 )
				self.YouAndKillerWidget00:setAlpha( 0 )
				YouAndKillerWidget00Frame2( YouAndKillerWidget00, {} )
				local VictimPlayerCardFrame2 = function ( VictimPlayerCard, event )
					if not event.interrupted then
						VictimPlayerCard:beginAnimation( "keyframe", 699, true, true, CoD.TweenType.Bounce )
					end
					VictimPlayerCard:setLeftRight( true, false, 779, 1098 )
					VictimPlayerCard:setTopBottom( true, false, 6, 65 )
					VictimPlayerCard:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( VictimPlayerCard, event )
					else
						VictimPlayerCard:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VictimPlayerCard:completeAnimation()
				self.VictimPlayerCard:setLeftRight( true, false, 929, 1205 )
				self.VictimPlayerCard:setTopBottom( true, false, 6, 65 )
				self.VictimPlayerCard:setAlpha( 0 )
				VictimPlayerCardFrame2( VictimPlayerCard, {} )
				local AttackerPlayerCardFrame2 = function ( AttackerPlayerCard, event )
					if not event.interrupted then
						AttackerPlayerCard:beginAnimation( "keyframe", 699, true, true, CoD.TweenType.Bounce )
					end
					AttackerPlayerCard:setLeftRight( true, false, 198, 521 )
					AttackerPlayerCard:setTopBottom( true, false, 6, 65 )
					AttackerPlayerCard:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( AttackerPlayerCard, event )
					else
						AttackerPlayerCard:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AttackerPlayerCard:completeAnimation()
				self.AttackerPlayerCard:setLeftRight( true, false, 93, 360 )
				self.AttackerPlayerCard:setTopBottom( true, false, 6, 65 )
				self.AttackerPlayerCard:setAlpha( 0 )
				AttackerPlayerCardFrame2( AttackerPlayerCard, {} )
				local KillsLabel2Frame2 = function ( KillsLabel2, event )
					local KillsLabel2Frame3 = function ( KillsLabel2, event )
						if not event.interrupted then
							KillsLabel2:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
						end
						KillsLabel2:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( KillsLabel2, event )
						else
							KillsLabel2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						KillsLabel2Frame3( KillsLabel2, event )
						return 
					else
						KillsLabel2:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
						KillsLabel2:registerEventHandler( "transition_complete_keyframe", KillsLabel2Frame3 )
					end
				end
				
				KillsLabel2:completeAnimation()
				self.KillsLabel2:setAlpha( 0 )
				KillsLabel2Frame2( KillsLabel2, {} )
				local KillsLabel1Frame2 = function ( KillsLabel1, event )
					local KillsLabel1Frame3 = function ( KillsLabel1, event )
						if not event.interrupted then
							KillsLabel1:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
						end
						KillsLabel1:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( KillsLabel1, event )
						else
							KillsLabel1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						KillsLabel1Frame3( KillsLabel1, event )
						return 
					else
						KillsLabel1:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
						KillsLabel1:registerEventHandler( "transition_complete_keyframe", KillsLabel1Frame3 )
					end
				end
				
				KillsLabel1:completeAnimation()
				self.KillsLabel1:setAlpha( 0 )
				KillsLabel1Frame2( KillsLabel1, {} )
				local AttackerKillsNewFrame2 = function ( AttackerKillsNew, event )
					local AttackerKillsNewFrame3 = function ( AttackerKillsNew, event )
						if not event.interrupted then
							AttackerKillsNew:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
						end
						AttackerKillsNew:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( AttackerKillsNew, event )
						else
							AttackerKillsNew:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						AttackerKillsNewFrame3( AttackerKillsNew, event )
						return 
					else
						AttackerKillsNew:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
						AttackerKillsNew:registerEventHandler( "transition_complete_keyframe", AttackerKillsNewFrame3 )
					end
				end
				
				AttackerKillsNew:completeAnimation()
				self.AttackerKillsNew:setAlpha( 0 )
				AttackerKillsNewFrame2( AttackerKillsNew, {} )
				local VictimKillsNewFrame2 = function ( VictimKillsNew, event )
					local VictimKillsNewFrame3 = function ( VictimKillsNew, event )
						if not event.interrupted then
							VictimKillsNew:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
						end
						VictimKillsNew:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( VictimKillsNew, event )
						else
							VictimKillsNew:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						VictimKillsNewFrame3( VictimKillsNew, event )
						return 
					else
						VictimKillsNew:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
						VictimKillsNew:registerEventHandler( "transition_complete_keyframe", VictimKillsNewFrame3 )
					end
				end
				
				VictimKillsNew:completeAnimation()
				self.VictimKillsNew:setAlpha( 0 )
				VictimKillsNewFrame2( VictimKillsNew, {} )
				local VSBannerFrame2 = function ( VSBanner, event )
					local VSBannerFrame3 = function ( VSBanner, event )
						if not event.interrupted then
							VSBanner:beginAnimation( "keyframe", 279, false, false, CoD.TweenType.Linear )
						end
						VSBanner:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( VSBanner, event )
						else
							VSBanner:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						VSBannerFrame3( VSBanner, event )
						return 
					else
						VSBanner:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
						VSBanner:registerEventHandler( "transition_complete_keyframe", VSBannerFrame3 )
					end
				end
				
				VSBanner:completeAnimation()
				self.VSBanner:setAlpha( 0 )
				VSBannerFrame2( VSBanner, {} )
				local VSLabelFrame2 = function ( VSLabel, event )
					local VSLabelFrame3 = function ( VSLabel, event )
						if not event.interrupted then
							VSLabel:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
						end
						VSLabel:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( VSLabel, event )
						else
							VSLabel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						VSLabelFrame3( VSLabel, event )
						return 
					else
						VSLabel:beginAnimation( "keyframe", 649, false, false, CoD.TweenType.Linear )
						VSLabel:registerEventHandler( "transition_complete_keyframe", VSLabelFrame3 )
					end
				end
				
				VSLabel:completeAnimation()
				self.VSLabel:setAlpha( 0 )
				VSLabelFrame2( VSLabel, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Killcam",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_NEMESIS_KILLCAM )
			end
		},
		{
			stateName = "NemesisKillcam",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_NEMESIS_KILLCAM )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_NEMESIS_KILLCAM ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_NEMESIS_KILLCAM
		} )
	end )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, controller )
		if IsElementInState( element, "Killcam" ) then
			PlayClipOnElement( self, {
				elementName = "Glitch",
				clipName = "GlitchSmall1"
			}, controller )
		elseif IsElementInState( element, "NemesisKillcam" ) then
			PlayClipOnElement( self, {
				elementName = "Glitch",
				clipName = "GlitchSmall2"
			}, controller )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LeftPanelR:close()
		element.LeftPanelR0:close()
		element.YouAndKillerWidget0:close()
		element.YouAndKillerWidget00:close()
		element.VictimPlayerCard:close()
		element.AttackerPlayerCard:close()
		element.AttackerKillsNew:close()
		element.VictimKillsNew:close()
		element.VSBanner:close()
		element.Glitch:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

