-- e7b9dfd28291df6a7982e9dcc6f41fb5
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ListHeaderGlow" )
require( "ui.uieditor.widgets.Lobby.Common.FE_SlideSubHeader" )
require( "ui.uieditor.widgets.Arena.ArenaStarbig" )
require( "ui.uieditor.widgets.Arena.ArenaRankSmall" )
require( "ui.uieditor.widgets.Arena.LoopingstarAnimationTest" )

local PostLoadFunc = function ( self, controller, menu )
	local f1_local0 = 0
	self:linkToElementModel( self, "newSeasonPoints", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			f1_local0 = modelValue
		end
	end )
	local f1_local1 = 0
	local f1_local2 = false
	self.LoopingstarAnimationTest0:registerEventHandler( "clip_over", function ( element, event )
		if element.currentState ~= "DefaultState" then
			if f1_local1 < f1_local0 then
				f1_local1 = f1_local1 + 1
				self.starcounts:setText( tostring( f1_local1 ) )
			end
			if element.currentState == "StopAnimation" then
				if f1_local2 then
					self:dispatchEventToParent( {
						name = "bonus_stars_clip_over"
					} )
				else
					element:playClip( "FadeOut" )
					f1_local2 = true
				end
			elseif f1_local1 + 1 < f1_local0 then
				if element.currentState == "StarLoop" then
					element:playClip( "DefaultClip" )
				else
					element:setState( "StarLoop" )
				end
			else
				element:setState( "StopAnimation" )
			end
		end
	end )
	self:registerEventHandler( "clip_over", function ( element, event )
		local f4_local0 = element.currentClipIsTransitionClip
		if element.nextClip then
			element:playClip( element.nextClip )
		end
		if element.currentState == "BonusStars" then
			if f4_local0 then
				element:dispatchEventToParent( {
					name = "bonus_stars_clip_start"
				} )
			else
				self.LoopingstarAnimationTest0:setState( "StarIntro" )
			end
		end
	end )
end

