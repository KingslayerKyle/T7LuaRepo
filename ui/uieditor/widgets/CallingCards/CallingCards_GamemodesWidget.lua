-- f579736c378d20a76257b38bb6fe9153
-- This hash is used for caching, delete to decompile the file again

CoD.CallingCards_GamemodesWidget = InheritFrom( LUI.UIElement )
CoD.CallingCards_GamemodesWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_GamemodesWidget )
	self.id = "CallingCards_GamemodesWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( true, false, 0, 480 )
	BG:setTopBottom( true, false, 0, 120 )
	BG:setImage( RegisterImage( "uie_t7_callingcard_gamemodes_bg" ) )
	self:addElement( BG )
	self.BG = BG
	
	local GlowOrangeOver0 = LUI.UIImage.new()
	GlowOrangeOver0:setLeftRight( true, false, 301.8, 438.2 )
	GlowOrangeOver0:setTopBottom( true, false, -76.97, 228.97 )
	GlowOrangeOver0:setRGB( 1, 0.64, 0 )
	GlowOrangeOver0:setAlpha( 0.44 )
	GlowOrangeOver0:setZRot( 80 )
	GlowOrangeOver0:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowOrangeOver0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowOrangeOver0 )
	self.GlowOrangeOver0 = GlowOrangeOver0
	
	local Clouds = LUI.UIImage.new()
	Clouds:setLeftRight( true, false, -217.5, 611.5 )
	Clouds:setTopBottom( true, false, -143.52, 89 )
	Clouds:setAlpha( 0.6 )
	Clouds:setImage( RegisterImage( "uie_t7_callingcard_mp_career_medieval_clouds" ) )
	Clouds:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	Clouds:setShaderVector( 0, 1, 1, 0, 0 )
	Clouds:setShaderVector( 1, -0.08, 0, 0, 0 )
	self:addElement( Clouds )
	self.Clouds = Clouds
	
	local man = LUI.UIImage.new()
	man:setLeftRight( true, false, 110, 480 )
	man:setTopBottom( true, false, 0, 120 )
	man:setImage( RegisterImage( "uie_t7_callingcard_gamemodes_man" ) )
	self:addElement( man )
	self.man = man
	
	local beard = LUI.UIImage.new()
	beard:setLeftRight( true, false, 347, 411 )
	beard:setTopBottom( true, false, 32, 64 )
	beard:setImage( RegisterImage( "uie_t7_callingcard_gamemodes_manbeard" ) )
	beard:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
	beard:setShaderVector( 0, 2, 0, 0, 0 )
	beard:setShaderVector( 1, 7.96, 0, 0, 0 )
	self:addElement( beard )
	self.beard = beard
	
	local ribbon4 = LUI.UIImage.new()
	ribbon4:setLeftRight( true, false, 360, 480 )
	ribbon4:setTopBottom( true, false, 81, 113 )
	ribbon4:setImage( RegisterImage( "uie_t7_callingcard_gamemodes_ribbon1" ) )
	ribbon4:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
	ribbon4:setShaderVector( 0, 2, 0, 0, 0 )
	ribbon4:setShaderVector( 1, 7, 0, 0, 0 )
	self:addElement( ribbon4 )
	self.ribbon4 = ribbon4
	
	local ribbon3 = LUI.UIImage.new()
	ribbon3:setLeftRight( true, false, 360, 480 )
	ribbon3:setTopBottom( true, false, 73, 105 )
	ribbon3:setImage( RegisterImage( "uie_t7_callingcard_gamemodes_ribbon2" ) )
	ribbon3:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
	ribbon3:setShaderVector( 0, 2, 0, 0, 0 )
	ribbon3:setShaderVector( 1, 7, 0, 0, 0 )
	self:addElement( ribbon3 )
	self.ribbon3 = ribbon3
	
	local ribbon2 = LUI.UIImage.new()
	ribbon2:setLeftRight( true, false, 269, 389 )
	ribbon2:setTopBottom( true, false, 57, 89 )
	ribbon2:setImage( RegisterImage( "uie_t7_callingcard_gamemodes_ribbon3" ) )
	ribbon2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
	ribbon2:setShaderVector( 0, 2, 0, 0, 0 )
	ribbon2:setShaderVector( 1, 8.59, 0, 0, 0 )
	self:addElement( ribbon2 )
	self.ribbon2 = ribbon2
	
	local ribbon1 = LUI.UIImage.new()
	ribbon1:setLeftRight( true, false, 250, 370 )
	ribbon1:setTopBottom( true, false, 65, 97 )
	ribbon1:setImage( RegisterImage( "uie_t7_callingcard_gamemodes_ribbon4" ) )
	ribbon1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
	ribbon1:setShaderVector( 0, 2, 0, 0, 0 )
	ribbon1:setShaderVector( 1, 7, 0, 0, 0 )
	self:addElement( ribbon1 )
	self.ribbon1 = ribbon1
	
	local swordglow = LUI.UIImage.new()
	swordglow:setLeftRight( true, false, 141.02, 174.65 )
	swordglow:setTopBottom( true, false, -4, 111 )
	swordglow:setRGB( 1, 0.99, 0.72 )
	swordglow:setAlpha( 0.41 )
	swordglow:setZRot( 90 )
	swordglow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	swordglow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( swordglow )
	self.swordglow = swordglow
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				local GlowOrangeOver0Frame2 = function ( GlowOrangeOver0, event )
					local GlowOrangeOver0Frame3 = function ( GlowOrangeOver0, event )
						if not event.interrupted then
							GlowOrangeOver0:beginAnimation( "keyframe", 1009, false, false, CoD.TweenType.Linear )
						end
						GlowOrangeOver0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( GlowOrangeOver0, event )
						else
							GlowOrangeOver0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						GlowOrangeOver0Frame3( GlowOrangeOver0, event )
						return 
					else
						GlowOrangeOver0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						GlowOrangeOver0:setAlpha( 0 )
						GlowOrangeOver0:registerEventHandler( "transition_complete_keyframe", GlowOrangeOver0Frame3 )
					end
				end
				
				GlowOrangeOver0:completeAnimation()
				self.GlowOrangeOver0:setAlpha( 1 )
				GlowOrangeOver0Frame2( GlowOrangeOver0, {} )
				local swordglowFrame2 = function ( swordglow, event )
					local swordglowFrame3 = function ( swordglow, event )
						local swordglowFrame4 = function ( swordglow, event )
							local swordglowFrame5 = function ( swordglow, event )
								if not event.interrupted then
									swordglow:beginAnimation( "keyframe", 1539, false, false, CoD.TweenType.Linear )
								end
								swordglow:setLeftRight( true, false, 141.02, 193.65 )
								swordglow:setTopBottom( true, false, -32.99, 146.99 )
								swordglow:setAlpha( 0 )
								swordglow:setZRot( 83 )
								if event.interrupted then
									self.clipFinished( swordglow, event )
								else
									swordglow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								swordglowFrame5( swordglow, event )
								return 
							else
								swordglow:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
								swordglow:setAlpha( 1 )
								swordglow:registerEventHandler( "transition_complete_keyframe", swordglowFrame5 )
							end
						end
						
						if event.interrupted then
							swordglowFrame4( swordglow, event )
							return 
						else
							swordglow:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							swordglow:setAlpha( 0.01 )
							swordglow:registerEventHandler( "transition_complete_keyframe", swordglowFrame4 )
						end
					end
					
					if event.interrupted then
						swordglowFrame3( swordglow, event )
						return 
					else
						swordglow:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						swordglow:setAlpha( 0.36 )
						swordglow:registerEventHandler( "transition_complete_keyframe", swordglowFrame3 )
					end
				end
				
				swordglow:completeAnimation()
				self.swordglow:setLeftRight( true, false, 141.02, 193.65 )
				self.swordglow:setTopBottom( true, false, -32.99, 146.99 )
				self.swordglow:setAlpha( 0.29 )
				self.swordglow:setZRot( 83 )
				swordglowFrame2( swordglow, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

