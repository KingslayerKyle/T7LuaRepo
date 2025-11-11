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
	self:setLeftRight( 0, 0, 0, 60 )
	self:setTopBottom( 0, 0, 0, 60 )
	
	local Dust = LUI.UIImage.new()
	Dust:setLeftRight( 0.5, 0.5, -42, 42 )
	Dust:setTopBottom( 0.5, 0.5, -44, 42 )
	Dust:setAlpha( 0 )
	Dust:setImage( RegisterImage( "uie_t7_arena_icon_stars_dust" ) )
	self:addElement( Dust )
	self.Dust = Dust
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( 0.5, 0.5, -42, 42 )
	Glow:setTopBottom( 0.5, 0.5, -44, 42 )
	Glow:setAlpha( 0 )
	Glow:setImage( RegisterImage( "uie_t7_arena_icon_stars_outlineglow" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local outline = LUI.UIImage.new()
	outline:setLeftRight( 0.5, 0.5, -26, 26 )
	outline:setTopBottom( 0.5, 0.5, -26, 26 )
	outline:setRGB( 0.68, 0.68, 0.68 )
	outline:setAlpha( 0 )
	outline:setImage( RegisterImage( "uie_t7_arena_star_lrg_white" ) )
	self:addElement( outline )
	self.outline = outline
	
	local active = LUI.UIImage.new()
	active:setLeftRight( 0.5, 0.5, -26, 26 )
	active:setTopBottom( 0.5, 0.5, -26, 26 )
	active:setAlpha( 0 )
	active:setImage( RegisterImage( "uie_t7_arena_star_small_yellow" ) )
	self:addElement( active )
	self.active = active
	
	local activeGlint = LUI.UIImage.new()
	activeGlint:setLeftRight( 0.5, 0.5, -26, 26 )
	activeGlint:setTopBottom( 0.5, 0.5, -26, 26 )
	activeGlint:setRGB( 1, 0.81, 0 )
	activeGlint:setAlpha( 0.79 )
	activeGlint:setImage( RegisterImage( "uie_t7_arena_star_small_yellow" ) )
	activeGlint:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_glint_reveal" ) )
	activeGlint:setShaderVector( 0, 0, 0, 0, 0 )
	self:addElement( activeGlint )
	self.activeGlint = activeGlint
	
	local sound = LUI.UIElement.new()
	sound:setLeftRight( 0, 0, -304, -232 )
	sound:setTopBottom( 0, 0, -105, -33 )
	sound:setPlaySoundDirect( true )
	self:addElement( sound )
	self.sound = sound
	
	self.resetProperties = function ()
		outline:completeAnimation()
		active:completeAnimation()
		activeGlint:completeAnimation()
		Glow:completeAnimation()
		Dust:completeAnimation()
		sound:completeAnimation()
		outline:setAlpha( 0 )
		active:setRGB( 1, 1, 1 )
		active:setAlpha( 0 )
		active:setScale( 1 )
		active:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
		activeGlint:setRGB( 1, 0.81, 0 )
		activeGlint:setAlpha( 0.79 )
		activeGlint:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_glint_reveal" ) )
		activeGlint:setShaderVector( 0, 0, 0, 0, 0 )
		Glow:setAlpha( 0 )
		Dust:setRGB( 1, 1, 1 )
		Dust:setAlpha( 0 )
		Dust:setScale( 1 )
		sound:playSound( "uin_arena_star_gain", controller )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
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
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Inactive = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				outline:completeAnimation()
				self.outline:setAlpha( 0.5 )
				self.clipFinished( outline, {} )
				active:completeAnimation()
				self.active:setRGB( 1, 0.74, 0.01 )
				self.clipFinished( active, {} )
			end
		},
		Earned = {
			DefaultClip = function ()
				self.resetProperties()
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
				local activeGlintFrame2 = function ( activeGlint, event )
					local activeGlintFrame3 = function ( activeGlint, event )
						local activeGlintFrame4 = function ( activeGlint, event )
							local activeGlintFrame5 = function ( activeGlint, event )
								local activeGlintFrame6 = function ( activeGlint, event )
									if not event.interrupted then
										activeGlint:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
									end
									activeGlint:setRGB( 1, 0.81, 0 )
									activeGlint:setAlpha( 0 )
									activeGlint:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_glint_reveal" ) )
									activeGlint:setShaderVector( 0, 1, 0, 0, 0 )
									if event.interrupted then
										self.clipFinished( activeGlint, event )
									else
										activeGlint:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									activeGlintFrame6( activeGlint, event )
									return 
								else
									activeGlint:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									activeGlint:setAlpha( 0 )
									activeGlint:registerEventHandler( "transition_complete_keyframe", activeGlintFrame6 )
								end
							end
							
							if event.interrupted then
								activeGlintFrame5( activeGlint, event )
								return 
							else
								activeGlint:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
								activeGlint:setAlpha( 0.09 )
								activeGlint:setShaderVector( 0, 1, 0, 0, 0 )
								activeGlint:registerEventHandler( "transition_complete_keyframe", activeGlintFrame5 )
							end
						end
						
						if event.interrupted then
							activeGlintFrame4( activeGlint, event )
							return 
						else
							activeGlint:beginAnimation( "keyframe", 620, false, false, CoD.TweenType.Linear )
							activeGlint:setShaderVector( 0, 0.86, 0, 0, 0 )
							activeGlint:registerEventHandler( "transition_complete_keyframe", activeGlintFrame4 )
						end
					end
					
					if event.interrupted then
						activeGlintFrame3( activeGlint, event )
						return 
					else
						activeGlint:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						activeGlint:setAlpha( 1 )
						activeGlint:registerEventHandler( "transition_complete_keyframe", activeGlintFrame3 )
					end
				end
				
				activeGlint:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
				activeGlint:setRGB( 1, 0.81, 0 )
				activeGlint:setAlpha( 0 )
				activeGlint:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_glint_reveal" ) )
				activeGlint:setShaderVector( 0, 0, 0, 0, 0 )
				activeGlint:registerEventHandler( "transition_complete_keyframe", activeGlintFrame2 )
			end
		},
		NewlyEarned = {
			DefaultClip = function ()
				self.resetProperties()
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
				local activeFrame2 = function ( active, event )
					local activeFrame3 = function ( active, event )
						local activeFrame4 = function ( active, event )
							if not event.interrupted then
								active:beginAnimation( "keyframe", 1230, false, false, CoD.TweenType.Linear )
							end
							active:setAlpha( 1 )
							active:setScale( 1 )
							active:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
							if event.interrupted then
								self.clipFinished( active, event )
							else
								active:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							activeFrame4( active, event )
							return 
						else
							active:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
							active:registerEventHandler( "transition_complete_keyframe", activeFrame4 )
						end
					end
					
					if event.interrupted then
						activeFrame3( active, event )
						return 
					else
						active:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						active:setAlpha( 1 )
						active:setScale( 1 )
						active:registerEventHandler( "transition_complete_keyframe", activeFrame3 )
					end
				end
				
				active:beginAnimation( "keyframe", 990, false, false, CoD.TweenType.Linear )
				active:setAlpha( 0 )
				active:setScale( 4 )
				active:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				active:registerEventHandler( "transition_complete_keyframe", activeFrame2 )
				local soundFrame2 = function ( sound, event )
					if not event.interrupted then
						sound:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
					end
					sound:playSound( "uin_arena_star_gain", controller )
					if event.interrupted then
						self.clipFinished( sound, event )
					else
						sound:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				sound:beginAnimation( "keyframe", 980, false, false, CoD.TweenType.Linear )
				sound:playSound( "0", controller )
				sound:registerEventHandler( "transition_complete_keyframe", soundFrame2 )
			end
		},
		Lost = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
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
				local soundFrame2 = function ( sound, event )
					if not event.interrupted then
						sound:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
					end
					sound:playSound( "uin_arena_star_loss", controller )
					if event.interrupted then
						self.clipFinished( sound, event )
					else
						sound:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				sound:beginAnimation( "keyframe", 959, false, false, CoD.TweenType.Linear )
				sound:playSound( "0", controller )
				sound:registerEventHandler( "transition_complete_keyframe", soundFrame2 )
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
				local f33_local0
				if not IsSelfModelValueTrue( element, controller, "earned" ) then
					f33_local0 = not IsSelfModelValueTrue( element, controller, "lost" )
				else
					f33_local0 = false
				end
				return f33_local0
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

