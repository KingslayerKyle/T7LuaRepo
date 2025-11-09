CoD.StartMenu_CampaignBGTextures = InheritFrom( LUI.UIElement )
CoD.StartMenu_CampaignBGTextures.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_CampaignBGTextures )
	self.id = "StartMenu_CampaignBGTextures"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	
	local TextureL = LUI.UIImage.new()
	TextureL:setLeftRight( true, true, 0, -878 )
	TextureL:setTopBottom( true, true, -71.5, -339.25 )
	TextureL:setAlpha( RandomAddPercent( 40, 0.59 ) )
	TextureL:setZRot( 180 )
	TextureL:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_pixels" ) )
	TextureL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TextureL )
	self.TextureL = TextureL
	
	local TextureR = LUI.UIImage.new()
	TextureR:setLeftRight( true, true, 0, -878 )
	TextureR:setTopBottom( true, true, 380.75, 113 )
	TextureR:setAlpha( RandomAddPercent( 40, 0.41 ) )
	TextureR:setYRot( 180 )
	TextureR:setZRot( 90 )
	TextureR:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_pixels" ) )
	TextureR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TextureR )
	self.TextureR = TextureR
	
	local TextureL0 = LUI.UIImage.new()
	TextureL0:setLeftRight( true, true, 402, -439 )
	TextureL0:setTopBottom( true, true, -71.5, -339.25 )
	TextureL0:setAlpha( RandomAddPercent( 40, 0.59 ) )
	TextureL0:setZRot( 180 )
	TextureL0:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_pixels" ) )
	TextureL0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TextureL0 )
	self.TextureL0 = TextureL0
	
	local TextureR0 = LUI.UIImage.new()
	TextureR0:setLeftRight( true, true, 402, -439 )
	TextureR0:setTopBottom( true, true, 380.75, 113 )
	TextureR0:setAlpha( RandomAddPercent( 40, 0.41 ) )
	TextureR0:setYRot( 180 )
	TextureR0:setZRot( 90 )
	TextureR0:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_pixels" ) )
	TextureR0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TextureR0 )
	self.TextureR0 = TextureR0
	
	local TextureL00 = LUI.UIImage.new()
	TextureL00:setLeftRight( true, true, 841, 0 )
	TextureL00:setTopBottom( true, true, -71.5, -339.25 )
	TextureL00:setAlpha( RandomAddPercent( 40, 0.59 ) )
	TextureL00:setZRot( 180 )
	TextureL00:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_pixels" ) )
	TextureL00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TextureL00 )
	self.TextureL00 = TextureL00
	
	local TextureR00 = LUI.UIImage.new()
	TextureR00:setLeftRight( true, true, 841, 0 )
	TextureR00:setTopBottom( true, true, 380.75, 113 )
	TextureR00:setAlpha( RandomAddPercent( 40, 0.41 ) )
	TextureR00:setYRot( 180 )
	TextureR00:setZRot( 90 )
	TextureR00:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_pixels" ) )
	TextureR00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TextureR00 )
	self.TextureR00 = TextureR00
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				local TextureLFrame2 = function ( TextureL, event )
					local TextureLFrame3 = function ( TextureL, event )
						if not event.interrupted then
							TextureL:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						end
						TextureL:setAlpha( RandomAddPercent( 40, 0.4 ) )
						if event.interrupted then
							self.clipFinished( TextureL, event )
						else
							TextureL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						TextureLFrame3( TextureL, event )
						return 
					else
						TextureL:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						TextureL:setAlpha( RandomAddPercent( 40, 0.41 ) )
						TextureL:registerEventHandler( "transition_complete_keyframe", TextureLFrame3 )
					end
				end
				
				TextureL:completeAnimation()
				self.TextureL:setAlpha( RandomAddPercent( 40, 0.4 ) )
				TextureLFrame2( TextureL, {} )
				local TextureRFrame2 = function ( TextureR, event )
					local TextureRFrame3 = function ( TextureR, event )
						local TextureRFrame4 = function ( TextureR, event )
							if not event.interrupted then
								TextureR:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							end
							TextureR:setAlpha( RandomAddPercent( 40, 0.41 ) )
							if event.interrupted then
								self.clipFinished( TextureR, event )
							else
								TextureR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							TextureRFrame4( TextureR, event )
							return 
						else
							TextureR:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							TextureR:setAlpha( RandomAddPercent( 40, 0.39 ) )
							TextureR:registerEventHandler( "transition_complete_keyframe", TextureRFrame4 )
						end
					end
					
					if event.interrupted then
						TextureRFrame3( TextureR, event )
						return 
					else
						TextureR:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						TextureR:setAlpha( RandomAddPercent( 40, 0.4 ) )
						TextureR:registerEventHandler( "transition_complete_keyframe", TextureRFrame3 )
					end
				end
				
				TextureR:completeAnimation()
				self.TextureR:setAlpha( RandomAddPercent( 40, 0.41 ) )
				TextureRFrame2( TextureR, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

