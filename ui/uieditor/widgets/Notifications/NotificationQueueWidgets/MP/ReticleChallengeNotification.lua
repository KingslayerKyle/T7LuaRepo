-- 2e99b6447aca679e8dbfec277aa4bb81
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Notifications.Global.Notif_Global_TitleLine" )
require( "ui.uieditor.widgets.Notifications.Global.Notif_Global_Title" )

CoD.ReticleChallengeNotification = InheritFrom( LUI.UIElement )
CoD.ReticleChallengeNotification.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ReticleChallengeNotification )
	self.id = "ReticleChallengeNotification"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 348 )
	self:setTopBottom( true, false, 0, 250 )
	
	local CenterShadow = LUI.UIImage.new()
	CenterShadow:setLeftRight( true, false, 85, 263 )
	CenterShadow:setTopBottom( true, false, -12, 166 )
	CenterShadow:setRGB( 0, 0, 0 )
	CenterShadow:setAlpha( 0.4 )
	CenterShadow:setImage( RegisterImage( "uie_t7_hud_notif_reticle_center_shadow" ) )
	self:addElement( CenterShadow )
	self.CenterShadow = CenterShadow
	
	local CenterBacking = LUI.UIImage.new()
	CenterBacking:setLeftRight( true, false, 85, 263 )
	CenterBacking:setTopBottom( true, false, -12, 166 )
	CenterBacking:setRGB( 0.16, 0.16, 0.16 )
	CenterBacking:setAlpha( 0.4 )
	CenterBacking:setImage( RegisterImage( "uie_t7_hud_notif_reticle_center_backing" ) )
	self:addElement( CenterBacking )
	self.CenterBacking = CenterBacking
	
	local FrameFill = LUI.UIImage.new()
	FrameFill:setLeftRight( true, false, 85, 263 )
	FrameFill:setTopBottom( true, false, -12, 166 )
	FrameFill:setAlpha( 0.2 )
	FrameFill:setImage( RegisterImage( "uie_t7_hud_notif_reticle_frame_fill" ) )
	self:addElement( FrameFill )
	self.FrameFill = FrameFill
	
	local FrameGlow = LUI.UIImage.new()
	FrameGlow:setLeftRight( true, false, 85, 263 )
	FrameGlow:setTopBottom( true, false, -12, 166 )
	FrameGlow:setImage( RegisterImage( "uie_t7_hud_notif_reticle_frame_glow" ) )
	FrameGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( FrameGlow )
	self.FrameGlow = FrameGlow
	
	local FrameNotch = LUI.UIImage.new()
	FrameNotch:setLeftRight( true, false, 85, 263 )
	FrameNotch:setTopBottom( true, false, -12, 166 )
	FrameNotch:setImage( RegisterImage( "uie_t7_hud_notif_reticle_frame_notch" ) )
	self:addElement( FrameNotch )
	self.FrameNotch = FrameNotch
	
	local FrameNotchGlow = LUI.UIImage.new()
	FrameNotchGlow:setLeftRight( true, false, 85, 263 )
	FrameNotchGlow:setTopBottom( true, false, -12, 166 )
	FrameNotchGlow:setImage( RegisterImage( "uie_t7_hud_notif_reticle_frame_notch_glow" ) )
	FrameNotchGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( FrameNotchGlow )
	self.FrameNotchGlow = FrameNotchGlow
	
	local FrameStroke = LUI.UIImage.new()
	FrameStroke:setLeftRight( true, false, 85, 263 )
	FrameStroke:setTopBottom( true, false, -12, 166 )
	FrameStroke:setImage( RegisterImage( "uie_t7_hud_notif_reticle_frame_stroke" ) )
	self:addElement( FrameStroke )
	self.FrameStroke = FrameStroke
	
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
	highlight:setTopBottom( true, false, 18, 136 )
	highlight:setScale( 0 )
	highlight:setImage( RegisterImage( "uie_t7_hud_notficationhighlight" ) )
	highlight:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( highlight )
	self.highlight = highlight
	
	local imageG = LUI.UIImage.new()
	imageG:setLeftRight( false, false, 41, 123 )
	imageG:setTopBottom( true, false, 36, 118 )
	imageG:setRGB( 0, 0.27, 0.01 )
	imageG:setAlpha( 0 )
	imageG:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
	imageG:setShaderVector( 0, 2, 0, 0, 0 )
	imageG:setShaderVector( 1, 1, 0, 0, 0 )
	imageG:setShaderVector( 2, 0.02, 0, 0, 0 )
	self:addElement( imageG )
	self.imageG = imageG
	
	local imageR = LUI.UIImage.new()
	imageR:setLeftRight( false, false, -127, -45 )
	imageR:setTopBottom( true, false, 36, 118 )
	imageR:setRGB( 0.55, 0.09, 0.09 )
	imageR:setAlpha( 0 )
	imageR:setScale( 5 )
	imageR:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
	imageR:setShaderVector( 0, 2, 0, 0, 0 )
	imageR:setShaderVector( 1, 1, 0, 0, 0 )
	imageR:setShaderVector( 2, 0.02, 0, 0, 0 )
	self:addElement( imageR )
	self.imageR = imageR
	
	local image = LUI.UIImage.new()
	image:setLeftRight( false, false, -41, 41 )
	image:setTopBottom( true, false, 36, 118 )
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
	self.FrameGlow:linkToElementModel( self, "color", true, function ( model )
		local color = Engine.GetModelValue( model )
		if color then
			FrameGlow:setRGB( color )
		end
	end )
	self.FrameNotch:linkToElementModel( self, "color", true, function ( model )
		local color = Engine.GetModelValue( model )
		if color then
			FrameNotch:setRGB( color )
		end
	end )
	self.FrameNotchGlow:linkToElementModel( self, "color", true, function ( model )
		local color = Engine.GetModelValue( model )
		if color then
			FrameNotchGlow:setRGB( color )
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
	self.image:linkToElementModel( self, "icon", true, function ( model )
		local icon = Engine.GetModelValue( model )
		if icon then
			image:setImage( RegisterImage( icon ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 16 )
				local CenterShadowFrame2 = function ( CenterShadow, event )
					if not event.interrupted then
						CenterShadow:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
					end
					CenterShadow:setAlpha( 0.4 )
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
						CenterBacking:beginAnimation( "keyframe", 189, false, true, CoD.TweenType.Linear )
					end
					CenterBacking:setAlpha( 0.2 )
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
							FrameFill:beginAnimation( "keyframe", 180, false, true, CoD.TweenType.Linear )
						end
						FrameFill:setAlpha( 0.2 )
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
						FrameFill:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						FrameFill:registerEventHandler( "transition_complete_keyframe", FrameFillFrame3 )
					end
				end
				
				FrameFill:completeAnimation()
				self.FrameFill:setAlpha( 0 )
				self.FrameFill:setScale( 5 )
				FrameFillFrame2( FrameFill, {} )
				local FrameGlowFrame2 = function ( FrameGlow, event )
					local FrameGlowFrame3 = function ( FrameGlow, event )
						if not event.interrupted then
							FrameGlow:beginAnimation( "keyframe", 180, false, true, CoD.TweenType.Linear )
						end
						FrameGlow:setAlpha( 1 )
						FrameGlow:setScale( 1 )
						if event.interrupted then
							self.clipFinished( FrameGlow, event )
						else
							FrameGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FrameGlowFrame3( FrameGlow, event )
						return 
					else
						FrameGlow:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						FrameGlow:registerEventHandler( "transition_complete_keyframe", FrameGlowFrame3 )
					end
				end
				
				FrameGlow:completeAnimation()
				self.FrameGlow:setAlpha( 0 )
				self.FrameGlow:setScale( 5 )
				FrameGlowFrame2( FrameGlow, {} )
				local FrameNotchFrame2 = function ( FrameNotch, event )
					local FrameNotchFrame3 = function ( FrameNotch, event )
						if not event.interrupted then
							FrameNotch:beginAnimation( "keyframe", 159, false, true, CoD.TweenType.Bounce )
						end
						FrameNotch:setAlpha( 1 )
						FrameNotch:setScale( 1 )
						if event.interrupted then
							self.clipFinished( FrameNotch, event )
						else
							FrameNotch:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FrameNotchFrame3( FrameNotch, event )
						return 
					else
						FrameNotch:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
						FrameNotch:registerEventHandler( "transition_complete_keyframe", FrameNotchFrame3 )
					end
				end
				
				FrameNotch:completeAnimation()
				self.FrameNotch:setAlpha( 0 )
				self.FrameNotch:setScale( 5 )
				FrameNotchFrame2( FrameNotch, {} )
				local FrameNotchGlowFrame2 = function ( FrameNotchGlow, event )
					local FrameNotchGlowFrame3 = function ( FrameNotchGlow, event )
						if not event.interrupted then
							FrameNotchGlow:beginAnimation( "keyframe", 159, false, true, CoD.TweenType.Bounce )
						end
						FrameNotchGlow:setAlpha( 1 )
						FrameNotchGlow:setScale( 1 )
						if event.interrupted then
							self.clipFinished( FrameNotchGlow, event )
						else
							FrameNotchGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FrameNotchGlowFrame3( FrameNotchGlow, event )
						return 
					else
						FrameNotchGlow:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
						FrameNotchGlow:setScale( 5 )
						FrameNotchGlow:registerEventHandler( "transition_complete_keyframe", FrameNotchGlowFrame3 )
					end
				end
				
				FrameNotchGlow:completeAnimation()
				self.FrameNotchGlow:setAlpha( 0 )
				self.FrameNotchGlow:setScale( 1 )
				FrameNotchGlowFrame2( FrameNotchGlow, {} )
				local FrameStrokeFrame2 = function ( FrameStroke, event )
					local FrameStrokeFrame3 = function ( FrameStroke, event )
						if not event.interrupted then
							FrameStroke:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Linear )
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
						FrameStroke:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
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
									DescBacking:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
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
								DescBacking:beginAnimation( "keyframe", 40, false, true, CoD.TweenType.Bounce )
								DescBacking:setAlpha( 0 )
								DescBacking:registerEventHandler( "transition_complete_keyframe", DescBackingFrame5 )
							end
						end
						
						if event.interrupted then
							DescBackingFrame4( DescBacking, event )
							return 
						else
							DescBacking:beginAnimation( "keyframe", 50, false, true, CoD.TweenType.Bounce )
							DescBacking:setAlpha( 0.9 )
							DescBacking:registerEventHandler( "transition_complete_keyframe", DescBackingFrame4 )
						end
					end
					
					if event.interrupted then
						DescBackingFrame3( DescBacking, event )
						return 
					else
						DescBacking:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Linear )
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
									Desc:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
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
								Desc:beginAnimation( "keyframe", 40, false, true, CoD.TweenType.Bounce )
								Desc:setAlpha( 0 )
								Desc:registerEventHandler( "transition_complete_keyframe", DescFrame5 )
							end
						end
						
						if event.interrupted then
							DescFrame4( Desc, event )
							return 
						else
							Desc:beginAnimation( "keyframe", 50, false, true, CoD.TweenType.Bounce )
							Desc:setAlpha( 1 )
							Desc:registerEventHandler( "transition_complete_keyframe", DescFrame4 )
						end
					end
					
					if event.interrupted then
						DescFrame3( Desc, event )
						return 
					else
						Desc:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Linear )
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
									NotifGlobalTitleLine:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
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
								NotifGlobalTitleLine:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
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
						NotifGlobalTitleLine:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
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
								NotifGlobalTitleFrame5( NotifGlobalTitle, event )
								return 
							else
								NotifGlobalTitle:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
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
						NotifGlobalTitle:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
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
									highlight:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Linear )
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
								highlight:beginAnimation( "keyframe", 50, false, true, CoD.TweenType.Linear )
								highlight:setAlpha( 0.53 )
								highlight:setZRot( 325.62 )
								highlight:setScale( 1.15 )
								highlight:registerEventHandler( "transition_complete_keyframe", highlightFrame5 )
							end
						end
						
						if event.interrupted then
							highlightFrame4( highlight, event )
							return 
						else
							highlight:beginAnimation( "keyframe", 109, false, true, CoD.TweenType.Linear )
							highlight:setAlpha( 1 )
							highlight:setZRot( 208.16 )
							highlight:setScale( 2 )
							highlight:registerEventHandler( "transition_complete_keyframe", highlightFrame4 )
						end
					end
					
					if event.interrupted then
						highlightFrame3( highlight, event )
						return 
					else
						highlight:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
						highlight:registerEventHandler( "transition_complete_keyframe", highlightFrame3 )
					end
				end
				
				highlight:completeAnimation()
				self.highlight:setAlpha( 0 )
				self.highlight:setZRot( 0 )
				self.highlight:setScale( 0 )
				highlightFrame2( highlight, {} )
				local imageGFrame2 = function ( imageG, event )
					local imageGFrame3 = function ( imageG, event )
						local imageGFrame4 = function ( imageG, event )
							if not event.interrupted then
								imageG:beginAnimation( "keyframe", 109, false, true, CoD.TweenType.Linear )
							end
							imageG:setLeftRight( false, false, -40.5, 41.5 )
							imageG:setTopBottom( true, false, 36, 118 )
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
							imageG:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							imageG:setLeftRight( false, false, 12.24, 94.24 )
							imageG:setAlpha( 1 )
							imageG:setScale( 2.29 )
							imageG:registerEventHandler( "transition_complete_keyframe", imageGFrame4 )
						end
					end
					
					if event.interrupted then
						imageGFrame3( imageG, event )
						return 
					else
						imageG:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
						imageG:setScale( 3 )
						imageG:registerEventHandler( "transition_complete_keyframe", imageGFrame3 )
					end
				end
				
				imageG:completeAnimation()
				self.imageG:setLeftRight( false, false, 41, 123 )
				self.imageG:setTopBottom( true, false, 36, 118 )
				self.imageG:setAlpha( 0 )
				self.imageG:setScale( 0 )
				self.imageG:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
				self.imageG:setShaderVector( 0, 2, 0, 0, 0 )
				self.imageG:setShaderVector( 1, 1, 0, 0, 0 )
				self.imageG:setShaderVector( 2, 0.02, 0, 0, 0 )
				imageGFrame2( imageG, {} )
				local imageRFrame2 = function ( imageR, event )
					local imageRFrame3 = function ( imageR, event )
						local imageRFrame4 = function ( imageR, event )
							if not event.interrupted then
								imageR:beginAnimation( "keyframe", 109, false, true, CoD.TweenType.Linear )
							end
							imageR:setLeftRight( false, false, -41, 41 )
							imageR:setTopBottom( true, false, 36, 118 )
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
							imageR:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							imageR:setLeftRight( false, false, -93.74, -11.74 )
							imageR:setAlpha( 1 )
							imageR:setScale( 2.29 )
							imageR:registerEventHandler( "transition_complete_keyframe", imageRFrame4 )
						end
					end
					
					if event.interrupted then
						imageRFrame3( imageR, event )
						return 
					else
						imageR:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
						imageR:registerEventHandler( "transition_complete_keyframe", imageRFrame3 )
					end
				end
				
				imageR:completeAnimation()
				self.imageR:setLeftRight( false, false, -122.5, -40.5 )
				self.imageR:setTopBottom( true, false, 36, 118 )
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
								image:beginAnimation( "keyframe", 50, false, true, CoD.TweenType.Linear )
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
							image:beginAnimation( "keyframe", 109, false, true, CoD.TweenType.Linear )
							image:setAlpha( 0.78 )
							image:setScale( 1.2 )
							image:registerEventHandler( "transition_complete_keyframe", imageFrame4 )
						end
					end
					
					if event.interrupted then
						imageFrame3( image, event )
						return 
					else
						image:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
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
				self:setupElementClipCounter( 13 )
				local CenterShadowFrame2 = function ( CenterShadow, event )
					if not event.interrupted then
						CenterShadow:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					CenterShadow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( CenterShadow, event )
					else
						CenterShadow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterShadow:completeAnimation()
				self.CenterShadow:setAlpha( 0.4 )
				CenterShadowFrame2( CenterShadow, {} )
				local CenterBackingFrame2 = function ( CenterBacking, event )
					local CenterBackingFrame3 = function ( CenterBacking, event )
						local CenterBackingFrame4 = function ( CenterBacking, event )
							local CenterBackingFrame5 = function ( CenterBacking, event )
								if not event.interrupted then
									CenterBacking:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
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
								CenterBacking:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
								CenterBacking:setAlpha( 0.2 )
								CenterBacking:registerEventHandler( "transition_complete_keyframe", CenterBackingFrame5 )
							end
						end
						
						if event.interrupted then
							CenterBackingFrame4( CenterBacking, event )
							return 
						else
							CenterBacking:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
							CenterBacking:setAlpha( 0 )
							CenterBacking:registerEventHandler( "transition_complete_keyframe", CenterBackingFrame4 )
						end
					end
					
					if event.interrupted then
						CenterBackingFrame3( CenterBacking, event )
						return 
					else
						CenterBacking:beginAnimation( "keyframe", 330, false, false, CoD.TweenType.Linear )
						CenterBacking:registerEventHandler( "transition_complete_keyframe", CenterBackingFrame3 )
					end
				end
				
				CenterBacking:completeAnimation()
				self.CenterBacking:setAlpha( 0.2 )
				CenterBackingFrame2( CenterBacking, {} )
				local FrameFillFrame2 = function ( FrameFill, event )
					local FrameFillFrame3 = function ( FrameFill, event )
						local FrameFillFrame4 = function ( FrameFill, event )
							local FrameFillFrame5 = function ( FrameFill, event )
								if not event.interrupted then
									FrameFill:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
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
								FrameFill:beginAnimation( "keyframe", 40, false, true, CoD.TweenType.Bounce )
								FrameFill:setAlpha( 0.2 )
								FrameFill:registerEventHandler( "transition_complete_keyframe", FrameFillFrame5 )
							end
						end
						
						if event.interrupted then
							FrameFillFrame4( FrameFill, event )
							return 
						else
							FrameFill:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
							FrameFill:setAlpha( 0 )
							FrameFill:registerEventHandler( "transition_complete_keyframe", FrameFillFrame4 )
						end
					end
					
					if event.interrupted then
						FrameFillFrame3( FrameFill, event )
						return 
					else
						FrameFill:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						FrameFill:registerEventHandler( "transition_complete_keyframe", FrameFillFrame3 )
					end
				end
				
				FrameFill:completeAnimation()
				self.FrameFill:setAlpha( 0.2 )
				FrameFillFrame2( FrameFill, {} )
				local FrameGlowFrame2 = function ( FrameGlow, event )
					local FrameGlowFrame3 = function ( FrameGlow, event )
						local FrameGlowFrame4 = function ( FrameGlow, event )
							local FrameGlowFrame5 = function ( FrameGlow, event )
								if not event.interrupted then
									FrameGlow:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
								end
								FrameGlow:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( FrameGlow, event )
								else
									FrameGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								FrameGlowFrame5( FrameGlow, event )
								return 
							else
								FrameGlow:beginAnimation( "keyframe", 40, false, true, CoD.TweenType.Bounce )
								FrameGlow:setAlpha( 1 )
								FrameGlow:registerEventHandler( "transition_complete_keyframe", FrameGlowFrame5 )
							end
						end
						
						if event.interrupted then
							FrameGlowFrame4( FrameGlow, event )
							return 
						else
							FrameGlow:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
							FrameGlow:setAlpha( 0 )
							FrameGlow:registerEventHandler( "transition_complete_keyframe", FrameGlowFrame4 )
						end
					end
					
					if event.interrupted then
						FrameGlowFrame3( FrameGlow, event )
						return 
					else
						FrameGlow:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						FrameGlow:registerEventHandler( "transition_complete_keyframe", FrameGlowFrame3 )
					end
				end
				
				FrameGlow:completeAnimation()
				self.FrameGlow:setAlpha( 1 )
				FrameGlowFrame2( FrameGlow, {} )
				local FrameNotchFrame2 = function ( FrameNotch, event )
					local FrameNotchFrame3 = function ( FrameNotch, event )
						local FrameNotchFrame4 = function ( FrameNotch, event )
							local FrameNotchFrame5 = function ( FrameNotch, event )
								if not event.interrupted then
									FrameNotch:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
								end
								FrameNotch:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( FrameNotch, event )
								else
									FrameNotch:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								FrameNotchFrame5( FrameNotch, event )
								return 
							else
								FrameNotch:beginAnimation( "keyframe", 40, false, true, CoD.TweenType.Bounce )
								FrameNotch:setAlpha( 1 )
								FrameNotch:registerEventHandler( "transition_complete_keyframe", FrameNotchFrame5 )
							end
						end
						
						if event.interrupted then
							FrameNotchFrame4( FrameNotch, event )
							return 
						else
							FrameNotch:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
							FrameNotch:setAlpha( 0 )
							FrameNotch:registerEventHandler( "transition_complete_keyframe", FrameNotchFrame4 )
						end
					end
					
					if event.interrupted then
						FrameNotchFrame3( FrameNotch, event )
						return 
					else
						FrameNotch:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						FrameNotch:registerEventHandler( "transition_complete_keyframe", FrameNotchFrame3 )
					end
				end
				
				FrameNotch:completeAnimation()
				self.FrameNotch:setAlpha( 1 )
				FrameNotchFrame2( FrameNotch, {} )
				local FrameNotchGlowFrame2 = function ( FrameNotchGlow, event )
					local FrameNotchGlowFrame3 = function ( FrameNotchGlow, event )
						local FrameNotchGlowFrame4 = function ( FrameNotchGlow, event )
							local FrameNotchGlowFrame5 = function ( FrameNotchGlow, event )
								if not event.interrupted then
									FrameNotchGlow:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
								end
								FrameNotchGlow:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( FrameNotchGlow, event )
								else
									FrameNotchGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								FrameNotchGlowFrame5( FrameNotchGlow, event )
								return 
							else
								FrameNotchGlow:beginAnimation( "keyframe", 40, false, true, CoD.TweenType.Bounce )
								FrameNotchGlow:setAlpha( 1 )
								FrameNotchGlow:registerEventHandler( "transition_complete_keyframe", FrameNotchGlowFrame5 )
							end
						end
						
						if event.interrupted then
							FrameNotchGlowFrame4( FrameNotchGlow, event )
							return 
						else
							FrameNotchGlow:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
							FrameNotchGlow:setAlpha( 0 )
							FrameNotchGlow:registerEventHandler( "transition_complete_keyframe", FrameNotchGlowFrame4 )
						end
					end
					
					if event.interrupted then
						FrameNotchGlowFrame3( FrameNotchGlow, event )
						return 
					else
						FrameNotchGlow:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						FrameNotchGlow:registerEventHandler( "transition_complete_keyframe", FrameNotchGlowFrame3 )
					end
				end
				
				FrameNotchGlow:completeAnimation()
				self.FrameNotchGlow:setAlpha( 1 )
				FrameNotchGlowFrame2( FrameNotchGlow, {} )
				local FrameStrokeFrame2 = function ( FrameStroke, event )
					local FrameStrokeFrame3 = function ( FrameStroke, event )
						local FrameStrokeFrame4 = function ( FrameStroke, event )
							local FrameStrokeFrame5 = function ( FrameStroke, event )
								if not event.interrupted then
									FrameStroke:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
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
								FrameStroke:beginAnimation( "keyframe", 40, false, true, CoD.TweenType.Bounce )
								FrameStroke:setAlpha( 1 )
								FrameStroke:registerEventHandler( "transition_complete_keyframe", FrameStrokeFrame5 )
							end
						end
						
						if event.interrupted then
							FrameStrokeFrame4( FrameStroke, event )
							return 
						else
							FrameStroke:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
							FrameStroke:setAlpha( 0 )
							FrameStroke:registerEventHandler( "transition_complete_keyframe", FrameStrokeFrame4 )
						end
					end
					
					if event.interrupted then
						FrameStrokeFrame3( FrameStroke, event )
						return 
					else
						FrameStroke:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
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
							DescBacking:beginAnimation( "keyframe", 50, false, true, CoD.TweenType.Bounce )
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
							Desc:beginAnimation( "keyframe", 50, false, true, CoD.TweenType.Bounce )
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
				local NotifGlobalTitleLineFrame2 = function ( NotifGlobalTitleLine, event )
					local NotifGlobalTitleLineFrame3 = function ( NotifGlobalTitleLine, event )
						local NotifGlobalTitleLineFrame4 = function ( NotifGlobalTitleLine, event )
							local NotifGlobalTitleLineFrame5 = function ( NotifGlobalTitleLine, event )
								if not event.interrupted then
									NotifGlobalTitleLine:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
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
								NotifGlobalTitleLine:beginAnimation( "keyframe", 40, false, true, CoD.TweenType.Bounce )
								NotifGlobalTitleLine:setAlpha( 1 )
								NotifGlobalTitleLine:registerEventHandler( "transition_complete_keyframe", NotifGlobalTitleLineFrame5 )
							end
						end
						
						if event.interrupted then
							NotifGlobalTitleLineFrame4( NotifGlobalTitleLine, event )
							return 
						else
							NotifGlobalTitleLine:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
							NotifGlobalTitleLine:setAlpha( 0 )
							NotifGlobalTitleLine:registerEventHandler( "transition_complete_keyframe", NotifGlobalTitleLineFrame4 )
						end
					end
					
					if event.interrupted then
						NotifGlobalTitleLineFrame3( NotifGlobalTitleLine, event )
						return 
					else
						NotifGlobalTitleLine:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
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
									NotifGlobalTitle:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
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
								NotifGlobalTitle:beginAnimation( "keyframe", 40, false, true, CoD.TweenType.Bounce )
								NotifGlobalTitle:setAlpha( 1 )
								NotifGlobalTitle:registerEventHandler( "transition_complete_keyframe", NotifGlobalTitleFrame5 )
							end
						end
						
						if event.interrupted then
							NotifGlobalTitleFrame4( NotifGlobalTitle, event )
							return 
						else
							NotifGlobalTitle:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
							NotifGlobalTitle:setAlpha( 0 )
							NotifGlobalTitle:registerEventHandler( "transition_complete_keyframe", NotifGlobalTitleFrame4 )
						end
					end
					
					if event.interrupted then
						NotifGlobalTitleFrame3( NotifGlobalTitle, event )
						return 
					else
						NotifGlobalTitle:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						NotifGlobalTitle:registerEventHandler( "transition_complete_keyframe", NotifGlobalTitleFrame3 )
					end
				end
				
				NotifGlobalTitle:completeAnimation()
				self.NotifGlobalTitle:setAlpha( 1 )
				NotifGlobalTitleFrame2( NotifGlobalTitle, {} )
				highlight:completeAnimation()
				self.highlight:setAlpha( 0 )
				self.clipFinished( highlight, {} )
				local imageFrame2 = function ( image, event )
					local imageFrame3 = function ( image, event )
						local imageFrame4 = function ( image, event )
							local imageFrame5 = function ( image, event )
								if not event.interrupted then
									image:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
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
								image:beginAnimation( "keyframe", 40, false, true, CoD.TweenType.Bounce )
								image:setAlpha( 1 )
								image:registerEventHandler( "transition_complete_keyframe", imageFrame5 )
							end
						end
						
						if event.interrupted then
							imageFrame4( image, event )
							return 
						else
							image:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
							image:setAlpha( 0 )
							image:registerEventHandler( "transition_complete_keyframe", imageFrame4 )
						end
					end
					
					if event.interrupted then
						imageFrame3( image, event )
						return 
					else
						image:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
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
		element.NotifGlobalTitleLine:close()
		element.NotifGlobalTitle:close()
		element.FrameFill:close()
		element.FrameGlow:close()
		element.FrameNotch:close()
		element.FrameNotchGlow:close()
		element.FrameStroke:close()
		element.Desc:close()
		element.highlight:close()
		element.imageG:close()
		element.imageR:close()
		element.image:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

