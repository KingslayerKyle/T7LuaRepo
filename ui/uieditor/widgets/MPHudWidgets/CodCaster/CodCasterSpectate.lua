-- 18bb513af44f424f3360cb0fdfdfa330
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CodCaster.CodCasterLoadoutItemBackground" )
require( "ui.uieditor.widgets.CodCaster.CodCasterLoadoutItemBackgroundAngle" )
require( "ui.uieditor.widgets.CodCaster.CodCasterLoadoutListContainerContainer" )
require( "ui.uieditor.widgets.HUD.DeadSpectate.DeadSpectate_SpectatingBar" )
require( "ui.uieditor.widgets.HUD.DeadSpectate.DeadSpectate_SpectatingBarPC" )

local PostLoadFunc = function ( self, controller, menu )
	local f1_local0 = Engine.GetModelForController( controller )
	local f1_local1 = Engine.CreateModel( f1_local0, "deadSpectator" )
	local f1_local2 = Engine.CreateModel( f1_local1, "playerIndex" )
	self:subscribeToModel( Engine.CreateModel( f1_local1, "playerTeam" ), function ( model )
		local modelValue = Engine.GetModelValue( f1_local2 )
		if modelValue then
			self.teamName:setText( Engine.Localize( TeamStringFromPlayerIndex( controller, modelValue ) ) )
			self.teamColor:setRGB( TeamColorFromPlayerIndex( controller, modelValue ) )
			self.teamColorArrow:setRGB( TeamColorFromPlayerIndex( controller, modelValue ) )
		end
	end, false )
	self:subscribeToModel( f1_local2, function ( model )
		if not IsCodCasterProfileValueEqualTo( controller, "shoutcaster_qs_playercard", 1 ) then
			return 
		else
			local f3_local0 = Engine.GetModelValue( model )
			self:playClip( "SelectionChanged" )
			self:registerEventHandler( "clip_over", function ( element, event )
				self.playerName:setText( GetClientNameAndClanTag( controller, f3_local0 ) )
				self:playClip( "SelectionChangedEnd" )
				self:registerEventHandler( "clip_over", LUI.UIElement.clipOver )
			end )
		end
	end, true )
	local f1_local3 = Engine.GetModel( f1_local0, "profile.colorblindMode" )
	if f1_local3 then
		self:subscribeToModel( f1_local3, function ( model )
			local modelValue = Engine.GetModelValue( f1_local2 )
			if modelValue then
				self.teamColor:setRGB( TeamColorFromPlayerIndex( controller, modelValue ) )
				self.teamColorArrow:setRGB( TeamColorFromPlayerIndex( controller, modelValue ) )
			end
		end, false )
	end
