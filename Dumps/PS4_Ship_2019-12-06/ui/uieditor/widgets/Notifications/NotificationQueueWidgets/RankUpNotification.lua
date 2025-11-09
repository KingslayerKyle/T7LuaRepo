require( "ui.uieditor.widgets.Notifications.RankUp.RankUpNotification_WingContainer" )
require( "ui.uieditor.widgets.Notifications.RankUp.RankUpNotification_Title" )
require( "ui.uieditor.widgets.Notifications.RankUp.RankUpNotification_FooterLabel02" )
require( "ui.uieditor.widgets.Notifications.RankUp.RankUpNotification_FooterLabel01" )

CoD.RankUpNotification = InheritFrom( LUI.UIElement )
CoD.RankUpNotification.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.RankUpNotification )
	self.id = "RankUpNotification"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 348 )
	self:setTopBottom( true, false, 0, 250 )
	self.anyChildUsesUpdateState = true
	
	local levelUpSound = LUI.UIElement.new()
	levelUpSound:setLeftRight( true, false, -48, 0 )
	levelUpSound:setTopBottom( true, false, 0, 48 )
	self:addElement( levelUpSound )
	self.levelUpSound = levelUpSound
	
	local frame = LUI.UIImage.new()
	frame:setLeftRight( false, false, -116, 116 )
	frame:setTopBottom( true, false, -16, 144 )
	frame:setRGB( 0, 0, 0 )
	frame:setScale( 0.8 )
	frame:setImage( RegisterImage( "uie_t7_hud_playerlevel_backing_frame" ) )
	self:addElement( frame )
	self.frame = frame
	
	local fill = LUI.UIImage.new()
	fill:setLeftRight( false, false, -104, 104 )
	fill:setTopBottom( true, false, -16, 144 )
	fill:setRGB( 0, 0, 0 )
	fill:setScale( 0.8 )
	fill:setImage( RegisterImage( "uie_t7_hud_playerlevel_backing_fill" ) )
	self:addElement( fill )
	self.fill = fill
	
	local main = LUI.UIImage.new()
	main:setLeftRight( false, false, -64, 64 )
	main:setTopBottom( true, false, 7, 127 )
	main:setRGB( 0, 0, 0 )
	main:setScale( 0.8 )
	main:setImage( RegisterImage( "uie_t7_hud_playerlevel_backing_main" ) )
	self:addElement( main )
	self.main = main
	
	local RankUpNotificationWingContainer = CoD.RankUpNotification_WingContainer.new( menu, controller )
	RankUpNotificationWingContainer:setLeftRight( true, false, 84, 264 )
	RankUpNotificationWingContainer:setTopBottom( true, false, 20, 54.67 )
	RankUpNotificationWingContainer:setScale( 0.8 )
	self:addElement( RankUpNotificationWingContainer )
	self.RankUpNotificationWingContainer = RankUpNotificationWingContainer
	
	local RankUpNotificationTitle = CoD.RankUpNotification_Title.new( menu, controller )
	RankUpNotificationTitle:setLeftRight( false, false, -133, 133 )
	RankUpNotificationTitle:setTopBottom( true, false, 123, 183 )
	self:addElement( RankUpNotificationTitle )
	self.RankUpNotificationTitle = RankUpNotificationTitle
	
	local RankB = LUI.UIImage.new()
	RankB:setLeftRight( false, false, -52, 52 )
	RankB:setTopBottom( true, false, 16, 120 )
	RankB:setRGB( 0, 0.2, 1 )
	RankB:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
	RankB:setShaderVector( 0, 2, 0, 0, 0 )
	RankB:setShaderVector( 1, 1, 0, 0, 0 )
	RankB:setShaderVector( 2, 0.02, 0, 0, 0 )
	self:addElement( RankB )
	self.RankB = RankB
	
	local RankG = LUI.UIImage.new()
	RankG:setLeftRight( false, false, -52, 52 )
	RankG:setTopBottom( true, false, 16, 120 )
	RankG:setRGB( 0, 0.27, 0.01 )
	RankG:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
	RankG:setShaderVector( 0, 2, 0, 0, 0 )
	RankG:setShaderVector( 1, 1, 0, 0, 0 )
	RankG:setShaderVector( 2, 0.02, 0, 0, 0 )
	self:addElement( RankG )
	self.RankG = RankG
	
	local RankR = LUI.UIImage.new()
	RankR:setLeftRight( false, false, -52, 52 )
	RankR:setTopBottom( true, false, 16, 120 )
	RankR:setRGB( 0.55, 0.09, 0.09 )
	RankR:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
	RankR:setShaderVector( 0, 2, 0, 0, 0 )
	RankR:setShaderVector( 1, 1, 0, 0, 0 )
	RankR:setShaderVector( 2, 0.02, 0, 0, 0 )
	self:addElement( RankR )
	self.RankR = RankR
	
	local highlight = LUI.UIImage.new()
	highlight:setLeftRight( true, false, 115, 233 )
	highlight:setTopBottom( true, false, 12, 130 )
	highlight:setImage( RegisterImage( "uie_t7_hud_notficationhighlight" ) )
	highlight:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( highlight )
	self.highlight = highlight
	
	local Rank = LUI.UIImage.new()
	Rank:setLeftRight( false, false, -52, 52 )
	Rank:setTopBottom( true, false, 16, 120 )
	self:addElement( Rank )
	self.Rank = Rank
	
	local RankUpNotificationFooterLabel020 = CoD.RankUpNotification_FooterLabel02.new( menu, controller )
	RankUpNotificationFooterLabel020:setLeftRight( false, false, -137, 137 )
	RankUpNotificationFooterLabel020:setTopBottom( true, false, 168, 200 )
	self:addElement( RankUpNotificationFooterLabel020 )
	self.RankUpNotificationFooterLabel020 = RankUpNotificationFooterLabel020
	
	local RankUpNotificationFooterLabel010 = CoD.RankUpNotification_FooterLabel01.new( menu, controller )
	RankUpNotificationFooterLabel010:setLeftRight( false, false, -71, 71 )
	RankUpNotificationFooterLabel010:setTopBottom( true, false, 168, 200 )
	self:addElement( RankUpNotificationFooterLabel010 )
	self.RankUpNotificationFooterLabel010 = RankUpNotificationFooterLabel010
	
	self.RankUpNotificationTitle:linkToElementModel( self, "title", true, function ( model )
		local title = Engine.GetModelValue( model )
		if title then
			RankUpNotificationTitle.Text:setText( Engine.Localize( title ) )
		end
	end )
	self.RankB:linkToElementModel( self, "icon", true, function ( model )
		local icon = Engine.GetModelValue( model )
		if icon then
			RankB:setImage( RegisterImage( icon ) )
		end
	end )
	self.RankG:linkToElementModel( self, "icon", true, function ( model )
		local icon = Engine.GetModelValue( model )
		if icon then
			RankG:setImage( RegisterImage( icon ) )
		end
	end )
	self.RankR:linkToElementModel( self, "icon", true, function ( model )
		local icon = Engine.GetModelValue( model )
		if icon then
			RankR:setImage( RegisterImage( icon ) )
		end
	end )
	self.highlight:linkToElementModel( self, "color", true, function ( model )
		local color = Engine.GetModelValue( model )
		if color then
			highlight:setRGB( color )
		end
	end )
	self.Rank:linkToElementModel( self, "icon", true, function ( model )
		local icon = Engine.GetModelValue( model )
		if icon then
			Rank:setImage( RegisterImage( icon ) )
		end
	end )
	self.RankUpNotificationFooterLabel020:linkToElementModel( self, "subtitle", true, function ( model )
		local subtitle = Engine.GetModelValue( model )
		if subtitle then
			RankUpNotificationFooterLabel020.SubText:setText( Engine.Localize( subtitle ) )
		end
	end )
	self.RankUpNotificationFooterLabel010:linkToElementModel( self, "color", true, function ( model )
		local color = Engine.GetModelValue( model )
		if color then
			RankUpNotificationFooterLabel010.RankUpNotificationFooterBacking010:setRGB( color )
		end
	end )
	self.RankUpNotificationFooterLabel010:linkToElementModel( self, "subtitle", true, function ( model )
		local subtitle = Engine.GetModelValue( model )
		if subtitle then
			RankUpNotificationFooterLabel010.SubText:setText( Engine.Localize( subtitle ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				levelUpSound:completeAnimation()
				self.levelUpSound:playSound( "rank_up", controller )
				self.clipFinished( levelUpSound, {} )
				local frameFrame2 = function ( frame, event )
					local frameFrame3 = function ( frame, event )
						if not event.interrupted then
							frame:beginAnimation( "keyframe", 199, false, true, CoD.TweenType.Linear )
						end
						frame:setAlpha( 1 )
						frame:setScale( 0.8 )
						if event.interrupted then
							self.clipFinished( frame, event )
						else
							frame:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						frameFrame3( frame, event )
						return 
					else
						frame:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						frame:registerEventHandler( "transition_complete_keyframe", frameFrame3 )
					end
				end
				
				frame:completeAnimation()
				self.frame:setAlpha( 0 )
				self.frame:setScale( 3 )
				frameFrame2( frame, {} )
				local fillFrame2 = function ( fill, event )
					if not event.interrupted then
						fill:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					fill:setAlpha( 1 )
					fill:setScale( 0.8 )
					if event.interrupted then
						self.clipFinished( fill, event )
					else
						fill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				fill:completeAnimation()
				self.fill:setAlpha( 0 )
				self.fill:setScale( 3 )
				fillFrame2( fill, {} )
				local mainFrame2 = function ( main, event )
					local mainFrame3 = function ( main, event )
						local mainFrame4 = function ( main, event )
							if not event.interrupted then
								main:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
							end
							main:setAlpha( 1 )
							main:setScale( 0.8 )
							main:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
							if event.interrupted then
								self.clipFinished( main, event )
							else
								main:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							mainFrame4( main, event )
							return 
						else
							main:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
							main:setAlpha( 1 )
							main:setScale( 0.8 )
							main:registerEventHandler( "transition_complete_keyframe", mainFrame4 )
						end
					end
					
					if event.interrupted then
						mainFrame3( main, event )
						return 
					else
						main:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
						main:registerEventHandler( "transition_complete_keyframe", mainFrame3 )
					end
				end
				
				main:completeAnimation()
				self.main:setAlpha( 0 )
				self.main:setScale( 3 )
				self.main:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				mainFrame2( main, {} )
				local RankUpNotificationWingContainerFrame2 = function ( RankUpNotificationWingContainer, event )
					local RankUpNotificationWingContainerFrame3 = function ( RankUpNotificationWingContainer, event )
						local RankUpNotificationWingContainerFrame4 = function ( RankUpNotificationWingContainer, event )
							if not event.interrupted then
								RankUpNotificationWingContainer:beginAnimation( "keyframe", 90, false, true, CoD.TweenType.Linear )
							end
							RankUpNotificationWingContainer:setAlpha( 1 )
							RankUpNotificationWingContainer:setScale( 0.8 )
							if event.interrupted then
								self.clipFinished( RankUpNotificationWingContainer, event )
							else
								RankUpNotificationWingContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							RankUpNotificationWingContainerFrame4( RankUpNotificationWingContainer, event )
							return 
						else
							RankUpNotificationWingContainer:beginAnimation( "keyframe", 199, false, true, CoD.TweenType.Linear )
							RankUpNotificationWingContainer:setAlpha( 0.9 )
							RankUpNotificationWingContainer:setScale( 1 )
							RankUpNotificationWingContainer:registerEventHandler( "transition_complete_keyframe", RankUpNotificationWingContainerFrame4 )
						end
					end
					
					if event.interrupted then
						RankUpNotificationWingContainerFrame3( RankUpNotificationWingContainer, event )
						return 
					else
						RankUpNotificationWingContainer:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
						RankUpNotificationWingContainer:registerEventHandler( "transition_complete_keyframe", RankUpNotificationWingContainerFrame3 )
					end
				end
				
				RankUpNotificationWingContainer:completeAnimation()
				self.RankUpNotificationWingContainer:setAlpha( 0 )
				self.RankUpNotificationWingContainer:setScale( 3 )
				RankUpNotificationWingContainerFrame2( RankUpNotificationWingContainer, {} )
				local RankUpNotificationTitleFrame2 = function ( RankUpNotificationTitle, event )
					local RankUpNotificationTitleFrame3 = function ( RankUpNotificationTitle, event )
						local RankUpNotificationTitleFrame4 = function ( RankUpNotificationTitle, event )
							if not event.interrupted then
								RankUpNotificationTitle:beginAnimation( "keyframe", 50, false, true, CoD.TweenType.Linear )
							end
							RankUpNotificationTitle:setAlpha( 1 )
							RankUpNotificationTitle:setScale( 1 )
							if event.interrupted then
								self.clipFinished( RankUpNotificationTitle, event )
							else
								RankUpNotificationTitle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							RankUpNotificationTitleFrame4( RankUpNotificationTitle, event )
							return 
						else
							RankUpNotificationTitle:beginAnimation( "keyframe", 250, false, true, CoD.TweenType.Linear )
							RankUpNotificationTitle:setAlpha( 0.93 )
							RankUpNotificationTitle:setScale( 1.3 )
							RankUpNotificationTitle:registerEventHandler( "transition_complete_keyframe", RankUpNotificationTitleFrame4 )
						end
					end
					
					if event.interrupted then
						RankUpNotificationTitleFrame3( RankUpNotificationTitle, event )
						return 
					else
						RankUpNotificationTitle:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						RankUpNotificationTitle:registerEventHandler( "transition_complete_keyframe", RankUpNotificationTitleFrame3 )
					end
				end
				
				RankUpNotificationTitle:completeAnimation()
				self.RankUpNotificationTitle:setAlpha( 0 )
				self.RankUpNotificationTitle:setScale( 0 )
				RankUpNotificationTitleFrame2( RankUpNotificationTitle, {} )
				local RankBFrame2 = function ( RankB, event )
					local RankBFrame3 = function ( RankB, event )
						local RankBFrame4 = function ( RankB, event )
							local RankBFrame5 = function ( RankB, event )
								local RankBFrame6 = function ( RankB, event )
									if not event.interrupted then
										RankB:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
									end
									RankB:setLeftRight( false, false, -52, 52 )
									RankB:setTopBottom( true, false, 16, 120 )
									RankB:setAlpha( 0 )
									RankB:setScale( 1 )
									if event.interrupted then
										self.clipFinished( RankB, event )
									else
										RankB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									RankBFrame6( RankB, event )
									return 
								else
									RankB:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									RankB:setScale( 1 )
									RankB:registerEventHandler( "transition_complete_keyframe", RankBFrame6 )
								end
							end
							
							if event.interrupted then
								RankBFrame5( RankB, event )
								return 
							else
								RankB:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								RankB:setScale( 0.8 )
								RankB:registerEventHandler( "transition_complete_keyframe", RankBFrame5 )
							end
						end
						
						if event.interrupted then
							RankBFrame4( RankB, event )
							return 
						else
							RankB:beginAnimation( "keyframe", 90, false, true, CoD.TweenType.Linear )
							RankB:setScale( 1 )
							RankB:registerEventHandler( "transition_complete_keyframe", RankBFrame4 )
						end
					end
					
					if event.interrupted then
						RankBFrame3( RankB, event )
						return 
					else
						RankB:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
						RankB:registerEventHandler( "transition_complete_keyframe", RankBFrame3 )
					end
				end
				
				RankB:completeAnimation()
				self.RankB:setLeftRight( false, false, -52, 52 )
				self.RankB:setTopBottom( true, false, 16, 120 )
				self.RankB:setAlpha( 0 )
				self.RankB:setScale( 3 )
				RankBFrame2( RankB, {} )
				local RankGFrame2 = function ( RankG, event )
					local RankGFrame3 = function ( RankG, event )
						local RankGFrame4 = function ( RankG, event )
							local RankGFrame5 = function ( RankG, event )
								local RankGFrame6 = function ( RankG, event )
									if not event.interrupted then
										RankG:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
									end
									RankG:setLeftRight( false, false, -52, 52 )
									RankG:setTopBottom( true, false, 16, 120 )
									RankG:setAlpha( 0 )
									RankG:setScale( 1 )
									if event.interrupted then
										self.clipFinished( RankG, event )
									else
										RankG:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									RankGFrame6( RankG, event )
									return 
								else
									RankG:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									RankG:setAlpha( 0.6 )
									RankG:setScale( 1 )
									RankG:registerEventHandler( "transition_complete_keyframe", RankGFrame6 )
								end
							end
							
							if event.interrupted then
								RankGFrame5( RankG, event )
								return 
							else
								RankG:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								RankG:setAlpha( 0.8 )
								RankG:setScale( 0.8 )
								RankG:registerEventHandler( "transition_complete_keyframe", RankGFrame5 )
							end
						end
						
						if event.interrupted then
							RankGFrame4( RankG, event )
							return 
						else
							RankG:beginAnimation( "keyframe", 90, false, true, CoD.TweenType.Linear )
							RankG:setLeftRight( false, false, -52, 52 )
							RankG:setAlpha( 1 )
							RankG:setScale( 1 )
							RankG:registerEventHandler( "transition_complete_keyframe", RankGFrame4 )
						end
					end
					
					if event.interrupted then
						RankGFrame3( RankG, event )
						return 
					else
						RankG:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
						RankG:registerEventHandler( "transition_complete_keyframe", RankGFrame3 )
					end
				end
				
				RankG:completeAnimation()
				self.RankG:setLeftRight( false, false, 28, 132 )
				self.RankG:setTopBottom( true, false, 16, 120 )
				self.RankG:setAlpha( 0 )
				self.RankG:setScale( 3 )
				RankGFrame2( RankG, {} )
				local RankRFrame2 = function ( RankR, event )
					local RankRFrame3 = function ( RankR, event )
						local RankRFrame4 = function ( RankR, event )
							local RankRFrame5 = function ( RankR, event )
								local RankRFrame6 = function ( RankR, event )
									if not event.interrupted then
										RankR:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
									end
									RankR:setLeftRight( false, false, -52, 52 )
									RankR:setTopBottom( true, false, 16, 120 )
									RankR:setAlpha( 0 )
									RankR:setScale( 1 )
									if event.interrupted then
										self.clipFinished( RankR, event )
									else
										RankR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									RankRFrame6( RankR, event )
									return 
								else
									RankR:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									RankR:setAlpha( 0.6 )
									RankR:setScale( 1 )
									RankR:registerEventHandler( "transition_complete_keyframe", RankRFrame6 )
								end
							end
							
							if event.interrupted then
								RankRFrame5( RankR, event )
								return 
							else
								RankR:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								RankR:setAlpha( 0.8 )
								RankR:setScale( 0.8 )
								RankR:registerEventHandler( "transition_complete_keyframe", RankRFrame5 )
							end
						end
						
						if event.interrupted then
							RankRFrame4( RankR, event )
							return 
						else
							RankR:beginAnimation( "keyframe", 90, false, true, CoD.TweenType.Linear )
							RankR:setLeftRight( false, false, -52, 52 )
							RankR:setAlpha( 1 )
							RankR:setScale( 1 )
							RankR:registerEventHandler( "transition_complete_keyframe", RankRFrame4 )
						end
					end
					
					if event.interrupted then
						RankRFrame3( RankR, event )
						return 
					else
						RankR:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
						RankR:registerEventHandler( "transition_complete_keyframe", RankRFrame3 )
					end
				end
				
				RankR:completeAnimation()
				self.RankR:setLeftRight( false, false, -132, -28 )
				self.RankR:setTopBottom( true, false, 16, 120 )
				self.RankR:setAlpha( 0 )
				self.RankR:setScale( 3 )
				RankRFrame2( RankR, {} )
				local highlightFrame2 = function ( highlight, event )
					local highlightFrame3 = function ( highlight, event )
						local highlightFrame4 = function ( highlight, event )
							local highlightFrame5 = function ( highlight, event )
								if not event.interrupted then
									highlight:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
								end
								highlight:setAlpha( 0.2 )
								highlight:setZRot( 360 )
								highlight:setScale( 2 )
								if event.interrupted then
									self.clipFinished( highlight, event )
								else
									highlight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								highlightFrame5( highlight, event )
								return 
							else
								highlight:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								highlight:setAlpha( 0.94 )
								highlight:setZRot( 105.88 )
								highlight:setScale( 3 )
								highlight:registerEventHandler( "transition_complete_keyframe", highlightFrame5 )
							end
						end
						
						if event.interrupted then
							highlightFrame4( highlight, event )
							return 
						else
							highlight:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							highlight:setAlpha( 1 )
							highlight:setZRot( 84.71 )
							highlight:setScale( 2.6 )
							highlight:registerEventHandler( "transition_complete_keyframe", highlightFrame4 )
						end
					end
					
					if event.interrupted then
						highlightFrame3( highlight, event )
						return 
					else
						highlight:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
						highlight:registerEventHandler( "transition_complete_keyframe", highlightFrame3 )
					end
				end
				
				highlight:completeAnimation()
				self.highlight:setAlpha( 0 )
				self.highlight:setZRot( 0 )
				self.highlight:setScale( 1 )
				highlightFrame2( highlight, {} )
				local RankFrame2 = function ( Rank, event )
					local RankFrame3 = function ( Rank, event )
						local RankFrame4 = function ( Rank, event )
							local RankFrame5 = function ( Rank, event )
								if not event.interrupted then
									Rank:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Linear )
								end
								Rank:setAlpha( 1 )
								Rank:setScale( 1 )
								if event.interrupted then
									self.clipFinished( Rank, event )
								else
									Rank:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								RankFrame5( Rank, event )
								return 
							else
								Rank:beginAnimation( "keyframe", 30, false, true, CoD.TweenType.Linear )
								Rank:setScale( 1.8 )
								Rank:registerEventHandler( "transition_complete_keyframe", RankFrame5 )
							end
						end
						
						if event.interrupted then
							RankFrame4( Rank, event )
							return 
						else
							Rank:beginAnimation( "keyframe", 49, false, true, CoD.TweenType.Linear )
							Rank:setAlpha( 1 )
							Rank:setScale( 1.49 )
							Rank:registerEventHandler( "transition_complete_keyframe", RankFrame4 )
						end
					end
					
					if event.interrupted then
						RankFrame3( Rank, event )
						return 
					else
						Rank:beginAnimation( "keyframe", 330, false, true, CoD.TweenType.Bounce )
						Rank:registerEventHandler( "transition_complete_keyframe", RankFrame3 )
					end
				end
				
				Rank:completeAnimation()
				self.Rank:setAlpha( 0 )
				self.Rank:setScale( 0.8 )
				RankFrame2( Rank, {} )
				local RankUpNotificationFooterLabel020Frame2 = function ( RankUpNotificationFooterLabel020, event )
					local RankUpNotificationFooterLabel020Frame3 = function ( RankUpNotificationFooterLabel020, event )
						local RankUpNotificationFooterLabel020Frame4 = function ( RankUpNotificationFooterLabel020, event )
							if not event.interrupted then
								RankUpNotificationFooterLabel020:beginAnimation( "keyframe", 120, false, true, CoD.TweenType.Linear )
							end
							RankUpNotificationFooterLabel020:setLeftRight( false, false, -137, 137 )
							RankUpNotificationFooterLabel020:setTopBottom( true, false, 168, 200 )
							RankUpNotificationFooterLabel020:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( RankUpNotificationFooterLabel020, event )
							else
								RankUpNotificationFooterLabel020:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							RankUpNotificationFooterLabel020Frame4( RankUpNotificationFooterLabel020, event )
							return 
						else
							RankUpNotificationFooterLabel020:beginAnimation( "keyframe", 49, false, true, CoD.TweenType.Linear )
							RankUpNotificationFooterLabel020:registerEventHandler( "transition_complete_keyframe", RankUpNotificationFooterLabel020Frame4 )
						end
					end
					
					if event.interrupted then
						RankUpNotificationFooterLabel020Frame3( RankUpNotificationFooterLabel020, event )
						return 
					else
						RankUpNotificationFooterLabel020:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						RankUpNotificationFooterLabel020:registerEventHandler( "transition_complete_keyframe", RankUpNotificationFooterLabel020Frame3 )
					end
				end
				
				RankUpNotificationFooterLabel020:completeAnimation()
				self.RankUpNotificationFooterLabel020:setLeftRight( false, false, -50, 50 )
				self.RankUpNotificationFooterLabel020:setTopBottom( true, false, 168, 200 )
				self.RankUpNotificationFooterLabel020:setAlpha( 0 )
				RankUpNotificationFooterLabel020Frame2( RankUpNotificationFooterLabel020, {} )
				local RankUpNotificationFooterLabel010Frame2 = function ( RankUpNotificationFooterLabel010, event )
					local RankUpNotificationFooterLabel010Frame3 = function ( RankUpNotificationFooterLabel010, event )
						local RankUpNotificationFooterLabel010Frame4 = function ( RankUpNotificationFooterLabel010, event )
							local RankUpNotificationFooterLabel010Frame5 = function ( RankUpNotificationFooterLabel010, event )
								local RankUpNotificationFooterLabel010Frame6 = function ( RankUpNotificationFooterLabel010, event )
									if not event.interrupted then
										RankUpNotificationFooterLabel010:beginAnimation( "keyframe", 30, false, true, CoD.TweenType.Bounce )
									end
									RankUpNotificationFooterLabel010:setLeftRight( false, false, -71, 71 )
									RankUpNotificationFooterLabel010:setTopBottom( true, false, 168, 200 )
									RankUpNotificationFooterLabel010:setAlpha( 1 )
									if event.interrupted then
										self.clipFinished( RankUpNotificationFooterLabel010, event )
									else
										RankUpNotificationFooterLabel010:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									RankUpNotificationFooterLabel010Frame6( RankUpNotificationFooterLabel010, event )
									return 
								else
									RankUpNotificationFooterLabel010:beginAnimation( "keyframe", 49, false, true, CoD.TweenType.Bounce )
									RankUpNotificationFooterLabel010:setAlpha( 1 )
									RankUpNotificationFooterLabel010:registerEventHandler( "transition_complete_keyframe", RankUpNotificationFooterLabel010Frame6 )
								end
							end
							
							if event.interrupted then
								RankUpNotificationFooterLabel010Frame5( RankUpNotificationFooterLabel010, event )
								return 
							else
								RankUpNotificationFooterLabel010:beginAnimation( "keyframe", 50, false, true, CoD.TweenType.Bounce )
								RankUpNotificationFooterLabel010:setAlpha( 0 )
								RankUpNotificationFooterLabel010:registerEventHandler( "transition_complete_keyframe", RankUpNotificationFooterLabel010Frame5 )
							end
						end
						
						if event.interrupted then
							RankUpNotificationFooterLabel010Frame4( RankUpNotificationFooterLabel010, event )
							return 
						else
							RankUpNotificationFooterLabel010:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
							RankUpNotificationFooterLabel010:setAlpha( 1 )
							RankUpNotificationFooterLabel010:registerEventHandler( "transition_complete_keyframe", RankUpNotificationFooterLabel010Frame4 )
						end
					end
					
					if event.interrupted then
						RankUpNotificationFooterLabel010Frame3( RankUpNotificationFooterLabel010, event )
						return 
					else
						RankUpNotificationFooterLabel010:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
						RankUpNotificationFooterLabel010:registerEventHandler( "transition_complete_keyframe", RankUpNotificationFooterLabel010Frame3 )
					end
				end
				
				RankUpNotificationFooterLabel010:completeAnimation()
				self.RankUpNotificationFooterLabel010:setLeftRight( false, false, -71, 71 )
				self.RankUpNotificationFooterLabel010:setTopBottom( true, false, 168, 200 )
				self.RankUpNotificationFooterLabel010:setAlpha( 0 )
				RankUpNotificationFooterLabel010Frame2( RankUpNotificationFooterLabel010, {} )
			end,
			TimeUp1 = function ()
				self:setupElementClipCounter( 1 )
				local RankFrame2 = function ( Rank, event )
					if not event.interrupted then
						Rank:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					Rank:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint_reveal" ) )
					Rank:setShaderVector( 0, 0, 0, 0, 0 )
					if event.interrupted then
						self.clipFinished( Rank, event )
					else
						Rank:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Rank:completeAnimation()
				self.Rank:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint_reveal" ) )
				self.Rank:setShaderVector( 0, 1, 0, 0, 0 )
				RankFrame2( Rank, {} )
			end,
			TimeUp = function ()
				self:setupElementClipCounter( 12 )
				local f57_local0 = function ( f58_arg0, f58_arg1 )
					local f58_local0 = function ( f59_arg0, f59_arg1 )
						local f59_local0 = function ( f60_arg0, f60_arg1 )
							if not f60_arg1.interrupted then
								f60_arg0:beginAnimation( "keyframe", 40, false, true, CoD.TweenType.Bounce )
							end
							f60_arg0:setAlpha( 0 )
							if f60_arg1.interrupted then
								self.clipFinished( f60_arg0, f60_arg1 )
							else
								f60_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f59_arg1.interrupted then
							f59_local0( f59_arg0, f59_arg1 )
							return 
						else
							f59_arg0:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
							f59_arg0:setAlpha( 1 )
							f59_arg0:registerEventHandler( "transition_complete_keyframe", f59_local0 )
						end
					end
					
					if f58_arg1.interrupted then
						f58_local0( f58_arg0, f58_arg1 )
						return 
					else
						f58_arg0:beginAnimation( "keyframe", 40, false, true, CoD.TweenType.Bounce )
						f58_arg0:setAlpha( 0 )
						f58_arg0:registerEventHandler( "transition_complete_keyframe", f58_local0 )
					end
				end
				
				frame:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
				frame:setAlpha( 1 )
				frame:registerEventHandler( "transition_complete_keyframe", f57_local0 )
				local f57_local1 = function ( f61_arg0, f61_arg1 )
					local f61_local0 = function ( f62_arg0, f62_arg1 )
						local f62_local0 = function ( f63_arg0, f63_arg1 )
							if not f63_arg1.interrupted then
								f63_arg0:beginAnimation( "keyframe", 40, false, true, CoD.TweenType.Bounce )
							end
							f63_arg0:setAlpha( 0 )
							if f63_arg1.interrupted then
								self.clipFinished( f63_arg0, f63_arg1 )
							else
								f63_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f62_arg1.interrupted then
							f62_local0( f62_arg0, f62_arg1 )
							return 
						else
							f62_arg0:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
							f62_arg0:setAlpha( 1 )
							f62_arg0:registerEventHandler( "transition_complete_keyframe", f62_local0 )
						end
					end
					
					if f61_arg1.interrupted then
						f61_local0( f61_arg0, f61_arg1 )
						return 
					else
						f61_arg0:beginAnimation( "keyframe", 40, false, true, CoD.TweenType.Bounce )
						f61_arg0:setAlpha( 0 )
						f61_arg0:registerEventHandler( "transition_complete_keyframe", f61_local0 )
					end
				end
				
				fill:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
				fill:setAlpha( 1 )
				fill:registerEventHandler( "transition_complete_keyframe", f57_local1 )
				local f57_local2 = function ( f64_arg0, f64_arg1 )
					local f64_local0 = function ( f65_arg0, f65_arg1 )
						local f65_local0 = function ( f66_arg0, f66_arg1 )
							if not f66_arg1.interrupted then
								f66_arg0:beginAnimation( "keyframe", 40, false, true, CoD.TweenType.Bounce )
							end
							f66_arg0:setAlpha( 0 )
							if f66_arg1.interrupted then
								self.clipFinished( f66_arg0, f66_arg1 )
							else
								f66_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f65_arg1.interrupted then
							f65_local0( f65_arg0, f65_arg1 )
							return 
						else
							f65_arg0:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
							f65_arg0:setAlpha( 1 )
							f65_arg0:registerEventHandler( "transition_complete_keyframe", f65_local0 )
						end
					end
					
					if f64_arg1.interrupted then
						f64_local0( f64_arg0, f64_arg1 )
						return 
					else
						f64_arg0:beginAnimation( "keyframe", 40, false, true, CoD.TweenType.Bounce )
						f64_arg0:setAlpha( 0 )
						f64_arg0:registerEventHandler( "transition_complete_keyframe", f64_local0 )
					end
				end
				
				main:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
				main:setAlpha( 1 )
				main:registerEventHandler( "transition_complete_keyframe", f57_local2 )
				local f57_local3 = function ( f67_arg0, f67_arg1 )
					local f67_local0 = function ( f68_arg0, f68_arg1 )
						local f68_local0 = function ( f69_arg0, f69_arg1 )
							if not f69_arg1.interrupted then
								f69_arg0:beginAnimation( "keyframe", 40, false, true, CoD.TweenType.Bounce )
							end
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
							f68_arg0:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
							f68_arg0:setAlpha( 1 )
							f68_arg0:registerEventHandler( "transition_complete_keyframe", f68_local0 )
						end
					end
					
					if f67_arg1.interrupted then
						f67_local0( f67_arg0, f67_arg1 )
						return 
					else
						f67_arg0:beginAnimation( "keyframe", 40, false, true, CoD.TweenType.Bounce )
						f67_arg0:setAlpha( 0 )
						f67_arg0:registerEventHandler( "transition_complete_keyframe", f67_local0 )
					end
				end
				
				RankUpNotificationWingContainer:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
				RankUpNotificationWingContainer:setAlpha( 1 )
				RankUpNotificationWingContainer:registerEventHandler( "transition_complete_keyframe", f57_local3 )
				local f57_local4 = function ( f70_arg0, f70_arg1 )
					local f70_local0 = function ( f71_arg0, f71_arg1 )
						local f71_local0 = function ( f72_arg0, f72_arg1 )
							if not f72_arg1.interrupted then
								f72_arg0:beginAnimation( "keyframe", 40, false, true, CoD.TweenType.Bounce )
							end
							f72_arg0:setAlpha( 0 )
							if f72_arg1.interrupted then
								self.clipFinished( f72_arg0, f72_arg1 )
							else
								f72_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f71_arg1.interrupted then
							f71_local0( f71_arg0, f71_arg1 )
							return 
						else
							f71_arg0:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
							f71_arg0:setAlpha( 1 )
							f71_arg0:registerEventHandler( "transition_complete_keyframe", f71_local0 )
						end
					end
					
					if f70_arg1.interrupted then
						f70_local0( f70_arg0, f70_arg1 )
						return 
					else
						f70_arg0:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
						f70_arg0:setAlpha( 0 )
						f70_arg0:registerEventHandler( "transition_complete_keyframe", f70_local0 )
					end
				end
				
				RankUpNotificationTitle:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
				RankUpNotificationTitle:setAlpha( 1 )
				RankUpNotificationTitle:registerEventHandler( "transition_complete_keyframe", f57_local4 )
				RankB:completeAnimation()
				self.RankB:setAlpha( 0 )
				self.clipFinished( RankB, {} )
				RankG:completeAnimation()
				self.RankG:setAlpha( 0 )
				self.clipFinished( RankG, {} )
				RankR:completeAnimation()
				self.RankR:setAlpha( 0 )
				self.clipFinished( RankR, {} )
				highlight:completeAnimation()
				self.highlight:setAlpha( 0 )
				self.clipFinished( highlight, {} )
				local RankFrame2 = function ( Rank, event )
					local RankFrame3 = function ( Rank, event )
						local RankFrame4 = function ( Rank, event )
							if not event.interrupted then
								Rank:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
							end
							Rank:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Rank, event )
							else
								Rank:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							RankFrame4( Rank, event )
							return 
						else
							Rank:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
							Rank:setAlpha( 1 )
							Rank:registerEventHandler( "transition_complete_keyframe", RankFrame4 )
						end
					end
					
					if event.interrupted then
						RankFrame3( Rank, event )
						return 
					else
						Rank:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
						Rank:setAlpha( 0 )
						Rank:registerEventHandler( "transition_complete_keyframe", RankFrame3 )
					end
				end
				
				Rank:completeAnimation()
				self.Rank:setAlpha( 1 )
				RankFrame2( Rank, {} )
				local RankUpNotificationFooterLabel020Frame2 = function ( RankUpNotificationFooterLabel020, event )
					local RankUpNotificationFooterLabel020Frame3 = function ( RankUpNotificationFooterLabel020, event )
						local RankUpNotificationFooterLabel020Frame4 = function ( RankUpNotificationFooterLabel020, event )
							if not event.interrupted then
								RankUpNotificationFooterLabel020:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
							end
							RankUpNotificationFooterLabel020:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( RankUpNotificationFooterLabel020, event )
							else
								RankUpNotificationFooterLabel020:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							RankUpNotificationFooterLabel020Frame4( RankUpNotificationFooterLabel020, event )
							return 
						else
							RankUpNotificationFooterLabel020:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
							RankUpNotificationFooterLabel020:setAlpha( 1 )
							RankUpNotificationFooterLabel020:registerEventHandler( "transition_complete_keyframe", RankUpNotificationFooterLabel020Frame4 )
						end
					end
					
					if event.interrupted then
						RankUpNotificationFooterLabel020Frame3( RankUpNotificationFooterLabel020, event )
						return 
					else
						RankUpNotificationFooterLabel020:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
						RankUpNotificationFooterLabel020:setAlpha( 0 )
						RankUpNotificationFooterLabel020:registerEventHandler( "transition_complete_keyframe", RankUpNotificationFooterLabel020Frame3 )
					end
				end
				
				RankUpNotificationFooterLabel020:completeAnimation()
				self.RankUpNotificationFooterLabel020:setAlpha( 1 )
				RankUpNotificationFooterLabel020Frame2( RankUpNotificationFooterLabel020, {} )
				local RankUpNotificationFooterLabel010Frame2 = function ( RankUpNotificationFooterLabel010, event )
					local RankUpNotificationFooterLabel010Frame3 = function ( RankUpNotificationFooterLabel010, event )
						local RankUpNotificationFooterLabel010Frame4 = function ( RankUpNotificationFooterLabel010, event )
							if not event.interrupted then
								RankUpNotificationFooterLabel010:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
							end
							RankUpNotificationFooterLabel010:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( RankUpNotificationFooterLabel010, event )
							else
								RankUpNotificationFooterLabel010:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							RankUpNotificationFooterLabel010Frame4( RankUpNotificationFooterLabel010, event )
							return 
						else
							RankUpNotificationFooterLabel010:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
							RankUpNotificationFooterLabel010:setAlpha( 1 )
							RankUpNotificationFooterLabel010:registerEventHandler( "transition_complete_keyframe", RankUpNotificationFooterLabel010Frame4 )
						end
					end
					
					if event.interrupted then
						RankUpNotificationFooterLabel010Frame3( RankUpNotificationFooterLabel010, event )
						return 
					else
						RankUpNotificationFooterLabel010:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
						RankUpNotificationFooterLabel010:setAlpha( 0 )
						RankUpNotificationFooterLabel010:registerEventHandler( "transition_complete_keyframe", RankUpNotificationFooterLabel010Frame3 )
					end
				end
				
				RankUpNotificationFooterLabel010:completeAnimation()
				self.RankUpNotificationFooterLabel010:setAlpha( 1 )
				RankUpNotificationFooterLabel010Frame2( RankUpNotificationFooterLabel010, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.RankUpNotificationWingContainer:close()
		element.RankUpNotificationTitle:close()
		element.RankUpNotificationFooterLabel020:close()
		element.RankUpNotificationFooterLabel010:close()
		element.RankB:close()
		element.RankG:close()
		element.RankR:close()
		element.highlight:close()
		element.Rank:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

