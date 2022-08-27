-- 4fc6696c19b9afad748378356613ee90
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_AbilityGlow" )

CoD.AmmoWidget_AbilityRing = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_AbilityRing.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_AbilityRing )
	self.id = "AmmoWidget_AbilityRing"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 120 )
	self:setTopBottom( true, false, 0, 120 )
	
	local ImgRingFill = LUI.UIImage.new()
	ImgRingFill:setLeftRight( true, true, 18, -18 )
	ImgRingFill:setTopBottom( true, true, 18, -18 )
	ImgRingFill:setRGB( 0.79, 0.86, 1 )
	ImgRingFill:setZoom( -10 )
	ImgRingFill:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_ringfill" ) )
	ImgRingFill:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	ImgRingFill:setShaderVector( 1, 0.5, 0, 0, 0 )
	ImgRingFill:setShaderVector( 2, 0.5, 0, 0, 0 )
	ImgRingFill:setShaderVector( 3, 0, 0, 0, 0 )
	ImgRingFill:subscribeToGlobalModel( controller, "PlayerAbilities", "playerGadget3.powerRatio", function ( model )
		local playerGadget3PowerRatio = Engine.GetModelValue( model )
		if playerGadget3PowerRatio then
			ImgRingFill:setShaderVector( 0, CoD.GetVectorComponentFromString( playerGadget3PowerRatio, 1 ), CoD.GetVectorComponentFromString( playerGadget3PowerRatio, 2 ), CoD.GetVectorComponentFromString( playerGadget3PowerRatio, 3 ), CoD.GetVectorComponentFromString( playerGadget3PowerRatio, 4 ) )
		end
	end )
	self:addElement( ImgRingFill )
	self.ImgRingFill = ImgRingFill
	
	local ImgRingPattern = LUI.UIImage.new()
	ImgRingPattern:setLeftRight( true, true, 18, -18 )
	ImgRingPattern:setTopBottom( true, true, 18, -18 )
	ImgRingPattern:setRGB( 0.4, 0.57, 0.9 )
	ImgRingPattern:setAlpha( Multiple( 2, 0 ) )
	ImgRingPattern:setZoom( 6 )
	ImgRingPattern:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_ringpattern" ) )
	ImgRingPattern:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	ImgRingPattern:setShaderVector( 1, 0.5, 0, 0, 0 )
	ImgRingPattern:setShaderVector( 2, 0.5, 0, 0, 0 )
	ImgRingPattern:setShaderVector( 3, 0, 0, 0, 0 )
	ImgRingPattern:subscribeToGlobalModel( controller, "PlayerAbilities", "playerGadget3.powerRatio", function ( model )
		local playerGadget3PowerRatio = Engine.GetModelValue( model )
		if playerGadget3PowerRatio then
			ImgRingPattern:setShaderVector( 0, CoD.GetVectorComponentFromString( playerGadget3PowerRatio, 1 ), CoD.GetVectorComponentFromString( playerGadget3PowerRatio, 2 ), CoD.GetVectorComponentFromString( playerGadget3PowerRatio, 3 ), CoD.GetVectorComponentFromString( playerGadget3PowerRatio, 4 ) )
		end
	end )
	self:addElement( ImgRingPattern )
	self.ImgRingPattern = ImgRingPattern
	
	local ImgRingPatternDuplicate = LUI.UIImage.new()
	ImgRingPatternDuplicate:setLeftRight( true, true, 18, -18 )
	ImgRingPatternDuplicate:setTopBottom( true, true, 18, -18 )
	ImgRingPatternDuplicate:setAlpha( 0 )
	ImgRingPatternDuplicate:setZoom( 6 )
	ImgRingPatternDuplicate:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_ringpattern" ) )
	self:addElement( ImgRingPatternDuplicate )
	self.ImgRingPatternDuplicate = ImgRingPatternDuplicate
	
	local Glow = CoD.AmmoWidget_AbilityGlow.new( menu, controller )
	Glow:setLeftRight( true, true, 4, -4 )
	Glow:setTopBottom( true, true, 4, -4 )
	Glow:setRGB( 0.4, 0.65, 0.99 )
	Glow:setAlpha( 0.24 )
	Glow:setScale( 0.9 )
	self:addElement( Glow )
	self.Glow = Glow
	
	local AbilitySwirl = LUI.UIImage.new()
	AbilitySwirl:setLeftRight( true, true, -2.63, 2.63 )
	AbilitySwirl:setTopBottom( true, true, -2.63, 2.63 )
	AbilitySwirl:setRGB( 0.58, 0.7, 1 )
	AbilitySwirl:setAlpha( 0.98 )
	AbilitySwirl:setYRot( 180 )
	AbilitySwirl:setZRot( 35.01 )
	AbilitySwirl:setScale( 1.01 )
	AbilitySwirl:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_abilityswirl" ) )
	AbilitySwirl:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( AbilitySwirl )
	self.AbilitySwirl = AbilitySwirl
	
	local Glow0 = CoD.AmmoWidget_AbilityGlow.new( menu, controller )
	Glow0:setLeftRight( true, true, 4, -4 )
	Glow0:setTopBottom( true, true, 4, -4 )
	Glow0:setRGB( 0.4, 0.65, 0.99 )
	Glow0:setAlpha( 0.76 )
	Glow0:setZoom( 13.47 )
	Glow0:setScale( 0.9 )
	self:addElement( Glow0 )
	self.Glow0 = Glow0
	
	self.clipsPerState = {
		AdvertisedReady = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				local ImgRingFillFrame2 = function ( ImgRingFill, event )
					local ImgRingFillFrame3 = function ( ImgRingFill, event )
						if not event.interrupted then
							ImgRingFill:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						end
						ImgRingFill:setRGB( 1, 0.81, 0 )
						ImgRingFill:setAlpha( 1 )
						ImgRingFill:setZoom( -10 )
						if event.interrupted then
							self.clipFinished( ImgRingFill, event )
						else
							ImgRingFill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ImgRingFillFrame3( ImgRingFill, event )
						return 
					else
						ImgRingFill:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Linear )
						ImgRingFill:setAlpha( 0.8 )
						ImgRingFill:registerEventHandler( "transition_complete_keyframe", ImgRingFillFrame3 )
					end
				end
				
				ImgRingFill:completeAnimation()
				self.ImgRingFill:setRGB( 1, 0.81, 0 )
				self.ImgRingFill:setAlpha( 1 )
				self.ImgRingFill:setZoom( -10 )
				ImgRingFillFrame2( ImgRingFill, {} )
				ImgRingPattern:completeAnimation()
				self.ImgRingPattern:setAlpha( Multiple( 2, 0 ) )
				self.ImgRingPattern:setZoom( 8 )
				self.clipFinished( ImgRingPattern, {} )
				ImgRingPatternDuplicate:completeAnimation()
				self.ImgRingPatternDuplicate:setRGB( 1, 0.91, 0.31 )
				self.ImgRingPatternDuplicate:setAlpha( 0 )
				self.ImgRingPatternDuplicate:setZoom( 8 )
				self.clipFinished( ImgRingPatternDuplicate, {} )
				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						local GlowFrame4 = function ( Glow, event )
							local GlowFrame5 = function ( Glow, event )
								if not event.interrupted then
									Glow:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
								end
								Glow:setRGB( 1, 0.6, 0.31 )
								Glow:setAlpha( 0.2 )
								Glow:setScale( 0.9 )
								if event.interrupted then
									self.clipFinished( Glow, event )
								else
									Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								GlowFrame5( Glow, event )
								return 
							else
								Glow:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
								Glow:setRGB( 1, 0.64, 0.31 )
								Glow:setScale( 0.94 )
								Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame5 )
							end
						end
						
						if event.interrupted then
							GlowFrame4( Glow, event )
							return 
						else
							Glow:beginAnimation( "keyframe", 350, false, false, CoD.TweenType.Linear )
							Glow:setRGB( 1, 0.78, 0.31 )
							Glow:setAlpha( 0 )
							Glow:setScale( 1.1 )
							Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame4 )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Bounce )
						Glow:setRGB( 1, 0.9, 0.31 )
						Glow:setAlpha( 0.7 )
						Glow:setScale( 0.96 )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setRGB( 1, 0.6, 0.31 )
				self.Glow:setAlpha( 0.2 )
				self.Glow:setScale( 0.9 )
				GlowFrame2( Glow, {} )
				AbilitySwirl:completeAnimation()
				self.AbilitySwirl:setAlpha( 0 )
				self.clipFinished( AbilitySwirl, {} )
				Glow0:completeAnimation()
				self.Glow0:setAlpha( 0 )
				self.clipFinished( Glow0, {} )
				self.nextClip = "DefaultClip"
			end,
			Ready = function ()
				self:setupElementClipCounter( 5 )
				local ImgRingFillFrame2 = function ( ImgRingFill, event )
					if not event.interrupted then
						ImgRingFill:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					ImgRingFill:setRGB( 0.79, 0.86, 1 )
					ImgRingFill:setAlpha( 1 )
					ImgRingFill:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( ImgRingFill, event )
					else
						ImgRingFill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingFill:completeAnimation()
				self.ImgRingFill:setRGB( 1, 0.81, 0 )
				self.ImgRingFill:setAlpha( 1 )
				self.ImgRingFill:setZoom( -10 )
				ImgRingFillFrame2( ImgRingFill, {} )
				local ImgRingPatternFrame2 = function ( ImgRingPattern, event )
					if not event.interrupted then
						ImgRingPattern:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					ImgRingPattern:setAlpha( Multiple( 2, 0 ) )
					ImgRingPattern:setZoom( 6 )
					if event.interrupted then
						self.clipFinished( ImgRingPattern, event )
					else
						ImgRingPattern:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPattern:completeAnimation()
				self.ImgRingPattern:setAlpha( Multiple( 2, 0 ) )
				self.ImgRingPattern:setZoom( 8 )
				ImgRingPatternFrame2( ImgRingPattern, {} )
				local ImgRingPatternDuplicateFrame2 = function ( ImgRingPatternDuplicate, event )
					if not event.interrupted then
						ImgRingPatternDuplicate:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					ImgRingPatternDuplicate:setRGB( 1, 1, 1 )
					ImgRingPatternDuplicate:setAlpha( 0 )
					ImgRingPatternDuplicate:setZoom( 6 )
					if event.interrupted then
						self.clipFinished( ImgRingPatternDuplicate, event )
					else
						ImgRingPatternDuplicate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPatternDuplicate:completeAnimation()
				self.ImgRingPatternDuplicate:setRGB( 1, 0.91, 0.31 )
				self.ImgRingPatternDuplicate:setAlpha( 0 )
				self.ImgRingPatternDuplicate:setZoom( 8 )
				ImgRingPatternDuplicateFrame2( ImgRingPatternDuplicate, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Glow:setRGB( 0.4, 0.65, 0.99 )
					Glow:setAlpha( 0.24 )
					Glow:setScale( 0.9 )
					if event.interrupted then
						self.clipFinished( Glow, event )
					else
						Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setRGB( 1, 0.6, 0.31 )
				self.Glow:setAlpha( 0.15 )
				self.Glow:setScale( 0.9 )
				GlowFrame2( Glow, {} )
				local AbilitySwirlFrame2 = function ( AbilitySwirl, event )
					if not event.interrupted then
						AbilitySwirl:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					AbilitySwirl:setRGB( 0.59, 0.71, 1 )
					AbilitySwirl:setAlpha( 0 )
					AbilitySwirl:setZRot( -20.3 )
					if event.interrupted then
						self.clipFinished( AbilitySwirl, event )
					else
						AbilitySwirl:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilitySwirl:completeAnimation()
				self.AbilitySwirl:setRGB( 0.59, 0.71, 1 )
				self.AbilitySwirl:setAlpha( 0 )
				self.AbilitySwirl:setZRot( -20.3 )
				AbilitySwirlFrame2( AbilitySwirl, {} )
			end,
			Charge = function ()
				self:setupElementClipCounter( 5 )
				local ImgRingFillFrame2 = function ( ImgRingFill, event )
					if not event.interrupted then
						ImgRingFill:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					ImgRingFill:setRGB( 1, 1, 1 )
					ImgRingFill:setAlpha( 0 )
					ImgRingFill:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( ImgRingFill, event )
					else
						ImgRingFill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingFill:completeAnimation()
				self.ImgRingFill:setRGB( 1, 0.81, 0 )
				self.ImgRingFill:setAlpha( 1 )
				self.ImgRingFill:setZoom( -10 )
				ImgRingFillFrame2( ImgRingFill, {} )
				local ImgRingPatternFrame2 = function ( ImgRingPattern, event )
					if not event.interrupted then
						ImgRingPattern:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					ImgRingPattern:setRGB( 0.83, 0.89, 1 )
					ImgRingPattern:setAlpha( Multiple( 2, 2 ) )
					ImgRingPattern:setZoom( 5 )
					if event.interrupted then
						self.clipFinished( ImgRingPattern, event )
					else
						ImgRingPattern:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPattern:completeAnimation()
				self.ImgRingPattern:setRGB( 0.83, 0.89, 1 )
				self.ImgRingPattern:setAlpha( Multiple( 2, 0 ) )
				self.ImgRingPattern:setZoom( 8 )
				ImgRingPatternFrame2( ImgRingPattern, {} )
				local ImgRingPatternDuplicateFrame2 = function ( ImgRingPatternDuplicate, event )
					if not event.interrupted then
						ImgRingPatternDuplicate:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					ImgRingPatternDuplicate:setRGB( 1, 1, 1 )
					ImgRingPatternDuplicate:setAlpha( 0 )
					ImgRingPatternDuplicate:setZoom( 5 )
					if event.interrupted then
						self.clipFinished( ImgRingPatternDuplicate, event )
					else
						ImgRingPatternDuplicate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPatternDuplicate:completeAnimation()
				self.ImgRingPatternDuplicate:setRGB( 1, 0.91, 0.31 )
				self.ImgRingPatternDuplicate:setAlpha( 0 )
				self.ImgRingPatternDuplicate:setZoom( 8 )
				ImgRingPatternDuplicateFrame2( ImgRingPatternDuplicate, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					Glow:setRGB( 1, 1, 1 )
					Glow:setAlpha( 0 )
					Glow:setScale( 0.9 )
					if event.interrupted then
						self.clipFinished( Glow, event )
					else
						Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setRGB( 1, 0.6, 0.31 )
				self.Glow:setAlpha( 0.15 )
				self.Glow:setScale( 0.9 )
				GlowFrame2( Glow, {} )
				local AbilitySwirlFrame2 = function ( AbilitySwirl, event )
					if not event.interrupted then
						AbilitySwirl:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					AbilitySwirl:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilitySwirl, event )
					else
						AbilitySwirl:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilitySwirl:completeAnimation()
				self.AbilitySwirl:setAlpha( 0 )
				AbilitySwirlFrame2( AbilitySwirl, {} )
			end,
			InUse = function ()
				self:setupElementClipCounter( 5 )
				local ImgRingFillFrame2 = function ( ImgRingFill, event )
					if not event.interrupted then
						ImgRingFill:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					ImgRingFill:setRGB( 0.55, 0.69, 0.98 )
					ImgRingFill:setAlpha( 0.7 )
					ImgRingFill:setZoom( 15 )
					if event.interrupted then
						self.clipFinished( ImgRingFill, event )
					else
						ImgRingFill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingFill:completeAnimation()
				self.ImgRingFill:setRGB( 1, 0.81, 0 )
				self.ImgRingFill:setAlpha( 1 )
				self.ImgRingFill:setZoom( -10 )
				ImgRingFillFrame2( ImgRingFill, {} )
				local ImgRingPatternFrame2 = function ( ImgRingPattern, event )
					if not event.interrupted then
						ImgRingPattern:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					ImgRingPattern:setRGB( 0.4, 0.57, 0.9 )
					ImgRingPattern:setAlpha( Multiple( 2, 0 ) )
					ImgRingPattern:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( ImgRingPattern, event )
					else
						ImgRingPattern:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPattern:completeAnimation()
				self.ImgRingPattern:setRGB( 0.4, 0.57, 0.9 )
				self.ImgRingPattern:setAlpha( Multiple( 2, 0 ) )
				self.ImgRingPattern:setZoom( 8 )
				ImgRingPatternFrame2( ImgRingPattern, {} )
				local ImgRingPatternDuplicateFrame2 = function ( ImgRingPatternDuplicate, event )
					if not event.interrupted then
						ImgRingPatternDuplicate:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					ImgRingPatternDuplicate:setRGB( 1, 1, 1 )
					ImgRingPatternDuplicate:setAlpha( 0 )
					ImgRingPatternDuplicate:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( ImgRingPatternDuplicate, event )
					else
						ImgRingPatternDuplicate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPatternDuplicate:completeAnimation()
				self.ImgRingPatternDuplicate:setRGB( 1, 0.91, 0.31 )
				self.ImgRingPatternDuplicate:setAlpha( 0 )
				self.ImgRingPatternDuplicate:setZoom( 8 )
				ImgRingPatternDuplicateFrame2( ImgRingPatternDuplicate, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					Glow:setRGB( 1, 1, 1 )
					Glow:setAlpha( 0 )
					Glow:setScale( 0.9 )
					if event.interrupted then
						self.clipFinished( Glow, event )
					else
						Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setRGB( 1, 0.6, 0.31 )
				self.Glow:setAlpha( 0.15 )
				self.Glow:setScale( 0.9 )
				GlowFrame2( Glow, {} )
				local AbilitySwirlFrame2 = function ( AbilitySwirl, event )
					if not event.interrupted then
						AbilitySwirl:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					AbilitySwirl:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilitySwirl, event )
					else
						AbilitySwirl:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilitySwirl:completeAnimation()
				self.AbilitySwirl:setAlpha( 0 )
				AbilitySwirlFrame2( AbilitySwirl, {} )
			end,
			NoGadget = function ()
				self:setupElementClipCounter( 5 )
				local ImgRingFillFrame2 = function ( ImgRingFill, event )
					if not event.interrupted then
						ImgRingFill:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					ImgRingFill:setRGB( 1, 0.81, 0 )
					ImgRingFill:setAlpha( 0 )
					ImgRingFill:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( ImgRingFill, event )
					else
						ImgRingFill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingFill:completeAnimation()
				self.ImgRingFill:setRGB( 1, 0.81, 0 )
				self.ImgRingFill:setAlpha( 1 )
				self.ImgRingFill:setZoom( -10 )
				ImgRingFillFrame2( ImgRingFill, {} )
				local ImgRingPatternFrame2 = function ( ImgRingPattern, event )
					if not event.interrupted then
						ImgRingPattern:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					ImgRingPattern:setAlpha( Multiple( 2, 0 ) )
					ImgRingPattern:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( ImgRingPattern, event )
					else
						ImgRingPattern:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPattern:completeAnimation()
				self.ImgRingPattern:setAlpha( Multiple( 2, 0 ) )
				self.ImgRingPattern:setZoom( 8 )
				ImgRingPatternFrame2( ImgRingPattern, {} )
				local ImgRingPatternDuplicateFrame2 = function ( ImgRingPatternDuplicate, event )
					if not event.interrupted then
						ImgRingPatternDuplicate:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					ImgRingPatternDuplicate:setRGB( 1, 1, 1 )
					ImgRingPatternDuplicate:setAlpha( 0 )
					ImgRingPatternDuplicate:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( ImgRingPatternDuplicate, event )
					else
						ImgRingPatternDuplicate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPatternDuplicate:completeAnimation()
				self.ImgRingPatternDuplicate:setRGB( 1, 0.91, 0.31 )
				self.ImgRingPatternDuplicate:setAlpha( 0 )
				self.ImgRingPatternDuplicate:setZoom( 8 )
				ImgRingPatternDuplicateFrame2( ImgRingPatternDuplicate, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					Glow:setRGB( 1, 1, 1 )
					Glow:setAlpha( 0 )
					Glow:setScale( 0.9 )
					if event.interrupted then
						self.clipFinished( Glow, event )
					else
						Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setRGB( 1, 0.6, 0.31 )
				self.Glow:setAlpha( 0.15 )
				self.Glow:setScale( 0.9 )
				GlowFrame2( Glow, {} )
				local AbilitySwirlFrame2 = function ( AbilitySwirl, event )
					if not event.interrupted then
						AbilitySwirl:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					AbilitySwirl:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilitySwirl, event )
					else
						AbilitySwirl:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilitySwirl:completeAnimation()
				self.AbilitySwirl:setAlpha( 0 )
				AbilitySwirlFrame2( AbilitySwirl, {} )
			end
		},
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Ready = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				ImgRingFill:completeAnimation()
				self.ImgRingFill:setRGB( 0.79, 0.86, 1 )
				self.ImgRingFill:setAlpha( 1 )
				self.ImgRingFill:setZoom( -10 )
				self.clipFinished( ImgRingFill, {} )
				ImgRingPattern:completeAnimation()
				self.ImgRingPattern:setAlpha( Multiple( 2, 0 ) )
				self.ImgRingPattern:setZoom( 6 )
				self.clipFinished( ImgRingPattern, {} )
				ImgRingPatternDuplicate:completeAnimation()
				self.ImgRingPatternDuplicate:setRGB( 1, 1, 1 )
				self.ImgRingPatternDuplicate:setAlpha( 0 )
				self.ImgRingPatternDuplicate:setZoom( 6 )
				self.clipFinished( ImgRingPatternDuplicate, {} )
				Glow:completeAnimation()
				self.Glow:setRGB( 0.4, 0.65, 0.99 )
				self.Glow:setAlpha( 0.24 )
				self.Glow:setZoom( 0 )
				self.Glow:setScale( 0.9 )
				self.clipFinished( Glow, {} )
				local AbilitySwirlFrame2 = function ( AbilitySwirl, event )
					local AbilitySwirlFrame3 = function ( AbilitySwirl, event )
						if not event.interrupted then
							AbilitySwirl:beginAnimation( "keyframe", 1010, true, false, CoD.TweenType.Linear )
						end
						AbilitySwirl:setRGB( 0.3, 0.29, 1 )
						AbilitySwirl:setAlpha( 0 )
						AbilitySwirl:setZRot( 1170 )
						AbilitySwirl:setScale( 1.1 )
						if event.interrupted then
							self.clipFinished( AbilitySwirl, event )
						else
							AbilitySwirl:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						AbilitySwirlFrame3( AbilitySwirl, event )
						return 
					else
						AbilitySwirl:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						AbilitySwirl:setAlpha( 1 )
						AbilitySwirl:setZRot( 7.11 )
						AbilitySwirl:registerEventHandler( "transition_complete_keyframe", AbilitySwirlFrame3 )
					end
				end
				
				AbilitySwirl:completeAnimation()
				self.AbilitySwirl:setRGB( 0.59, 0.71, 1 )
				self.AbilitySwirl:setAlpha( 0 )
				self.AbilitySwirl:setZRot( -20.3 )
				self.AbilitySwirl:setScale( 1 )
				AbilitySwirlFrame2( AbilitySwirl, {} )
				local Glow0Frame2 = function ( Glow0, event )
					local Glow0Frame3 = function ( Glow0, event )
						if not event.interrupted then
							Glow0:beginAnimation( "keyframe", 540, false, false, CoD.TweenType.Linear )
						end
						Glow0:setAlpha( 0 )
						Glow0:setZoom( 48 )
						if event.interrupted then
							self.clipFinished( Glow0, event )
						else
							Glow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Glow0Frame3( Glow0, event )
						return 
					else
						Glow0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						Glow0:setAlpha( 1 )
						Glow0:setZoom( 2.53 )
						Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame3 )
					end
				end
				
				Glow0:completeAnimation()
				self.Glow0:setAlpha( 0 )
				self.Glow0:setZoom( 0 )
				Glow0Frame2( Glow0, {} )
			end,
			AdvertisedReady = function ()
				self:setupElementClipCounter( 5 )
				local ImgRingFillFrame2 = function ( ImgRingFill, event )
					if not event.interrupted then
						ImgRingFill:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					ImgRingFill:setRGB( 1, 0.81, 0 )
					ImgRingFill:setAlpha( 1 )
					ImgRingFill:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( ImgRingFill, event )
					else
						ImgRingFill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingFill:completeAnimation()
				self.ImgRingFill:setRGB( 0.79, 0.86, 1 )
				self.ImgRingFill:setAlpha( 1 )
				self.ImgRingFill:setZoom( -10 )
				ImgRingFillFrame2( ImgRingFill, {} )
				local ImgRingPatternFrame2 = function ( ImgRingPattern, event )
					if not event.interrupted then
						ImgRingPattern:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					ImgRingPattern:setAlpha( Multiple( 2, 0 ) )
					ImgRingPattern:setZoom( 8 )
					if event.interrupted then
						self.clipFinished( ImgRingPattern, event )
					else
						ImgRingPattern:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPattern:completeAnimation()
				self.ImgRingPattern:setAlpha( Multiple( 2, 0 ) )
				self.ImgRingPattern:setZoom( 6 )
				ImgRingPatternFrame2( ImgRingPattern, {} )
				local ImgRingPatternDuplicateFrame2 = function ( ImgRingPatternDuplicate, event )
					if not event.interrupted then
						ImgRingPatternDuplicate:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					ImgRingPatternDuplicate:setRGB( 1, 0.91, 0.31 )
					ImgRingPatternDuplicate:setAlpha( 0 )
					ImgRingPatternDuplicate:setZoom( 8 )
					if event.interrupted then
						self.clipFinished( ImgRingPatternDuplicate, event )
					else
						ImgRingPatternDuplicate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPatternDuplicate:completeAnimation()
				self.ImgRingPatternDuplicate:setRGB( 1, 1, 1 )
				self.ImgRingPatternDuplicate:setAlpha( 0 )
				self.ImgRingPatternDuplicate:setZoom( 6 )
				ImgRingPatternDuplicateFrame2( ImgRingPatternDuplicate, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					Glow:setRGB( 1, 0.6, 0.31 )
					Glow:setAlpha( 0.15 )
					Glow:setScale( 0.9 )
					if event.interrupted then
						self.clipFinished( Glow, event )
					else
						Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setRGB( 0.4, 0.65, 0.99 )
				self.Glow:setAlpha( 0 )
				self.Glow:setScale( 0.9 )
				GlowFrame2( Glow, {} )
				local AbilitySwirlFrame2 = function ( AbilitySwirl, event )
					local AbilitySwirlFrame3 = function ( AbilitySwirl, event )
						if not event.interrupted then
							AbilitySwirl:beginAnimation( "keyframe", 879, true, false, CoD.TweenType.Linear )
						end
						AbilitySwirl:setRGB( 1, 0.52, 0 )
						AbilitySwirl:setAlpha( 0 )
						AbilitySwirl:setZRot( 600 )
						AbilitySwirl:setScale( 1.1 )
						if event.interrupted then
							self.clipFinished( AbilitySwirl, event )
						else
							AbilitySwirl:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						AbilitySwirlFrame3( AbilitySwirl, event )
						return 
					else
						AbilitySwirl:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						AbilitySwirl:setAlpha( 1 )
						AbilitySwirl:setZRot( -4.5 )
						AbilitySwirl:registerEventHandler( "transition_complete_keyframe", AbilitySwirlFrame3 )
					end
				end
				
				AbilitySwirl:completeAnimation()
				self.AbilitySwirl:setRGB( 1, 0.52, 0 )
				self.AbilitySwirl:setAlpha( 0 )
				self.AbilitySwirl:setZRot( -20.3 )
				self.AbilitySwirl:setScale( 1.01 )
				AbilitySwirlFrame2( AbilitySwirl, {} )
			end,
			Charge = function ()
				self:setupElementClipCounter( 5 )
				local ImgRingFillFrame2 = function ( ImgRingFill, event )
					if not event.interrupted then
						ImgRingFill:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					ImgRingFill:setRGB( 1, 1, 1 )
					ImgRingFill:setAlpha( 0 )
					ImgRingFill:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( ImgRingFill, event )
					else
						ImgRingFill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingFill:completeAnimation()
				self.ImgRingFill:setRGB( 0.79, 0.86, 1 )
				self.ImgRingFill:setAlpha( 1 )
				self.ImgRingFill:setZoom( -10 )
				ImgRingFillFrame2( ImgRingFill, {} )
				local ImgRingPatternFrame2 = function ( ImgRingPattern, event )
					if not event.interrupted then
						ImgRingPattern:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					ImgRingPattern:setRGB( 0.83, 0.89, 1 )
					ImgRingPattern:setAlpha( Multiple( 2, 2 ) )
					ImgRingPattern:setZoom( 5 )
					if event.interrupted then
						self.clipFinished( ImgRingPattern, event )
					else
						ImgRingPattern:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPattern:completeAnimation()
				self.ImgRingPattern:setRGB( 0.83, 0.89, 1 )
				self.ImgRingPattern:setAlpha( Multiple( 2, 0 ) )
				self.ImgRingPattern:setZoom( 6 )
				ImgRingPatternFrame2( ImgRingPattern, {} )
				local ImgRingPatternDuplicateFrame2 = function ( ImgRingPatternDuplicate, event )
					if not event.interrupted then
						ImgRingPatternDuplicate:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					ImgRingPatternDuplicate:setRGB( 1, 1, 1 )
					ImgRingPatternDuplicate:setAlpha( 0 )
					ImgRingPatternDuplicate:setZoom( 5 )
					if event.interrupted then
						self.clipFinished( ImgRingPatternDuplicate, event )
					else
						ImgRingPatternDuplicate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPatternDuplicate:completeAnimation()
				self.ImgRingPatternDuplicate:setRGB( 1, 1, 1 )
				self.ImgRingPatternDuplicate:setAlpha( 0 )
				self.ImgRingPatternDuplicate:setZoom( 6 )
				ImgRingPatternDuplicateFrame2( ImgRingPatternDuplicate, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					Glow:setRGB( 1, 1, 1 )
					Glow:setAlpha( 0 )
					Glow:setScale( 0.9 )
					if event.interrupted then
						self.clipFinished( Glow, event )
					else
						Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setRGB( 0.4, 0.65, 0.99 )
				self.Glow:setAlpha( 0.24 )
				self.Glow:setScale( 0.9 )
				GlowFrame2( Glow, {} )
				local AbilitySwirlFrame2 = function ( AbilitySwirl, event )
					if not event.interrupted then
						AbilitySwirl:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					AbilitySwirl:setRGB( 0.59, 0.71, 1 )
					AbilitySwirl:setAlpha( 0 )
					AbilitySwirl:setZRot( -20.3 )
					if event.interrupted then
						self.clipFinished( AbilitySwirl, event )
					else
						AbilitySwirl:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilitySwirl:completeAnimation()
				self.AbilitySwirl:setRGB( 0.59, 0.71, 1 )
				self.AbilitySwirl:setAlpha( 0 )
				self.AbilitySwirl:setZRot( -20.3 )
				AbilitySwirlFrame2( AbilitySwirl, {} )
			end,
			InUse = function ()
				self:setupElementClipCounter( 5 )
				local ImgRingFillFrame2 = function ( ImgRingFill, event )
					if not event.interrupted then
						ImgRingFill:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					ImgRingFill:setRGB( 0.55, 0.69, 0.98 )
					ImgRingFill:setAlpha( 0.7 )
					ImgRingFill:setZoom( 15 )
					if event.interrupted then
						self.clipFinished( ImgRingFill, event )
					else
						ImgRingFill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingFill:completeAnimation()
				self.ImgRingFill:setRGB( 0.79, 0.86, 1 )
				self.ImgRingFill:setAlpha( 1 )
				self.ImgRingFill:setZoom( -10 )
				ImgRingFillFrame2( ImgRingFill, {} )
				local ImgRingPatternFrame2 = function ( ImgRingPattern, event )
					if not event.interrupted then
						ImgRingPattern:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					ImgRingPattern:setRGB( 0.4, 0.57, 0.9 )
					ImgRingPattern:setAlpha( Multiple( 2, 0 ) )
					ImgRingPattern:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( ImgRingPattern, event )
					else
						ImgRingPattern:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPattern:completeAnimation()
				self.ImgRingPattern:setRGB( 0.4, 0.57, 0.9 )
				self.ImgRingPattern:setAlpha( Multiple( 2, 0 ) )
				self.ImgRingPattern:setZoom( 6 )
				ImgRingPatternFrame2( ImgRingPattern, {} )
				local ImgRingPatternDuplicateFrame2 = function ( ImgRingPatternDuplicate, event )
					if not event.interrupted then
						ImgRingPatternDuplicate:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					ImgRingPatternDuplicate:setRGB( 1, 1, 1 )
					ImgRingPatternDuplicate:setAlpha( 0 )
					ImgRingPatternDuplicate:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( ImgRingPatternDuplicate, event )
					else
						ImgRingPatternDuplicate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPatternDuplicate:completeAnimation()
				self.ImgRingPatternDuplicate:setRGB( 1, 1, 1 )
				self.ImgRingPatternDuplicate:setAlpha( 0 )
				self.ImgRingPatternDuplicate:setZoom( 6 )
				ImgRingPatternDuplicateFrame2( ImgRingPatternDuplicate, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					Glow:setRGB( 1, 1, 1 )
					Glow:setAlpha( 0 )
					Glow:setScale( 0.9 )
					if event.interrupted then
						self.clipFinished( Glow, event )
					else
						Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setRGB( 0.4, 0.65, 0.99 )
				self.Glow:setAlpha( 0 )
				self.Glow:setScale( 0.9 )
				GlowFrame2( Glow, {} )
				local AbilitySwirlFrame2 = function ( AbilitySwirl, event )
					if not event.interrupted then
						AbilitySwirl:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					AbilitySwirl:setRGB( 0.59, 0.71, 1 )
					AbilitySwirl:setAlpha( 0 )
					AbilitySwirl:setZRot( -20.3 )
					if event.interrupted then
						self.clipFinished( AbilitySwirl, event )
					else
						AbilitySwirl:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilitySwirl:completeAnimation()
				self.AbilitySwirl:setRGB( 0.59, 0.71, 1 )
				self.AbilitySwirl:setAlpha( 0 )
				self.AbilitySwirl:setZRot( -20.3 )
				AbilitySwirlFrame2( AbilitySwirl, {} )
			end,
			NoGadget = function ()
				self:setupElementClipCounter( 5 )
				local ImgRingFillFrame2 = function ( ImgRingFill, event )
					if not event.interrupted then
						ImgRingFill:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					ImgRingFill:setRGB( 0.79, 0.86, 1 )
					ImgRingFill:setAlpha( 0 )
					ImgRingFill:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( ImgRingFill, event )
					else
						ImgRingFill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingFill:completeAnimation()
				self.ImgRingFill:setRGB( 0.79, 0.86, 1 )
				self.ImgRingFill:setAlpha( 1 )
				self.ImgRingFill:setZoom( -10 )
				ImgRingFillFrame2( ImgRingFill, {} )
				local ImgRingPatternFrame2 = function ( ImgRingPattern, event )
					if not event.interrupted then
						ImgRingPattern:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					ImgRingPattern:setAlpha( Multiple( 2, 0 ) )
					ImgRingPattern:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( ImgRingPattern, event )
					else
						ImgRingPattern:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPattern:completeAnimation()
				self.ImgRingPattern:setAlpha( Multiple( 2, 0 ) )
				self.ImgRingPattern:setZoom( 6 )
				ImgRingPatternFrame2( ImgRingPattern, {} )
				local ImgRingPatternDuplicateFrame2 = function ( ImgRingPatternDuplicate, event )
					if not event.interrupted then
						ImgRingPatternDuplicate:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					ImgRingPatternDuplicate:setRGB( 1, 1, 1 )
					ImgRingPatternDuplicate:setAlpha( 0 )
					ImgRingPatternDuplicate:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( ImgRingPatternDuplicate, event )
					else
						ImgRingPatternDuplicate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPatternDuplicate:completeAnimation()
				self.ImgRingPatternDuplicate:setRGB( 1, 1, 1 )
				self.ImgRingPatternDuplicate:setAlpha( 0 )
				self.ImgRingPatternDuplicate:setZoom( 6 )
				ImgRingPatternDuplicateFrame2( ImgRingPatternDuplicate, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					Glow:setRGB( 1, 1, 1 )
					Glow:setAlpha( 0 )
					Glow:setScale( 0.9 )
					if event.interrupted then
						self.clipFinished( Glow, event )
					else
						Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setRGB( 0.4, 0.65, 0.99 )
				self.Glow:setAlpha( 0 )
				self.Glow:setScale( 0.9 )
				GlowFrame2( Glow, {} )
				local AbilitySwirlFrame2 = function ( AbilitySwirl, event )
					if not event.interrupted then
						AbilitySwirl:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					AbilitySwirl:setRGB( 0.59, 0.71, 1 )
					AbilitySwirl:setAlpha( 0 )
					AbilitySwirl:setZRot( -20.3 )
					if event.interrupted then
						self.clipFinished( AbilitySwirl, event )
					else
						AbilitySwirl:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilitySwirl:completeAnimation()
				self.AbilitySwirl:setRGB( 0.59, 0.71, 1 )
				self.AbilitySwirl:setAlpha( 0 )
				self.AbilitySwirl:setZRot( -20.3 )
				AbilitySwirlFrame2( AbilitySwirl, {} )
			end
		},
		Charge = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				ImgRingFill:completeAnimation()
				self.ImgRingFill:setRGB( 1, 1, 1 )
				self.ImgRingFill:setAlpha( 0 )
				self.ImgRingFill:setZoom( -10 )
				self.clipFinished( ImgRingFill, {} )
				ImgRingPattern:completeAnimation()
				self.ImgRingPattern:setRGB( 0.83, 0.89, 1 )
				self.ImgRingPattern:setAlpha( Multiple( 2, 2 ) )
				self.ImgRingPattern:setZoom( 5 )
				self.clipFinished( ImgRingPattern, {} )
				ImgRingPatternDuplicate:completeAnimation()
				self.ImgRingPatternDuplicate:setRGB( 1, 1, 1 )
				self.ImgRingPatternDuplicate:setAlpha( 0 )
				self.ImgRingPatternDuplicate:setZoom( 5 )
				self.clipFinished( ImgRingPatternDuplicate, {} )
				Glow:completeAnimation()
				self.Glow:setRGB( 1, 1, 1 )
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
				AbilitySwirl:completeAnimation()
				self.AbilitySwirl:setAlpha( 0 )
				self.clipFinished( AbilitySwirl, {} )
				Glow0:completeAnimation()
				self.Glow0:setAlpha( 0 )
				self.clipFinished( Glow0, {} )
			end,
			AdvertisedReady = function ()
				self:setupElementClipCounter( 6 )
				local ImgRingFillFrame2 = function ( ImgRingFill, event )
					if not event.interrupted then
						ImgRingFill:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					ImgRingFill:setRGB( 1, 0.81, 0 )
					ImgRingFill:setAlpha( 1 )
					ImgRingFill:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( ImgRingFill, event )
					else
						ImgRingFill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingFill:completeAnimation()
				self.ImgRingFill:setRGB( 1, 1, 1 )
				self.ImgRingFill:setAlpha( 0 )
				self.ImgRingFill:setZoom( -10 )
				ImgRingFillFrame2( ImgRingFill, {} )
				local ImgRingPatternFrame2 = function ( ImgRingPattern, event )
					if not event.interrupted then
						ImgRingPattern:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					ImgRingPattern:setRGB( 0.83, 0.89, 1 )
					ImgRingPattern:setAlpha( Multiple( 2, 0 ) )
					ImgRingPattern:setZoom( -36 )
					if event.interrupted then
						self.clipFinished( ImgRingPattern, event )
					else
						ImgRingPattern:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPattern:completeAnimation()
				self.ImgRingPattern:setRGB( 0.83, 0.89, 1 )
				self.ImgRingPattern:setAlpha( Multiple( 2, 2 ) )
				self.ImgRingPattern:setZoom( 5 )
				ImgRingPatternFrame2( ImgRingPattern, {} )
				local ImgRingPatternDuplicateFrame2 = function ( ImgRingPatternDuplicate, event )
					if not event.interrupted then
						ImgRingPatternDuplicate:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					ImgRingPatternDuplicate:setRGB( 1, 0.91, 0.31 )
					ImgRingPatternDuplicate:setAlpha( 0 )
					ImgRingPatternDuplicate:setZoom( 8 )
					if event.interrupted then
						self.clipFinished( ImgRingPatternDuplicate, event )
					else
						ImgRingPatternDuplicate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPatternDuplicate:completeAnimation()
				self.ImgRingPatternDuplicate:setRGB( 1, 1, 1 )
				self.ImgRingPatternDuplicate:setAlpha( 0 )
				self.ImgRingPatternDuplicate:setZoom( 5 )
				ImgRingPatternDuplicateFrame2( ImgRingPatternDuplicate, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					Glow:setRGB( 1, 0.6, 0.31 )
					Glow:setAlpha( 0.15 )
					Glow:setScale( 0.9 )
					if event.interrupted then
						self.clipFinished( Glow, event )
					else
						Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setRGB( 1, 1, 1 )
				self.Glow:setAlpha( 0 )
				self.Glow:setScale( 0.9 )
				GlowFrame2( Glow, {} )
				local AbilitySwirlFrame2 = function ( AbilitySwirl, event )
					local AbilitySwirlFrame3 = function ( AbilitySwirl, event )
						if not event.interrupted then
							AbilitySwirl:beginAnimation( "keyframe", 800, true, false, CoD.TweenType.Linear )
						end
						AbilitySwirl:setRGB( 1, 0.76, 0 )
						AbilitySwirl:setAlpha( 0 )
						AbilitySwirl:setZRot( 700 )
						AbilitySwirl:setScale( 1.09 )
						if event.interrupted then
							self.clipFinished( AbilitySwirl, event )
						else
							AbilitySwirl:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						AbilitySwirlFrame3( AbilitySwirl, event )
						return 
					else
						AbilitySwirl:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						AbilitySwirl:setAlpha( 1 )
						AbilitySwirl:setZRot( 37.66 )
						AbilitySwirl:registerEventHandler( "transition_complete_keyframe", AbilitySwirlFrame3 )
					end
				end
				
				AbilitySwirl:completeAnimation()
				self.AbilitySwirl:setRGB( 1, 0.76, 0 )
				self.AbilitySwirl:setAlpha( 0 )
				self.AbilitySwirl:setZRot( -20.3 )
				self.AbilitySwirl:setScale( 1.01 )
				AbilitySwirlFrame2( AbilitySwirl, {} )
				local Glow0Frame2 = function ( Glow0, event )
					local Glow0Frame3 = function ( Glow0, event )
						if not event.interrupted then
							Glow0:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
						end
						Glow0:setAlpha( 0 )
						Glow0:setZoom( 48 )
						if event.interrupted then
							self.clipFinished( Glow0, event )
						else
							Glow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Glow0Frame3( Glow0, event )
						return 
					else
						Glow0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						Glow0:setAlpha( 1 )
						Glow0:setZoom( 5.65 )
						Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame3 )
					end
				end
				
				Glow0:completeAnimation()
				self.Glow0:setAlpha( 0 )
				self.Glow0:setZoom( 0 )
				Glow0Frame2( Glow0, {} )
			end,
			Ready = function ()
				self:setupElementClipCounter( 5 )
				local ImgRingFillFrame2 = function ( ImgRingFill, event )
					if not event.interrupted then
						ImgRingFill:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Back )
					end
					ImgRingFill:setRGB( 0.79, 0.86, 1 )
					ImgRingFill:setAlpha( 1 )
					ImgRingFill:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( ImgRingFill, event )
					else
						ImgRingFill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingFill:completeAnimation()
				self.ImgRingFill:setRGB( 1, 1, 1 )
				self.ImgRingFill:setAlpha( 0 )
				self.ImgRingFill:setZoom( -10 )
				ImgRingFillFrame2( ImgRingFill, {} )
				local ImgRingPatternFrame2 = function ( ImgRingPattern, event )
					if not event.interrupted then
						ImgRingPattern:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Back )
					end
					ImgRingPattern:setRGB( 0.83, 0.89, 1 )
					ImgRingPattern:setAlpha( Multiple( 2, 0 ) )
					ImgRingPattern:setZoom( 6 )
					if event.interrupted then
						self.clipFinished( ImgRingPattern, event )
					else
						ImgRingPattern:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPattern:completeAnimation()
				self.ImgRingPattern:setRGB( 0.83, 0.89, 1 )
				self.ImgRingPattern:setAlpha( Multiple( 2, 2 ) )
				self.ImgRingPattern:setZoom( 5 )
				ImgRingPatternFrame2( ImgRingPattern, {} )
				local ImgRingPatternDuplicateFrame2 = function ( ImgRingPatternDuplicate, event )
					if not event.interrupted then
						ImgRingPatternDuplicate:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Back )
					end
					ImgRingPatternDuplicate:setRGB( 1, 1, 1 )
					ImgRingPatternDuplicate:setAlpha( 0 )
					ImgRingPatternDuplicate:setZoom( 6 )
					if event.interrupted then
						self.clipFinished( ImgRingPatternDuplicate, event )
					else
						ImgRingPatternDuplicate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPatternDuplicate:completeAnimation()
				self.ImgRingPatternDuplicate:setRGB( 1, 1, 1 )
				self.ImgRingPatternDuplicate:setAlpha( 0 )
				self.ImgRingPatternDuplicate:setZoom( 5 )
				ImgRingPatternDuplicateFrame2( ImgRingPatternDuplicate, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Back )
					end
					Glow:setRGB( 0.4, 0.65, 0.99 )
					Glow:setAlpha( 0.24 )
					Glow:setScale( 0.9 )
					if event.interrupted then
						self.clipFinished( Glow, event )
					else
						Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setRGB( 1, 1, 1 )
				self.Glow:setAlpha( 0 )
				self.Glow:setScale( 0.9 )
				GlowFrame2( Glow, {} )
				local AbilitySwirlFrame2 = function ( AbilitySwirl, event )
					if not event.interrupted then
						AbilitySwirl:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					AbilitySwirl:setRGB( 0.59, 0.71, 1 )
					AbilitySwirl:setAlpha( 0 )
					AbilitySwirl:setZRot( -20.3 )
					if event.interrupted then
						self.clipFinished( AbilitySwirl, event )
					else
						AbilitySwirl:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilitySwirl:completeAnimation()
				self.AbilitySwirl:setRGB( 0.59, 0.71, 1 )
				self.AbilitySwirl:setAlpha( 0 )
				self.AbilitySwirl:setZRot( -20.3 )
				AbilitySwirlFrame2( AbilitySwirl, {} )
			end,
			InUse = function ()
				self:setupElementClipCounter( 5 )
				local ImgRingFillFrame2 = function ( ImgRingFill, event )
					if not event.interrupted then
						ImgRingFill:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					ImgRingFill:setRGB( 0.55, 0.69, 0.98 )
					ImgRingFill:setAlpha( 0.7 )
					ImgRingFill:setZoom( 15 )
					if event.interrupted then
						self.clipFinished( ImgRingFill, event )
					else
						ImgRingFill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingFill:completeAnimation()
				self.ImgRingFill:setRGB( 1, 1, 1 )
				self.ImgRingFill:setAlpha( 0 )
				self.ImgRingFill:setZoom( -10 )
				ImgRingFillFrame2( ImgRingFill, {} )
				local ImgRingPatternFrame2 = function ( ImgRingPattern, event )
					if not event.interrupted then
						ImgRingPattern:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					ImgRingPattern:setRGB( 0.4, 0.57, 0.9 )
					ImgRingPattern:setAlpha( Multiple( 2, 0 ) )
					ImgRingPattern:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( ImgRingPattern, event )
					else
						ImgRingPattern:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPattern:completeAnimation()
				self.ImgRingPattern:setRGB( 0.83, 0.89, 1 )
				self.ImgRingPattern:setAlpha( Multiple( 2, 2 ) )
				self.ImgRingPattern:setZoom( 5 )
				ImgRingPatternFrame2( ImgRingPattern, {} )
				local ImgRingPatternDuplicateFrame2 = function ( ImgRingPatternDuplicate, event )
					if not event.interrupted then
						ImgRingPatternDuplicate:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					ImgRingPatternDuplicate:setRGB( 1, 1, 1 )
					ImgRingPatternDuplicate:setAlpha( 0 )
					ImgRingPatternDuplicate:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( ImgRingPatternDuplicate, event )
					else
						ImgRingPatternDuplicate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPatternDuplicate:completeAnimation()
				self.ImgRingPatternDuplicate:setRGB( 1, 1, 1 )
				self.ImgRingPatternDuplicate:setAlpha( 0 )
				self.ImgRingPatternDuplicate:setZoom( 5 )
				ImgRingPatternDuplicateFrame2( ImgRingPatternDuplicate, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					Glow:setRGB( 1, 1, 1 )
					Glow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Glow, event )
					else
						Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setRGB( 1, 1, 1 )
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
				local AbilitySwirlFrame2 = function ( AbilitySwirl, event )
					if not event.interrupted then
						AbilitySwirl:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					AbilitySwirl:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilitySwirl, event )
					else
						AbilitySwirl:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilitySwirl:completeAnimation()
				self.AbilitySwirl:setAlpha( 0 )
				AbilitySwirlFrame2( AbilitySwirl, {} )
			end,
			NoGadget = function ()
				self:setupElementClipCounter( 5 )
				local ImgRingFillFrame2 = function ( ImgRingFill, event )
					if not event.interrupted then
						ImgRingFill:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					ImgRingFill:setRGB( 1, 1, 1 )
					ImgRingFill:setAlpha( 0 )
					ImgRingFill:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( ImgRingFill, event )
					else
						ImgRingFill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingFill:completeAnimation()
				self.ImgRingFill:setRGB( 1, 1, 1 )
				self.ImgRingFill:setAlpha( 0 )
				self.ImgRingFill:setZoom( -10 )
				ImgRingFillFrame2( ImgRingFill, {} )
				local ImgRingPatternFrame2 = function ( ImgRingPattern, event )
					if not event.interrupted then
						ImgRingPattern:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					ImgRingPattern:setRGB( 0.83, 0.89, 1 )
					ImgRingPattern:setAlpha( Multiple( 2, 0 ) )
					ImgRingPattern:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( ImgRingPattern, event )
					else
						ImgRingPattern:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPattern:completeAnimation()
				self.ImgRingPattern:setRGB( 0.83, 0.89, 1 )
				self.ImgRingPattern:setAlpha( Multiple( 2, 2 ) )
				self.ImgRingPattern:setZoom( 5 )
				ImgRingPatternFrame2( ImgRingPattern, {} )
				local ImgRingPatternDuplicateFrame2 = function ( ImgRingPatternDuplicate, event )
					if not event.interrupted then
						ImgRingPatternDuplicate:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					ImgRingPatternDuplicate:setRGB( 1, 1, 1 )
					ImgRingPatternDuplicate:setAlpha( 0 )
					ImgRingPatternDuplicate:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( ImgRingPatternDuplicate, event )
					else
						ImgRingPatternDuplicate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPatternDuplicate:completeAnimation()
				self.ImgRingPatternDuplicate:setRGB( 1, 1, 1 )
				self.ImgRingPatternDuplicate:setAlpha( 0 )
				self.ImgRingPatternDuplicate:setZoom( 5 )
				ImgRingPatternDuplicateFrame2( ImgRingPatternDuplicate, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					Glow:setRGB( 1, 1, 1 )
					Glow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Glow, event )
					else
						Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setRGB( 1, 1, 1 )
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
				local AbilitySwirlFrame2 = function ( AbilitySwirl, event )
					if not event.interrupted then
						AbilitySwirl:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					AbilitySwirl:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilitySwirl, event )
					else
						AbilitySwirl:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilitySwirl:completeAnimation()
				self.AbilitySwirl:setAlpha( 0 )
				AbilitySwirlFrame2( AbilitySwirl, {} )
			end
		},
		InUse = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				ImgRingFill:completeAnimation()
				self.ImgRingFill:setRGB( 0.55, 0.69, 0.98 )
				self.ImgRingFill:setAlpha( 0.7 )
				self.ImgRingFill:setZoom( 15 )
				self.clipFinished( ImgRingFill, {} )
				ImgRingPattern:completeAnimation()
				self.ImgRingPattern:setRGB( 0.4, 0.57, 0.9 )
				self.ImgRingPattern:setAlpha( Multiple( 2, 0 ) )
				self.ImgRingPattern:setZoom( -10 )
				self.clipFinished( ImgRingPattern, {} )
				ImgRingPatternDuplicate:completeAnimation()
				self.ImgRingPatternDuplicate:setRGB( 1, 1, 1 )
				self.ImgRingPatternDuplicate:setAlpha( 0 )
				self.ImgRingPatternDuplicate:setZoom( -10 )
				self.clipFinished( ImgRingPatternDuplicate, {} )
				Glow:completeAnimation()
				self.Glow:setRGB( 1, 1, 1 )
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
				AbilitySwirl:completeAnimation()
				self.AbilitySwirl:setAlpha( 0 )
				self.clipFinished( AbilitySwirl, {} )
				Glow0:completeAnimation()
				self.Glow0:setAlpha( 0 )
				self.clipFinished( Glow0, {} )
			end,
			AdvertisedReady = function ()
				self:setupElementClipCounter( 5 )
				local ImgRingFillFrame2 = function ( ImgRingFill, event )
					if not event.interrupted then
						ImgRingFill:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Back )
					end
					ImgRingFill:setRGB( 1, 0.81, 0 )
					ImgRingFill:setAlpha( 1 )
					ImgRingFill:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( ImgRingFill, event )
					else
						ImgRingFill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingFill:completeAnimation()
				self.ImgRingFill:setRGB( 0.55, 0.69, 0.98 )
				self.ImgRingFill:setAlpha( 0.7 )
				self.ImgRingFill:setZoom( 15 )
				ImgRingFillFrame2( ImgRingFill, {} )
				local ImgRingPatternFrame2 = function ( ImgRingPattern, event )
					if not event.interrupted then
						ImgRingPattern:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Back )
					end
					ImgRingPattern:setRGB( 0.4, 0.57, 0.9 )
					ImgRingPattern:setAlpha( Multiple( 2, 0 ) )
					ImgRingPattern:setZoom( 8 )
					if event.interrupted then
						self.clipFinished( ImgRingPattern, event )
					else
						ImgRingPattern:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPattern:completeAnimation()
				self.ImgRingPattern:setRGB( 0.4, 0.57, 0.9 )
				self.ImgRingPattern:setAlpha( Multiple( 2, 0 ) )
				self.ImgRingPattern:setZoom( -10 )
				ImgRingPatternFrame2( ImgRingPattern, {} )
				local ImgRingPatternDuplicateFrame2 = function ( ImgRingPatternDuplicate, event )
					if not event.interrupted then
						ImgRingPatternDuplicate:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Back )
					end
					ImgRingPatternDuplicate:setRGB( 1, 0.91, 0.31 )
					ImgRingPatternDuplicate:setAlpha( 0 )
					ImgRingPatternDuplicate:setZoom( 8 )
					if event.interrupted then
						self.clipFinished( ImgRingPatternDuplicate, event )
					else
						ImgRingPatternDuplicate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPatternDuplicate:completeAnimation()
				self.ImgRingPatternDuplicate:setRGB( 1, 1, 1 )
				self.ImgRingPatternDuplicate:setAlpha( 0 )
				self.ImgRingPatternDuplicate:setZoom( -10 )
				ImgRingPatternDuplicateFrame2( ImgRingPatternDuplicate, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Back )
					end
					Glow:setRGB( 1, 0.6, 0.31 )
					Glow:setAlpha( 0.15 )
					Glow:setScale( 0.9 )
					if event.interrupted then
						self.clipFinished( Glow, event )
					else
						Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setRGB( 1, 1, 1 )
				self.Glow:setAlpha( 0 )
				self.Glow:setScale( 0.9 )
				GlowFrame2( Glow, {} )
				local AbilitySwirlFrame2 = function ( AbilitySwirl, event )
					if not event.interrupted then
						AbilitySwirl:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Back )
					end
					AbilitySwirl:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilitySwirl, event )
					else
						AbilitySwirl:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilitySwirl:completeAnimation()
				self.AbilitySwirl:setAlpha( 0 )
				AbilitySwirlFrame2( AbilitySwirl, {} )
			end,
			Ready = function ()
				self:setupElementClipCounter( 5 )
				local ImgRingFillFrame2 = function ( ImgRingFill, event )
					if not event.interrupted then
						ImgRingFill:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Back )
					end
					ImgRingFill:setRGB( 0.79, 0.86, 1 )
					ImgRingFill:setAlpha( 1 )
					ImgRingFill:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( ImgRingFill, event )
					else
						ImgRingFill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingFill:completeAnimation()
				self.ImgRingFill:setRGB( 0.55, 0.69, 0.98 )
				self.ImgRingFill:setAlpha( 0.7 )
				self.ImgRingFill:setZoom( 15 )
				ImgRingFillFrame2( ImgRingFill, {} )
				local ImgRingPatternFrame2 = function ( ImgRingPattern, event )
					if not event.interrupted then
						ImgRingPattern:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Back )
					end
					ImgRingPattern:setRGB( 0.4, 0.57, 0.9 )
					ImgRingPattern:setAlpha( Multiple( 2, 0 ) )
					ImgRingPattern:setZoom( 6 )
					if event.interrupted then
						self.clipFinished( ImgRingPattern, event )
					else
						ImgRingPattern:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPattern:completeAnimation()
				self.ImgRingPattern:setRGB( 0.4, 0.57, 0.9 )
				self.ImgRingPattern:setAlpha( Multiple( 2, 0 ) )
				self.ImgRingPattern:setZoom( -10 )
				ImgRingPatternFrame2( ImgRingPattern, {} )
				local ImgRingPatternDuplicateFrame2 = function ( ImgRingPatternDuplicate, event )
					if not event.interrupted then
						ImgRingPatternDuplicate:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Back )
					end
					ImgRingPatternDuplicate:setRGB( 1, 1, 1 )
					ImgRingPatternDuplicate:setAlpha( 0 )
					ImgRingPatternDuplicate:setZoom( 6 )
					if event.interrupted then
						self.clipFinished( ImgRingPatternDuplicate, event )
					else
						ImgRingPatternDuplicate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPatternDuplicate:completeAnimation()
				self.ImgRingPatternDuplicate:setRGB( 1, 1, 1 )
				self.ImgRingPatternDuplicate:setAlpha( 0 )
				self.ImgRingPatternDuplicate:setZoom( -10 )
				ImgRingPatternDuplicateFrame2( ImgRingPatternDuplicate, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Back )
					end
					Glow:setRGB( 0.4, 0.65, 0.99 )
					Glow:setAlpha( 0.24 )
					Glow:setScale( 0.9 )
					if event.interrupted then
						self.clipFinished( Glow, event )
					else
						Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setRGB( 1, 1, 1 )
				self.Glow:setAlpha( 0 )
				self.Glow:setScale( 0.9 )
				GlowFrame2( Glow, {} )
				local AbilitySwirlFrame2 = function ( AbilitySwirl, event )
					if not event.interrupted then
						AbilitySwirl:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					AbilitySwirl:setRGB( 0.59, 0.71, 1 )
					AbilitySwirl:setAlpha( 0 )
					AbilitySwirl:setZRot( -20.3 )
					if event.interrupted then
						self.clipFinished( AbilitySwirl, event )
					else
						AbilitySwirl:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilitySwirl:completeAnimation()
				self.AbilitySwirl:setRGB( 0.59, 0.71, 1 )
				self.AbilitySwirl:setAlpha( 0 )
				self.AbilitySwirl:setZRot( -20.3 )
				AbilitySwirlFrame2( AbilitySwirl, {} )
			end,
			Charge = function ()
				self:setupElementClipCounter( 5 )
				local ImgRingFillFrame2 = function ( ImgRingFill, event )
					if not event.interrupted then
						ImgRingFill:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					ImgRingFill:setRGB( 1, 1, 1 )
					ImgRingFill:setAlpha( 0 )
					ImgRingFill:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( ImgRingFill, event )
					else
						ImgRingFill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingFill:completeAnimation()
				self.ImgRingFill:setRGB( 0.55, 0.69, 0.98 )
				self.ImgRingFill:setAlpha( 0.7 )
				self.ImgRingFill:setZoom( 15 )
				ImgRingFillFrame2( ImgRingFill, {} )
				local ImgRingPatternFrame2 = function ( ImgRingPattern, event )
					if not event.interrupted then
						ImgRingPattern:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					ImgRingPattern:setRGB( 0.83, 0.89, 1 )
					ImgRingPattern:setAlpha( Multiple( 2, 2 ) )
					ImgRingPattern:setZoom( 5 )
					if event.interrupted then
						self.clipFinished( ImgRingPattern, event )
					else
						ImgRingPattern:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPattern:completeAnimation()
				self.ImgRingPattern:setRGB( 0.4, 0.57, 0.9 )
				self.ImgRingPattern:setAlpha( Multiple( 2, 0 ) )
				self.ImgRingPattern:setZoom( -10 )
				ImgRingPatternFrame2( ImgRingPattern, {} )
				local ImgRingPatternDuplicateFrame2 = function ( ImgRingPatternDuplicate, event )
					if not event.interrupted then
						ImgRingPatternDuplicate:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					ImgRingPatternDuplicate:setRGB( 1, 1, 1 )
					ImgRingPatternDuplicate:setAlpha( 0 )
					ImgRingPatternDuplicate:setZoom( 5 )
					if event.interrupted then
						self.clipFinished( ImgRingPatternDuplicate, event )
					else
						ImgRingPatternDuplicate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPatternDuplicate:completeAnimation()
				self.ImgRingPatternDuplicate:setRGB( 1, 1, 1 )
				self.ImgRingPatternDuplicate:setAlpha( 0 )
				self.ImgRingPatternDuplicate:setZoom( -10 )
				ImgRingPatternDuplicateFrame2( ImgRingPatternDuplicate, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					Glow:setRGB( 1, 1, 1 )
					Glow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Glow, event )
					else
						Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setRGB( 1, 1, 1 )
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
				local AbilitySwirlFrame2 = function ( AbilitySwirl, event )
					if not event.interrupted then
						AbilitySwirl:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					AbilitySwirl:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilitySwirl, event )
					else
						AbilitySwirl:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilitySwirl:completeAnimation()
				self.AbilitySwirl:setAlpha( 0 )
				AbilitySwirlFrame2( AbilitySwirl, {} )
			end,
			NoGadget = function ()
				self:setupElementClipCounter( 5 )
				local ImgRingFillFrame2 = function ( ImgRingFill, event )
					if not event.interrupted then
						ImgRingFill:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					ImgRingFill:setRGB( 0.55, 0.69, 0.98 )
					ImgRingFill:setAlpha( 0 )
					ImgRingFill:setZoom( 15 )
					if event.interrupted then
						self.clipFinished( ImgRingFill, event )
					else
						ImgRingFill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingFill:completeAnimation()
				self.ImgRingFill:setRGB( 0.55, 0.69, 0.98 )
				self.ImgRingFill:setAlpha( 0.7 )
				self.ImgRingFill:setZoom( 15 )
				ImgRingFillFrame2( ImgRingFill, {} )
				local ImgRingPatternFrame2 = function ( ImgRingPattern, event )
					if not event.interrupted then
						ImgRingPattern:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					ImgRingPattern:setRGB( 0.4, 0.57, 0.9 )
					ImgRingPattern:setAlpha( Multiple( 2, 0 ) )
					ImgRingPattern:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( ImgRingPattern, event )
					else
						ImgRingPattern:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPattern:completeAnimation()
				self.ImgRingPattern:setRGB( 0.4, 0.57, 0.9 )
				self.ImgRingPattern:setAlpha( Multiple( 2, 0 ) )
				self.ImgRingPattern:setZoom( -10 )
				ImgRingPatternFrame2( ImgRingPattern, {} )
				local ImgRingPatternDuplicateFrame2 = function ( ImgRingPatternDuplicate, event )
					if not event.interrupted then
						ImgRingPatternDuplicate:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					ImgRingPatternDuplicate:setRGB( 1, 1, 1 )
					ImgRingPatternDuplicate:setAlpha( 0 )
					ImgRingPatternDuplicate:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( ImgRingPatternDuplicate, event )
					else
						ImgRingPatternDuplicate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPatternDuplicate:completeAnimation()
				self.ImgRingPatternDuplicate:setRGB( 1, 1, 1 )
				self.ImgRingPatternDuplicate:setAlpha( 0 )
				self.ImgRingPatternDuplicate:setZoom( -10 )
				ImgRingPatternDuplicateFrame2( ImgRingPatternDuplicate, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					Glow:setRGB( 1, 1, 1 )
					Glow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Glow, event )
					else
						Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setRGB( 1, 1, 1 )
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
				local AbilitySwirlFrame2 = function ( AbilitySwirl, event )
					if not event.interrupted then
						AbilitySwirl:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					AbilitySwirl:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilitySwirl, event )
					else
						AbilitySwirl:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilitySwirl:completeAnimation()
				self.AbilitySwirl:setAlpha( 0 )
				AbilitySwirlFrame2( AbilitySwirl, {} )
			end
		},
		NoGadget = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				ImgRingFill:completeAnimation()
				self.ImgRingFill:setAlpha( 0 )
				self.clipFinished( ImgRingFill, {} )
				ImgRingPattern:completeAnimation()
				self.ImgRingPattern:setAlpha( Multiple( 2, 0 ) )
				self.ImgRingPattern:setZoom( -10 )
				self.clipFinished( ImgRingPattern, {} )
				ImgRingPatternDuplicate:completeAnimation()
				self.ImgRingPatternDuplicate:setRGB( 1, 1, 1 )
				self.ImgRingPatternDuplicate:setAlpha( 0 )
				self.ImgRingPatternDuplicate:setZoom( -10 )
				self.clipFinished( ImgRingPatternDuplicate, {} )
				Glow:completeAnimation()
				self.Glow:setRGB( 1, 1, 1 )
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
				AbilitySwirl:completeAnimation()
				self.AbilitySwirl:setAlpha( 0 )
				self.clipFinished( AbilitySwirl, {} )
				Glow0:completeAnimation()
				self.Glow0:setAlpha( 0 )
				self.clipFinished( Glow0, {} )
			end,
			AdvertisedReady = function ()
				self:setupElementClipCounter( 5 )
				local ImgRingFillFrame2 = function ( ImgRingFill, event )
					if not event.interrupted then
						ImgRingFill:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					ImgRingFill:setRGB( 1, 0.81, 0 )
					ImgRingFill:setAlpha( 1 )
					ImgRingFill:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( ImgRingFill, event )
					else
						ImgRingFill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingFill:completeAnimation()
				self.ImgRingFill:setRGB( 1, 0.81, 0 )
				self.ImgRingFill:setAlpha( 0 )
				self.ImgRingFill:setZoom( -10 )
				ImgRingFillFrame2( ImgRingFill, {} )
				local ImgRingPatternFrame2 = function ( ImgRingPattern, event )
					if not event.interrupted then
						ImgRingPattern:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					ImgRingPattern:setAlpha( Multiple( 2, 0 ) )
					ImgRingPattern:setZoom( 8 )
					if event.interrupted then
						self.clipFinished( ImgRingPattern, event )
					else
						ImgRingPattern:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPattern:completeAnimation()
				self.ImgRingPattern:setAlpha( Multiple( 2, 0 ) )
				self.ImgRingPattern:setZoom( -10 )
				ImgRingPatternFrame2( ImgRingPattern, {} )
				local ImgRingPatternDuplicateFrame2 = function ( ImgRingPatternDuplicate, event )
					if not event.interrupted then
						ImgRingPatternDuplicate:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					ImgRingPatternDuplicate:setRGB( 1, 0.91, 0.31 )
					ImgRingPatternDuplicate:setAlpha( 0 )
					ImgRingPatternDuplicate:setZoom( 8 )
					if event.interrupted then
						self.clipFinished( ImgRingPatternDuplicate, event )
					else
						ImgRingPatternDuplicate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPatternDuplicate:completeAnimation()
				self.ImgRingPatternDuplicate:setRGB( 1, 1, 1 )
				self.ImgRingPatternDuplicate:setAlpha( 0 )
				self.ImgRingPatternDuplicate:setZoom( -10 )
				ImgRingPatternDuplicateFrame2( ImgRingPatternDuplicate, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					Glow:setRGB( 1, 0.6, 0.31 )
					Glow:setAlpha( 0.15 )
					Glow:setScale( 0.9 )
					if event.interrupted then
						self.clipFinished( Glow, event )
					else
						Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setRGB( 1, 1, 1 )
				self.Glow:setAlpha( 0 )
				self.Glow:setScale( 0.9 )
				GlowFrame2( Glow, {} )
				local AbilitySwirlFrame2 = function ( AbilitySwirl, event )
					if not event.interrupted then
						AbilitySwirl:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					AbilitySwirl:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilitySwirl, event )
					else
						AbilitySwirl:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilitySwirl:completeAnimation()
				self.AbilitySwirl:setAlpha( 0 )
				AbilitySwirlFrame2( AbilitySwirl, {} )
			end,
			Ready = function ()
				self:setupElementClipCounter( 5 )
				local ImgRingFillFrame2 = function ( ImgRingFill, event )
					if not event.interrupted then
						ImgRingFill:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					ImgRingFill:setRGB( 0.79, 0.86, 1 )
					ImgRingFill:setAlpha( 1 )
					ImgRingFill:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( ImgRingFill, event )
					else
						ImgRingFill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingFill:completeAnimation()
				self.ImgRingFill:setRGB( 0.79, 0.86, 1 )
				self.ImgRingFill:setAlpha( 0 )
				self.ImgRingFill:setZoom( -10 )
				ImgRingFillFrame2( ImgRingFill, {} )
				local ImgRingPatternFrame2 = function ( ImgRingPattern, event )
					if not event.interrupted then
						ImgRingPattern:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					ImgRingPattern:setAlpha( Multiple( 2, 0 ) )
					ImgRingPattern:setZoom( 6 )
					if event.interrupted then
						self.clipFinished( ImgRingPattern, event )
					else
						ImgRingPattern:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPattern:completeAnimation()
				self.ImgRingPattern:setAlpha( Multiple( 2, 0 ) )
				self.ImgRingPattern:setZoom( -10 )
				ImgRingPatternFrame2( ImgRingPattern, {} )
				local ImgRingPatternDuplicateFrame2 = function ( ImgRingPatternDuplicate, event )
					if not event.interrupted then
						ImgRingPatternDuplicate:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					ImgRingPatternDuplicate:setRGB( 1, 1, 1 )
					ImgRingPatternDuplicate:setAlpha( 0 )
					ImgRingPatternDuplicate:setZoom( 6 )
					if event.interrupted then
						self.clipFinished( ImgRingPatternDuplicate, event )
					else
						ImgRingPatternDuplicate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPatternDuplicate:completeAnimation()
				self.ImgRingPatternDuplicate:setRGB( 1, 1, 1 )
				self.ImgRingPatternDuplicate:setAlpha( 0 )
				self.ImgRingPatternDuplicate:setZoom( -10 )
				ImgRingPatternDuplicateFrame2( ImgRingPatternDuplicate, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					Glow:setRGB( 0.4, 0.65, 0.99 )
					Glow:setAlpha( 0.24 )
					Glow:setScale( 0.9 )
					if event.interrupted then
						self.clipFinished( Glow, event )
					else
						Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setRGB( 1, 1, 1 )
				self.Glow:setAlpha( 0 )
				self.Glow:setScale( 0.9 )
				GlowFrame2( Glow, {} )
				local AbilitySwirlFrame2 = function ( AbilitySwirl, event )
					if not event.interrupted then
						AbilitySwirl:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					AbilitySwirl:setRGB( 0.59, 0.71, 1 )
					AbilitySwirl:setAlpha( 0 )
					AbilitySwirl:setZRot( -20.3 )
					if event.interrupted then
						self.clipFinished( AbilitySwirl, event )
					else
						AbilitySwirl:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilitySwirl:completeAnimation()
				self.AbilitySwirl:setRGB( 0.59, 0.71, 1 )
				self.AbilitySwirl:setAlpha( 0 )
				self.AbilitySwirl:setZRot( -20.3 )
				AbilitySwirlFrame2( AbilitySwirl, {} )
			end,
			InUse = function ()
				self:setupElementClipCounter( 5 )
				local ImgRingFillFrame2 = function ( ImgRingFill, event )
					if not event.interrupted then
						ImgRingFill:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					ImgRingFill:setRGB( 0.55, 0.69, 0.98 )
					ImgRingFill:setAlpha( 0.7 )
					ImgRingFill:setZoom( 15 )
					if event.interrupted then
						self.clipFinished( ImgRingFill, event )
					else
						ImgRingFill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingFill:completeAnimation()
				self.ImgRingFill:setRGB( 0.55, 0.69, 0.98 )
				self.ImgRingFill:setAlpha( 0 )
				self.ImgRingFill:setZoom( 15 )
				ImgRingFillFrame2( ImgRingFill, {} )
				local ImgRingPatternFrame2 = function ( ImgRingPattern, event )
					if not event.interrupted then
						ImgRingPattern:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					ImgRingPattern:setRGB( 0.4, 0.57, 0.9 )
					ImgRingPattern:setAlpha( Multiple( 2, 0 ) )
					ImgRingPattern:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( ImgRingPattern, event )
					else
						ImgRingPattern:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPattern:completeAnimation()
				self.ImgRingPattern:setRGB( 0.4, 0.57, 0.9 )
				self.ImgRingPattern:setAlpha( Multiple( 2, 0 ) )
				self.ImgRingPattern:setZoom( -10 )
				ImgRingPatternFrame2( ImgRingPattern, {} )
				local ImgRingPatternDuplicateFrame2 = function ( ImgRingPatternDuplicate, event )
					if not event.interrupted then
						ImgRingPatternDuplicate:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					ImgRingPatternDuplicate:setRGB( 1, 1, 1 )
					ImgRingPatternDuplicate:setAlpha( 0 )
					ImgRingPatternDuplicate:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( ImgRingPatternDuplicate, event )
					else
						ImgRingPatternDuplicate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPatternDuplicate:completeAnimation()
				self.ImgRingPatternDuplicate:setRGB( 1, 1, 1 )
				self.ImgRingPatternDuplicate:setAlpha( 0 )
				self.ImgRingPatternDuplicate:setZoom( -10 )
				ImgRingPatternDuplicateFrame2( ImgRingPatternDuplicate, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Glow:setRGB( 1, 1, 1 )
					Glow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Glow, event )
					else
						Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setRGB( 1, 1, 1 )
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
				local AbilitySwirlFrame2 = function ( AbilitySwirl, event )
					if not event.interrupted then
						AbilitySwirl:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					AbilitySwirl:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilitySwirl, event )
					else
						AbilitySwirl:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilitySwirl:completeAnimation()
				self.AbilitySwirl:setAlpha( 0 )
				AbilitySwirlFrame2( AbilitySwirl, {} )
			end,
			Charge = function ()
				self:setupElementClipCounter( 5 )
				local ImgRingFillFrame2 = function ( ImgRingFill, event )
					if not event.interrupted then
						ImgRingFill:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					ImgRingFill:setRGB( 1, 1, 1 )
					ImgRingFill:setAlpha( 0 )
					ImgRingFill:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( ImgRingFill, event )
					else
						ImgRingFill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingFill:completeAnimation()
				self.ImgRingFill:setRGB( 1, 1, 1 )
				self.ImgRingFill:setAlpha( 0 )
				self.ImgRingFill:setZoom( -10 )
				ImgRingFillFrame2( ImgRingFill, {} )
				local ImgRingPatternFrame2 = function ( ImgRingPattern, event )
					if not event.interrupted then
						ImgRingPattern:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					ImgRingPattern:setRGB( 0.83, 0.89, 1 )
					ImgRingPattern:setAlpha( Multiple( 2, 2 ) )
					ImgRingPattern:setZoom( 5 )
					if event.interrupted then
						self.clipFinished( ImgRingPattern, event )
					else
						ImgRingPattern:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPattern:completeAnimation()
				self.ImgRingPattern:setRGB( 0.83, 0.89, 1 )
				self.ImgRingPattern:setAlpha( Multiple( 2, 0 ) )
				self.ImgRingPattern:setZoom( -10 )
				ImgRingPatternFrame2( ImgRingPattern, {} )
				local ImgRingPatternDuplicateFrame2 = function ( ImgRingPatternDuplicate, event )
					if not event.interrupted then
						ImgRingPatternDuplicate:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					ImgRingPatternDuplicate:setRGB( 1, 1, 1 )
					ImgRingPatternDuplicate:setAlpha( 0 )
					ImgRingPatternDuplicate:setZoom( 5 )
					if event.interrupted then
						self.clipFinished( ImgRingPatternDuplicate, event )
					else
						ImgRingPatternDuplicate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPatternDuplicate:completeAnimation()
				self.ImgRingPatternDuplicate:setRGB( 1, 1, 1 )
				self.ImgRingPatternDuplicate:setAlpha( 0 )
				self.ImgRingPatternDuplicate:setZoom( -10 )
				ImgRingPatternDuplicateFrame2( ImgRingPatternDuplicate, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					Glow:setRGB( 1, 1, 1 )
					Glow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Glow, event )
					else
						Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setRGB( 1, 1, 1 )
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
				local AbilitySwirlFrame2 = function ( AbilitySwirl, event )
					if not event.interrupted then
						AbilitySwirl:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Back )
					end
					AbilitySwirl:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilitySwirl, event )
					else
						AbilitySwirl:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilitySwirl:completeAnimation()
				self.AbilitySwirl:setAlpha( 0 )
				AbilitySwirlFrame2( AbilitySwirl, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "AdvertisedReady",
			condition = function ( menu, element, event )
				local f144_local0
				if not IsHeroWeaponGadgetCurrentWeapon( menu, controller ) then
					f144_local0 = IsHeroWeaponOrSpecialGadgetAvailable( menu, controller )
					if f144_local0 then
						if not WasHeroWeaponGadgetActivated( menu ) then
							f144_local0 = IsModelValueEqualTo( controller, "playerAbilities.inRange", 1 )
							if f144_local0 then
								f144_local0 = IsModelValueEqualTo( controller, "playerAbilities.playerGadget3.powerRatio", 1 )
							end
						else
							f144_local0 = false
						end
					end
				else
					f144_local0 = false
				end
				return f144_local0
			end
		},
		{
			stateName = "Ready",
			condition = function ( menu, element, event )
				local f145_local0
				if not IsHeroWeaponGadgetCurrentWeapon( menu, controller ) then
					f145_local0 = IsHeroWeaponOrSpecialGadgetAvailable( menu, controller )
					if f145_local0 then
						if not WasHeroWeaponGadgetActivated( menu ) then
							f145_local0 = IsModelValueEqualTo( controller, "playerAbilities.playerGadget3.powerRatio", 1 )
						else
							f145_local0 = false
						end
					end
				else
					f145_local0 = false
				end
				return f145_local0
			end
		},
		{
			stateName = "Charge",
			condition = function ( menu, element, event )
				return IsSpecialGadgetAvailable( controller ) and not IsHeroGadgetInUse( menu, controller )
			end
		},
		{
			stateName = "InUse",
			condition = function ( menu, element, event )
				return IsHeroGadgetInUse( menu, controller )
			end
		},
		{
			stateName = "NoGadget",
			condition = function ( menu, element, event )
				return not IsSpecialGadgetAvailable( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.isInUse" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.isInUse"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.powerRatio" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.powerRatio"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.ammo" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.ammo"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.inRange" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.inRange"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Glow:close()
		element.Glow0:close()
		element.ImgRingFill:close()
		element.ImgRingPattern:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