end

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
	bg:setLeftRight( true, false, 148, 285 )
	bg:setTopBottom( true, false, 1, 73 )
	bg:setAlpha( 0 )
	self:addElement( bg )
	self.bg = bg
	
	local BG1 = CoD.CodCasterLoadoutItemBackgroundAngle.new( menu, controller )
	BG1:setLeftRight( true, false, 210, 296 )
	BG1:setTopBottom( true, false, 1, 73 )
	self:addElement( BG1 )
	self.BG1 = BG1
	
	local WhiteBG = LUI.UIImage.new()
	WhiteBG:setLeftRight( true, false, 0, 212 )
	WhiteBG:setTopBottom( true, false, 2, 73 )
	WhiteBG:setAlpha( 0 )
	WhiteBG:subscribeToGlobalModel( controller, "DeadSpectate", "playerIndex", function ( model )
		local playerIndex = Engine.GetModelValue( model )
		if playerIndex then
			WhiteBG:setRGB( TeamColorFromPlayerIndex( controller, playerIndex ) )
		end
	end )
	self:addElement( WhiteBG )
	self.WhiteBG = WhiteBG
	
	local CodCasterLoadoutListContainerContainer = CoD.CodCasterLoadoutListContainerContainer.new( menu, controller )
	CodCasterLoadoutListContainerContainer:setLeftRight( true, false, 284, 1365 )
	CodCasterLoadoutListContainerContainer:setTopBottom( true, false, -19, 53 )
	self:addElement( CodCasterLoadoutListContainerContainer )
	self.CodCasterLoadoutListContainerContainer = CodCasterLoadoutListContainerContainer
	
	local playerNameBGAccent = LUI.UIImage.new()
	playerNameBGAccent:setLeftRight( true, false, -3.3, 230 )
	playerNameBGAccent:setTopBottom( true, false, 0, 76 )
	playerNameBGAccent:setAlpha( 0.6 )
	playerNameBGAccent:setImage( RegisterImage( "uie_t7_codcaster_colorarrowbackingwhite" ) )
	playerNameBGAccent:subscribeToGlobalModel( controller, "DeadSpectate", "playerIndex", function ( model )
		local playerIndex = Engine.GetModelValue( model )
		if playerIndex then
			playerNameBGAccent:setRGB( TeamColorFromPlayerIndex( controller, playerIndex ) )
		end
	end )
	self:addElement( playerNameBGAccent )
	self.playerNameBGAccent = playerNameBGAccent
	
	local playerNameBG = LUI.UIImage.new()
	playerNameBG:setLeftRight( true, false, -3.3, 230 )
	playerNameBG:setTopBottom( true, false, 0, 76 )
	playerNameBG:setAlpha( 0.8 )
	playerNameBG:setImage( RegisterImage( "uie_t7_codcaster_colorarrowbackingwhite" ) )
	playerNameBG:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	playerNameBG:setShaderVector( 0, 1, 0, 0, 0 )
	playerNameBG:setShaderVector( 1, 1.5, 0, 0, 0 )
	playerNameBG:setShaderVector( 2, 1, 0, 0, 0 )
	playerNameBG:setShaderVector( 3, 0, 0, 0, 0 )
	playerNameBG:subscribeToGlobalModel( controller, "DeadSpectate", "playerIndex", function ( model )
		local playerIndex = Engine.GetModelValue( model )
		if playerIndex then
			playerNameBG:setRGB( TeamColorFromPlayerIndex( controller, playerIndex ) )
		end
	end )
	self:addElement( playerNameBG )
	self.playerNameBG = playerNameBG
	
	local teamNameBG = LUI.UIImage.new()
	teamNameBG:setLeftRight( true, false, 0, 228 )
	teamNameBG:setTopBottom( true, false, 2, 44 )
	teamNameBG:setAlpha( 0.85 )
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
	teamColor:setLeftRight( true, false, -4, 230 )
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
	arrow:setLeftRight( true, false, -3.3, 21.3 )
	arrow:setTopBottom( true, false, 3, 44 )
	arrow:setImage( RegisterImage( "uie_t7_codcaster_whitearrow" ) )
	self:addElement( arrow )
	self.arrow = arrow
	
	local playerName = LUI.UIText.new()
	playerName:setLeftRight( false, false, -127.65, 77 )
	playerName:setTopBottom( true, false, 14, 34 )
	playerName:setRGB( ColorSet.GroupName.r, ColorSet.GroupName.g, ColorSet.GroupName.b )
	playerName:setText( Engine.Localize( "" ) )
	playerName:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	playerName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	playerName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( playerName )
	self.playerName = playerName
	
	local teamName = LUI.UIText.new()
	teamName:setLeftRight( false, false, -128.65, 68.55 )
	teamName:setTopBottom( true, false, 51, 67 )
	teamName:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	teamName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	teamName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	teamName:subscribeToGlobalModel( controller, "DeadSpectate", "playerIndex", function ( model )
		local playerIndex = Engine.GetModelValue( model )
		if playerIndex then
			teamName:setText( TeamStringFromPlayerIndex( controller, playerIndex ) )
		end
	end )
	self:addElement( teamName )
	self.teamName = teamName
	
	local TransitionBar = LUI.UIImage.new()
	TransitionBar:setLeftRight( true, false, 0, 0 )
	TransitionBar:setTopBottom( true, false, 4, 43 )
	self:addElement( TransitionBar )
	self.TransitionBar = TransitionBar
	
	local HeroExtraCamRenderByIndex = LUI.UIImage.new()
	HeroExtraCamRenderByIndex:setLeftRight( true, false, 224.06, 296 )
	HeroExtraCamRenderByIndex:setTopBottom( true, false, 1, 71 )
	HeroExtraCamRenderByIndex:subscribeToGlobalModel( controller, "DeadSpectate", "playerIndex", function ( model )
		local playerIndex = Engine.GetModelValue( model )
		if playerIndex then
			HeroExtraCamRenderByIndex:setupCharacterExtraCamRenderForHeroIndex( GetHeroIndexForClientNum( controller, playerIndex ) )
		end
	end )
	self:addElement( HeroExtraCamRenderByIndex )
	self.HeroExtraCamRenderByIndex = HeroExtraCamRenderByIndex
	
	local GlowWhiteOver = LUI.UIImage.new()
	GlowWhiteOver:setLeftRight( true, false, 100.45, 155.45 )
	GlowWhiteOver:setTopBottom( true, false, -169.48, 219.48 )
	GlowWhiteOver:setZRot( -90 )
	GlowWhiteOver:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowWhiteOver:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowWhiteOver )
	self.GlowWhiteOver = GlowWhiteOver
	
	local GlowWhiteOver0 = LUI.UIImage.new()
	GlowWhiteOver0:setLeftRight( true, false, -147, 97 )
	GlowWhiteOver0:setTopBottom( true, false, -139.3, 189.3 )
	GlowWhiteOver0:setAlpha( 0.9 )
	GlowWhiteOver0:setZRot( -90 )
	GlowWhiteOver0:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowWhiteOver0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowWhiteOver0 )
	self.GlowWhiteOver0 = GlowWhiteOver0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 17 )

				bg:completeAnimation()
				self.bg:setAlpha( 0 )
				self.clipFinished( bg, {} )

				BG1:completeAnimation()
				self.BG1:setAlpha( 0 )
				self.clipFinished( BG1, {} )

				WhiteBG:completeAnimation()
				self.WhiteBG:setAlpha( 0 )
				self.clipFinished( WhiteBG, {} )

				CodCasterLoadoutListContainerContainer:completeAnimation()
				self.CodCasterLoadoutListContainerContainer:setAlpha( 0 )
				self.clipFinished( CodCasterLoadoutListContainerContainer, {} )

				playerNameBGAccent:completeAnimation()
				self.playerNameBGAccent:setAlpha( 0 )
				self.clipFinished( playerNameBGAccent, {} )

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

				HeroExtraCamRenderByIndex:completeAnimation()
				self.HeroExtraCamRenderByIndex:setAlpha( 0 )
				self.clipFinished( HeroExtraCamRenderByIndex, {} )

				GlowWhiteOver:completeAnimation()
				self.GlowWhiteOver:setAlpha( 0 )
				self.clipFinished( GlowWhiteOver, {} )

				GlowWhiteOver0:completeAnimation()
				self.GlowWhiteOver0:setAlpha( 0 )
				self.clipFinished( GlowWhiteOver0, {} )
			end,
			SelectionChanged = function ()
				self:setupElementClipCounter( 9 )

				bg:completeAnimation()
				self.bg:setAlpha( 0 )
				self.clipFinished( bg, {} )

				BG1:completeAnimation()
				self.BG1:setAlpha( 1 )
				self.clipFinished( BG1, {} )

				playerNameBGAccent:completeAnimation()
				self.playerNameBGAccent:setAlpha( 0.6 )
				self.clipFinished( playerNameBGAccent, {} )

				playerNameBG:completeAnimation()
				self.playerNameBG:setAlpha( 0.8 )
				self.clipFinished( playerNameBG, {} )
				local teamColorArrowFrame2 = function ( teamColorArrow, event )
					if not event.interrupted then
						teamColorArrow:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					teamColorArrow:setLeftRight( true, false, 205.18, 390.82 )
					teamColorArrow:setTopBottom( true, false, 3, 44 )
					teamColorArrow:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( teamColorArrow, event )
					else
						teamColorArrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				teamColorArrow:completeAnimation()
				self.teamColorArrow:setLeftRight( true, false, -3.94, 181.7 )
				self.teamColorArrow:setTopBottom( true, false, 3, 44 )
				self.teamColorArrow:setAlpha( 1 )
				teamColorArrowFrame2( teamColorArrow, {} )

				teamColor:completeAnimation()
				self.teamColor:setAlpha( 1 )
				self.clipFinished( teamColor, {} )
				local arrowFrame2 = function ( arrow, event )
					if not event.interrupted then
						arrow:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					arrow:setLeftRight( true, false, 202.4, 227 )
					arrow:setTopBottom( true, false, 3, 44 )
					arrow:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( arrow, event )
					else
						arrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				arrow:completeAnimation()
				self.arrow:setLeftRight( true, false, -3.3, 21.3 )
				self.arrow:setTopBottom( true, false, 3, 44 )
				self.arrow:setAlpha( 1 )
				arrowFrame2( arrow, {} )

				teamName:completeAnimation()
				self.teamName:setRGB( 1, 1, 1 )
				self.clipFinished( teamName, {} )
				local TransitionBarFrame2 = function ( TransitionBar, event )
					if not event.interrupted then
						TransitionBar:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					TransitionBar:setLeftRight( true, false, 0, 206.18 )
					TransitionBar:setTopBottom( true, false, 4, 43 )
					if event.interrupted then
						self.clipFinished( TransitionBar, event )
					else
						TransitionBar:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TransitionBar:completeAnimation()
				self.TransitionBar:setLeftRight( true, false, 0, 0 )
				self.TransitionBar:setTopBottom( true, false, 4, 43 )
				TransitionBarFrame2( TransitionBar, {} )
			end,
			SelectionChangedEnd = function ()
				self:setupElementClipCounter( 8 )

				BG1:completeAnimation()
				self.BG1:setAlpha( 1 )
				self.clipFinished( BG1, {} )

				playerNameBGAccent:completeAnimation()
				self.playerNameBGAccent:setAlpha( 0.6 )
				self.clipFinished( playerNameBGAccent, {} )

				playerNameBG:completeAnimation()
				self.playerNameBG:setAlpha( 0.8 )
				self.clipFinished( playerNameBG, {} )
				local teamColorArrowFrame2 = function ( teamColorArrow, event )
					if not event.interrupted then
						teamColorArrow:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					teamColorArrow:setLeftRight( true, false, -3.94, 181.7 )
					teamColorArrow:setTopBottom( true, false, 3, 44 )
					teamColorArrow:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( teamColorArrow, event )
					else
						teamColorArrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				teamColorArrow:completeAnimation()
				self.teamColorArrow:setLeftRight( true, false, 205.18, 390.82 )
				self.teamColorArrow:setTopBottom( true, false, 3, 44 )
				self.teamColorArrow:setAlpha( 1 )
				teamColorArrowFrame2( teamColorArrow, {} )

				teamColor:completeAnimation()
				self.teamColor:setAlpha( 1 )
				self.clipFinished( teamColor, {} )
				local arrowFrame2 = function ( arrow, event )
					if not event.interrupted then
						arrow:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					arrow:setLeftRight( true, false, -3.3, 21.3 )
					arrow:setTopBottom( true, false, 3, 44 )
					arrow:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( arrow, event )
					else
						arrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				arrow:completeAnimation()
				self.arrow:setLeftRight( true, false, 202.4, 227 )
				self.arrow:setTopBottom( true, false, 3, 44 )
				self.arrow:setAlpha( 1 )
				arrowFrame2( arrow, {} )

				teamName:completeAnimation()
				self.teamName:setRGB( 1, 1, 1 )
				self.clipFinished( teamName, {} )
				local TransitionBarFrame2 = function ( TransitionBar, event )
					if not event.interrupted then
						TransitionBar:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					TransitionBar:setLeftRight( true, false, 0, 0 )
					TransitionBar:setTopBottom( true, false, 4, 43 )
					if event.interrupted then
						self.clipFinished( TransitionBar, event )
					else
						TransitionBar:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TransitionBar:completeAnimation()
				self.TransitionBar:setLeftRight( true, false, 0, 206.18 )
				self.TransitionBar:setTopBottom( true, false, 4, 43 )
				TransitionBarFrame2( TransitionBar, {} )
			end
		},
		ShowWithSpecialist = {
			DefaultClip = function ()
				self:setupElementClipCounter( 17 )

				bg:completeAnimation()
				self.bg:setLeftRight( true, false, 159, 296 )
				self.bg:setTopBottom( true, false, 1, 73 )
				self.bg:setAlpha( 0 )
				self.clipFinished( bg, {} )

				BG1:completeAnimation()
				self.BG1:setAlpha( 1 )
				self.clipFinished( BG1, {} )

				WhiteBG:completeAnimation()
				self.WhiteBG:setAlpha( 0 )
				self.clipFinished( WhiteBG, {} )

				CodCasterLoadoutListContainerContainer:completeAnimation()
				self.CodCasterLoadoutListContainerContainer:setAlpha( 1 )
				self.clipFinished( CodCasterLoadoutListContainerContainer, {} )

				playerNameBGAccent:completeAnimation()
				self.playerNameBGAccent:setAlpha( 0.6 )
				self.clipFinished( playerNameBGAccent, {} )

				playerNameBG:completeAnimation()
				self.playerNameBG:setAlpha( 0.8 )
				self.clipFinished( playerNameBG, {} )

				teamNameBG:completeAnimation()
				self.teamNameBG:setAlpha( 0.85 )
				self.clipFinished( teamNameBG, {} )

				teamColorArrow:completeAnimation()
				self.teamColorArrow:setAlpha( 1 )
				self.clipFinished( teamColorArrow, {} )

				teamColor:completeAnimation()
				self.teamColor:setAlpha( 1 )
				self.clipFinished( teamColor, {} )

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
				self.teamName:setRGB( 1, 1, 1 )
				self.teamName:setAlpha( 1 )
				self.clipFinished( teamName, {} )

				HeroExtraCamRenderByIndex:completeAnimation()
				self.HeroExtraCamRenderByIndex:setAlpha( 1 )
				self.clipFinished( HeroExtraCamRenderByIndex, {} )

				GlowWhiteOver:completeAnimation()
				self.GlowWhiteOver:setAlpha( 0 )
				self.clipFinished( GlowWhiteOver, {} )

				GlowWhiteOver0:completeAnimation()
				self.GlowWhiteOver0:setAlpha( 0 )
				self.clipFinished( GlowWhiteOver0, {} )
			end,
			SelectionChanged = function ()
				self:setupElementClipCounter( 10 )

				BG1:completeAnimation()
				self.BG1:setAlpha( 1 )
				self.clipFinished( BG1, {} )

				playerNameBGAccent:completeAnimation()
				self.playerNameBGAccent:setAlpha( 0.6 )
				self.clipFinished( playerNameBGAccent, {} )

				playerNameBG:completeAnimation()
				self.playerNameBG:setAlpha( 0.8 )
				self.clipFinished( playerNameBG, {} )

				teamColorArrow:completeAnimation()
				self.teamColorArrow:setLeftRight( true, false, -3.94, 181.7 )
				self.teamColorArrow:setTopBottom( true, false, 3, 44 )
				self.teamColorArrow:setAlpha( 1 )
				self.clipFinished( teamColorArrow, {} )

				teamColor:completeAnimation()
				self.teamColor:setAlpha( 1 )
				self.clipFinished( teamColor, {} )

				arrow:completeAnimation()
				self.arrow:setLeftRight( true, false, -3.3, 21.3 )
				self.arrow:setTopBottom( true, false, 3, 44 )
				self.arrow:setAlpha( 1 )
				self.clipFinished( arrow, {} )

				teamName:completeAnimation()
				self.teamName:setRGB( 1, 1, 1 )
				self.clipFinished( teamName, {} )

				TransitionBar:completeAnimation()
				self.TransitionBar:setLeftRight( true, false, 0, 0 )
				self.TransitionBar:setTopBottom( true, false, 4, 43 )
				self.clipFinished( TransitionBar, {} )
				local GlowWhiteOverFrame2 = function ( GlowWhiteOver, event )
					if not event.interrupted then
						GlowWhiteOver:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					GlowWhiteOver:setLeftRight( true, false, 100.45, 155.45 )
					GlowWhiteOver:setTopBottom( true, false, -169.48, 219.48 )
					GlowWhiteOver:setAlpha( 1 )
					GlowWhiteOver:setScale( 1 )
					if event.interrupted then
						self.clipFinished( GlowWhiteOver, event )
					else
						GlowWhiteOver:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GlowWhiteOver:completeAnimation()
				self.GlowWhiteOver:setLeftRight( true, false, 100.45, 155.45 )
				self.GlowWhiteOver:setTopBottom( true, false, -169.48, 219.48 )
				self.GlowWhiteOver:setAlpha( 0 )
				self.GlowWhiteOver:setScale( 1 )
				GlowWhiteOverFrame2( GlowWhiteOver, {} )
				local GlowWhiteOver0Frame2 = function ( GlowWhiteOver0, event )
					if not event.interrupted then
						GlowWhiteOver0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					GlowWhiteOver0:setAlpha( 0.9 )
					if event.interrupted then
						self.clipFinished( GlowWhiteOver0, event )
					else
						GlowWhiteOver0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GlowWhiteOver0:completeAnimation()
				self.GlowWhiteOver0:setAlpha( 0 )
				GlowWhiteOver0Frame2( GlowWhiteOver0, {} )
			end,
			SelectionChangedEnd = function ()
				self:setupElementClipCounter( 10 )

				BG1:completeAnimation()
				self.BG1:setAlpha( 1 )
				self.clipFinished( BG1, {} )

				playerNameBGAccent:completeAnimation()
				self.playerNameBGAccent:setAlpha( 0.6 )
				self.clipFinished( playerNameBGAccent, {} )

				playerNameBG:completeAnimation()
				self.playerNameBG:setAlpha( 0.8 )
				self.clipFinished( playerNameBG, {} )

				teamColorArrow:completeAnimation()
				self.teamColorArrow:setLeftRight( true, false, -3.94, 181.7 )
				self.teamColorArrow:setTopBottom( true, false, 3, 44 )
				self.clipFinished( teamColorArrow, {} )

				teamColor:completeAnimation()
				self.teamColor:setAlpha( 1 )
				self.clipFinished( teamColor, {} )

				arrow:completeAnimation()
				self.arrow:setLeftRight( true, false, -3.3, 21.3 )
				self.arrow:setTopBottom( true, false, 3, 44 )
				self.clipFinished( arrow, {} )

				teamName:completeAnimation()
				self.teamName:setRGB( 1, 1, 1 )
				self.clipFinished( teamName, {} )

				TransitionBar:completeAnimation()
				self.TransitionBar:setLeftRight( true, false, 0, 0 )
				self.TransitionBar:setTopBottom( true, false, 4, 43 )
				self.clipFinished( TransitionBar, {} )
				local GlowWhiteOverFrame2 = function ( GlowWhiteOver, event )
					if not event.interrupted then
						GlowWhiteOver:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
					end
					GlowWhiteOver:setLeftRight( true, false, 100.45, 155.45 )
					GlowWhiteOver:setTopBottom( true, false, -169.48, 219.48 )
					GlowWhiteOver:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( GlowWhiteOver, event )
					else
						GlowWhiteOver:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GlowWhiteOver:completeAnimation()
				self.GlowWhiteOver:setLeftRight( true, false, 100.45, 155.45 )
				self.GlowWhiteOver:setTopBottom( true, false, -169.48, 219.48 )
				self.GlowWhiteOver:setAlpha( 1 )
				GlowWhiteOverFrame2( GlowWhiteOver, {} )
				local GlowWhiteOver0Frame2 = function ( GlowWhiteOver0, event )
					if not event.interrupted then
						GlowWhiteOver0:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
					end
					GlowWhiteOver0:setAlpha( 0 )
					GlowWhiteOver0:setScale( 1.3 )
					if event.interrupted then
						self.clipFinished( GlowWhiteOver0, event )
					else
						GlowWhiteOver0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GlowWhiteOver0:completeAnimation()
				self.GlowWhiteOver0:setAlpha( 0.9 )
				self.GlowWhiteOver0:setScale( 1 )
				GlowWhiteOver0Frame2( GlowWhiteOver0, {} )
			end
		},
		ShowWithoutSpecialist = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )

				bg:completeAnimation()
				self.bg:setAlpha( 0 )
				self.clipFinished( bg, {} )

				BG1:completeAnimation()
				self.BG1:setAlpha( 1 )
				self.clipFinished( BG1, {} )

				WhiteBG:completeAnimation()
				self.WhiteBG:setAlpha( 0 )
				self.clipFinished( WhiteBG, {} )

				CodCasterLoadoutListContainerContainer:completeAnimation()
				self.CodCasterLoadoutListContainerContainer:setLeftRight( true, false, 226, 1308 )
				self.CodCasterLoadoutListContainerContainer:setTopBottom( true, false, -19, 53 )
				self.CodCasterLoadoutListContainerContainer:setAlpha( 1 )
				self.clipFinished( CodCasterLoadoutListContainerContainer, {} )

				playerNameBG:completeAnimation()
				self.playerNameBG:setAlpha( 0.8 )
				self.clipFinished( playerNameBG, {} )

				teamNameBG:completeAnimation()
				self.teamNameBG:setAlpha( 0.85 )
				self.clipFinished( teamNameBG, {} )

				teamColor:completeAnimation()
				self.teamColor:setAlpha( 1 )
				self.clipFinished( teamColor, {} )

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
				self.teamName:setRGB( 1, 1, 1 )
				self.teamName:setAlpha( 1 )
				self.clipFinished( teamName, {} )

				HeroExtraCamRenderByIndex:completeAnimation()
				self.HeroExtraCamRenderByIndex:setAlpha( 0 )
				self.clipFinished( HeroExtraCamRenderByIndex, {} )
			end,
			SelectionChanged = function ()
				self:setupElementClipCounter( 10 )

				BG1:completeAnimation()
				self.BG1:setAlpha( 1 )
				self.clipFinished( BG1, {} )

				playerNameBGAccent:completeAnimation()
				self.playerNameBGAccent:setAlpha( 0.6 )
				self.clipFinished( playerNameBGAccent, {} )

				playerNameBG:completeAnimation()
				self.playerNameBG:setAlpha( 0.8 )
				self.clipFinished( playerNameBG, {} )

				teamColorArrow:completeAnimation()
				self.teamColorArrow:setLeftRight( true, false, -3.94, 181.7 )
				self.teamColorArrow:setTopBottom( true, false, 3, 44 )
				self.clipFinished( teamColorArrow, {} )

				teamColor:completeAnimation()
				self.teamColor:setAlpha( 1 )
				self.clipFinished( teamColor, {} )

				arrow:completeAnimation()
				self.arrow:setLeftRight( true, false, -3.3, 21.3 )
				self.arrow:setTopBottom( true, false, 3, 44 )
				self.arrow:setAlpha( 1 )
				self.clipFinished( arrow, {} )

				teamName:completeAnimation()
				self.teamName:setRGB( 1, 1, 1 )
				self.clipFinished( teamName, {} )

				TransitionBar:completeAnimation()
				self.TransitionBar:setLeftRight( true, false, 0, 0 )
				self.TransitionBar:setTopBottom( true, false, 4, 43 )
				self.clipFinished( TransitionBar, {} )
				local GlowWhiteOverFrame2 = function ( GlowWhiteOver, event )
					if not event.interrupted then
						GlowWhiteOver:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					GlowWhiteOver:setLeftRight( true, false, 100.45, 155.45 )
					GlowWhiteOver:setTopBottom( true, false, -169.48, 219.48 )
					GlowWhiteOver:setAlpha( 1 )
					GlowWhiteOver:setScale( 1 )
					if event.interrupted then
						self.clipFinished( GlowWhiteOver, event )
					else
						GlowWhiteOver:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GlowWhiteOver:completeAnimation()
				self.GlowWhiteOver:setLeftRight( true, false, 100.45, 155.45 )
				self.GlowWhiteOver:setTopBottom( true, false, -169.48, 219.48 )
				self.GlowWhiteOver:setAlpha( 0 )
				self.GlowWhiteOver:setScale( 1 )
				GlowWhiteOverFrame2( GlowWhiteOver, {} )
				local GlowWhiteOver0Frame2 = function ( GlowWhiteOver0, event )
					if not event.interrupted then
						GlowWhiteOver0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					GlowWhiteOver0:setAlpha( 0.9 )
					if event.interrupted then
						self.clipFinished( GlowWhiteOver0, event )
					else
						GlowWhiteOver0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GlowWhiteOver0:completeAnimation()
				self.GlowWhiteOver0:setAlpha( 0 )
				GlowWhiteOver0Frame2( GlowWhiteOver0, {} )
			end,
			SelectionChangedEnd = function ()
				self:setupElementClipCounter( 10 )

				BG1:completeAnimation()
				self.BG1:setAlpha( 1 )
				self.clipFinished( BG1, {} )

				playerNameBGAccent:completeAnimation()
				self.playerNameBGAccent:setAlpha( 0.6 )
				self.clipFinished( playerNameBGAccent, {} )

				playerNameBG:completeAnimation()
				self.playerNameBG:setAlpha( 0.8 )
				self.clipFinished( playerNameBG, {} )

				teamColorArrow:completeAnimation()
				self.teamColorArrow:setLeftRight( true, false, -3.94, 181.7 )
				self.teamColorArrow:setTopBottom( true, false, 3, 44 )
				self.clipFinished( teamColorArrow, {} )

				teamColor:completeAnimation()
				self.teamColor:setAlpha( 1 )
				self.clipFinished( teamColor, {} )

				arrow:completeAnimation()
				self.arrow:setLeftRight( true, false, -3.3, 21.3 )
				self.arrow:setTopBottom( true, false, 3, 44 )
				self.arrow:setAlpha( 1 )
				self.clipFinished( arrow, {} )

				teamName:completeAnimation()
				self.teamName:setRGB( 1, 1, 1 )
				self.clipFinished( teamName, {} )

				TransitionBar:completeAnimation()
				self.TransitionBar:setLeftRight( true, false, 0, 0 )
				self.TransitionBar:setTopBottom( true, false, 4, 43 )
				self.clipFinished( TransitionBar, {} )
				local GlowWhiteOverFrame2 = function ( GlowWhiteOver, event )
					if not event.interrupted then
						GlowWhiteOver:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
					end
					GlowWhiteOver:setLeftRight( true, false, 100.45, 155.45 )
					GlowWhiteOver:setTopBottom( true, false, -169.48, 219.48 )
					GlowWhiteOver:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( GlowWhiteOver, event )
					else
						GlowWhiteOver:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GlowWhiteOver:completeAnimation()
				self.GlowWhiteOver:setLeftRight( true, false, 100.45, 155.45 )
				self.GlowWhiteOver:setTopBottom( true, false, -169.48, 219.48 )
				self.GlowWhiteOver:setAlpha( 1 )
				GlowWhiteOverFrame2( GlowWhiteOver, {} )
				local GlowWhiteOver0Frame2 = function ( GlowWhiteOver0, event )
					if not event.interrupted then
						GlowWhiteOver0:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
					end
					GlowWhiteOver0:setAlpha( 0 )
					GlowWhiteOver0:setScale( 1.3 )
					if event.interrupted then
						self.clipFinished( GlowWhiteOver0, event )
					else
						GlowWhiteOver0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GlowWhiteOver0:completeAnimation()
				self.GlowWhiteOver0:setAlpha( 0.9 )
				self.GlowWhiteOver0:setScale( 1 )
				GlowWhiteOver0Frame2( GlowWhiteOver0, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "ShowWithSpecialist",
			condition = function ( menu, element, event )
				local f37_local0 = IsCodCasterProfileValueEqualTo( controller, "shoutcaster_lo_specialist", 1 )
				if f37_local0 then
					if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) then
						f37_local0 = IsCodCasterProfileValueEqualTo( controller, "shoutcaster_qs_playercard", 1 )
					else
						f37_local0 = false
					end
				end
				return f37_local0
			end
		},
		{
			stateName = "ShowWithoutSpecialist",
			condition = function ( menu, element, event )
				local f38_local0
				if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) then
					f38_local0 = IsCodCasterProfileValueEqualTo( controller, "shoutcaster_qs_playercard", 1 )
				else
					f38_local0 = false
				end
				return f38_local0
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
		element.BG1:close()
		element.CodCasterLoadoutListContainerContainer:close()
		element.spectatingBar:close()
		element.DeadSpectateSpectatingBarPC:close()
		element.WhiteBG:close()
		element.playerNameBGAccent:close()
		element.playerNameBG:close()
		element.teamColorArrow:close()
		element.teamColor:close()
		element.teamName:close()
		element.HeroExtraCamRenderByIndex:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

