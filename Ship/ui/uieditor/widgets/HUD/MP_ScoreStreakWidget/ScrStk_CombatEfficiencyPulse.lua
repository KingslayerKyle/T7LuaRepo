-- c417ee57c145b762d227e5792bebb442
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.MP_ScoreStreakWidget.ScrStk_CombatEfficiencyScrollFX" )

CoD.ScrStk_CombatEfficiencyPulse = InheritFrom( LUI.UIElement )
CoD.ScrStk_CombatEfficiencyPulse.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ScrStk_CombatEfficiencyPulse )
	self.id = "ScrStk_CombatEfficiencyPulse"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 73 )
	self:setTopBottom( true, false, 0, 117 )
	self.anyChildUsesUpdateState = true
	
	local ScrStkCombatEfficiencyScrollFX0 = CoD.ScrStk_CombatEfficiencyScrollFX.new( menu, controller )
	ScrStkCombatEfficiencyScrollFX0:setLeftRight( false, false, -19, 0 )
	ScrStkCombatEfficiencyScrollFX0:setTopBottom( true, true, 0, 0 )
	ScrStkCombatEfficiencyScrollFX0:setRGB( 0.84, 0.98, 1 )
	self:addElement( ScrStkCombatEfficiencyScrollFX0 )
	self.ScrStkCombatEfficiencyScrollFX0 = ScrStkCombatEfficiencyScrollFX0
	
	local ScrStkCombatEfficiencyScrollFX00 = CoD.ScrStk_CombatEfficiencyScrollFX.new( menu, controller )
	ScrStkCombatEfficiencyScrollFX00:setLeftRight( false, false, 0, 19 )
	ScrStkCombatEfficiencyScrollFX00:setTopBottom( true, true, 0, 0 )
	ScrStkCombatEfficiencyScrollFX00:setRGB( 0.84, 0.98, 1 )
	ScrStkCombatEfficiencyScrollFX00:setYRot( 180 )
	self:addElement( ScrStkCombatEfficiencyScrollFX00 )
	self.ScrStkCombatEfficiencyScrollFX00 = ScrStkCombatEfficiencyScrollFX00
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( false, false, -35.19, 36.81 )
	Image0:setTopBottom( true, true, 0, 0 )
	Image0:setRGB( 0, 0.79, 1 )
	Image0:setAlpha( 0 )
	Image0:setImage( RegisterImage( "uie_t7_mp_hud_scorestreak_fillglowvert" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( false, false, -55.69, 57.31 )
	Glow:setTopBottom( false, false, -58.5, 58.5 )
	Glow:setRGB( 0, 0.6, 1 )
	Glow:setAlpha( 0 )
	Glow:setImage( RegisterImage( "uie_t7_cp_hud_tacmode_glow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				Image0:completeAnimation()
				self.Image0:setAlpha( 0 )
				self.clipFinished( Image0, {} )

				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
			end,
			ScoreAdded = function ()
				self:setupElementClipCounter( 2 )

				local Image0Frame2 = function ( Image0, event )
					local Image0Frame3 = function ( Image0, event )
						if not event.interrupted then
							Image0:beginAnimation( "keyframe", 489, false, false, CoD.TweenType.Linear )
						end
						Image0:setLeftRight( false, false, -42, 42 )
						Image0:setTopBottom( true, true, 0, 0 )
						Image0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Image0, event )
						else
							Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Image0Frame3( Image0, event )
						return 
					else
						Image0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						Image0:setLeftRight( false, false, -22.01, 20.68 )
						Image0:setAlpha( 1 )
						Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame3 )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setLeftRight( false, false, -21.19, 19.81 )
				self.Image0:setTopBottom( true, true, 0, 0 )
				self.Image0:setAlpha( 0 )
				Image0Frame2( Image0, {} )
				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						local GlowFrame4 = function ( Glow, event )
							if not event.interrupted then
								Glow:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							end
							Glow:setLeftRight( false, false, -55.69, 57.31 )
							Glow:setTopBottom( false, false, -58.5, 58.5 )
							Glow:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Glow, event )
							else
								Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							GlowFrame4( Glow, event )
							return 
						else
							Glow:beginAnimation( "keyframe", 450, false, false, CoD.TweenType.Linear )
							Glow:setLeftRight( false, false, -55.07, 56.51 )
							Glow:setAlpha( 0 )
							Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame4 )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						Glow:setLeftRight( false, false, -27.31, 20.51 )
						Glow:setAlpha( 1 )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setLeftRight( false, false, -24.84, 17.31 )
				self.Glow:setTopBottom( false, false, -58.5, 58.5 )
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ScrStkCombatEfficiencyScrollFX0:close()
		element.ScrStkCombatEfficiencyScrollFX00:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
