require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.XpBar" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.RankIconAndNumberWidget" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Identity_SubTitle" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.XpBarTitleRight" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.RankIconAndNumberBig" )

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
	
	local cacButtonBoxLrgInactiveStroke0 = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	cacButtonBoxLrgInactiveStroke0:setLeftRight( true, true, 55, -59 )
	cacButtonBoxLrgInactiveStroke0:setTopBottom( true, false, 29, 54 )
	self:addElement( cacButtonBoxLrgInactiveStroke0 )
	self.cacButtonBoxLrgInactiveStroke0 = cacButtonBoxLrgInactiveStroke0
	
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
			RankIconAndNumberWidgetNextBase.NextRank:setText( Engine.Localize( nextLevel ) )
		end
	end )
	self:addElement( RankIconAndNumberWidgetNextBase )
	self.RankIconAndNumberWidgetNextBase = RankIconAndNumberWidgetNextBase
	
	local RankIconAndNumberWidgetPrevious = CoD.RankIconAndNumberWidget.new( menu, controller )
	RankIconAndNumberWidgetPrevious:setLeftRight( true, false, -25, 55 )
	RankIconAndNumberWidgetPrevious:setTopBottom( true, false, 12, 52 )
	RankIconAndNumberWidgetPrevious:linkToElementModel( self, "currLevelIcon", true, function ( model )
		local currLevelIcon = Engine.GetModelValue( model )
		if currLevelIcon then
			RankIconAndNumberWidgetPrevious.NextRankIcon:setImage( RegisterImage( GetRankIconLarge( currLevelIcon ) ) )
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
	XPEarnedDisplay:setLeftRight( true, false, 55, 185 )
	XPEarnedDisplay:setTopBottom( true, false, 5, 31 )
	XPEarnedDisplay.FEButtonPanel0:setAlpha( 0 )
	XPEarnedDisplay.SubTitle:setRGB( 0.95, 0.91, 0.11 )
	XPEarnedDisplay.SubTitle:setText( Engine.Localize( "MENU_XP_EARNED_CAPS" ) )
	XPEarnedDisplay.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( XPEarnedDisplay )
	self.XPEarnedDisplay = XPEarnedDisplay
	
	local ProgressDescription = CoD.StartMenu_Identity_SubTitle.new( menu, controller )
	ProgressDescription:setLeftRight( true, false, 58.5, 146.5 )
	ProgressDescription:setTopBottom( true, false, 4, 30 )
	ProgressDescription:setAlpha( 0 )
	ProgressDescription.SubTitle:setText( Engine.Localize( "MENU_PROGRESS_TO_NEXT_LEVEL_CAPS" ) )
	ProgressDescription.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( ProgressDescription )
	self.ProgressDescription = ProgressDescription
	
	local NextLevelDisplay = CoD.XpBarTitleRight.new( menu, controller )
	NextLevelDisplay:setLeftRight( false, true, -256, -58 )
	NextLevelDisplay:setTopBottom( true, false, 5, 31 )
	NextLevelDisplay.FEButtonPanel0:setAlpha( 0 )
	NextLevelDisplay.SubTitle:setText( Engine.Localize( "MENU_NEXT_LEVEL_XP_NEEDED" ) )
	NextLevelDisplay.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( NextLevelDisplay )
	self.NextLevelDisplay = NextLevelDisplay
	
	local BackGlow = LUI.UIImage.new()
	BackGlow:setLeftRight( true, false, 1034.17, 1195.17 )
	BackGlow:setTopBottom( true, false, -31.59, 105.01 )
	BackGlow:setRGB( 0, 0, 0 )
	BackGlow:setAlpha( 0 )
	BackGlow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	self:addElement( BackGlow )
	self.BackGlow = BackGlow
	
	local RankIconAndNumberWidgetNextTop = CoD.RankIconAndNumberWidget.new( menu, controller )
	RankIconAndNumberWidgetNextTop:setLeftRight( false, true, -48, 32 )
	RankIconAndNumberWidgetNextTop:setTopBottom( true, false, 13, 53 )
	RankIconAndNumberWidgetNextTop:linkToElementModel( self, "nextLevelIcon", true, function ( model )
		local nextLevelIcon = Engine.GetModelValue( model )
		if nextLevelIcon then
			RankIconAndNumberWidgetNextTop.NextRankIcon:setImage( RegisterImage( GetRankIconLarge( nextLevelIcon ) ) )
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
			RankIconAndNumberBig.NextRank:setText( Engine.Localize( nextLevel ) )
		end
	end )
	self:addElement( RankIconAndNumberBig )
	self.RankIconAndNumberBig = RankIconAndNumberBig
	
	local Glow10 = LUI.UIImage.new()
	Glow10:setLeftRight( false, false, -139.37, 162.87 )
	Glow10:setTopBottom( false, true, -74.16, 7.22 )
	Glow10:setRGB( 0.72, 0.46, 0 )
	Glow10:setAlpha( 0 )
	Glow10:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow10:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow10 )
	self.Glow10 = Glow10
	
	local Glow00 = LUI.UIImage.new()
	Glow00:setLeftRight( false, false, -150, 150 )
	Glow00:setTopBottom( false, true, -42, -13.65 )
	Glow00:setRGB( 0.25, 0.06, 0 )
	Glow00:setAlpha( 0.14 )
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
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				RankIconAndNumberWidgetNextBase:completeAnimation()
				self.RankIconAndNumberWidgetNextBase:setAlpha( 0 )
				self.clipFinished( RankIconAndNumberWidgetNextBase, {} )
				RankIconAndNumberWidgetPrevious:completeAnimation()
				self.RankIconAndNumberWidgetPrevious:setAlpha( 1 )
				self.clipFinished( RankIconAndNumberWidgetPrevious, {} )
				BackGlow:completeAnimation()
				self.BackGlow:setAlpha( 0 )
				self.clipFinished( BackGlow, {} )
				RankIconAndNumberWidgetNextTop:completeAnimation()
				self.RankIconAndNumberWidgetNextTop:setAlpha( 1 )
				self.clipFinished( RankIconAndNumberWidgetNextTop, {} )
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
			end,
			Update = function ()
				self:setupElementClipCounter( 17 )
				local f11_local0 = function ( f12_arg0, f12_arg1 )
					local f12_local0 = function ( f13_arg0, f13_arg1 )
						if not f13_arg1.interrupted then
							f13_arg0:beginAnimation( "keyframe", 1470, false, false, CoD.TweenType.Linear )
						end
						f13_arg0:setAlpha( 0 )
						if f13_arg1.interrupted then
							self.clipFinished( f13_arg0, f13_arg1 )
						else
							f13_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f12_arg1.interrupted then
						f12_local0( f12_arg0, f12_arg1 )
						return 
					else
						f12_arg0:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						f12_arg0:setAlpha( 0 )
						f12_arg0:registerEventHandler( "transition_complete_keyframe", f12_local0 )
					end
				end
				
				cacButtonBoxLrgInactiveStroke0:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
				cacButtonBoxLrgInactiveStroke0:setAlpha( 1 )
				cacButtonBoxLrgInactiveStroke0:registerEventHandler( "transition_complete_keyframe", f11_local0 )
				local f11_local1 = function ( f14_arg0, f14_arg1 )
					local f14_local0 = function ( f15_arg0, f15_arg1 )
						if not f15_arg1.interrupted then
							f15_arg0:beginAnimation( "keyframe", 1470, false, false, CoD.TweenType.Linear )
						end
						f15_arg0:setAlpha( 0 )
						if f15_arg1.interrupted then
							self.clipFinished( f15_arg0, f15_arg1 )
						else
							f15_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f14_arg1.interrupted then
						f14_local0( f14_arg0, f14_arg1 )
						return 
					else
						f14_arg0:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						f14_arg0:setAlpha( 0 )
						f14_arg0:registerEventHandler( "transition_complete_keyframe", f14_local0 )
					end
				end
				
				XpBar:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
				XpBar:setAlpha( 1 )
				XpBar:registerEventHandler( "transition_complete_keyframe", f11_local1 )
				local RankIconAndNumberWidgetNextBaseFrame2 = function ( RankIconAndNumberWidgetNextBase, event )
					if not event.interrupted then
						RankIconAndNumberWidgetNextBase:beginAnimation( "keyframe", 2230, false, false, CoD.TweenType.Linear )
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
									RankIconAndNumberWidgetPrevious:beginAnimation( "keyframe", 649, false, false, CoD.TweenType.Linear )
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
				local f11_local4 = function ( f21_arg0, f21_arg1 )
					local f21_local0 = function ( f22_arg0, f22_arg1 )
						if not f22_arg1.interrupted then
							f22_arg0:beginAnimation( "keyframe", 1250, false, false, CoD.TweenType.Linear )
						end
						f22_arg0:setAlpha( 0 )
						if f22_arg1.interrupted then
							self.clipFinished( f22_arg0, f22_arg1 )
						else
							f22_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f21_arg1.interrupted then
						f21_local0( f21_arg0, f21_arg1 )
						return 
					else
						f21_arg0:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
						f21_arg0:setAlpha( 0 )
						f21_arg0:registerEventHandler( "transition_complete_keyframe", f21_local0 )
					end
				end
				
				XPEarnedDisplay:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
				XPEarnedDisplay:setAlpha( 1 )
				XPEarnedDisplay:registerEventHandler( "transition_complete_keyframe", f11_local4 )
				ProgressDescription:beginAnimation( "keyframe", 2230, false, false, CoD.TweenType.Linear )
				ProgressDescription:setAlpha( 0 )
				ProgressDescription:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				local f11_local5 = function ( f23_arg0, f23_arg1 )
					local f23_local0 = function ( f24_arg0, f24_arg1 )
						if not f24_arg1.interrupted then
							f24_arg0:beginAnimation( "keyframe", 1250, false, false, CoD.TweenType.Linear )
						end
						f24_arg0:setAlpha( 0 )
						if f24_arg1.interrupted then
							self.clipFinished( f24_arg0, f24_arg1 )
						else
							f24_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f23_arg1.interrupted then
						f23_local0( f23_arg0, f23_arg1 )
						return 
					else
						f23_arg0:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
						f23_arg0:setAlpha( 0 )
						f23_arg0:registerEventHandler( "transition_complete_keyframe", f23_local0 )
					end
				end
				
				NextLevelDisplay:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
				NextLevelDisplay:setAlpha( 1 )
				NextLevelDisplay:registerEventHandler( "transition_complete_keyframe", f11_local5 )
				local BackGlowFrame2 = function ( BackGlow, event )
					local BackGlowFrame3 = function ( BackGlow, event )
						local BackGlowFrame4 = function ( BackGlow, event )
							if not event.interrupted then
								BackGlow:beginAnimation( "keyframe", 450, false, false, CoD.TweenType.Linear )
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
											RankIconAndNumberWidgetNextTop:beginAnimation( "keyframe", 1340, false, false, CoD.TweenType.Linear )
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
													Glow0:beginAnimation( "keyframe", 1100, false, false, CoD.TweenType.Linear )
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
											Glow1:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
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
									MeterGlow:beginAnimation( "keyframe", 1460, false, false, CoD.TweenType.Linear )
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
				local f11_local11 = function ( f52_arg0, f52_arg1 )
					local f52_local0 = function ( f53_arg0, f53_arg1 )
						local f53_local0 = function ( f54_arg0, f54_arg1 )
							local f54_local0 = function ( f55_arg0, f55_arg1 )
								local f55_local0 = function ( f56_arg0, f56_arg1 )
									local f56_local0 = function ( f57_arg0, f57_arg1 )
										local f57_local0 = function ( f58_arg0, f58_arg1 )
											if not f58_arg1.interrupted then
												f58_arg0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
											end
											f58_arg0:setLeftRight( true, false, 533.25, 778.25 )
											f58_arg0:setTopBottom( true, false, 9, 49 )
											f58_arg0:setAlpha( 0 )
											if f58_arg1.interrupted then
												self.clipFinished( f58_arg0, f58_arg1 )
											else
												f58_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if f57_arg1.interrupted then
											f57_local0( f57_arg0, f57_arg1 )
											return 
										else
											f57_arg0:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
											f57_arg0:setLeftRight( true, false, 492.63, 737.63 )
											f57_arg0:setAlpha( 0 )
											f57_arg0:registerEventHandler( "transition_complete_keyframe", f57_local0 )
										end
									end
									
									if f56_arg1.interrupted then
										f56_local0( f56_arg0, f56_arg1 )
										return 
									else
										f56_arg0:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
										f56_arg0:setLeftRight( true, false, 452, 697 )
										f56_arg0:setAlpha( 0.53 )
										f56_arg0:registerEventHandler( "transition_complete_keyframe", f56_local0 )
									end
								end
								
								if f55_arg1.interrupted then
									f55_local0( f55_arg0, f55_arg1 )
									return 
								else
									f55_arg0:beginAnimation( "keyframe", 1009, false, true, CoD.TweenType.Linear )
									f55_arg0:setLeftRight( true, false, 450.94, 695.99 )
									f55_arg0:registerEventHandler( "transition_complete_keyframe", f55_local0 )
								end
							end
							
							if f54_arg1.interrupted then
								f54_local0( f54_arg0, f54_arg1 )
								return 
							else
								f54_arg0:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
								f54_arg0:setLeftRight( true, false, 435.58, 681.45 )
								f54_arg0:setAlpha( 1 )
								f54_arg0:registerEventHandler( "transition_complete_keyframe", f54_local0 )
							end
						end
						
						if f53_arg1.interrupted then
							f53_local0( f53_arg0, f53_arg1 )
							return 
						else
							f53_arg0:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
							f53_arg0:setLeftRight( true, false, 433, 679 )
							f53_arg0:setAlpha( 0.41 )
							f53_arg0:registerEventHandler( "transition_complete_keyframe", f53_local0 )
						end
					end
					
					if f52_arg1.interrupted then
						f52_local0( f52_arg0, f52_arg1 )
						return 
					else
						f52_arg0:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						f52_arg0:setLeftRight( true, false, 401.71, 647.71 )
						f52_arg0:registerEventHandler( "transition_complete_keyframe", f52_local0 )
					end
				end
				
				RankIconAndNumberBig:beginAnimation( "keyframe", 540, false, false, CoD.TweenType.Linear )
				RankIconAndNumberBig:setLeftRight( true, false, 360, 606 )
				RankIconAndNumberBig:setTopBottom( true, false, 9, 49 )
				RankIconAndNumberBig:setAlpha( 0 )
				RankIconAndNumberBig:registerEventHandler( "transition_complete_keyframe", f11_local11 )
				local Glow10Frame2 = function ( Glow10, event )
					local Glow10Frame3 = function ( Glow10, event )
						local Glow10Frame4 = function ( Glow10, event )
							local Glow10Frame5 = function ( Glow10, event )
								local Glow10Frame6 = function ( Glow10, event )
									local Glow10Frame7 = function ( Glow10, event )
										local Glow10Frame8 = function ( Glow10, event )
											local Glow10Frame9 = function ( Glow10, event )
												if not event.interrupted then
													Glow10:beginAnimation( "keyframe", 830, false, false, CoD.TweenType.Linear )
												end
												Glow10:setLeftRight( false, false, -164.37, 183.87 )
												Glow10:setTopBottom( false, true, -74.16, 17.75 )
												Glow10:setAlpha( 0 )
												if event.interrupted then
													self.clipFinished( Glow10, event )
												else
													Glow10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												Glow10Frame9( Glow10, event )
												return 
											else
												Glow10:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
												Glow10:setAlpha( 0 )
												Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame9 )
											end
										end
										
										if event.interrupted then
											Glow10Frame8( Glow10, event )
											return 
										else
											Glow10:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
											Glow10:setAlpha( 1 )
											Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame8 )
										end
									end
									
									if event.interrupted then
										Glow10Frame7( Glow10, event )
										return 
									else
										Glow10:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
										Glow10:setAlpha( 0.23 )
										Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame7 )
									end
								end
								
								if event.interrupted then
									Glow10Frame6( Glow10, event )
									return 
								else
									Glow10:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									Glow10:setAlpha( 0 )
									Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame6 )
								end
							end
							
							if event.interrupted then
								Glow10Frame5( Glow10, event )
								return 
							else
								Glow10:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								Glow10:setAlpha( 1 )
								Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame5 )
							end
						end
						
						if event.interrupted then
							Glow10Frame4( Glow10, event )
							return 
						else
							Glow10:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
							Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame4 )
						end
					end
					
					if event.interrupted then
						Glow10Frame3( Glow10, event )
						return 
					else
						Glow10:beginAnimation( "keyframe", 850, false, false, CoD.TweenType.Linear )
						Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame3 )
					end
				end
				
				Glow10:completeAnimation()
				self.Glow10:setLeftRight( false, false, -164.37, 183.87 )
				self.Glow10:setTopBottom( false, true, -74.16, 17.75 )
				self.Glow10:setAlpha( 0 )
				Glow10Frame2( Glow10, {} )
				local f11_local13 = function ( f67_arg0, f67_arg1 )
					local f67_local0 = function ( f68_arg0, f68_arg1 )
						local f68_local0 = function ( f69_arg0, f69_arg1 )
							if not f69_arg1.interrupted then
								f69_arg0:beginAnimation( "keyframe", 1070, false, false, CoD.TweenType.Linear )
							end
							f69_arg0:setLeftRight( false, false, -183.75, 203.25 )
							f69_arg0:setTopBottom( false, true, -53.53, -2.88 )
							f69_arg0:setAlpha( 0 )
							if f69_arg1.interrupted then
								self.clipFinished( f69_arg0, f69_arg1 )
							else
								f69_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f68_arg1.interrupted then
							f68_local0( f68_arg0, f68_arg1 )
							return 
						else
							f68_arg0:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
							f68_arg0:setAlpha( 0 )
							f68_arg0:registerEventHandler( "transition_complete_keyframe", f68_local0 )
						end
					end
					
					if f67_arg1.interrupted then
						f67_local0( f67_arg0, f67_arg1 )
						return 
					else
						f67_arg0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						f67_arg0:setAlpha( 1 )
						f67_arg0:registerEventHandler( "transition_complete_keyframe", f67_local0 )
					end
				end
				
				Glow00:beginAnimation( "keyframe", 959, false, false, CoD.TweenType.Linear )
				Glow00:setLeftRight( false, false, -183.75, 203.25 )
				Glow00:setTopBottom( false, true, -53.53, -2.88 )
				Glow00:setAlpha( 0 )
				Glow00:registerEventHandler( "transition_complete_keyframe", f11_local13 )
				local promotionSoundFrame2 = function ( promotionSound, event )
					if not event.interrupted then
						promotionSound:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
					end
					promotionSound:playSound( "rank_sound" )
					if event.interrupted then
						self.clipFinished( promotionSound, event )
					else
						promotionSound:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				promotionSound:completeAnimation()
				self.promotionSound:playSound( "" )
				promotionSoundFrame2( promotionSound, {} )
				local f11_local15 = function ( f71_arg0, f71_arg1 )
					if not f71_arg1.interrupted then
						f71_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
					end
					f71_arg0:playSound( "rank_music" )
					if f71_arg1.interrupted then
						self.clipFinished( f71_arg0, f71_arg1 )
					else
						f71_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				promotionMusic:beginAnimation( "keyframe", 839, false, false, CoD.TweenType.Linear )
				promotionMusic:playSound( "" )
				promotionMusic:registerEventHandler( "transition_complete_keyframe", f11_local15 )
			end,
			FlashNextLevel = function ()
				self:setupElementClipCounter( 10 )
				local f72_local0 = function ( f73_arg0, f73_arg1 )
					if not f73_arg1.interrupted then
						f73_arg0:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
					end
					f73_arg0:setAlpha( 1 )
					if f73_arg1.interrupted then
						self.clipFinished( f73_arg0, f73_arg1 )
					else
						f73_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				cacButtonBoxLrgInactiveStroke0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
				cacButtonBoxLrgInactiveStroke0:setAlpha( 0 )
				cacButtonBoxLrgInactiveStroke0:registerEventHandler( "transition_complete_keyframe", f72_local0 )
				local f72_local1 = function ( f74_arg0, f74_arg1 )
					if not f74_arg1.interrupted then
						f74_arg0:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
					end
					f74_arg0:setAlpha( 1 )
					if f74_arg1.interrupted then
						self.clipFinished( f74_arg0, f74_arg1 )
					else
						f74_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				XpBar:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
				XpBar:setAlpha( 0 )
				XpBar:registerEventHandler( "transition_complete_keyframe", f72_local1 )
				local f72_local2 = function ( f75_arg0, f75_arg1 )
					if not f75_arg1.interrupted then
						f75_arg0:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
					end
					f75_arg0:setAlpha( 1 )
					if f75_arg1.interrupted then
						self.clipFinished( f75_arg0, f75_arg1 )
					else
						f75_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RankIconAndNumberWidgetPrevious:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
				RankIconAndNumberWidgetPrevious:setAlpha( 0 )
				RankIconAndNumberWidgetPrevious:registerEventHandler( "transition_complete_keyframe", f72_local2 )
				local f72_local3 = function ( f76_arg0, f76_arg1 )
					if not f76_arg1.interrupted then
						f76_arg0:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
					end
					f76_arg0:setAlpha( 1 )
					if f76_arg1.interrupted then
						self.clipFinished( f76_arg0, f76_arg1 )
					else
						f76_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				XPEarnedDisplay:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
				XPEarnedDisplay:setAlpha( 0 )
				XPEarnedDisplay:registerEventHandler( "transition_complete_keyframe", f72_local3 )
				local f72_local4 = function ( f77_arg0, f77_arg1 )
					if not f77_arg1.interrupted then
						f77_arg0:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
					end
					f77_arg0:setAlpha( 1 )
					if f77_arg1.interrupted then
						self.clipFinished( f77_arg0, f77_arg1 )
					else
						f77_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				NextLevelDisplay:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
				NextLevelDisplay:setAlpha( 0 )
				NextLevelDisplay:registerEventHandler( "transition_complete_keyframe", f72_local4 )
				BackGlow:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
				BackGlow:setAlpha( 0 )
				BackGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				local f72_local5 = function ( f78_arg0, f78_arg1 )
					if not f78_arg1.interrupted then
						f78_arg0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					f78_arg0:setAlpha( 1 )
					if f78_arg1.interrupted then
						self.clipFinished( f78_arg0, f78_arg1 )
					else
						f78_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RankIconAndNumberWidgetNextTop:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
				RankIconAndNumberWidgetNextTop:setAlpha( 0 )
				RankIconAndNumberWidgetNextTop:registerEventHandler( "transition_complete_keyframe", f72_local5 )
				local f72_local6 = function ( f79_arg0, f79_arg1 )
					local f79_local0 = function ( f80_arg0, f80_arg1 )
						if not f80_arg1.interrupted then
							f80_arg0:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Linear )
						end
						f80_arg0:setLeftRight( false, false, -686.38, -386.38 )
						f80_arg0:setTopBottom( false, true, -29.79, -4.79 )
						f80_arg0:setAlpha( 0 )
						if f80_arg1.interrupted then
							self.clipFinished( f80_arg0, f80_arg1 )
						else
							f80_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f79_arg1.interrupted then
						f79_local0( f79_arg0, f79_arg1 )
						return 
					else
						f79_arg0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						f79_arg0:registerEventHandler( "transition_complete_keyframe", f79_local0 )
					end
				end
				
				Glow0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
				Glow0:setLeftRight( false, false, -686.38, -386.38 )
				Glow0:setTopBottom( false, true, -29.79, -4.79 )
				Glow0:setAlpha( 0 )
				Glow0:registerEventHandler( "transition_complete_keyframe", f72_local6 )
				local Glow1Frame2 = function ( Glow1, event )
					local Glow1Frame3 = function ( Glow1, event )
						local Glow1Frame4 = function ( Glow1, event )
							local Glow1Frame5 = function ( Glow1, event )
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
								Glow1Frame5( Glow1, event )
								return 
							else
								Glow1:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
								Glow1:setAlpha( 0.84 )
								Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame5 )
							end
						end
						
						if event.interrupted then
							Glow1Frame4( Glow1, event )
							return 
						else
							Glow1:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							Glow1:setLeftRight( false, false, -625, -525 )
							Glow1:setTopBottom( false, true, -65, 11 )
							Glow1:setAlpha( 0.47 )
							Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame4 )
						end
					end
					
					if event.interrupted then
						Glow1Frame3( Glow1, event )
						return 
					else
						Glow1:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
						Glow1:setLeftRight( false, false, -623.18, -523.64 )
						Glow1:setTopBottom( false, true, -60.91, 15.55 )
						Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame3 )
					end
				end
				
				Glow1:completeAnimation()
				self.Glow1:setLeftRight( false, false, -621, -522 )
				self.Glow1:setTopBottom( false, true, -56, 21 )
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
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.cacButtonBoxLrgInactiveStroke0:close()
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

