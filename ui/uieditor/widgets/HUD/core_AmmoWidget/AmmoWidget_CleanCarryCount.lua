-- 86dde35753faa55038c1bde043b38328
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_CleanCarryIcon" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_CleanCarryCountContainer" )

local PreLoadFunc = function ( self, controller )
	Engine.CreateModel( Engine.GetModelForController( controller ), "hudItems.cleanCarryCount" )
end

CoD.AmmoWidget_CleanCarryCount = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_CleanCarryCount.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_CleanCarryCount )
	self.id = "AmmoWidget_CleanCarryCount"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 76 )
	self:setTopBottom( true, false, 0, 97 )
	self.anyChildUsesUpdateState = true
	
	local PanelGlow = LUI.UIImage.new()
	PanelGlow:setLeftRight( true, false, -14.8, 92.8 )
	PanelGlow:setTopBottom( true, false, -12, 97 )
	PanelGlow:setRGB( ColorSet.EnemyOrange.r, ColorSet.EnemyOrange.g, ColorSet.EnemyOrange.b )
	PanelGlow:setAlpha( 0.41 )
	PanelGlow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	PanelGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( PanelGlow )
	self.PanelGlow = PanelGlow
	
	local AmmoWidgetCleanCarryIcon = CoD.AmmoWidget_CleanCarryIcon.new( menu, controller )
	AmmoWidgetCleanCarryIcon:setLeftRight( true, false, -3, 79 )
	AmmoWidgetCleanCarryIcon:setTopBottom( true, false, 7.38, 89.38 )
	self:addElement( AmmoWidgetCleanCarryIcon )
	self.AmmoWidgetCleanCarryIcon = AmmoWidgetCleanCarryIcon
	
	local AmmoWidgetCleanCarryCountContainer = CoD.AmmoWidget_CleanCarryCountContainer.new( menu, controller )
	AmmoWidgetCleanCarryCountContainer:setLeftRight( true, false, 24, 54 )
	AmmoWidgetCleanCarryCountContainer:setTopBottom( true, false, 34.38, 68.38 )
	AmmoWidgetCleanCarryCountContainer:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	AmmoWidgetCleanCarryCountContainer:setShaderVector( 0, 0.2, 0.5, 0, 0 )
	AmmoWidgetCleanCarryCountContainer:setShaderVector( 1, 1, 0, 0, 0 )
	AmmoWidgetCleanCarryCountContainer:setShaderVector( 2, 10, -5, 0, 0 )
	AmmoWidgetCleanCarryCountContainer:setShaderVector( 3, 4, 1, 0, 0 )
	AmmoWidgetCleanCarryCountContainer:setShaderVector( 4, 0, 0, 0, 0 )
	AmmoWidgetCleanCarryCountContainer.CarriedTagCount:setRGB( 0.39, 0.17, 0 )
	self:addElement( AmmoWidgetCleanCarryCountContainer )
	self.AmmoWidgetCleanCarryCountContainer = AmmoWidgetCleanCarryCountContainer
	
	local CarriedTagCount = LUI.UITightText.new()
	CarriedTagCount:setLeftRight( false, false, -15, 15 )
	CarriedTagCount:setTopBottom( true, false, 33.38, 67.38 )
	CarriedTagCount:setRGB( 0.27, 0.18, 0.18 )
	CarriedTagCount:setAlpha( 0.8 )
	CarriedTagCount:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	CarriedTagCount:setLetterSpacing( -4 )
	CarriedTagCount:subscribeToGlobalModel( controller, "HUDItems", "cleanCarryCount", function ( model )
		local cleanCarryCount = Engine.GetModelValue( model )
		if cleanCarryCount then
			CarriedTagCount:setText( Engine.Localize( cleanCarryCount ) )
		end
	end )
	self:addElement( CarriedTagCount )
	self.CarriedTagCount = CarriedTagCount
	
	local FullLabel = LUI.UITightText.new()
	FullLabel:setLeftRight( false, false, -38, 38 )
	FullLabel:setTopBottom( true, false, 41.38, 59.38 )
	FullLabel:setRGB( 0.27, 0.18, 0.18 )
	FullLabel:setAlpha( 0.8 )
	FullLabel:setText( LocalizeToUpperString( "MP_CLEAN_CARRY_FULL" ) )
	FullLabel:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	self:addElement( FullLabel )
	self.FullLabel = FullLabel
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				local PanelGlowFrame2 = function ( PanelGlow, event )
					local PanelGlowFrame3 = function ( PanelGlow, event )
						if not event.interrupted then
							PanelGlow:beginAnimation( "keyframe", 800, false, true, CoD.TweenType.Linear )
						end
						PanelGlow:setLeftRight( true, false, -15.8, 91.8 )
						PanelGlow:setTopBottom( true, false, -8.5, 100.5 )
						PanelGlow:setRGB( ColorSet.EnemyOrange.r, ColorSet.EnemyOrange.g, ColorSet.EnemyOrange.b )
						PanelGlow:setAlpha( 0.6 )
						if event.interrupted then
							self.clipFinished( PanelGlow, event )
						else
							PanelGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						PanelGlowFrame3( PanelGlow, event )
						return 
					else
						PanelGlow:beginAnimation( "keyframe", 839, false, true, CoD.TweenType.Linear )
						PanelGlow:setAlpha( 0.1 )
						PanelGlow:registerEventHandler( "transition_complete_keyframe", PanelGlowFrame3 )
					end
				end
				
				PanelGlow:completeAnimation()
				self.PanelGlow:setLeftRight( true, false, -15.8, 91.8 )
				self.PanelGlow:setTopBottom( true, false, -8.5, 100.5 )
				self.PanelGlow:setRGB( ColorSet.EnemyOrange.r, ColorSet.EnemyOrange.g, ColorSet.EnemyOrange.b )
				self.PanelGlow:setAlpha( 0.6 )
				PanelGlowFrame2( PanelGlow, {} )

				AmmoWidgetCleanCarryIcon:completeAnimation()
				self.AmmoWidgetCleanCarryIcon:setAlpha( 1 )
				self.clipFinished( AmmoWidgetCleanCarryIcon, {} )

				AmmoWidgetCleanCarryCountContainer:completeAnimation()
				self.AmmoWidgetCleanCarryCountContainer:setAlpha( 1 )
				self.clipFinished( AmmoWidgetCleanCarryCountContainer, {} )

				CarriedTagCount:completeAnimation()
				self.CarriedTagCount:setAlpha( 0.8 )
				self.clipFinished( CarriedTagCount, {} )

				FullLabel:completeAnimation()
				self.FullLabel:setAlpha( 0 )
				self.clipFinished( FullLabel, {} )

				self.nextClip = "DefaultClip"
			end,
			NoCount = function ()
				self:setupElementClipCounter( 5 )

				local PanelGlowFrame2 = function ( PanelGlow, event )
					if not event.interrupted then
						PanelGlow:beginAnimation( "keyframe", 170, false, true, CoD.TweenType.Bounce )
					end
					PanelGlow:setLeftRight( true, false, -15.8, 91.8 )
					PanelGlow:setTopBottom( true, false, -8.5, 100.5 )
					PanelGlow:setRGB( ColorSet.EnemyOrange.r, ColorSet.EnemyOrange.g, ColorSet.EnemyOrange.b )
					PanelGlow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PanelGlow, event )
					else
						PanelGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PanelGlow:completeAnimation()
				self.PanelGlow:setLeftRight( true, false, -15.8, 91.8 )
				self.PanelGlow:setTopBottom( true, false, -8.5, 100.5 )
				self.PanelGlow:setRGB( ColorSet.EnemyOrange.r, ColorSet.EnemyOrange.g, ColorSet.EnemyOrange.b )
				self.PanelGlow:setAlpha( 0.6 )
				PanelGlowFrame2( PanelGlow, {} )
				local AmmoWidgetCleanCarryIconFrame2 = function ( AmmoWidgetCleanCarryIcon, event )
					local AmmoWidgetCleanCarryIconFrame3 = function ( AmmoWidgetCleanCarryIcon, event )
						local AmmoWidgetCleanCarryIconFrame4 = function ( AmmoWidgetCleanCarryIcon, event )
							if not event.interrupted then
								AmmoWidgetCleanCarryIcon:beginAnimation( "keyframe", 70, false, true, CoD.TweenType.Bounce )
							end
							AmmoWidgetCleanCarryIcon:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( AmmoWidgetCleanCarryIcon, event )
							else
								AmmoWidgetCleanCarryIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							AmmoWidgetCleanCarryIconFrame4( AmmoWidgetCleanCarryIcon, event )
							return 
						else
							AmmoWidgetCleanCarryIcon:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							AmmoWidgetCleanCarryIcon:setAlpha( 0.8 )
							AmmoWidgetCleanCarryIcon:registerEventHandler( "transition_complete_keyframe", AmmoWidgetCleanCarryIconFrame4 )
						end
					end
					
					if event.interrupted then
						AmmoWidgetCleanCarryIconFrame3( AmmoWidgetCleanCarryIcon, event )
						return 
					else
						AmmoWidgetCleanCarryIcon:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						AmmoWidgetCleanCarryIcon:setAlpha( 0.2 )
						AmmoWidgetCleanCarryIcon:registerEventHandler( "transition_complete_keyframe", AmmoWidgetCleanCarryIconFrame3 )
					end
				end
				
				AmmoWidgetCleanCarryIcon:completeAnimation()
				self.AmmoWidgetCleanCarryIcon:setAlpha( 1 )
				AmmoWidgetCleanCarryIconFrame2( AmmoWidgetCleanCarryIcon, {} )
				local AmmoWidgetCleanCarryCountContainerFrame2 = function ( AmmoWidgetCleanCarryCountContainer, event )
					local AmmoWidgetCleanCarryCountContainerFrame3 = function ( AmmoWidgetCleanCarryCountContainer, event )
						local AmmoWidgetCleanCarryCountContainerFrame4 = function ( AmmoWidgetCleanCarryCountContainer, event )
							if not event.interrupted then
								AmmoWidgetCleanCarryCountContainer:beginAnimation( "keyframe", 70, false, true, CoD.TweenType.Bounce )
							end
							AmmoWidgetCleanCarryCountContainer:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( AmmoWidgetCleanCarryCountContainer, event )
							else
								AmmoWidgetCleanCarryCountContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							AmmoWidgetCleanCarryCountContainerFrame4( AmmoWidgetCleanCarryCountContainer, event )
							return 
						else
							AmmoWidgetCleanCarryCountContainer:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							AmmoWidgetCleanCarryCountContainer:setAlpha( 0.8 )
							AmmoWidgetCleanCarryCountContainer:registerEventHandler( "transition_complete_keyframe", AmmoWidgetCleanCarryCountContainerFrame4 )
						end
					end
					
					if event.interrupted then
						AmmoWidgetCleanCarryCountContainerFrame3( AmmoWidgetCleanCarryCountContainer, event )
						return 
					else
						AmmoWidgetCleanCarryCountContainer:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						AmmoWidgetCleanCarryCountContainer:setAlpha( 0.2 )
						AmmoWidgetCleanCarryCountContainer:registerEventHandler( "transition_complete_keyframe", AmmoWidgetCleanCarryCountContainerFrame3 )
					end
				end
				
				AmmoWidgetCleanCarryCountContainer:completeAnimation()
				self.AmmoWidgetCleanCarryCountContainer:setAlpha( 1 )
				AmmoWidgetCleanCarryCountContainerFrame2( AmmoWidgetCleanCarryCountContainer, {} )
				local CarriedTagCountFrame2 = function ( CarriedTagCount, event )
					local CarriedTagCountFrame3 = function ( CarriedTagCount, event )
						local CarriedTagCountFrame4 = function ( CarriedTagCount, event )
							if not event.interrupted then
								CarriedTagCount:beginAnimation( "keyframe", 70, false, true, CoD.TweenType.Bounce )
							end
							CarriedTagCount:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( CarriedTagCount, event )
							else
								CarriedTagCount:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							CarriedTagCountFrame4( CarriedTagCount, event )
							return 
						else
							CarriedTagCount:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							CarriedTagCount:setAlpha( 0.8 )
							CarriedTagCount:registerEventHandler( "transition_complete_keyframe", CarriedTagCountFrame4 )
						end
					end
					
					if event.interrupted then
						CarriedTagCountFrame3( CarriedTagCount, event )
						return 
					else
						CarriedTagCount:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						CarriedTagCount:setAlpha( 0.2 )
						CarriedTagCount:registerEventHandler( "transition_complete_keyframe", CarriedTagCountFrame3 )
					end
				end
				
				CarriedTagCount:completeAnimation()
				self.CarriedTagCount:setAlpha( 0.8 )
				CarriedTagCountFrame2( CarriedTagCount, {} )

				FullLabel:completeAnimation()
				self.FullLabel:setAlpha( 0 )
				self.clipFinished( FullLabel, {} )

				self.nextClip = "NoCount"
			end
		},
		Hide = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				PanelGlow:completeAnimation()
				self.PanelGlow:setAlpha( 0 )
				self.clipFinished( PanelGlow, {} )

				AmmoWidgetCleanCarryIcon:completeAnimation()
				self.AmmoWidgetCleanCarryIcon:setAlpha( 0 )
				self.clipFinished( AmmoWidgetCleanCarryIcon, {} )

				AmmoWidgetCleanCarryCountContainer:completeAnimation()
				self.AmmoWidgetCleanCarryCountContainer:setAlpha( 0 )
				self.clipFinished( AmmoWidgetCleanCarryCountContainer, {} )

				CarriedTagCount:completeAnimation()
				self.CarriedTagCount:setAlpha( 0 )
				self.clipFinished( CarriedTagCount, {} )

				FullLabel:completeAnimation()
				self.FullLabel:setAlpha( 0 )
				self.clipFinished( FullLabel, {} )
			end
		},
		NoCount = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				PanelGlow:completeAnimation()
				self.PanelGlow:setAlpha( 0 )
				self.clipFinished( PanelGlow, {} )

				AmmoWidgetCleanCarryIcon:completeAnimation()
				self.AmmoWidgetCleanCarryIcon:setAlpha( 0 )
				self.clipFinished( AmmoWidgetCleanCarryIcon, {} )

				AmmoWidgetCleanCarryCountContainer:completeAnimation()
				self.AmmoWidgetCleanCarryCountContainer:setAlpha( 0 )
				self.clipFinished( AmmoWidgetCleanCarryCountContainer, {} )

				CarriedTagCount:completeAnimation()
				self.CarriedTagCount:setAlpha( 0 )
				self.clipFinished( CarriedTagCount, {} )

				FullLabel:completeAnimation()
				self.FullLabel:setAlpha( 0 )
				self.clipFinished( FullLabel, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 5 )

				PanelGlow:completeAnimation()
				self.PanelGlow:setAlpha( 0 )
				self.clipFinished( PanelGlow, {} )
				local AmmoWidgetCleanCarryIconFrame2 = function ( AmmoWidgetCleanCarryIcon, event )
					local AmmoWidgetCleanCarryIconFrame3 = function ( AmmoWidgetCleanCarryIcon, event )
						local AmmoWidgetCleanCarryIconFrame4 = function ( AmmoWidgetCleanCarryIcon, event )
							if not event.interrupted then
								AmmoWidgetCleanCarryIcon:beginAnimation( "keyframe", 50, false, true, CoD.TweenType.Bounce )
							end
							AmmoWidgetCleanCarryIcon:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( AmmoWidgetCleanCarryIcon, event )
							else
								AmmoWidgetCleanCarryIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							AmmoWidgetCleanCarryIconFrame4( AmmoWidgetCleanCarryIcon, event )
							return 
						else
							AmmoWidgetCleanCarryIcon:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							AmmoWidgetCleanCarryIcon:setAlpha( 0.2 )
							AmmoWidgetCleanCarryIcon:registerEventHandler( "transition_complete_keyframe", AmmoWidgetCleanCarryIconFrame4 )
						end
					end
					
					if event.interrupted then
						AmmoWidgetCleanCarryIconFrame3( AmmoWidgetCleanCarryIcon, event )
						return 
					else
						AmmoWidgetCleanCarryIcon:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						AmmoWidgetCleanCarryIcon:setAlpha( 0.8 )
						AmmoWidgetCleanCarryIcon:registerEventHandler( "transition_complete_keyframe", AmmoWidgetCleanCarryIconFrame3 )
					end
				end
				
				AmmoWidgetCleanCarryIcon:completeAnimation()
				self.AmmoWidgetCleanCarryIcon:setAlpha( 0 )
				AmmoWidgetCleanCarryIconFrame2( AmmoWidgetCleanCarryIcon, {} )
				local AmmoWidgetCleanCarryCountContainerFrame2 = function ( AmmoWidgetCleanCarryCountContainer, event )
					local AmmoWidgetCleanCarryCountContainerFrame3 = function ( AmmoWidgetCleanCarryCountContainer, event )
						local AmmoWidgetCleanCarryCountContainerFrame4 = function ( AmmoWidgetCleanCarryCountContainer, event )
							if not event.interrupted then
								AmmoWidgetCleanCarryCountContainer:beginAnimation( "keyframe", 50, false, true, CoD.TweenType.Bounce )
							end
							AmmoWidgetCleanCarryCountContainer:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( AmmoWidgetCleanCarryCountContainer, event )
							else
								AmmoWidgetCleanCarryCountContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							AmmoWidgetCleanCarryCountContainerFrame4( AmmoWidgetCleanCarryCountContainer, event )
							return 
						else
							AmmoWidgetCleanCarryCountContainer:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							AmmoWidgetCleanCarryCountContainer:setAlpha( 0.2 )
							AmmoWidgetCleanCarryCountContainer:registerEventHandler( "transition_complete_keyframe", AmmoWidgetCleanCarryCountContainerFrame4 )
						end
					end
					
					if event.interrupted then
						AmmoWidgetCleanCarryCountContainerFrame3( AmmoWidgetCleanCarryCountContainer, event )
						return 
					else
						AmmoWidgetCleanCarryCountContainer:beginAnimation( "keyframe", 70, false, true, CoD.TweenType.Linear )
						AmmoWidgetCleanCarryCountContainer:setAlpha( 0.8 )
						AmmoWidgetCleanCarryCountContainer:registerEventHandler( "transition_complete_keyframe", AmmoWidgetCleanCarryCountContainerFrame3 )
					end
				end
				
				AmmoWidgetCleanCarryCountContainer:completeAnimation()
				self.AmmoWidgetCleanCarryCountContainer:setAlpha( 0 )
				AmmoWidgetCleanCarryCountContainerFrame2( AmmoWidgetCleanCarryCountContainer, {} )
				local CarriedTagCountFrame2 = function ( CarriedTagCount, event )
					local CarriedTagCountFrame3 = function ( CarriedTagCount, event )
						local CarriedTagCountFrame4 = function ( CarriedTagCount, event )
							if not event.interrupted then
								CarriedTagCount:beginAnimation( "keyframe", 50, false, true, CoD.TweenType.Bounce )
							end
							CarriedTagCount:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( CarriedTagCount, event )
							else
								CarriedTagCount:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							CarriedTagCountFrame4( CarriedTagCount, event )
							return 
						else
							CarriedTagCount:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							CarriedTagCount:setAlpha( 0.2 )
							CarriedTagCount:registerEventHandler( "transition_complete_keyframe", CarriedTagCountFrame4 )
						end
					end
					
					if event.interrupted then
						CarriedTagCountFrame3( CarriedTagCount, event )
						return 
					else
						CarriedTagCount:beginAnimation( "keyframe", 70, false, true, CoD.TweenType.Linear )
						CarriedTagCount:setAlpha( 0.8 )
						CarriedTagCount:registerEventHandler( "transition_complete_keyframe", CarriedTagCountFrame3 )
					end
				end
				
				CarriedTagCount:completeAnimation()
				self.CarriedTagCount:setAlpha( 0 )
				CarriedTagCountFrame2( CarriedTagCount, {} )

				FullLabel:completeAnimation()
				self.FullLabel:setAlpha( 0 )
				self.clipFinished( FullLabel, {} )
			end
		},
		Full = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				local PanelGlowFrame2 = function ( PanelGlow, event )
					local PanelGlowFrame3 = function ( PanelGlow, event )
						local PanelGlowFrame4 = function ( PanelGlow, event )
							local PanelGlowFrame5 = function ( PanelGlow, event )
								if not event.interrupted then
									PanelGlow:beginAnimation( "keyframe", 839, false, true, CoD.TweenType.Linear )
								end
								PanelGlow:setLeftRight( true, false, -15.8, 91.8 )
								PanelGlow:setTopBottom( true, false, -8.5, 100.5 )
								PanelGlow:setRGB( ColorSet.EnemyOrange.r, ColorSet.EnemyOrange.g, ColorSet.EnemyOrange.b )
								PanelGlow:setAlpha( 0.6 )
								if event.interrupted then
									self.clipFinished( PanelGlow, event )
								else
									PanelGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								PanelGlowFrame5( PanelGlow, event )
								return 
							else
								PanelGlow:beginAnimation( "keyframe", 800, false, true, CoD.TweenType.Linear )
								PanelGlow:setAlpha( 0.1 )
								PanelGlow:registerEventHandler( "transition_complete_keyframe", PanelGlowFrame5 )
							end
						end
						
						if event.interrupted then
							PanelGlowFrame4( PanelGlow, event )
							return 
						else
							PanelGlow:beginAnimation( "keyframe", 800, false, true, CoD.TweenType.Linear )
							PanelGlow:setAlpha( 0.6 )
							PanelGlow:registerEventHandler( "transition_complete_keyframe", PanelGlowFrame4 )
						end
					end
					
					if event.interrupted then
						PanelGlowFrame3( PanelGlow, event )
						return 
					else
						PanelGlow:beginAnimation( "keyframe", 839, false, true, CoD.TweenType.Linear )
						PanelGlow:setAlpha( 0.1 )
						PanelGlow:registerEventHandler( "transition_complete_keyframe", PanelGlowFrame3 )
					end
				end
				
				PanelGlow:completeAnimation()
				self.PanelGlow:setLeftRight( true, false, -15.8, 91.8 )
				self.PanelGlow:setTopBottom( true, false, -8.5, 100.5 )
				self.PanelGlow:setRGB( ColorSet.EnemyOrange.r, ColorSet.EnemyOrange.g, ColorSet.EnemyOrange.b )
				self.PanelGlow:setAlpha( 0.6 )
				PanelGlowFrame2( PanelGlow, {} )

				AmmoWidgetCleanCarryIcon:completeAnimation()
				self.AmmoWidgetCleanCarryIcon:setAlpha( 1 )
				self.clipFinished( AmmoWidgetCleanCarryIcon, {} )
				local AmmoWidgetCleanCarryCountContainerFrame2 = function ( AmmoWidgetCleanCarryCountContainer, event )
					local AmmoWidgetCleanCarryCountContainerFrame3 = function ( AmmoWidgetCleanCarryCountContainer, event )
						local AmmoWidgetCleanCarryCountContainerFrame4 = function ( AmmoWidgetCleanCarryCountContainer, event )
							local AmmoWidgetCleanCarryCountContainerFrame5 = function ( AmmoWidgetCleanCarryCountContainer, event )
								if not event.interrupted then
									AmmoWidgetCleanCarryCountContainer:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
								end
								AmmoWidgetCleanCarryCountContainer:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( AmmoWidgetCleanCarryCountContainer, event )
								else
									AmmoWidgetCleanCarryCountContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								AmmoWidgetCleanCarryCountContainerFrame5( AmmoWidgetCleanCarryCountContainer, event )
								return 
							else
								AmmoWidgetCleanCarryCountContainer:beginAnimation( "keyframe", 1439, false, false, CoD.TweenType.Linear )
								AmmoWidgetCleanCarryCountContainer:registerEventHandler( "transition_complete_keyframe", AmmoWidgetCleanCarryCountContainerFrame5 )
							end
						end
						
						if event.interrupted then
							AmmoWidgetCleanCarryCountContainerFrame4( AmmoWidgetCleanCarryCountContainer, event )
							return 
						else
							AmmoWidgetCleanCarryCountContainer:beginAnimation( "keyframe", 199, false, true, CoD.TweenType.Linear )
							AmmoWidgetCleanCarryCountContainer:setAlpha( 0 )
							AmmoWidgetCleanCarryCountContainer:registerEventHandler( "transition_complete_keyframe", AmmoWidgetCleanCarryCountContainerFrame4 )
						end
					end
					
					if event.interrupted then
						AmmoWidgetCleanCarryCountContainerFrame3( AmmoWidgetCleanCarryCountContainer, event )
						return 
					else
						AmmoWidgetCleanCarryCountContainer:beginAnimation( "keyframe", 1440, false, false, CoD.TweenType.Linear )
						AmmoWidgetCleanCarryCountContainer:registerEventHandler( "transition_complete_keyframe", AmmoWidgetCleanCarryCountContainerFrame3 )
					end
				end
				
				AmmoWidgetCleanCarryCountContainer:completeAnimation()
				self.AmmoWidgetCleanCarryCountContainer:setAlpha( 1 )
				AmmoWidgetCleanCarryCountContainerFrame2( AmmoWidgetCleanCarryCountContainer, {} )
				local CarriedTagCountFrame2 = function ( CarriedTagCount, event )
					local CarriedTagCountFrame3 = function ( CarriedTagCount, event )
						local CarriedTagCountFrame4 = function ( CarriedTagCount, event )
							local CarriedTagCountFrame5 = function ( CarriedTagCount, event )
								if not event.interrupted then
									CarriedTagCount:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
								end
								CarriedTagCount:setAlpha( 0.8 )
								if event.interrupted then
									self.clipFinished( CarriedTagCount, event )
								else
									CarriedTagCount:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								CarriedTagCountFrame5( CarriedTagCount, event )
								return 
							else
								CarriedTagCount:beginAnimation( "keyframe", 1439, false, false, CoD.TweenType.Linear )
								CarriedTagCount:registerEventHandler( "transition_complete_keyframe", CarriedTagCountFrame5 )
							end
						end
						
						if event.interrupted then
							CarriedTagCountFrame4( CarriedTagCount, event )
							return 
						else
							CarriedTagCount:beginAnimation( "keyframe", 199, false, true, CoD.TweenType.Linear )
							CarriedTagCount:setAlpha( 0 )
							CarriedTagCount:registerEventHandler( "transition_complete_keyframe", CarriedTagCountFrame4 )
						end
					end
					
					if event.interrupted then
						CarriedTagCountFrame3( CarriedTagCount, event )
						return 
					else
						CarriedTagCount:beginAnimation( "keyframe", 1440, false, false, CoD.TweenType.Linear )
						CarriedTagCount:registerEventHandler( "transition_complete_keyframe", CarriedTagCountFrame3 )
					end
				end
				
				CarriedTagCount:completeAnimation()
				self.CarriedTagCount:setAlpha( 0.8 )
				CarriedTagCountFrame2( CarriedTagCount, {} )
				local FullLabelFrame2 = function ( FullLabel, event )
					local FullLabelFrame3 = function ( FullLabel, event )
						local FullLabelFrame4 = function ( FullLabel, event )
							local FullLabelFrame5 = function ( FullLabel, event )
								if not event.interrupted then
									FullLabel:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
								end
								FullLabel:setRGB( 0.27, 0.18, 0.18 )
								FullLabel:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( FullLabel, event )
								else
									FullLabel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								FullLabelFrame5( FullLabel, event )
								return 
							else
								FullLabel:beginAnimation( "keyframe", 1439, false, false, CoD.TweenType.Linear )
								FullLabel:registerEventHandler( "transition_complete_keyframe", FullLabelFrame5 )
							end
						end
						
						if event.interrupted then
							FullLabelFrame4( FullLabel, event )
							return 
						else
							FullLabel:beginAnimation( "keyframe", 199, false, true, CoD.TweenType.Linear )
							FullLabel:setAlpha( 0.8 )
							FullLabel:registerEventHandler( "transition_complete_keyframe", FullLabelFrame4 )
						end
					end
					
					if event.interrupted then
						FullLabelFrame3( FullLabel, event )
						return 
					else
						FullLabel:beginAnimation( "keyframe", 1440, false, false, CoD.TweenType.Linear )
						FullLabel:registerEventHandler( "transition_complete_keyframe", FullLabelFrame3 )
					end
				end
				
				FullLabel:completeAnimation()
				self.FullLabel:setRGB( 0.27, 0.18, 0.18 )
				self.FullLabel:setAlpha( 0 )
				FullLabelFrame2( FullLabel, {} )

				self.nextClip = "DefaultClip"
			end,
			NoCount = function ()
				self:setupElementClipCounter( 5 )

				local PanelGlowFrame2 = function ( PanelGlow, event )
					if not event.interrupted then
						PanelGlow:beginAnimation( "keyframe", 170, false, true, CoD.TweenType.Bounce )
					end
					PanelGlow:setLeftRight( true, false, -15.8, 91.8 )
					PanelGlow:setTopBottom( true, false, -8.5, 100.5 )
					PanelGlow:setRGB( ColorSet.EnemyOrange.r, ColorSet.EnemyOrange.g, ColorSet.EnemyOrange.b )
					PanelGlow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PanelGlow, event )
					else
						PanelGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PanelGlow:completeAnimation()
				self.PanelGlow:setLeftRight( true, false, -15.8, 91.8 )
				self.PanelGlow:setTopBottom( true, false, -8.5, 100.5 )
				self.PanelGlow:setRGB( ColorSet.EnemyOrange.r, ColorSet.EnemyOrange.g, ColorSet.EnemyOrange.b )
				self.PanelGlow:setAlpha( 0.6 )
				PanelGlowFrame2( PanelGlow, {} )
				local AmmoWidgetCleanCarryIconFrame2 = function ( AmmoWidgetCleanCarryIcon, event )
					local AmmoWidgetCleanCarryIconFrame3 = function ( AmmoWidgetCleanCarryIcon, event )
						local AmmoWidgetCleanCarryIconFrame4 = function ( AmmoWidgetCleanCarryIcon, event )
							if not event.interrupted then
								AmmoWidgetCleanCarryIcon:beginAnimation( "keyframe", 70, false, true, CoD.TweenType.Bounce )
							end
							AmmoWidgetCleanCarryIcon:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( AmmoWidgetCleanCarryIcon, event )
							else
								AmmoWidgetCleanCarryIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							AmmoWidgetCleanCarryIconFrame4( AmmoWidgetCleanCarryIcon, event )
							return 
						else
							AmmoWidgetCleanCarryIcon:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							AmmoWidgetCleanCarryIcon:setAlpha( 0.8 )
							AmmoWidgetCleanCarryIcon:registerEventHandler( "transition_complete_keyframe", AmmoWidgetCleanCarryIconFrame4 )
						end
					end
					
					if event.interrupted then
						AmmoWidgetCleanCarryIconFrame3( AmmoWidgetCleanCarryIcon, event )
						return 
					else
						AmmoWidgetCleanCarryIcon:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						AmmoWidgetCleanCarryIcon:setAlpha( 0.2 )
						AmmoWidgetCleanCarryIcon:registerEventHandler( "transition_complete_keyframe", AmmoWidgetCleanCarryIconFrame3 )
					end
				end
				
				AmmoWidgetCleanCarryIcon:completeAnimation()
				self.AmmoWidgetCleanCarryIcon:setAlpha( 1 )
				AmmoWidgetCleanCarryIconFrame2( AmmoWidgetCleanCarryIcon, {} )
				local AmmoWidgetCleanCarryCountContainerFrame2 = function ( AmmoWidgetCleanCarryCountContainer, event )
					local AmmoWidgetCleanCarryCountContainerFrame3 = function ( AmmoWidgetCleanCarryCountContainer, event )
						local AmmoWidgetCleanCarryCountContainerFrame4 = function ( AmmoWidgetCleanCarryCountContainer, event )
							if not event.interrupted then
								AmmoWidgetCleanCarryCountContainer:beginAnimation( "keyframe", 70, false, true, CoD.TweenType.Bounce )
							end
							AmmoWidgetCleanCarryCountContainer:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( AmmoWidgetCleanCarryCountContainer, event )
							else
								AmmoWidgetCleanCarryCountContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							AmmoWidgetCleanCarryCountContainerFrame4( AmmoWidgetCleanCarryCountContainer, event )
							return 
						else
							AmmoWidgetCleanCarryCountContainer:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							AmmoWidgetCleanCarryCountContainer:setAlpha( 0.8 )
							AmmoWidgetCleanCarryCountContainer:registerEventHandler( "transition_complete_keyframe", AmmoWidgetCleanCarryCountContainerFrame4 )
						end
					end
					
					if event.interrupted then
						AmmoWidgetCleanCarryCountContainerFrame3( AmmoWidgetCleanCarryCountContainer, event )
						return 
					else
						AmmoWidgetCleanCarryCountContainer:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						AmmoWidgetCleanCarryCountContainer:setAlpha( 0.2 )
						AmmoWidgetCleanCarryCountContainer:registerEventHandler( "transition_complete_keyframe", AmmoWidgetCleanCarryCountContainerFrame3 )
					end
				end
				
				AmmoWidgetCleanCarryCountContainer:completeAnimation()
				self.AmmoWidgetCleanCarryCountContainer:setAlpha( 1 )
				AmmoWidgetCleanCarryCountContainerFrame2( AmmoWidgetCleanCarryCountContainer, {} )
				local CarriedTagCountFrame2 = function ( CarriedTagCount, event )
					local CarriedTagCountFrame3 = function ( CarriedTagCount, event )
						local CarriedTagCountFrame4 = function ( CarriedTagCount, event )
							if not event.interrupted then
								CarriedTagCount:beginAnimation( "keyframe", 70, false, true, CoD.TweenType.Bounce )
							end
							CarriedTagCount:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( CarriedTagCount, event )
							else
								CarriedTagCount:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							CarriedTagCountFrame4( CarriedTagCount, event )
							return 
						else
							CarriedTagCount:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							CarriedTagCount:setAlpha( 0.8 )
							CarriedTagCount:registerEventHandler( "transition_complete_keyframe", CarriedTagCountFrame4 )
						end
					end
					
					if event.interrupted then
						CarriedTagCountFrame3( CarriedTagCount, event )
						return 
					else
						CarriedTagCount:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						CarriedTagCount:setAlpha( 0.2 )
						CarriedTagCount:registerEventHandler( "transition_complete_keyframe", CarriedTagCountFrame3 )
					end
				end
				
				CarriedTagCount:completeAnimation()
				self.CarriedTagCount:setAlpha( 0.8 )
				CarriedTagCountFrame2( CarriedTagCount, {} )

				FullLabel:completeAnimation()
				self.FullLabel:setAlpha( 0 )
				self.clipFinished( FullLabel, {} )

				self.nextClip = "NoCount"
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Hide",
			condition = function ( menu, element, event )
				return not IsGameTypeEqualToString( "clean" )
			end
		},
		{
			stateName = "NoCount",
			condition = function ( menu, element, event )
				return IsGameTypeEqualToString( "clean" ) and IsModelValueEqualTo( controller, "hudItems.cleanCarryCount", 0 )
			end
		},
		{
			stateName = "Full",
			condition = function ( menu, element, event )
				return IsFractureCountMax( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.cleanCarryCount" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.cleanCarryCount"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.AmmoWidgetCleanCarryIcon:close()
		element.AmmoWidgetCleanCarryCountContainer:close()
		element.CarriedTagCount:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

