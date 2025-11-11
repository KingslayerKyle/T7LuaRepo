require( "ui.uieditor.widgets.AAR.PerformanceTab.RankIconAndNumberBig" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.RankIconAndNumberWidget" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.XpBar" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.XpBarTitleRight" )
require( "ui.uieditor.widgets.AAR.XPbarFrame" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Identity_SubTitle" )

local PostLoadFunc = function ( self, controller )
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
	self:setLeftRight( 0, 0, 0, 1725 )
	self:setTopBottom( 0, 0, 0, 90 )
	self.anyChildUsesUpdateState = true
	
	local XpBarFrame = CoD.XPbarFrame.new( menu, controller )
	XpBarFrame:setLeftRight( 0, 1, 87, -93 )
	XpBarFrame:setTopBottom( 0, 0, 44, 81 )
	self:addElement( XpBarFrame )
	self.XpBarFrame = XpBarFrame
	
	local XpBar = CoD.XpBar.new( menu, controller )
	XpBar:setLeftRight( 0, 1, 91, -97 )
	XpBar:setTopBottom( 0, 0, 51, 74 )
	self:addElement( XpBar )
	self.XpBar = XpBar
	
	local RankIconAndNumberWidgetNextBase = CoD.RankIconAndNumberWidget.new( menu, controller )
	RankIconAndNumberWidgetNextBase:setLeftRight( 1, 1, -967, -761 )
	RankIconAndNumberWidgetNextBase:setTopBottom( 0, 0, 14, 74 )
	RankIconAndNumberWidgetNextBase:setAlpha( 0 )
	RankIconAndNumberWidgetNextBase:setScale( 1.5 )
	RankIconAndNumberWidgetNextBase:linkToElementModel( self, "nextLevelIcon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RankIconAndNumberWidgetNextBase.NextRankIcon:setImage( RegisterImage( GetRankIconLarge( modelValue ) ) )
		end
	end )
	RankIconAndNumberWidgetNextBase:linkToElementModel( self, "nextLevel", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RankIconAndNumberWidgetNextBase.NextRank:setRGB( SetToParagonColorIfPrestigeMasterByRank( 255, 255, 255, modelValue ) )
		end
	end )
	RankIconAndNumberWidgetNextBase:linkToElementModel( self, "nextLevel", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RankIconAndNumberWidgetNextBase.NextRank:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( RankIconAndNumberWidgetNextBase )
	self.RankIconAndNumberWidgetNextBase = RankIconAndNumberWidgetNextBase
	
	local RankIconAndNumberWidgetPrevious = CoD.RankIconAndNumberWidget.new( menu, controller )
	RankIconAndNumberWidgetPrevious:setLeftRight( 0, 0, -51, 69 )
	RankIconAndNumberWidgetPrevious:setTopBottom( 0, 0, 30, 90 )
	RankIconAndNumberWidgetPrevious:linkToElementModel( self, "currLevelIcon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RankIconAndNumberWidgetPrevious.NextRankIcon:setImage( RegisterImage( GetRankIconLarge( modelValue ) ) )
		end
	end )
	RankIconAndNumberWidgetPrevious:linkToElementModel( self, "currLevel", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RankIconAndNumberWidgetPrevious.NextRank:setRGB( SetToParagonColorIfPrestigeMasterByRank( 255, 255, 255, modelValue ) )
		end
	end )
	RankIconAndNumberWidgetPrevious:linkToElementModel( self, "currLevel", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RankIconAndNumberWidgetPrevious.NextRank:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( RankIconAndNumberWidgetPrevious )
	self.RankIconAndNumberWidgetPrevious = RankIconAndNumberWidgetPrevious
	
	local XPEarnedDisplay = CoD.StartMenu_Identity_SubTitle.new( menu, controller )
	XPEarnedDisplay:setLeftRight( 0, 0, 83, 860 )
	XPEarnedDisplay:setTopBottom( 0, 0, 8, 47 )
	XPEarnedDisplay.FEButtonPanel0:setAlpha( 0 )
	XPEarnedDisplay.SubTitle:setRGB( 0.95, 0.91, 0.11 )
	XPEarnedDisplay.SubTitle:setText( Engine.Localize( "MENU_XP_EARNED_CAPS" ) )
	XPEarnedDisplay.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( XPEarnedDisplay )
	self.XPEarnedDisplay = XPEarnedDisplay
	
	local ProgressDescription = CoD.StartMenu_Identity_SubTitle.new( menu, controller )
	ProgressDescription:setLeftRight( 0, 0, 88, 781 )
	ProgressDescription:setTopBottom( 0, 0, 6, 45 )
	ProgressDescription:setAlpha( 0 )
	ProgressDescription.SubTitle:setText( Engine.Localize( "MENU_PROGRESS_TO_NEXT_LEVEL_CAPS" ) )
	ProgressDescription.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( ProgressDescription )
	self.ProgressDescription = ProgressDescription
	
	local NextLevelDisplay = CoD.XpBarTitleRight.new( menu, controller )
	NextLevelDisplay:setLeftRight( 1, 1, -384, -87 )
	NextLevelDisplay:setTopBottom( 0, 0, 8, 47 )
	NextLevelDisplay.FEButtonPanel0:setAlpha( 0 )
	NextLevelDisplay.SubTitle:setText( Engine.Localize( "MENU_NEXT_LEVEL_XP_NEEDED" ) )
	NextLevelDisplay.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( NextLevelDisplay )
	self.NextLevelDisplay = NextLevelDisplay
	
	local BackGlow = LUI.UIImage.new()
	BackGlow:setLeftRight( 0, 0, 1574, 1816 )
	BackGlow:setTopBottom( 0, 0, -47, 158 )
	BackGlow:setRGB( 0, 0, 0 )
	BackGlow:setAlpha( 0 )
	BackGlow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	self:addElement( BackGlow )
	self.BackGlow = BackGlow
	
	local RankIconAndNumberWidgetNextTop = CoD.RankIconAndNumberWidget.new( menu, controller )
	RankIconAndNumberWidgetNextTop:setLeftRight( 1, 1, -90, 30 )
	RankIconAndNumberWidgetNextTop:setTopBottom( 0, 0, 30, 90 )
	RankIconAndNumberWidgetNextTop:linkToElementModel( self, "nextLevelIcon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RankIconAndNumberWidgetNextTop.NextRankIcon:setImage( RegisterImage( GetRankIconLarge( modelValue ) ) )
		end
	end )
	RankIconAndNumberWidgetNextTop:linkToElementModel( self, "nextLevel", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RankIconAndNumberWidgetNextTop.NextRank:setRGB( SetToParagonColorIfPrestigeMasterByRank( 255, 255, 255, modelValue ) )
		end
	end )
	RankIconAndNumberWidgetNextTop:linkToElementModel( self, "nextLevel", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RankIconAndNumberWidgetNextTop.NextRank:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( RankIconAndNumberWidgetNextTop )
	self.RankIconAndNumberWidgetNextTop = RankIconAndNumberWidgetNextTop
	
	local Glow0 = LUI.UIImage.new()
	Glow0:setLeftRight( 0.5, 0.5, -225, 225 )
	Glow0:setTopBottom( 1, 1, -58, -21 )
	Glow0:setRGB( 0.25, 0.06, 0 )
	Glow0:setAlpha( 0 )
	Glow0:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow0 )
	self.Glow0 = Glow0
	
	local Glow1 = LUI.UIImage.new()
	Glow1:setLeftRight( 0.5, 0.5, 697, 929 )
	Glow1:setTopBottom( 1, 1, -109, 64 )
	Glow1:setRGB( 0.59, 0.31, 0 )
	Glow1:setAlpha( 0 )
	Glow1:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow1 )
	self.Glow1 = Glow1
	
	local MeterGlow = LUI.UIImage.new()
	MeterGlow:setLeftRight( 0, 1, 72, -64 )
	MeterGlow:setTopBottom( 0, 0, 20, 108 )
	MeterGlow:setRGB( 1, 0.2, 0 )
	MeterGlow:setImage( RegisterImage( "uie_t7_mp_menu_startflow_meterglow" ) )
	MeterGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( MeterGlow )
	self.MeterGlow = MeterGlow
	
	local RankIconAndNumberBig = CoD.RankIconAndNumberBig.new( menu, controller )
	RankIconAndNumberBig:setLeftRight( 0, 0, 676, 1044 )
	RankIconAndNumberBig:setTopBottom( 0, 0, 14, 74 )
	RankIconAndNumberBig:setAlpha( 0 )
	RankIconAndNumberBig:setScale( 1.5 )
	RankIconAndNumberBig:linkToElementModel( self, "nextLevelIcon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RankIconAndNumberBig.NextRankIcon:setImage( RegisterImage( GetRankIconLarge( modelValue ) ) )
		end
	end )
	RankIconAndNumberBig:linkToElementModel( self, "nextLevel", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RankIconAndNumberBig.NextRank:setRGB( SetToParagonColorIfPrestigeMasterByRank( 255, 255, 255, modelValue ) )
		end
	end )
	RankIconAndNumberBig:linkToElementModel( self, "nextLevel", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RankIconAndNumberBig.NextRank:setText( Engine.Localize( modelValue ) )
		end
	end )
	RankIconAndNumberBig:linkToElementModel( self, "nextLevel", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RankIconAndNumberBig.LEVEL:setRGB( SetToParagonColorIfPrestigeMasterByRank( 255, 255, 255, modelValue ) )
		end
	end )
	self:addElement( RankIconAndNumberBig )
	self.RankIconAndNumberBig = RankIconAndNumberBig
	
	local Glow10 = LUI.UIImage.new()
	Glow10:setLeftRight( 0.5, 0.5, -261, 295 )
	Glow10:setTopBottom( 1, 1, -103, 14 )
	Glow10:setRGB( 0.72, 0.46, 0 )
	Glow10:setAlpha( 0 )
	Glow10:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow10:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow10 )
	self.Glow10 = Glow10
	
	local Glow00 = LUI.UIImage.new()
	Glow00:setLeftRight( 0.5, 0.5, -286, 317 )
	Glow00:setTopBottom( 1, 1, -83, -5 )
	Glow00:setRGB( 0.25, 0.06, 0 )
	Glow00:setAlpha( 0 )
	Glow00:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow00 )
	self.Glow00 = Glow00
	
	local promotionSound = LUI.UIElement.new()
	promotionSound:setLeftRight( 0, 0, -245, -173 )
	promotionSound:setTopBottom( 0, 0, 86, 158 )
	self:addElement( promotionSound )
	self.promotionSound = promotionSound
	
	local promotionMusic = LUI.UIElement.new()
	promotionMusic:setLeftRight( 0, 0, -245, -173 )
	promotionMusic:setTopBottom( 0, 0, 173, 245 )
	self:addElement( promotionMusic )
	self.promotionMusic = promotionMusic
	
	self.resetProperties = function ()
		MeterGlow:completeAnimation()
		ProgressDescription:completeAnimation()
		XPEarnedDisplay:completeAnimation()
		NextLevelDisplay:completeAnimation()
		RankIconAndNumberWidgetNextTop:completeAnimation()
		RankIconAndNumberWidgetNextBase:completeAnimation()
		RankIconAndNumberWidgetPrevious:completeAnimation()
		Glow0:completeAnimation()
		Glow1:completeAnimation()
		BackGlow:completeAnimation()
		promotionSound:completeAnimation()
		XpBar:completeAnimation()
		XpBarFrame:completeAnimation()
		RankIconAndNumberBig:completeAnimation()
		Glow10:completeAnimation()
		Glow00:completeAnimation()
		promotionMusic:completeAnimation()
		MeterGlow:setRGB( 1, 0.2, 0 )
		MeterGlow:setAlpha( 1 )
		ProgressDescription:setLeftRight( 0, 0, 88, 781 )
		ProgressDescription:setTopBottom( 0, 0, 6, 45 )
		ProgressDescription:setAlpha( 0 )
		ProgressDescription.FEButtonPanel0:setAlpha( 0.4 )
		XPEarnedDisplay:setLeftRight( 0, 0, 83, 860 )
		XPEarnedDisplay:setTopBottom( 0, 0, 8, 47 )
		XPEarnedDisplay:setAlpha( 1 )
		NextLevelDisplay:setLeftRight( 1, 1, -384, -87 )
		NextLevelDisplay:setTopBottom( 0, 0, 8, 47 )
		NextLevelDisplay:setAlpha( 1 )
		RankIconAndNumberWidgetNextTop:setAlpha( 1 )
		RankIconAndNumberWidgetNextBase:setAlpha( 0 )
		RankIconAndNumberWidgetPrevious:setAlpha( 1 )
		Glow0:setLeftRight( 0.5, 0.5, -225, 225 )
		Glow0:setTopBottom( 1, 1, -58, -21 )
		Glow0:setAlpha( 0 )
		Glow1:setLeftRight( 0.5, 0.5, 697, 929 )
		Glow1:setTopBottom( 1, 1, -109, 64 )
		Glow1:setRGB( 0.59, 0.31, 0 )
		Glow1:setAlpha( 0 )
		BackGlow:setLeftRight( 0, 0, 1574, 1816 )
		BackGlow:setTopBottom( 0, 0, -47, 158 )
		BackGlow:setAlpha( 0 )
		promotionSound:playSound( "rank_sound", controller )
		XpBar:setAlpha( 1 )
		XpBarFrame:setAlpha( 1 )
		RankIconAndNumberBig:setLeftRight( 0, 0, 676, 1044 )
		RankIconAndNumberBig:setTopBottom( 0, 0, 14, 74 )
		RankIconAndNumberBig:setAlpha( 0 )
		Glow10:setAlpha( 0 )
		Glow00:setAlpha( 0 )
		promotionMusic:playSound( "rank_music", controller )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				XPEarnedDisplay:completeAnimation()
				self.XPEarnedDisplay:setLeftRight( 0, 0, 81.5, 803.5 )
				self.XPEarnedDisplay:setTopBottom( 0, 0, 8, 47 )
				self.clipFinished( XPEarnedDisplay, {} )
				ProgressDescription:completeAnimation()
				ProgressDescription.FEButtonPanel0:completeAnimation()
				self.ProgressDescription:setLeftRight( 0, 0, -100, 313 )
				self.ProgressDescription:setTopBottom( 0, 0, -20, 19 )
				self.ProgressDescription.FEButtonPanel0:setAlpha( 0.2 )
				self.clipFinished( ProgressDescription, {} )
				NextLevelDisplay:completeAnimation()
				self.NextLevelDisplay:setLeftRight( 1, 1, -383, -86 )
				self.NextLevelDisplay:setTopBottom( 0, 0, 8, 47 )
				self.clipFinished( NextLevelDisplay, {} )
				MeterGlow:completeAnimation()
				self.MeterGlow:setAlpha( 0 )
				self.clipFinished( MeterGlow, {} )
			end,
			Update = function ()
				self.resetProperties()
				self:setupElementClipCounter( 17 )
				local XpBarFrameFrame2 = function ( XpBarFrame, event )
					local XpBarFrameFrame3 = function ( XpBarFrame, event )
						if not event.interrupted then
							XpBarFrame:beginAnimation( "keyframe", 2609, false, false, CoD.TweenType.Linear )
						end
						XpBarFrame:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( XpBarFrame, event )
						else
							XpBarFrame:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						XpBarFrameFrame3( XpBarFrame, event )
						return 
					else
						XpBarFrame:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						XpBarFrame:setAlpha( 0 )
						XpBarFrame:registerEventHandler( "transition_complete_keyframe", XpBarFrameFrame3 )
					end
				end
				
				XpBarFrame:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
				XpBarFrame:setAlpha( 1 )
				XpBarFrame:registerEventHandler( "transition_complete_keyframe", XpBarFrameFrame2 )
				local XpBarFrame2 = function ( XpBar, event )
					local XpBarFrame3 = function ( XpBar, event )
						if not event.interrupted then
							XpBar:beginAnimation( "keyframe", 2609, false, false, CoD.TweenType.Linear )
						end
						XpBar:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( XpBar, event )
						else
							XpBar:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						XpBarFrame3( XpBar, event )
						return 
					else
						XpBar:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						XpBar:setAlpha( 0 )
						XpBar:registerEventHandler( "transition_complete_keyframe", XpBarFrame3 )
					end
				end
				
				XpBar:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
				XpBar:setAlpha( 1 )
				XpBar:registerEventHandler( "transition_complete_keyframe", XpBarFrame2 )
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
				local XPEarnedDisplayFrame2 = function ( XPEarnedDisplay, event )
					local XPEarnedDisplayFrame3 = function ( XPEarnedDisplay, event )
						if not event.interrupted then
							XPEarnedDisplay:beginAnimation( "keyframe", 2389, false, false, CoD.TweenType.Linear )
						end
						XPEarnedDisplay:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( XPEarnedDisplay, event )
						else
							XPEarnedDisplay:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						XPEarnedDisplayFrame3( XPEarnedDisplay, event )
						return 
					else
						XPEarnedDisplay:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
						XPEarnedDisplay:setAlpha( 0 )
						XPEarnedDisplay:registerEventHandler( "transition_complete_keyframe", XPEarnedDisplayFrame3 )
					end
				end
				
				XPEarnedDisplay:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
				XPEarnedDisplay:setAlpha( 1 )
				XPEarnedDisplay:registerEventHandler( "transition_complete_keyframe", XPEarnedDisplayFrame2 )
				ProgressDescription:beginAnimation( "keyframe", 3369, false, false, CoD.TweenType.Linear )
				ProgressDescription:setAlpha( 0 )
				ProgressDescription:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				local NextLevelDisplayFrame2 = function ( NextLevelDisplay, event )
					local NextLevelDisplayFrame3 = function ( NextLevelDisplay, event )
						if not event.interrupted then
							NextLevelDisplay:beginAnimation( "keyframe", 2389, false, false, CoD.TweenType.Linear )
						end
						NextLevelDisplay:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( NextLevelDisplay, event )
						else
							NextLevelDisplay:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						NextLevelDisplayFrame3( NextLevelDisplay, event )
						return 
					else
						NextLevelDisplay:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
						NextLevelDisplay:setAlpha( 0 )
						NextLevelDisplay:registerEventHandler( "transition_complete_keyframe", NextLevelDisplayFrame3 )
					end
				end
				
				NextLevelDisplay:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
				NextLevelDisplay:setAlpha( 1 )
				NextLevelDisplay:registerEventHandler( "transition_complete_keyframe", NextLevelDisplayFrame2 )
				local BackGlowFrame2 = function ( BackGlow, event )
					local BackGlowFrame3 = function ( BackGlow, event )
						local BackGlowFrame4 = function ( BackGlow, event )
							if not event.interrupted then
								BackGlow:beginAnimation( "keyframe", 1589, false, false, CoD.TweenType.Linear )
							end
							BackGlow:setLeftRight( 0, 0, -66.5, 174.5 )
							BackGlow:setTopBottom( 0, 0, -47, 158 )
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
							BackGlow:setLeftRight( 0, 0, -66.5, 174.5 )
							BackGlow:registerEventHandler( "transition_complete_keyframe", BackGlowFrame4 )
						end
					end
					
					if event.interrupted then
						BackGlowFrame3( BackGlow, event )
						return 
					else
						BackGlow:beginAnimation( "keyframe", 1309, false, false, CoD.TweenType.Linear )
						BackGlow:registerEventHandler( "transition_complete_keyframe", BackGlowFrame3 )
					end
				end
				
				BackGlow:completeAnimation()
				self.BackGlow:setLeftRight( 0, 0, 1551, 1793 )
				self.BackGlow:setTopBottom( 0, 0, -47, 158 )
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
												Glow0:setLeftRight( 0.5, 0.5, 605, 1055 )
												Glow0:setTopBottom( 1, 1, -44, -7 )
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
											Glow0:setTopBottom( 1, 1, -44, -7 )
											Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame8 )
										end
									end
									
									if event.interrupted then
										Glow0Frame7( Glow0, event )
										return 
									else
										Glow0:beginAnimation( "keyframe", 479, false, false, CoD.TweenType.Bounce )
										Glow0:setTopBottom( 1, 1, -45.53, -7 )
										Glow0:setAlpha( 0 )
										Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame7 )
									end
								end
								
								if event.interrupted then
									Glow0Frame6( Glow0, event )
									return 
								else
									Glow0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									Glow0:setTopBottom( 1, 1, -53.66, -7 )
									Glow0:setAlpha( 0.51 )
									Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame6 )
								end
							end
							
							if event.interrupted then
								Glow0Frame5( Glow0, event )
								return 
							else
								Glow0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								Glow0:setTopBottom( 1, 1, -54, -7 )
								Glow0:setAlpha( 0.42 )
								Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame5 )
							end
						end
						
						if event.interrupted then
							Glow0Frame4( Glow0, event )
							return 
						else
							Glow0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							Glow0:setTopBottom( 1, 1, -63.5, -7.5 )
							Glow0:setAlpha( 0.37 )
							Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame4 )
						end
					end
					
					if event.interrupted then
						Glow0Frame3( Glow0, event )
						return 
					else
						Glow0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						Glow0:setTopBottom( 1, 1, -70, -7 )
						Glow0:setAlpha( 0.28 )
						Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame3 )
					end
				end
				
				Glow0:completeAnimation()
				self.Glow0:setLeftRight( 0.5, 0.5, 605, 1055 )
				self.Glow0:setTopBottom( 1, 1, -44, -7 )
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
										Glow1:setLeftRight( 0.5, 0.5, 733, 895 )
										Glow1:setTopBottom( 1, 1, -92.5, 33.5 )
										Glow1:setRGB( 0.59, 0.31, 0 )
										Glow1:setAlpha( 0 )
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
										Glow1:setLeftRight( 0.5, 0.5, 733, 895 )
										Glow1:setTopBottom( 1, 1, -92.5, 33.5 )
										Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame7 )
									end
								end
								
								if event.interrupted then
									Glow1Frame6( Glow1, event )
									return 
								else
									Glow1:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Bounce )
									Glow1:setLeftRight( 0.5, 0.5, 747.5, 892.1 )
									Glow1:setTopBottom( 1, 1, -96.37, 27.05 )
									Glow1:setAlpha( 0 )
									Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame6 )
								end
							end
							
							if event.interrupted then
								Glow1Frame5( Glow1, event )
								return 
							else
								Glow1:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
								Glow1:setLeftRight( 0.5, 0.5, 749.4, 891.72 )
								Glow1:setTopBottom( 1, 1, -96.87, 26.21 )
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
							Glow1:setLeftRight( 0.5, 0.5, 755.5, 890.5 )
							Glow1:setTopBottom( 1, 1, -98.5, 23.5 )
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
						Glow1:setLeftRight( 0.5, 0.5, 757.32, 892.32 )
						Glow1:setTopBottom( 1, 1, -79.41, 22.59 )
						Glow1:setRGB( 0.94, 0.69, 0 )
						Glow1:setAlpha( 1 )
						Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame3 )
					end
				end
				
				Glow1:completeAnimation()
				self.Glow1:setLeftRight( 0.5, 0.5, 757.5, 892.5 )
				self.Glow1:setTopBottom( 1, 1, -77.5, 22.5 )
				self.Glow1:setRGB( 0.95, 0.7, 0 )
				self.Glow1:setAlpha( 0 )
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
				local RankIconAndNumberBigFrame2 = function ( RankIconAndNumberBig, event )
					local RankIconAndNumberBigFrame3 = function ( RankIconAndNumberBig, event )
						local RankIconAndNumberBigFrame4 = function ( RankIconAndNumberBig, event )
							local RankIconAndNumberBigFrame5 = function ( RankIconAndNumberBig, event )
								local RankIconAndNumberBigFrame6 = function ( RankIconAndNumberBig, event )
									local RankIconAndNumberBigFrame7 = function ( RankIconAndNumberBig, event )
										local RankIconAndNumberBigFrame8 = function ( RankIconAndNumberBig, event )
											local RankIconAndNumberBigFrame9 = function ( RankIconAndNumberBig, event )
												local RankIconAndNumberBigFrame10 = function ( RankIconAndNumberBig, event )
													local RankIconAndNumberBigFrame11 = function ( RankIconAndNumberBig, event )
														if not event.interrupted then
															RankIconAndNumberBig:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
														end
														RankIconAndNumberBig:setLeftRight( 0, 0, -0.5, 368.5 )
														RankIconAndNumberBig:setTopBottom( 0, 0, 14, 74 )
														RankIconAndNumberBig:setAlpha( 0 )
														if event.interrupted then
															self.clipFinished( RankIconAndNumberBig, event )
														else
															RankIconAndNumberBig:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														RankIconAndNumberBigFrame11( RankIconAndNumberBig, event )
														return 
													else
														RankIconAndNumberBig:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
														RankIconAndNumberBig:setLeftRight( 0, 0, 197.65, 566.35 )
														RankIconAndNumberBig:setAlpha( 0 )
														RankIconAndNumberBig:registerEventHandler( "transition_complete_keyframe", RankIconAndNumberBigFrame11 )
													end
												end
												
												if event.interrupted then
													RankIconAndNumberBigFrame10( RankIconAndNumberBig, event )
													return 
												else
													RankIconAndNumberBig:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
													RankIconAndNumberBig:setLeftRight( 0, 0, 660, 1028 )
													RankIconAndNumberBig:setAlpha( 0.23 )
													RankIconAndNumberBig:registerEventHandler( "transition_complete_keyframe", RankIconAndNumberBigFrame10 )
												end
											end
											
											if event.interrupted then
												RankIconAndNumberBigFrame9( RankIconAndNumberBig, event )
												return 
											else
												RankIconAndNumberBig:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
												RankIconAndNumberBig:setLeftRight( 0, 0, 669.32, 1037.32 )
												RankIconAndNumberBig:registerEventHandler( "transition_complete_keyframe", RankIconAndNumberBigFrame9 )
											end
										end
										
										if event.interrupted then
											RankIconAndNumberBigFrame8( RankIconAndNumberBig, event )
											return 
										else
											RankIconAndNumberBig:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
											RankIconAndNumberBig:setLeftRight( 0, 0, 675, 1043 )
											RankIconAndNumberBig:registerEventHandler( "transition_complete_keyframe", RankIconAndNumberBigFrame8 )
										end
									end
									
									if event.interrupted then
										RankIconAndNumberBigFrame7( RankIconAndNumberBig, event )
										return 
									else
										RankIconAndNumberBig:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
										RankIconAndNumberBig:setLeftRight( 0, 0, 674.83, 1043.71 )
										RankIconAndNumberBig:registerEventHandler( "transition_complete_keyframe", RankIconAndNumberBigFrame7 )
									end
								end
								
								if event.interrupted then
									RankIconAndNumberBigFrame6( RankIconAndNumberBig, event )
									return 
								else
									RankIconAndNumberBig:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									RankIconAndNumberBig:setLeftRight( 0, 0, 670.5, 1061.5 )
									RankIconAndNumberBig:registerEventHandler( "transition_complete_keyframe", RankIconAndNumberBigFrame6 )
								end
							end
							
							if event.interrupted then
								RankIconAndNumberBigFrame5( RankIconAndNumberBig, event )
								return 
							else
								RankIconAndNumberBig:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								RankIconAndNumberBig:setLeftRight( 0, 0, 726, 1098 )
								RankIconAndNumberBig:setAlpha( 1 )
								RankIconAndNumberBig:registerEventHandler( "transition_complete_keyframe", RankIconAndNumberBigFrame5 )
							end
						end
						
						if event.interrupted then
							RankIconAndNumberBigFrame4( RankIconAndNumberBig, event )
							return 
						else
							RankIconAndNumberBig:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
							RankIconAndNumberBig:setLeftRight( 0, 0, 758, 1126 )
							RankIconAndNumberBig:setAlpha( 0.88 )
							RankIconAndNumberBig:registerEventHandler( "transition_complete_keyframe", RankIconAndNumberBigFrame4 )
						end
					end
					
					if event.interrupted then
						RankIconAndNumberBigFrame3( RankIconAndNumberBig, event )
						return 
					else
						RankIconAndNumberBig:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
						RankIconAndNumberBig:setLeftRight( 0, 0, 1071.92, 1439.92 )
						RankIconAndNumberBig:registerEventHandler( "transition_complete_keyframe", RankIconAndNumberBigFrame3 )
					end
				end
				
				RankIconAndNumberBig:beginAnimation( "keyframe", 639, false, false, CoD.TweenType.Linear )
				RankIconAndNumberBig:setLeftRight( 0, 0, 1341, 1709 )
				RankIconAndNumberBig:setTopBottom( 0, 0, 14, 74 )
				RankIconAndNumberBig:setAlpha( 0 )
				RankIconAndNumberBig:registerEventHandler( "transition_complete_keyframe", RankIconAndNumberBigFrame2 )
				local Glow10Frame2 = function ( Glow10, event )
					local Glow10Frame3 = function ( Glow10, event )
						local Glow10Frame4 = function ( Glow10, event )
							local Glow10Frame5 = function ( Glow10, event )
								local Glow10Frame6 = function ( Glow10, event )
									local Glow10Frame7 = function ( Glow10, event )
										local Glow10Frame8 = function ( Glow10, event )
											local Glow10Frame9 = function ( Glow10, event )
												local Glow10Frame10 = function ( Glow10, event )
													local Glow10Frame11 = function ( Glow10, event )
														local Glow10Frame12 = function ( Glow10, event )
															local Glow10Frame13 = function ( Glow10, event )
																local Glow10Frame14 = function ( Glow10, event )
																	local Glow10Frame15 = function ( Glow10, event )
																		local Glow10Frame16 = function ( Glow10, event )
																			local Glow10Frame17 = function ( Glow10, event )
																				local Glow10Frame18 = function ( Glow10, event )
																					local Glow10Frame19 = function ( Glow10, event )
																						local Glow10Frame20 = function ( Glow10, event )
																							local Glow10Frame21 = function ( Glow10, event )
																								local Glow10Frame22 = function ( Glow10, event )
																									local Glow10Frame23 = function ( Glow10, event )
																										local Glow10Frame24 = function ( Glow10, event )
																											local Glow10Frame25 = function ( Glow10, event )
																												local Glow10Frame26 = function ( Glow10, event )
																													local Glow10Frame27 = function ( Glow10, event )
																														local Glow10Frame28 = function ( Glow10, event )
																															local Glow10Frame29 = function ( Glow10, event )
																																local Glow10Frame30 = function ( Glow10, event )
																																	local Glow10Frame31 = function ( Glow10, event )
																																		local Glow10Frame32 = function ( Glow10, event )
																																			local Glow10Frame33 = function ( Glow10, event )
																																				local Glow10Frame34 = function ( Glow10, event )
																																					local Glow10Frame35 = function ( Glow10, event )
																																						local Glow10Frame36 = function ( Glow10, event )
																																							local Glow10Frame37 = function ( Glow10, event )
																																								local Glow10Frame38 = function ( Glow10, event )
																																									local Glow10Frame39 = function ( Glow10, event )
																																										local Glow10Frame40 = function ( Glow10, event )
																																											local Glow10Frame41 = function ( Glow10, event )
																																												local Glow10Frame42 = function ( Glow10, event )
																																													if not event.interrupted then
																																														Glow10:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Linear )
																																													end
																																													Glow10:setAlpha( 0 )
																																													if event.interrupted then
																																														self.clipFinished( Glow10, event )
																																													else
																																														Glow10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																																													end
																																												end
																																												
																																												if event.interrupted then
																																													Glow10Frame42( Glow10, event )
																																													return 
																																												else
																																													Glow10:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																																													Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame42 )
																																												end
																																											end
																																											
																																											if event.interrupted then
																																												Glow10Frame41( Glow10, event )
																																												return 
																																											else
																																												Glow10:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																												Glow10:setAlpha( 0 )
																																												Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame41 )
																																											end
																																										end
																																										
																																										if event.interrupted then
																																											Glow10Frame40( Glow10, event )
																																											return 
																																										else
																																											Glow10:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																											Glow10:setAlpha( 1 )
																																											Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame40 )
																																										end
																																									end
																																									
																																									if event.interrupted then
																																										Glow10Frame39( Glow10, event )
																																										return 
																																									else
																																										Glow10:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																																										Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame39 )
																																									end
																																								end
																																								
																																								if event.interrupted then
																																									Glow10Frame38( Glow10, event )
																																									return 
																																								else
																																									Glow10:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																																									Glow10:setAlpha( 0 )
																																									Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame38 )
																																								end
																																							end
																																							
																																							if event.interrupted then
																																								Glow10Frame37( Glow10, event )
																																								return 
																																							else
																																								Glow10:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
																																								Glow10:setAlpha( 1 )
																																								Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame37 )
																																							end
																																						end
																																						
																																						if event.interrupted then
																																							Glow10Frame36( Glow10, event )
																																							return 
																																						else
																																							Glow10:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																																							Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame36 )
																																						end
																																					end
																																					
																																					if event.interrupted then
																																						Glow10Frame35( Glow10, event )
																																						return 
																																					else
																																						Glow10:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																																						Glow10:setAlpha( 0 )
																																						Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame35 )
																																					end
																																				end
																																				
																																				if event.interrupted then
																																					Glow10Frame34( Glow10, event )
																																					return 
																																				else
																																					Glow10:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
																																					Glow10:setAlpha( 1 )
																																					Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame34 )
																																				end
																																			end
																																			
																																			if event.interrupted then
																																				Glow10Frame33( Glow10, event )
																																				return 
																																			else
																																				Glow10:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																																				Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame33 )
																																			end
																																		end
																																		
																																		if event.interrupted then
																																			Glow10Frame32( Glow10, event )
																																			return 
																																		else
																																			Glow10:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																																			Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame32 )
																																		end
																																	end
																																	
																																	if event.interrupted then
																																		Glow10Frame31( Glow10, event )
																																		return 
																																	else
																																		Glow10:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
																																		Glow10:setAlpha( 0 )
																																		Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame31 )
																																	end
																																end
																																
																																if event.interrupted then
																																	Glow10Frame30( Glow10, event )
																																	return 
																																else
																																	Glow10:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																																	Glow10:setAlpha( 0.85 )
																																	Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame30 )
																																end
																															end
																															
																															if event.interrupted then
																																Glow10Frame29( Glow10, event )
																																return 
																															else
																																Glow10:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
																																Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame29 )
																															end
																														end
																														
																														if event.interrupted then
																															Glow10Frame28( Glow10, event )
																															return 
																														else
																															Glow10:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																															Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame28 )
																														end
																													end
																													
																													if event.interrupted then
																														Glow10Frame27( Glow10, event )
																														return 
																													else
																														Glow10:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																														Glow10:setAlpha( 0 )
																														Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame27 )
																													end
																												end
																												
																												if event.interrupted then
																													Glow10Frame26( Glow10, event )
																													return 
																												else
																													Glow10:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																													Glow10:setAlpha( 1 )
																													Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame26 )
																												end
																											end
																											
																											if event.interrupted then
																												Glow10Frame25( Glow10, event )
																												return 
																											else
																												Glow10:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																												Glow10:setAlpha( 0 )
																												Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame25 )
																											end
																										end
																										
																										if event.interrupted then
																											Glow10Frame24( Glow10, event )
																											return 
																										else
																											Glow10:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
																											Glow10:setAlpha( 1 )
																											Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame24 )
																										end
																									end
																									
																									if event.interrupted then
																										Glow10Frame23( Glow10, event )
																										return 
																									else
																										Glow10:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																										Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame23 )
																									end
																								end
																								
																								if event.interrupted then
																									Glow10Frame22( Glow10, event )
																									return 
																								else
																									Glow10:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																									Glow10:setAlpha( 0 )
																									Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame22 )
																								end
																							end
																							
																							if event.interrupted then
																								Glow10Frame21( Glow10, event )
																								return 
																							else
																								Glow10:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																								Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame21 )
																							end
																						end
																						
																						if event.interrupted then
																							Glow10Frame20( Glow10, event )
																							return 
																						else
																							Glow10:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
																							Glow10:setAlpha( 1 )
																							Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame20 )
																						end
																					end
																					
																					if event.interrupted then
																						Glow10Frame19( Glow10, event )
																						return 
																					else
																						Glow10:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																						Glow10:setAlpha( 0 )
																						Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame19 )
																					end
																				end
																				
																				if event.interrupted then
																					Glow10Frame18( Glow10, event )
																					return 
																				else
																					Glow10:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
																					Glow10:setAlpha( 1 )
																					Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame18 )
																				end
																			end
																			
																			if event.interrupted then
																				Glow10Frame17( Glow10, event )
																				return 
																			else
																				Glow10:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																				Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame17 )
																			end
																		end
																		
																		if event.interrupted then
																			Glow10Frame16( Glow10, event )
																			return 
																		else
																			Glow10:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																			Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		Glow10Frame15( Glow10, event )
																		return 
																	else
																		Glow10:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																		Glow10:setAlpha( 0 )
																		Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame15 )
																	end
																end
																
																if event.interrupted then
																	Glow10Frame14( Glow10, event )
																	return 
																else
																	Glow10:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																	Glow10:setAlpha( 1 )
																	Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame14 )
																end
															end
															
															if event.interrupted then
																Glow10Frame13( Glow10, event )
																return 
															else
																Glow10:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
																Glow10:setAlpha( 0 )
																Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame13 )
															end
														end
														
														if event.interrupted then
															Glow10Frame12( Glow10, event )
															return 
														else
															Glow10:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
															Glow10:setAlpha( 1 )
															Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame12 )
														end
													end
													
													if event.interrupted then
														Glow10Frame11( Glow10, event )
														return 
													else
														Glow10:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
														Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame11 )
													end
												end
												
												if event.interrupted then
													Glow10Frame10( Glow10, event )
													return 
												else
													Glow10:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
													Glow10:setAlpha( 0 )
													Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame10 )
												end
											end
											
											if event.interrupted then
												Glow10Frame9( Glow10, event )
												return 
											else
												Glow10:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
												Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame9 )
											end
										end
										
										if event.interrupted then
											Glow10Frame8( Glow10, event )
											return 
										else
											Glow10:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											Glow10:setAlpha( 1 )
											Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame8 )
										end
									end
									
									if event.interrupted then
										Glow10Frame7( Glow10, event )
										return 
									else
										Glow10:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
										Glow10:setAlpha( 0 )
										Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame7 )
									end
								end
								
								if event.interrupted then
									Glow10Frame6( Glow10, event )
									return 
								else
									Glow10:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
									Glow10:setAlpha( 1 )
									Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame6 )
								end
							end
							
							if event.interrupted then
								Glow10Frame5( Glow10, event )
								return 
							else
								Glow10:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
								Glow10:setAlpha( 0 )
								Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame5 )
							end
						end
						
						if event.interrupted then
							Glow10Frame4( Glow10, event )
							return 
						else
							Glow10:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
							Glow10:setAlpha( 1 )
							Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame4 )
						end
					end
					
					if event.interrupted then
						Glow10Frame3( Glow10, event )
						return 
					else
						Glow10:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame3 )
					end
				end
				
				Glow10:beginAnimation( "keyframe", 670, false, false, CoD.TweenType.Linear )
				Glow10:setAlpha( 0 )
				Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame2 )
				local Glow00Frame2 = function ( Glow00, event )
					local Glow00Frame3 = function ( Glow00, event )
						local Glow00Frame4 = function ( Glow00, event )
							local Glow00Frame5 = function ( Glow00, event )
								local Glow00Frame6 = function ( Glow00, event )
									local Glow00Frame7 = function ( Glow00, event )
										local Glow00Frame8 = function ( Glow00, event )
											local Glow00Frame9 = function ( Glow00, event )
												local Glow00Frame10 = function ( Glow00, event )
													local Glow00Frame11 = function ( Glow00, event )
														local Glow00Frame12 = function ( Glow00, event )
															local Glow00Frame13 = function ( Glow00, event )
																local Glow00Frame14 = function ( Glow00, event )
																	local Glow00Frame15 = function ( Glow00, event )
																		local Glow00Frame16 = function ( Glow00, event )
																			local Glow00Frame17 = function ( Glow00, event )
																				local Glow00Frame18 = function ( Glow00, event )
																					if not event.interrupted then
																						Glow00:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																					end
																					Glow00:setAlpha( 0 )
																					if event.interrupted then
																						self.clipFinished( Glow00, event )
																					else
																						Glow00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																					end
																				end
																				
																				if event.interrupted then
																					Glow00Frame18( Glow00, event )
																					return 
																				else
																					Glow00:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																					Glow00:setAlpha( 0 )
																					Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame18 )
																				end
																			end
																			
																			if event.interrupted then
																				Glow00Frame17( Glow00, event )
																				return 
																			else
																				Glow00:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
																				Glow00:setAlpha( 1 )
																				Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame17 )
																			end
																		end
																		
																		if event.interrupted then
																			Glow00Frame16( Glow00, event )
																			return 
																		else
																			Glow00:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
																			Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		Glow00Frame15( Glow00, event )
																		return 
																	else
																		Glow00:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																		Glow00:setAlpha( 0 )
																		Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame15 )
																	end
																end
																
																if event.interrupted then
																	Glow00Frame14( Glow00, event )
																	return 
																else
																	Glow00:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
																	Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame14 )
																end
															end
															
															if event.interrupted then
																Glow00Frame13( Glow00, event )
																return 
															else
																Glow00:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
																Glow00:setAlpha( 1 )
																Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame13 )
															end
														end
														
														if event.interrupted then
															Glow00Frame12( Glow00, event )
															return 
														else
															Glow00:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
															Glow00:setAlpha( 0 )
															Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame12 )
														end
													end
													
													if event.interrupted then
														Glow00Frame11( Glow00, event )
														return 
													else
														Glow00:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
														Glow00:setAlpha( 1 )
														Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame11 )
													end
												end
												
												if event.interrupted then
													Glow00Frame10( Glow00, event )
													return 
												else
													Glow00:beginAnimation( "keyframe", 419, false, false, CoD.TweenType.Linear )
													Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame10 )
												end
											end
											
											if event.interrupted then
												Glow00Frame9( Glow00, event )
												return 
											else
												Glow00:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
												Glow00:setAlpha( 0 )
												Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame9 )
											end
										end
										
										if event.interrupted then
											Glow00Frame8( Glow00, event )
											return 
										else
											Glow00:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
											Glow00:setAlpha( 1 )
											Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame8 )
										end
									end
									
									if event.interrupted then
										Glow00Frame7( Glow00, event )
										return 
									else
										Glow00:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
										Glow00:setAlpha( 0 )
										Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame7 )
									end
								end
								
								if event.interrupted then
									Glow00Frame6( Glow00, event )
									return 
								else
									Glow00:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
									Glow00:setAlpha( 1 )
									Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame6 )
								end
							end
							
							if event.interrupted then
								Glow00Frame5( Glow00, event )
								return 
							else
								Glow00:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
								Glow00:setAlpha( 0 )
								Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame5 )
							end
						end
						
						if event.interrupted then
							Glow00Frame4( Glow00, event )
							return 
						else
							Glow00:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
							Glow00:setAlpha( 1 )
							Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame4 )
						end
					end
					
					if event.interrupted then
						Glow00Frame3( Glow00, event )
						return 
					else
						Glow00:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
						Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame3 )
					end
				end
				
				Glow00:beginAnimation( "keyframe", 670, false, false, CoD.TweenType.Linear )
				Glow00:setAlpha( 0 )
				Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame2 )
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
				local promotionMusicFrame2 = function ( promotionMusic, event )
					if not event.interrupted then
						promotionMusic:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
					end
					promotionMusic:playSound( "rank_music", controller )
					if event.interrupted then
						self.clipFinished( promotionMusic, event )
					else
						promotionMusic:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				promotionMusic:beginAnimation( "keyframe", 839, false, false, CoD.TweenType.Linear )
				promotionMusic:playSound( "0", controller )
				promotionMusic:registerEventHandler( "transition_complete_keyframe", promotionMusicFrame2 )
			end,
			FlashNextLevel = function ()
				self.resetProperties()
				self:setupElementClipCounter( 10 )
				local XpBarFrameFrame2 = function ( XpBarFrame, event )
					if not event.interrupted then
						XpBarFrame:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
					end
					XpBarFrame:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( XpBarFrame, event )
					else
						XpBarFrame:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				XpBarFrame:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
				XpBarFrame:setAlpha( 0 )
				XpBarFrame:registerEventHandler( "transition_complete_keyframe", XpBarFrameFrame2 )
				local XpBarFrame2 = function ( XpBar, event )
					if not event.interrupted then
						XpBar:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
					end
					XpBar:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( XpBar, event )
					else
						XpBar:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				XpBar:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
				XpBar:setAlpha( 0 )
				XpBar:registerEventHandler( "transition_complete_keyframe", XpBarFrame2 )
				local RankIconAndNumberWidgetPreviousFrame2 = function ( RankIconAndNumberWidgetPrevious, event )
					if not event.interrupted then
						RankIconAndNumberWidgetPrevious:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
					end
					RankIconAndNumberWidgetPrevious:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( RankIconAndNumberWidgetPrevious, event )
					else
						RankIconAndNumberWidgetPrevious:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RankIconAndNumberWidgetPrevious:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
				RankIconAndNumberWidgetPrevious:setAlpha( 0 )
				RankIconAndNumberWidgetPrevious:registerEventHandler( "transition_complete_keyframe", RankIconAndNumberWidgetPreviousFrame2 )
				local XPEarnedDisplayFrame2 = function ( XPEarnedDisplay, event )
					if not event.interrupted then
						XPEarnedDisplay:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
					end
					XPEarnedDisplay:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( XPEarnedDisplay, event )
					else
						XPEarnedDisplay:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				XPEarnedDisplay:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
				XPEarnedDisplay:setAlpha( 0 )
				XPEarnedDisplay:registerEventHandler( "transition_complete_keyframe", XPEarnedDisplayFrame2 )
				local NextLevelDisplayFrame2 = function ( NextLevelDisplay, event )
					if not event.interrupted then
						NextLevelDisplay:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
					end
					NextLevelDisplay:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( NextLevelDisplay, event )
					else
						NextLevelDisplay:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				NextLevelDisplay:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
				NextLevelDisplay:setAlpha( 0 )
				NextLevelDisplay:registerEventHandler( "transition_complete_keyframe", NextLevelDisplayFrame2 )
				BackGlow:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
				BackGlow:setAlpha( 0 )
				BackGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				local RankIconAndNumberWidgetNextTopFrame2 = function ( RankIconAndNumberWidgetNextTop, event )
					if not event.interrupted then
						RankIconAndNumberWidgetNextTop:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
					end
					RankIconAndNumberWidgetNextTop:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( RankIconAndNumberWidgetNextTop, event )
					else
						RankIconAndNumberWidgetNextTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RankIconAndNumberWidgetNextTop:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
				RankIconAndNumberWidgetNextTop:setAlpha( 0 )
				RankIconAndNumberWidgetNextTop:registerEventHandler( "transition_complete_keyframe", RankIconAndNumberWidgetNextTopFrame2 )
				local Glow0Frame2 = function ( Glow0, event )
					if not event.interrupted then
						Glow0:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					Glow0:setLeftRight( 0.5, 0.5, -1009.5, -694.5 )
					Glow0:setTopBottom( 1, 1, -67, -16 )
					if event.interrupted then
						self.clipFinished( Glow0, event )
					else
						Glow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow0:completeAnimation()
				self.Glow0:setLeftRight( 0.5, 0.5, -940, -804 )
				self.Glow0:setTopBottom( 1, 1, -63, -20 )
				Glow0Frame2( Glow0, {} )
				local Glow1Frame2 = function ( Glow1, event )
					local Glow1Frame3 = function ( Glow1, event )
						if not event.interrupted then
							Glow1:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						end
						Glow1:setLeftRight( 0.5, 0.5, -937, -787 )
						Glow1:setTopBottom( 1, 1, -97.5, 16.5 )
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
				self.Glow1:setLeftRight( 0.5, 0.5, -937, -787 )
				self.Glow1:setTopBottom( 1, 1, -97.5, 16.5 )
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
				self.resetProperties()
				self:setupElementClipCounter( 9 )
				XpBarFrame:completeAnimation()
				self.XpBarFrame:setAlpha( 0 )
				self.clipFinished( XpBarFrame, {} )
				XpBar:completeAnimation()
				self.XpBar:setAlpha( 0 )
				self.clipFinished( XpBar, {} )
				local RankIconAndNumberWidgetPreviousFrame2 = function ( RankIconAndNumberWidgetPrevious, event )
					if not event.interrupted then
						RankIconAndNumberWidgetPrevious:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
					end
					RankIconAndNumberWidgetPrevious:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( RankIconAndNumberWidgetPrevious, event )
					else
						RankIconAndNumberWidgetPrevious:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RankIconAndNumberWidgetPrevious:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
				RankIconAndNumberWidgetPrevious:setAlpha( 0 )
				RankIconAndNumberWidgetPrevious:registerEventHandler( "transition_complete_keyframe", RankIconAndNumberWidgetPreviousFrame2 )
				local XPEarnedDisplayFrame2 = function ( XPEarnedDisplay, event )
					if not event.interrupted then
						XPEarnedDisplay:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
					end
					XPEarnedDisplay:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( XPEarnedDisplay, event )
					else
						XPEarnedDisplay:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				XPEarnedDisplay:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
				XPEarnedDisplay:setAlpha( 0 )
				XPEarnedDisplay:registerEventHandler( "transition_complete_keyframe", XPEarnedDisplayFrame2 )
				NextLevelDisplay:completeAnimation()
				self.NextLevelDisplay:setAlpha( 0 )
				self.clipFinished( NextLevelDisplay, {} )
				RankIconAndNumberWidgetNextTop:completeAnimation()
				self.RankIconAndNumberWidgetNextTop:setAlpha( 0 )
				self.clipFinished( RankIconAndNumberWidgetNextTop, {} )
				Glow0:completeAnimation()
				self.Glow0:setLeftRight( 0.5, 0.5, -1030, -580 )
				self.Glow0:setTopBottom( 1, 1, -44, -7 )
				self.clipFinished( Glow0, {} )
				local Glow1Frame2 = function ( Glow1, event )
					local Glow1Frame3 = function ( Glow1, event )
						if not event.interrupted then
							Glow1:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
						end
						Glow1:setLeftRight( 0.5, 0.5, -937, -787 )
						Glow1:setTopBottom( 1, 1, -97.5, 16.5 )
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
				self.Glow1:setLeftRight( 0.5, 0.5, -937, -787 )
				self.Glow1:setTopBottom( 1, 1, -97.5, 16.5 )
				self.Glow1:setAlpha( 0.84 )
				Glow1Frame2( Glow1, {} )
				MeterGlow:completeAnimation()
				self.MeterGlow:setAlpha( 0 )
				self.clipFinished( MeterGlow, {} )
			end
		},
		Arabic = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				XPEarnedDisplay:completeAnimation()
				self.XPEarnedDisplay:setLeftRight( 0, 0, -100, 325 )
				self.XPEarnedDisplay:setTopBottom( 0, 0, 12, 51 )
				self.clipFinished( XPEarnedDisplay, {} )
				ProgressDescription:completeAnimation()
				ProgressDescription.FEButtonPanel0:completeAnimation()
				self.ProgressDescription:setLeftRight( 0, 0, -100, 325 )
				self.ProgressDescription:setTopBottom( 0, 0, -20, 19 )
				self.ProgressDescription:setAlpha( 1 )
				self.ProgressDescription.FEButtonPanel0:setAlpha( 0.2 )
				self.clipFinished( ProgressDescription, {} )
				NextLevelDisplay:completeAnimation()
				self.NextLevelDisplay:setLeftRight( 1, 1, -516, -63 )
				self.NextLevelDisplay:setTopBottom( 0, 0, 8, 47 )
				self.clipFinished( NextLevelDisplay, {} )
				MeterGlow:completeAnimation()
				self.MeterGlow:setAlpha( 0 )
				self.clipFinished( MeterGlow, {} )
			end,
			Update = function ()
				self.resetProperties()
				self:setupElementClipCounter( 17 )
				local XpBarFrameFrame2 = function ( XpBarFrame, event )
					local XpBarFrameFrame3 = function ( XpBarFrame, event )
						if not event.interrupted then
							XpBarFrame:beginAnimation( "keyframe", 2609, false, false, CoD.TweenType.Linear )
						end
						XpBarFrame:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( XpBarFrame, event )
						else
							XpBarFrame:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						XpBarFrameFrame3( XpBarFrame, event )
						return 
					else
						XpBarFrame:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						XpBarFrame:setAlpha( 0 )
						XpBarFrame:registerEventHandler( "transition_complete_keyframe", XpBarFrameFrame3 )
					end
				end
				
				XpBarFrame:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
				XpBarFrame:setAlpha( 1 )
				XpBarFrame:registerEventHandler( "transition_complete_keyframe", XpBarFrameFrame2 )
				local XpBarFrame2 = function ( XpBar, event )
					local XpBarFrame3 = function ( XpBar, event )
						if not event.interrupted then
							XpBar:beginAnimation( "keyframe", 2609, false, false, CoD.TweenType.Linear )
						end
						XpBar:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( XpBar, event )
						else
							XpBar:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						XpBarFrame3( XpBar, event )
						return 
					else
						XpBar:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						XpBar:setAlpha( 0 )
						XpBar:registerEventHandler( "transition_complete_keyframe", XpBarFrame3 )
					end
				end
				
				XpBar:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
				XpBar:setAlpha( 1 )
				XpBar:registerEventHandler( "transition_complete_keyframe", XpBarFrame2 )
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
				local XPEarnedDisplayFrame2 = function ( XPEarnedDisplay, event )
					local XPEarnedDisplayFrame3 = function ( XPEarnedDisplay, event )
						if not event.interrupted then
							XPEarnedDisplay:beginAnimation( "keyframe", 2389, false, false, CoD.TweenType.Linear )
						end
						XPEarnedDisplay:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( XPEarnedDisplay, event )
						else
							XPEarnedDisplay:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						XPEarnedDisplayFrame3( XPEarnedDisplay, event )
						return 
					else
						XPEarnedDisplay:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
						XPEarnedDisplay:setAlpha( 0 )
						XPEarnedDisplay:registerEventHandler( "transition_complete_keyframe", XPEarnedDisplayFrame3 )
					end
				end
				
				XPEarnedDisplay:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
				XPEarnedDisplay:setAlpha( 1 )
				XPEarnedDisplay:registerEventHandler( "transition_complete_keyframe", XPEarnedDisplayFrame2 )
				ProgressDescription:beginAnimation( "keyframe", 3369, false, false, CoD.TweenType.Linear )
				ProgressDescription:setAlpha( 0 )
				ProgressDescription:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				local NextLevelDisplayFrame2 = function ( NextLevelDisplay, event )
					local NextLevelDisplayFrame3 = function ( NextLevelDisplay, event )
						if not event.interrupted then
							NextLevelDisplay:beginAnimation( "keyframe", 2389, false, false, CoD.TweenType.Linear )
						end
						NextLevelDisplay:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( NextLevelDisplay, event )
						else
							NextLevelDisplay:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						NextLevelDisplayFrame3( NextLevelDisplay, event )
						return 
					else
						NextLevelDisplay:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
						NextLevelDisplay:setAlpha( 0 )
						NextLevelDisplay:registerEventHandler( "transition_complete_keyframe", NextLevelDisplayFrame3 )
					end
				end
				
				NextLevelDisplay:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
				NextLevelDisplay:setAlpha( 1 )
				NextLevelDisplay:registerEventHandler( "transition_complete_keyframe", NextLevelDisplayFrame2 )
				local BackGlowFrame2 = function ( BackGlow, event )
					local BackGlowFrame3 = function ( BackGlow, event )
						local BackGlowFrame4 = function ( BackGlow, event )
							if not event.interrupted then
								BackGlow:beginAnimation( "keyframe", 1589, false, false, CoD.TweenType.Linear )
							end
							BackGlow:setLeftRight( 0, 0, -66.5, 174.5 )
							BackGlow:setTopBottom( 0, 0, -47, 158 )
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
							BackGlow:setLeftRight( 0, 0, -66.5, 174.5 )
							BackGlow:registerEventHandler( "transition_complete_keyframe", BackGlowFrame4 )
						end
					end
					
					if event.interrupted then
						BackGlowFrame3( BackGlow, event )
						return 
					else
						BackGlow:beginAnimation( "keyframe", 1309, false, false, CoD.TweenType.Linear )
						BackGlow:registerEventHandler( "transition_complete_keyframe", BackGlowFrame3 )
					end
				end
				
				BackGlow:completeAnimation()
				self.BackGlow:setLeftRight( 0, 0, 1551, 1793 )
				self.BackGlow:setTopBottom( 0, 0, -47, 158 )
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
												Glow0:setLeftRight( 0.5, 0.5, 605, 1055 )
												Glow0:setTopBottom( 1, 1, -44, -7 )
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
											Glow0:setTopBottom( 1, 1, -44, -7 )
											Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame8 )
										end
									end
									
									if event.interrupted then
										Glow0Frame7( Glow0, event )
										return 
									else
										Glow0:beginAnimation( "keyframe", 479, false, false, CoD.TweenType.Bounce )
										Glow0:setTopBottom( 1, 1, -45.53, -7 )
										Glow0:setAlpha( 0 )
										Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame7 )
									end
								end
								
								if event.interrupted then
									Glow0Frame6( Glow0, event )
									return 
								else
									Glow0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									Glow0:setTopBottom( 1, 1, -53.66, -7 )
									Glow0:setAlpha( 0.51 )
									Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame6 )
								end
							end
							
							if event.interrupted then
								Glow0Frame5( Glow0, event )
								return 
							else
								Glow0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								Glow0:setTopBottom( 1, 1, -54, -7 )
								Glow0:setAlpha( 0.42 )
								Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame5 )
							end
						end
						
						if event.interrupted then
							Glow0Frame4( Glow0, event )
							return 
						else
							Glow0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							Glow0:setTopBottom( 1, 1, -63.5, -7.5 )
							Glow0:setAlpha( 0.37 )
							Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame4 )
						end
					end
					
					if event.interrupted then
						Glow0Frame3( Glow0, event )
						return 
					else
						Glow0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						Glow0:setTopBottom( 1, 1, -70, -7 )
						Glow0:setAlpha( 0.28 )
						Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame3 )
					end
				end
				
				Glow0:completeAnimation()
				self.Glow0:setLeftRight( 0.5, 0.5, 605, 1055 )
				self.Glow0:setTopBottom( 1, 1, -44, -7 )
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
										Glow1:setLeftRight( 0.5, 0.5, 733, 895 )
										Glow1:setTopBottom( 1, 1, -92.5, 33.5 )
										Glow1:setRGB( 0.59, 0.31, 0 )
										Glow1:setAlpha( 0 )
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
										Glow1:setLeftRight( 0.5, 0.5, 733, 895 )
										Glow1:setTopBottom( 1, 1, -92.5, 33.5 )
										Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame7 )
									end
								end
								
								if event.interrupted then
									Glow1Frame6( Glow1, event )
									return 
								else
									Glow1:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Bounce )
									Glow1:setLeftRight( 0.5, 0.5, 747.5, 892.1 )
									Glow1:setTopBottom( 1, 1, -96.37, 27.05 )
									Glow1:setAlpha( 0 )
									Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame6 )
								end
							end
							
							if event.interrupted then
								Glow1Frame5( Glow1, event )
								return 
							else
								Glow1:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
								Glow1:setLeftRight( 0.5, 0.5, 749.4, 891.72 )
								Glow1:setTopBottom( 1, 1, -96.87, 26.21 )
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
							Glow1:setLeftRight( 0.5, 0.5, 755.5, 890.5 )
							Glow1:setTopBottom( 1, 1, -98.5, 23.5 )
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
						Glow1:setLeftRight( 0.5, 0.5, 757.32, 892.32 )
						Glow1:setTopBottom( 1, 1, -79.41, 22.59 )
						Glow1:setRGB( 0.94, 0.69, 0 )
						Glow1:setAlpha( 1 )
						Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame3 )
					end
				end
				
				Glow1:completeAnimation()
				self.Glow1:setLeftRight( 0.5, 0.5, 757.5, 892.5 )
				self.Glow1:setTopBottom( 1, 1, -77.5, 22.5 )
				self.Glow1:setRGB( 0.95, 0.7, 0 )
				self.Glow1:setAlpha( 0 )
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
				local RankIconAndNumberBigFrame2 = function ( RankIconAndNumberBig, event )
					local RankIconAndNumberBigFrame3 = function ( RankIconAndNumberBig, event )
						local RankIconAndNumberBigFrame4 = function ( RankIconAndNumberBig, event )
							local RankIconAndNumberBigFrame5 = function ( RankIconAndNumberBig, event )
								local RankIconAndNumberBigFrame6 = function ( RankIconAndNumberBig, event )
									local RankIconAndNumberBigFrame7 = function ( RankIconAndNumberBig, event )
										local RankIconAndNumberBigFrame8 = function ( RankIconAndNumberBig, event )
											local RankIconAndNumberBigFrame9 = function ( RankIconAndNumberBig, event )
												local RankIconAndNumberBigFrame10 = function ( RankIconAndNumberBig, event )
													local RankIconAndNumberBigFrame11 = function ( RankIconAndNumberBig, event )
														if not event.interrupted then
															RankIconAndNumberBig:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
														end
														RankIconAndNumberBig:setLeftRight( 0, 0, -0.5, 368.5 )
														RankIconAndNumberBig:setTopBottom( 0, 0, 14, 74 )
														RankIconAndNumberBig:setAlpha( 0 )
														if event.interrupted then
															self.clipFinished( RankIconAndNumberBig, event )
														else
															RankIconAndNumberBig:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														RankIconAndNumberBigFrame11( RankIconAndNumberBig, event )
														return 
													else
														RankIconAndNumberBig:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
														RankIconAndNumberBig:setLeftRight( 0, 0, 197.65, 566.35 )
														RankIconAndNumberBig:setAlpha( 0 )
														RankIconAndNumberBig:registerEventHandler( "transition_complete_keyframe", RankIconAndNumberBigFrame11 )
													end
												end
												
												if event.interrupted then
													RankIconAndNumberBigFrame10( RankIconAndNumberBig, event )
													return 
												else
													RankIconAndNumberBig:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
													RankIconAndNumberBig:setLeftRight( 0, 0, 660, 1028 )
													RankIconAndNumberBig:setAlpha( 0.23 )
													RankIconAndNumberBig:registerEventHandler( "transition_complete_keyframe", RankIconAndNumberBigFrame10 )
												end
											end
											
											if event.interrupted then
												RankIconAndNumberBigFrame9( RankIconAndNumberBig, event )
												return 
											else
												RankIconAndNumberBig:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
												RankIconAndNumberBig:setLeftRight( 0, 0, 669.32, 1037.32 )
												RankIconAndNumberBig:registerEventHandler( "transition_complete_keyframe", RankIconAndNumberBigFrame9 )
											end
										end
										
										if event.interrupted then
											RankIconAndNumberBigFrame8( RankIconAndNumberBig, event )
											return 
										else
											RankIconAndNumberBig:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
											RankIconAndNumberBig:setLeftRight( 0, 0, 675, 1043 )
											RankIconAndNumberBig:registerEventHandler( "transition_complete_keyframe", RankIconAndNumberBigFrame8 )
										end
									end
									
									if event.interrupted then
										RankIconAndNumberBigFrame7( RankIconAndNumberBig, event )
										return 
									else
										RankIconAndNumberBig:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
										RankIconAndNumberBig:setLeftRight( 0, 0, 674.83, 1043.71 )
										RankIconAndNumberBig:registerEventHandler( "transition_complete_keyframe", RankIconAndNumberBigFrame7 )
									end
								end
								
								if event.interrupted then
									RankIconAndNumberBigFrame6( RankIconAndNumberBig, event )
									return 
								else
									RankIconAndNumberBig:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									RankIconAndNumberBig:setLeftRight( 0, 0, 670.5, 1061.5 )
									RankIconAndNumberBig:registerEventHandler( "transition_complete_keyframe", RankIconAndNumberBigFrame6 )
								end
							end
							
							if event.interrupted then
								RankIconAndNumberBigFrame5( RankIconAndNumberBig, event )
								return 
							else
								RankIconAndNumberBig:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								RankIconAndNumberBig:setLeftRight( 0, 0, 726, 1098 )
								RankIconAndNumberBig:setAlpha( 1 )
								RankIconAndNumberBig:registerEventHandler( "transition_complete_keyframe", RankIconAndNumberBigFrame5 )
							end
						end
						
						if event.interrupted then
							RankIconAndNumberBigFrame4( RankIconAndNumberBig, event )
							return 
						else
							RankIconAndNumberBig:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
							RankIconAndNumberBig:setLeftRight( 0, 0, 758, 1126 )
							RankIconAndNumberBig:setAlpha( 0.88 )
							RankIconAndNumberBig:registerEventHandler( "transition_complete_keyframe", RankIconAndNumberBigFrame4 )
						end
					end
					
					if event.interrupted then
						RankIconAndNumberBigFrame3( RankIconAndNumberBig, event )
						return 
					else
						RankIconAndNumberBig:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
						RankIconAndNumberBig:setLeftRight( 0, 0, 1071.92, 1439.92 )
						RankIconAndNumberBig:registerEventHandler( "transition_complete_keyframe", RankIconAndNumberBigFrame3 )
					end
				end
				
				RankIconAndNumberBig:beginAnimation( "keyframe", 639, false, false, CoD.TweenType.Linear )
				RankIconAndNumberBig:setLeftRight( 0, 0, 1341, 1709 )
				RankIconAndNumberBig:setTopBottom( 0, 0, 14, 74 )
				RankIconAndNumberBig:setAlpha( 0 )
				RankIconAndNumberBig:registerEventHandler( "transition_complete_keyframe", RankIconAndNumberBigFrame2 )
				local Glow10Frame2 = function ( Glow10, event )
					local Glow10Frame3 = function ( Glow10, event )
						local Glow10Frame4 = function ( Glow10, event )
							local Glow10Frame5 = function ( Glow10, event )
								local Glow10Frame6 = function ( Glow10, event )
									local Glow10Frame7 = function ( Glow10, event )
										local Glow10Frame8 = function ( Glow10, event )
											local Glow10Frame9 = function ( Glow10, event )
												local Glow10Frame10 = function ( Glow10, event )
													local Glow10Frame11 = function ( Glow10, event )
														local Glow10Frame12 = function ( Glow10, event )
															local Glow10Frame13 = function ( Glow10, event )
																local Glow10Frame14 = function ( Glow10, event )
																	local Glow10Frame15 = function ( Glow10, event )
																		local Glow10Frame16 = function ( Glow10, event )
																			local Glow10Frame17 = function ( Glow10, event )
																				local Glow10Frame18 = function ( Glow10, event )
																					local Glow10Frame19 = function ( Glow10, event )
																						local Glow10Frame20 = function ( Glow10, event )
																							local Glow10Frame21 = function ( Glow10, event )
																								local Glow10Frame22 = function ( Glow10, event )
																									local Glow10Frame23 = function ( Glow10, event )
																										local Glow10Frame24 = function ( Glow10, event )
																											local Glow10Frame25 = function ( Glow10, event )
																												local Glow10Frame26 = function ( Glow10, event )
																													local Glow10Frame27 = function ( Glow10, event )
																														local Glow10Frame28 = function ( Glow10, event )
																															local Glow10Frame29 = function ( Glow10, event )
																																local Glow10Frame30 = function ( Glow10, event )
																																	local Glow10Frame31 = function ( Glow10, event )
																																		local Glow10Frame32 = function ( Glow10, event )
																																			local Glow10Frame33 = function ( Glow10, event )
																																				local Glow10Frame34 = function ( Glow10, event )
																																					local Glow10Frame35 = function ( Glow10, event )
																																						local Glow10Frame36 = function ( Glow10, event )
																																							local Glow10Frame37 = function ( Glow10, event )
																																								local Glow10Frame38 = function ( Glow10, event )
																																									local Glow10Frame39 = function ( Glow10, event )
																																										local Glow10Frame40 = function ( Glow10, event )
																																											local Glow10Frame41 = function ( Glow10, event )
																																												local Glow10Frame42 = function ( Glow10, event )
																																													if not event.interrupted then
																																														Glow10:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Linear )
																																													end
																																													Glow10:setAlpha( 0 )
																																													if event.interrupted then
																																														self.clipFinished( Glow10, event )
																																													else
																																														Glow10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																																													end
																																												end
																																												
																																												if event.interrupted then
																																													Glow10Frame42( Glow10, event )
																																													return 
																																												else
																																													Glow10:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																																													Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame42 )
																																												end
																																											end
																																											
																																											if event.interrupted then
																																												Glow10Frame41( Glow10, event )
																																												return 
																																											else
																																												Glow10:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																												Glow10:setAlpha( 0 )
																																												Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame41 )
																																											end
																																										end
																																										
																																										if event.interrupted then
																																											Glow10Frame40( Glow10, event )
																																											return 
																																										else
																																											Glow10:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																											Glow10:setAlpha( 1 )
																																											Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame40 )
																																										end
																																									end
																																									
																																									if event.interrupted then
																																										Glow10Frame39( Glow10, event )
																																										return 
																																									else
																																										Glow10:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																																										Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame39 )
																																									end
																																								end
																																								
																																								if event.interrupted then
																																									Glow10Frame38( Glow10, event )
																																									return 
																																								else
																																									Glow10:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																																									Glow10:setAlpha( 0 )
																																									Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame38 )
																																								end
																																							end
																																							
																																							if event.interrupted then
																																								Glow10Frame37( Glow10, event )
																																								return 
																																							else
																																								Glow10:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
																																								Glow10:setAlpha( 1 )
																																								Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame37 )
																																							end
																																						end
																																						
																																						if event.interrupted then
																																							Glow10Frame36( Glow10, event )
																																							return 
																																						else
																																							Glow10:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																																							Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame36 )
																																						end
																																					end
																																					
																																					if event.interrupted then
																																						Glow10Frame35( Glow10, event )
																																						return 
																																					else
																																						Glow10:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																																						Glow10:setAlpha( 0 )
																																						Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame35 )
																																					end
																																				end
																																				
																																				if event.interrupted then
																																					Glow10Frame34( Glow10, event )
																																					return 
																																				else
																																					Glow10:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
																																					Glow10:setAlpha( 1 )
																																					Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame34 )
																																				end
																																			end
																																			
																																			if event.interrupted then
																																				Glow10Frame33( Glow10, event )
																																				return 
																																			else
																																				Glow10:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																																				Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame33 )
																																			end
																																		end
																																		
																																		if event.interrupted then
																																			Glow10Frame32( Glow10, event )
																																			return 
																																		else
																																			Glow10:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																																			Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame32 )
																																		end
																																	end
																																	
																																	if event.interrupted then
																																		Glow10Frame31( Glow10, event )
																																		return 
																																	else
																																		Glow10:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
																																		Glow10:setAlpha( 0 )
																																		Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame31 )
																																	end
																																end
																																
																																if event.interrupted then
																																	Glow10Frame30( Glow10, event )
																																	return 
																																else
																																	Glow10:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																																	Glow10:setAlpha( 0.85 )
																																	Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame30 )
																																end
																															end
																															
																															if event.interrupted then
																																Glow10Frame29( Glow10, event )
																																return 
																															else
																																Glow10:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
																																Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame29 )
																															end
																														end
																														
																														if event.interrupted then
																															Glow10Frame28( Glow10, event )
																															return 
																														else
																															Glow10:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																															Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame28 )
																														end
																													end
																													
																													if event.interrupted then
																														Glow10Frame27( Glow10, event )
																														return 
																													else
																														Glow10:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																														Glow10:setAlpha( 0 )
																														Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame27 )
																													end
																												end
																												
																												if event.interrupted then
																													Glow10Frame26( Glow10, event )
																													return 
																												else
																													Glow10:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																													Glow10:setAlpha( 1 )
																													Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame26 )
																												end
																											end
																											
																											if event.interrupted then
																												Glow10Frame25( Glow10, event )
																												return 
																											else
																												Glow10:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																												Glow10:setAlpha( 0 )
																												Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame25 )
																											end
																										end
																										
																										if event.interrupted then
																											Glow10Frame24( Glow10, event )
																											return 
																										else
																											Glow10:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
																											Glow10:setAlpha( 1 )
																											Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame24 )
																										end
																									end
																									
																									if event.interrupted then
																										Glow10Frame23( Glow10, event )
																										return 
																									else
																										Glow10:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																										Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame23 )
																									end
																								end
																								
																								if event.interrupted then
																									Glow10Frame22( Glow10, event )
																									return 
																								else
																									Glow10:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																									Glow10:setAlpha( 0 )
																									Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame22 )
																								end
																							end
																							
																							if event.interrupted then
																								Glow10Frame21( Glow10, event )
																								return 
																							else
																								Glow10:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																								Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame21 )
																							end
																						end
																						
																						if event.interrupted then
																							Glow10Frame20( Glow10, event )
																							return 
																						else
																							Glow10:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
																							Glow10:setAlpha( 1 )
																							Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame20 )
																						end
																					end
																					
																					if event.interrupted then
																						Glow10Frame19( Glow10, event )
																						return 
																					else
																						Glow10:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																						Glow10:setAlpha( 0 )
																						Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame19 )
																					end
																				end
																				
																				if event.interrupted then
																					Glow10Frame18( Glow10, event )
																					return 
																				else
																					Glow10:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
																					Glow10:setAlpha( 1 )
																					Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame18 )
																				end
																			end
																			
																			if event.interrupted then
																				Glow10Frame17( Glow10, event )
																				return 
																			else
																				Glow10:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																				Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame17 )
																			end
																		end
																		
																		if event.interrupted then
																			Glow10Frame16( Glow10, event )
																			return 
																		else
																			Glow10:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																			Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		Glow10Frame15( Glow10, event )
																		return 
																	else
																		Glow10:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																		Glow10:setAlpha( 0 )
																		Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame15 )
																	end
																end
																
																if event.interrupted then
																	Glow10Frame14( Glow10, event )
																	return 
																else
																	Glow10:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																	Glow10:setAlpha( 1 )
																	Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame14 )
																end
															end
															
															if event.interrupted then
																Glow10Frame13( Glow10, event )
																return 
															else
																Glow10:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
																Glow10:setAlpha( 0 )
																Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame13 )
															end
														end
														
														if event.interrupted then
															Glow10Frame12( Glow10, event )
															return 
														else
															Glow10:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
															Glow10:setAlpha( 1 )
															Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame12 )
														end
													end
													
													if event.interrupted then
														Glow10Frame11( Glow10, event )
														return 
													else
														Glow10:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
														Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame11 )
													end
												end
												
												if event.interrupted then
													Glow10Frame10( Glow10, event )
													return 
												else
													Glow10:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
													Glow10:setAlpha( 0 )
													Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame10 )
												end
											end
											
											if event.interrupted then
												Glow10Frame9( Glow10, event )
												return 
											else
												Glow10:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
												Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame9 )
											end
										end
										
										if event.interrupted then
											Glow10Frame8( Glow10, event )
											return 
										else
											Glow10:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											Glow10:setAlpha( 1 )
											Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame8 )
										end
									end
									
									if event.interrupted then
										Glow10Frame7( Glow10, event )
										return 
									else
										Glow10:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
										Glow10:setAlpha( 0 )
										Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame7 )
									end
								end
								
								if event.interrupted then
									Glow10Frame6( Glow10, event )
									return 
								else
									Glow10:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
									Glow10:setAlpha( 1 )
									Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame6 )
								end
							end
							
							if event.interrupted then
								Glow10Frame5( Glow10, event )
								return 
							else
								Glow10:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
								Glow10:setAlpha( 0 )
								Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame5 )
							end
						end
						
						if event.interrupted then
							Glow10Frame4( Glow10, event )
							return 
						else
							Glow10:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
							Glow10:setAlpha( 1 )
							Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame4 )
						end
					end
					
					if event.interrupted then
						Glow10Frame3( Glow10, event )
						return 
					else
						Glow10:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame3 )
					end
				end
				
				Glow10:beginAnimation( "keyframe", 670, false, false, CoD.TweenType.Linear )
				Glow10:setAlpha( 0 )
				Glow10:registerEventHandler( "transition_complete_keyframe", Glow10Frame2 )
				local Glow00Frame2 = function ( Glow00, event )
					local Glow00Frame3 = function ( Glow00, event )
						local Glow00Frame4 = function ( Glow00, event )
							local Glow00Frame5 = function ( Glow00, event )
								local Glow00Frame6 = function ( Glow00, event )
									local Glow00Frame7 = function ( Glow00, event )
										local Glow00Frame8 = function ( Glow00, event )
											local Glow00Frame9 = function ( Glow00, event )
												local Glow00Frame10 = function ( Glow00, event )
													local Glow00Frame11 = function ( Glow00, event )
														local Glow00Frame12 = function ( Glow00, event )
															local Glow00Frame13 = function ( Glow00, event )
																local Glow00Frame14 = function ( Glow00, event )
																	local Glow00Frame15 = function ( Glow00, event )
																		local Glow00Frame16 = function ( Glow00, event )
																			local Glow00Frame17 = function ( Glow00, event )
																				local Glow00Frame18 = function ( Glow00, event )
																					if not event.interrupted then
																						Glow00:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																					end
																					Glow00:setAlpha( 0 )
																					if event.interrupted then
																						self.clipFinished( Glow00, event )
																					else
																						Glow00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																					end
																				end
																				
																				if event.interrupted then
																					Glow00Frame18( Glow00, event )
																					return 
																				else
																					Glow00:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																					Glow00:setAlpha( 0 )
																					Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame18 )
																				end
																			end
																			
																			if event.interrupted then
																				Glow00Frame17( Glow00, event )
																				return 
																			else
																				Glow00:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
																				Glow00:setAlpha( 1 )
																				Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame17 )
																			end
																		end
																		
																		if event.interrupted then
																			Glow00Frame16( Glow00, event )
																			return 
																		else
																			Glow00:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
																			Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		Glow00Frame15( Glow00, event )
																		return 
																	else
																		Glow00:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																		Glow00:setAlpha( 0 )
																		Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame15 )
																	end
																end
																
																if event.interrupted then
																	Glow00Frame14( Glow00, event )
																	return 
																else
																	Glow00:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
																	Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame14 )
																end
															end
															
															if event.interrupted then
																Glow00Frame13( Glow00, event )
																return 
															else
																Glow00:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
																Glow00:setAlpha( 1 )
																Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame13 )
															end
														end
														
														if event.interrupted then
															Glow00Frame12( Glow00, event )
															return 
														else
															Glow00:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
															Glow00:setAlpha( 0 )
															Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame12 )
														end
													end
													
													if event.interrupted then
														Glow00Frame11( Glow00, event )
														return 
													else
														Glow00:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
														Glow00:setAlpha( 1 )
														Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame11 )
													end
												end
												
												if event.interrupted then
													Glow00Frame10( Glow00, event )
													return 
												else
													Glow00:beginAnimation( "keyframe", 419, false, false, CoD.TweenType.Linear )
													Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame10 )
												end
											end
											
											if event.interrupted then
												Glow00Frame9( Glow00, event )
												return 
											else
												Glow00:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
												Glow00:setAlpha( 0 )
												Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame9 )
											end
										end
										
										if event.interrupted then
											Glow00Frame8( Glow00, event )
											return 
										else
											Glow00:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
											Glow00:setAlpha( 1 )
											Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame8 )
										end
									end
									
									if event.interrupted then
										Glow00Frame7( Glow00, event )
										return 
									else
										Glow00:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
										Glow00:setAlpha( 0 )
										Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame7 )
									end
								end
								
								if event.interrupted then
									Glow00Frame6( Glow00, event )
									return 
								else
									Glow00:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
									Glow00:setAlpha( 1 )
									Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame6 )
								end
							end
							
							if event.interrupted then
								Glow00Frame5( Glow00, event )
								return 
							else
								Glow00:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
								Glow00:setAlpha( 0 )
								Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame5 )
							end
						end
						
						if event.interrupted then
							Glow00Frame4( Glow00, event )
							return 
						else
							Glow00:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
							Glow00:setAlpha( 1 )
							Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame4 )
						end
					end
					
					if event.interrupted then
						Glow00Frame3( Glow00, event )
						return 
					else
						Glow00:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
						Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame3 )
					end
				end
				
				Glow00:beginAnimation( "keyframe", 670, false, false, CoD.TweenType.Linear )
				Glow00:setAlpha( 0 )
				Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame2 )
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
				local promotionMusicFrame2 = function ( promotionMusic, event )
					if not event.interrupted then
						promotionMusic:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
					end
					promotionMusic:playSound( "rank_music", controller )
					if event.interrupted then
						self.clipFinished( promotionMusic, event )
					else
						promotionMusic:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				promotionMusic:beginAnimation( "keyframe", 839, false, false, CoD.TweenType.Linear )
				promotionMusic:playSound( "0", controller )
				promotionMusic:registerEventHandler( "transition_complete_keyframe", promotionMusicFrame2 )
			end,
			FlashNextLevel = function ()
				self.resetProperties()
				self:setupElementClipCounter( 10 )
				local XpBarFrameFrame2 = function ( XpBarFrame, event )
					if not event.interrupted then
						XpBarFrame:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
					end
					XpBarFrame:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( XpBarFrame, event )
					else
						XpBarFrame:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				XpBarFrame:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
				XpBarFrame:setAlpha( 0 )
				XpBarFrame:registerEventHandler( "transition_complete_keyframe", XpBarFrameFrame2 )
				local XpBarFrame2 = function ( XpBar, event )
					if not event.interrupted then
						XpBar:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
					end
					XpBar:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( XpBar, event )
					else
						XpBar:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				XpBar:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
				XpBar:setAlpha( 0 )
				XpBar:registerEventHandler( "transition_complete_keyframe", XpBarFrame2 )
				local RankIconAndNumberWidgetPreviousFrame2 = function ( RankIconAndNumberWidgetPrevious, event )
					if not event.interrupted then
						RankIconAndNumberWidgetPrevious:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
					end
					RankIconAndNumberWidgetPrevious:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( RankIconAndNumberWidgetPrevious, event )
					else
						RankIconAndNumberWidgetPrevious:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RankIconAndNumberWidgetPrevious:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
				RankIconAndNumberWidgetPrevious:setAlpha( 0 )
				RankIconAndNumberWidgetPrevious:registerEventHandler( "transition_complete_keyframe", RankIconAndNumberWidgetPreviousFrame2 )
				local XPEarnedDisplayFrame2 = function ( XPEarnedDisplay, event )
					if not event.interrupted then
						XPEarnedDisplay:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
					end
					XPEarnedDisplay:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( XPEarnedDisplay, event )
					else
						XPEarnedDisplay:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				XPEarnedDisplay:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
				XPEarnedDisplay:setAlpha( 0 )
				XPEarnedDisplay:registerEventHandler( "transition_complete_keyframe", XPEarnedDisplayFrame2 )
				local NextLevelDisplayFrame2 = function ( NextLevelDisplay, event )
					if not event.interrupted then
						NextLevelDisplay:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
					end
					NextLevelDisplay:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( NextLevelDisplay, event )
					else
						NextLevelDisplay:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				NextLevelDisplay:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
				NextLevelDisplay:setAlpha( 0 )
				NextLevelDisplay:registerEventHandler( "transition_complete_keyframe", NextLevelDisplayFrame2 )
				BackGlow:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
				BackGlow:setAlpha( 0 )
				BackGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				local RankIconAndNumberWidgetNextTopFrame2 = function ( RankIconAndNumberWidgetNextTop, event )
					if not event.interrupted then
						RankIconAndNumberWidgetNextTop:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
					end
					RankIconAndNumberWidgetNextTop:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( RankIconAndNumberWidgetNextTop, event )
					else
						RankIconAndNumberWidgetNextTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RankIconAndNumberWidgetNextTop:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
				RankIconAndNumberWidgetNextTop:setAlpha( 0 )
				RankIconAndNumberWidgetNextTop:registerEventHandler( "transition_complete_keyframe", RankIconAndNumberWidgetNextTopFrame2 )
				local Glow0Frame2 = function ( Glow0, event )
					if not event.interrupted then
						Glow0:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					Glow0:setLeftRight( 0.5, 0.5, -1009.5, -694.5 )
					Glow0:setTopBottom( 1, 1, -67, -16 )
					if event.interrupted then
						self.clipFinished( Glow0, event )
					else
						Glow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow0:completeAnimation()
				self.Glow0:setLeftRight( 0.5, 0.5, -940, -804 )
				self.Glow0:setTopBottom( 1, 1, -63, -20 )
				Glow0Frame2( Glow0, {} )
				local Glow1Frame2 = function ( Glow1, event )
					local Glow1Frame3 = function ( Glow1, event )
						if not event.interrupted then
							Glow1:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						end
						Glow1:setLeftRight( 0.5, 0.5, -937, -787 )
						Glow1:setTopBottom( 1, 1, -97.5, 16.5 )
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
				self.Glow1:setLeftRight( 0.5, 0.5, -937, -787 )
				self.Glow1:setTopBottom( 1, 1, -97.5, 16.5 )
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
				self.resetProperties()
				self:setupElementClipCounter( 9 )
				XpBarFrame:completeAnimation()
				self.XpBarFrame:setAlpha( 0 )
				self.clipFinished( XpBarFrame, {} )
				XpBar:completeAnimation()
				self.XpBar:setAlpha( 0 )
				self.clipFinished( XpBar, {} )
				local RankIconAndNumberWidgetPreviousFrame2 = function ( RankIconAndNumberWidgetPrevious, event )
					if not event.interrupted then
						RankIconAndNumberWidgetPrevious:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
					end
					RankIconAndNumberWidgetPrevious:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( RankIconAndNumberWidgetPrevious, event )
					else
						RankIconAndNumberWidgetPrevious:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RankIconAndNumberWidgetPrevious:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
				RankIconAndNumberWidgetPrevious:setAlpha( 0 )
				RankIconAndNumberWidgetPrevious:registerEventHandler( "transition_complete_keyframe", RankIconAndNumberWidgetPreviousFrame2 )
				local XPEarnedDisplayFrame2 = function ( XPEarnedDisplay, event )
					if not event.interrupted then
						XPEarnedDisplay:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
					end
					XPEarnedDisplay:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( XPEarnedDisplay, event )
					else
						XPEarnedDisplay:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				XPEarnedDisplay:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
				XPEarnedDisplay:setAlpha( 0 )
				XPEarnedDisplay:registerEventHandler( "transition_complete_keyframe", XPEarnedDisplayFrame2 )
				NextLevelDisplay:completeAnimation()
				self.NextLevelDisplay:setAlpha( 0 )
				self.clipFinished( NextLevelDisplay, {} )
				RankIconAndNumberWidgetNextTop:completeAnimation()
				self.RankIconAndNumberWidgetNextTop:setAlpha( 0 )
				self.clipFinished( RankIconAndNumberWidgetNextTop, {} )
				Glow0:completeAnimation()
				self.Glow0:setLeftRight( 0.5, 0.5, -1030, -580 )
				self.Glow0:setTopBottom( 1, 1, -44, -7 )
				self.clipFinished( Glow0, {} )
				local Glow1Frame2 = function ( Glow1, event )
					local Glow1Frame3 = function ( Glow1, event )
						if not event.interrupted then
							Glow1:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
						end
						Glow1:setLeftRight( 0.5, 0.5, -937, -787 )
						Glow1:setTopBottom( 1, 1, -97.5, 16.5 )
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
				self.Glow1:setLeftRight( 0.5, 0.5, -937, -787 )
				self.Glow1:setTopBottom( 1, 1, -97.5, 16.5 )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.XpBarFrame:close()
		self.XpBar:close()
		self.RankIconAndNumberWidgetNextBase:close()
		self.RankIconAndNumberWidgetPrevious:close()
		self.XPEarnedDisplay:close()
		self.ProgressDescription:close()
		self.NextLevelDisplay:close()
		self.RankIconAndNumberWidgetNextTop:close()
		self.RankIconAndNumberBig:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

