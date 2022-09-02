-- 38fdb00e1112aeb4a4aa264a7c2b0595
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_BackCircle" )

CoD.CPTrainingSimProgressWidget = InheritFrom( LUI.UIElement )
CoD.CPTrainingSimProgressWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CPTrainingSimProgressWidget )
	self.id = "CPTrainingSimProgressWidget"
	self.soundSet = "CAC"
	self:setLeftRight( true, false, 0, 112 )
	self:setTopBottom( true, false, 0, 112 )
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, false, 0, 112.18 )
	background:setTopBottom( true, false, 0, 112.18 )
	background:setRGB( 0.48, 0.48, 0.48 )
	background:setAlpha( 0 )
	background:setScale( 0.95 )
	background:setImage( RegisterImage( "uie_t7_hud_cp_bleeding_out_progresscircle" ) )
	self:addElement( background )
	self.background = background
	
	local BackCircle = CoD.AmmoWidget_BackCircle.new( menu, controller )
	BackCircle:setLeftRight( true, false, 9.59, 104.59 )
	BackCircle:setTopBottom( true, false, -2.91, 103.09 )
	BackCircle:setAlpha( 0.35 )
	BackCircle:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	BackCircle:setShaderVector( 0, 0.1, 1, 0, 0 )
	BackCircle:setShaderVector( 1, 0, 0, 0, 0 )
	BackCircle:setShaderVector( 2, 0, 0, 0, 0 )
	BackCircle:setShaderVector( 3, 0, 0, 0, 0 )
	BackCircle:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( BackCircle )
	self.BackCircle = BackCircle
	
	local progressRing = LUI.UIImage.new()
	progressRing:setLeftRight( true, false, 0, 112.18 )
	progressRing:setTopBottom( true, false, 0, 112.18 )
	progressRing:setRGB( 1, 0.94, 0.25 )
	progressRing:setScale( 0.95 )
	progressRing:setImage( RegisterImage( "uie_t7_hud_cp_bleeding_out_progresscircle" ) )
	progressRing:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	progressRing:setShaderVector( 0, 0.81, 0, 0, 0 )
	progressRing:setShaderVector( 1, 0.5, 0, 0, 0 )
	progressRing:setShaderVector( 2, 0.5, 0, 0, 0 )
	progressRing:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( progressRing )
	self.progressRing = progressRing
	
	local glow = LUI.UIImage.new()
	glow:setLeftRight( true, false, 0, 112.18 )
	glow:setTopBottom( true, false, 0, 112.18 )
	glow:setRGB( 1, 0.88, 0.22 )
	glow:setAlpha( 0.99 )
	glow:setScale( 0.95 )
	glow:setImage( RegisterImage( "uie_img_t7_hud_cm_heroringglow" ) )
	glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glow )
	self.glow = glow
	
	local AbilitySwirl = LUI.UIImage.new()
	AbilitySwirl:setLeftRight( true, true, -2.63, 2.63 )
	AbilitySwirl:setTopBottom( true, true, -2.63, 2.63 )
	AbilitySwirl:setRGB( 1, 0.84, 0.3 )
	AbilitySwirl:setAlpha( 0 )
	AbilitySwirl:setYRot( 1170 )
	AbilitySwirl:setScale( 1.01 )
	AbilitySwirl:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_abilityswirl" ) )
	AbilitySwirl:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( AbilitySwirl )
	self.AbilitySwirl = AbilitySwirl
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				glow:completeAnimation()
				self.glow:setAlpha( 0 )
				self.clipFinished( glow, {} )
			end,
			RankUp = function ()
				self:setupElementClipCounter( 3 )

				local progressRingFrame2 = function ( progressRing, event )
					local progressRingFrame3 = function ( progressRing, event )
						if not event.interrupted then
							progressRing:beginAnimation( "keyframe", 339, false, false, CoD.TweenType.Linear )
						end
						progressRing:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( progressRing, event )
						else
							progressRing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						progressRingFrame3( progressRing, event )
						return 
					else
						progressRing:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
						progressRing:setAlpha( 0 )
						progressRing:registerEventHandler( "transition_complete_keyframe", progressRingFrame3 )
					end
				end
				
				progressRing:completeAnimation()
				self.progressRing:setAlpha( 1 )
				progressRingFrame2( progressRing, {} )
				local glowFrame2 = function ( glow, event )
					local glowFrame3 = function ( glow, event )
						if not event.interrupted then
							glow:beginAnimation( "keyframe", 339, false, true, CoD.TweenType.Linear )
						end
						glow:setAlpha( 0 )
						glow:setScale( 1.5 )
						glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
						if event.interrupted then
							self.clipFinished( glow, event )
						else
							glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						glowFrame3( glow, event )
						return 
					else
						glow:beginAnimation( "keyframe", 170, false, true, CoD.TweenType.Linear )
						glow:setAlpha( 1 )
						glow:registerEventHandler( "transition_complete_keyframe", glowFrame3 )
					end
				end
				
				glow:completeAnimation()
				self.glow:setAlpha( 0 )
				self.glow:setScale( 0.95 )
				self.glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
				glowFrame2( glow, {} )
				local AbilitySwirlFrame2 = function ( AbilitySwirl, event )
					local AbilitySwirlFrame3 = function ( AbilitySwirl, event )
						if not event.interrupted then
							AbilitySwirl:beginAnimation( "keyframe", 339, false, false, CoD.TweenType.Linear )
						end
						AbilitySwirl:setAlpha( 0 )
						AbilitySwirl:setYRot( 0 )
						AbilitySwirl:setZRot( 600 )
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
						AbilitySwirl:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
						AbilitySwirl:setAlpha( 1 )
						AbilitySwirl:setZRot( 200 )
						AbilitySwirl:registerEventHandler( "transition_complete_keyframe", AbilitySwirlFrame3 )
					end
				end
				
				AbilitySwirl:completeAnimation()
				self.AbilitySwirl:setAlpha( 0 )
				self.AbilitySwirl:setYRot( 0 )
				self.AbilitySwirl:setZRot( 0 )
				AbilitySwirlFrame2( AbilitySwirl, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BackCircle:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

