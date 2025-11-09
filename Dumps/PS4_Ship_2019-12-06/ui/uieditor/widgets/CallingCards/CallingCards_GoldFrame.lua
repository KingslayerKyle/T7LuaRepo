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
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	
	local frame = LUI.UIImage.new()
	frame:setLeftRight( true, false, 0, 480 )
	frame:setTopBottom( true, false, 0, 120 )
	frame:setImage( RegisterImage( "uie_t7_callingcard_goldframe" ) )
	frame:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( frame )
	self.frame = frame
	
	local frameglint = LUI.UIImage.new()
	frameglint:setLeftRight( true, false, 0, 480 )
	frameglint:setTopBottom( true, false, 0, 120 )
	frameglint:setRGB( 1, 0.67, 0.32 )
	frameglint:setImage( RegisterImage( "uie_t7_callingcard_goldframe" ) )
	frameglint:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint_reveal" ) )
	frameglint:setShaderVector( 0, 0.13, 0, 0, 0 )
	self:addElement( frameglint )
	self.frameglint = frameglint
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( true, false, 264.33, 254.67 )
	Glow:setTopBottom( true, false, -204.7, 209 )
	Glow:setRGB( 1, 0.79, 0.35 )
	Glow:setZRot( 90 )
	Glow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local GlowSmallCorner = LUI.UIImage.new()
	GlowSmallCorner:setLeftRight( true, false, 12.67, -3 )
	GlowSmallCorner:setTopBottom( true, false, 107.3, 123 )
	GlowSmallCorner:setRGB( 1, 0.79, 0.35 )
	GlowSmallCorner:setZRot( 90 )
	GlowSmallCorner:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowSmallCorner:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowSmallCorner )
	self.GlowSmallCorner = GlowSmallCorner
	
	local GlowSmallCorner2 = LUI.UIImage.new()
	GlowSmallCorner2:setLeftRight( true, false, 484, 468.33 )
	GlowSmallCorner2:setTopBottom( true, false, -3, 12.7 )
	GlowSmallCorner2:setRGB( 1, 0.79, 0.35 )
	GlowSmallCorner2:setZRot( 90 )
	GlowSmallCorner2:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowSmallCorner2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowSmallCorner2 )
	self.GlowSmallCorner2 = GlowSmallCorner2
	
	local GlowSmallCenter3 = LUI.UIImage.new()
	GlowSmallCenter3:setLeftRight( true, false, 329, 313.33 )
	GlowSmallCenter3:setTopBottom( true, false, -5.7, 10 )
	GlowSmallCenter3:setRGB( 1, 0.79, 0.35 )
	GlowSmallCenter3:setZRot( 90 )
	GlowSmallCenter3:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowSmallCenter3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowSmallCenter3 )
	self.GlowSmallCenter3 = GlowSmallCenter3
	
	local GlowSmallCorner4 = LUI.UIImage.new()
	GlowSmallCorner4:setLeftRight( true, false, 484, 468.33 )
	GlowSmallCorner4:setTopBottom( true, false, 107.3, 123 )
	GlowSmallCorner4:setRGB( 1, 0.79, 0.35 )
	GlowSmallCorner4:setAlpha( 0 )
	GlowSmallCorner4:setZRot( 90 )
	GlowSmallCorner4:setScale( 0.2 )
	GlowSmallCorner4:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowSmallCorner4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowSmallCorner4 )
	self.GlowSmallCorner4 = GlowSmallCorner4
	
	local GlowSmallCorner5 = LUI.UIImage.new()
	GlowSmallCorner5:setLeftRight( true, false, 12.67, -3 )
	GlowSmallCorner5:setTopBottom( true, false, -3, 12.7 )
	GlowSmallCorner5:setRGB( 1, 0.79, 0.35 )
	GlowSmallCorner5:setAlpha( 0 )
	GlowSmallCorner5:setZRot( 90 )
	GlowSmallCorner5:setScale( 0.5 )
	GlowSmallCorner5:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowSmallCorner5:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowSmallCorner5 )
	self.GlowSmallCorner5 = GlowSmallCorner5
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				frame:completeAnimation()
				self.frame:setAlpha( 1 )
				self.clipFinished( frame, {} )
				local frameglintFrame2 = function ( frameglint, event )
					local frameglintFrame3 = function ( frameglint, event )
						if not event.interrupted then
							frameglint:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						end
						frameglint:setAlpha( 0 )
						frameglint:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint_reveal" ) )
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
				self.frameglint:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint_reveal" ) )
				self.frameglint:setShaderVector( 0, 0, 0, 0, 0 )
				frameglintFrame2( frameglint, {} )
				local f2_local1 = function ( f5_arg0, f5_arg1 )
					local f5_local0 = function ( f6_arg0, f6_arg1 )
						if not f6_arg1.interrupted then
							f6_arg0:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
						end
						f6_arg0:setLeftRight( true, false, 420.33, 409.67 )
						f6_arg0:setTopBottom( true, false, -54.7, 60 )
						f6_arg0:setRGB( 1, 0.6, 0.25 )
						f6_arg0:setAlpha( 0 )
						if f6_arg1.interrupted then
							self.clipFinished( f6_arg0, f6_arg1 )
						else
							f6_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f5_arg1.interrupted then
						f5_local0( f5_arg0, f5_arg1 )
						return 
					else
						f5_arg0:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
						f5_arg0:setLeftRight( true, false, 299.83, 289.67 )
						f5_arg0:setTopBottom( true, false, -129.7, 134.5 )
						f5_arg0:setAlpha( 1 )
						f5_arg0:registerEventHandler( "transition_complete_keyframe", f5_local0 )
					end
				end
				
				Glow:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
				Glow:setLeftRight( true, false, 179.33, 169.67 )
				Glow:setTopBottom( true, false, -204.7, 209 )
				Glow:setRGB( 1, 0.6, 0.25 )
				Glow:setAlpha( 0 )
				Glow:registerEventHandler( "transition_complete_keyframe", f2_local1 )
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
							GlowSmallCorner4:setLeftRight( true, false, 484, 468.33 )
							GlowSmallCorner4:setTopBottom( true, false, 107.3, 123 )
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
				self.GlowSmallCorner4:setLeftRight( true, false, 484, 468.33 )
				self.GlowSmallCorner4:setTopBottom( true, false, 107.3, 123 )
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

