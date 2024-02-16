-- 88054472938fc2c9d944f814aa02cd7c
-- This hash is used for caching, delete to decompile the file again

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	if ArenaChallengesEnabled() then
		f1_arg0:registerEventHandler( "clip_over", function ( element, event )
			if element.currentState == "NewlyEarned" then
				CoD.ArenaUtility.PlayRecentArenaChallengeToasts( f1_arg1 )
			end
		end )
	end
end

CoD.ArenaStarbig = InheritFrom( LUI.UIElement )
CoD.ArenaStarbig.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ArenaStarbig )
	self.id = "ArenaStarbig"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 40 )
	self:setTopBottom( true, false, 0, 40 )
	
	local Dust = LUI.UIImage.new()
	Dust:setLeftRight( false, false, -28, 28 )
	Dust:setTopBottom( false, false, -29, 28 )
	Dust:setAlpha( 0 )
	Dust:setImage( RegisterImage( "uie_t7_arena_icon_stars_dust" ) )
	self:addElement( Dust )
	self.Dust = Dust
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( false, false, -28, 28 )
	Glow:setTopBottom( false, false, -29, 28 )
	Glow:setAlpha( 0 )
	Glow:setImage( RegisterImage( "uie_t7_arena_icon_stars_outlineglow" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local outline = LUI.UIImage.new()
	outline:setLeftRight( false, false, -17.5, 17.5 )
	outline:setTopBottom( false, false, -17.5, 17.5 )
	outline:setRGB( 0.68, 0.68, 0.68 )
	outline:setAlpha( 0 )
	outline:setImage( RegisterImage( "uie_t7_arena_star_lrg_white" ) )
	self:addElement( outline )
	self.outline = outline
	
	local active = LUI.UIImage.new()
	active:setLeftRight( false, false, -17.5, 17.5 )
	active:setTopBottom( false, false, -17.5, 17.5 )
	active:setAlpha( 0 )
	active:setImage( RegisterImage( "uie_t7_arena_star_small_yellow" ) )
	self:addElement( active )
	self.active = active
	
	local activeGlint = LUI.UIImage.new()
	activeGlint:setLeftRight( false, false, -17.5, 17.5 )
	activeGlint:setTopBottom( false, false, -17.5, 17.5 )
	activeGlint:setRGB( 1, 0.81, 0 )
	activeGlint:setAlpha( 0.79 )
	activeGlint:setImage( RegisterImage( "uie_t7_arena_star_small_yellow" ) )
	activeGlint:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint_reveal" ) )
	activeGlint:setShaderVector( 0, 0, 0, 0, 0 )
	self:addElement( activeGlint )
	self.activeGlint = activeGlint
	
	local sound = LUI.UIElement.new()
	sound:setLeftRight( true, false, -202.5, -154.5 )
	sound:setTopBottom( true, false, -70, -22 )
	sound:setPlaySoundDirect( true )
	self:addElement( sound )
	self.sound = sound
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				outline:completeAnimation()
				self.outline:setAlpha( 1 )
				self.clipFinished( outline, {} )

				active:completeAnimation()
				self.active:setAlpha( 1 )
				self.clipFinished( active, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				Dust:completeAnimation()
				self.Dust:setAlpha( 0 )
				self.clipFinished( Dust, {} )

				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )

				outline:completeAnimation()
				self.outline:setAlpha( 0 )
				self.clipFinished( outline, {} )

				active:completeAnimation()
				self.active:setAlpha( 0 )
				self.clipFinished( active, {} )
			end
		},
		Inactive = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				Dust:completeAnimation()
				self.Dust:setAlpha( 0 )
				self.clipFinished( Dust, {} )

				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )

				outline:completeAnimation()
				self.outline:setAlpha( 0.5 )
				self.clipFinished( outline, {} )

				active:completeAnimation()
				self.active:setRGB( 1, 0.74, 0.01 )
				self.active:setAlpha( 0 )
				self.clipFinished( active, {} )
			end
		},
		Earned = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				local activeFrame2 = function ( active, event )
					if not event.interrupted then
						active:beginAnimation( "keyframe", 1840, false, false, CoD.TweenType.Linear )
					end
					active:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( active, event )
					else
						active:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				active:completeAnimation()
				self.active:setAlpha( 1 )
				activeFrame2( active, {} )
				local f7_local1 = function ( f9_arg0, f9_arg1 )
					local f9_local0 = function ( f10_arg0, f10_arg1 )
						local f10_local0 = function ( f11_arg0, f11_arg1 )
							local f11_local0 = function ( f12_arg0, f12_arg1 )
								local f12_local0 = function ( f13_arg0, f13_arg1 )
									if not f13_arg1.interrupted then
										f13_arg0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
									end
									f13_arg0:setRGB( 1, 0.81, 0 )
									f13_arg0:setAlpha( 0 )
									f13_arg0:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint_reveal" ) )
									f13_arg0:setShaderVector( 0, 1, 0, 0, 0 )
									if f13_arg1.interrupted then
										self.clipFinished( f13_arg0, f13_arg1 )
									else
										f13_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f12_arg1.interrupted then
									f12_local0( f12_arg0, f12_arg1 )
									return 
								else
									f12_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									f12_arg0:setAlpha( 0 )
									f12_arg0:registerEventHandler( "transition_complete_keyframe", f12_local0 )
								end
							end
							
							if f11_arg1.interrupted then
								f11_local0( f11_arg0, f11_arg1 )
								return 
							else
								f11_arg0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
								f11_arg0:setAlpha( 0.09 )
								f11_arg0:setShaderVector( 0, 1, 0, 0, 0 )
								f11_arg0:registerEventHandler( "transition_complete_keyframe", f11_local0 )
							end
						end
						
						if f10_arg1.interrupted then
							f10_local0( f10_arg0, f10_arg1 )
							return 
						else
							f10_arg0:beginAnimation( "keyframe", 620, false, false, CoD.TweenType.Linear )
							f10_arg0:setShaderVector( 0, 0.86, 0, 0, 0 )
							f10_arg0:registerEventHandler( "transition_complete_keyframe", f10_local0 )
						end
					end
					
					if f9_arg1.interrupted then
						f9_local0( f9_arg0, f9_arg1 )
						return 
					else
						f9_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						f9_arg0:setAlpha( 1 )
						f9_arg0:registerEventHandler( "transition_complete_keyframe", f9_local0 )
					end
				end
				
				activeGlint:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
				activeGlint:setRGB( 1, 0.81, 0 )
				activeGlint:setAlpha( 0 )
				activeGlint:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint_reveal" ) )
				activeGlint:setShaderVector( 0, 0, 0, 0, 0 )
				activeGlint:registerEventHandler( "transition_complete_keyframe", f7_local1 )
			end
		},
		NewlyEarned = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				local DustFrame2 = function ( Dust, event )
					local DustFrame3 = function ( Dust, event )
						local DustFrame4 = function ( Dust, event )
							if not event.interrupted then
								Dust:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
							end
							Dust:setAlpha( 0 )
							Dust:setScale( 1.3 )
							if event.interrupted then
								self.clipFinished( Dust, event )
							else
								Dust:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							DustFrame4( Dust, event )
							return 
						else
							Dust:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
							Dust:setAlpha( 0.94 )
							Dust:registerEventHandler( "transition_complete_keyframe", DustFrame4 )
						end
					end
					
					if event.interrupted then
						DustFrame3( Dust, event )
						return 
					else
						Dust:beginAnimation( "keyframe", 1169, false, false, CoD.TweenType.Linear )
						Dust:registerEventHandler( "transition_complete_keyframe", DustFrame3 )
					end
				end
				
				Dust:completeAnimation()
				self.Dust:setAlpha( 0 )
				self.Dust:setScale( 1 )
				DustFrame2( Dust, {} )
				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						local GlowFrame4 = function ( Glow, event )
							if not event.interrupted then
								Glow:beginAnimation( "keyframe", 339, false, false, CoD.TweenType.Linear )
							end
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
							Glow:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
							Glow:setAlpha( 1 )
							Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame4 )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 1169, false, false, CoD.TweenType.Linear )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )

				outline:completeAnimation()
				self.outline:setAlpha( 0.5 )
				self.clipFinished( outline, {} )
				local f14_local2 = function ( f21_arg0, f21_arg1 )
					local f21_local0 = function ( f22_arg0, f22_arg1 )
						local f22_local0 = function ( f23_arg0, f23_arg1 )
							if not f23_arg1.interrupted then
								f23_arg0:beginAnimation( "keyframe", 1230, false, false, CoD.TweenType.Linear )
							end
							f23_arg0:setAlpha( 1 )
							f23_arg0:setScale( 1 )
							f23_arg0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
							if f23_arg1.interrupted then
								self.clipFinished( f23_arg0, f23_arg1 )
							else
								f23_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f22_arg1.interrupted then
							f22_local0( f22_arg0, f22_arg1 )
							return 
						else
							f22_arg0:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
							f22_arg0:registerEventHandler( "transition_complete_keyframe", f22_local0 )
						end
					end
					
					if f21_arg1.interrupted then
						f21_local0( f21_arg0, f21_arg1 )
						return 
					else
						f21_arg0:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						f21_arg0:setAlpha( 1 )
						f21_arg0:setScale( 1 )
						f21_arg0:registerEventHandler( "transition_complete_keyframe", f21_local0 )
					end
				end
				
				active:beginAnimation( "keyframe", 990, false, false, CoD.TweenType.Linear )
				active:setAlpha( 0 )
				active:setScale( 4 )
				active:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				active:registerEventHandler( "transition_complete_keyframe", f14_local2 )
				local f14_local3 = function ( f24_arg0, f24_arg1 )
					if not f24_arg1.interrupted then
						f24_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
					end
					f24_arg0:playSound( "uin_arena_star_gain", controller )
					if f24_arg1.interrupted then
						self.clipFinished( f24_arg0, f24_arg1 )
					else
						f24_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				sound:beginAnimation( "keyframe", 980, false, false, CoD.TweenType.Linear )
				sound:playSound( "0", controller )
				sound:registerEventHandler( "transition_complete_keyframe", f14_local3 )
			end
		},
		Lost = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				local DustFrame2 = function ( Dust, event )
					local DustFrame3 = function ( Dust, event )
						local DustFrame4 = function ( Dust, event )
							local DustFrame5 = function ( Dust, event )
								if not event.interrupted then
									Dust:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
								end
								Dust:setRGB( 1, 1, 1 )
								Dust:setAlpha( 0 )
								Dust:setScale( 0.7 )
								if event.interrupted then
									self.clipFinished( Dust, event )
								else
									Dust:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								DustFrame5( Dust, event )
								return 
							else
								Dust:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
								Dust:setRGB( 1, 1, 1 )
								Dust:setAlpha( 1 )
								Dust:setScale( 0.7 )
								Dust:registerEventHandler( "transition_complete_keyframe", DustFrame5 )
							end
						end
						
						if event.interrupted then
							DustFrame4( Dust, event )
							return 
						else
							Dust:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
							Dust:setAlpha( 0.79 )
							Dust:registerEventHandler( "transition_complete_keyframe", DustFrame4 )
						end
					end
					
					if event.interrupted then
						DustFrame3( Dust, event )
						return 
					else
						Dust:beginAnimation( "keyframe", 860, false, false, CoD.TweenType.Linear )
						Dust:registerEventHandler( "transition_complete_keyframe", DustFrame3 )
					end
				end
				
				Dust:completeAnimation()
				self.Dust:setRGB( 1, 0.82, 0 )
				self.Dust:setAlpha( 0 )
				self.Dust:setScale( 1 )
				DustFrame2( Dust, {} )

				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )

				outline:completeAnimation()
				self.outline:setAlpha( 0.5 )
				self.clipFinished( outline, {} )
				local activeFrame2 = function ( active, event )
					local activeFrame3 = function ( active, event )
						if not event.interrupted then
							active:beginAnimation( "keyframe", 559, false, false, CoD.TweenType.Bounce )
						end
						active:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( active, event )
						else
							active:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						activeFrame3( active, event )
						return 
					else
						active:beginAnimation( "keyframe", 970, false, false, CoD.TweenType.Linear )
						active:registerEventHandler( "transition_complete_keyframe", activeFrame3 )
					end
				end
				
				active:completeAnimation()
				self.active:setAlpha( 1 )
				activeFrame2( active, {} )
				local f25_local2 = function ( f32_arg0, f32_arg1 )
					if not f32_arg1.interrupted then
						f32_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
					end
					f32_arg0:playSound( "uin_arena_star_loss", controller )
					if f32_arg1.interrupted then
						self.clipFinished( f32_arg0, f32_arg1 )
					else
						f32_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				sound:beginAnimation( "keyframe", 959, false, false, CoD.TweenType.Linear )
				sound:playSound( "0", controller )
				sound:registerEventHandler( "transition_complete_keyframe", f25_local2 )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Inactive",
			condition = function ( menu, element, event )
				local f34_local0
				if not IsSelfModelValueTrue( element, controller, "earned" ) then
					f34_local0 = not IsSelfModelValueTrue( element, controller, "lost" )
				else
					f34_local0 = false
				end
				return f34_local0
			end
		},
		{
			stateName = "Earned",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "earned" ) and not IsSelfModelValueTrue( element, controller, "new" )
			end
		},
		{
			stateName = "NewlyEarned",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "earned" ) and IsSelfModelValueTrue( element, controller, "new" )
			end
		},
		{
			stateName = "Lost",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "lost" )
			end
		}
	} )
	self:linkToElementModel( self, "earned", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "earned"
		} )
	end )
	self:linkToElementModel( self, "lost", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lost"
		} )
	end )
	self:linkToElementModel( self, "new", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "new"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