CoD.ArenaResultWidget = InheritFrom( LUI.UIElement )
CoD.ArenaResultWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ArenaResultWidget )
	self.id = "ArenaResultWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 219 )
	self:setTopBottom( true, false, 0, 225 )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgIdle = LUI.UIImage.new()
	BoxButtonLrgIdle:setLeftRight( false, false, -85.25, 86.25 )
	BoxButtonLrgIdle:setTopBottom( false, false, -122.63, 48.88 )
	BoxButtonLrgIdle:setAlpha( 0 )
	BoxButtonLrgIdle:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrgidlefull" ) )
	BoxButtonLrgIdle:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	BoxButtonLrgIdle:setShaderVector( 0, 0.12, 0.12, 0, 0 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local RankImageBorder = CoD.FE_TitleNumBrdr.new( menu, controller )
	RankImageBorder:setLeftRight( false, false, -79, 78 )
	RankImageBorder:setTopBottom( false, false, -113.38, 48.88 )
	self:addElement( RankImageBorder )
	self.RankImageBorder = RankImageBorder
	
	local PlayListBG = CoD.FE_ListHeaderGlow.new( menu, controller )
	PlayListBG:setLeftRight( false, false, -79, 78 )
	PlayListBG:setTopBottom( false, false, 56.13, 75.13 )
	self:addElement( PlayListBG )
	self.PlayListBG = PlayListBG
	
	local Backing = LUI.UIImage.new()
	Backing:setLeftRight( false, false, -78, 77 )
	Backing:setTopBottom( false, false, 77.13, 96.63 )
	Backing:setRGB( 0, 0, 0 )
	Backing:setAlpha( 0.8 )
	self:addElement( Backing )
	self.Backing = Backing
	
	local RankFrame = CoD.FE_SlideSubHeader.new( menu, controller )
	RankFrame:setLeftRight( false, false, -79, 78 )
	RankFrame:setTopBottom( false, false, 76.63, 98.63 )
	RankFrame.FELabelSubHeadingD0.Label0:setText( Engine.Localize( "" ) )
	self:addElement( RankFrame )
	self.RankFrame = RankFrame
	
	local PlayListName = LUI.UIText.new()
	PlayListName:setLeftRight( false, false, -79, 78 )
	PlayListName:setTopBottom( false, false, 56.13, 75.13 )
	PlayListName:setRGB( 0, 0, 0 )
	PlayListName:setTTF( "fonts/escom.ttf" )
	PlayListName:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	PlayListName:setShaderVector( 0, 0.06, 0, 0, 0 )
	PlayListName:setShaderVector( 1, 0.02, 0, 0, 0 )
	PlayListName:setShaderVector( 2, 1, 0, 0, 0 )
	PlayListName:setLetterSpacing( 1 )
	PlayListName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	PlayListName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( PlayListName )
	self.PlayListName = PlayListName
	
	local HiddenRankText = LUI.UIText.new()
	HiddenRankText:setLeftRight( false, false, -79, 78 )
	HiddenRankText:setTopBottom( false, false, 72.63, 98.63 )
	HiddenRankText:setRGB( 0.76, 0.83, 0.85 )
	HiddenRankText:setAlpha( 0 )
	HiddenRankText:setText( Engine.Localize( "--" ) )
	HiddenRankText:setTTF( "fonts/escom.ttf" )
	HiddenRankText:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	HiddenRankText:setShaderVector( 0, 0.2, 1, 0, 0 )
	HiddenRankText:setShaderVector( 1, 0, 0, 0, 0 )
	HiddenRankText:setShaderVector( 2, 0, 0, 0, 0 )
	HiddenRankText:setShaderVector( 3, 0, 0, 0, 0 )
	HiddenRankText:setShaderVector( 4, 0, 0, 0, 0 )
	HiddenRankText:setLetterSpacing( 1 )
	HiddenRankText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	HiddenRankText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( HiddenRankText )
	self.HiddenRankText = HiddenRankText
	
	local CurrentStars = LUI.UIList.new( menu, controller, 1, 0, nil, false, false, 0, -14, false, false )
	CurrentStars:makeFocusable()
	CurrentStars:setLeftRight( false, false, -122.5, 122.5 )
	CurrentStars:setTopBottom( false, false, 107.63, 133.63 )
	CurrentStars:setAlpha( 0 )
	CurrentStars:setScale( 0.7 )
	CurrentStars:setWidgetType( CoD.ArenaStarbig )
	CurrentStars:setHorizontalCount( 6 )
	CurrentStars:setSpacing( 1 )
	self:addElement( CurrentStars )
	self.CurrentStars = CurrentStars
	
	local CurrentRankText = LUI.UIText.new()
	CurrentRankText:setLeftRight( false, false, -79, 78 )
	CurrentRankText:setTopBottom( false, false, 77.13, 96.13 )
	CurrentRankText:setRGB( 0.76, 0.83, 0.85 )
	CurrentRankText:setTTF( "fonts/escom.ttf" )
	CurrentRankText:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	CurrentRankText:setShaderVector( 0, 0.05, 1, 0, 0 )
	CurrentRankText:setShaderVector( 1, 0, 0, 0, 0 )
	CurrentRankText:setShaderVector( 2, 0, 0, 0, 0 )
	CurrentRankText:setShaderVector( 3, 0, 0, 0, 0 )
	CurrentRankText:setShaderVector( 4, 0, 0, 0, 0 )
	CurrentRankText:setLetterSpacing( 1 )
	CurrentRankText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	CurrentRankText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( CurrentRankText )
	self.CurrentRankText = CurrentRankText
	
	local highlight1 = LUI.UIImage.new()
	highlight1:setLeftRight( false, false, -58.5, 58.5 )
	highlight1:setTopBottom( false, false, -109.88, 3.13 )
	highlight1:setAlpha( 0 )
	highlight1:setZRot( 108 )
	highlight1:setScale( 2.59 )
	highlight1:setImage( RegisterImage( "uie_t7_hud_notficationhighlight" ) )
	highlight1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( highlight1 )
	self.highlight1 = highlight1
	
	local highlight00 = LUI.UIImage.new()
	highlight00:setLeftRight( false, false, -58.5, 58.5 )
	highlight00:setTopBottom( false, false, -109.88, 3.13 )
	highlight00:setRGB( 0.62, 0.49, 0.05 )
	highlight00:setAlpha( 0 )
	highlight00:setZRot( 221 )
	highlight00:setScale( 1.89 )
	highlight00:setImage( RegisterImage( "uie_t7_hud_notficationhighlight" ) )
	highlight00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( highlight00 )
	self.highlight00 = highlight00
	
	local highlight0 = LUI.UIImage.new()
	highlight0:setLeftRight( false, false, -58.5, 58.5 )
	highlight0:setTopBottom( false, false, -109.88, 3.13 )
	highlight0:setRGB( 0.62, 0.49, 0.05 )
	highlight0:setAlpha( 0 )
	highlight0:setZRot( 325 )
	highlight0:setImage( RegisterImage( "uie_t7_hud_notficationhighlight" ) )
	highlight0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( highlight0 )
	self.highlight0 = highlight0
	
	local highlight = LUI.UIImage.new()
	highlight:setLeftRight( false, false, -58.5, 58.5 )
	highlight:setTopBottom( false, false, -109.88, 3.13 )
	highlight:setAlpha( 0 )
	highlight:setZRot( 108 )
	highlight:setScale( 3.3 )
	highlight:setImage( RegisterImage( "uie_t7_hud_notficationhighlight" ) )
	highlight:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( highlight )
	self.highlight = highlight
	
	local CurrentRank = CoD.ArenaRankSmall.new( menu, controller )
	CurrentRank:setLeftRight( false, false, -74, 74 )
	CurrentRank:setTopBottom( false, false, -106.38, 41.63 )
	self:addElement( CurrentRank )
	self.CurrentRank = CurrentRank
	
	local CurrentRankADD = LUI.UIImage.new()
	CurrentRankADD:setLeftRight( false, false, -74, 74 )
	CurrentRankADD:setTopBottom( false, false, -106.38, 41.63 )
	CurrentRankADD:setAlpha( 0 )
	CurrentRankADD:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
	CurrentRankADD:setShaderVector( 0, 2, 0, 0, 0 )
	CurrentRankADD:setShaderVector( 1, 1, 0, 0, 0 )
	CurrentRankADD:setShaderVector( 2, 0.03, 0, 0, 0 )
	self:addElement( CurrentRankADD )
	self.CurrentRankADD = CurrentRankADD
	
	local PreviousStars = LUI.UIList.new( menu, controller, 1, 0, nil, false, false, 0, -9, false, false )
	PreviousStars:makeFocusable()
	PreviousStars:setLeftRight( false, false, -122.5, 122.5 )
	PreviousStars:setTopBottom( false, false, 103.13, 134.13 )
	PreviousStars:setAlpha( 0 )
	PreviousStars:setScale( 0.7 )
	PreviousStars:setWidgetType( CoD.ArenaStarbig )
	PreviousStars:setHorizontalCount( 6 )
	PreviousStars:setSpacing( 1 )
	self:addElement( PreviousStars )
	self.PreviousStars = PreviousStars
	
	local PreviousRankText = LUI.UIText.new()
	PreviousRankText:setLeftRight( false, false, -79, 78 )
	PreviousRankText:setTopBottom( false, false, 77.13, 96.13 )
	PreviousRankText:setRGB( 0.76, 0.83, 0.85 )
	PreviousRankText:setAlpha( 0 )
	PreviousRankText:setTTF( "fonts/escom.ttf" )
	PreviousRankText:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	PreviousRankText:setShaderVector( 0, 0.2, 1, 0, 0 )
	PreviousRankText:setShaderVector( 1, 0, 0, 0, 0 )
	PreviousRankText:setShaderVector( 2, 0, 0, 0, 0 )
	PreviousRankText:setShaderVector( 3, 0, 0, 0, 0 )
	PreviousRankText:setShaderVector( 4, 0, 0, 0, 0 )
	PreviousRankText:setLetterSpacing( 1 )
	PreviousRankText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	PreviousRankText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( PreviousRankText )
	self.PreviousRankText = PreviousRankText
	
	local PreviousRankAdd = CoD.ArenaRankSmall.new( menu, controller )
	PreviousRankAdd:setLeftRight( false, false, -74, 74 )
	PreviousRankAdd:setTopBottom( false, false, -106.38, 41.63 )
	PreviousRankAdd:setAlpha( 0 )
	self:addElement( PreviousRankAdd )
	self.PreviousRankAdd = PreviousRankAdd
	
	local CurrentRankR1 = LUI.UIImage.new()
	CurrentRankR1:setLeftRight( false, false, 74, 222 )
	CurrentRankR1:setTopBottom( false, false, -106.38, 41.63 )
	CurrentRankR1:setRGB( 0.49, 0, 0 )
	CurrentRankR1:setAlpha( 0 )
	CurrentRankR1:setScale( 2 )
	CurrentRankR1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
	CurrentRankR1:setShaderVector( 0, 2, 0, 0, 0 )
	CurrentRankR1:setShaderVector( 1, 1, 0, 0, 0 )
	CurrentRankR1:setShaderVector( 2, 0.03, 0, 0, 0 )
	self:addElement( CurrentRankR1 )
	self.CurrentRankR1 = CurrentRankR1
	
	local CurrentRankL1 = LUI.UIImage.new()
	CurrentRankL1:setLeftRight( false, false, -227, -79 )
	CurrentRankL1:setTopBottom( false, false, -117.38, 30.63 )
	CurrentRankL1:setRGB( 0.06, 0.58, 0 )
	CurrentRankL1:setAlpha( 0 )
	CurrentRankL1:setScale( 2 )
	CurrentRankL1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
	CurrentRankL1:setShaderVector( 0, 2, 0, 0, 0 )
	CurrentRankL1:setShaderVector( 1, 1, 0, 0, 0 )
	CurrentRankL1:setShaderVector( 2, 0.03, 0, 0, 0 )
	self:addElement( CurrentRankL1 )
	self.CurrentRankL1 = CurrentRankL1
	
	local CurrentRankC1 = LUI.UIImage.new()
	CurrentRankC1:setLeftRight( false, false, -74, 74 )
	CurrentRankC1:setTopBottom( false, false, -106.38, 41.63 )
	CurrentRankC1:setRGB( 0, 0.03, 0.49 )
	CurrentRankC1:setAlpha( 0 )
	CurrentRankC1:setScale( 2 )
	CurrentRankC1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
	CurrentRankC1:setShaderVector( 0, 2, 0, 0, 0 )
	CurrentRankC1:setShaderVector( 1, 1, 0, 0, 0 )
	CurrentRankC1:setShaderVector( 2, 0.03, 0, 0, 0 )
	self:addElement( CurrentRankC1 )
	self.CurrentRankC1 = CurrentRankC1
	
	local CurrentRankglint = CoD.ArenaRankSmall.new( menu, controller )
	CurrentRankglint:setLeftRight( false, false, -74, 74 )
	CurrentRankglint:setTopBottom( false, false, -106.38, 41.63 )
	CurrentRankglint:setRGB( 1, 0.8, 0 )
	CurrentRankglint:setAlpha( 0 )
	CurrentRankglint:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint_reveal" ) )
	CurrentRankglint:setShaderVector( 0, 1, 0, 0, 0 )
	self:addElement( CurrentRankglint )
	self.CurrentRankglint = CurrentRankglint
	
	local LoopingstarAnimationTest0 = CoD.LoopingstarAnimationTest.new( menu, controller )
	LoopingstarAnimationTest0:setLeftRight( false, false, -79, 78 )
	LoopingstarAnimationTest0:setTopBottom( false, false, -113.38, 48.88 )
	self:addElement( LoopingstarAnimationTest0 )
	self.LoopingstarAnimationTest0 = LoopingstarAnimationTest0
	
	local starcounts = LUI.UIText.new()
	starcounts:setLeftRight( false, false, -44.5, 43.5 )
	starcounts:setTopBottom( false, false, -56.38, 18.63 )
	starcounts:setText( Engine.Localize( "0" ) )
	starcounts:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	starcounts:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	starcounts:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( starcounts )
	self.starcounts = starcounts
	
	self.PlayListName:linkToElementModel( self, "playlistName", true, function ( model )
		local playlistName = Engine.GetModelValue( model )
		if playlistName then
			PlayListName:setText( Engine.Localize( playlistName ) )
		end
	end )
	self.CurrentStars:linkToElementModel( self, "newStarsDatasource", true, function ( model )
		local newStarsDatasource = Engine.GetModelValue( model )
		if newStarsDatasource then
			CurrentStars:setDataSource( newStarsDatasource )
		end
	end )
	self.CurrentRankText:linkToElementModel( self, "newSeasonPoints", true, function ( model )
		local newSeasonPoints = Engine.GetModelValue( model )
		if newSeasonPoints then
			CurrentRankText:setText( LocalizeToUpperString( GetArenaRankName( newSeasonPoints ) ) )
		end
	end )
	self.CurrentRank:linkToElementModel( self, "newSeasonPoints", true, function ( model )
		local newSeasonPoints = Engine.GetModelValue( model )
		if newSeasonPoints then
			CurrentRank.rankIcon:setImage( RegisterImage( GetArenaRankIconLG( newSeasonPoints ) ) )
		end
	end )
	self.CurrentRankADD:linkToElementModel( self, "newSeasonPoints", true, function ( model )
		local newSeasonPoints = Engine.GetModelValue( model )
		if newSeasonPoints then
			CurrentRankADD:setImage( RegisterImage( GetArenaRankIconLG( newSeasonPoints ) ) )
		end
	end )
	self.PreviousStars:linkToElementModel( self, "previousStarsDatasource", true, function ( model )
		local previousStarsDatasource = Engine.GetModelValue( model )
		if previousStarsDatasource then
			PreviousStars:setDataSource( previousStarsDatasource )
		end
	end )
	self.PreviousRankText:linkToElementModel( self, "previousSeasonPoints", true, function ( model )
		local previousSeasonPoints = Engine.GetModelValue( model )
		if previousSeasonPoints then
			PreviousRankText:setText( LocalizeToUpperString( GetArenaRankName( previousSeasonPoints ) ) )
		end
	end )
	self.PreviousRankAdd:linkToElementModel( self, "previousSeasonPoints", true, function ( model )
		local previousSeasonPoints = Engine.GetModelValue( model )
		if previousSeasonPoints then
			PreviousRankAdd.rankIcon:setImage( RegisterImage( GetArenaRankIconLG( previousSeasonPoints ) ) )
		end
	end )
	self.CurrentRankR1:linkToElementModel( self, "newSeasonPoints", true, function ( model )
		local newSeasonPoints = Engine.GetModelValue( model )
		if newSeasonPoints then
			CurrentRankR1:setImage( RegisterImage( GetArenaRankIconLG( newSeasonPoints ) ) )
		end
	end )
	self.CurrentRankL1:linkToElementModel( self, "newSeasonPoints", true, function ( model )
		local newSeasonPoints = Engine.GetModelValue( model )
		if newSeasonPoints then
			CurrentRankL1:setImage( RegisterImage( GetArenaRankIconLG( newSeasonPoints ) ) )
		end
	end )
	self.CurrentRankC1:linkToElementModel( self, "newSeasonPoints", true, function ( model )
		local newSeasonPoints = Engine.GetModelValue( model )
		if newSeasonPoints then
			CurrentRankC1:setImage( RegisterImage( GetArenaRankIconLG( newSeasonPoints ) ) )
		end
	end )
	self.CurrentRankglint:linkToElementModel( self, "newSeasonPoints", true, function ( model )
		local newSeasonPoints = Engine.GetModelValue( model )
		if newSeasonPoints then
			CurrentRankglint.rankIcon:setImage( RegisterImage( GetArenaRankIconLG( newSeasonPoints ) ) )
		end
	end )
	CurrentStars.navigation = {
		up = PreviousStars
	}
	PreviousStars.navigation = {
		down = CurrentStars
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 23 )

				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgIdle, {} )

				RankImageBorder:completeAnimation()
				self.RankImageBorder:setAlpha( 0 )
				self.clipFinished( RankImageBorder, {} )

				PlayListBG:completeAnimation()
				self.PlayListBG:setAlpha( 0 )
				self.clipFinished( PlayListBG, {} )

				Backing:completeAnimation()
				self.Backing:setAlpha( 0 )
				self.clipFinished( Backing, {} )

				RankFrame:completeAnimation()
				self.RankFrame:setAlpha( 0 )
				self.clipFinished( RankFrame, {} )

				PlayListName:completeAnimation()
				self.PlayListName:setAlpha( 0 )
				self.clipFinished( PlayListName, {} )

				CurrentStars:completeAnimation()
				self.CurrentStars:setAlpha( 0 )
				self.clipFinished( CurrentStars, {} )

				CurrentRankText:completeAnimation()
				self.CurrentRankText:setAlpha( 0 )
				self.clipFinished( CurrentRankText, {} )

				highlight1:completeAnimation()
				self.highlight1:setAlpha( 0 )
				self.clipFinished( highlight1, {} )

				highlight00:completeAnimation()
				self.highlight00:setAlpha( 0 )
				self.clipFinished( highlight00, {} )

				highlight0:completeAnimation()
				self.highlight0:setAlpha( 0 )
				self.clipFinished( highlight0, {} )

				highlight:completeAnimation()
				self.highlight:setAlpha( 0 )
				self.clipFinished( highlight, {} )

				CurrentRank:completeAnimation()
				self.CurrentRank:setAlpha( 0 )
				self.clipFinished( CurrentRank, {} )

				CurrentRankADD:completeAnimation()
				self.CurrentRankADD:setAlpha( 0 )
				self.clipFinished( CurrentRankADD, {} )

				PreviousStars:completeAnimation()
				self.PreviousStars:setAlpha( 0 )
				self.clipFinished( PreviousStars, {} )

				PreviousRankText:completeAnimation()
				self.PreviousRankText:setAlpha( 0 )
				self.clipFinished( PreviousRankText, {} )

				PreviousRankAdd:completeAnimation()
				self.PreviousRankAdd:setAlpha( 0 )
				self.clipFinished( PreviousRankAdd, {} )

				CurrentRankR1:completeAnimation()
				self.CurrentRankR1:setAlpha( 0 )
				self.clipFinished( CurrentRankR1, {} )

				CurrentRankL1:completeAnimation()
				self.CurrentRankL1:setAlpha( 0 )
				self.clipFinished( CurrentRankL1, {} )

				CurrentRankC1:completeAnimation()
				self.CurrentRankC1:setAlpha( 0 )
				self.clipFinished( CurrentRankC1, {} )

				CurrentRankglint:completeAnimation()
				self.CurrentRankglint:setAlpha( 0 )
				self.clipFinished( CurrentRankglint, {} )

				LoopingstarAnimationTest0:completeAnimation()
				self.LoopingstarAnimationTest0:setAlpha( 0 )
				self.clipFinished( LoopingstarAnimationTest0, {} )

				starcounts:completeAnimation()
				self.starcounts:setAlpha( 0 )
				self.clipFinished( starcounts, {} )
			end
		},
		SeasonFinale = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )

				local RankImageBorderFrame2 = function ( RankImageBorder, event )
					if not event.interrupted then
						RankImageBorder:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					RankImageBorder:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( RankImageBorder, event )
					else
						RankImageBorder:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RankImageBorder:completeAnimation()
				self.RankImageBorder:setAlpha( 0 )
				RankImageBorderFrame2( RankImageBorder, {} )
				local PlayListBGFrame2 = function ( PlayListBG, event )
					if not event.interrupted then
						PlayListBG:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					PlayListBG:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( PlayListBG, event )
					else
						PlayListBG:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PlayListBG:completeAnimation()
				self.PlayListBG:setAlpha( 0 )
				PlayListBGFrame2( PlayListBG, {} )
				local BackingFrame2 = function ( Backing, event )
					if not event.interrupted then
						Backing:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Backing:setAlpha( 0.8 )
					if event.interrupted then
						self.clipFinished( Backing, event )
					else
						Backing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Backing:completeAnimation()
				self.Backing:setAlpha( 0 )
				BackingFrame2( Backing, {} )
				local RankFrameFrame2 = function ( RankFrame, event )
					if not event.interrupted then
						RankFrame:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					RankFrame:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( RankFrame, event )
					else
						RankFrame:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RankFrame:completeAnimation()
				self.RankFrame:setAlpha( 0 )
				RankFrameFrame2( RankFrame, {} )
				local PlayListNameFrame2 = function ( PlayListName, event )
					if not event.interrupted then
						PlayListName:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					PlayListName:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( PlayListName, event )
					else
						PlayListName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PlayListName:completeAnimation()
				self.PlayListName:setAlpha( 0 )
				PlayListNameFrame2( PlayListName, {} )

				CurrentStars:completeAnimation()
				self.CurrentStars:setAlpha( 0 )
				self.clipFinished( CurrentStars, {} )

				CurrentRankText:completeAnimation()
				self.CurrentRankText:setAlpha( 0 )
				self.clipFinished( CurrentRankText, {} )

				CurrentRank:completeAnimation()
				self.CurrentRank:setAlpha( 0 )
				self.clipFinished( CurrentRank, {} )
				local PreviousStarsFrame2 = function ( PreviousStars, event )
					if not event.interrupted then
						PreviousStars:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					PreviousStars:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( PreviousStars, event )
					else
						PreviousStars:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PreviousStars:completeAnimation()
				self.PreviousStars:setAlpha( 0 )
				PreviousStarsFrame2( PreviousStars, {} )
				local PreviousRankTextFrame2 = function ( PreviousRankText, event )
					if not event.interrupted then
						PreviousRankText:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					PreviousRankText:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( PreviousRankText, event )
					else
						PreviousRankText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PreviousRankText:completeAnimation()
				self.PreviousRankText:setAlpha( 0 )
				PreviousRankTextFrame2( PreviousRankText, {} )
				local PreviousRankAddFrame2 = function ( PreviousRankAdd, event )
					if not event.interrupted then
						PreviousRankAdd:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					PreviousRankAdd:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( PreviousRankAdd, event )
					else
						PreviousRankAdd:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PreviousRankAdd:completeAnimation()
				self.PreviousRankAdd:setAlpha( 0 )
				PreviousRankAddFrame2( PreviousRankAdd, {} )

				LoopingstarAnimationTest0:completeAnimation()
				self.LoopingstarAnimationTest0:setAlpha( 0 )
				self.clipFinished( LoopingstarAnimationTest0, {} )

				starcounts:completeAnimation()
				self.starcounts:setAlpha( 0 )
				self.clipFinished( starcounts, {} )
			end,
			BonusStars = function ()
				self:setupElementClipCounter( 10 )

				local PlayListBGFrame2 = function ( PlayListBG, event )
					if not event.interrupted then
						PlayListBG:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					PlayListBG:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PlayListBG, event )
					else
						PlayListBG:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PlayListBG:completeAnimation()
				self.PlayListBG:setAlpha( 0.69 )
				PlayListBGFrame2( PlayListBG, {} )
				local RankFrameFrame2 = function ( RankFrame, event )
					if not event.interrupted then
						RankFrame:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					RankFrame:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( RankFrame, event )
					else
						RankFrame:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RankFrame:completeAnimation()
				self.RankFrame:setAlpha( 1 )
				RankFrameFrame2( RankFrame, {} )
				local PlayListNameFrame2 = function ( PlayListName, event )
					if not event.interrupted then
						PlayListName:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					PlayListName:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PlayListName, event )
					else
						PlayListName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PlayListName:completeAnimation()
				self.PlayListName:setAlpha( 1 )
				PlayListNameFrame2( PlayListName, {} )

				CurrentStars:completeAnimation()
				self.CurrentStars:setAlpha( 0 )
				self.clipFinished( CurrentStars, {} )

				CurrentRankText:completeAnimation()
				self.CurrentRankText:setAlpha( 0 )
				self.clipFinished( CurrentRankText, {} )

				CurrentRank:completeAnimation()
				self.CurrentRank:setAlpha( 0 )
				self.clipFinished( CurrentRank, {} )
				local PreviousStarsFrame2 = function ( PreviousStars, event )
					if not event.interrupted then
						PreviousStars:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					PreviousStars:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PreviousStars, event )
					else
						PreviousStars:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PreviousStars:completeAnimation()
				self.PreviousStars:setAlpha( 1 )
				PreviousStarsFrame2( PreviousStars, {} )
				local PreviousRankTextFrame2 = function ( PreviousRankText, event )
					if not event.interrupted then
						PreviousRankText:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					PreviousRankText:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PreviousRankText, event )
					else
						PreviousRankText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PreviousRankText:completeAnimation()
				self.PreviousRankText:setAlpha( 1 )
				PreviousRankTextFrame2( PreviousRankText, {} )
				local PreviousRankAddFrame2 = function ( PreviousRankAdd, event )
					if not event.interrupted then
						PreviousRankAdd:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					PreviousRankAdd:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PreviousRankAdd, event )
					else
						PreviousRankAdd:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PreviousRankAdd:completeAnimation()
				self.PreviousRankAdd:setAlpha( 1 )
				PreviousRankAddFrame2( PreviousRankAdd, {} )

				LoopingstarAnimationTest0:completeAnimation()
				self.LoopingstarAnimationTest0:setAlpha( 0 )
				self.clipFinished( LoopingstarAnimationTest0, {} )
			end
		},
		BonusStars = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )

				local RankImageBorderFrame2 = function ( RankImageBorder, event )
					if not event.interrupted then
						RankImageBorder:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					RankImageBorder:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( RankImageBorder, event )
					else
						RankImageBorder:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RankImageBorder:completeAnimation()
				self.RankImageBorder:setAlpha( 0 )
				RankImageBorderFrame2( RankImageBorder, {} )
				local PlayListBGFrame2 = function ( PlayListBG, event )
					if not event.interrupted then
						PlayListBG:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					PlayListBG:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( PlayListBG, event )
					else
						PlayListBG:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PlayListBG:completeAnimation()
				self.PlayListBG:setAlpha( 0 )
				PlayListBGFrame2( PlayListBG, {} )
				local BackingFrame2 = function ( Backing, event )
					if not event.interrupted then
						Backing:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Backing:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Backing, event )
					else
						Backing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Backing:completeAnimation()
				self.Backing:setAlpha( 0 )
				BackingFrame2( Backing, {} )
				local RankFrameFrame2 = function ( RankFrame, event )
					if not event.interrupted then
						RankFrame:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					RankFrame:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( RankFrame, event )
					else
						RankFrame:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RankFrame:completeAnimation()
				self.RankFrame:setAlpha( 0 )
				RankFrameFrame2( RankFrame, {} )
				local PlayListNameFrame2 = function ( PlayListName, event )
					if not event.interrupted then
						PlayListName:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					PlayListName:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( PlayListName, event )
					else
						PlayListName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PlayListName:completeAnimation()
				self.PlayListName:setAlpha( 0 )
				PlayListNameFrame2( PlayListName, {} )
				local HiddenRankTextFrame2 = function ( HiddenRankText, event )
					if not event.interrupted then
						HiddenRankText:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					HiddenRankText:setAlpha( 0.75 )
					if event.interrupted then
						self.clipFinished( HiddenRankText, event )
					else
						HiddenRankText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HiddenRankText:completeAnimation()
				self.HiddenRankText:setAlpha( 0 )
				HiddenRankTextFrame2( HiddenRankText, {} )

				CurrentStars:completeAnimation()
				self.CurrentStars:setAlpha( 0 )
				self.clipFinished( CurrentStars, {} )

				CurrentRankText:completeAnimation()
				self.CurrentRankText:setAlpha( 0 )
				self.clipFinished( CurrentRankText, {} )
				local CurrentRankFrame2 = function ( CurrentRank, event )
					if not event.interrupted then
						CurrentRank:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					CurrentRank:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( CurrentRank, event )
					else
						CurrentRank:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CurrentRank:completeAnimation()
				self.CurrentRank:setAlpha( 0 )
				CurrentRankFrame2( CurrentRank, {} )
				local LoopingstarAnimationTest0Frame2 = function ( LoopingstarAnimationTest0, event )
					if not event.interrupted then
						LoopingstarAnimationTest0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					LoopingstarAnimationTest0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LoopingstarAnimationTest0, event )
					else
						LoopingstarAnimationTest0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LoopingstarAnimationTest0:completeAnimation()
				self.LoopingstarAnimationTest0:setAlpha( 0 )
				LoopingstarAnimationTest0Frame2( LoopingstarAnimationTest0, {} )
				local starcountsFrame2 = function ( starcounts, event )
					if not event.interrupted then
						starcounts:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					starcounts:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( starcounts, event )
					else
						starcounts:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				starcounts:completeAnimation()
				self.starcounts:setAlpha( 0 )
				starcountsFrame2( starcounts, {} )
			end,
			SeasonStart = function ()
				self:setupElementClipCounter( 11 )

				local RankImageBorderFrame2 = function ( RankImageBorder, event )
					if not event.interrupted then
						RankImageBorder:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					RankImageBorder:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( RankImageBorder, event )
					else
						RankImageBorder:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RankImageBorder:completeAnimation()
				self.RankImageBorder:setAlpha( 1 )
				RankImageBorderFrame2( RankImageBorder, {} )
				local PlayListBGFrame2 = function ( PlayListBG, event )
					if not event.interrupted then
						PlayListBG:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					PlayListBG:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PlayListBG, event )
					else
						PlayListBG:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PlayListBG:completeAnimation()
				self.PlayListBG:setAlpha( 0.69 )
				PlayListBGFrame2( PlayListBG, {} )
				local BackingFrame2 = function ( Backing, event )
					if not event.interrupted then
						Backing:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Backing:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Backing, event )
					else
						Backing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Backing:completeAnimation()
				self.Backing:setAlpha( 0.8 )
				BackingFrame2( Backing, {} )
				local RankFrameFrame2 = function ( RankFrame, event )
					if not event.interrupted then
						RankFrame:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					RankFrame:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( RankFrame, event )
					else
						RankFrame:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RankFrame:completeAnimation()
				self.RankFrame:setAlpha( 1 )
				RankFrameFrame2( RankFrame, {} )
				local PlayListNameFrame2 = function ( PlayListName, event )
					if not event.interrupted then
						PlayListName:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					PlayListName:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PlayListName, event )
					else
						PlayListName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PlayListName:completeAnimation()
				self.PlayListName:setAlpha( 1 )
				PlayListNameFrame2( PlayListName, {} )
				local HiddenRankTextFrame2 = function ( HiddenRankText, event )
					if not event.interrupted then
						HiddenRankText:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					HiddenRankText:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( HiddenRankText, event )
					else
						HiddenRankText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HiddenRankText:completeAnimation()
				self.HiddenRankText:setAlpha( 0.75 )
				HiddenRankTextFrame2( HiddenRankText, {} )

				CurrentStars:completeAnimation()
				self.CurrentStars:setAlpha( 0 )
				self.clipFinished( CurrentStars, {} )

				CurrentRankText:completeAnimation()
				self.CurrentRankText:setAlpha( 0 )
				self.clipFinished( CurrentRankText, {} )
				local CurrentRankFrame2 = function ( CurrentRank, event )
					if not event.interrupted then
						CurrentRank:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					CurrentRank:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( CurrentRank, event )
					else
						CurrentRank:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CurrentRank:completeAnimation()
				self.CurrentRank:setAlpha( 0 )
				CurrentRankFrame2( CurrentRank, {} )
				local LoopingstarAnimationTest0Frame2 = function ( LoopingstarAnimationTest0, event )
					if not event.interrupted then
						LoopingstarAnimationTest0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					LoopingstarAnimationTest0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( LoopingstarAnimationTest0, event )
					else
						LoopingstarAnimationTest0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LoopingstarAnimationTest0:completeAnimation()
				self.LoopingstarAnimationTest0:setAlpha( 1 )
				LoopingstarAnimationTest0Frame2( LoopingstarAnimationTest0, {} )
				local starcountsFrame2 = function ( starcounts, event )
					if not event.interrupted then
						starcounts:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					starcounts:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( starcounts, event )
					else
						starcounts:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				starcounts:completeAnimation()
				self.starcounts:setAlpha( 1 )
				starcountsFrame2( starcounts, {} )
			end
		},
		SeasonStart = {
			DefaultClip = function ()
				self:setupElementClipCounter( 19 )

				local RankImageBorderFrame2 = function ( RankImageBorder, event )
					local RankImageBorderFrame3 = function ( RankImageBorder, event )
						if not event.interrupted then
							RankImageBorder:beginAnimation( "keyframe", 479, false, false, CoD.TweenType.Linear )
						end
						RankImageBorder:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( RankImageBorder, event )
						else
							RankImageBorder:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						RankImageBorderFrame3( RankImageBorder, event )
						return 
					else
						RankImageBorder:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						RankImageBorder:registerEventHandler( "transition_complete_keyframe", RankImageBorderFrame3 )
					end
				end
				
				RankImageBorder:completeAnimation()
				self.RankImageBorder:setAlpha( 0 )
				RankImageBorderFrame2( RankImageBorder, {} )
				local PlayListBGFrame2 = function ( PlayListBG, event )
					local PlayListBGFrame3 = function ( PlayListBG, event )
						local PlayListBGFrame4 = function ( PlayListBG, event )
							if not event.interrupted then
								PlayListBG:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
							end
							PlayListBG:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( PlayListBG, event )
							else
								PlayListBG:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							PlayListBGFrame4( PlayListBG, event )
							return 
						else
							PlayListBG:beginAnimation( "keyframe", 380, false, false, CoD.TweenType.Linear )
							PlayListBG:setAlpha( 0.95 )
							PlayListBG:registerEventHandler( "transition_complete_keyframe", PlayListBGFrame4 )
						end
					end
					
					if event.interrupted then
						PlayListBGFrame3( PlayListBG, event )
						return 
					else
						PlayListBG:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
						PlayListBG:registerEventHandler( "transition_complete_keyframe", PlayListBGFrame3 )
					end
				end
				
				PlayListBG:completeAnimation()
				self.PlayListBG:setAlpha( 0 )
				PlayListBGFrame2( PlayListBG, {} )
				local f55_local2 = function ( f61_arg0, f61_arg1 )
					if not f61_arg1.interrupted then
						f61_arg0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					f61_arg0:setAlpha( 1 )
					if f61_arg1.interrupted then
						self.clipFinished( f61_arg0, f61_arg1 )
					else
						f61_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Backing:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
				Backing:setAlpha( 0 )
				Backing:registerEventHandler( "transition_complete_keyframe", f55_local2 )
				local RankFrameFrame2 = function ( RankFrame, event )
					local RankFrameFrame3 = function ( RankFrame, event )
						if not event.interrupted then
							RankFrame:beginAnimation( "keyframe", 380, false, false, CoD.TweenType.Linear )
						end
						RankFrame:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( RankFrame, event )
						else
							RankFrame:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						RankFrameFrame3( RankFrame, event )
						return 
					else
						RankFrame:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
						RankFrame:registerEventHandler( "transition_complete_keyframe", RankFrameFrame3 )
					end
				end
				
				RankFrame:completeAnimation()
				self.RankFrame:setAlpha( 0 )
				RankFrameFrame2( RankFrame, {} )
				local PlayListNameFrame2 = function ( PlayListName, event )
					local PlayListNameFrame3 = function ( PlayListName, event )
						if not event.interrupted then
							PlayListName:beginAnimation( "keyframe", 380, false, false, CoD.TweenType.Linear )
						end
						PlayListName:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( PlayListName, event )
						else
							PlayListName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						PlayListNameFrame3( PlayListName, event )
						return 
					else
						PlayListName:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
						PlayListName:registerEventHandler( "transition_complete_keyframe", PlayListNameFrame3 )
					end
				end
				
				PlayListName:completeAnimation()
				self.PlayListName:setAlpha( 0 )
				PlayListNameFrame2( PlayListName, {} )
				local f55_local5 = function ( f66_arg0, f66_arg1 )
					if not f66_arg1.interrupted then
						f66_arg0:beginAnimation( "keyframe", 380, false, false, CoD.TweenType.Linear )
					end
					f66_arg0:setAlpha( 1 )
					if f66_arg1.interrupted then
						self.clipFinished( f66_arg0, f66_arg1 )
					else
						f66_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CurrentStars:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
				CurrentStars:setAlpha( 0 )
				CurrentStars:registerEventHandler( "transition_complete_keyframe", f55_local5 )
				local f55_local6 = function ( f67_arg0, f67_arg1 )
					if not f67_arg1.interrupted then
						f67_arg0:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
					end
					f67_arg0:setAlpha( 1 )
					if f67_arg1.interrupted then
						self.clipFinished( f67_arg0, f67_arg1 )
					else
						f67_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CurrentRankText:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
				CurrentRankText:setAlpha( 0 )
				CurrentRankText:registerEventHandler( "transition_complete_keyframe", f55_local6 )
				local f55_local7 = function ( f68_arg0, f68_arg1 )
					local f68_local0 = function ( f69_arg0, f69_arg1 )
						local f69_local0 = function ( f70_arg0, f70_arg1 )
							if not f70_arg1.interrupted then
								f70_arg0:beginAnimation( "keyframe", 919, false, false, CoD.TweenType.Linear )
							end
							f70_arg0:setAlpha( 0 )
							f70_arg0:setZRot( 325 )
							f70_arg0:setScale( 2 )
							if f70_arg1.interrupted then
								self.clipFinished( f70_arg0, f70_arg1 )
							else
								f70_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f69_arg1.interrupted then
							f69_local0( f69_arg0, f69_arg1 )
							return 
						else
							f69_arg0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
							f69_arg0:setAlpha( 0.78 )
							f69_arg0:setZRot( 208 )
							f69_arg0:setScale( 2 )
							f69_arg0:registerEventHandler( "transition_complete_keyframe", f69_local0 )
						end
					end
					
					if f68_arg1.interrupted then
						f68_local0( f68_arg0, f68_arg1 )
						return 
					else
						f68_arg0:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
						f68_arg0:setAlpha( 0.38 )
						f68_arg0:setZRot( 180 )
						f68_arg0:setScale( 1.48 )
						f68_arg0:registerEventHandler( "transition_complete_keyframe", f68_local0 )
					end
				end
				
				highlight1:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
				highlight1:setAlpha( 0 )
				highlight1:setZRot( 0 )
				highlight1:setScale( 1 )
				highlight1:registerEventHandler( "transition_complete_keyframe", f55_local7 )
				local f55_local8 = function ( f71_arg0, f71_arg1 )
					local f71_local0 = function ( f72_arg0, f72_arg1 )
						local f72_local0 = function ( f73_arg0, f73_arg1 )
							if not f73_arg1.interrupted then
								f73_arg0:beginAnimation( "keyframe", 919, false, false, CoD.TweenType.Linear )
							end
							f73_arg0:setAlpha( 0 )
							f73_arg0:setZRot( 350 )
							f73_arg0:setScale( 2.1 )
							if f73_arg1.interrupted then
								self.clipFinished( f73_arg0, f73_arg1 )
							else
								f73_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f72_arg1.interrupted then
							f72_local0( f72_arg0, f72_arg1 )
							return 
						else
							f72_arg0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
							f72_arg0:setAlpha( 0.33 )
							f72_arg0:setZRot( 201.05 )
							f72_arg0:setScale( 2.1 )
							f72_arg0:registerEventHandler( "transition_complete_keyframe", f72_local0 )
						end
					end
					
					if f71_arg1.interrupted then
						f71_local0( f71_arg0, f71_arg1 )
						return 
					else
						f71_arg0:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
						f71_arg0:setAlpha( 0.38 )
						f71_arg0:setZRot( 180 )
						f71_arg0:setScale( 1.72 )
						f71_arg0:registerEventHandler( "transition_complete_keyframe", f71_local0 )
					end
				end
				
				highlight00:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
				highlight00:setAlpha( 0 )
				highlight00:setZRot( 0 )
				highlight00:setScale( 1 )
				highlight00:registerEventHandler( "transition_complete_keyframe", f55_local8 )
				local f55_local9 = function ( f74_arg0, f74_arg1 )
					local f74_local0 = function ( f75_arg0, f75_arg1 )
						local f75_local0 = function ( f76_arg0, f76_arg1 )
							if not f76_arg1.interrupted then
								f76_arg0:beginAnimation( "keyframe", 919, false, false, CoD.TweenType.Linear )
							end
							f76_arg0:setAlpha( 0 )
							f76_arg0:setZRot( 325 )
							f76_arg0:setScale( 1 )
							if f76_arg1.interrupted then
								self.clipFinished( f76_arg0, f76_arg1 )
							else
								f76_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f75_arg1.interrupted then
							f75_local0( f75_arg0, f75_arg1 )
							return 
						else
							f75_arg0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
							f75_arg0:setAlpha( 0.78 )
							f75_arg0:setZRot( 208 )
							f75_arg0:setScale( 2 )
							f75_arg0:registerEventHandler( "transition_complete_keyframe", f75_local0 )
						end
					end
					
					if f74_arg1.interrupted then
						f74_local0( f74_arg0, f74_arg1 )
						return 
					else
						f74_arg0:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
						f74_arg0:setAlpha( 0.38 )
						f74_arg0:setZRot( 108 )
						f74_arg0:setScale( 1.48 )
						f74_arg0:registerEventHandler( "transition_complete_keyframe", f74_local0 )
					end
				end
				
				highlight0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
				highlight0:setAlpha( 0 )
				highlight0:setZRot( 0 )
				highlight0:setScale( 1 )
				highlight0:registerEventHandler( "transition_complete_keyframe", f55_local9 )
				local f55_local10 = function ( f77_arg0, f77_arg1 )
					local f77_local0 = function ( f78_arg0, f78_arg1 )
						local f78_local0 = function ( f79_arg0, f79_arg1 )
							if not f79_arg1.interrupted then
								f79_arg0:beginAnimation( "keyframe", 919, false, false, CoD.TweenType.Linear )
							end
							f79_arg0:setAlpha( 0 )
							f79_arg0:setZRot( 108 )
							f79_arg0:setScale( 3.3 )
							if f79_arg1.interrupted then
								self.clipFinished( f79_arg0, f79_arg1 )
							else
								f79_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f78_arg1.interrupted then
							f78_local0( f78_arg0, f78_arg1 )
							return 
						else
							f78_arg0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
							f78_arg0:setAlpha( 0.38 )
							f78_arg0:setZRot( 108 )
							f78_arg0:setScale( 2.5 )
							f78_arg0:registerEventHandler( "transition_complete_keyframe", f78_local0 )
						end
					end
					
					if f77_arg1.interrupted then
						f77_local0( f77_arg0, f77_arg1 )
						return 
					else
						f77_arg0:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
						f77_arg0:setScale( 1.72 )
						f77_arg0:registerEventHandler( "transition_complete_keyframe", f77_local0 )
					end
				end
				
				highlight:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
				highlight:setAlpha( 0 )
				highlight:setZRot( 0 )
				highlight:setScale( 1 )
				highlight:registerEventHandler( "transition_complete_keyframe", f55_local10 )
				local CurrentRankFrame2 = function ( CurrentRank, event )
					local CurrentRankFrame3 = function ( CurrentRank, event )
						local CurrentRankFrame4 = function ( CurrentRank, event )
							local CurrentRankFrame5 = function ( CurrentRank, event )
								if not event.interrupted then
									CurrentRank:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
								end
								CurrentRank:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( CurrentRank, event )
								else
									CurrentRank:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								CurrentRankFrame5( CurrentRank, event )
								return 
							else
								CurrentRank:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
								CurrentRank:registerEventHandler( "transition_complete_keyframe", CurrentRankFrame5 )
							end
						end
						
						if event.interrupted then
							CurrentRankFrame4( CurrentRank, event )
							return 
						else
							CurrentRank:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
							CurrentRank:setAlpha( 0.5 )
							CurrentRank:registerEventHandler( "transition_complete_keyframe", CurrentRankFrame4 )
						end
					end
					
					if event.interrupted then
						CurrentRankFrame3( CurrentRank, event )
						return 
					else
						CurrentRank:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						CurrentRank:registerEventHandler( "transition_complete_keyframe", CurrentRankFrame3 )
					end
				end
				
				CurrentRank:completeAnimation()
				self.CurrentRank:setAlpha( 0 )
				CurrentRankFrame2( CurrentRank, {} )
				local f55_local12 = function ( f84_arg0, f84_arg1 )
					local f84_local0 = function ( f85_arg0, f85_arg1 )
						if not f85_arg1.interrupted then
							f85_arg0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						end
						f85_arg0:setAlpha( 0 )
						f85_arg0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
						f85_arg0:setShaderVector( 0, 2, 0, 0, 0 )
						f85_arg0:setShaderVector( 1, 1, 0, 0, 0 )
						f85_arg0:setShaderVector( 2, 0.03, 0, 0, 0 )
						if f85_arg1.interrupted then
							self.clipFinished( f85_arg0, f85_arg1 )
						else
							f85_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f84_arg1.interrupted then
						f84_local0( f84_arg0, f84_arg1 )
						return 
					else
						f84_arg0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						f84_arg0:setAlpha( 1 )
						f84_arg0:registerEventHandler( "transition_complete_keyframe", f84_local0 )
					end
				end
				
				CurrentRankADD:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
				CurrentRankADD:setAlpha( 0 )
				CurrentRankADD:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
				CurrentRankADD:setShaderVector( 0, 2, 0, 0, 0 )
				CurrentRankADD:setShaderVector( 1, 1, 0, 0, 0 )
				CurrentRankADD:setShaderVector( 2, 0.03, 0, 0, 0 )
				CurrentRankADD:registerEventHandler( "transition_complete_keyframe", f55_local12 )
				local f55_local13 = function ( f86_arg0, f86_arg1 )
					local f86_local0 = function ( f87_arg0, f87_arg1 )
						local f87_local0 = function ( f88_arg0, f88_arg1 )
							if not f88_arg1.interrupted then
								f88_arg0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
							end
							f88_arg0:setLeftRight( false, false, -74, 74 )
							f88_arg0:setTopBottom( false, false, -81, 67 )
							f88_arg0:setAlpha( 0 )
							f88_arg0:setScale( 1 )
							if f88_arg1.interrupted then
								self.clipFinished( f88_arg0, f88_arg1 )
							else
								f88_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f87_arg1.interrupted then
							f87_local0( f87_arg0, f87_arg1 )
							return 
						else
							f87_arg0:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
							f87_arg0:setLeftRight( false, false, -74, 74 )
							f87_arg0:setTopBottom( false, false, -81, 67 )
							f87_arg0:setAlpha( 0.54 )
							f87_arg0:setScale( 1 )
							f87_arg0:registerEventHandler( "transition_complete_keyframe", f87_local0 )
						end
					end
					
					if f86_arg1.interrupted then
						f86_local0( f86_arg0, f86_arg1 )
						return 
					else
						f86_arg0:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
						f86_arg0:setLeftRight( false, false, 5, 143 )
						f86_arg0:setTopBottom( false, false, -75, 73 )
						f86_arg0:setAlpha( 0.75 )
						f86_arg0:setScale( 1.47 )
						f86_arg0:registerEventHandler( "transition_complete_keyframe", f86_local0 )
					end
				end
				
				CurrentRankR1:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
				CurrentRankR1:setLeftRight( false, false, 74, 222 )
				CurrentRankR1:setTopBottom( false, false, -73, 75 )
				CurrentRankR1:setAlpha( 0 )
				CurrentRankR1:setScale( 2 )
				CurrentRankR1:registerEventHandler( "transition_complete_keyframe", f55_local13 )
				local f55_local14 = function ( f89_arg0, f89_arg1 )
					local f89_local0 = function ( f90_arg0, f90_arg1 )
						local f90_local0 = function ( f91_arg0, f91_arg1 )
							if not f91_arg1.interrupted then
								f91_arg0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
							end
							f91_arg0:setLeftRight( false, false, -74, 74 )
							f91_arg0:setTopBottom( false, false, -81, 67 )
							f91_arg0:setAlpha( 0 )
							f91_arg0:setScale( 1 )
							if f91_arg1.interrupted then
								self.clipFinished( f91_arg0, f91_arg1 )
							else
								f91_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f90_arg1.interrupted then
							f90_local0( f90_arg0, f90_arg1 )
							return 
						else
							f90_arg0:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
							f90_arg0:setLeftRight( false, false, -74, 74 )
							f90_arg0:setTopBottom( false, false, -81, 67 )
							f90_arg0:setAlpha( 0.54 )
							f90_arg0:setScale( 1 )
							f90_arg0:registerEventHandler( "transition_complete_keyframe", f90_local0 )
						end
					end
					
					if f89_arg1.interrupted then
						f89_local0( f89_arg0, f89_arg1 )
						return 
					else
						f89_arg0:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
						f89_arg0:setLeftRight( false, false, -143, 5 )
						f89_arg0:setTopBottom( false, false, -75, 73 )
						f89_arg0:setAlpha( 0.75 )
						f89_arg0:setScale( 1.47 )
						f89_arg0:registerEventHandler( "transition_complete_keyframe", f89_local0 )
					end
				end
				
				CurrentRankL1:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
				CurrentRankL1:setLeftRight( false, false, -222, -74 )
				CurrentRankL1:setTopBottom( false, false, -73, 75 )
				CurrentRankL1:setAlpha( 0 )
				CurrentRankL1:setScale( 2 )
				CurrentRankL1:registerEventHandler( "transition_complete_keyframe", f55_local14 )
				local f55_local15 = function ( f92_arg0, f92_arg1 )
					local f92_local0 = function ( f93_arg0, f93_arg1 )
						local f93_local0 = function ( f94_arg0, f94_arg1 )
							if not f94_arg1.interrupted then
								f94_arg0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
							end
							f94_arg0:setLeftRight( false, false, -74, 74 )
							f94_arg0:setTopBottom( false, false, -81, 67 )
							f94_arg0:setAlpha( 0 )
							f94_arg0:setScale( 1 )
							if f94_arg1.interrupted then
								self.clipFinished( f94_arg0, f94_arg1 )
							else
								f94_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f93_arg1.interrupted then
							f93_local0( f93_arg0, f93_arg1 )
							return 
						else
							f93_arg0:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
							f93_arg0:setTopBottom( false, false, -81, 67 )
							f93_arg0:setAlpha( 0.54 )
							f93_arg0:setScale( 1 )
							f93_arg0:registerEventHandler( "transition_complete_keyframe", f93_local0 )
						end
					end
					
					if f92_arg1.interrupted then
						f92_local0( f92_arg0, f92_arg1 )
						return 
					else
						f92_arg0:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
						f92_arg0:setTopBottom( false, false, -75, 73 )
						f92_arg0:setAlpha( 0.75 )
						f92_arg0:setScale( 1.47 )
						f92_arg0:registerEventHandler( "transition_complete_keyframe", f92_local0 )
					end
				end
				
				CurrentRankC1:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
				CurrentRankC1:setLeftRight( false, false, -74, 74 )
				CurrentRankC1:setTopBottom( false, false, -73, 75 )
				CurrentRankC1:setAlpha( 0 )
				CurrentRankC1:setScale( 2 )
				CurrentRankC1:registerEventHandler( "transition_complete_keyframe", f55_local15 )
				local f55_local16 = function ( f95_arg0, f95_arg1 )
					local f95_local0 = function ( f96_arg0, f96_arg1 )
						local f96_local0 = function ( f97_arg0, f97_arg1 )
							local f97_local0 = function ( f98_arg0, f98_arg1 )
								local f98_local0 = function ( f99_arg0, f99_arg1 )
									local f99_local0 = function ( f100_arg0, f100_arg1 )
										if not f100_arg1.interrupted then
											f100_arg0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
										end
										f100_arg0:setRGB( 1, 0.8, 0 )
										f100_arg0:setAlpha( 0 )
										f100_arg0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint_reveal" ) )
										f100_arg0:setShaderVector( 0, 1, 0, 0, 0 )
										if f100_arg1.interrupted then
											self.clipFinished( f100_arg0, f100_arg1 )
										else
											f100_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if f99_arg1.interrupted then
										f99_local0( f99_arg0, f99_arg1 )
										return 
									else
										f99_arg0:beginAnimation( "keyframe", 419, false, false, CoD.TweenType.Linear )
										f99_arg0:setAlpha( 0.11 )
										f99_arg0:setShaderVector( 0, 1, 0, 0, 0 )
										f99_arg0:registerEventHandler( "transition_complete_keyframe", f99_local0 )
									end
								end
								
								if f98_arg1.interrupted then
									f98_local0( f98_arg0, f98_arg1 )
									return 
								else
									f98_arg0:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
									f98_arg0:setShaderVector( 0, 0.46, 0, 0, 0 )
									f98_arg0:registerEventHandler( "transition_complete_keyframe", f98_local0 )
								end
							end
							
							if f97_arg1.interrupted then
								f97_local0( f97_arg0, f97_arg1 )
								return 
							else
								f97_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
								f97_arg0:setShaderVector( 0, 0.05, 0, 0, 0 )
								f97_arg0:registerEventHandler( "transition_complete_keyframe", f97_local0 )
							end
						end
						
						if f96_arg1.interrupted then
							f96_local0( f96_arg0, f96_arg1 )
							return 
						else
							f96_arg0:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
							f96_arg0:registerEventHandler( "transition_complete_keyframe", f96_local0 )
						end
					end
					
					if f95_arg1.interrupted then
						f95_local0( f95_arg0, f95_arg1 )
						return 
					else
						f95_arg0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						f95_arg0:setAlpha( 1 )
						f95_arg0:registerEventHandler( "transition_complete_keyframe", f95_local0 )
					end
				end
				
				CurrentRankglint:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
				CurrentRankglint:setRGB( 1, 0.8, 0 )
				CurrentRankglint:setAlpha( 0 )
				CurrentRankglint:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint_reveal" ) )
				CurrentRankglint:setShaderVector( 0, 0, 0, 0, 0 )
				CurrentRankglint:registerEventHandler( "transition_complete_keyframe", f55_local16 )

				LoopingstarAnimationTest0:completeAnimation()
				self.LoopingstarAnimationTest0:setAlpha( 0 )
				self.clipFinished( LoopingstarAnimationTest0, {} )

				starcounts:completeAnimation()
				self.starcounts:setAlpha( 0 )
				self.clipFinished( starcounts, {} )
			end
		}
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	CurrentStars.id = "CurrentStars"
	PreviousStars.id = "PreviousStars"

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.RankImageBorder:close()
		element.PlayListBG:close()
		element.RankFrame:close()
		element.CurrentStars:close()
		element.CurrentRank:close()
		element.PreviousStars:close()
		element.PreviousRankAdd:close()
		element.CurrentRankglint:close()
		element.LoopingstarAnimationTest0:close()
		element.PlayListName:close()
		element.CurrentRankText:close()
		element.CurrentRankADD:close()
		element.PreviousRankText:close()
		element.CurrentRankR1:close()
		element.CurrentRankL1:close()
		element.CurrentRankC1:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

