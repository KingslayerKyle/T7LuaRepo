-- b6b6dac253e86af843afb3ec02410588
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Notifications.NotificationWeeklyDailyWidget" )
require( "ui.uieditor.widgets.Notifications.Global.Notif_Global_TitleLine" )
require( "ui.uieditor.widgets.Notifications.Global.Notif_Global_Title" )

CoD.MPSpecialContractNotification = InheritFrom( LUI.UIElement )
CoD.MPSpecialContractNotification.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MPSpecialContractNotification )
	self.id = "MPSpecialContractNotification"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 348 )
	self:setTopBottom( true, false, 0, 250 )
	self.anyChildUsesUpdateState = true
	
	local NotificationWeeklyDailyWidget = CoD.NotificationWeeklyDailyWidget.new( menu, controller )
	NotificationWeeklyDailyWidget:setLeftRight( false, false, -95, 99 )
	NotificationWeeklyDailyWidget:setTopBottom( true, false, 135, 165.6 )
	NotificationWeeklyDailyWidget.NotificationWeeklyDailyTextWidget.WeeklyText:setText( Engine.Localize( "MPUI_BM_CONTRACT_SPECIAL" ) )
	self:addElement( NotificationWeeklyDailyWidget )
	self.NotificationWeeklyDailyWidget = NotificationWeeklyDailyWidget
	
	local CenterShadow = LUI.UIImage.new()
	CenterShadow:setLeftRight( false, false, -76, 76 )
	CenterShadow:setTopBottom( true, false, -1, 151 )
	CenterShadow:setRGB( 0, 0, 0 )
	CenterShadow:setAlpha( 0.5 )
	CenterShadow:setImage( RegisterImage( "uie_t7_hud_notif_challenge_center_shadow" ) )
	self:addElement( CenterShadow )
	self.CenterShadow = CenterShadow
	
	local CenterBacking = LUI.UIImage.new()
	CenterBacking:setLeftRight( false, false, -76, 76 )
	CenterBacking:setTopBottom( true, false, -1, 151 )
	CenterBacking:setRGB( 0.16, 0.16, 0.16 )
	CenterBacking:setAlpha( 0.4 )
	CenterBacking:setImage( RegisterImage( "uie_t7_hud_notif_challenge_center_backing" ) )
	self:addElement( CenterBacking )
	self.CenterBacking = CenterBacking
	
	local FrameFill = LUI.UIImage.new()
	FrameFill:setLeftRight( false, false, -76, 76 )
	FrameFill:setTopBottom( true, false, -1, 151 )
	FrameFill:setAlpha( 0.3 )
	FrameFill:setImage( RegisterImage( "uie_t7_hud_notif_challenge_frame_fill" ) )
	self:addElement( FrameFill )
	self.FrameFill = FrameFill
	
	local FrameNotches = LUI.UIImage.new()
	FrameNotches:setLeftRight( false, false, -76, 76 )
	FrameNotches:setTopBottom( true, false, -1, 151 )
	FrameNotches:setRGB( 0.11, 0.11, 0.11 )
	FrameNotches:setAlpha( 0.4 )
	FrameNotches:setImage( RegisterImage( "uie_t7_hud_notif_challenge_frame_notches" ) )
	self:addElement( FrameNotches )
	self.FrameNotches = FrameNotches
	
	local FrameStroke = LUI.UIImage.new()
	FrameStroke:setLeftRight( false, false, -76, 76 )
	FrameStroke:setTopBottom( true, false, -1, 151 )
	FrameStroke:setImage( RegisterImage( "uie_t7_hud_notif_challenge_frame_stroke" ) )
	self:addElement( FrameStroke )
	self.FrameStroke = FrameStroke
	
	local DescBacking = LUI.UIImage.new()
	DescBacking:setLeftRight( false, false, -220.85, 220.85 )
	DescBacking:setTopBottom( true, false, 161, 339 )
	DescBacking:setRGB( 0.16, 0.16, 0.16 )
	DescBacking:setAlpha( 0.9 )
	DescBacking:setImage( RegisterImage( "uie_t7_hud_notif_global_desc_backing" ) )
	self:addElement( DescBacking )
	self.DescBacking = DescBacking
	
	local Desc = LUI.UIText.new()
	Desc:setLeftRight( false, false, -195, 195 )
	Desc:setTopBottom( true, false, 199, 219 )
	Desc:setTTF( "fonts/default.ttf" )
	Desc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Desc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Desc )
	self.Desc = Desc
	
	local NotifGlobalTitleLine = CoD.Notif_Global_TitleLine.new( menu, controller )
	NotifGlobalTitleLine:setLeftRight( false, false, -258, 258 )
	NotifGlobalTitleLine:setTopBottom( true, false, 161, 201 )
	self:addElement( NotifGlobalTitleLine )
	self.NotifGlobalTitleLine = NotifGlobalTitleLine
	
	local NotifGlobalTitle = CoD.Notif_Global_Title.new( menu, controller )
	NotifGlobalTitle:setLeftRight( false, false, -140, 141 )
	NotifGlobalTitle:setTopBottom( true, false, 161, 201 )
	NotifGlobalTitle.NotifGlobalTitleBacking.left:setImage( RegisterImage( "uie_t7_hud_notif_bm_titlebacking_left" ) )
	NotifGlobalTitle.NotifGlobalTitleBacking.right:setImage( RegisterImage( "uie_t7_hud_notif_bm_titlebacking_right" ) )
	NotifGlobalTitle.NotifGlobalTitleBacking.Image0:setImage( RegisterImage( "uie_t7_hud_notif_bm_titlebacking_center" ) )
	NotifGlobalTitle.SubText:setRGB( 0.94, 0.89, 0.59 )
	self:addElement( NotifGlobalTitle )
	self.NotifGlobalTitle = NotifGlobalTitle
	
	local highlight = LUI.UIImage.new()
	highlight:setLeftRight( true, false, 115, 233 )
	highlight:setTopBottom( true, false, 16, 134 )
	highlight:setImage( RegisterImage( "uie_t7_hud_notficationhighlight" ) )
	highlight:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( highlight )
	self.highlight = highlight
	
	local imageG = LUI.UIImage.new()
	imageG:setLeftRight( false, false, -67.25, 66.25 )
	imageG:setTopBottom( true, false, 9.5, 143 )
	imageG:setRGB( 0, 0.27, 0.01 )
	imageG:setImage( RegisterImage( "uie_t7_hud_notif_weekly_challenge" ) )
	imageG:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
	imageG:setShaderVector( 0, 2, 0, 0, 0 )
	imageG:setShaderVector( 1, 1, 0, 0, 0 )
	imageG:setShaderVector( 2, 0.02, 0, 0, 0 )
	self:addElement( imageG )
	self.imageG = imageG
	
	local imageR = LUI.UIImage.new()
	imageR:setLeftRight( false, false, -67.25, 66.25 )
	imageR:setTopBottom( true, false, 9.5, 143 )
	imageR:setRGB( 0.55, 0.09, 0.09 )
	imageR:setImage( RegisterImage( "uie_t7_hud_notif_weekly_challenge" ) )
	imageR:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
	imageR:setShaderVector( 0, 2, 0, 0, 0 )
	imageR:setShaderVector( 1, 1, 0, 0, 0 )
	imageR:setShaderVector( 2, 0.02, 0, 0, 0 )
	self:addElement( imageR )
	self.imageR = imageR
	
	local image = LUI.UIImage.new()
	image:setLeftRight( false, false, -67.25, 66.25 )
	image:setTopBottom( true, false, 9.5, 143 )
	image:setImage( RegisterImage( "uie_t7_hud_notif_daily_challenge" ) )
	self:addElement( image )
	self.image = image
	
	local levelUpSound = LUI.UIElement.new()
	levelUpSound:setLeftRight( true, false, -48, 0 )
	levelUpSound:setTopBottom( true, false, 0, 48 )
	self:addElement( levelUpSound )
	self.levelUpSound = levelUpSound
	
	self.FrameFill:linkToElementModel( self, "color", true, function ( model )
		local color = Engine.GetModelValue( model )
		if color then
			FrameFill:setRGB( color )
		end
	end )
	self.FrameStroke:linkToElementModel( self, "color", true, function ( model )
		local color = Engine.GetModelValue( model )
		if color then
			FrameStroke:setRGB( color )
		end
	end )
	self.Desc:linkToElementModel( self, "subtitle", true, function ( model )
		local subtitle = Engine.GetModelValue( model )
		if subtitle then
			Desc:setText( Engine.Localize( subtitle ) )
		end
	end )
	self.NotifGlobalTitleLine:linkToElementModel( self, "color", true, function ( model )
		local color = Engine.GetModelValue( model )
		if color then
			NotifGlobalTitleLine.NotifGlobalTitleBackingLine.TitleBackingLine:setRGB( color )
		end
	end )
	self.NotifGlobalTitleLine:linkToElementModel( self, "color", true, function ( model )
		local color = Engine.GetModelValue( model )
		if color then
			NotifGlobalTitleLine.NotifGlobalTitleBackingLine.Image0:setRGB( color )
		end
	end )
	self.NotifGlobalTitleLine:linkToElementModel( self, "title", true, function ( model )
		local title = Engine.GetModelValue( model )
		if title then
			NotifGlobalTitleLine.SubText:setText( Engine.Localize( title ) )
		end
	end )
	self.NotifGlobalTitle:linkToElementModel( self, "title", true, function ( model )
		local title = Engine.GetModelValue( model )
		if title then
			NotifGlobalTitle.SubText:setText( Engine.Localize( title ) )
		end
	end )
	self.highlight:linkToElementModel( self, "color", true, function ( model )
		local color = Engine.GetModelValue( model )
		if color then
			highlight:setRGB( color )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 15 )
				local NotificationWeeklyDailyWidgetFrame2 = function ( NotificationWeeklyDailyWidget, event )
					local NotificationWeeklyDailyWidgetFrame3 = function ( NotificationWeeklyDailyWidget, event )
						local NotificationWeeklyDailyWidgetFrame4 = function ( NotificationWeeklyDailyWidget, event )
							local NotificationWeeklyDailyWidgetFrame5 = function ( NotificationWeeklyDailyWidget, event )
								local NotificationWeeklyDailyWidgetFrame6 = function ( NotificationWeeklyDailyWidget, event )
									local NotificationWeeklyDailyWidgetFrame7 = function ( NotificationWeeklyDailyWidget, event )
										if not event.interrupted then
											NotificationWeeklyDailyWidget:beginAnimation( "keyframe", 69, true, true, CoD.TweenType.Bounce )
										end
										NotificationWeeklyDailyWidget:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( NotificationWeeklyDailyWidget, event )
										else
											NotificationWeeklyDailyWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										NotificationWeeklyDailyWidgetFrame7( NotificationWeeklyDailyWidget, event )
										return 
									else
										NotificationWeeklyDailyWidget:beginAnimation( "keyframe", 69, true, true, CoD.TweenType.Bounce )
										NotificationWeeklyDailyWidget:registerEventHandler( "transition_complete_keyframe", NotificationWeeklyDailyWidgetFrame7 )
									end
								end
								
								if event.interrupted then
									NotificationWeeklyDailyWidgetFrame6( NotificationWeeklyDailyWidget, event )
									return 
								else
									NotificationWeeklyDailyWidget:beginAnimation( "keyframe", 69, true, true, CoD.TweenType.Bounce )
									NotificationWeeklyDailyWidget:setAlpha( 1 )
									NotificationWeeklyDailyWidget:registerEventHandler( "transition_complete_keyframe", NotificationWeeklyDailyWidgetFrame6 )
								end
							end
							
							if event.interrupted then
								NotificationWeeklyDailyWidgetFrame5( NotificationWeeklyDailyWidget, event )
								return 
							else
								NotificationWeeklyDailyWidget:beginAnimation( "keyframe", 69, true, true, CoD.TweenType.Bounce )
								NotificationWeeklyDailyWidget:setAlpha( 0 )
								NotificationWeeklyDailyWidget:registerEventHandler( "transition_complete_keyframe", NotificationWeeklyDailyWidgetFrame5 )
							end
						end
						
						if event.interrupted then
							NotificationWeeklyDailyWidgetFrame4( NotificationWeeklyDailyWidget, event )
							return 
						else
							NotificationWeeklyDailyWidget:beginAnimation( "keyframe", 69, true, true, CoD.TweenType.Bounce )
							NotificationWeeklyDailyWidget:setAlpha( 1 )
							NotificationWeeklyDailyWidget:registerEventHandler( "transition_complete_keyframe", NotificationWeeklyDailyWidgetFrame4 )
						end
					end
					
					if event.interrupted then
						NotificationWeeklyDailyWidgetFrame3( NotificationWeeklyDailyWidget, event )
						return 
					else
						NotificationWeeklyDailyWidget:beginAnimation( "keyframe", 540, false, false, CoD.TweenType.Linear )
						NotificationWeeklyDailyWidget:registerEventHandler( "transition_complete_keyframe", NotificationWeeklyDailyWidgetFrame3 )
					end
				end
				
				NotificationWeeklyDailyWidget:completeAnimation()
				self.NotificationWeeklyDailyWidget:setAlpha( 0 )
				NotificationWeeklyDailyWidgetFrame2( NotificationWeeklyDailyWidget, {} )
				local CenterShadowFrame2 = function ( CenterShadow, event )
					if not event.interrupted then
						CenterShadow:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
					end
					CenterShadow:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( CenterShadow, event )
					else
						CenterShadow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterShadow:completeAnimation()
				self.CenterShadow:setAlpha( 0 )
				CenterShadowFrame2( CenterShadow, {} )
				local CenterBackingFrame2 = function ( CenterBacking, event )
					if not event.interrupted then
						CenterBacking:beginAnimation( "keyframe", 239, false, true, CoD.TweenType.Linear )
					end
					CenterBacking:setAlpha( 0.4 )
					CenterBacking:setScale( 1 )
					if event.interrupted then
						self.clipFinished( CenterBacking, event )
					else
						CenterBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterBacking:completeAnimation()
				self.CenterBacking:setAlpha( 0 )
				self.CenterBacking:setScale( 5 )
				CenterBackingFrame2( CenterBacking, {} )
				local FrameFillFrame2 = function ( FrameFill, event )
					local FrameFillFrame3 = function ( FrameFill, event )
						if not event.interrupted then
							FrameFill:beginAnimation( "keyframe", 219, false, true, CoD.TweenType.Linear )
						end
						FrameFill:setAlpha( 0.3 )
						FrameFill:setScale( 1 )
						if event.interrupted then
							self.clipFinished( FrameFill, event )
						else
							FrameFill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FrameFillFrame3( FrameFill, event )
						return 
					else
						FrameFill:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
						FrameFill:registerEventHandler( "transition_complete_keyframe", FrameFillFrame3 )
					end
				end
				
				FrameFill:completeAnimation()
				self.FrameFill:setAlpha( 0 )
				self.FrameFill:setScale( 5 )
				FrameFillFrame2( FrameFill, {} )
				local FrameNotchesFrame2 = function ( FrameNotches, event )
					local FrameNotchesFrame3 = function ( FrameNotches, event )
						if not event.interrupted then
							FrameNotches:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Bounce )
						end
						FrameNotches:setAlpha( 0.4 )
						FrameNotches:setScale( 1 )
						if event.interrupted then
							self.clipFinished( FrameNotches, event )
						else
							FrameNotches:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FrameNotchesFrame3( FrameNotches, event )
						return 
					else
						FrameNotches:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
						FrameNotches:registerEventHandler( "transition_complete_keyframe", FrameNotchesFrame3 )
					end
				end
				
				FrameNotches:completeAnimation()
				self.FrameNotches:setAlpha( 0 )
				self.FrameNotches:setScale( 5 )
				FrameNotchesFrame2( FrameNotches, {} )
				local FrameStrokeFrame2 = function ( FrameStroke, event )
					local FrameStrokeFrame3 = function ( FrameStroke, event )
						if not event.interrupted then
							FrameStroke:beginAnimation( "keyframe", 219, false, true, CoD.TweenType.Linear )
						end
						FrameStroke:setAlpha( 1 )
						FrameStroke:setScale( 1 )
						if event.interrupted then
							self.clipFinished( FrameStroke, event )
						else
							FrameStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FrameStrokeFrame3( FrameStroke, event )
						return 
					else
						FrameStroke:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						FrameStroke:registerEventHandler( "transition_complete_keyframe", FrameStrokeFrame3 )
					end
				end
				
				FrameStroke:completeAnimation()
				self.FrameStroke:setAlpha( 0 )
				self.FrameStroke:setScale( 5 )
				FrameStrokeFrame2( FrameStroke, {} )
				local DescBackingFrame2 = function ( DescBacking, event )
					local DescBackingFrame3 = function ( DescBacking, event )
						local DescBackingFrame4 = function ( DescBacking, event )
							local DescBackingFrame5 = function ( DescBacking, event )
								if not event.interrupted then
									DescBacking:beginAnimation( "keyframe", 69, false, true, CoD.TweenType.Bounce )
								end
								DescBacking:setAlpha( 0.9 )
								if event.interrupted then
									self.clipFinished( DescBacking, event )
								else
									DescBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								DescBackingFrame5( DescBacking, event )
								return 
							else
								DescBacking:beginAnimation( "keyframe", 69, false, true, CoD.TweenType.Back )
								DescBacking:setAlpha( 0 )
								DescBacking:registerEventHandler( "transition_complete_keyframe", DescBackingFrame5 )
							end
						end
						
						if event.interrupted then
							DescBackingFrame4( DescBacking, event )
							return 
						else
							DescBacking:beginAnimation( "keyframe", 69, false, true, CoD.TweenType.Bounce )
							DescBacking:setAlpha( 0.9 )
							DescBacking:registerEventHandler( "transition_complete_keyframe", DescBackingFrame4 )
						end
					end
					
					if event.interrupted then
						DescBackingFrame3( DescBacking, event )
						return 
					else
						DescBacking:beginAnimation( "keyframe", 680, false, false, CoD.TweenType.Linear )
						DescBacking:registerEventHandler( "transition_complete_keyframe", DescBackingFrame3 )
					end
				end
				
				DescBacking:completeAnimation()
				self.DescBacking:setAlpha( 0 )
				DescBackingFrame2( DescBacking, {} )
				local DescFrame2 = function ( Desc, event )
					local DescFrame3 = function ( Desc, event )
						local DescFrame4 = function ( Desc, event )
							local DescFrame5 = function ( Desc, event )
								if not event.interrupted then
									Desc:beginAnimation( "keyframe", 69, false, true, CoD.TweenType.Bounce )
								end
								Desc:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( Desc, event )
								else
									Desc:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								DescFrame5( Desc, event )
								return 
							else
								Desc:beginAnimation( "keyframe", 69, false, true, CoD.TweenType.Bounce )
								Desc:setAlpha( 0 )
								Desc:registerEventHandler( "transition_complete_keyframe", DescFrame5 )
							end
						end
						
						if event.interrupted then
							DescFrame4( Desc, event )
							return 
						else
							Desc:beginAnimation( "keyframe", 69, false, true, CoD.TweenType.Bounce )
							Desc:setAlpha( 1 )
							Desc:registerEventHandler( "transition_complete_keyframe", DescFrame4 )
						end
					end
					
					if event.interrupted then
						DescFrame3( Desc, event )
						return 
					else
						Desc:beginAnimation( "keyframe", 680, false, false, CoD.TweenType.Linear )
						Desc:registerEventHandler( "transition_complete_keyframe", DescFrame3 )
					end
				end
				
				Desc:completeAnimation()
				self.Desc:setAlpha( 0 )
				DescFrame2( Desc, {} )
				local NotifGlobalTitleLineFrame2 = function ( NotifGlobalTitleLine, event )
					local NotifGlobalTitleLineFrame3 = function ( NotifGlobalTitleLine, event )
						local NotifGlobalTitleLineFrame4 = function ( NotifGlobalTitleLine, event )
							local NotifGlobalTitleLineFrame5 = function ( NotifGlobalTitleLine, event )
								if not event.interrupted then
									NotifGlobalTitleLine:beginAnimation( "keyframe", 69, false, true, CoD.TweenType.Bounce )
								end
								NotifGlobalTitleLine:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( NotifGlobalTitleLine, event )
								else
									NotifGlobalTitleLine:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								NotifGlobalTitleLineFrame5( NotifGlobalTitleLine, event )
								return 
							else
								NotifGlobalTitleLine:beginAnimation( "keyframe", 69, false, true, CoD.TweenType.Bounce )
								NotifGlobalTitleLine:setAlpha( 0 )
								NotifGlobalTitleLine:registerEventHandler( "transition_complete_keyframe", NotifGlobalTitleLineFrame5 )
							end
						end
						
						if event.interrupted then
							NotifGlobalTitleLineFrame4( NotifGlobalTitleLine, event )
							return 
						else
							NotifGlobalTitleLine:beginAnimation( "keyframe", 69, false, true, CoD.TweenType.Bounce )
							NotifGlobalTitleLine:setAlpha( 1 )
							NotifGlobalTitleLine:registerEventHandler( "transition_complete_keyframe", NotifGlobalTitleLineFrame4 )
						end
					end
					
					if event.interrupted then
						NotifGlobalTitleLineFrame3( NotifGlobalTitleLine, event )
						return 
					else
						NotifGlobalTitleLine:beginAnimation( "keyframe", 540, false, false, CoD.TweenType.Linear )
						NotifGlobalTitleLine:registerEventHandler( "transition_complete_keyframe", NotifGlobalTitleLineFrame3 )
					end
				end
				
				NotifGlobalTitleLine:completeAnimation()
				self.NotifGlobalTitleLine:setAlpha( 0 )
				NotifGlobalTitleLineFrame2( NotifGlobalTitleLine, {} )
				local NotifGlobalTitleFrame2 = function ( NotifGlobalTitle, event )
					local NotifGlobalTitleFrame3 = function ( NotifGlobalTitle, event )
						local NotifGlobalTitleFrame4 = function ( NotifGlobalTitle, event )
							local NotifGlobalTitleFrame5 = function ( NotifGlobalTitle, event )
								if not event.interrupted then
									NotifGlobalTitle:beginAnimation( "keyframe", 69, false, true, CoD.TweenType.Bounce )
								end
								NotifGlobalTitle:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( NotifGlobalTitle, event )
								else
									NotifGlobalTitle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								NotifGlobalTitleFrame5( NotifGlobalTitle, event )
								return 
							else
								NotifGlobalTitle:beginAnimation( "keyframe", 69, false, true, CoD.TweenType.Bounce )
								NotifGlobalTitle:setAlpha( 0 )
								NotifGlobalTitle:registerEventHandler( "transition_complete_keyframe", NotifGlobalTitleFrame5 )
							end
						end
						
						if event.interrupted then
							NotifGlobalTitleFrame4( NotifGlobalTitle, event )
							return 
						else
							NotifGlobalTitle:beginAnimation( "keyframe", 69, false, true, CoD.TweenType.Bounce )
							NotifGlobalTitle:setAlpha( 1 )
							NotifGlobalTitle:registerEventHandler( "transition_complete_keyframe", NotifGlobalTitleFrame4 )
						end
					end
					
					if event.interrupted then
						NotifGlobalTitleFrame3( NotifGlobalTitle, event )
						return 
					else
						NotifGlobalTitle:beginAnimation( "keyframe", 540, false, false, CoD.TweenType.Linear )
						NotifGlobalTitle:registerEventHandler( "transition_complete_keyframe", NotifGlobalTitleFrame3 )
					end
				end
				
				NotifGlobalTitle:completeAnimation()
				self.NotifGlobalTitle:setAlpha( 0 )
				NotifGlobalTitleFrame2( NotifGlobalTitle, {} )
				local highlightFrame2 = function ( highlight, event )
					local highlightFrame3 = function ( highlight, event )
						local highlightFrame4 = function ( highlight, event )
							local highlightFrame5 = function ( highlight, event )
								if not event.interrupted then
									highlight:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
								end
								highlight:setAlpha( 0.2 )
								highlight:setZRot( 360 )
								highlight:setScale( 1 )
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
								highlight:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
								highlight:setAlpha( 0.53 )
								highlight:setZRot( 240 )
								highlight:setScale( 2 )
								highlight:registerEventHandler( "transition_complete_keyframe", highlightFrame5 )
							end
						end
						
						if event.interrupted then
							highlightFrame4( highlight, event )
							return 
						else
							highlight:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							highlight:setAlpha( 1 )
							highlight:setZRot( 72 )
							highlight:setScale( 1.3 )
							highlight:registerEventHandler( "transition_complete_keyframe", highlightFrame4 )
						end
					end
					
					if event.interrupted then
						highlightFrame3( highlight, event )
						return 
					else
						highlight:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
						highlight:registerEventHandler( "transition_complete_keyframe", highlightFrame3 )
					end
				end
				
				highlight:completeAnimation()
				self.highlight:setAlpha( 0 )
				self.highlight:setZRot( 0 )
				self.highlight:setScale( 1 )
				highlightFrame2( highlight, {} )
				local imageGFrame2 = function ( imageG, event )
					local imageGFrame3 = function ( imageG, event )
						local imageGFrame4 = function ( imageG, event )
							if not event.interrupted then
								imageG:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Linear )
							end
							imageG:setLeftRight( false, false, -54, 54 )
							imageG:setTopBottom( true, false, 26, 134 )
							imageG:setAlpha( 1 )
							imageG:setScale( 1 )
							imageG:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
							imageG:setShaderVector( 0, 2, 0, 0, 0 )
							imageG:setShaderVector( 1, 1, 0, 0, 0 )
							imageG:setShaderVector( 2, 0.02, 0, 0, 0 )
							if event.interrupted then
								self.clipFinished( imageG, event )
							else
								imageG:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							imageGFrame4( imageG, event )
							return 
						else
							imageG:beginAnimation( "keyframe", 90, false, true, CoD.TweenType.Linear )
							imageG:setLeftRight( false, false, 9.16, 117.16 )
							imageG:setAlpha( 1 )
							imageG:setScale( 2.05 )
							imageG:registerEventHandler( "transition_complete_keyframe", imageGFrame4 )
						end
					end
					
					if event.interrupted then
						imageGFrame3( imageG, event )
						return 
					else
						imageG:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
						imageG:registerEventHandler( "transition_complete_keyframe", imageGFrame3 )
					end
				end
				
				imageG:completeAnimation()
				self.imageG:setLeftRight( false, false, 66, 174 )
				self.imageG:setTopBottom( true, false, 26, 134 )
				self.imageG:setAlpha( 0 )
				self.imageG:setScale( 3 )
				self.imageG:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
				self.imageG:setShaderVector( 0, 2, 0, 0, 0 )
				self.imageG:setShaderVector( 1, 1, 0, 0, 0 )
				self.imageG:setShaderVector( 2, 0.02, 0, 0, 0 )
				imageGFrame2( imageG, {} )
				local imageRFrame2 = function ( imageR, event )
					local imageRFrame3 = function ( imageR, event )
						local imageRFrame4 = function ( imageR, event )
							if not event.interrupted then
								imageR:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Linear )
							end
							imageR:setLeftRight( false, false, -54, 54 )
							imageR:setTopBottom( true, false, 26, 134 )
							imageR:setAlpha( 1 )
							imageR:setScale( 1 )
							imageR:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
							imageR:setShaderVector( 0, 2, 0, 0, 0 )
							imageR:setShaderVector( 1, 1, 0, 0, 0 )
							imageR:setShaderVector( 2, 0.02, 0, 0, 0 )
							if event.interrupted then
								self.clipFinished( imageR, event )
							else
								imageR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							imageRFrame4( imageR, event )
							return 
						else
							imageR:beginAnimation( "keyframe", 90, false, true, CoD.TweenType.Linear )
							imageR:setLeftRight( false, false, -117.16, -9.16 )
							imageR:setAlpha( 1 )
							imageR:setScale( 2.05 )
							imageR:registerEventHandler( "transition_complete_keyframe", imageRFrame4 )
						end
					end
					
					if event.interrupted then
						imageRFrame3( imageR, event )
						return 
					else
						imageR:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
						imageR:registerEventHandler( "transition_complete_keyframe", imageRFrame3 )
					end
				end
				
				imageR:completeAnimation()
				self.imageR:setLeftRight( false, false, -174, -66 )
				self.imageR:setTopBottom( true, false, 26, 134 )
				self.imageR:setAlpha( 0 )
				self.imageR:setScale( 3 )
				self.imageR:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
				self.imageR:setShaderVector( 0, 2, 0, 0, 0 )
				self.imageR:setShaderVector( 1, 1, 0, 0, 0 )
				self.imageR:setShaderVector( 2, 0.02, 0, 0, 0 )
				imageRFrame2( imageR, {} )
				local imageFrame2 = function ( image, event )
					local imageFrame3 = function ( image, event )
						local imageFrame4 = function ( image, event )
							if not event.interrupted then
								image:beginAnimation( "keyframe", 49, false, true, CoD.TweenType.Linear )
							end
							image:setAlpha( 1 )
							image:setScale( 1 )
							if event.interrupted then
								self.clipFinished( image, event )
							else
								image:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							imageFrame4( image, event )
							return 
						else
							image:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Linear )
							image:setAlpha( 0.7 )
							image:setScale( 1.3 )
							image:registerEventHandler( "transition_complete_keyframe", imageFrame4 )
						end
					end
					
					if event.interrupted then
						imageFrame3( image, event )
						return 
					else
						image:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
						image:registerEventHandler( "transition_complete_keyframe", imageFrame3 )
					end
				end
				
				image:completeAnimation()
				self.image:setAlpha( 0 )
				self.image:setScale( 0 )
				imageFrame2( image, {} )
				levelUpSound:completeAnimation()
				self.levelUpSound:playSound( "weapon_level_up", controller )
				self.clipFinished( levelUpSound, {} )
			end,
			TimeUp = function ()
				self:setupElementClipCounter( 14 )
				local NotificationWeeklyDailyWidgetFrame2 = function ( NotificationWeeklyDailyWidget, event )
					local NotificationWeeklyDailyWidgetFrame3 = function ( NotificationWeeklyDailyWidget, event )
						local NotificationWeeklyDailyWidgetFrame4 = function ( NotificationWeeklyDailyWidget, event )
							local NotificationWeeklyDailyWidgetFrame5 = function ( NotificationWeeklyDailyWidget, event )
								if not event.interrupted then
									NotificationWeeklyDailyWidget:beginAnimation( "keyframe", 59, true, true, CoD.TweenType.Bounce )
								end
								NotificationWeeklyDailyWidget:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( NotificationWeeklyDailyWidget, event )
								else
									NotificationWeeklyDailyWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								NotificationWeeklyDailyWidgetFrame5( NotificationWeeklyDailyWidget, event )
								return 
							else
								NotificationWeeklyDailyWidget:beginAnimation( "keyframe", 60, true, true, CoD.TweenType.Bounce )
								NotificationWeeklyDailyWidget:setAlpha( 1 )
								NotificationWeeklyDailyWidget:registerEventHandler( "transition_complete_keyframe", NotificationWeeklyDailyWidgetFrame5 )
							end
						end
						
						if event.interrupted then
							NotificationWeeklyDailyWidgetFrame4( NotificationWeeklyDailyWidget, event )
							return 
						else
							NotificationWeeklyDailyWidget:beginAnimation( "keyframe", 59, true, true, CoD.TweenType.Bounce )
							NotificationWeeklyDailyWidget:setAlpha( 0 )
							NotificationWeeklyDailyWidget:registerEventHandler( "transition_complete_keyframe", NotificationWeeklyDailyWidgetFrame4 )
						end
					end
					
					if event.interrupted then
						NotificationWeeklyDailyWidgetFrame3( NotificationWeeklyDailyWidget, event )
						return 
					else
						NotificationWeeklyDailyWidget:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						NotificationWeeklyDailyWidget:registerEventHandler( "transition_complete_keyframe", NotificationWeeklyDailyWidgetFrame3 )
					end
				end
				
				NotificationWeeklyDailyWidget:completeAnimation()
				self.NotificationWeeklyDailyWidget:setAlpha( 1 )
				NotificationWeeklyDailyWidgetFrame2( NotificationWeeklyDailyWidget, {} )
				local CenterShadowFrame2 = function ( CenterShadow, event )
					local CenterShadowFrame3 = function ( CenterShadow, event )
						local CenterShadowFrame4 = function ( CenterShadow, event )
							local CenterShadowFrame5 = function ( CenterShadow, event )
								if not event.interrupted then
									CenterShadow:beginAnimation( "keyframe", 59, false, true, CoD.TweenType.Bounce )
								end
								CenterShadow:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( CenterShadow, event )
								else
									CenterShadow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								CenterShadowFrame5( CenterShadow, event )
								return 
							else
								CenterShadow:beginAnimation( "keyframe", 50, false, true, CoD.TweenType.Bounce )
								CenterShadow:registerEventHandler( "transition_complete_keyframe", CenterShadowFrame5 )
							end
						end
						
						if event.interrupted then
							CenterShadowFrame4( CenterShadow, event )
							return 
						else
							CenterShadow:beginAnimation( "keyframe", 60, false, true, CoD.TweenType.Bounce )
							CenterShadow:setAlpha( 0 )
							CenterShadow:registerEventHandler( "transition_complete_keyframe", CenterShadowFrame4 )
						end
					end
					
					if event.interrupted then
						CenterShadowFrame3( CenterShadow, event )
						return 
					else
						CenterShadow:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						CenterShadow:registerEventHandler( "transition_complete_keyframe", CenterShadowFrame3 )
					end
				end
				
				CenterShadow:completeAnimation()
				self.CenterShadow:setAlpha( 0.5 )
				CenterShadowFrame2( CenterShadow, {} )
				local CenterBackingFrame2 = function ( CenterBacking, event )
					local CenterBackingFrame3 = function ( CenterBacking, event )
						local CenterBackingFrame4 = function ( CenterBacking, event )
							local CenterBackingFrame5 = function ( CenterBacking, event )
								if not event.interrupted then
									CenterBacking:beginAnimation( "keyframe", 59, false, true, CoD.TweenType.Bounce )
								end
								CenterBacking:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( CenterBacking, event )
								else
									CenterBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								CenterBackingFrame5( CenterBacking, event )
								return 
							else
								CenterBacking:beginAnimation( "keyframe", 50, false, true, CoD.TweenType.Bounce )
								CenterBacking:registerEventHandler( "transition_complete_keyframe", CenterBackingFrame5 )
							end
						end
						
						if event.interrupted then
							CenterBackingFrame4( CenterBacking, event )
							return 
						else
							CenterBacking:beginAnimation( "keyframe", 60, false, true, CoD.TweenType.Bounce )
							CenterBacking:setAlpha( 0 )
							CenterBacking:registerEventHandler( "transition_complete_keyframe", CenterBackingFrame4 )
						end
					end
					
					if event.interrupted then
						CenterBackingFrame3( CenterBacking, event )
						return 
					else
						CenterBacking:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						CenterBacking:registerEventHandler( "transition_complete_keyframe", CenterBackingFrame3 )
					end
				end
				
				CenterBacking:completeAnimation()
				self.CenterBacking:setAlpha( 0.4 )
				CenterBackingFrame2( CenterBacking, {} )
				local FrameFillFrame2 = function ( FrameFill, event )
					local FrameFillFrame3 = function ( FrameFill, event )
						local FrameFillFrame4 = function ( FrameFill, event )
							local FrameFillFrame5 = function ( FrameFill, event )
								if not event.interrupted then
									FrameFill:beginAnimation( "keyframe", 50, false, true, CoD.TweenType.Bounce )
								end
								FrameFill:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( FrameFill, event )
								else
									FrameFill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								FrameFillFrame5( FrameFill, event )
								return 
							else
								FrameFill:beginAnimation( "keyframe", 60, false, true, CoD.TweenType.Bounce )
								FrameFill:setAlpha( 0.3 )
								FrameFill:registerEventHandler( "transition_complete_keyframe", FrameFillFrame5 )
							end
						end
						
						if event.interrupted then
							FrameFillFrame4( FrameFill, event )
							return 
						else
							FrameFill:beginAnimation( "keyframe", 69, false, true, CoD.TweenType.Bounce )
							FrameFill:setAlpha( 0 )
							FrameFill:registerEventHandler( "transition_complete_keyframe", FrameFillFrame4 )
						end
					end
					
					if event.interrupted then
						FrameFillFrame3( FrameFill, event )
						return 
					else
						FrameFill:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
						FrameFill:registerEventHandler( "transition_complete_keyframe", FrameFillFrame3 )
					end
				end
				
				FrameFill:completeAnimation()
				self.FrameFill:setAlpha( 0.3 )
				FrameFillFrame2( FrameFill, {} )
				local FrameNotchesFrame2 = function ( FrameNotches, event )
					local FrameNotchesFrame3 = function ( FrameNotches, event )
						local FrameNotchesFrame4 = function ( FrameNotches, event )
							local FrameNotchesFrame5 = function ( FrameNotches, event )
								if not event.interrupted then
									FrameNotches:beginAnimation( "keyframe", 50, false, true, CoD.TweenType.Bounce )
								end
								FrameNotches:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( FrameNotches, event )
								else
									FrameNotches:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								FrameNotchesFrame5( FrameNotches, event )
								return 
							else
								FrameNotches:beginAnimation( "keyframe", 60, false, true, CoD.TweenType.Bounce )
								FrameNotches:setAlpha( 0.4 )
								FrameNotches:registerEventHandler( "transition_complete_keyframe", FrameNotchesFrame5 )
							end
						end
						
						if event.interrupted then
							FrameNotchesFrame4( FrameNotches, event )
							return 
						else
							FrameNotches:beginAnimation( "keyframe", 69, false, true, CoD.TweenType.Bounce )
							FrameNotches:setAlpha( 0 )
							FrameNotches:registerEventHandler( "transition_complete_keyframe", FrameNotchesFrame4 )
						end
					end
					
					if event.interrupted then
						FrameNotchesFrame3( FrameNotches, event )
						return 
					else
						FrameNotches:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
						FrameNotches:registerEventHandler( "transition_complete_keyframe", FrameNotchesFrame3 )
					end
				end
				
				FrameNotches:completeAnimation()
				self.FrameNotches:setAlpha( 0.4 )
				FrameNotchesFrame2( FrameNotches, {} )
				local FrameStrokeFrame2 = function ( FrameStroke, event )
					local FrameStrokeFrame3 = function ( FrameStroke, event )
						local FrameStrokeFrame4 = function ( FrameStroke, event )
							local FrameStrokeFrame5 = function ( FrameStroke, event )
								if not event.interrupted then
									FrameStroke:beginAnimation( "keyframe", 50, false, true, CoD.TweenType.Bounce )
								end
								FrameStroke:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( FrameStroke, event )
								else
									FrameStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								FrameStrokeFrame5( FrameStroke, event )
								return 
							else
								FrameStroke:beginAnimation( "keyframe", 60, false, true, CoD.TweenType.Bounce )
								FrameStroke:setAlpha( 1 )
								FrameStroke:registerEventHandler( "transition_complete_keyframe", FrameStrokeFrame5 )
							end
						end
						
						if event.interrupted then
							FrameStrokeFrame4( FrameStroke, event )
							return 
						else
							FrameStroke:beginAnimation( "keyframe", 69, false, true, CoD.TweenType.Bounce )
							FrameStroke:setAlpha( 0 )
							FrameStroke:registerEventHandler( "transition_complete_keyframe", FrameStrokeFrame4 )
						end
					end
					
					if event.interrupted then
						FrameStrokeFrame3( FrameStroke, event )
						return 
					else
						FrameStroke:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
						FrameStroke:registerEventHandler( "transition_complete_keyframe", FrameStrokeFrame3 )
					end
				end
				
				FrameStroke:completeAnimation()
				self.FrameStroke:setAlpha( 1 )
				FrameStrokeFrame2( FrameStroke, {} )
				local DescBackingFrame2 = function ( DescBacking, event )
					local DescBackingFrame3 = function ( DescBacking, event )
						local DescBackingFrame4 = function ( DescBacking, event )
							if not event.interrupted then
								DescBacking:beginAnimation( "keyframe", 60, false, true, CoD.TweenType.Bounce )
							end
							DescBacking:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( DescBacking, event )
							else
								DescBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							DescBackingFrame4( DescBacking, event )
							return 
						else
							DescBacking:beginAnimation( "keyframe", 59, false, true, CoD.TweenType.Bounce )
							DescBacking:setAlpha( 0.9 )
							DescBacking:registerEventHandler( "transition_complete_keyframe", DescBackingFrame4 )
						end
					end
					
					if event.interrupted then
						DescBackingFrame3( DescBacking, event )
						return 
					else
						DescBacking:beginAnimation( "keyframe", 59, false, true, CoD.TweenType.Bounce )
						DescBacking:setAlpha( 0 )
						DescBacking:registerEventHandler( "transition_complete_keyframe", DescBackingFrame3 )
					end
				end
				
				DescBacking:completeAnimation()
				self.DescBacking:setAlpha( 0.9 )
				DescBackingFrame2( DescBacking, {} )
				local DescFrame2 = function ( Desc, event )
					local DescFrame3 = function ( Desc, event )
						local DescFrame4 = function ( Desc, event )
							if not event.interrupted then
								Desc:beginAnimation( "keyframe", 60, false, true, CoD.TweenType.Bounce )
							end
							Desc:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Desc, event )
							else
								Desc:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							DescFrame4( Desc, event )
							return 
						else
							Desc:beginAnimation( "keyframe", 59, false, true, CoD.TweenType.Bounce )
							Desc:setAlpha( 1 )
							Desc:registerEventHandler( "transition_complete_keyframe", DescFrame4 )
						end
					end
					
					if event.interrupted then
						DescFrame3( Desc, event )
						return 
					else
						Desc:beginAnimation( "keyframe", 59, false, true, CoD.TweenType.Bounce )
						Desc:setAlpha( 0 )
						Desc:registerEventHandler( "transition_complete_keyframe", DescFrame3 )
					end
				end
				
				Desc:completeAnimation()
				self.Desc:setAlpha( 1 )
				DescFrame2( Desc, {} )
				local NotifGlobalTitleLineFrame2 = function ( NotifGlobalTitleLine, event )
					local NotifGlobalTitleLineFrame3 = function ( NotifGlobalTitleLine, event )
						local NotifGlobalTitleLineFrame4 = function ( NotifGlobalTitleLine, event )
							local NotifGlobalTitleLineFrame5 = function ( NotifGlobalTitleLine, event )
								if not event.interrupted then
									NotifGlobalTitleLine:beginAnimation( "keyframe", 59, false, true, CoD.TweenType.Bounce )
								end
								NotifGlobalTitleLine:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( NotifGlobalTitleLine, event )
								else
									NotifGlobalTitleLine:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								NotifGlobalTitleLineFrame5( NotifGlobalTitleLine, event )
								return 
							else
								NotifGlobalTitleLine:beginAnimation( "keyframe", 60, false, true, CoD.TweenType.Bounce )
								NotifGlobalTitleLine:setAlpha( 1 )
								NotifGlobalTitleLine:registerEventHandler( "transition_complete_keyframe", NotifGlobalTitleLineFrame5 )
							end
						end
						
						if event.interrupted then
							NotifGlobalTitleLineFrame4( NotifGlobalTitleLine, event )
							return 
						else
							NotifGlobalTitleLine:beginAnimation( "keyframe", 59, false, true, CoD.TweenType.Bounce )
							NotifGlobalTitleLine:setAlpha( 0 )
							NotifGlobalTitleLine:registerEventHandler( "transition_complete_keyframe", NotifGlobalTitleLineFrame4 )
						end
					end
					
					if event.interrupted then
						NotifGlobalTitleLineFrame3( NotifGlobalTitleLine, event )
						return 
					else
						NotifGlobalTitleLine:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						NotifGlobalTitleLine:registerEventHandler( "transition_complete_keyframe", NotifGlobalTitleLineFrame3 )
					end
				end
				
				NotifGlobalTitleLine:completeAnimation()
				self.NotifGlobalTitleLine:setAlpha( 1 )
				NotifGlobalTitleLineFrame2( NotifGlobalTitleLine, {} )
				local NotifGlobalTitleFrame2 = function ( NotifGlobalTitle, event )
					local NotifGlobalTitleFrame3 = function ( NotifGlobalTitle, event )
						local NotifGlobalTitleFrame4 = function ( NotifGlobalTitle, event )
							local NotifGlobalTitleFrame5 = function ( NotifGlobalTitle, event )
								if not event.interrupted then
									NotifGlobalTitle:beginAnimation( "keyframe", 59, false, true, CoD.TweenType.Bounce )
								end
								NotifGlobalTitle:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( NotifGlobalTitle, event )
								else
									NotifGlobalTitle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								NotifGlobalTitleFrame5( NotifGlobalTitle, event )
								return 
							else
								NotifGlobalTitle:beginAnimation( "keyframe", 60, false, true, CoD.TweenType.Bounce )
								NotifGlobalTitle:setAlpha( 1 )
								NotifGlobalTitle:registerEventHandler( "transition_complete_keyframe", NotifGlobalTitleFrame5 )
							end
						end
						
						if event.interrupted then
							NotifGlobalTitleFrame4( NotifGlobalTitle, event )
							return 
						else
							NotifGlobalTitle:beginAnimation( "keyframe", 59, false, true, CoD.TweenType.Bounce )
							NotifGlobalTitle:setAlpha( 0 )
							NotifGlobalTitle:registerEventHandler( "transition_complete_keyframe", NotifGlobalTitleFrame4 )
						end
					end
					
					if event.interrupted then
						NotifGlobalTitleFrame3( NotifGlobalTitle, event )
						return 
					else
						NotifGlobalTitle:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						NotifGlobalTitle:registerEventHandler( "transition_complete_keyframe", NotifGlobalTitleFrame3 )
					end
				end
				
				NotifGlobalTitle:completeAnimation()
				self.NotifGlobalTitle:setAlpha( 1 )
				NotifGlobalTitleFrame2( NotifGlobalTitle, {} )
				highlight:completeAnimation()
				self.highlight:setAlpha( 0 )
				self.clipFinished( highlight, {} )
				imageG:completeAnimation()
				self.imageG:setAlpha( 0 )
				self.clipFinished( imageG, {} )
				imageR:completeAnimation()
				self.imageR:setAlpha( 0 )
				self.clipFinished( imageR, {} )
				local imageFrame2 = function ( image, event )
					local imageFrame3 = function ( image, event )
						local imageFrame4 = function ( image, event )
							local imageFrame5 = function ( image, event )
								if not event.interrupted then
									image:beginAnimation( "keyframe", 60, false, true, CoD.TweenType.Back )
								end
								image:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( image, event )
								else
									image:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								imageFrame5( image, event )
								return 
							else
								image:beginAnimation( "keyframe", 59, false, true, CoD.TweenType.Bounce )
								image:setAlpha( 1 )
								image:registerEventHandler( "transition_complete_keyframe", imageFrame5 )
							end
						end
						
						if event.interrupted then
							imageFrame4( image, event )
							return 
						else
							image:beginAnimation( "keyframe", 60, false, true, CoD.TweenType.Bounce )
							image:setAlpha( 0 )
							image:registerEventHandler( "transition_complete_keyframe", imageFrame4 )
						end
					end
					
					if event.interrupted then
						imageFrame3( image, event )
						return 
					else
						image:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
						image:registerEventHandler( "transition_complete_keyframe", imageFrame3 )
					end
				end
				
				image:completeAnimation()
				self.image:setAlpha( 1 )
				imageFrame2( image, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.NotificationWeeklyDailyWidget:close()
		element.NotifGlobalTitleLine:close()
		element.NotifGlobalTitle:close()
		element.FrameFill:close()
		element.FrameStroke:close()
		element.Desc:close()
		element.highlight:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

