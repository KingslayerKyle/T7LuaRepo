CoD.CallingCards_GoldFrame = InheritFrom( LUI.UIElement )
CoD.CallingCards_GoldFrame.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CallingCards_GoldFrame )
	self.id = "CallingCards_GoldFrame"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 720 )
	self:setTopBottom( 0, 0, 0, 180 )
	
	local frame = LUI.UIImage.new()
	frame:setLeftRight( 0, 0, 0, 720 )
	frame:setTopBottom( 0, 0, 0, 180 )
	frame:setImage( RegisterImage( "uie_t7_callingcard_goldframe" ) )
	frame:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( frame )
	self.frame = frame
	
	local frameglint = LUI.UIImage.new()
	frameglint:setLeftRight( 0, 0, 0, 720 )
	frameglint:setTopBottom( 0, 0, 0, 180 )
	frameglint:setRGB( 1, 0.67, 0.32 )
	frameglint:setImage( RegisterImage( "uie_t7_callingcard_goldframe" ) )
	frameglint:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_glint_reveal" ) )
	frameglint:setShaderVector( 0, 0.13, 0, 0, 0 )
	self:addElement( frameglint )
	self.frameglint = frameglint
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( 0, 0, 396, 382 )
	Glow:setTopBottom( 0, 0, -307, 314 )
	Glow:setRGB( 1, 0.79, 0.35 )
	Glow:setZRot( 90 )
	Glow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local GlowSmallCorner = LUI.UIImage.new()
	GlowSmallCorner:setLeftRight( 0, 0, 18.5, -4.5 )
	GlowSmallCorner:setTopBottom( 0, 0, 161, 185 )
	GlowSmallCorner:setRGB( 1, 0.79, 0.35 )
	GlowSmallCorner:setZRot( 90 )
	GlowSmallCorner:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowSmallCorner:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowSmallCorner )
	self.GlowSmallCorner = GlowSmallCorner
	
	local GlowSmallCorner2 = LUI.UIImage.new()
	GlowSmallCorner2:setLeftRight( 0, 0, 725.5, 702.5 )
	GlowSmallCorner2:setTopBottom( 0, 0, -5, 19 )
	GlowSmallCorner2:setRGB( 1, 0.79, 0.35 )
	GlowSmallCorner2:setZRot( 90 )
	GlowSmallCorner2:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowSmallCorner2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowSmallCorner2 )
	self.GlowSmallCorner2 = GlowSmallCorner2
	
	local GlowSmallCenter3 = LUI.UIImage.new()
	GlowSmallCenter3:setLeftRight( 0, 0, 493.5, 470.5 )
	GlowSmallCenter3:setTopBottom( 0, 0, -9, 15 )
	GlowSmallCenter3:setRGB( 1, 0.79, 0.35 )
	GlowSmallCenter3:setZRot( 90 )
	GlowSmallCenter3:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowSmallCenter3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowSmallCenter3 )
	self.GlowSmallCenter3 = GlowSmallCenter3
	
	local GlowSmallCorner4 = LUI.UIImage.new()
	GlowSmallCorner4:setLeftRight( 0, 0, 725.5, 702.5 )
	GlowSmallCorner4:setTopBottom( 0, 0, 161, 185 )
	GlowSmallCorner4:setRGB( 1, 0.79, 0.35 )
	GlowSmallCorner4:setAlpha( 0 )
	GlowSmallCorner4:setZRot( 90 )
	GlowSmallCorner4:setScale( 0.2 )
	GlowSmallCorner4:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowSmallCorner4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowSmallCorner4 )
	self.GlowSmallCorner4 = GlowSmallCorner4
	
	local GlowSmallCorner5 = LUI.UIImage.new()
	GlowSmallCorner5:setLeftRight( 0, 0, 18.5, -4.5 )
	GlowSmallCorner5:setTopBottom( 0, 0, -5, 19 )
	GlowSmallCorner5:setRGB( 1, 0.79, 0.35 )
	GlowSmallCorner5:setAlpha( 0 )
	GlowSmallCorner5:setZRot( 90 )
	GlowSmallCorner5:setScale( 0.5 )
	GlowSmallCorner5:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowSmallCorner5:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowSmallCorner5 )
	self.GlowSmallCorner5 = GlowSmallCorner5
	
	self.resetProperties = function ()
		frameglint:completeAnimation()
		GlowSmallCorner2:completeAnimation()
		GlowSmallCorner:completeAnimation()
		GlowSmallCenter3:completeAnimation()
		GlowSmallCorner4:completeAnimation()
		GlowSmallCorner5:completeAnimation()
		Glow:completeAnimation()
		frameglint:setAlpha( 1 )
		frameglint:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_glint_reveal" ) )
		frameglint:setShaderVector( 0, 0.13, 0, 0, 0 )
		GlowSmallCorner2:setAlpha( 1 )
		GlowSmallCorner2:setScale( 1 )
		GlowSmallCorner:setAlpha( 1 )
		GlowSmallCorner:setScale( 1 )
		GlowSmallCenter3:setAlpha( 1 )
		GlowSmallCenter3:setScale( 1 )
		GlowSmallCorner4:setAlpha( 0 )
		GlowSmallCorner4:setScale( 0.2 )
		GlowSmallCorner5:setAlpha( 0 )
		GlowSmallCorner5:setScale( 0.5 )
		Glow:setLeftRight( 0, 0, 396, 382 )
		Glow:setTopBottom( 0, 0, -307, 314 )
		Glow:setRGB( 1, 0.79, 0.35 )
		Glow:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				local frameglintFrame2 = function ( frameglint, event )
					local frameglintFrame3 = function ( frameglint, event )
						if not event.interrupted then
							frameglint:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						end
						frameglint:setAlpha( 0 )
						frameglint:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_glint_reveal" ) )
						frameglint:setShaderVector( 0, 1.2, 0, 0, 0 )
						if event.interrupted then
							self.clipFinished( frameglint, event )
						else
							frameglint:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						frameglintFrame3( frameglint, event )
						return 
					else
						frameglint:beginAnimation( "keyframe", 839, false, false, CoD.TweenType.Linear )
						frameglint:setShaderVector( 0, 1.2, 0, 0, 0 )
						frameglint:registerEventHandler( "transition_complete_keyframe", frameglintFrame3 )
					end
				end
				
				frameglint:completeAnimation()
				self.frameglint:setAlpha( 0.4 )
				self.frameglint:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_glint_reveal" ) )
				self.frameglint:setShaderVector( 0, 0, 0, 0, 0 )
				frameglintFrame2( frameglint, {} )
				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						if not event.interrupted then
							Glow:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
						end
						Glow:setLeftRight( 0, 0, 630, 614 )
						Glow:setTopBottom( 0, 0, -82.5, 89.5 )
						Glow:setRGB( 1, 0.6, 0.25 )
						Glow:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Glow, event )
						else
							Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
						Glow:setLeftRight( 0, 0, 449.5, 434.5 )
						Glow:setTopBottom( 0, 0, -194.75, 201.75 )
						Glow:setAlpha( 1 )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
				Glow:setLeftRight( 0, 0, 269, 255 )
				Glow:setTopBottom( 0, 0, -307, 314 )
				Glow:setRGB( 1, 0.6, 0.25 )
				Glow:setAlpha( 0 )
				Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame2 )
				local GlowSmallCornerFrame2 = function ( GlowSmallCorner, event )
					local GlowSmallCornerFrame3 = function ( GlowSmallCorner, event )
						if not event.interrupted then
							GlowSmallCorner:beginAnimation( "keyframe", 339, false, false, CoD.TweenType.Linear )
						end
						GlowSmallCorner:setAlpha( 0 )
						GlowSmallCorner:setScale( 0.5 )
						if event.interrupted then
							self.clipFinished( GlowSmallCorner, event )
						else
							GlowSmallCorner:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						GlowSmallCornerFrame3( GlowSmallCorner, event )
						return 
					else
						GlowSmallCorner:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						GlowSmallCorner:setAlpha( 1 )
						GlowSmallCorner:setScale( 2 )
						GlowSmallCorner:registerEventHandler( "transition_complete_keyframe", GlowSmallCornerFrame3 )
					end
				end
				
				GlowSmallCorner:completeAnimation()
				self.GlowSmallCorner:setAlpha( 0 )
				self.GlowSmallCorner:setScale( 0.5 )
				GlowSmallCornerFrame2( GlowSmallCorner, {} )
				local GlowSmallCorner2Frame2 = function ( GlowSmallCorner2, event )
					local GlowSmallCorner2Frame3 = function ( GlowSmallCorner2, event )
						local GlowSmallCorner2Frame4 = function ( GlowSmallCorner2, event )
							if not event.interrupted then
								GlowSmallCorner2:beginAnimation( "keyframe", 339, false, false, CoD.TweenType.Linear )
							end
							GlowSmallCorner2:setAlpha( 0 )
							GlowSmallCorner2:setScale( 0.5 )
							if event.interrupted then
								self.clipFinished( GlowSmallCorner2, event )
							else
								GlowSmallCorner2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							GlowSmallCorner2Frame4( GlowSmallCorner2, event )
							return 
						else
							GlowSmallCorner2:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
							GlowSmallCorner2:setAlpha( 1 )
							GlowSmallCorner2:setScale( 1.3 )
							GlowSmallCorner2:registerEventHandler( "transition_complete_keyframe", GlowSmallCorner2Frame4 )
						end
					end
					
					if event.interrupted then
						GlowSmallCorner2Frame3( GlowSmallCorner2, event )
						return 
					else
						GlowSmallCorner2:beginAnimation( "keyframe", 540, false, false, CoD.TweenType.Linear )
						GlowSmallCorner2:registerEventHandler( "transition_complete_keyframe", GlowSmallCorner2Frame3 )
					end
				end
				
				GlowSmallCorner2:completeAnimation()
				self.GlowSmallCorner2:setAlpha( 0 )
				self.GlowSmallCorner2:setScale( 0.5 )
				GlowSmallCorner2Frame2( GlowSmallCorner2, {} )
				local GlowSmallCenter3Frame2 = function ( GlowSmallCenter3, event )
					local GlowSmallCenter3Frame3 = function ( GlowSmallCenter3, event )
						local GlowSmallCenter3Frame4 = function ( GlowSmallCenter3, event )
							if not event.interrupted then
								GlowSmallCenter3:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
							end
							GlowSmallCenter3:setAlpha( 0 )
							GlowSmallCenter3:setScale( 0.2 )
							if event.interrupted then
								self.clipFinished( GlowSmallCenter3, event )
							else
								GlowSmallCenter3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							GlowSmallCenter3Frame4( GlowSmallCenter3, event )
							return 
						else
							GlowSmallCenter3:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
							GlowSmallCenter3:setAlpha( 1 )
							GlowSmallCenter3:setScale( 0.7 )
							GlowSmallCenter3:registerEventHandler( "transition_complete_keyframe", GlowSmallCenter3Frame4 )
						end
					end
					
					if event.interrupted then
						GlowSmallCenter3Frame3( GlowSmallCenter3, event )
						return 
					else
						GlowSmallCenter3:beginAnimation( "keyframe", 970, false, false, CoD.TweenType.Linear )
						GlowSmallCenter3:registerEventHandler( "transition_complete_keyframe", GlowSmallCenter3Frame3 )
					end
				end
				
				GlowSmallCenter3:completeAnimation()
				self.GlowSmallCenter3:setAlpha( 0 )
				self.GlowSmallCenter3:setScale( 0.2 )
				GlowSmallCenter3Frame2( GlowSmallCenter3, {} )
				local GlowSmallCorner4Frame2 = function ( GlowSmallCorner4, event )
					local GlowSmallCorner4Frame3 = function ( GlowSmallCorner4, event )
						local GlowSmallCorner4Frame4 = function ( GlowSmallCorner4, event )
							if not event.interrupted then
								GlowSmallCorner4:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
							end
							GlowSmallCorner4:setAlpha( 0 )
							GlowSmallCorner4:setScale( 0.5 )
							if event.interrupted then
								self.clipFinished( GlowSmallCorner4, event )
							else
								GlowSmallCorner4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							GlowSmallCorner4Frame4( GlowSmallCorner4, event )
							return 
						else
							GlowSmallCorner4:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
							GlowSmallCorner4:setAlpha( 1 )
							GlowSmallCorner4:setScale( 1.3 )
							GlowSmallCorner4:registerEventHandler( "transition_complete_keyframe", GlowSmallCorner4Frame4 )
						end
					end
					
					if event.interrupted then
						GlowSmallCorner4Frame3( GlowSmallCorner4, event )
						return 
					else
						GlowSmallCorner4:beginAnimation( "keyframe", 1220, false, false, CoD.TweenType.Linear )
						GlowSmallCorner4:registerEventHandler( "transition_complete_keyframe", GlowSmallCorner4Frame3 )
					end
				end
				
				GlowSmallCorner4:completeAnimation()
				self.GlowSmallCorner4:setAlpha( 0 )
				self.GlowSmallCorner4:setScale( 0.5 )
				GlowSmallCorner4Frame2( GlowSmallCorner4, {} )
				local GlowSmallCorner5Frame2 = function ( GlowSmallCorner5, event )
					local GlowSmallCorner5Frame3 = function ( GlowSmallCorner5, event )
						local GlowSmallCorner5Frame4 = function ( GlowSmallCorner5, event )
							if not event.interrupted then
								GlowSmallCorner5:beginAnimation( "keyframe", 339, false, false, CoD.TweenType.Linear )
							end
							GlowSmallCorner5:setAlpha( 0 )
							GlowSmallCorner5:setScale( 0.5 )
							if event.interrupted then
								self.clipFinished( GlowSmallCorner5, event )
							else
								GlowSmallCorner5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							GlowSmallCorner5Frame4( GlowSmallCorner5, event )
							return 
						else
							GlowSmallCorner5:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
							GlowSmallCorner5:setAlpha( 1 )
							GlowSmallCorner5:setScale( 1.3 )
							GlowSmallCorner5:registerEventHandler( "transition_complete_keyframe", GlowSmallCorner5Frame4 )
						end
					end
					
					if event.interrupted then
						GlowSmallCorner5Frame3( GlowSmallCorner5, event )
						return 
					else
						GlowSmallCorner5:beginAnimation( "keyframe", 2579, false, false, CoD.TweenType.Linear )
						GlowSmallCorner5:registerEventHandler( "transition_complete_keyframe", GlowSmallCorner5Frame3 )
					end
				end
				
				GlowSmallCorner5:completeAnimation()
				self.GlowSmallCorner5:setAlpha( 0 )
				self.GlowSmallCorner5:setScale( 0.5 )
				GlowSmallCorner5Frame2( GlowSmallCorner5, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

