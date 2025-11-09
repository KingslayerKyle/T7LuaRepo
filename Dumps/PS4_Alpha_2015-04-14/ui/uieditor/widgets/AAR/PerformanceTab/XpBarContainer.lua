require( "ui.uieditor.widgets.AAR.PerformanceTab.XpBar" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.RankIconAndNumberWidget" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Identity_SubTitle" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.XpBarTitleRight" )

CoD.XpBarContainer = InheritFrom( LUI.UIElement )
CoD.XpBarContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.XpBarContainer )
	self.id = "XpBarContainer"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 1138 )
	self:setTopBottom( true, false, 0, 54 )
	self.anyChildUsesUpdateState = true
	
	local XpBar = CoD.XpBar.new( menu, controller )
	XpBar:setLeftRight( true, false, 54.67, 1081.95 )
	XpBar:setTopBottom( true, false, 32.71, 45.71 )
	XpBar:setRGB( 1, 1, 1 )
	self:addElement( XpBar )
	self.XpBar = XpBar
	
	local RankIconAndNumberWidgetNextBase = CoD.RankIconAndNumberWidget.new( menu, controller )
	RankIconAndNumberWidgetNextBase:setLeftRight( true, false, 1089.62, 1137.62 )
	RankIconAndNumberWidgetNextBase:setTopBottom( true, false, 24.21, 54.21 )
	RankIconAndNumberWidgetNextBase:setRGB( 1, 1, 1 )
	RankIconAndNumberWidgetNextBase:setAlpha( 0 )
	RankIconAndNumberWidgetNextBase:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "nextLevelIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RankIconAndNumberWidgetNextBase.NextRankIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	RankIconAndNumberWidgetNextBase:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "nextLevel", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RankIconAndNumberWidgetNextBase.NextRank:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( RankIconAndNumberWidgetNextBase )
	self.RankIconAndNumberWidgetNextBase = RankIconAndNumberWidgetNextBase
	
	local RankIconAndNumberWidgetPrevious = CoD.RankIconAndNumberWidget.new( menu, controller )
	RankIconAndNumberWidgetPrevious:setLeftRight( true, false, 0, 48 )
	RankIconAndNumberWidgetPrevious:setTopBottom( true, false, 24.21, 54.21 )
	RankIconAndNumberWidgetPrevious:setRGB( 1, 1, 1 )
	RankIconAndNumberWidgetPrevious:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "currLevelIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RankIconAndNumberWidgetPrevious.NextRankIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	RankIconAndNumberWidgetPrevious:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "currLevel", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RankIconAndNumberWidgetPrevious.NextRank:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( RankIconAndNumberWidgetPrevious )
	self.RankIconAndNumberWidgetPrevious = RankIconAndNumberWidgetPrevious
	
	local StartMenuIdentitySubTitle01 = CoD.StartMenu_Identity_SubTitle.new( menu, controller )
	StartMenuIdentitySubTitle01:setLeftRight( true, false, 54.67, 142.67 )
	StartMenuIdentitySubTitle01:setTopBottom( true, false, 0, 26 )
	StartMenuIdentitySubTitle01:setRGB( 1, 1, 1 )
	StartMenuIdentitySubTitle01.SubTitle:setRGB( 1, 1, 1 )
	StartMenuIdentitySubTitle01.SubTitle:setText( Engine.Localize( "MENU_XP_EARNED_CAPS" ) )
	StartMenuIdentitySubTitle01.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( StartMenuIdentitySubTitle01 )
	self.StartMenuIdentitySubTitle01 = StartMenuIdentitySubTitle01
	
	local XpBarTitleRight0 = CoD.XpBarTitleRight.new( menu, controller )
	XpBarTitleRight0:setLeftRight( false, true, -141.62, -53.62 )
	XpBarTitleRight0:setTopBottom( true, false, 0, 26 )
	XpBarTitleRight0:setRGB( 1, 1, 1 )
	XpBarTitleRight0.SubTitle:setRGB( 1, 1, 1 )
	XpBarTitleRight0.SubTitle:setText( Engine.Localize( "MENU_NEXT_LEVEL_XP_NEEDED" ) )
	XpBarTitleRight0.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( XpBarTitleRight0 )
	self.XpBarTitleRight0 = XpBarTitleRight0
	
	local BackGlow = LUI.UIImage.new()
	BackGlow:setLeftRight( true, false, 1034.17, 1195.17 )
	BackGlow:setTopBottom( true, false, -31.59, 105.01 )
	BackGlow:setRGB( 0, 0, 0 )
	BackGlow:setAlpha( 0 )
	BackGlow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	BackGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( BackGlow )
	self.BackGlow = BackGlow
	
	local RankIconAndNumberWidgetNextTop = CoD.RankIconAndNumberWidget.new( menu, controller )
	RankIconAndNumberWidgetNextTop:setLeftRight( true, false, 1089.62, 1137.62 )
	RankIconAndNumberWidgetNextTop:setTopBottom( true, false, 24.21, 54.21 )
	RankIconAndNumberWidgetNextTop:setRGB( 1, 1, 1 )
	RankIconAndNumberWidgetNextTop:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "nextLevelIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RankIconAndNumberWidgetNextTop.NextRankIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	RankIconAndNumberWidgetNextTop:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "nextLevel", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RankIconAndNumberWidgetNextTop.NextRank:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( RankIconAndNumberWidgetNextTop )
	self.RankIconAndNumberWidgetNextTop = RankIconAndNumberWidgetNextTop
	
	local GlowBox = LUI.UIImage.new()
	GlowBox:setLeftRight( true, false, 1084.38, 1144.96 )
	GlowBox:setTopBottom( true, false, 15.92, 56.51 )
	GlowBox:setRGB( 0.39, 0.2, 0.11 )
	GlowBox:setAlpha( 0 )
	GlowBox:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_inventorybox" ) )
	GlowBox:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowBox )
	self.GlowBox = GlowBox
	
	local Glow0 = LUI.UIImage.new()
	Glow0:setLeftRight( false, false, 403.12, 703.12 )
	Glow0:setTopBottom( false, true, -29.79, -4.79 )
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
	MeterGlow:setLeftRight( true, false, 48, 1096 )
	MeterGlow:setTopBottom( true, false, 21.51, 57.51 )
	MeterGlow:setRGB( 1, 0.2, 0 )
	MeterGlow:setAlpha( 0 )
	MeterGlow:setImage( RegisterImage( "uie_t7_mp_menu_startflow_meterglow" ) )
	MeterGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( MeterGlow )
	self.MeterGlow = MeterGlow
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				RankIconAndNumberWidgetNextBase:completeAnimation()
				self.RankIconAndNumberWidgetNextBase:setAlpha( 0 )
				self.clipFinished( RankIconAndNumberWidgetNextBase, {} )
				RankIconAndNumberWidgetPrevious:completeAnimation()
				self.RankIconAndNumberWidgetPrevious:setLeftRight( true, false, 0, 48 )
				self.RankIconAndNumberWidgetPrevious:setTopBottom( true, false, 24.21, 54.21 )
				self.RankIconAndNumberWidgetPrevious:setAlpha( 1 )
				self.clipFinished( RankIconAndNumberWidgetPrevious, {} )
				BackGlow:completeAnimation()
				self.BackGlow:setAlpha( 0 )
				self.clipFinished( BackGlow, {} )
				RankIconAndNumberWidgetNextTop:completeAnimation()
				self.RankIconAndNumberWidgetNextTop:setLeftRight( true, false, 1089.62, 1137.62 )
				self.RankIconAndNumberWidgetNextTop:setTopBottom( true, false, 24.21, 54.21 )
				self.RankIconAndNumberWidgetNextTop:setAlpha( 1 )
				self.clipFinished( RankIconAndNumberWidgetNextTop, {} )
				GlowBox:completeAnimation()
				self.GlowBox:setAlpha( 0 )
				self.clipFinished( GlowBox, {} )
				Glow0:completeAnimation()
				self.Glow0:setAlpha( 0 )
				self.clipFinished( Glow0, {} )
				Glow1:completeAnimation()
				self.Glow1:setAlpha( 0 )
				self.clipFinished( Glow1, {} )
				MeterGlow:completeAnimation()
				self.MeterGlow:setAlpha( 0 )
				self.clipFinished( MeterGlow, {} )
			end,
			Update = function ()
				self:setupElementClipCounter( 8 )
				local RankIconAndNumberWidgetNextBaseFrame2 = function ( RankIconAndNumberWidgetNextBase, event )
					local RankIconAndNumberWidgetNextBaseFrame3 = function ( RankIconAndNumberWidgetNextBase, event )
						if not event.interrupted then
							RankIconAndNumberWidgetNextBase:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Bounce )
						end
						RankIconAndNumberWidgetNextBase:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( RankIconAndNumberWidgetNextBase, event )
						else
							RankIconAndNumberWidgetNextBase:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						RankIconAndNumberWidgetNextBaseFrame3( RankIconAndNumberWidgetNextBase, event )
						return 
					else
						RankIconAndNumberWidgetNextBase:beginAnimation( "keyframe", 1519, false, false, CoD.TweenType.Linear )
						RankIconAndNumberWidgetNextBase:registerEventHandler( "transition_complete_keyframe", RankIconAndNumberWidgetNextBaseFrame3 )
					end
				end
				
				RankIconAndNumberWidgetNextBase:completeAnimation()
				self.RankIconAndNumberWidgetNextBase:setAlpha( 0 )
				RankIconAndNumberWidgetNextBaseFrame2( RankIconAndNumberWidgetNextBase, {} )
				local RankIconAndNumberWidgetPreviousFrame2 = function ( RankIconAndNumberWidgetPrevious, event )
					local RankIconAndNumberWidgetPreviousFrame3 = function ( RankIconAndNumberWidgetPrevious, event )
						if not event.interrupted then
							RankIconAndNumberWidgetPrevious:beginAnimation( "keyframe", 829, false, false, CoD.TweenType.Bounce )
						end
						RankIconAndNumberWidgetPrevious:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( RankIconAndNumberWidgetPrevious, event )
						else
							RankIconAndNumberWidgetPrevious:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						RankIconAndNumberWidgetPreviousFrame3( RankIconAndNumberWidgetPrevious, event )
						return 
					else
						RankIconAndNumberWidgetPrevious:beginAnimation( "keyframe", 1730, false, false, CoD.TweenType.Linear )
						RankIconAndNumberWidgetPrevious:registerEventHandler( "transition_complete_keyframe", RankIconAndNumberWidgetPreviousFrame3 )
					end
				end
				
				RankIconAndNumberWidgetPrevious:completeAnimation()
				self.RankIconAndNumberWidgetPrevious:setAlpha( 1 )
				RankIconAndNumberWidgetPreviousFrame2( RankIconAndNumberWidgetPrevious, {} )
				local BackGlowFrame2 = function ( BackGlow, event )
					local BackGlowFrame3 = function ( BackGlow, event )
						local BackGlowFrame4 = function ( BackGlow, event )
							local BackGlowFrame5 = function ( BackGlow, event )
								local BackGlowFrame6 = function ( BackGlow, event )
									if not event.interrupted then
										BackGlow:beginAnimation( "keyframe", 690, false, false, CoD.TweenType.Linear )
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
									BackGlowFrame6( BackGlow, event )
									return 
								else
									BackGlow:beginAnimation( "keyframe", 599, false, false, CoD.TweenType.Linear )
									BackGlow:registerEventHandler( "transition_complete_keyframe", BackGlowFrame6 )
								end
							end
							
							if event.interrupted then
								BackGlowFrame5( BackGlow, event )
								return 
							else
								BackGlow:beginAnimation( "keyframe", 1450, true, true, CoD.TweenType.Linear )
								BackGlow:setLeftRight( true, false, -44.83, 116.17 )
								BackGlow:registerEventHandler( "transition_complete_keyframe", BackGlowFrame5 )
							end
						end
						
						if event.interrupted then
							BackGlowFrame4( BackGlow, event )
							return 
						else
							BackGlow:beginAnimation( "keyframe", 749, false, false, CoD.TweenType.Linear )
							BackGlow:registerEventHandler( "transition_complete_keyframe", BackGlowFrame4 )
						end
					end
					
					if event.interrupted then
						BackGlowFrame3( BackGlow, event )
						return 
					else
						BackGlow:beginAnimation( "keyframe", 560, false, false, CoD.TweenType.Linear )
						BackGlow:setAlpha( 0.35 )
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
										local RankIconAndNumberWidgetNextTopFrame8 = function ( RankIconAndNumberWidgetNextTop, event )
											local RankIconAndNumberWidgetNextTopFrame9 = function ( RankIconAndNumberWidgetNextTop, event )
												local RankIconAndNumberWidgetNextTopFrame10 = function ( RankIconAndNumberWidgetNextTop, event )
													if not event.interrupted then
														RankIconAndNumberWidgetNextTop:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Bounce )
													end
													RankIconAndNumberWidgetNextTop:setLeftRight( true, false, 0, 48 )
													RankIconAndNumberWidgetNextTop:setTopBottom( true, false, 24.21, 54.21 )
													RankIconAndNumberWidgetNextTop:setAlpha( 1 )
													if event.interrupted then
														self.clipFinished( RankIconAndNumberWidgetNextTop, event )
													else
														RankIconAndNumberWidgetNextTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													RankIconAndNumberWidgetNextTopFrame10( RankIconAndNumberWidgetNextTop, event )
													return 
												else
													RankIconAndNumberWidgetNextTop:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
													RankIconAndNumberWidgetNextTop:setAlpha( 0.21 )
													RankIconAndNumberWidgetNextTop:registerEventHandler( "transition_complete_keyframe", RankIconAndNumberWidgetNextTopFrame10 )
												end
											end
											
											if event.interrupted then
												RankIconAndNumberWidgetNextTopFrame9( RankIconAndNumberWidgetNextTop, event )
												return 
											else
												RankIconAndNumberWidgetNextTop:beginAnimation( "keyframe", 380, true, true, CoD.TweenType.Bounce )
												RankIconAndNumberWidgetNextTop:setLeftRight( true, false, 0, 48 )
												RankIconAndNumberWidgetNextTop:setTopBottom( true, false, 24.21, 54.21 )
												RankIconAndNumberWidgetNextTop:registerEventHandler( "transition_complete_keyframe", RankIconAndNumberWidgetNextTopFrame9 )
											end
										end
										
										if event.interrupted then
											RankIconAndNumberWidgetNextTopFrame8( RankIconAndNumberWidgetNextTop, event )
											return 
										else
											RankIconAndNumberWidgetNextTop:beginAnimation( "keyframe", 559, false, false, CoD.TweenType.Linear )
											RankIconAndNumberWidgetNextTop:setLeftRight( true, false, -21.33, 54.67 )
											RankIconAndNumberWidgetNextTop:setTopBottom( true, false, 15.46, 62.96 )
											RankIconAndNumberWidgetNextTop:registerEventHandler( "transition_complete_keyframe", RankIconAndNumberWidgetNextTopFrame8 )
										end
									end
									
									if event.interrupted then
										RankIconAndNumberWidgetNextTopFrame7( RankIconAndNumberWidgetNextTop, event )
										return 
									else
										RankIconAndNumberWidgetNextTop:beginAnimation( "keyframe", 1460, true, true, CoD.TweenType.Linear )
										RankIconAndNumberWidgetNextTop:setLeftRight( true, false, -21.33, 54.67 )
										RankIconAndNumberWidgetNextTop:setTopBottom( true, false, 15.46, 62.96 )
										RankIconAndNumberWidgetNextTop:registerEventHandler( "transition_complete_keyframe", RankIconAndNumberWidgetNextTopFrame7 )
									end
								end
								
								if event.interrupted then
									RankIconAndNumberWidgetNextTopFrame6( RankIconAndNumberWidgetNextTop, event )
									return 
								else
									RankIconAndNumberWidgetNextTop:beginAnimation( "keyframe", 169, false, false, CoD.TweenType.Bounce )
									RankIconAndNumberWidgetNextTop:setLeftRight( true, false, 1056.62, 1132.62 )
									RankIconAndNumberWidgetNextTop:setTopBottom( true, false, 18.21, 65.71 )
									RankIconAndNumberWidgetNextTop:setAlpha( 1 )
									RankIconAndNumberWidgetNextTop:registerEventHandler( "transition_complete_keyframe", RankIconAndNumberWidgetNextTopFrame6 )
								end
							end
							
							if event.interrupted then
								RankIconAndNumberWidgetNextTopFrame5( RankIconAndNumberWidgetNextTop, event )
								return 
							else
								RankIconAndNumberWidgetNextTop:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Bounce )
								RankIconAndNumberWidgetNextTop:setAlpha( 0.16 )
								RankIconAndNumberWidgetNextTop:registerEventHandler( "transition_complete_keyframe", RankIconAndNumberWidgetNextTopFrame5 )
							end
						end
						
						if event.interrupted then
							RankIconAndNumberWidgetNextTopFrame4( RankIconAndNumberWidgetNextTop, event )
							return 
						else
							RankIconAndNumberWidgetNextTop:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
							RankIconAndNumberWidgetNextTop:registerEventHandler( "transition_complete_keyframe", RankIconAndNumberWidgetNextTopFrame4 )
						end
					end
					
					if event.interrupted then
						RankIconAndNumberWidgetNextTopFrame3( RankIconAndNumberWidgetNextTop, event )
						return 
					else
						RankIconAndNumberWidgetNextTop:beginAnimation( "keyframe", 389, false, true, CoD.TweenType.Back )
						RankIconAndNumberWidgetNextTop:setLeftRight( true, false, 1056.62, 1132.62 )
						RankIconAndNumberWidgetNextTop:setTopBottom( true, false, 18.21, 65.71 )
						RankIconAndNumberWidgetNextTop:registerEventHandler( "transition_complete_keyframe", RankIconAndNumberWidgetNextTopFrame3 )
					end
				end
				
				RankIconAndNumberWidgetNextTop:completeAnimation()
				self.RankIconAndNumberWidgetNextTop:setLeftRight( true, false, 1089.62, 1137.62 )
				self.RankIconAndNumberWidgetNextTop:setTopBottom( true, false, 24.21, 54.21 )
				self.RankIconAndNumberWidgetNextTop:setAlpha( 1 )
				RankIconAndNumberWidgetNextTopFrame2( RankIconAndNumberWidgetNextTop, {} )
				local GlowBoxFrame2 = function ( GlowBox, event )
					local GlowBoxFrame3 = function ( GlowBox, event )
						local GlowBoxFrame4 = function ( GlowBox, event )
							local GlowBoxFrame5 = function ( GlowBox, event )
								local GlowBoxFrame6 = function ( GlowBox, event )
									if not event.interrupted then
										GlowBox:beginAnimation( "keyframe", 410, false, false, CoD.TweenType.Linear )
									end
									GlowBox:setLeftRight( true, false, -24, 76.66 )
									GlowBox:setTopBottom( true, false, 5.81, 72.61 )
									GlowBox:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( GlowBox, event )
									else
										GlowBox:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									GlowBoxFrame6( GlowBox, event )
									return 
								else
									GlowBox:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									GlowBox:setLeftRight( true, false, -2, 53.14 )
									GlowBox:setTopBottom( true, false, 17.41, 54 )
									GlowBox:setAlpha( 1 )
									GlowBox:registerEventHandler( "transition_complete_keyframe", GlowBoxFrame6 )
								end
							end
							
							if event.interrupted then
								GlowBoxFrame5( GlowBox, event )
								return 
							else
								GlowBox:beginAnimation( "keyframe", 3069, false, false, CoD.TweenType.Linear )
								GlowBox:setLeftRight( true, false, 1.46, 56.73 )
								GlowBox:setTopBottom( true, false, 17.38, 54.07 )
								GlowBox:registerEventHandler( "transition_complete_keyframe", GlowBoxFrame5 )
							end
						end
						
						if event.interrupted then
							GlowBoxFrame4( GlowBox, event )
							return 
						else
							GlowBox:beginAnimation( "keyframe", 390, false, false, CoD.TweenType.Linear )
							GlowBox:setLeftRight( true, false, 1063.38, 1159.96 )
							GlowBox:setTopBottom( true, false, 9.61, 74.32 )
							GlowBox:setAlpha( 0 )
							GlowBox:registerEventHandler( "transition_complete_keyframe", GlowBoxFrame4 )
						end
					end
					
					if event.interrupted then
						GlowBoxFrame3( GlowBox, event )
						return 
					else
						GlowBox:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						GlowBox:setLeftRight( true, false, 1086.88, 1143.05 )
						GlowBox:setTopBottom( true, false, 17.21, 54.51 )
						GlowBox:setAlpha( 1 )
						GlowBox:registerEventHandler( "transition_complete_keyframe", GlowBoxFrame3 )
					end
				end
				
				GlowBox:completeAnimation()
				self.GlowBox:setLeftRight( true, false, 1087.48, 1142.62 )
				self.GlowBox:setTopBottom( true, false, 17.41, 54 )
				self.GlowBox:setAlpha( 0 )
				GlowBoxFrame2( GlowBox, {} )
				local Glow0Frame2 = function ( Glow0, event )
					local Glow0Frame3 = function ( Glow0, event )
						local Glow0Frame4 = function ( Glow0, event )
							local Glow0Frame5 = function ( Glow0, event )
								local Glow0Frame6 = function ( Glow0, event )
									local Glow0Frame7 = function ( Glow0, event )
										local Glow0Frame8 = function ( Glow0, event )
											if not event.interrupted then
												Glow0:beginAnimation( "keyframe", 640, false, false, CoD.TweenType.Bounce )
											end
											Glow0:setLeftRight( false, false, -686.38, -386.38 )
											Glow0:setTopBottom( false, true, -29.79, -4.79 )
											Glow0:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( Glow0, event )
											else
												Glow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											Glow0Frame8( Glow0, event )
											return 
										else
											Glow0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
											Glow0:setAlpha( 0.48 )
											Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame8 )
										end
									end
									
									if event.interrupted then
										Glow0Frame7( Glow0, event )
										return 
									else
										Glow0:beginAnimation( "keyframe", 2329, false, false, CoD.TweenType.Linear )
										Glow0:setLeftRight( false, false, -686.38, -386.38 )
										Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame7 )
									end
								end
								
								if event.interrupted then
									Glow0Frame6( Glow0, event )
									return 
								else
									Glow0:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
									Glow0:setLeftRight( false, false, 403.12, 703.12 )
									Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame6 )
								end
							end
							
							if event.interrupted then
								Glow0Frame5( Glow0, event )
								return 
							else
								Glow0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
								Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame5 )
							end
						end
						
						if event.interrupted then
							Glow0Frame4( Glow0, event )
							return 
						else
							Glow0:beginAnimation( "keyframe", 479, false, false, CoD.TweenType.Bounce )
							Glow0:setAlpha( 0 )
							Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame4 )
						end
					end
					
					if event.interrupted then
						Glow0Frame3( Glow0, event )
						return 
					else
						Glow0:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
						Glow0:setAlpha( 0.51 )
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
										local Glow1Frame8 = function ( Glow1, event )
											local Glow1Frame9 = function ( Glow1, event )
												local Glow1Frame10 = function ( Glow1, event )
													local Glow1Frame11 = function ( Glow1, event )
														local Glow1Frame12 = function ( Glow1, event )
															local Glow1Frame13 = function ( Glow1, event )
																local Glow1Frame14 = function ( Glow1, event )
																	if not event.interrupted then
																		Glow1:beginAnimation( "keyframe", 410, false, false, CoD.TweenType.Bounce )
																	end
																	Glow1:setLeftRight( false, false, -592.59, -493.6 )
																	Glow1:setTopBottom( false, true, -55.79, 21.21 )
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
																	Glow1Frame14( Glow1, event )
																	return 
																else
																	Glow1:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
																	Glow1:setAlpha( 0.84 )
																	Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame14 )
																end
															end
															
															if event.interrupted then
																Glow1Frame13( Glow1, event )
																return 
															else
																Glow1:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame13 )
															end
														end
														
														if event.interrupted then
															Glow1Frame12( Glow1, event )
															return 
														else
															Glow1:beginAnimation( "keyframe", 1400, false, false, CoD.TweenType.Linear )
															Glow1:setLeftRight( false, false, -592.59, -493.6 )
															Glow1:setTopBottom( false, true, -55.79, 21.21 )
															Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame12 )
														end
													end
													
													if event.interrupted then
														Glow1Frame11( Glow1, event )
														return 
													else
														Glow1:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
														Glow1:setLeftRight( false, false, 488.62, 596.62 )
														Glow1:setTopBottom( false, true, -61.8, 22.21 )
														Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame11 )
													end
												end
												
												if event.interrupted then
													Glow1Frame10( Glow1, event )
													return 
												else
													Glow1:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Bounce )
													Glow1:setLeftRight( false, false, 488.31, 596.31 )
													Glow1:setAlpha( 0 )
													Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame10 )
												end
											end
											
											if event.interrupted then
												Glow1Frame9( Glow1, event )
												return 
											else
												Glow1:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Bounce )
												Glow1:setLeftRight( false, false, 487.77, 595.77 )
												Glow1:setAlpha( 1 )
												Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame9 )
											end
										end
										
										if event.interrupted then
											Glow1Frame8( Glow1, event )
											return 
										else
											Glow1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											Glow1:setLeftRight( false, false, 487.63, 595.63 )
											Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame8 )
										end
									end
									
									if event.interrupted then
										Glow1Frame7( Glow1, event )
										return 
									else
										Glow1:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
										Glow1:setLeftRight( false, false, 487.62, 595.62 )
										Glow1:setTopBottom( false, true, -61.79, 22.2 )
										Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame7 )
									end
								end
								
								if event.interrupted then
									Glow1Frame6( Glow1, event )
									return 
								else
									Glow1:beginAnimation( "keyframe", 479, false, false, CoD.TweenType.Linear )
									Glow1:setTopBottom( false, true, -51.8, 15.21 )
									Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame6 )
								end
							end
							
							if event.interrupted then
								Glow1Frame5( Glow1, event )
								return 
							else
								Glow1:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Bounce )
								Glow1:setAlpha( 0 )
								Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame5 )
							end
						end
						
						if event.interrupted then
							Glow1Frame4( Glow1, event )
							return 
						else
							Glow1:beginAnimation( "keyframe", 550, false, false, CoD.TweenType.Linear )
							Glow1:setRGB( 0.59, 0.31, 0 )
							Glow1:setAlpha( 0.09 )
							Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame4 )
						end
					end
					
					if event.interrupted then
						Glow1Frame3( Glow1, event )
						return 
					else
						Glow1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						Glow1:setRGB( 0.94, 0.69, 0 )
						Glow1:setAlpha( 1 )
						Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame3 )
					end
				end
				
				Glow1:completeAnimation()
				self.Glow1:setLeftRight( false, false, 499.62, 589.62 )
				self.Glow1:setTopBottom( false, true, -51.79, 15.2 )
				self.Glow1:setRGB( 0.95, 0.7, 0 )
				self.Glow1:setAlpha( 0 )
				self.Glow1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
				Glow1Frame2( Glow1, {} )
				local MeterGlowFrame2 = function ( MeterGlow, event )
					local MeterGlowFrame3 = function ( MeterGlow, event )
						local MeterGlowFrame4 = function ( MeterGlow, event )
							if not event.interrupted then
								MeterGlow:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Bounce )
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
			end
		}
	}
	self.close = function ( self )
		self.XpBar:close()
		self.RankIconAndNumberWidgetNextBase:close()
		self.RankIconAndNumberWidgetPrevious:close()
		self.StartMenuIdentitySubTitle01:close()
		self.XpBarTitleRight0:close()
		self.RankIconAndNumberWidgetNextTop:close()
		CoD.XpBarContainer.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

