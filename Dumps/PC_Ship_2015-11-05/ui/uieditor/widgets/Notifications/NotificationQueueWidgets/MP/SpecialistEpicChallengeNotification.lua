require( "ui.uieditor.widgets.Notifications.Global.Notif_Global_TitleLine" )
require( "ui.uieditor.widgets.Notifications.Global.Notif_Global_Title" )

CoD.SpecialistEpicChallengeNotification = InheritFrom( LUI.UIElement )
CoD.SpecialistEpicChallengeNotification.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SpecialistEpicChallengeNotification )
	self.id = "SpecialistEpicChallengeNotification"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 348 )
	self:setTopBottom( true, false, 0, 250 )
	
	local CenterShadow = LUI.UIImage.new()
	CenterShadow:setLeftRight( false, false, -104, 104 )
	CenterShadow:setTopBottom( true, false, -31, 177 )
	CenterShadow:setRGB( 0, 0, 0 )
	CenterShadow:setAlpha( 0.6 )
	CenterShadow:setImage( RegisterImage( "uie_t7_hud_notif_specialist_center_shadow" ) )
	self:addElement( CenterShadow )
	self.CenterShadow = CenterShadow
	
	local CenterFill = LUI.UIImage.new()
	CenterFill:setLeftRight( false, false, -104, 104 )
	CenterFill:setTopBottom( true, false, -31, 177 )
	CenterFill:setRGB( 0.16, 0.16, 0.16 )
	CenterFill:setAlpha( 0.4 )
	CenterFill:setImage( RegisterImage( "uie_t7_hud_notif_specialist_center_fill" ) )
	self:addElement( CenterFill )
	self.CenterFill = CenterFill
	
	local SideFill = LUI.UIImage.new()
	SideFill:setLeftRight( false, false, -104, 104 )
	SideFill:setTopBottom( true, false, -31, 177 )
	SideFill:setAlpha( 0.2 )
	SideFill:setImage( RegisterImage( "uie_t7_hud_notif_specialist_side_fill" ) )
	self:addElement( SideFill )
	self.SideFill = SideFill
	
	local SideStroke = LUI.UIImage.new()
	SideStroke:setLeftRight( false, false, -104, 104 )
	SideStroke:setTopBottom( true, false, -31, 177 )
	SideStroke:setImage( RegisterImage( "uie_t7_hud_notif_specialist_side_stroke" ) )
	self:addElement( SideStroke )
	self.SideStroke = SideStroke
	
	local DescBacking = LUI.UIImage.new()
	DescBacking:setLeftRight( false, false, -220.85, 220.85 )
	DescBacking:setTopBottom( true, false, 143, 321 )
	DescBacking:setRGB( 0.16, 0.16, 0.16 )
	DescBacking:setAlpha( 0.9 )
	DescBacking:setImage( RegisterImage( "uie_t7_hud_notif_global_desc_backing" ) )
	self:addElement( DescBacking )
	self.DescBacking = DescBacking
	
	local Desc = LUI.UIText.new()
	Desc:setLeftRight( false, false, -195, 195 )
	Desc:setTopBottom( true, false, 181, 201 )
	Desc:setTTF( "fonts/default.ttf" )
	Desc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Desc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Desc )
	self.Desc = Desc
	
	local NotifGlobalTitleLine = CoD.Notif_Global_TitleLine.new( menu, controller )
	NotifGlobalTitleLine:setLeftRight( false, false, -258, 258 )
	NotifGlobalTitleLine:setTopBottom( true, false, 143, 183 )
	self:addElement( NotifGlobalTitleLine )
	self.NotifGlobalTitleLine = NotifGlobalTitleLine
	
	local NotifGlobalTitle = CoD.Notif_Global_Title.new( menu, controller )
	NotifGlobalTitle:setLeftRight( true, false, 34, 315 )
	NotifGlobalTitle:setTopBottom( true, false, 143, 183 )
	self:addElement( NotifGlobalTitle )
	self.NotifGlobalTitle = NotifGlobalTitle
	
	local highlight = LUI.UIImage.new()
	highlight:setLeftRight( true, false, 115, 233 )
	highlight:setTopBottom( true, false, 0, 118 )
	highlight:setImage( RegisterImage( "uie_t7_hud_notficationhighlight" ) )
	highlight:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( highlight )
	self.highlight = highlight
	
	local imageG = LUI.UIImage.new()
	imageG:setLeftRight( false, false, -60, 68 )
	imageG:setTopBottom( true, false, 1, 129 )
	imageG:setRGB( 0, 0.27, 0.01 )
	imageG:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
	imageG:setShaderVector( 0, 2, 0, 0, 0 )
	imageG:setShaderVector( 1, 1, 0, 0, 0 )
	imageG:setShaderVector( 2, 0.02, 0, 0, 0 )
	self:addElement( imageG )
	self.imageG = imageG
	
	local imageR = LUI.UIImage.new()
	imageR:setLeftRight( false, false, -60, 68 )
	imageR:setTopBottom( true, false, 1, 129 )
	imageR:setRGB( 0.55, 0.09, 0.09 )
	imageR:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
	imageR:setShaderVector( 0, 2, 0, 0, 0 )
	imageR:setShaderVector( 1, 1, 0, 0, 0 )
	imageR:setShaderVector( 2, 0.02, 0, 0, 0 )
	self:addElement( imageR )
	self.imageR = imageR
	
	local NotchPanels = LUI.UIImage.new()
	NotchPanels:setLeftRight( false, false, -104, 104 )
	NotchPanels:setTopBottom( true, false, -31, 177 )
	NotchPanels:setImage( RegisterImage( "uie_t7_hud_notif_specialist_notch_panels" ) )
	self:addElement( NotchPanels )
	self.NotchPanels = NotchPanels
	
	local image = LUI.UIImage.new()
	image:setLeftRight( false, false, -60, 68 )
	image:setTopBottom( true, false, 1, 129 )
	self:addElement( image )
	self.image = image
	
	local levelUpSound = LUI.UIElement.new()
	levelUpSound:setLeftRight( true, false, -48, 0 )
	levelUpSound:setTopBottom( true, false, 0, 48 )
	self:addElement( levelUpSound )
	self.levelUpSound = levelUpSound
	
	local ParticleFX01 = LUI.UIImage.new()
	ParticleFX01:setLeftRight( true, false, 78.5, 270.5 )
	ParticleFX01:setTopBottom( true, false, -59, 181 )
	ParticleFX01:setRGB( 1, 0.76, 0 )
	ParticleFX01:setAlpha( 0 )
	ParticleFX01:setZRot( 90 )
	ParticleFX01:setScale( 0 )
	ParticleFX01:setImage( RegisterImage( "uie_t7_blackmarket_crate_ember" ) )
	ParticleFX01:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ParticleFX01 )
	self.ParticleFX01 = ParticleFX01
	
	self.SideFill:linkToElementModel( self, "color", true, function ( model )
		local color = Engine.GetModelValue( model )
		if color then
			SideFill:setRGB( color )
		end
	end )
	self.SideStroke:linkToElementModel( self, "color", true, function ( model )
		local color = Engine.GetModelValue( model )
		if color then
			SideStroke:setRGB( color )
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
	self.NotifGlobalTitle:linkToElementModel( self, "color", true, function ( model )
		local color = Engine.GetModelValue( model )
		if color then
			NotifGlobalTitle.NotifGlobalTitleBacking:setRGB( color )
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
	self.imageG:linkToElementModel( self, "icon", true, function ( model )
		local icon = Engine.GetModelValue( model )
		if icon then
			imageG:setImage( RegisterImage( icon ) )
		end
	end )
	self.imageR:linkToElementModel( self, "icon", true, function ( model )
		local icon = Engine.GetModelValue( model )
		if icon then
			imageR:setImage( RegisterImage( icon ) )
		end
	end )
	self.NotchPanels:linkToElementModel( self, "color", true, function ( model )
		local color = Engine.GetModelValue( model )
		if color then
			NotchPanels:setRGB( color )
		end
	end )
	self.image:linkToElementModel( self, "icon", true, function ( model )
		local icon = Engine.GetModelValue( model )
		if icon then
			image:setImage( RegisterImage( icon ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 15 )
				local CenterShadowFrame2 = function ( CenterShadow, event )
					local CenterShadowFrame3 = function ( CenterShadow, event )
						if not event.interrupted then
							CenterShadow:beginAnimation( "keyframe", 130, false, false, CoD.TweenType.Linear )
						end
						CenterShadow:setAlpha( 0.6 )
						if event.interrupted then
							self.clipFinished( CenterShadow, event )
						else
							CenterShadow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CenterShadowFrame3( CenterShadow, event )
						return 
					else
						CenterShadow:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						CenterShadow:registerEventHandler( "transition_complete_keyframe", CenterShadowFrame3 )
					end
				end
				
				CenterShadow:completeAnimation()
				self.CenterShadow:setAlpha( 0 )
				CenterShadowFrame2( CenterShadow, {} )
				local CenterFillFrame2 = function ( CenterFill, event )
					if not event.interrupted then
						CenterFill:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					CenterFill:setAlpha( 0.4 )
					CenterFill:setScale( 1 )
					if event.interrupted then
						self.clipFinished( CenterFill, event )
					else
						CenterFill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterFill:completeAnimation()
				self.CenterFill:setAlpha( 0 )
				self.CenterFill:setScale( 5 )
				CenterFillFrame2( CenterFill, {} )
				local SideFillFrame2 = function ( SideFill, event )
					local SideFillFrame3 = function ( SideFill, event )
						if not event.interrupted then
							SideFill:beginAnimation( "keyframe", 220, false, true, CoD.TweenType.Linear )
						end
						SideFill:setAlpha( 0.2 )
						SideFill:setScale( 1 )
						if event.interrupted then
							self.clipFinished( SideFill, event )
						else
							SideFill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						SideFillFrame3( SideFill, event )
						return 
					else
						SideFill:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
						SideFill:registerEventHandler( "transition_complete_keyframe", SideFillFrame3 )
					end
				end
				
				SideFill:completeAnimation()
				self.SideFill:setAlpha( 0 )
				self.SideFill:setScale( 5 )
				SideFillFrame2( SideFill, {} )
				local SideStrokeFrame2 = function ( SideStroke, event )
					local SideStrokeFrame3 = function ( SideStroke, event )
						if not event.interrupted then
							SideStroke:beginAnimation( "keyframe", 219, false, true, CoD.TweenType.Linear )
						end
						SideStroke:setAlpha( 1 )
						SideStroke:setScale( 1 )
						if event.interrupted then
							self.clipFinished( SideStroke, event )
						else
							SideStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						SideStrokeFrame3( SideStroke, event )
						return 
					else
						SideStroke:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
						SideStroke:registerEventHandler( "transition_complete_keyframe", SideStrokeFrame3 )
					end
				end
				
				SideStroke:completeAnimation()
				self.SideStroke:setAlpha( 0 )
				self.SideStroke:setScale( 5 )
				SideStrokeFrame2( SideStroke, {} )
				local DescBackingFrame2 = function ( DescBacking, event )
					local DescBackingFrame3 = function ( DescBacking, event )
						local DescBackingFrame4 = function ( DescBacking, event )
							local DescBackingFrame5 = function ( DescBacking, event )
								if not event.interrupted then
									DescBacking:beginAnimation( "keyframe", 40, false, true, CoD.TweenType.Bounce )
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
								DescBacking:beginAnimation( "keyframe", 19, false, true, CoD.TweenType.Bounce )
								DescBacking:setAlpha( 0 )
								DescBacking:registerEventHandler( "transition_complete_keyframe", DescBackingFrame5 )
							end
						end
						
						if event.interrupted then
							DescBackingFrame4( DescBacking, event )
							return 
						else
							DescBacking:beginAnimation( "keyframe", 29, false, true, CoD.TweenType.Bounce )
							DescBacking:setAlpha( 0.9 )
							DescBacking:registerEventHandler( "transition_complete_keyframe", DescBackingFrame4 )
						end
					end
					
					if event.interrupted then
						DescBackingFrame3( DescBacking, event )
						return 
					else
						DescBacking:beginAnimation( "keyframe", 540, false, false, CoD.TweenType.Linear )
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
									Desc:beginAnimation( "keyframe", 40, false, true, CoD.TweenType.Bounce )
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
								Desc:beginAnimation( "keyframe", 19, false, true, CoD.TweenType.Bounce )
								Desc:setAlpha( 0 )
								Desc:registerEventHandler( "transition_complete_keyframe", DescFrame5 )
							end
						end
						
						if event.interrupted then
							DescFrame4( Desc, event )
							return 
						else
							Desc:beginAnimation( "keyframe", 29, false, true, CoD.TweenType.Bounce )
							Desc:setAlpha( 1 )
							Desc:registerEventHandler( "transition_complete_keyframe", DescFrame4 )
						end
					end
					
					if event.interrupted then
						DescFrame3( Desc, event )
						return 
					else
						Desc:beginAnimation( "keyframe", 540, false, false, CoD.TweenType.Linear )
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
									NotifGlobalTitleLine:beginAnimation( "keyframe", 20, false, true, CoD.TweenType.Bounce )
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
								NotifGlobalTitleLine:beginAnimation( "keyframe", 29, false, true, CoD.TweenType.Bounce )
								NotifGlobalTitleLine:setAlpha( 0 )
								NotifGlobalTitleLine:registerEventHandler( "transition_complete_keyframe", NotifGlobalTitleLineFrame5 )
							end
						end
						
						if event.interrupted then
							NotifGlobalTitleLineFrame4( NotifGlobalTitleLine, event )
							return 
						else
							NotifGlobalTitleLine:beginAnimation( "keyframe", 50, false, true, CoD.TweenType.Bounce )
							NotifGlobalTitleLine:setAlpha( 1 )
							NotifGlobalTitleLine:registerEventHandler( "transition_complete_keyframe", NotifGlobalTitleLineFrame4 )
						end
					end
					
					if event.interrupted then
						NotifGlobalTitleLineFrame3( NotifGlobalTitleLine, event )
						return 
					else
						NotifGlobalTitleLine:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
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
								local NotifGlobalTitleFrame6 = function ( NotifGlobalTitle, event )
									if not event.interrupted then
										NotifGlobalTitle:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
									end
									NotifGlobalTitle:setAlpha( 1 )
									if event.interrupted then
										self.clipFinished( NotifGlobalTitle, event )
									else
										NotifGlobalTitle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									NotifGlobalTitleFrame6( NotifGlobalTitle, event )
									return 
								else
									NotifGlobalTitle:beginAnimation( "keyframe", 20, false, true, CoD.TweenType.Bounce )
									NotifGlobalTitle:setAlpha( 1 )
									NotifGlobalTitle:registerEventHandler( "transition_complete_keyframe", NotifGlobalTitleFrame6 )
								end
							end
							
							if event.interrupted then
								NotifGlobalTitleFrame5( NotifGlobalTitle, event )
								return 
							else
								NotifGlobalTitle:beginAnimation( "keyframe", 29, false, true, CoD.TweenType.Bounce )
								NotifGlobalTitle:setAlpha( 0 )
								NotifGlobalTitle:registerEventHandler( "transition_complete_keyframe", NotifGlobalTitleFrame5 )
							end
						end
						
						if event.interrupted then
							NotifGlobalTitleFrame4( NotifGlobalTitle, event )
							return 
						else
							NotifGlobalTitle:beginAnimation( "keyframe", 50, false, true, CoD.TweenType.Bounce )
							NotifGlobalTitle:setAlpha( 1 )
							NotifGlobalTitle:registerEventHandler( "transition_complete_keyframe", NotifGlobalTitleFrame4 )
						end
					end
					
					if event.interrupted then
						NotifGlobalTitleFrame3( NotifGlobalTitle, event )
						return 
					else
						NotifGlobalTitle:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
						NotifGlobalTitle:registerEventHandler( "transition_complete_keyframe", NotifGlobalTitleFrame3 )
					end
				end
				
				NotifGlobalTitle:completeAnimation()
				self.NotifGlobalTitle:setAlpha( 0 )
				NotifGlobalTitleFrame2( NotifGlobalTitle, {} )
				local highlightFrame2 = function ( highlight, event )
					local highlightFrame3 = function ( highlight, event )
						local highlightFrame4 = function ( highlight, event )
							if not event.interrupted then
								highlight:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
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
							highlightFrame4( highlight, event )
							return 
						else
							highlight:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							highlight:setAlpha( 1 )
							highlight:setZRot( 102.86 )
							highlight:setScale( 3 )
							highlight:registerEventHandler( "transition_complete_keyframe", highlightFrame4 )
						end
					end
					
					if event.interrupted then
						highlightFrame3( highlight, event )
						return 
					else
						highlight:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
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
								imageG:beginAnimation( "keyframe", 109, false, true, CoD.TweenType.Bounce )
							end
							imageG:setLeftRight( false, false, -60, 68 )
							imageG:setTopBottom( true, false, 1, 129 )
							imageG:setAlpha( 1 )
							imageG:setScale( 1 )
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
							imageG:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							imageG:setLeftRight( false, false, -40.91, 87.09 )
							imageG:setAlpha( 1 )
							imageG:setScale( 1.52 )
							imageG:registerEventHandler( "transition_complete_keyframe", imageGFrame4 )
						end
					end
					
					if event.interrupted then
						imageGFrame3( imageG, event )
						return 
					else
						imageG:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
						imageG:registerEventHandler( "transition_complete_keyframe", imageGFrame3 )
					end
				end
				
				imageG:completeAnimation()
				self.imageG:setLeftRight( false, false, 13, 141 )
				self.imageG:setTopBottom( true, false, 1, 129 )
				self.imageG:setAlpha( 0 )
				self.imageG:setScale( 3 )
				imageGFrame2( imageG, {} )
				local imageRFrame2 = function ( imageR, event )
					local imageRFrame3 = function ( imageR, event )
						local imageRFrame4 = function ( imageR, event )
							if not event.interrupted then
								imageR:beginAnimation( "keyframe", 109, false, true, CoD.TweenType.Bounce )
							end
							imageR:setLeftRight( false, false, -60, 68 )
							imageR:setTopBottom( true, false, 1, 129 )
							imageR:setAlpha( 1 )
							imageR:setScale( 1 )
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
							imageR:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							imageR:setLeftRight( false, false, -80.92, 47.08 )
							imageR:setAlpha( 1 )
							imageR:setScale( 1.52 )
							imageR:registerEventHandler( "transition_complete_keyframe", imageRFrame4 )
						end
					end
					
					if event.interrupted then
						imageRFrame3( imageR, event )
						return 
					else
						imageR:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
						imageR:registerEventHandler( "transition_complete_keyframe", imageRFrame3 )
					end
				end
				
				imageR:completeAnimation()
				self.imageR:setLeftRight( false, false, -140, -12 )
				self.imageR:setTopBottom( true, false, 1, 129 )
				self.imageR:setAlpha( 0 )
				self.imageR:setScale( 3 )
				imageRFrame2( imageR, {} )
				local NotchPanelsFrame2 = function ( NotchPanels, event )
					local NotchPanelsFrame3 = function ( NotchPanels, event )
						local NotchPanelsFrame4 = function ( NotchPanels, event )
							if not event.interrupted then
								NotchPanels:beginAnimation( "keyframe", 60, false, true, CoD.TweenType.Bounce )
							end
							NotchPanels:setAlpha( 1 )
							NotchPanels:setScale( 1 )
							if event.interrupted then
								self.clipFinished( NotchPanels, event )
							else
								NotchPanels:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							NotchPanelsFrame4( NotchPanels, event )
							return 
						else
							NotchPanels:beginAnimation( "keyframe", 189, false, true, CoD.TweenType.Bounce )
							NotchPanels:setAlpha( 1 )
							NotchPanels:setScale( 1.2 )
							NotchPanels:registerEventHandler( "transition_complete_keyframe", NotchPanelsFrame4 )
						end
					end
					
					if event.interrupted then
						NotchPanelsFrame3( NotchPanels, event )
						return 
					else
						NotchPanels:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						NotchPanels:registerEventHandler( "transition_complete_keyframe", NotchPanelsFrame3 )
					end
				end
				
				NotchPanels:completeAnimation()
				self.NotchPanels:setAlpha( 0 )
				self.NotchPanels:setScale( 0.1 )
				NotchPanelsFrame2( NotchPanels, {} )
				local imageFrame2 = function ( image, event )
					local imageFrame3 = function ( image, event )
						if not event.interrupted then
							image:beginAnimation( "keyframe", 60, false, true, CoD.TweenType.Linear )
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
						imageFrame3( image, event )
						return 
					else
						image:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
						image:registerEventHandler( "transition_complete_keyframe", imageFrame3 )
					end
				end
				
				image:completeAnimation()
				self.image:setAlpha( 0 )
				self.image:setScale( 1 )
				imageFrame2( image, {} )
				levelUpSound:completeAnimation()
				self.levelUpSound:setPlaySoundDirect( true )
				self.levelUpSound:playSound( "mpl_notification_tier_up", controller )
				self.clipFinished( levelUpSound, {} )
				local ParticleFX01Frame2 = function ( ParticleFX01, event )
					local ParticleFX01Frame3 = function ( ParticleFX01, event )
						if not event.interrupted then
							ParticleFX01:beginAnimation( "keyframe", 229, false, false, CoD.TweenType.Linear )
						end
						ParticleFX01:setAlpha( 0 )
						ParticleFX01:setScale( 1.15 )
						if event.interrupted then
							self.clipFinished( ParticleFX01, event )
						else
							ParticleFX01:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ParticleFX01Frame3( ParticleFX01, event )
						return 
					else
						ParticleFX01:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						ParticleFX01:setAlpha( 1 )
						ParticleFX01:registerEventHandler( "transition_complete_keyframe", ParticleFX01Frame3 )
					end
				end
				
				ParticleFX01:completeAnimation()
				self.ParticleFX01:setAlpha( 0 )
				self.ParticleFX01:setScale( 0 )
				ParticleFX01Frame2( ParticleFX01, {} )
			end,
			TimeUp = function ()
				self:setupElementClipCounter( 13 )
				local f56_local0 = function ( f57_arg0, f57_arg1 )
					if not f57_arg1.interrupted then
						f57_arg0:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					f57_arg0:setAlpha( 0 )
					if f57_arg1.interrupted then
						self.clipFinished( f57_arg0, f57_arg1 )
					else
						f57_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterShadow:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				CenterShadow:setAlpha( 0.6 )
				CenterShadow:registerEventHandler( "transition_complete_keyframe", f56_local0 )
				local f56_local1 = function ( f58_arg0, f58_arg1 )
					local f58_local0 = function ( f59_arg0, f59_arg1 )
						local f59_local0 = function ( f60_arg0, f60_arg1 )
							if not f60_arg1.interrupted then
								f60_arg0:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
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
							f59_arg0:beginAnimation( "keyframe", 40, false, true, CoD.TweenType.Bounce )
							f59_arg0:registerEventHandler( "transition_complete_keyframe", f59_local0 )
						end
					end
					
					if f58_arg1.interrupted then
						f58_local0( f58_arg0, f58_arg1 )
						return 
					else
						f58_arg0:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
						f58_arg0:registerEventHandler( "transition_complete_keyframe", f58_local0 )
					end
				end
				
				CenterFill:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				CenterFill:setAlpha( 0.4 )
				CenterFill:registerEventHandler( "transition_complete_keyframe", f56_local1 )
				local f56_local2 = function ( f61_arg0, f61_arg1 )
					local f61_local0 = function ( f62_arg0, f62_arg1 )
						local f62_local0 = function ( f63_arg0, f63_arg1 )
							if not f63_arg1.interrupted then
								f63_arg0:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
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
							f62_arg0:beginAnimation( "keyframe", 40, false, true, CoD.TweenType.Bounce )
							f62_arg0:setAlpha( 0.2 )
							f62_arg0:registerEventHandler( "transition_complete_keyframe", f62_local0 )
						end
					end
					
					if f61_arg1.interrupted then
						f61_local0( f61_arg0, f61_arg1 )
						return 
					else
						f61_arg0:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
						f61_arg0:setAlpha( 0 )
						f61_arg0:registerEventHandler( "transition_complete_keyframe", f61_local0 )
					end
				end
				
				SideFill:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				SideFill:setAlpha( 0.2 )
				SideFill:registerEventHandler( "transition_complete_keyframe", f56_local2 )
				local f56_local3 = function ( f64_arg0, f64_arg1 )
					local f64_local0 = function ( f65_arg0, f65_arg1 )
						local f65_local0 = function ( f66_arg0, f66_arg1 )
							if not f66_arg1.interrupted then
								f66_arg0:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
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
							f65_arg0:beginAnimation( "keyframe", 40, false, true, CoD.TweenType.Bounce )
							f65_arg0:setAlpha( 1 )
							f65_arg0:registerEventHandler( "transition_complete_keyframe", f65_local0 )
						end
					end
					
					if f64_arg1.interrupted then
						f64_local0( f64_arg0, f64_arg1 )
						return 
					else
						f64_arg0:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
						f64_arg0:setAlpha( 0 )
						f64_arg0:registerEventHandler( "transition_complete_keyframe", f64_local0 )
					end
				end
				
				SideStroke:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				SideStroke:setAlpha( 1 )
				SideStroke:registerEventHandler( "transition_complete_keyframe", f56_local3 )
				local DescBackingFrame2 = function ( DescBacking, event )
					local DescBackingFrame3 = function ( DescBacking, event )
						local DescBackingFrame4 = function ( DescBacking, event )
							if not event.interrupted then
								DescBacking:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
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
							DescBacking:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
							DescBacking:setAlpha( 0.9 )
							DescBacking:registerEventHandler( "transition_complete_keyframe", DescBackingFrame4 )
						end
					end
					
					if event.interrupted then
						DescBackingFrame3( DescBacking, event )
						return 
					else
						DescBacking:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
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
								Desc:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
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
							Desc:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
							Desc:setAlpha( 1 )
							Desc:registerEventHandler( "transition_complete_keyframe", DescFrame4 )
						end
					end
					
					if event.interrupted then
						DescFrame3( Desc, event )
						return 
					else
						Desc:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
						Desc:setAlpha( 0 )
						Desc:registerEventHandler( "transition_complete_keyframe", DescFrame3 )
					end
				end
				
				Desc:completeAnimation()
				self.Desc:setAlpha( 1 )
				DescFrame2( Desc, {} )
				local f56_local6 = function ( f73_arg0, f73_arg1 )
					local f73_local0 = function ( f74_arg0, f74_arg1 )
						local f74_local0 = function ( f75_arg0, f75_arg1 )
							if not f75_arg1.interrupted then
								f75_arg0:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
							end
							f75_arg0:setAlpha( 0 )
							if f75_arg1.interrupted then
								self.clipFinished( f75_arg0, f75_arg1 )
							else
								f75_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f74_arg1.interrupted then
							f74_local0( f74_arg0, f74_arg1 )
							return 
						else
							f74_arg0:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
							f74_arg0:setAlpha( 1 )
							f74_arg0:registerEventHandler( "transition_complete_keyframe", f74_local0 )
						end
					end
					
					if f73_arg1.interrupted then
						f73_local0( f73_arg0, f73_arg1 )
						return 
					else
						f73_arg0:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
						f73_arg0:setAlpha( 0 )
						f73_arg0:registerEventHandler( "transition_complete_keyframe", f73_local0 )
					end
				end
				
				NotifGlobalTitleLine:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
				NotifGlobalTitleLine:setAlpha( 1 )
				NotifGlobalTitleLine:registerEventHandler( "transition_complete_keyframe", f56_local6 )
				local f56_local7 = function ( f76_arg0, f76_arg1 )
					local f76_local0 = function ( f77_arg0, f77_arg1 )
						local f77_local0 = function ( f78_arg0, f78_arg1 )
							if not f78_arg1.interrupted then
								f78_arg0:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
							end
							f78_arg0:setAlpha( 0 )
							if f78_arg1.interrupted then
								self.clipFinished( f78_arg0, f78_arg1 )
							else
								f78_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f77_arg1.interrupted then
							f77_local0( f77_arg0, f77_arg1 )
							return 
						else
							f77_arg0:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
							f77_arg0:setAlpha( 1 )
							f77_arg0:registerEventHandler( "transition_complete_keyframe", f77_local0 )
						end
					end
					
					if f76_arg1.interrupted then
						f76_local0( f76_arg0, f76_arg1 )
						return 
					else
						f76_arg0:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
						f76_arg0:setAlpha( 0 )
						f76_arg0:registerEventHandler( "transition_complete_keyframe", f76_local0 )
					end
				end
				
				NotifGlobalTitle:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
				NotifGlobalTitle:setAlpha( 1 )
				NotifGlobalTitle:registerEventHandler( "transition_complete_keyframe", f56_local7 )
				local f56_local8 = function ( f79_arg0, f79_arg1 )
					local f79_local0 = function ( f80_arg0, f80_arg1 )
						local f80_local0 = function ( f81_arg0, f81_arg1 )
							if not f81_arg1.interrupted then
								f81_arg0:beginAnimation( "keyframe", 40, false, true, CoD.TweenType.Bounce )
							end
							f81_arg0:setAlpha( 0 )
							if f81_arg1.interrupted then
								self.clipFinished( f81_arg0, f81_arg1 )
							else
								f81_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f80_arg1.interrupted then
							f80_local0( f80_arg0, f80_arg1 )
							return 
						else
							f80_arg0:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
							f80_arg0:setAlpha( 1 )
							f80_arg0:registerEventHandler( "transition_complete_keyframe", f80_local0 )
						end
					end
					
					if f79_arg1.interrupted then
						f79_local0( f79_arg0, f79_arg1 )
						return 
					else
						f79_arg0:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
						f79_arg0:setAlpha( 0 )
						f79_arg0:registerEventHandler( "transition_complete_keyframe", f79_local0 )
					end
				end
				
				highlight:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
				highlight:setAlpha( 1 )
				highlight:registerEventHandler( "transition_complete_keyframe", f56_local8 )
				imageG:completeAnimation()
				self.imageG:setAlpha( 0 )
				self.clipFinished( imageG, {} )
				imageR:completeAnimation()
				self.imageR:setAlpha( 0 )
				self.clipFinished( imageR, {} )
				local NotchPanelsFrame2 = function ( NotchPanels, event )
					local NotchPanelsFrame3 = function ( NotchPanels, event )
						local NotchPanelsFrame4 = function ( NotchPanels, event )
							local NotchPanelsFrame5 = function ( NotchPanels, event )
								if not event.interrupted then
									NotchPanels:beginAnimation( "keyframe", 40, false, true, CoD.TweenType.Bounce )
								end
								NotchPanels:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( NotchPanels, event )
								else
									NotchPanels:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								NotchPanelsFrame5( NotchPanels, event )
								return 
							else
								NotchPanels:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
								NotchPanels:setAlpha( 1 )
								NotchPanels:registerEventHandler( "transition_complete_keyframe", NotchPanelsFrame5 )
							end
						end
						
						if event.interrupted then
							NotchPanelsFrame4( NotchPanels, event )
							return 
						else
							NotchPanels:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
							NotchPanels:setAlpha( 0 )
							NotchPanels:registerEventHandler( "transition_complete_keyframe", NotchPanelsFrame4 )
						end
					end
					
					if event.interrupted then
						NotchPanelsFrame3( NotchPanels, event )
						return 
					else
						NotchPanels:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						NotchPanels:registerEventHandler( "transition_complete_keyframe", NotchPanelsFrame3 )
					end
				end
				
				NotchPanels:completeAnimation()
				self.NotchPanels:setAlpha( 1 )
				NotchPanelsFrame2( NotchPanels, {} )
				local f56_local10 = function ( f86_arg0, f86_arg1 )
					local f86_local0 = function ( f87_arg0, f87_arg1 )
						local f87_local0 = function ( f88_arg0, f88_arg1 )
							if not f88_arg1.interrupted then
								f88_arg0:beginAnimation( "keyframe", 40, false, true, CoD.TweenType.Bounce )
							end
							f88_arg0:setAlpha( 0 )
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
							f87_arg0:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
							f87_arg0:setAlpha( 1 )
							f87_arg0:registerEventHandler( "transition_complete_keyframe", f87_local0 )
						end
					end
					
					if f86_arg1.interrupted then
						f86_local0( f86_arg0, f86_arg1 )
						return 
					else
						f86_arg0:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
						f86_arg0:setAlpha( 0 )
						f86_arg0:registerEventHandler( "transition_complete_keyframe", f86_local0 )
					end
				end
				
				image:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
				image:setAlpha( 1 )
				image:registerEventHandler( "transition_complete_keyframe", f56_local10 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.NotifGlobalTitleLine:close()
		element.NotifGlobalTitle:close()
		element.SideFill:close()
		element.SideStroke:close()
		element.Desc:close()
		element.highlight:close()
		element.imageG:close()
		element.imageR:close()
		element.NotchPanels:close()
		element.image:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

