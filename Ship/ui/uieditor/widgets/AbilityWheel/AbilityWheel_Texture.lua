-- fa1ec33438697c93154529fa74f36650
-- This hash is used for caching, delete to decompile the file again

CoD.AbilityWheel_Texture = InheritFrom( LUI.UIElement )
CoD.AbilityWheel_Texture.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.AbilityWheel_Texture )
	self.id = "AbilityWheel_Texture"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 800 )
	self:setTopBottom( true, false, 0, 536 )
	
	local TextureL = LUI.UIImage.new()
	TextureL:setLeftRight( true, false, 0, 400 )
	TextureL:setTopBottom( true, false, 0, 536 )
	TextureL:setAlpha( RandomAddPercent( 40, 0.59 ) )
	TextureL:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_pixels" ) )
	TextureL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TextureL )
	self.TextureL = TextureL
	
	local TextureR = LUI.UIImage.new()
	TextureR:setLeftRight( true, false, 400, 800 )
	TextureR:setTopBottom( true, false, 0, 536 )
	TextureR:setAlpha( RandomAddPercent( 40, 0.41 ) )
	TextureR:setYRot( 180 )
	TextureR:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_pixels" ) )
	TextureR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TextureR )
	self.TextureR = TextureR
	
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
