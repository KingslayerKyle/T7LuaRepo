-- 5dfa7401adc5a6c364ecc69902b4fd99
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.AAR.XPbarFrame" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.XpBar" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.RankIconAndNumberWidget" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Identity_SubTitle" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.XpBarTitleRight" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.RankIconAndNumberBig" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	if CoD.isCampaign == true then
		SoundSet.AAR.rank_music = "uin_level_up_cp"
	elseif CoD.isZombie == true then
		SoundSet.AAR.rank_music = "uin_level_up_zm"
	end
end

CoD.XpBarContainer = InheritFrom( LUI.UIElement )
CoD.XpBarContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.XpBarContainer )
	self.id = "XpBarContainer"
	self.soundSet = "AAR"
	self:setLeftRight( true, false, 0, 1150 )
	self:setTopBottom( true, false, 0, 60 )
	self.anyChildUsesUpdateState = true
	
	local XpBarFrame = CoD.XPbarFrame.new( menu, controller )
	XpBarFrame:setLeftRight( true, true, 58.5, -62 )
	XpBarFrame:setTopBottom( true, false, 29, 54 )
	self:addElement( XpBarFrame )
	self.XpBarFrame = XpBarFrame
	
	local XpBar = CoD.XpBar.new( menu, controller )
	XpBar:setLeftRight( true, true, 61, -65 )
	XpBar:setTopBottom( true, false, 34, 49 )
	self:addElement( XpBar )
	self.XpBar = XpBar
	
	local RankIconAndNumberWidgetNextBase = CoD.RankIconAndNumberWidget.new( menu, controller )
	RankIconAndNumberWidgetNextBase:setLeftRight( false, true, -644.5, -507.5 )
	RankIconAndNumberWidgetNextBase:setTopBottom( true, false, 9, 49 )
	RankIconAndNumberWidgetNextBase:setAlpha( 0 )
	RankIconAndNumberWidgetNextBase:setScale( 1.5 )
	RankIconAndNumberWidgetNextBase:linkToElementModel( self, "nextLevelIcon", true, function ( model )
		local nextLevelIcon = Engine.GetModelValue( model )
		if nextLevelIcon then
			RankIconAndNumberWidgetNextBase.NextRankIcon:setImage( RegisterImage( GetRankIconLarge( nextLevelIcon ) ) )
		end
	end )
	RankIconAndNumberWidgetNextBase:linkToElementModel( self, "nextLevel", true, function ( model )
		local nextLevel = Engine.GetModelValue( model )
		if nextLevel then
			RankIconAndNumberWidgetNextBase.NextRank:setRGB( SetToParagonColorIfPrestigeMasterByRank( 255, 255, 255, nextLevel ) )
		end
	end )
	RankIconAndNumberWidgetNextBase:linkToElementModel( self, "nextLevel", true, function ( model )
		local nextLevel = Engine.GetModelValue( model )
		if nextLevel then
			RankIconAndNumberWidgetNextBase.NextRank:setText( Engine.Localize( nextLevel ) )
		end
	end )
	self:addElement( RankIconAndNumberWidgetNextBase )
	self.RankIconAndNumberWidgetNextBase = RankIconAndNumberWidgetNextBase
	
	local RankIconAndNumberWidgetPrevious = CoD.RankIconAndNumberWidget.new( menu, controller )
	RankIconAndNumberWidgetPrevious:setLeftRight( true, false, -34, 46 )
	RankIconAndNumberWidgetPrevious:setTopBottom( true, false, 20, 60 )
	RankIconAndNumberWidgetPrevious:linkToElementModel( self, "currLevelIcon", true, function ( model )
		local currLevelIcon = Engine.GetModelValue( model )
		if currLevelIcon then
			RankIconAndNumberWidgetPrevious.NextRankIcon:setImage( RegisterImage( GetRankIconLarge( currLevelIcon ) ) )
		end
	end )
	RankIconAndNumberWidgetPrevious:linkToElementModel( self, "currLevel", true, function ( model )
		local currLevel = Engine.GetModelValue( model )
		if currLevel then
			RankIconAndNumberWidgetPrevious.NextRank:setRGB( SetToParagonColorIfPrestigeMasterByRank( 255, 255, 255, currLevel ) )
		end
	end )
	RankIconAndNumberWidgetPrevious:linkToElementModel( self, "currLevel", true, function ( model )
		local currLevel = Engine.GetModelValue( model )
		if currLevel then
			RankIconAndNumberWidgetPrevious.NextRank:setText( Engine.Localize( currLevel ) )
		end
	end )
	self:addElement( RankIconAndNumberWidgetPrevious )
	self.RankIconAndNumberWidgetPrevious = RankIconAndNumberWidgetPrevious
	
	local XPEarnedDisplay = CoD.StartMenu_Identity_SubTitle.new( menu, controller )
	XPEarnedDisplay:setLeftRight( true, false, 55, 812 )
	XPEarnedDisplay:setTopBottom( true, false, 5, 31 )
	XPEarnedDisplay.FEButtonPanel0:setAlpha( 0 )
	XPEarnedDisplay.SubTitle:setRGB( 0.95, 0.91, 0.11 )
	XPEarnedDisplay.SubTitle:setText( Engine.Localize( GetAARXpEarned( controller, "XP Earned: 0" ) ) )
	XPEarnedDisplay.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( XPEarnedDisplay )
	self.XPEarnedDisplay = XPEarnedDisplay
	
	local ProgressDescription = CoD.StartMenu_Identity_SubTitle.new( menu, controller )
	ProgressDescription:setLeftRight( true, false, 58.5, 520.5 )
	ProgressDescription:setTopBottom( true, false, 4.12, 30.12 )
	ProgressDescription:setAlpha( 0 )
	ProgressDescription.SubTitle:setText( Engine.Localize( "MENU_PROGRESS_TO_NEXT_LEVEL_CAPS" ) )
	ProgressDescription.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( ProgressDescription )
	self.ProgressDescription = ProgressDescription
	
	local NextLevelDisplay = CoD.XpBarTitleRight.new( menu, controller )
	NextLevelDisplay:setLeftRight( false, true, -256, -58 )
	NextLevelDisplay:setTopBottom( true, false, 5, 31 )
	NextLevelDisplay.FEButtonPanel0:setAlpha( 0 )
	NextLevelDisplay.SubTitle:setText( Engine.Localize( GetAARXPNextLevel( controller, "Next Level: 43600 XP Needed" ) ) )
	NextLevelDisplay.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( NextLevelDisplay )
	self.NextLevelDisplay = NextLevelDisplay
	
	local BackGlow = LUI.UIImage.new()
	BackGlow:setLeftRight( true, false, 1049.17, 1210.17 )
	BackGlow:setTopBottom( true, false, -31.59, 105.01 )
	BackGlow:setRGB( 0, 0, 0 )
	BackGlow:setAlpha( 0 )
	BackGlow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	self:addElement( BackGlow )
	self.BackGlow = BackGlow
	
	local RankIconAndNumberWidgetNextTop = CoD.RankIconAndNumberWidget.new( menu, controller )
	RankIconAndNumberWidgetNextTop:setLeftRight( false, true, -60, 20 )
	RankIconAndNumberWidgetNextTop:setTopBottom( true, false, 20, 60 )
	RankIconAndNumberWidgetNextTop:linkToElementModel( self, "nextLevelIcon", true, function ( model )
		local nextLevelIcon = Engine.GetModelValue( model )
		if nextLevelIcon then
			RankIconAndNumberWidgetNextTop.NextRankIcon:setImage( RegisterImage( GetRankIconLarge( nextLevelIcon ) ) )
		end
	end )
	RankIconAndNumberWidgetNextTop:linkToElementModel( self, "nextLevel", true, function ( model )
		local nextLevel = Engine.GetModelValue( model )
		if nextLevel then
			RankIconAndNumberWidgetNextTop.NextRank:setRGB( SetToParagonColorIfPrestigeMasterByRank( 255, 255, 255, nextLevel ) )
		end
	end )
	RankIconAndNumberWidgetNextTop:linkToElementModel( self, "nextLevel", true, function ( model )
		local nextLevel = Engine.GetModelValue( model )
		if nextLevel then
			RankIconAndNumberWidgetNextTop.NextRank:setText( Engine.Localize( nextLevel ) )
		end
	end )
	self:addElement( RankIconAndNumberWidgetNextTop )
	self.RankIconAndNumberWidgetNextTop = RankIconAndNumberWidgetNextTop
	
	local Glow0 = LUI.UIImage.new()
	Glow0:setLeftRight( false, false, -150, 150 )
	Glow0:setTopBottom( false, true, -38.65, -13.65 )
	Glow0:setRGB( 0.25, 0.06, 0 )
	Glow0:setAlpha( 0 )
	Glow0:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow0 )
	self.Glow0 = Glow0
	
	local Glow1 = LUI.UIImage.new()
	Glow1:setLeftRight( false, false, 464.62, 619.62 )
	Glow1:setTopBottom( false, true, -72.48, 42.91 )
	Glow1:setRGB( 0.59, 0.31, 0 )
	Glow1:setAlpha( 0 )
	Glow1:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow1 )
	self.Glow1 = Glow1
	
	local MeterGlow = LUI.UIImage.new()
	MeterGlow:setLeftRight( true, true, 48, -42 )
	MeterGlow:setTopBottom( true, false, 13.21, 72.21 )
	MeterGlow:setRGB( 1, 0.2, 0 )
	MeterGlow:setImage( RegisterImage( "uie_t7_mp_menu_startflow_meterglow" ) )
	MeterGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( MeterGlow )
	self.MeterGlow = MeterGlow
	
	local RankIconAndNumberBig = CoD.RankIconAndNumberBig.new( menu, controller )
	RankIconAndNumberBig:setLeftRight( true, false, 450.5, 695.5 )
	RankIconAndNumberBig:setTopBottom( true, false, 9, 49 )
	RankIconAndNumberBig:setAlpha( 0 )
	RankIconAndNumberBig:setScale( 1.5 )
	RankIconAndNumberBig:linkToElementModel( self, "nextLevelIcon", true, function ( model )
		local nextLevelIcon = Engine.GetModelValue( model )
		if nextLevelIcon then
			RankIconAndNumberBig.NextRankIcon:setImage( RegisterImage( GetRankIconLarge( nextLevelIcon ) ) )
		end
	end )
	RankIconAndNumberBig:linkToElementModel( self, "nextLevel", true, function ( model )
		local nextLevel = Engine.GetModelValue( model )
		if nextLevel then
			RankIconAndNumberBig.NextRank:setRGB( SetToParagonColorIfPrestigeMasterByRank( 255, 255, 255, nextLevel ) )
		end
	end )
	RankIconAndNumberBig:linkToElementModel( self, "nextLevel", true, function ( model )
		local nextLevel = Engine.GetModelValue( model )
		if nextLevel then
			RankIconAndNumberBig.NextRank:setText( Engine.Localize( nextLevel ) )
		end
	end )
	RankIconAndNumberBig:linkToElementModel( self, "nextLevel", true, function ( model )
		local nextLevel = Engine.GetModelValue( model )
		if nextLevel then
			RankIconAndNumberBig.LEVEL:setRGB( SetToParagonColorIfPrestigeMasterByRank( 255, 255, 255, nextLevel ) )
		end
	end )
	self:addElement( RankIconAndNumberBig )
	self.RankIconAndNumberBig = RankIconAndNumberBig
	
	local Glow10 = LUI.UIImage.new()
	Glow10:setLeftRight( false, false, -174, 196.82 )
	Glow10:setTopBottom( false, true, -69, 9.24 )
	Glow10:setRGB( 0.72, 0.46, 0 )
	Glow10:setAlpha( 0 )
	Glow10:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow10:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow10 )
	self.Glow10 = Glow10
	
	local Glow00 = LUI.UIImage.new()
	Glow00:setLeftRight( false, false, -191, 211 )
	Glow00:setTopBottom( false, true, -55.09, -2.98 )
	Glow00:setRGB( 0.25, 0.06, 0 )
	Glow00:setAlpha( 0 )
	Glow00:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow00 )
	self.Glow00 = Glow00
	
	local promotionSound = LUI.UIElement.new()
	promotionSound:setLeftRight( true, false, -163.5, -115.5 )
	promotionSound:setTopBottom( true, false, 57.01, 105.01 )
	self:addElement( promotionSound )
	self.promotionSound = promotionSound
	
	local promotionMusic = LUI.UIElement.new()
	promotionMusic:setLeftRight( true, false, -163.5, -115.5 )
	promotionMusic:setTopBottom( true, false, 115.01, 163.01 )
	self:addElement( promotionMusic )
	self.promotionMusic = promotionMusic
	
	local starterPackXPNotice = LUI.UIText.new()
	starterPackXPNotice:setLeftRight( true, false, 61, 828 )
	starterPackXPNotice:setTopBottom( true, false, 52, 72.21 )
	starterPackXPNotice:setAlpha( 0 )
	starterPackXPNotice:setText( Engine.Localize( GetAARXPStarterPackNotice( controller, "You are at Maximum Level and XP for MP45. Purchase Full Version to continue leveling." ) ) )
	starterPackXPNotice:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	starterPackXPNotice:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	starterPackXPNotice:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( starterPackXPNotice )
	self.starterPackXPNotice = starterPackXPNotice
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )

				RankIconAndNumberWidgetPrevious:completeAnimation()
				self.RankIconAndNumberWidgetPrevious:setAlpha( 1 )
				self.clipFinished( RankIconAndNumberWidgetPrevious, {} )

				XPEarnedDisplay:completeAnimation()
				self.XPEarnedDisplay:setLeftRight( true, false, 54.5, 535.91 )
				self.XPEarnedDisplay:setTopBottom( true, false, 5, 31 )
				self.clipFinished( XPEarnedDisplay, {} )

				ProgressDescription:completeAnimation()

				ProgressDescription.FEButtonPanel0:completeAnimation()
				self.ProgressDescription:setLeftRight( true, false, -67, 208.41 )
				self.ProgressDescription:setTopBottom( true, false, -13, 13 )
				self.ProgressDescription.FEButtonPanel0:setAlpha( 0.2 )
				self.clipFinished( ProgressDescription, {} )

				NextLevelDisplay:completeAnimation()
				self.NextLevelDisplay:setLeftRight( false, true, -255, -57 )
				self.NextLevelDisplay:setTopBottom( true, false, 5, 31 )
				self.clipFinished( NextLevelDisplay, {} )

				BackGlow:completeAnimation()
				self.BackGlow:setAlpha( 0 )
				self.clipFinished( BackGlow, {} )

				Glow0:completeAnimation()
				self.Glow0:setAlpha( 0 )
				self.clipFinished( Glow0, {} )

				Glow1:completeAnimation()
				self.Glow1:setAlpha( 0 )
				self.clipFinished( Glow1, {} )

				MeterGlow:completeAnimation()
				self.MeterGlow:setAlpha( 0 )
				self.clipFinished( MeterGlow, {} )

				RankIconAndNumberBig:completeAnimation()
				self.RankIconAndNumberBig:setAlpha( 0 )
				self.clipFinished( RankIconAndNumberBig, {} )

				starterPackXPNotice:completeAnimation()
				self.starterPackXPNotice:setAlpha( 1 )
				self.clipFinished( starterPackXPNotice, {} )
			end,
			Update = function ()
				self:setupElementClipCounter( 18 )

				local f17_local0 = function ( f18_arg0, f18_arg1 )
					local f18_local0 = function ( f19_arg0, f19_arg1 )
						if not f19_arg1.interrupted then
							f19_arg0:beginAnimation( "keyframe", 2609, false, false, CoD.TweenType.Linear )
						end
						f19_arg0:setAlpha( 0 )
						if f19_arg1.interrupted then
							self.clipFinished( f19_arg0, f19_arg1 )
						else
							f19_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f18_arg1.interrupted then
						f18_local0( f18_arg0, f18_arg1 )
						return 
					else
						f18_arg0:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						f18_arg0:setAlpha( 0 )
						f18_arg0:registerEventHandler( "transition_complete_keyframe", f18_local0 )
					end
				end
				
				XpBarFrame:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
				XpBarFrame:setAlpha( 1 )
				XpBarFrame:registerEventHandler( "transition_complete_keyframe", f17_local0 )
				local f17_local1 = function ( f20_arg0, f20_arg1 )
					local f20_local0 = function ( f21_arg0, f21_arg1 )
						if not f21_arg1.interrupted then
							f21_arg0:beginAnimation( "keyframe", 2609, false, false, CoD.TweenType.Linear )
						end
						f21_arg0:setAlpha( 0 )
						if f21_arg1.interrupted then
							self.clipFinished( f21_arg0, f21_arg1 )
						else
							f21_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f20_arg1.interrupted then
						f20_local0( f20_arg0, f20_arg1 )
						return 
					else
						f20_arg0:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						f20_arg0:setAlpha( 0 )
						f20_arg0:registerEventHandler( "transition_complete_keyframe", f20_local0 )
					end
				end
				
				XpBar:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
				XpBar:setAlpha( 1 )
				XpBar:registerEventHandler( "transition_complete_keyframe", f17_local1 )
				local RankIconAndNumberWidgetNextBaseFrame2 = function ( RankIconAndNumberWidgetNextBase, event )
					if not event.interrupted then
						RankIconAndNumberWidgetNextBase:beginAnimation( "keyframe", 3369, false, false, CoD.TweenType.Linear )
					end
					RankIconAndNumberWidgetNextBase:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( RankIconAndNumberWidgetNextBase, event )
					else
						RankIconAndNumberWidgetNextBase:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RankIconAndNumberWidgetNextBase:completeAnimation()
				self.RankIconAndNumberWidgetNextBase:setAlpha( 0 )
				RankIconAndNumberWidgetNextBaseFrame2( RankIconAndNumberWidgetNextBase, {} )
				local RankIconAndNumberWidgetPreviousFrame2 = function ( RankIconAndNumberWidgetPrevious, event )
					local RankIconAndNumberWidgetPreviousFrame3 = function ( RankIconAndNumberWidgetPrevious, event )
						local RankIconAndNumberWidgetPreviousFrame4 = function ( RankIconAndNumberWidgetPrevious, event )
							local RankIconAndNumberWidgetPreviousFrame5 = function ( RankIconAndNumberWidgetPrevious, event )
								if not event.interrupted then
									RankIconAndNumberWidgetPrevious:beginAnimation( "keyframe", 1789, false, false, CoD.TweenType.Linear )
								end
								RankIconAndNumberWidgetPrevious:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( RankIconAndNumberWidgetPrevious, event )
								else
									RankIconAndNumberWidgetPrevious:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								RankIconAndNumberWidgetPreviousFrame5( RankIconAndNumberWidgetPrevious, event )
								return 
							else
								RankIconAndNumberWidgetPrevious:beginAnimation( "keyframe", 690, false, false, CoD.TweenType.Bounce )
								RankIconAndNumberWidgetPrevious:registerEventHandler( "transition_complete_keyframe", RankIconAndNumberWidgetPreviousFrame5 )
							end
						end
						
						if event.interrupted then
							RankIconAndNumberWidgetPreviousFrame4( RankIconAndNumberWidgetPrevious, event )
							return 
						else
							RankIconAndNumberWidgetPrevious:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
							RankIconAndNumberWidgetPrevious:setAlpha( 0 )
							RankIconAndNumberWidgetPrevious:registerEventHandler( "transition_complete_keyframe", RankIconAndNumberWidgetPreviousFrame4 )
						end
					end
					
					if event.interrupted then
						RankIconAndNumberWidgetPreviousFrame3( RankIconAndNumberWidgetPrevious, event )
						return 
					else
						RankIconAndNumberWidgetPrevious:beginAnimation( "keyframe", 649, false, false, CoD.TweenType.Linear )
						RankIconAndNumberWidgetPrevious:registerEventHandler( "transition_complete_keyframe", RankIconAndNumberWidgetPreviousFrame3 )
					end
				end
				
				RankIconAndNumberWidgetPrevious:completeAnimation()
				self.RankIconAndNumberWidgetPrevious:setAlpha( 1 )
				RankIconAndNumberWidgetPreviousFrame2( RankIconAndNumberWidgetPrevious, {} )
				local f17_local4 = function ( f27_arg0, f27_arg1 )
					local f27_local0 = function ( f28_arg0, f28_arg1 )
						if not f28_arg1.interrupted then
							f28_arg0:beginAnimation( "keyframe", 2389, false, false, CoD.TweenType.Linear )
						end
						f28_arg0:setAlpha( 0 )
						if f28_arg1.interrupted then
							self.clipFinished( f28_arg0, f28_arg1 )
						else
							f28_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f27_arg1.interrupted then
						f27_local0( f27_arg0, f27_arg1 )
						return 
					else
						f27_arg0:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
						f27_arg0:setAlpha( 0 )
						f27_arg0:registerEventHandler( "transition_complete_keyframe", f27_local0 )
					end
				end
				
				XPEarnedDisplay:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
				XPEarnedDisplay:setAlpha( 1 )
				XPEarnedDisplay:registerEventHandler( "transition_complete_keyframe", f17_local4 )
				ProgressDescription:beginAnimation( "keyframe", 3369, false, false, CoD.TweenType.Linear )
				ProgressDescription:setAlpha( 0 )
				ProgressDescription:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				local f17_local5 = function ( f29_arg0, f29_arg1 )
					local f29_local0 = function ( f30_arg0, f30_arg1 )
						if not f30_arg1.interrupted then
							f30_arg0:beginAnimation( "keyframe", 2389, false, false, CoD.TweenType.Linear )
						end
						f30_arg0:setAlpha( 0 )
						if f30_arg1.interrupted then
							self.clipFinished( f30_arg0, f30_arg1 )
						else
							f30_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f29_arg1.interrupted then
						f29_local0( f29_arg0, f29_arg1 )
						return 
					else
						f29_arg0:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
						f29_arg0:setAlpha( 0 )
						f29_arg0:registerEventHandler( "transition_complete_keyframe", f29_local0 )
					end
				end
				
				NextLevelDisplay:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
				NextLevelDisplay:setAlpha( 1 )
				NextLevelDisplay:registerEventHandler( "transition_complete_keyframe", f17_local5 )
				local BackGlowFrame2 = function ( BackGlow, event )
					local BackGlowFrame3 = function ( BackGlow, event )
						local BackGlowFrame4 = function ( BackGlow, event )
							if not event.interrupted then
								BackGlow:beginAnimation( "keyframe", 1589, false, false, CoD.TweenType.Linear )
							end
							BackGlow:setLeftRight( true, false, -44.83, 116.17 )
							BackGlow:setTopBottom( true, false, -31.59, 105.01 )
							BackGlow:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( BackGlow, event )
							else
								BackGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							BackGlowFrame4( BackGlow, event )
							return 
						else
							BackGlow:beginAnimation( "keyframe", 470, true, true, CoD.TweenType.Linear )
							BackGlow:setLeftRight( true, false, -44.83, 116.17 )
							BackGlow:registerEventHandler( "transition_complete_keyframe", BackGlowFrame4 )
						end
					end
					
					if event.interrupted then
						BackGlowFrame3( BackGlow, event )
						return 
					else
						BackGlow:beginAnimation( "keyframe", 1309, false, false, CoD.TweenType.Linear )
						BackGlow:setLeftRight( true, false, 1034.17, 1195.17 )
						BackGlow:registerEventHandler( "transition_complete_keyframe", BackGlowFrame3 )
					end
				end
				
				BackGlow:completeAnimation()
				self.BackGlow:setLeftRight( true, false, 1034.17, 1195.17 )
				self.BackGlow:setTopBottom( true, false, -31.59, 105.01 )
				self.BackGlow:setAlpha( 0 )
				BackGlowFrame2( BackGlow, {} )
				local RankIconAndNumberWidgetNextTopFrame2 = function ( RankIconAndNumberWidgetNextTop, event )
					local RankIconAndNumberWidgetNextTopFrame3 = function ( RankIconAndNumberWidgetNextTop, event )
						local RankIconAndNumberWidgetNextTopFrame4 = function ( RankIconAndNumberWidgetNextTop, event )
							local RankIconAndNumberWidgetNextTopFrame5 = function ( RankIconAndNumberWidgetNextTop, event )
								local RankIconAndNumberWidgetNextTopFrame6 = function ( RankIconAndNumberWidgetNextTop, event )
									local RankIconAndNumberWidgetNextTopFrame7 = function ( RankIconAndNumberWidgetNextTop, event )
										if not event.interrupted then
											RankIconAndNumberWidgetNextTop:beginAnimation( "keyframe", 2480, false, false, CoD.TweenType.Linear )
										end
										RankIconAndNumberWidgetNextTop:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( RankIconAndNumberWidgetNextTop, event )
										else
											RankIconAndNumberWidgetNextTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										RankIconAndNumberWidgetNextTopFrame7( RankIconAndNumberWidgetNextTop, event )
										return 
									else
										RankIconAndNumberWidgetNextTop:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
										RankIconAndNumberWidgetNextTop:setAlpha( 0 )
										RankIconAndNumberWidgetNextTop:registerEventHandler( "transition_complete_keyframe", RankIconAndNumberWidgetNextTopFrame7 )
									end
								end
								
								if event.interrupted then
									RankIconAndNumberWidgetNextTopFrame6( RankIconAndNumberWidgetNextTop, event )
									return 
								else
									RankIconAndNumberWidgetNextTop:beginAnimation( "keyframe", 469, false, false, CoD.TweenType.Linear )
									RankIconAndNumberWidgetNextTop:registerEventHandler( "transition_complete_keyframe", RankIconAndNumberWidgetNextTopFrame6 )
								end
							end
							
							if event.interrupted then
								RankIconAndNumberWidgetNextTopFrame5( RankIconAndNumberWidgetNextTop, event )
								return 
							else
								RankIconAndNumberWidgetNextTop:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
								RankIconAndNumberWidgetNextTop:setAlpha( 1 )
								RankIconAndNumberWidgetNextTop:registerEventHandler( "transition_complete_keyframe", RankIconAndNumberWidgetNextTopFrame5 )
							end
						end
						
						if event.interrupted then
							RankIconAndNumberWidgetNextTopFrame4( RankIconAndNumberWidgetNextTop, event )
							return 
						else
							RankIconAndNumberWidgetNextTop:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							RankIconAndNumberWidgetNextTop:setAlpha( 0 )
							RankIconAndNumberWidgetNextTop:registerEventHandler( "transition_complete_keyframe", RankIconAndNumberWidgetNextTopFrame4 )
						end
					end
					
					if event.interrupted then
						RankIconAndNumberWidgetNextTopFrame3( RankIconAndNumberWidgetNextTop, event )
						return 
					else
						RankIconAndNumberWidgetNextTop:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						RankIconAndNumberWidgetNextTop:registerEventHandler( "transition_complete_keyframe", RankIconAndNumberWidgetNextTopFrame3 )
					end
				end
				
				RankIconAndNumberWidgetNextTop:completeAnimation()
				self.RankIconAndNumberWidgetNextTop:setAlpha( 1 )
				RankIconAndNumberWidgetNextTopFrame2( RankIconAndNumberWidgetNextTop, {} )
				local Glow0Frame2 = function ( Glow0, event )
					local Glow0Frame3 = function ( Glow0, event )
						local Glow0Frame4 = function ( Glow0, event )
							local Glow0Frame5 = function ( Glow0, event )
								local Glow0Frame6 = function ( Glow0, event )
									local Glow0Frame7 = function ( Glow0, event )
										local Glow0Frame8 = function ( Glow0, event )
											local Glow0Frame9 = function ( Glow0, event )
												if not event.interrupted then
													Glow0:beginAnimation( "keyframe", 2239, false, false, CoD.TweenType.Linear )
												end
												Glow0:setLeftRight( false, false, 403.12, 703.12 )
												Glow0:setTopBottom( false, true, -29.79, -4.79 )
												Glow0:setAlpha( 0 )
												if event.interrupted then
													self.clipFinished( Glow0, event )
												else
													Glow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												Glow0Frame9( Glow0, event )
												return 
											else
												Glow0:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
												Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame9 )
											end
										end
										
										if event.interrupted then
											Glow0Frame8( Glow0, event )
											return 
										else
											Glow0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
											Glow0:setTopBottom( false, true, -29.79, -4.79 )
											Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame8 )
										end
									end
									
									if event.interrupted then
										Glow0Frame7( Glow0, event )
										return 
									else
										Glow0:beginAnimation( "keyframe", 479, false, false, CoD.TweenType.Bounce )
										Glow0:setTopBottom( false, true, -30.7, -4.79 )
										Glow0:setAlpha( 0 )
										Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame7 )
									end
								end
								
								if event.interrupted then
									Glow0Frame6( Glow0, event )
									return 
								else
									Glow0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									Glow0:setTopBottom( false, true, -35.59, -4.79 )
									Glow0:setAlpha( 0.51 )
									Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame6 )
								end
							end
							
							if event.interrupted then
								Glow0Frame5( Glow0, event )
								return 
							else
								Glow0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								Glow0:setTopBottom( false, true, -35.79, -4.79 )
								Glow0:setAlpha( 0.42 )
								Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame5 )
							end
						end
						
						if event.interrupted then
							Glow0Frame4( Glow0, event )
							return 
						else
							Glow0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							Glow0:setTopBottom( false, true, -42, -4.79 )
							Glow0:setAlpha( 0.37 )
							Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame4 )
						end
					end
					
					if event.interrupted then
						Glow0Frame3( Glow0, event )
						return 
					else
						Glow0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						Glow0:setTopBottom( false, true, -46.79, -4.79 )
						Glow0:setAlpha( 0.28 )
						Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame3 )
					end
				end
				
				Glow0:completeAnimation()
				self.Glow0:setLeftRight( false, false, 403.12, 703.12 )
				self.Glow0:setTopBottom( false, true, -29.79, -4.79 )
				self.Glow0:setAlpha( 0 )
				Glow0Frame2( Glow0, {} )
				local Glow1Frame2 = function ( Glow1, event )
					local Glow1Frame3 = function ( Glow1, event )
						local Glow1Frame4 = function ( Glow1, event )
							local Glow1Frame5 = function ( Glow1, event )
								local Glow1Frame6 = function ( Glow1, event )
									local Glow1Frame7 = function ( Glow1, event )
										if not event.interrupted then
											Glow1:beginAnimation( "keyframe", 1599, false, false, CoD.TweenType.Linear )
										end
										Glow1:setLeftRight( false, false, 488.62, 596.62 )
										Glow1:setTopBottom( false, true, -61.8, 22.21 )
										Glow1:setRGB( 0.59, 0.31, 0 )
										Glow1:setAlpha( 0 )
										Glow1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
										if event.interrupted then
											self.clipFinished( Glow1, event )
										else
											Glow1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										Glow1Frame7( Glow1, event )
										return 
									else
										Glow1:beginAnimation( "keyframe", 1069, false, false, CoD.TweenType.Linear )
										Glow1:setLeftRight( false, false, 488.62, 596.62 )
										Glow1:setTopBottom( false, true, -61.8, 22.21 )
										Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame7 )
									end
								end
								
								if event.interrupted then
									Glow1Frame6( Glow1, event )
									return 
								else
									Glow1:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Bounce )
									Glow1:setLeftRight( false, false, 498.29, 594.69 )
									Glow1:setTopBottom( false, true, -64.38, 17.7 )
									Glow1:setAlpha( 0 )
									Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame6 )
								end
							end
							
							if event.interrupted then
								Glow1Frame5( Glow1, event )
								return 
							else
								Glow1:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
								Glow1:setLeftRight( false, false, 499.55, 594.43 )
								Glow1:setTopBottom( false, true, -64.71, 17.11 )
								Glow1:setRGB( 0.59, 0.31, 0 )
								Glow1:setAlpha( 0.09 )
								Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame5 )
							end
						end
						
						if event.interrupted then
							Glow1Frame4( Glow1, event )
							return 
						else
							Glow1:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
							Glow1:setLeftRight( false, false, 503.62, 593.62 )
							Glow1:setTopBottom( false, true, -65.8, 15.21 )
							Glow1:setRGB( 0.88, 0.62, 0 )
							Glow1:setAlpha( 0.84 )
							Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame4 )
						end
					end
					
					if event.interrupted then
						Glow1Frame3( Glow1, event )
						return 
					else
						Glow1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						Glow1:setLeftRight( false, false, 504.87, 594.87 )
						Glow1:setTopBottom( false, true, -53.25, 15.02 )
						Glow1:setRGB( 0.94, 0.69, 0 )
						Glow1:setAlpha( 1 )
						Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame3 )
					end
				end
				
				Glow1:completeAnimation()
				self.Glow1:setLeftRight( false, false, 505, 595 )
				self.Glow1:setTopBottom( false, true, -52, 15 )
				self.Glow1:setRGB( 0.95, 0.7, 0 )
				self.Glow1:setAlpha( 0 )
				self.Glow1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
				Glow1Frame2( Glow1, {} )
				local MeterGlowFrame2 = function ( MeterGlow, event )
					local MeterGlowFrame3 = function ( MeterGlow, event )
						local MeterGlowFrame4 = function ( MeterGlow, event )
							local MeterGlowFrame5 = function ( MeterGlow, event )
								if not event.interrupted then
									MeterGlow:beginAnimation( "keyframe", 2599, false, false, CoD.TweenType.Linear )
								end
								MeterGlow:setRGB( 1, 0.2, 0 )
								MeterGlow:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( MeterGlow, event )
								else
									MeterGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								MeterGlowFrame5( MeterGlow, event )
								return 
							else
								MeterGlow:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Bounce )
								MeterGlow:setAlpha( 0 )
								MeterGlow:registerEventHandler( "transition_complete_keyframe", MeterGlowFrame5 )
							end
						end
						
						if event.interrupted then
							MeterGlowFrame4( MeterGlow, event )
							return 
						else
							MeterGlow:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
							MeterGlow:setRGB( 1, 0.2, 0 )
							MeterGlow:registerEventHandler( "transition_complete_keyframe", MeterGlowFrame4 )
						end
					end
					
					if event.interrupted then
						MeterGlowFrame3( MeterGlow, event )
						return 
					else
						MeterGlow:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						MeterGlow:setRGB( 1, 0.52, 0 )
						MeterGlow:setAlpha( 1 )
						MeterGlow:registerEventHandler( "transition_complete_keyframe", MeterGlowFrame3 )
					end
				end
				
				MeterGlow:completeAnimation()
				self.MeterGlow:setRGB( 1, 0.2, 0 )
				self.MeterGlow:setAlpha( 0 )
				MeterGlowFrame2( MeterGlow, {} )
				local f17_local11 = function ( f58_arg0, f58_arg1 )
					local f58_local0 = function ( f59_arg0, f59_arg1 )
						local f59_local0 = function ( f60_arg0, f60_arg1 )
							local f60_local0 = function ( f61_arg0, f61_arg1 )
								local f61_local0 = function ( f62_arg0, f62_arg1 )
									local f62_local0 = function ( f63_arg0, f63_arg1 )
										local f63_local0 = function ( f64_arg0, f64_arg1 )
											local f64_local0 = function ( f65_arg0, f65_arg1 )
												local f65_local0 = function ( f66_arg0, f66_arg1 )
													local f66_local0 = function ( f67_arg0, f67_arg1 )
														if not f67_arg1.interrupted then
															f67_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
														end
														f67_arg0:setLeftRight( true, false, 0, 246 )
														f67_arg0:setTopBottom( true, false, 9, 49 )
														f67_arg0:setAlpha( 0 )
														if f67_arg1.interrupted then
															self.clipFinished( f67_arg0, f67_arg1 )
														else
															f67_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if f66_arg1.interrupted then
														f66_local0( f66_arg0, f66_arg1 )
														return 
													else
														f66_arg0:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
														f66_arg0:setLeftRight( true, false, 132, 377.7 )
														f66_arg0:setAlpha( 0 )
														f66_arg0:registerEventHandler( "transition_complete_keyframe", f66_local0 )
													end
												end
												
												if f65_arg1.interrupted then
													f65_local0( f65_arg0, f65_arg1 )
													return 
												else
													f65_arg0:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
													f65_arg0:setLeftRight( true, false, 440, 685 )
													f65_arg0:setAlpha( 0.23 )
													f65_arg0:registerEventHandler( "transition_complete_keyframe", f65_local0 )
												end
											end
											
											if f64_arg1.interrupted then
												f64_local0( f64_arg0, f64_arg1 )
												return 
											else
												f64_arg0:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
												f64_arg0:setLeftRight( true, false, 446.22, 691.22 )
												f64_arg0:registerEventHandler( "transition_complete_keyframe", f64_local0 )
											end
										end
										
										if f63_arg1.interrupted then
											f63_local0( f63_arg0, f63_arg1 )
											return 
										else
											f63_arg0:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
											f63_arg0:setLeftRight( true, false, 450, 695 )
											f63_arg0:registerEventHandler( "transition_complete_keyframe", f63_local0 )
										end
									end
									
									if f62_arg1.interrupted then
										f62_local0( f62_arg0, f62_arg1 )
										return 
									else
										f62_arg0:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
										f62_arg0:setLeftRight( true, false, 449.88, 695.5 )
										f62_arg0:registerEventHandler( "transition_complete_keyframe", f62_local0 )
									end
								end
								
								if f61_arg1.interrupted then
									f61_local0( f61_arg0, f61_arg1 )
									return 
								else
									f61_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									f61_arg0:setLeftRight( true, false, 447, 707.93 )
									f61_arg0:registerEventHandler( "transition_complete_keyframe", f61_local0 )
								end
							end
							
							if f60_arg1.interrupted then
								f60_local0( f60_arg0, f60_arg1 )
								return 
							else
								f60_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f60_arg0:setLeftRight( true, false, 483.8, 731.99 )
								f60_arg0:setAlpha( 1 )
								f60_arg0:registerEventHandler( "transition_complete_keyframe", f60_local0 )
							end
						end
						
						if f59_arg1.interrupted then
							f59_local0( f59_arg0, f59_arg1 )
							return 
						else
							f59_arg0:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
							f59_arg0:setLeftRight( true, false, 505.5, 750.5 )
							f59_arg0:setAlpha( 0.88 )
							f59_arg0:registerEventHandler( "transition_complete_keyframe", f59_local0 )
						end
					end
					
					if f58_arg1.interrupted then
						f58_local0( f58_arg0, f58_arg1 )
						return 
					else
						f58_arg0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
						f58_arg0:setLeftRight( true, false, 714.69, 959.69 )
						f58_arg0:registerEventHandler( "transition_complete_keyframe", f58_local0 )
					end
				end
				
				RankIconAndNumberBig:beginAnimation( "keyframe", 639, false, false, CoD.TweenType.Linear )
				RankIconAndNumberBig:setLeftRight( true, false, 894, 1139 )
				RankIconAndNumberBig:setTopBottom( true, false, 9, 49 )
				RankIconAndNumberBig:setAlpha( 0 )
				RankIconAndNumberBig:registerEventHandler( "transition_complete_keyframe", f17_local11 )
				local f17_local12 = function ( f68_arg0, f68_arg1 )
					local f68_local0 = function ( f69_arg0, f69_arg1 )
						local f69_local0 = function ( f70_arg0, f70_arg1 )
							local f70_local0 = function ( f71_arg0, f71_arg1 )
								local f71_local0 = function ( f72_arg0, f72_arg1 )
									local f72_local0 = function ( f73_arg0, f73_arg1 )
										local f73_local0 = function ( f74_arg0, f74_arg1 )
											local f74_local0 = function ( f75_arg0, f75_arg1 )
												local f75_local0 = function ( f76_arg0, f76_arg1 )
													local f76_local0 = function ( f77_arg0, f77_arg1 )
														local f77_local0 = function ( f78_arg0, f78_arg1 )
															local f78_local0 = function ( f79_arg0, f79_arg1 )
																local f79_local0 = function ( f80_arg0, f80_arg1 )
																	local f80_local0 = function ( f81_arg0, f81_arg1 )
																		local f81_local0 = function ( f82_arg0, f82_arg1 )
																			local f82_local0 = function ( f83_arg0, f83_arg1 )
																				local f83_local0 = function ( f84_arg0, f84_arg1 )
																					local f84_local0 = function ( f85_arg0, f85_arg1 )
																						local f85_local0 = function ( f86_arg0, f86_arg1 )
																							local f86_local0 = function ( f87_arg0, f87_arg1 )
																								local f87_local0 = function ( f88_arg0, f88_arg1 )
																									local f88_local0 = function ( f89_arg0, f89_arg1 )
																										local f89_local0 = function ( f90_arg0, f90_arg1 )
																											local f90_local0 = function ( f91_arg0, f91_arg1 )
																												local f91_local0 = function ( f92_arg0, f92_arg1 )
																													local f92_local0 = function ( f93_arg0, f93_arg1 )
																														local f93_local0 = function ( f94_arg0, f94_arg1 )
																															local f94_local0 = function ( f95_arg0, f95_arg1 )
																																local f95_local0 = function ( f96_arg0, f96_arg1 )
																																	local f96_local0 = function ( f97_arg0, f97_arg1 )
																																		local f97_local0 = function ( f98_arg0, f98_arg1 )
																																			local f98_local0 = function ( f99_arg0, f99_arg1 )
																																				local f99_local0 = function ( f100_arg0, f100_arg1 )
																																					local f100_local0 = function ( f101_arg0, f101_arg1 )
																																						local f101_local0 = function ( f102_arg0, f102_arg1 )
																																							local f102_local0 = function ( f103_arg0, f103_arg1 )
																																								local f103_local0 = function ( f104_arg0, f104_arg1 )
																																									local f104_local0 = function ( f105_arg0, f105_arg1 )
																																										local f105_local0 = function ( f106_arg0, f106_arg1 )
																																											local f106_local0 = function ( f107_arg0, f107_arg1 )
																																												local f107_local0 = function ( f108_arg0, f108_arg1 )
																																													if not f108_arg1.interrupted then
																																														f108_arg0:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Linear )
																																													end
																																													f108_arg0:setAlpha( 0 )
																																													if f108_arg1.interrupted then
																																														self.clipFinished( f108_arg0, f108_arg1 )
																																													else
																																														f108_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																																													end
																																												end
																																												
																																												if f107_arg1.interrupted then
																																													f107_local0( f107_arg0, f107_arg1 )
																																													return 
																																												else
																																													f107_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																																													f107_arg0:registerEventHandler( "transition_complete_keyframe", f107_local0 )
																																												end
																																											end
																																											
																																											if f106_arg1.interrupted then
																																												f106_local0( f106_arg0, f106_arg1 )
																																												return 
																																											else
																																												f106_arg0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																												f106_arg0:setAlpha( 0 )
																																												f106_arg0:registerEventHandler( "transition_complete_keyframe", f106_local0 )
																																											end
																																										end
																																										
																																										if f105_arg1.interrupted then
																																											f105_local0( f105_arg0, f105_arg1 )
																																											return 
																																										else
																																											f105_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																											f105_arg0:setAlpha( 1 )
																																											f105_arg0:registerEventHandler( "transition_complete_keyframe", f105_local0 )
																																										end
																																									end
																																									
																																									if f104_arg1.interrupted then
																																										f104_local0( f104_arg0, f104_arg1 )
																																										return 
																																									else
																																										f104_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																																										f104_arg0:registerEventHandler( "transition_complete_keyframe", f104_local0 )
																																									end
																																								end
																																								
																																								if f103_arg1.interrupted then
																																									f103_local0( f103_arg0, f103_arg1 )
																																									return 
																																								else
																																									f103_arg0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																																									f103_arg0:setAlpha( 0 )
																																									f103_arg0:registerEventHandler( "transition_complete_keyframe", f103_local0 )
																																								end
																																							end
																																							
																																							if f102_arg1.interrupted then
																																								f102_local0( f102_arg0, f102_arg1 )
																																								return 
																																							else
																																								f102_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
																																								f102_arg0:setAlpha( 1 )
																																								f102_arg0:registerEventHandler( "transition_complete_keyframe", f102_local0 )
																																							end
																																						end
																																						
																																						if f101_arg1.interrupted then
																																							f101_local0( f101_arg0, f101_arg1 )
																																							return 
																																						else
																																							f101_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																																							f101_arg0:registerEventHandler( "transition_complete_keyframe", f101_local0 )
																																						end
																																					end
																																					
																																					if f100_arg1.interrupted then
																																						f100_local0( f100_arg0, f100_arg1 )
																																						return 
																																					else
																																						f100_arg0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																																						f100_arg0:setAlpha( 0 )
																																						f100_arg0:registerEventHandler( "transition_complete_keyframe", f100_local0 )
																																					end
																																				end
																																				
																																				if f99_arg1.interrupted then
																																					f99_local0( f99_arg0, f99_arg1 )
																																					return 
																																				else
																																					f99_arg0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
																																					f99_arg0:setAlpha( 1 )
																																					f99_arg0:registerEventHandler( "transition_complete_keyframe", f99_local0 )
																																				end
																																			end
																																			
																																			if f98_arg1.interrupted then
																																				f98_local0( f98_arg0, f98_arg1 )
																																				return 
																																			else
																																				f98_arg0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																																				f98_arg0:registerEventHandler( "transition_complete_keyframe", f98_local0 )
																																			end
																																		end
																																		
																																		if f97_arg1.interrupted then
																																			f97_local0( f97_arg0, f97_arg1 )
																																			return 
																																		else
																																			f97_arg0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																																			f97_arg0:registerEventHandler( "transition_complete_keyframe", f97_local0 )
																																		end
																																	end
																																	
																																	if f96_arg1.interrupted then
																																		f96_local0( f96_arg0, f96_arg1 )
																																		return 
																																	else
																																		f96_arg0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
																																		f96_arg0:setAlpha( 0 )
																																		f96_arg0:registerEventHandler( "transition_complete_keyframe", f96_local0 )
																																	end
																																end
																																
																																if f95_arg1.interrupted then
																																	f95_local0( f95_arg0, f95_arg1 )
																																	return 
																																else
																																	f95_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																																	f95_arg0:setAlpha( 0.85 )
																																	f95_arg0:registerEventHandler( "transition_complete_keyframe", f95_local0 )
																																end
																															end
																															
																															if f94_arg1.interrupted then
																																f94_local0( f94_arg0, f94_arg1 )
																																return 
																															else
																																f94_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
																																f94_arg0:registerEventHandler( "transition_complete_keyframe", f94_local0 )
																															end
																														end
																														
																														if f93_arg1.interrupted then
																															f93_local0( f93_arg0, f93_arg1 )
																															return 
																														else
																															f93_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																															f93_arg0:registerEventHandler( "transition_complete_keyframe", f93_local0 )
																														end
																													end
																													
																													if f92_arg1.interrupted then
																														f92_local0( f92_arg0, f92_arg1 )
																														return 
																													else
																														f92_arg0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																														f92_arg0:setAlpha( 0 )
																														f92_arg0:registerEventHandler( "transition_complete_keyframe", f92_local0 )
																													end
																												end
																												
																												if f91_arg1.interrupted then
																													f91_local0( f91_arg0, f91_arg1 )
																													return 
																												else
																													f91_arg0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																													f91_arg0:setAlpha( 1 )
																													f91_arg0:registerEventHandler( "transition_complete_keyframe", f91_local0 )
																												end
																											end
																											
																											if f90_arg1.interrupted then
																												f90_local0( f90_arg0, f90_arg1 )
																												return 
																											else
																												f90_arg0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																												f90_arg0:setAlpha( 0 )
																												f90_arg0:registerEventHandler( "transition_complete_keyframe", f90_local0 )
																											end
																										end
																										
																										if f89_arg1.interrupted then
																											f89_local0( f89_arg0, f89_arg1 )
																											return 
																										else
																											f89_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
																											f89_arg0:setAlpha( 1 )
																											f89_arg0:registerEventHandler( "transition_complete_keyframe", f89_local0 )
																										end
																									end
																									
																									if f88_arg1.interrupted then
																										f88_local0( f88_arg0, f88_arg1 )
																										return 
																									else
																										f88_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																										f88_arg0:registerEventHandler( "transition_complete_keyframe", f88_local0 )
																									end
																								end
																								
																								if f87_arg1.interrupted then
																									f87_local0( f87_arg0, f87_arg1 )
																									return 
																								else
																									f87_arg0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																									f87_arg0:setAlpha( 0 )
																									f87_arg0:registerEventHandler( "transition_complete_keyframe", f87_local0 )
																								end
																							end
																							
																							if f86_arg1.interrupted then
																								f86_local0( f86_arg0, f86_arg1 )
																								return 
																							else
																								f86_arg0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																								f86_arg0:registerEventHandler( "transition_complete_keyframe", f86_local0 )
																							end
																						end
																						
																						if f85_arg1.interrupted then
																							f85_local0( f85_arg0, f85_arg1 )
																							return 
																						else
																							f85_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
																							f85_arg0:setAlpha( 1 )
																							f85_arg0:registerEventHandler( "transition_complete_keyframe", f85_local0 )
																						end
																					end
																					
																					if f84_arg1.interrupted then
																						f84_local0( f84_arg0, f84_arg1 )
																						return 
																					else
																						f84_arg0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																						f84_arg0:setAlpha( 0 )
																						f84_arg0:registerEventHandler( "transition_complete_keyframe", f84_local0 )
																					end
																				end
																				
																				if f83_arg1.interrupted then
																					f83_local0( f83_arg0, f83_arg1 )
																					return 
																				else
																					f83_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
																					f83_arg0:setAlpha( 1 )
																					f83_arg0:registerEventHandler( "transition_complete_keyframe", f83_local0 )
																				end
																			end
																			
																			if f82_arg1.interrupted then
																				f82_local0( f82_arg0, f82_arg1 )
																				return 
																			else
																				f82_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																				f82_arg0:registerEventHandler( "transition_complete_keyframe", f82_local0 )
																			end
																		end
																		
																		if f81_arg1.interrupted then
																			f81_local0( f81_arg0, f81_arg1 )
																			return 
																		else
																			f81_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																			f81_arg0:registerEventHandler( "transition_complete_keyframe", f81_local0 )
																		end
																	end
																	
																	if f80_arg1.interrupted then
																		f80_local0( f80_arg0, f80_arg1 )
																		return 
																	else
																		f80_arg0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																		f80_arg0:setAlpha( 0 )
																		f80_arg0:registerEventHandler( "transition_complete_keyframe", f80_local0 )
																	end
																end
																
																if f79_arg1.interrupted then
																	f79_local0( f79_arg0, f79_arg1 )
																	return 
																else
																	f79_arg0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																	f79_arg0:setAlpha( 1 )
																	f79_arg0:registerEventHandler( "transition_complete_keyframe", f79_local0 )
																end
															end
															
															if f78_arg1.interrupted then
																f78_local0( f78_arg0, f78_arg1 )
																return 
															else
																f78_arg0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
																f78_arg0:setAlpha( 0 )
																f78_arg0:registerEventHandler( "transition_complete_keyframe", f78_local0 )
															end
														end
														
														if f77_arg1.interrupted then
															f77_local0( f77_arg0, f77_arg1 )
															return 
														else
															f77_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
															f77_arg0:setAlpha( 1 )
															f77_arg0:registerEventHandler( "transition_complete_keyframe", f77_local0 )
														end
													end
													
													if f76_arg1.interrupted then
														f76_local0( f76_arg0, f76_arg1 )
														return 
													else
														f76_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
														f76_arg0:registerEventHandler( "transition_complete_keyframe", f76_local0 )
													end
												end
												
												if f75_arg1.interrupted then
													f75_local0( f75_arg0, f75_arg1 )
													return 
												else
													f75_arg0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
													f75_arg0:setAlpha( 0 )
													f75_arg0:registerEventHandler( "transition_complete_keyframe", f75_local0 )
												end
											end
											
											if f74_arg1.interrupted then
												f74_local0( f74_arg0, f74_arg1 )
												return 
											else
												f74_arg0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
												f74_arg0:registerEventHandler( "transition_complete_keyframe", f74_local0 )
											end
										end
										
										if f73_arg1.interrupted then
											f73_local0( f73_arg0, f73_arg1 )
											return 
										else
											f73_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											f73_arg0:setAlpha( 1 )
											f73_arg0:registerEventHandler( "transition_complete_keyframe", f73_local0 )
										end
									end
									
									if f72_arg1.interrupted then
										f72_local0( f72_arg0, f72_arg1 )
										return 
									else
										f72_arg0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
										f72_arg0:setAlpha( 0 )
										f72_arg0:registerEventHandler( "transition_complete_keyframe", f72_local0 )
									end
								end
								
								if f71_arg1.interrupted then
									f71_local0( f71_arg0, f71_arg1 )
									return 
								else
									f71_arg0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
									f71_arg0:setAlpha( 1 )
									f71_arg0:registerEventHandler( "transition_complete_keyframe", f71_local0 )
								end
							end
							
							if f70_arg1.interrupted then
								f70_local0( f70_arg0, f70_arg1 )
								return 
							else
								f70_arg0:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
								f70_arg0:setAlpha( 0 )
								f70_arg0:registerEventHandler( "transition_complete_keyframe", f70_local0 )
							end
						end
						
						if f69_arg1.interrupted then
							f69_local0( f69_arg0, f69_arg1 )
							return 
						else
							f69_arg0:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
							f69_arg0:setAlpha( 1 )
							f69_arg0:registerEventHandler( "transition_complete_keyframe", f69_local0 )
						end
					end
					
					if f68_arg1.interrupted then
						f68_local0( f68_arg0, f68_arg1 )
						return 
					else
						f68_arg0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						f68_arg0:registerEventHandler( "transition_complete_keyframe", f68_local0 )
					end
				end
				
				Glow10:beginAnimation( "keyframe", 670, false, false, CoD.TweenType.Linear )
				Glow10:setAlpha( 0 )
				Glow10:registerEventHandler( "transition_complete_keyframe", f17_local12 )
				local f17_local13 = function ( f109_arg0, f109_arg1 )
					local f109_local0 = function ( f110_arg0, f110_arg1 )
						local f110_local0 = function ( f111_arg0, f111_arg1 )
							local f111_local0 = function ( f112_arg0, f112_arg1 )
								local f112_local0 = function ( f113_arg0, f113_arg1 )
									local f113_local0 = function ( f114_arg0, f114_arg1 )
										local f114_local0 = function ( f115_arg0, f115_arg1 )
											local f115_local0 = function ( f116_arg0, f116_arg1 )
												local f116_local0 = function ( f117_arg0, f117_arg1 )
													local f117_local0 = function ( f118_arg0, f118_arg1 )
														local f118_local0 = function ( f119_arg0, f119_arg1 )
															local f119_local0 = function ( f120_arg0, f120_arg1 )
																local f120_local0 = function ( f121_arg0, f121_arg1 )
																	local f121_local0 = function ( f122_arg0, f122_arg1 )
																		local f122_local0 = function ( f123_arg0, f123_arg1 )
																			local f123_local0 = function ( f124_arg0, f124_arg1 )
																				local f124_local0 = function ( f125_arg0, f125_arg1 )
																					if not f125_arg1.interrupted then
																						f125_arg0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																					end
																					f125_arg0:setAlpha( 0 )
																					if f125_arg1.interrupted then
																						self.clipFinished( f125_arg0, f125_arg1 )
																					else
																						f125_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																					end
																				end
																				
																				if f124_arg1.interrupted then
																					f124_local0( f124_arg0, f124_arg1 )
																					return 
																				else
																					f124_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																					f124_arg0:setAlpha( 0 )
																					f124_arg0:registerEventHandler( "transition_complete_keyframe", f124_local0 )
																				end
																			end
																			
																			if f123_arg1.interrupted then
																				f123_local0( f123_arg0, f123_arg1 )
																				return 
																			else
																				f123_arg0:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
																				f123_arg0:setAlpha( 1 )
																				f123_arg0:registerEventHandler( "transition_complete_keyframe", f123_local0 )
																			end
																		end
																		
																		if f122_arg1.interrupted then
																			f122_local0( f122_arg0, f122_arg1 )
																			return 
																		else
																			f122_arg0:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
																			f122_arg0:registerEventHandler( "transition_complete_keyframe", f122_local0 )
																		end
																	end
																	
																	if f121_arg1.interrupted then
																		f121_local0( f121_arg0, f121_arg1 )
																		return 
																	else
																		f121_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																		f121_arg0:setAlpha( 0 )
																		f121_arg0:registerEventHandler( "transition_complete_keyframe", f121_local0 )
																	end
																end
																
																if f120_arg1.interrupted then
																	f120_local0( f120_arg0, f120_arg1 )
																	return 
																else
																	f120_arg0:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
																	f120_arg0:registerEventHandler( "transition_complete_keyframe", f120_local0 )
																end
															end
															
															if f119_arg1.interrupted then
																f119_local0( f119_arg0, f119_arg1 )
																return 
															else
																f119_arg0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
																f119_arg0:setAlpha( 1 )
																f119_arg0:registerEventHandler( "transition_complete_keyframe", f119_local0 )
															end
														end
														
														if f118_arg1.interrupted then
															f118_local0( f118_arg0, f118_arg1 )
															return 
														else
															f118_arg0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
															f118_arg0:setAlpha( 0 )
															f118_arg0:registerEventHandler( "transition_complete_keyframe", f118_local0 )
														end
													end
													
													if f117_arg1.interrupted then
														f117_local0( f117_arg0, f117_arg1 )
														return 
													else
														f117_arg0:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
														f117_arg0:setAlpha( 1 )
														f117_arg0:registerEventHandler( "transition_complete_keyframe", f117_local0 )
													end
												end
												
												if f116_arg1.interrupted then
													f116_local0( f116_arg0, f116_arg1 )
													return 
												else
													f116_arg0:beginAnimation( "keyframe", 419, false, false, CoD.TweenType.Linear )
													f116_arg0:registerEventHandler( "transition_complete_keyframe", f116_local0 )
												end
											end
											
											if f115_arg1.interrupted then
												f115_local0( f115_arg0, f115_arg1 )
												return 
											else
												f115_arg0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
												f115_arg0:setAlpha( 0 )
												f115_arg0:registerEventHandler( "transition_complete_keyframe", f115_local0 )
											end
										end
										
										if f114_arg1.interrupted then
											f114_local0( f114_arg0, f114_arg1 )
											return 
										else
											f114_arg0:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
											f114_arg0:setAlpha( 1 )
											f114_arg0:registerEventHandler( "transition_complete_keyframe", f114_local0 )
										end
									end
									
									if f113_arg1.interrupted then
										f113_local0( f113_arg0, f113_arg1 )
										return 
									else
										f113_arg0:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
										f113_arg0:setAlpha( 0 )
										f113_arg0:registerEventHandler( "transition_complete_keyframe", f113_local0 )
									end
								end
								
								if f112_arg1.interrupted then
									f112_local0( f112_arg0, f112_arg1 )
									return 
								else
									f112_arg0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
									f112_arg0:setAlpha( 1 )
									f112_arg0:registerEventHandler( "transition_complete_keyframe", f112_local0 )
								end
							end
							
							if f111_arg1.interrupted then
								f111_local0( f111_arg0, f111_arg1 )
								return 
							else
								f111_arg0:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
								f111_arg0:setAlpha( 0 )
								f111_arg0:registerEventHandler( "transition_complete_keyframe", f111_local0 )
							end
						end
						
						if f110_arg1.interrupted then
							f110_local0( f110_arg0, f110_arg1 )
							return 
						else
							f110_arg0:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
							f110_arg0:setAlpha( 1 )
							f110_arg0:registerEventHandler( "transition_complete_keyframe", f110_local0 )
						end
					end
					
					if f109_arg1.interrupted then
						f109_local0( f109_arg0, f109_arg1 )
						return 
					else
						f109_arg0:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
						f109_arg0:registerEventHandler( "transition_complete_keyframe", f109_local0 )
					end
				end
				
				Glow00:beginAnimation( "keyframe", 670, false, false, CoD.TweenType.Linear )
				Glow00:setAlpha( 0 )
				Glow00:registerEventHandler( "transition_complete_keyframe", f17_local13 )
				local promotionSoundFrame2 = function ( promotionSound, event )
					if not event.interrupted then
						promotionSound:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
					end
					promotionSound:playSound( "rank_sound", controller )
					if event.interrupted then
						self.clipFinished( promotionSound, event )
					else
						promotionSound:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				promotionSound:completeAnimation()
				self.promotionSound:playSound( "0", controller )
				promotionSoundFrame2( promotionSound, {} )
				local f17_local15 = function ( f127_arg0, f127_arg1 )
					if not f127_arg1.interrupted then
						f127_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
					end
					f127_arg0:playSound( "rank_music", controller )
					if f127_arg1.interrupted then
						self.clipFinished( f127_arg0, f127_arg1 )
					else
						f127_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				promotionMusic:beginAnimation( "keyframe", 839, false, false, CoD.TweenType.Linear )
				promotionMusic:playSound( "0", controller )
				promotionMusic:registerEventHandler( "transition_complete_keyframe", f17_local15 )

				starterPackXPNotice:completeAnimation()
				self.starterPackXPNotice:setAlpha( 0 )
				self.clipFinished( starterPackXPNotice, {} )
			end,
			FlashNextLevel = function ()
				self:setupElementClipCounter( 11 )

				local f128_local0 = function ( f129_arg0, f129_arg1 )
					if not f129_arg1.interrupted then
						f129_arg0:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
					end
					f129_arg0:setAlpha( 1 )
					if f129_arg1.interrupted then
						self.clipFinished( f129_arg0, f129_arg1 )
					else
						f129_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				XpBarFrame:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
				XpBarFrame:setAlpha( 0 )
				XpBarFrame:registerEventHandler( "transition_complete_keyframe", f128_local0 )
				local f128_local1 = function ( f130_arg0, f130_arg1 )
					if not f130_arg1.interrupted then
						f130_arg0:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
					end
					f130_arg0:setAlpha( 1 )
					if f130_arg1.interrupted then
						self.clipFinished( f130_arg0, f130_arg1 )
					else
						f130_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				XpBar:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
				XpBar:setAlpha( 0 )
				XpBar:registerEventHandler( "transition_complete_keyframe", f128_local1 )
				local f128_local2 = function ( f131_arg0, f131_arg1 )
					if not f131_arg1.interrupted then
						f131_arg0:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
					end
					f131_arg0:setAlpha( 1 )
					if f131_arg1.interrupted then
						self.clipFinished( f131_arg0, f131_arg1 )
					else
						f131_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RankIconAndNumberWidgetPrevious:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
				RankIconAndNumberWidgetPrevious:setAlpha( 0 )
				RankIconAndNumberWidgetPrevious:registerEventHandler( "transition_complete_keyframe", f128_local2 )
				local f128_local3 = function ( f132_arg0, f132_arg1 )
					if not f132_arg1.interrupted then
						f132_arg0:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
					end
					f132_arg0:setAlpha( 1 )
					if f132_arg1.interrupted then
						self.clipFinished( f132_arg0, f132_arg1 )
					else
						f132_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				XPEarnedDisplay:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
				XPEarnedDisplay:setAlpha( 0 )
				XPEarnedDisplay:registerEventHandler( "transition_complete_keyframe", f128_local3 )
				local f128_local4 = function ( f133_arg0, f133_arg1 )
					if not f133_arg1.interrupted then
						f133_arg0:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
					end
					f133_arg0:setAlpha( 1 )
					if f133_arg1.interrupted then
						self.clipFinished( f133_arg0, f133_arg1 )
					else
						f133_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				NextLevelDisplay:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
				NextLevelDisplay:setAlpha( 0 )
				NextLevelDisplay:registerEventHandler( "transition_complete_keyframe", f128_local4 )
				BackGlow:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
				BackGlow:setAlpha( 0 )
				BackGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				local f128_local5 = function ( f134_arg0, f134_arg1 )
					if not f134_arg1.interrupted then
						f134_arg0:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
					end
					f134_arg0:setAlpha( 1 )
					if f134_arg1.interrupted then
						self.clipFinished( f134_arg0, f134_arg1 )
					else
						f134_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RankIconAndNumberWidgetNextTop:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
				RankIconAndNumberWidgetNextTop:setAlpha( 0 )
				RankIconAndNumberWidgetNextTop:registerEventHandler( "transition_complete_keyframe", f128_local5 )
				local Glow0Frame2 = function ( Glow0, event )
					if not event.interrupted then
						Glow0:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					Glow0:setLeftRight( false, false, -673, -463 )
					Glow0:setTopBottom( false, true, -44.79, -10.79 )
					if event.interrupted then
						self.clipFinished( Glow0, event )
					else
						Glow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow0:completeAnimation()
				self.Glow0:setLeftRight( false, false, -626.5, -535.5 )
				self.Glow0:setTopBottom( false, true, -42, -13.5 )
				Glow0Frame2( Glow0, {} )
				local Glow1Frame2 = function ( Glow1, event )
					local Glow1Frame3 = function ( Glow1, event )
						if not event.interrupted then
							Glow1:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						end
						Glow1:setLeftRight( false, false, -625, -525 )
						Glow1:setTopBottom( false, true, -65, 11 )
						Glow1:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Glow1, event )
						else
							Glow1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Glow1Frame3( Glow1, event )
						return 
					else
						Glow1:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame3 )
					end
				end
				
				Glow1:completeAnimation()
				self.Glow1:setLeftRight( false, false, -625, -525 )
				self.Glow1:setTopBottom( false, true, -65, 11 )
				self.Glow1:setAlpha( 0 )
				Glow1Frame2( Glow1, {} )
				local MeterGlowFrame2 = function ( MeterGlow, event )
					local MeterGlowFrame3 = function ( MeterGlow, event )
						if not event.interrupted then
							MeterGlow:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
						end
						MeterGlow:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( MeterGlow, event )
						else
							MeterGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						MeterGlowFrame3( MeterGlow, event )
						return 
					else
						MeterGlow:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						MeterGlow:setAlpha( 1 )
						MeterGlow:registerEventHandler( "transition_complete_keyframe", MeterGlowFrame3 )
					end
				end
				
				MeterGlow:completeAnimation()
				self.MeterGlow:setAlpha( 0 )
				MeterGlowFrame2( MeterGlow, {} )

				starterPackXPNotice:completeAnimation()
				self.starterPackXPNotice:setAlpha( 0 )
				self.clipFinished( starterPackXPNotice, {} )
			end,
			FlashLastLevel = function ()
				self:setupElementClipCounter( 11 )

				XpBarFrame:completeAnimation()
				self.XpBarFrame:setAlpha( 0 )
				self.clipFinished( XpBarFrame, {} )

				XpBar:completeAnimation()
				self.XpBar:setAlpha( 0 )
				self.clipFinished( XpBar, {} )
				local f140_local0 = function ( f141_arg0, f141_arg1 )
					if not f141_arg1.interrupted then
						f141_arg0:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
					end
					f141_arg0:setAlpha( 1 )
					if f141_arg1.interrupted then
						self.clipFinished( f141_arg0, f141_arg1 )
					else
						f141_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RankIconAndNumberWidgetPrevious:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
				RankIconAndNumberWidgetPrevious:setAlpha( 0 )
				RankIconAndNumberWidgetPrevious:registerEventHandler( "transition_complete_keyframe", f140_local0 )
				local f140_local1 = function ( f142_arg0, f142_arg1 )
					if not f142_arg1.interrupted then
						f142_arg0:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
					end
					f142_arg0:setAlpha( 1 )
					if f142_arg1.interrupted then
						self.clipFinished( f142_arg0, f142_arg1 )
					else
						f142_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				XPEarnedDisplay:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
				XPEarnedDisplay:setAlpha( 0 )
				XPEarnedDisplay:registerEventHandler( "transition_complete_keyframe", f140_local1 )

				NextLevelDisplay:completeAnimation()
				self.NextLevelDisplay:setAlpha( 0 )
				self.clipFinished( NextLevelDisplay, {} )

				BackGlow:completeAnimation()
				self.BackGlow:setAlpha( 0 )
				self.clipFinished( BackGlow, {} )

				RankIconAndNumberWidgetNextTop:completeAnimation()
				self.RankIconAndNumberWidgetNextTop:setAlpha( 0 )
				self.clipFinished( RankIconAndNumberWidgetNextTop, {} )

				Glow0:completeAnimation()
				self.Glow0:setLeftRight( false, false, -686.38, -386.38 )
				self.Glow0:setTopBottom( false, true, -29.79, -4.79 )
				self.Glow0:setAlpha( 0 )
				self.clipFinished( Glow0, {} )
				local Glow1Frame2 = function ( Glow1, event )
					local Glow1Frame3 = function ( Glow1, event )
						if not event.interrupted then
							Glow1:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
						end
						Glow1:setLeftRight( false, false, -625, -525 )
						Glow1:setTopBottom( false, true, -65, 11 )
						Glow1:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Glow1, event )
						else
							Glow1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Glow1Frame3( Glow1, event )
						return 
					else
						Glow1:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame3 )
					end
				end
				
				Glow1:completeAnimation()
				self.Glow1:setLeftRight( false, false, -625, -525 )
				self.Glow1:setTopBottom( false, true, -65, 11 )
				self.Glow1:setAlpha( 0.84 )
				Glow1Frame2( Glow1, {} )

				MeterGlow:completeAnimation()
				self.MeterGlow:setAlpha( 0 )
				self.clipFinished( MeterGlow, {} )

				starterPackXPNotice:completeAnimation()
				self.starterPackXPNotice:setAlpha( 0 )
				self.clipFinished( starterPackXPNotice, {} )
			end
		},
		Arabic = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )

				RankIconAndNumberWidgetPrevious:completeAnimation()
				self.RankIconAndNumberWidgetPrevious:setAlpha( 1 )
				self.clipFinished( RankIconAndNumberWidgetPrevious, {} )

				XPEarnedDisplay:completeAnimation()
				self.XPEarnedDisplay:setLeftRight( true, false, -67, 216.41 )
				self.XPEarnedDisplay:setTopBottom( true, false, 8, 34 )
				self.clipFinished( XPEarnedDisplay, {} )

				ProgressDescription:completeAnimation()

				ProgressDescription.FEButtonPanel0:completeAnimation()
				self.ProgressDescription:setLeftRight( true, false, -67, 216.41 )
				self.ProgressDescription:setTopBottom( true, false, -13, 13 )
				self.ProgressDescription:setAlpha( 1 )
				self.ProgressDescription.FEButtonPanel0:setAlpha( 0.2 )
				self.clipFinished( ProgressDescription, {} )

				NextLevelDisplay:completeAnimation()
				self.NextLevelDisplay:setLeftRight( false, true, -344, -42 )
				self.NextLevelDisplay:setTopBottom( true, false, 5, 31 )
				self.clipFinished( NextLevelDisplay, {} )

				BackGlow:completeAnimation()
				self.BackGlow:setAlpha( 0 )
				self.clipFinished( BackGlow, {} )

				Glow0:completeAnimation()
				self.Glow0:setAlpha( 0 )
				self.clipFinished( Glow0, {} )

				Glow1:completeAnimation()
				self.Glow1:setAlpha( 0 )
				self.clipFinished( Glow1, {} )

				MeterGlow:completeAnimation()
				self.MeterGlow:setAlpha( 0 )
				self.clipFinished( MeterGlow, {} )

				RankIconAndNumberBig:completeAnimation()
				self.RankIconAndNumberBig:setAlpha( 0 )
				self.clipFinished( RankIconAndNumberBig, {} )

				starterPackXPNotice:completeAnimation()
				self.starterPackXPNotice:setAlpha( 1 )
				self.clipFinished( starterPackXPNotice, {} )
			end,
			Update = function ()
				self:setupElementClipCounter( 18 )

				local f146_local0 = function ( f147_arg0, f147_arg1 )
					local f147_local0 = function ( f148_arg0, f148_arg1 )
						if not f148_arg1.interrupted then
							f148_arg0:beginAnimation( "keyframe", 2609, false, false, CoD.TweenType.Linear )
						end
						f148_arg0:setAlpha( 0 )
						if f148_arg1.interrupted then
							self.clipFinished( f148_arg0, f148_arg1 )
						else
							f148_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f147_arg1.interrupted then
						f147_local0( f147_arg0, f147_arg1 )
						return 
					else
						f147_arg0:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						f147_arg0:setAlpha( 0 )
						f147_arg0:registerEventHandler( "transition_complete_keyframe", f147_local0 )
					end
				end
				
				XpBarFrame:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
				XpBarFrame:setAlpha( 1 )
				XpBarFrame:registerEventHandler( "transition_complete_keyframe", f146_local0 )
				local f146_local1 = function ( f149_arg0, f149_arg1 )
					local f149_local0 = function ( f150_arg0, f150_arg1 )
						if not f150_arg1.interrupted then
							f150_arg0:beginAnimation( "keyframe", 2609, false, false, CoD.TweenType.Linear )
						end
						f150_arg0:setAlpha( 0 )
						if f150_arg1.interrupted then
							self.clipFinished( f150_arg0, f150_arg1 )
						else
							f150_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f149_arg1.interrupted then
						f149_local0( f149_arg0, f149_arg1 )
						return 
					else
						f149_arg0:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						f149_arg0:setAlpha( 0 )
						f149_arg0:registerEventHandler( "transition_complete_keyframe", f149_local0 )
					end
				end
				
				XpBar:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
				XpBar:setAlpha( 1 )
				XpBar:registerEventHandler( "transition_complete_keyframe", f146_local1 )
				local RankIconAndNumberWidgetNextBaseFrame2 = function ( RankIconAndNumberWidgetNextBase, event )
					if not event.interrupted then
						RankIconAndNumberWidgetNextBase:beginAnimation( "keyframe", 3369, false, false, CoD.TweenType.Linear )
					end
					RankIconAndNumberWidgetNextBase:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( RankIconAndNumberWidgetNextBase, event )
					else
						RankIconAndNumberWidgetNextBase:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RankIconAndNumberWidgetNextBase:completeAnimation()
				self.RankIconAndNumberWidgetNextBase:setAlpha( 0 )
				RankIconAndNumberWidgetNextBaseFrame2( RankIconAndNumberWidgetNextBase, {} )
				local RankIconAndNumberWidgetPreviousFrame2 = function ( RankIconAndNumberWidgetPrevious, event )
					local RankIconAndNumberWidgetPreviousFrame3 = function ( RankIconAndNumberWidgetPrevious, event )
						local RankIconAndNumberWidgetPreviousFrame4 = function ( RankIconAndNumberWidgetPrevious, event )
							local RankIconAndNumberWidgetPreviousFrame5 = function ( RankIconAndNumberWidgetPrevious, event )
								if not event.interrupted then
									RankIconAndNumberWidgetPrevious:beginAnimation( "keyframe", 1789, false, false, CoD.TweenType.Linear )
								end
								RankIconAndNumberWidgetPrevious:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( RankIconAndNumberWidgetPrevious, event )
								else
									RankIconAndNumberWidgetPrevious:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								RankIconAndNumberWidgetPreviousFrame5( RankIconAndNumberWidgetPrevious, event )
								return 
							else
								RankIconAndNumberWidgetPrevious:beginAnimation( "keyframe", 690, false, false, CoD.TweenType.Bounce )
								RankIconAndNumberWidgetPrevious:registerEventHandler( "transition_complete_keyframe", RankIconAndNumberWidgetPreviousFrame5 )
							end
						end
						
						if event.interrupted then
							RankIconAndNumberWidgetPreviousFrame4( RankIconAndNumberWidgetPrevious, event )
							return 
						else
							RankIconAndNumberWidgetPrevious:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
							RankIconAndNumberWidgetPrevious:setAlpha( 0 )
							RankIconAndNumberWidgetPrevious:registerEventHandler( "transition_complete_keyframe", RankIconAndNumberWidgetPreviousFrame4 )
						end
					end
					
					if event.interrupted then
						RankIconAndNumberWidgetPreviousFrame3( RankIconAndNumberWidgetPrevious, event )
						return 
					else
						RankIconAndNumberWidgetPrevious:beginAnimation( "keyframe", 649, false, false, CoD.TweenType.Linear )
						RankIconAndNumberWidgetPrevious:registerEventHandler( "transition_complete_keyframe", RankIconAndNumberWidgetPreviousFrame3 )
					end
				end
				
				RankIconAndNumberWidgetPrevious:completeAnimation()
				self.RankIconAndNumberWidgetPrevious:setAlpha( 1 )
				RankIconAndNumberWidgetPreviousFrame2( RankIconAndNumberWidgetPrevious, {} )
				local f146_local4 = function ( f156_arg0, f156_arg1 )
					local f156_local0 = function ( f157_arg0, f157_arg1 )
						if not f157_arg1.interrupted then
							f157_arg0:beginAnimation( "keyframe", 2389, false, false, CoD.TweenType.Linear )
						end
						f157_arg0:setAlpha( 0 )
						if f157_arg1.interrupted then
							self.clipFinished( f157_arg0, f157_arg1 )
						else
							f157_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f156_arg1.interrupted then
						f156_local0( f156_arg0, f156_arg1 )
						return 
					else
						f156_arg0:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
						f156_arg0:setAlpha( 0 )
						f156_arg0:registerEventHandler( "transition_complete_keyframe", f156_local0 )
					end
				end
				
				XPEarnedDisplay:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
				XPEarnedDisplay:setAlpha( 1 )
				XPEarnedDisplay:registerEventHandler( "transition_complete_keyframe", f146_local4 )
				ProgressDescription:beginAnimation( "keyframe", 3369, false, false, CoD.TweenType.Linear )
				ProgressDescription:setAlpha( 0 )
				ProgressDescription:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				local f146_local5 = function ( f158_arg0, f158_arg1 )
					local f158_local0 = function ( f159_arg0, f159_arg1 )
						if not f159_arg1.interrupted then
							f159_arg0:beginAnimation( "keyframe", 2389, false, false, CoD.TweenType.Linear )
						end
						f159_arg0:setAlpha( 0 )
						if f159_arg1.interrupted then
							self.clipFinished( f159_arg0, f159_arg1 )
						else
							f159_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f158_arg1.interrupted then
						f158_local0( f158_arg0, f158_arg1 )
						return 
					else
						f158_arg0:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
						f158_arg0:setAlpha( 0 )
						f158_arg0:registerEventHandler( "transition_complete_keyframe", f158_local0 )
					end
				end
				
				NextLevelDisplay:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
				NextLevelDisplay:setAlpha( 1 )
				NextLevelDisplay:registerEventHandler( "transition_complete_keyframe", f146_local5 )
				local BackGlowFrame2 = function ( BackGlow, event )
					local BackGlowFrame3 = function ( BackGlow, event )
						local BackGlowFrame4 = function ( BackGlow, event )
							if not event.interrupted then
								BackGlow:beginAnimation( "keyframe", 1589, false, false, CoD.TweenType.Linear )
							end
							BackGlow:setLeftRight( true, false, -44.83, 116.17 )
							BackGlow:setTopBottom( true, false, -31.59, 105.01 )
							BackGlow:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( BackGlow, event )
							else
								BackGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							BackGlowFrame4( BackGlow, event )
							return 
						else
							BackGlow:beginAnimation( "keyframe", 470, true, true, CoD.TweenType.Linear )
							BackGlow:setLeftRight( true, false, -44.83, 116.17 )
							BackGlow:registerEventHandler( "transition_complete_keyframe", BackGlowFrame4 )
						end
					end
					
					if event.interrupted then
						BackGlowFrame3( BackGlow, event )
						return 
					else
						BackGlow:beginAnimation( "keyframe", 1309, false, false, CoD.TweenType.Linear )
						BackGlow:setLeftRight( true, false, 1034.17, 1195.17 )
						BackGlow:registerEventHandler( "transition_complete_keyframe", BackGlowFrame3 )
					end
				end
				
				BackGlow:completeAnimation()
				self.BackGlow:setLeftRight( true, false, 1034.17, 1195.17 )
				self.BackGlow:setTopBottom( true, false, -31.59, 105.01 )
				self.BackGlow:setAlpha( 0 )
				BackGlowFrame2( BackGlow, {} )
				local RankIconAndNumberWidgetNextTopFrame2 = function ( RankIconAndNumberWidgetNextTop, event )
					local RankIconAndNumberWidgetNextTopFrame3 = function ( RankIconAndNumberWidgetNextTop, event )
						local RankIconAndNumberWidgetNextTopFrame4 = function ( RankIconAndNumberWidgetNextTop, event )
							local RankIconAndNumberWidgetNextTopFrame5 = function ( RankIconAndNumberWidgetNextTop, event )
								local RankIconAndNumberWidgetNextTopFrame6 = function ( RankIconAndNumberWidgetNextTop, event )
									local RankIconAndNumberWidgetNextTopFrame7 = function ( RankIconAndNumberWidgetNextTop, event )
										if not event.interrupted then
											RankIconAndNumberWidgetNextTop:beginAnimation( "keyframe", 2480, false, false, CoD.TweenType.Linear )
										end
										RankIconAndNumberWidgetNextTop:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( RankIconAndNumberWidgetNextTop, event )
										else
											RankIconAndNumberWidgetNextTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										RankIconAndNumberWidgetNextTopFrame7( RankIconAndNumberWidgetNextTop, event )
										return 
									else
										RankIconAndNumberWidgetNextTop:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
										RankIconAndNumberWidgetNextTop:setAlpha( 0 )
										RankIconAndNumberWidgetNextTop:registerEventHandler( "transition_complete_keyframe", RankIconAndNumberWidgetNextTopFrame7 )
									end
								end
								
								if event.interrupted then
									RankIconAndNumberWidgetNextTopFrame6( RankIconAndNumberWidgetNextTop, event )
									return 
								else
									RankIconAndNumberWidgetNextTop:beginAnimation( "keyframe", 469, false, false, CoD.TweenType.Linear )
									RankIconAndNumberWidgetNextTop:registerEventHandler( "transition_complete_keyframe", RankIconAndNumberWidgetNextTopFrame6 )
								end
							end
							
							if event.interrupted then
								RankIconAndNumberWidgetNextTopFrame5( RankIconAndNumberWidgetNextTop, event )
								return 
							else
								RankIconAndNumberWidgetNextTop:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
								RankIconAndNumberWidgetNextTop:setAlpha( 1 )
								RankIconAndNumberWidgetNextTop:registerEventHandler( "transition_complete_keyframe", RankIconAndNumberWidgetNextTopFrame5 )
							end
						end
						
						if event.interrupted then
							RankIconAndNumberWidgetNextTopFrame4( RankIconAndNumberWidgetNextTop, event )
							return 
						else
							RankIconAndNumberWidgetNextTop:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							RankIconAndNumberWidgetNextTop:setAlpha( 0 )
							RankIconAndNumberWidgetNextTop:registerEventHandler( "transition_complete_keyframe", RankIconAndNumberWidgetNextTopFrame4 )
						end
					end
					
					if event.interrupted then
						RankIconAndNumberWidgetNextTopFrame3( RankIconAndNumberWidgetNextTop, event )
						return 
					else
						RankIconAndNumberWidgetNextTop:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						RankIconAndNumberWidgetNextTop:registerEventHandler( "transition_complete_keyframe", RankIconAndNumberWidgetNextTopFrame3 )
					end
				end
				
				RankIconAndNumberWidgetNextTop:completeAnimation()
				self.RankIconAndNumberWidgetNextTop:setAlpha( 1 )
				RankIconAndNumberWidgetNextTopFrame2( RankIconAndNumberWidgetNextTop, {} )
				local Glow0Frame2 = function ( Glow0, event )
					local Glow0Frame3 = function ( Glow0, event )
						local Glow0Frame4 = function ( Glow0, event )
							local Glow0Frame5 = function ( Glow0, event )
								local Glow0Frame6 = function ( Glow0, event )
									local Glow0Frame7 = function ( Glow0, event )
										local Glow0Frame8 = function ( Glow0, event )
											local Glow0Frame9 = function ( Glow0, event )
												if not event.interrupted then
													Glow0:beginAnimation( "keyframe", 2239, false, false, CoD.TweenType.Linear )
												end
												Glow0:setLeftRight( false, false, 403.12, 703.12 )
												Glow0:setTopBottom( false, true, -29.79, -4.79 )
												Glow0:setAlpha( 0 )
												if event.interrupted then
													self.clipFinished( Glow0, event )
												else
													Glow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												Glow0Frame9( Glow0, event )
												return 
											else
												Glow0:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
												Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame9 )
											end
										end
										
										if event.interrupted then
											Glow0Frame8( Glow0, event )
											return 
										else
											Glow0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
											Glow0:setTopBottom( false, true, -29.79, -4.79 )
											Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame8 )
										end
									end
									
									if event.interrupted then
										Glow0Frame7( Glow0, event )
										return 
									else
										Glow0:beginAnimation( "keyframe", 479, false, false, CoD.TweenType.Bounce )
										Glow0:setTopBottom( false, true, -30.7, -4.79 )
										Glow0:setAlpha( 0 )
										Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame7 )
									end
								end
								
								if event.interrupted then
									Glow0Frame6( Glow0, event )
									return 
								else
									Glow0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									Glow0:setTopBottom( false, true, -35.59, -4.79 )
									Glow0:setAlpha( 0.51 )
									Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame6 )
								end
							end
							
							if event.interrupted then
								Glow0Frame5( Glow0, event )
								return 
							else
								Glow0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								Glow0:setTopBottom( false, true, -35.79, -4.79 )
								Glow0:setAlpha( 0.42 )
								Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame5 )
							end
						end
						
						if event.interrupted then
							Glow0Frame4( Glow0, event )
							return 
						else
							Glow0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							Glow0:setTopBottom( false, true, -42, -4.79 )
							Glow0:setAlpha( 0.37 )
							Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame4 )
						end
					end
					
					if event.interrupted then
						Glow0Frame3( Glow0, event )
						return 
					else
						Glow0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						Glow0:setTopBottom( false, true, -46.79, -4.79 )
						Glow0:setAlpha( 0.28 )
						Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame3 )
					end
				end
				
				Glow0:completeAnimation()
				self.Glow0:setLeftRight( false, false, 403.12, 703.12 )
				self.Glow0:setTopBottom( false, true, -29.79, -4.79 )
				self.Glow0:setAlpha( 0 )
				Glow0Frame2( Glow0, {} )
				local Glow1Frame2 = function ( Glow1, event )
					local Glow1Frame3 = function ( Glow1, event )
						local Glow1Frame4 = function ( Glow1, event )
							local Glow1Frame5 = function ( Glow1, event )
								local Glow1Frame6 = function ( Glow1, event )
									local Glow1Frame7 = function ( Glow1, event )
										if not event.interrupted then
											Glow1:beginAnimation( "keyframe", 1599, false, false, CoD.TweenType.Linear )
										end
										Glow1:setLeftRight( false, false, 488.62, 596.62 )
										Glow1:setTopBottom( false, true, -61.8, 22.21 )
										Glow1:setRGB( 0.59, 0.31, 0 )
										Glow1:setAlpha( 0 )
										Glow1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
										if event.interrupted then
											self.clipFinished( Glow1, event )
										else
											Glow1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										Glow1Frame7( Glow1, event )
										return 
									else
										Glow1:beginAnimation( "keyframe", 1069, false, false, CoD.TweenType.Linear )
										Glow1:setLeftRight( false, false, 488.62, 596.62 )
										Glow1:setTopBottom( false, true, -61.8, 22.21 )
										Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame7 )
									end
								end
								
								if event.interrupted then
									Glow1Frame6( Glow1, event )
									return 
								else
									Glow1:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Bounce )
									Glow1:setLeftRight( false, false, 498.29, 594.69 )
									Glow1:setTopBottom( false, true, -64.38, 17.7 )
									Glow1:setAlpha( 0 )
									Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame6 )
								end
							end
							
							if event.interrupted then
								Glow1Frame5( Glow1, event )
								return 
							else
								Glow1:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
								Glow1:setLeftRight( false, false, 499.55, 594.43 )
								Glow1:setTopBottom( false, true, -64.71, 17.11 )
								Glow1:setRGB( 0.59, 0.31, 0 )
								Glow1:setAlpha( 0.09 )
								Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame5 )
							end
						end
						
						if event.interrupted then
							Glow1Frame4( Glow1, event )
							return 
						else
							Glow1:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
							Glow1:setLeftRight( false, false, 503.62, 593.62 )
							Glow1:setTopBottom( false, true, -65.8, 15.21 )
							Glow1:setRGB( 0.88, 0.62, 0 )
							Glow1:setAlpha( 0.84 )
							Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame4 )
						end
					end
					
					if event.interrupted then
						Glow1Frame3( Glow1, event )
						return 
					else
						Glow1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						Glow1:setLeftRight( false, false, 504.87, 594.87 )
						Glow1:setTopBottom( false, true, -53.25, 15.02 )
						Glow1:setRGB( 0.94, 0.69, 0 )
						Glow1:setAlpha( 1 )
						Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame3 )
					end
				end
				
				Glow1:completeAnimation()
				self.Glow1:setLeftRight( false, false, 505, 595 )
				self.Glow1:setTopBottom( false, true, -52, 15 )
				self.Glow1:setRGB( 0.95, 0.7, 0 )
				self.Glow1:setAlpha( 0 )
				self.Glow1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
				Glow1Frame2( Glow1, {} )
				local MeterGlowFrame2 = function ( MeterGlow, event )
					local MeterGlowFrame3 = function ( MeterGlow, event )
						local MeterGlowFrame4 = function ( MeterGlow, event )
							local MeterGlowFrame5 = function ( MeterGlow, event )
								if not event.interrupted then
									MeterGlow:beginAnimation( "keyframe", 2599, false, false, CoD.TweenType.Linear )
								end
								MeterGlow:setRGB( 1, 0.2, 0 )
								MeterGlow:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( MeterGlow, event )
								else
									MeterGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								MeterGlowFrame5( MeterGlow, event )
								return 
							else
								MeterGlow:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Bounce )
								MeterGlow:setAlpha( 0 )
								MeterGlow:registerEventHandler( "transition_complete_keyframe", MeterGlowFrame5 )
							end
						end
						
						if event.interrupted then
							MeterGlowFrame4( MeterGlow, event )
							return 
						else
							MeterGlow:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
							MeterGlow:setRGB( 1, 0.2, 0 )
							MeterGlow:registerEventHandler( "transition_complete_keyframe", MeterGlowFrame4 )
						end
					end
					
					if event.interrupted then
						MeterGlowFrame3( MeterGlow, event )
						return 
					else
						MeterGlow:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						MeterGlow:setRGB( 1, 0.52, 0 )
						MeterGlow:setAlpha( 1 )
						MeterGlow:registerEventHandler( "transition_complete_keyframe", MeterGlowFrame3 )
					end
				end
				
				MeterGlow:completeAnimation()
				self.MeterGlow:setRGB( 1, 0.2, 0 )
				self.MeterGlow:setAlpha( 0 )
				MeterGlowFrame2( MeterGlow, {} )
				local f146_local11 = function ( f187_arg0, f187_arg1 )
					local f187_local0 = function ( f188_arg0, f188_arg1 )
						local f188_local0 = function ( f189_arg0, f189_arg1 )
							local f189_local0 = function ( f190_arg0, f190_arg1 )
								local f190_local0 = function ( f191_arg0, f191_arg1 )
									local f191_local0 = function ( f192_arg0, f192_arg1 )
										local f192_local0 = function ( f193_arg0, f193_arg1 )
											local f193_local0 = function ( f194_arg0, f194_arg1 )
												local f194_local0 = function ( f195_arg0, f195_arg1 )
													local f195_local0 = function ( f196_arg0, f196_arg1 )
														if not f196_arg1.interrupted then
															f196_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
														end
														f196_arg0:setLeftRight( true, false, 0, 246 )
														f196_arg0:setTopBottom( true, false, 9, 49 )
														f196_arg0:setAlpha( 0 )
														if f196_arg1.interrupted then
															self.clipFinished( f196_arg0, f196_arg1 )
														else
															f196_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if f195_arg1.interrupted then
														f195_local0( f195_arg0, f195_arg1 )
														return 
													else
														f195_arg0:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
														f195_arg0:setLeftRight( true, false, 132, 377.7 )
														f195_arg0:setAlpha( 0 )
														f195_arg0:registerEventHandler( "transition_complete_keyframe", f195_local0 )
													end
												end
												
												if f194_arg1.interrupted then
													f194_local0( f194_arg0, f194_arg1 )
													return 
												else
													f194_arg0:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
													f194_arg0:setLeftRight( true, false, 440, 685 )
													f194_arg0:setAlpha( 0.23 )
													f194_arg0:registerEventHandler( "transition_complete_keyframe", f194_local0 )
												end
											end
											
											if f193_arg1.interrupted then
												f193_local0( f193_arg0, f193_arg1 )
												return 
											else
												f193_arg0:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
												f193_arg0:setLeftRight( true, false, 446.22, 691.22 )
												f193_arg0:registerEventHandler( "transition_complete_keyframe", f193_local0 )
											end
										end
										
										if f192_arg1.interrupted then
											f192_local0( f192_arg0, f192_arg1 )
											return 
										else
											f192_arg0:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
											f192_arg0:setLeftRight( true, false, 450, 695 )
											f192_arg0:registerEventHandler( "transition_complete_keyframe", f192_local0 )
										end
									end
									
									if f191_arg1.interrupted then
										f191_local0( f191_arg0, f191_arg1 )
										return 
									else
										f191_arg0:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
										f191_arg0:setLeftRight( true, false, 449.88, 695.5 )
										f191_arg0:registerEventHandler( "transition_complete_keyframe", f191_local0 )
									end
								end
								
								if f190_arg1.interrupted then
									f190_local0( f190_arg0, f190_arg1 )
									return 
								else
									f190_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									f190_arg0:setLeftRight( true, false, 447, 707.93 )
									f190_arg0:registerEventHandler( "transition_complete_keyframe", f190_local0 )
								end
							end
							
							if f189_arg1.interrupted then
								f189_local0( f189_arg0, f189_arg1 )
								return 
							else
								f189_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f189_arg0:setLeftRight( true, false, 483.8, 731.99 )
								f189_arg0:setAlpha( 1 )
								f189_arg0:registerEventHandler( "transition_complete_keyframe", f189_local0 )
							end
						end
						
						if f188_arg1.interrupted then
							f188_local0( f188_arg0, f188_arg1 )
							return 
						else
							f188_arg0:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
							f188_arg0:setLeftRight( true, false, 505.5, 750.5 )
							f188_arg0:setAlpha( 0.88 )
							f188_arg0:registerEventHandler( "transition_complete_keyframe", f188_local0 )
						end
					end
					
					if f187_arg1.interrupted then
						f187_local0( f187_arg0, f187_arg1 )
						return 
					else
						f187_arg0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
						f187_arg0:setLeftRight( true, false, 714.69, 959.69 )
						f187_arg0:registerEventHandler( "transition_complete_keyframe", f187_local0 )
					end
				end
				
				RankIconAndNumberBig:beginAnimation( "keyframe", 639, false, false, CoD.TweenType.Linear )
				RankIconAndNumberBig:setLeftRight( true, false, 894, 1139 )
				RankIconAndNumberBig:setTopBottom( true, false, 9, 49 )
				RankIconAndNumberBig:setAlpha( 0 )
				RankIconAndNumberBig:registerEventHandler( "transition_complete_keyframe", f146_local11 )
				local f146_local12 = function ( f197_arg0, f197_arg1 )
					local f197_local0 = function ( f198_arg0, f198_arg1 )
						local f198_local0 = function ( f199_arg0, f199_arg1 )
							local f199_local0 = function ( f200_arg0, f200_arg1 )
								local f200_local0 = function ( f201_arg0, f201_arg1 )
									local f201_local0 = function ( f202_arg0, f202_arg1 )
										local f202_local0 = function ( f203_arg0, f203_arg1 )
											local f203_local0 = function ( f204_arg0, f204_arg1 )
												local f204_local0 = function ( f205_arg0, f205_arg1 )
													local f205_local0 = function ( f206_arg0, f206_arg1 )
														local f206_local0 = function ( f207_arg0, f207_arg1 )
															local f207_local0 = function ( f208_arg0, f208_arg1 )
																local f208_local0 = function ( f209_arg0, f209_arg1 )
																	local f209_local0 = function ( f210_arg0, f210_arg1 )
																		local f210_local0 = function ( f211_arg0, f211_arg1 )
																			local f211_local0 = function ( f212_arg0, f212_arg1 )
																				local f212_local0 = function ( f213_arg0, f213_arg1 )
																					local f213_local0 = function ( f214_arg0, f214_arg1 )
																						local f214_local0 = function ( f215_arg0, f215_arg1 )
																							local f215_local0 = function ( f216_arg0, f216_arg1 )
																								local f216_local0 = function ( f217_arg0, f217_arg1 )
																									local f217_local0 = function ( f218_arg0, f218_arg1 )
																										local f218_local0 = function ( f219_arg0, f219_arg1 )
																											local f219_local0 = function ( f220_arg0, f220_arg1 )
																												local f220_local0 = function ( f221_arg0, f221_arg1 )
																													local f221_local0 = function ( f222_arg0, f222_arg1 )
																														local f222_local0 = function ( f223_arg0, f223_arg1 )
																															local f223_local0 = function ( f224_arg0, f224_arg1 )
																																local f224_local0 = function ( f225_arg0, f225_arg1 )
																																	local f225_local0 = function ( f226_arg0, f226_arg1 )
																																		local f226_local0 = function ( f227_arg0, f227_arg1 )
																																			local f227_local0 = function ( f228_arg0, f228_arg1 )
																																				local f228_local0 = function ( f229_arg0, f229_arg1 )
																																					local f229_local0 = function ( f230_arg0, f230_arg1 )
																																						local f230_local0 = function ( f231_arg0, f231_arg1 )
																																							local f231_local0 = function ( f232_arg0, f232_arg1 )
																																								local f232_local0 = function ( f233_arg0, f233_arg1 )
																																									local f233_local0 = function ( f234_arg0, f234_arg1 )
																																										local f234_local0 = function ( f235_arg0, f235_arg1 )
																																											local f235_local0 = function ( f236_arg0, f236_arg1 )
																																												local f236_local0 = function ( f237_arg0, f237_arg1 )
																																													if not f237_arg1.interrupted then
																																														f237_arg0:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Linear )
																																													end
																																													f237_arg0:setAlpha( 0 )
																																													if f237_arg1.interrupted then
																																														self.clipFinished( f237_arg0, f237_arg1 )
																																													else
																																														f237_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																																													end
																																												end
																																												
																																												if f236_arg1.interrupted then
																																													f236_local0( f236_arg0, f236_arg1 )
																																													return 
																																												else
																																													f236_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																																													f236_arg0:registerEventHandler( "transition_complete_keyframe", f236_local0 )
																																												end
																																											end
																																											
																																											if f235_arg1.interrupted then
																																												f235_local0( f235_arg0, f235_arg1 )
																																												return 
																																											else
																																												f235_arg0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																												f235_arg0:setAlpha( 0 )
																																												f235_arg0:registerEventHandler( "transition_complete_keyframe", f235_local0 )
																																											end
																																										end
																																										
																																										if f234_arg1.interrupted then
																																											f234_local0( f234_arg0, f234_arg1 )
																																											return 
																																										else
																																											f234_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																											f234_arg0:setAlpha( 1 )
																																											f234_arg0:registerEventHandler( "transition_complete_keyframe", f234_local0 )
																																										end
																																									end
																																									
																																									if f233_arg1.interrupted then
																																										f233_local0( f233_arg0, f233_arg1 )
																																										return 
																																									else
																																										f233_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																																										f233_arg0:registerEventHandler( "transition_complete_keyframe", f233_local0 )
																																									end
																																								end
																																								
																																								if f232_arg1.interrupted then
																																									f232_local0( f232_arg0, f232_arg1 )
																																									return 
																																								else
																																									f232_arg0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																																									f232_arg0:setAlpha( 0 )
																																									f232_arg0:registerEventHandler( "transition_complete_keyframe", f232_local0 )
																																								end
																																							end
																																							
																																							if f231_arg1.interrupted then
																																								f231_local0( f231_arg0, f231_arg1 )
																																								return 
																																							else
																																								f231_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
																																								f231_arg0:setAlpha( 1 )
																																								f231_arg0:registerEventHandler( "transition_complete_keyframe", f231_local0 )
																																							end
																																						end
																																						
																																						if f230_arg1.interrupted then
																																							f230_local0( f230_arg0, f230_arg1 )
																																							return 
																																						else
																																							f230_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																																							f230_arg0:registerEventHandler( "transition_complete_keyframe", f230_local0 )
																																						end
																																					end
																																					
																																					if f229_arg1.interrupted then
																																						f229_local0( f229_arg0, f229_arg1 )
																																						return 
																																					else
																																						f229_arg0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																																						f229_arg0:setAlpha( 0 )
																																						f229_arg0:registerEventHandler( "transition_complete_keyframe", f229_local0 )
																																					end
																																				end
																																				
																																				if f228_arg1.interrupted then
																																					f228_local0( f228_arg0, f228_arg1 )
																																					return 
																																				else
																																					f228_arg0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
																																					f228_arg0:setAlpha( 1 )
																																					f228_arg0:registerEventHandler( "transition_complete_keyframe", f228_local0 )
																																				end
																																			end
																																			
																																			if f227_arg1.interrupted then
																																				f227_local0( f227_arg0, f227_arg1 )
																																				return 
																																			else
																																				f227_arg0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																																				f227_arg0:registerEventHandler( "transition_complete_keyframe", f227_local0 )
																																			end
																																		end
																																		
																																		if f226_arg1.interrupted then
																																			f226_local0( f226_arg0, f226_arg1 )
																																			return 
																																		else
																																			f226_arg0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																																			f226_arg0:registerEventHandler( "transition_complete_keyframe", f226_local0 )
																																		end
																																	end
																																	
																																	if f225_arg1.interrupted then
																																		f225_local0( f225_arg0, f225_arg1 )
																																		return 
																																	else
																																		f225_arg0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
																																		f225_arg0:setAlpha( 0 )
																																		f225_arg0:registerEventHandler( "transition_complete_keyframe", f225_local0 )
																																	end
																																end
																																
																																if f224_arg1.interrupted then
																																	f224_local0( f224_arg0, f224_arg1 )
																																	return 
																																else
																																	f224_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																																	f224_arg0:setAlpha( 0.85 )
																																	f224_arg0:registerEventHandler( "transition_complete_keyframe", f224_local0 )
																																end
																															end
																															
																															if f223_arg1.interrupted then
																																f223_local0( f223_arg0, f223_arg1 )
																																return 
																															else
																																f223_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
																																f223_arg0:registerEventHandler( "transition_complete_keyframe", f223_local0 )
																															end
																														end
																														
																														if f222_arg1.interrupted then
																															f222_local0( f222_arg0, f222_arg1 )
																															return 
																														else
																															f222_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																															f222_arg0:registerEventHandler( "transition_complete_keyframe", f222_local0 )
																														end
																													end
																													
																													if f221_arg1.interrupted then
																														f221_local0( f221_arg0, f221_arg1 )
																														return 
																													else
																														f221_arg0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																														f221_arg0:setAlpha( 0 )
																														f221_arg0:registerEventHandler( "transition_complete_keyframe", f221_local0 )
																													end
																												end
																												
																												if f220_arg1.interrupted then
																													f220_local0( f220_arg0, f220_arg1 )
																													return 
																												else
																													f220_arg0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																													f220_arg0:setAlpha( 1 )
																													f220_arg0:registerEventHandler( "transition_complete_keyframe", f220_local0 )
																												end
																											end
																											
																											if f219_arg1.interrupted then
																												f219_local0( f219_arg0, f219_arg1 )
																												return 
																											else
																												f219_arg0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																												f219_arg0:setAlpha( 0 )
																												f219_arg0:registerEventHandler( "transition_complete_keyframe", f219_local0 )
																											end
																										end
																										
																										if f218_arg1.interrupted then
																											f218_local0( f218_arg0, f218_arg1 )
																											return 
																										else
																											f218_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
																											f218_arg0:setAlpha( 1 )
																											f218_arg0:registerEventHandler( "transition_complete_keyframe", f218_local0 )
																										end
																									end
																									
																									if f217_arg1.interrupted then
																										f217_local0( f217_arg0, f217_arg1 )
																										return 
																									else
																										f217_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																										f217_arg0:registerEventHandler( "transition_complete_keyframe", f217_local0 )
																									end
																								end
																								
																								if f216_arg1.interrupted then
																									f216_local0( f216_arg0, f216_arg1 )
																									return 
																								else
																									f216_arg0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																									f216_arg0:setAlpha( 0 )
																									f216_arg0:registerEventHandler( "transition_complete_keyframe", f216_local0 )
																								end
																							end
																							
																							if f215_arg1.interrupted then
																								f215_local0( f215_arg0, f215_arg1 )
																								return 
																							else
																								f215_arg0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																								f215_arg0:registerEventHandler( "transition_complete_keyframe", f215_local0 )
																							end
																						end
																						
																						if f214_arg1.interrupted then
																							f214_local0( f214_arg0, f214_arg1 )
																							return 
																						else
																							f214_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
																							f214_arg0:setAlpha( 1 )
																							f214_arg0:registerEventHandler( "transition_complete_keyframe", f214_local0 )
																						end
																					end
																					
																					if f213_arg1.interrupted then
																						f213_local0( f213_arg0, f213_arg1 )
																						return 
																					else
																						f213_arg0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																						f213_arg0:setAlpha( 0 )
																						f213_arg0:registerEventHandler( "transition_complete_keyframe", f213_local0 )
																					end
																				end
																				
																				if f212_arg1.interrupted then
																					f212_local0( f212_arg0, f212_arg1 )
																					return 
																				else
																					f212_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
																					f212_arg0:setAlpha( 1 )
																					f212_arg0:registerEventHandler( "transition_complete_keyframe", f212_local0 )
																				end
																			end
																			
																			if f211_arg1.interrupted then
																				f211_local0( f211_arg0, f211_arg1 )
																				return 
																			else
																				f211_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																				f211_arg0:registerEventHandler( "transition_complete_keyframe", f211_local0 )
																			end
																		end
																		
																		if f210_arg1.interrupted then
																			f210_local0( f210_arg0, f210_arg1 )
																			return 
																		else
																			f210_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																			f210_arg0:registerEventHandler( "transition_complete_keyframe", f210_local0 )
																		end
																	end
																	
																	if f209_arg1.interrupted then
																		f209_local0( f209_arg0, f209_arg1 )
																		return 
																	else
																		f209_arg0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																		f209_arg0:setAlpha( 0 )
																		f209_arg0:registerEventHandler( "transition_complete_keyframe", f209_local0 )
																	end
																end
																
																if f208_arg1.interrupted then
																	f208_local0( f208_arg0, f208_arg1 )
																	return 
																else
																	f208_arg0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																	f208_arg0:setAlpha( 1 )
																	f208_arg0:registerEventHandler( "transition_complete_keyframe", f208_local0 )
																end
															end
															
															if f207_arg1.interrupted then
																f207_local0( f207_arg0, f207_arg1 )
																return 
															else
																f207_arg0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
																f207_arg0:setAlpha( 0 )
																f207_arg0:registerEventHandler( "transition_complete_keyframe", f207_local0 )
															end
														end
														
														if f206_arg1.interrupted then
															f206_local0( f206_arg0, f206_arg1 )
															return 
														else
															f206_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
															f206_arg0:setAlpha( 1 )
															f206_arg0:registerEventHandler( "transition_complete_keyframe", f206_local0 )
														end
													end
													
													if f205_arg1.interrupted then
														f205_local0( f205_arg0, f205_arg1 )
														return 
													else
														f205_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
														f205_arg0:registerEventHandler( "transition_complete_keyframe", f205_local0 )
													end
												end
												
												if f204_arg1.interrupted then
													f204_local0( f204_arg0, f204_arg1 )
													return 
												else
													f204_arg0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
													f204_arg0:setAlpha( 0 )
													f204_arg0:registerEventHandler( "transition_complete_keyframe", f204_local0 )
												end
											end
											
											if f203_arg1.interrupted then
												f203_local0( f203_arg0, f203_arg1 )
												return 
											else
												f203_arg0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
												f203_arg0:registerEventHandler( "transition_complete_keyframe", f203_local0 )
											end
										end
										
										if f202_arg1.interrupted then
											f202_local0( f202_arg0, f202_arg1 )
											return 
										else
											f202_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											f202_arg0:setAlpha( 1 )
											f202_arg0:registerEventHandler( "transition_complete_keyframe", f202_local0 )
										end
									end
									
									if f201_arg1.interrupted then
										f201_local0( f201_arg0, f201_arg1 )
										return 
									else
										f201_arg0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
										f201_arg0:setAlpha( 0 )
										f201_arg0:registerEventHandler( "transition_complete_keyframe", f201_local0 )
									end
								end
								
								if f200_arg1.interrupted then
									f200_local0( f200_arg0, f200_arg1 )
									return 
								else
									f200_arg0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
									f200_arg0:setAlpha( 1 )
									f200_arg0:registerEventHandler( "transition_complete_keyframe", f200_local0 )
								end
							end
							
							if f199_arg1.interrupted then
								f199_local0( f199_arg0, f199_arg1 )
								return 
							else
								f199_arg0:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
								f199_arg0:setAlpha( 0 )
								f199_arg0:registerEventHandler( "transition_complete_keyframe", f199_local0 )
							end
						end
						
						if f198_arg1.interrupted then
							f198_local0( f198_arg0, f198_arg1 )
							return 
						else
							f198_arg0:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
							f198_arg0:setAlpha( 1 )
							f198_arg0:registerEventHandler( "transition_complete_keyframe", f198_local0 )
						end
					end
					
					if f197_arg1.interrupted then
						f197_local0( f197_arg0, f197_arg1 )
						return 
					else
						f197_arg0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						f197_arg0:registerEventHandler( "transition_complete_keyframe", f197_local0 )
					end
				end
				
				Glow10:beginAnimation( "keyframe", 670, false, false, CoD.TweenType.Linear )
				Glow10:setAlpha( 0 )
				Glow10:registerEventHandler( "transition_complete_keyframe", f146_local12 )
				local f146_local13 = function ( f238_arg0, f238_arg1 )
					local f238_local0 = function ( f239_arg0, f239_arg1 )
						local f239_local0 = function ( f240_arg0, f240_arg1 )
							local f240_local0 = function ( f241_arg0, f241_arg1 )
								local f241_local0 = function ( f242_arg0, f242_arg1 )
									local f242_local0 = function ( f243_arg0, f243_arg1 )
										local f243_local0 = function ( f244_arg0, f244_arg1 )
											local f244_local0 = function ( f245_arg0, f245_arg1 )
												local f245_local0 = function ( f246_arg0, f246_arg1 )
													local f246_local0 = function ( f247_arg0, f247_arg1 )
														local f247_local0 = function ( f248_arg0, f248_arg1 )
															local f248_local0 = function ( f249_arg0, f249_arg1 )
																local f249_local0 = function ( f250_arg0, f250_arg1 )
																	local f250_local0 = function ( f251_arg0, f251_arg1 )
																		local f251_local0 = function ( f252_arg0, f252_arg1 )
																			local f252_local0 = function ( f253_arg0, f253_arg1 )
																				local f253_local0 = function ( f254_arg0, f254_arg1 )
																					if not f254_arg1.interrupted then
																						f254_arg0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																					end
																					f254_arg0:setAlpha( 0 )
																					if f254_arg1.interrupted then
																						self.clipFinished( f254_arg0, f254_arg1 )
																					else
																						f254_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																					end
																				end
																				
																				if f253_arg1.interrupted then
																					f253_local0( f253_arg0, f253_arg1 )
																					return 
																				else
																					f253_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																					f253_arg0:setAlpha( 0 )
																					f253_arg0:registerEventHandler( "transition_complete_keyframe", f253_local0 )
																				end
																			end
																			
																			if f252_arg1.interrupted then
																				f252_local0( f252_arg0, f252_arg1 )
																				return 
																			else
																				f252_arg0:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
																				f252_arg0:setAlpha( 1 )
																				f252_arg0:registerEventHandler( "transition_complete_keyframe", f252_local0 )
																			end
																		end
																		
																		if f251_arg1.interrupted then
																			f251_local0( f251_arg0, f251_arg1 )
																			return 
																		else
																			f251_arg0:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
																			f251_arg0:registerEventHandler( "transition_complete_keyframe", f251_local0 )
																		end
																	end
																	
																	if f250_arg1.interrupted then
																		f250_local0( f250_arg0, f250_arg1 )
																		return 
																	else
																		f250_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																		f250_arg0:setAlpha( 0 )
																		f250_arg0:registerEventHandler( "transition_complete_keyframe", f250_local0 )
																	end
																end
																
																if f249_arg1.interrupted then
																	f249_local0( f249_arg0, f249_arg1 )
																	return 
																else
																	f249_arg0:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
																	f249_arg0:registerEventHandler( "transition_complete_keyframe", f249_local0 )
																end
															end
															
															if f248_arg1.interrupted then
																f248_local0( f248_arg0, f248_arg1 )
																return 
															else
																f248_arg0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
																f248_arg0:setAlpha( 1 )
																f248_arg0:registerEventHandler( "transition_complete_keyframe", f248_local0 )
															end
														end
														
														if f247_arg1.interrupted then
															f247_local0( f247_arg0, f247_arg1 )
															return 
														else
															f247_arg0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
															f247_arg0:setAlpha( 0 )
															f247_arg0:registerEventHandler( "transition_complete_keyframe", f247_local0 )
														end
													end
													
													if f246_arg1.interrupted then
														f246_local0( f246_arg0, f246_arg1 )
														return 
													else
														f246_arg0:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
														f246_arg0:setAlpha( 1 )
														f246_arg0:registerEventHandler( "transition_complete_keyframe", f246_local0 )
													end
												end
												
												if f245_arg1.interrupted then
													f245_local0( f245_arg0, f245_arg1 )
													return 
												else
													f245_arg0:beginAnimation( "keyframe", 419, false, false, CoD.TweenType.Linear )
													f245_arg0:registerEventHandler( "transition_complete_keyframe", f245_local0 )
												end
											end
											
											if f244_arg1.interrupted then
												f244_local0( f244_arg0, f244_arg1 )
												return 
											else
												f244_arg0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
												f244_arg0:setAlpha( 0 )
												f244_arg0:registerEventHandler( "transition_complete_keyframe", f244_local0 )
											end
										end
										
										if f243_arg1.interrupted then
											f243_local0( f243_arg0, f243_arg1 )
											return 
										else
											f243_arg0:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
											f243_arg0:setAlpha( 1 )
											f243_arg0:registerEventHandler( "transition_complete_keyframe", f243_local0 )
										end
									end
									
									if f242_arg1.interrupted then
										f242_local0( f242_arg0, f242_arg1 )
										return 
									else
										f242_arg0:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
										f242_arg0:setAlpha( 0 )
										f242_arg0:registerEventHandler( "transition_complete_keyframe", f242_local0 )
									end
								end
								
								if f241_arg1.interrupted then
									f241_local0( f241_arg0, f241_arg1 )
									return 
								else
									f241_arg0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
									f241_arg0:setAlpha( 1 )
									f241_arg0:registerEventHandler( "transition_complete_keyframe", f241_local0 )
								end
							end
							
							if f240_arg1.interrupted then
								f240_local0( f240_arg0, f240_arg1 )
								return 
							else
								f240_arg0:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
								f240_arg0:setAlpha( 0 )
								f240_arg0:registerEventHandler( "transition_complete_keyframe", f240_local0 )
							end
						end
						
						if f239_arg1.interrupted then
							f239_local0( f239_arg0, f239_arg1 )
							return 
						else
							f239_arg0:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
							f239_arg0:setAlpha( 1 )
							f239_arg0:registerEventHandler( "transition_complete_keyframe", f239_local0 )
						end
					end
					
					if f238_arg1.interrupted then
						f238_local0( f238_arg0, f238_arg1 )
						return 
					else
						f238_arg0:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
						f238_arg0:registerEventHandler( "transition_complete_keyframe", f238_local0 )
					end
				end
				
				Glow00:beginAnimation( "keyframe", 670, false, false, CoD.TweenType.Linear )
				Glow00:setAlpha( 0 )
				Glow00:registerEventHandler( "transition_complete_keyframe", f146_local13 )
				local promotionSoundFrame2 = function ( promotionSound, event )
					if not event.interrupted then
						promotionSound:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
					end
					promotionSound:playSound( "rank_sound", controller )
					if event.interrupted then
						self.clipFinished( promotionSound, event )
					else
						promotionSound:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				promotionSound:completeAnimation()
				self.promotionSound:playSound( "0", controller )
				promotionSoundFrame2( promotionSound, {} )
				local f146_local15 = function ( f256_arg0, f256_arg1 )
					if not f256_arg1.interrupted then
						f256_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
					end
					f256_arg0:playSound( "rank_music", controller )
					if f256_arg1.interrupted then
						self.clipFinished( f256_arg0, f256_arg1 )
					else
						f256_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				promotionMusic:beginAnimation( "keyframe", 839, false, false, CoD.TweenType.Linear )
				promotionMusic:playSound( "0", controller )
				promotionMusic:registerEventHandler( "transition_complete_keyframe", f146_local15 )

				starterPackXPNotice:completeAnimation()
				self.starterPackXPNotice:setAlpha( 0 )
				self.clipFinished( starterPackXPNotice, {} )
			end,
			FlashNextLevel = function ()
				self:setupElementClipCounter( 10 )

				local f257_local0 = function ( f258_arg0, f258_arg1 )
					if not f258_arg1.interrupted then
						f258_arg0:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
					end
					f258_arg0:setAlpha( 1 )
					if f258_arg1.interrupted then
						self.clipFinished( f258_arg0, f258_arg1 )
					else
						f258_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				XpBarFrame:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
				XpBarFrame:setAlpha( 0 )
				XpBarFrame:registerEventHandler( "transition_complete_keyframe", f257_local0 )
				local f257_local1 = function ( f259_arg0, f259_arg1 )
					if not f259_arg1.interrupted then
						f259_arg0:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
					end
					f259_arg0:setAlpha( 1 )
					if f259_arg1.interrupted then
						self.clipFinished( f259_arg0, f259_arg1 )
					else
						f259_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				XpBar:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
				XpBar:setAlpha( 0 )
				XpBar:registerEventHandler( "transition_complete_keyframe", f257_local1 )
				local f257_local2 = function ( f260_arg0, f260_arg1 )
					if not f260_arg1.interrupted then
						f260_arg0:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
					end
					f260_arg0:setAlpha( 1 )
					if f260_arg1.interrupted then
						self.clipFinished( f260_arg0, f260_arg1 )
					else
						f260_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RankIconAndNumberWidgetPrevious:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
				RankIconAndNumberWidgetPrevious:setAlpha( 0 )
				RankIconAndNumberWidgetPrevious:registerEventHandler( "transition_complete_keyframe", f257_local2 )
				local f257_local3 = function ( f261_arg0, f261_arg1 )
					if not f261_arg1.interrupted then
						f261_arg0:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
					end
					f261_arg0:setAlpha( 1 )
					if f261_arg1.interrupted then
						self.clipFinished( f261_arg0, f261_arg1 )
					else
						f261_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				XPEarnedDisplay:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
				XPEarnedDisplay:setAlpha( 0 )
				XPEarnedDisplay:registerEventHandler( "transition_complete_keyframe", f257_local3 )
				local f257_local4 = function ( f262_arg0, f262_arg1 )
					if not f262_arg1.interrupted then
						f262_arg0:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
					end
					f262_arg0:setAlpha( 1 )
					if f262_arg1.interrupted then
						self.clipFinished( f262_arg0, f262_arg1 )
					else
						f262_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				NextLevelDisplay:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
				NextLevelDisplay:setAlpha( 0 )
				NextLevelDisplay:registerEventHandler( "transition_complete_keyframe", f257_local4 )
				BackGlow:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
				BackGlow:setAlpha( 0 )
				BackGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				local f257_local5 = function ( f263_arg0, f263_arg1 )
					if not f263_arg1.interrupted then
						f263_arg0:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
					end
					f263_arg0:setAlpha( 1 )
					if f263_arg1.interrupted then
						self.clipFinished( f263_arg0, f263_arg1 )
					else
						f263_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RankIconAndNumberWidgetNextTop:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
				RankIconAndNumberWidgetNextTop:setAlpha( 0 )
				RankIconAndNumberWidgetNextTop:registerEventHandler( "transition_complete_keyframe", f257_local5 )
				local Glow0Frame2 = function ( Glow0, event )
					if not event.interrupted then
						Glow0:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					Glow0:setLeftRight( false, false, -673, -463 )
					Glow0:setTopBottom( false, true, -44.79, -10.79 )
					if event.interrupted then
						self.clipFinished( Glow0, event )
					else
						Glow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow0:completeAnimation()
				self.Glow0:setLeftRight( false, false, -626.5, -535.5 )
				self.Glow0:setTopBottom( false, true, -42, -13.5 )
				Glow0Frame2( Glow0, {} )
				local Glow1Frame2 = function ( Glow1, event )
					local Glow1Frame3 = function ( Glow1, event )
						if not event.interrupted then
							Glow1:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						end
						Glow1:setLeftRight( false, false, -625, -525 )
						Glow1:setTopBottom( false, true, -65, 11 )
						Glow1:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Glow1, event )
						else
							Glow1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Glow1Frame3( Glow1, event )
						return 
					else
						Glow1:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame3 )
					end
				end
				
				Glow1:completeAnimation()
				self.Glow1:setLeftRight( false, false, -625, -525 )
				self.Glow1:setTopBottom( false, true, -65, 11 )
				self.Glow1:setAlpha( 0 )
				Glow1Frame2( Glow1, {} )
				local MeterGlowFrame2 = function ( MeterGlow, event )
					local MeterGlowFrame3 = function ( MeterGlow, event )
						if not event.interrupted then
							MeterGlow:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
						end
						MeterGlow:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( MeterGlow, event )
						else
							MeterGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						MeterGlowFrame3( MeterGlow, event )
						return 
					else
						MeterGlow:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						MeterGlow:setAlpha( 1 )
						MeterGlow:registerEventHandler( "transition_complete_keyframe", MeterGlowFrame3 )
					end
				end
				
				MeterGlow:completeAnimation()
				self.MeterGlow:setAlpha( 0 )
				MeterGlowFrame2( MeterGlow, {} )
			end,
			FlashLastLevel = function ()
				self:setupElementClipCounter( 10 )

				XpBarFrame:completeAnimation()
				self.XpBarFrame:setAlpha( 0 )
				self.clipFinished( XpBarFrame, {} )

				XpBar:completeAnimation()
				self.XpBar:setAlpha( 0 )
				self.clipFinished( XpBar, {} )
				local f269_local0 = function ( f270_arg0, f270_arg1 )
					if not f270_arg1.interrupted then
						f270_arg0:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
					end
					f270_arg0:setAlpha( 1 )
					if f270_arg1.interrupted then
						self.clipFinished( f270_arg0, f270_arg1 )
					else
						f270_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RankIconAndNumberWidgetPrevious:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
				RankIconAndNumberWidgetPrevious:setAlpha( 0 )
				RankIconAndNumberWidgetPrevious:registerEventHandler( "transition_complete_keyframe", f269_local0 )
				local f269_local1 = function ( f271_arg0, f271_arg1 )
					if not f271_arg1.interrupted then
						f271_arg0:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
					end
					f271_arg0:setAlpha( 1 )
					if f271_arg1.interrupted then
						self.clipFinished( f271_arg0, f271_arg1 )
					else
						f271_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				XPEarnedDisplay:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
				XPEarnedDisplay:setAlpha( 0 )
				XPEarnedDisplay:registerEventHandler( "transition_complete_keyframe", f269_local1 )

				NextLevelDisplay:completeAnimation()
				self.NextLevelDisplay:setAlpha( 0 )
				self.clipFinished( NextLevelDisplay, {} )

				BackGlow:completeAnimation()
				self.BackGlow:setAlpha( 0 )
				self.clipFinished( BackGlow, {} )

				RankIconAndNumberWidgetNextTop:completeAnimation()
				self.RankIconAndNumberWidgetNextTop:setAlpha( 0 )
				self.clipFinished( RankIconAndNumberWidgetNextTop, {} )

				Glow0:completeAnimation()
				self.Glow0:setLeftRight( false, false, -686.38, -386.38 )
				self.Glow0:setTopBottom( false, true, -29.79, -4.79 )
				self.Glow0:setAlpha( 0 )
				self.clipFinished( Glow0, {} )
				local Glow1Frame2 = function ( Glow1, event )
					local Glow1Frame3 = function ( Glow1, event )
						if not event.interrupted then
							Glow1:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
						end
						Glow1:setLeftRight( false, false, -625, -525 )
						Glow1:setTopBottom( false, true, -65, 11 )
						Glow1:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Glow1, event )
						else
							Glow1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Glow1Frame3( Glow1, event )
						return 
					else
						Glow1:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame3 )
					end
				end
				
				Glow1:completeAnimation()
				self.Glow1:setLeftRight( false, false, -625, -525 )
				self.Glow1:setTopBottom( false, true, -65, 11 )
				self.Glow1:setAlpha( 0.84 )
				Glow1Frame2( Glow1, {} )

				MeterGlow:completeAnimation()
				self.MeterGlow:setAlpha( 0 )
				self.clipFinished( MeterGlow, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Arabic",
			condition = function ( menu, element, event )
				return IsCurrentLanguageArabic()
			end
		}
	} )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.XpBarFrame:close()
		element.XpBar:close()
		element.RankIconAndNumberWidgetNextBase:close()
		element.RankIconAndNumberWidgetPrevious:close()
		element.XPEarnedDisplay:close()
		element.ProgressDescription:close()
		element.NextLevelDisplay:close()
		element.RankIconAndNumberWidgetNextTop:close()
		element.RankIconAndNumberBig:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

