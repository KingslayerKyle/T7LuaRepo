-- 1ec1e8ba9928fa156695a3c68f6c0b54
-- This hash is used for caching, delete to decompile the file again

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	local f1_local0, f1_local1 = f1_arg0.Chyron:getImageDimensions()
	local f1_local2 = 1280 / f1_local0 * f1_local1
	local f1_local3 = math.floor( f1_local2 / 33 + 0.5 )
	if f1_local2 < 320 then
		f1_local2 = f1_local2 * 2
		f1_arg0.Chyron:setShaderVector( 4, 1, 2, 0, 0 )
	end
	f1_arg0.Chyron:setTopBottom( false, true, -1700, -1700 + f1_local2 )
	local f1_local4 = 80 * f1_local3
	f1_arg0.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				f1_arg0:setupElementClipCounter( 1 )

				local f2_local0 = function ( f3_arg0, f3_arg1 )
					if not f3_arg1.interrupted then
						f3_arg0:beginAnimation( "keyframe", f1_local4, false, false, CoD.TweenType.Linear )
					end
					f3_arg0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_animated" ) )
					f3_arg0:setShaderVector( 2, 1, 0, 0, 0 )
					if f3_arg1.interrupted then
						f1_arg0.clipFinished( f3_arg0, f3_arg1 )
					else
						f3_arg0:registerEventHandler( "transition_complete_keyframe", f1_arg0.clipFinished )
					end
				end
				
				f1_arg0.Chyron:completeAnimation()
				f1_arg0.Chyron:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_animated" ) )
				f1_arg0.Chyron:setShaderVector( 2, 0, 0, 0, 0 )
				f2_local0( f1_arg0.Chyron, {} )
				f1_arg0.nextClip = "DefaultClip"
			end
		}
	}
end

CoD.ChyronScrollingText = InheritFrom( LUI.UIElement )
CoD.ChyronScrollingText.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ChyronScrollingText )
	self.id = "ChyronScrollingText"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 1700 )
	
	local Chyron = LUI.UIImage.new()
	Chyron:setLeftRight( true, false, 0, 1280 )
	Chyron:setTopBottom( false, true, -1700, -1352 )
	Chyron:setRGB( 0.34, 0.34, 0.34 )
	Chyron:setImage( RegisterImage( GetChyronImage( "uie_t7_demon_within_chyron" ) ) )
	Chyron:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_animated" ) )
	Chyron:setShaderVector( 0, 0, 0, 0, 0 )
	Chyron:setShaderVector( 1, 1, 1, 0, 0 )
	Chyron:setShaderVector( 2, 0, 0, 0, 0 )
	Chyron:setShaderVector( 3, 1, 1, 0, 0 )
	Chyron:setShaderVector( 4, 1, 1, 0, 0 )
	Chyron:setupUIStreamedImage( 0 )
	self:addElement( Chyron )
	self.Chyron = Chyron
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				local ChyronFrame2 = function ( Chyron, event )
					if not event.interrupted then
						Chyron:beginAnimation( "keyframe", 3000, false, false, CoD.TweenType.Linear )
					end
					Chyron:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_animated" ) )
					Chyron:setShaderVector( 0, 0, 0, 0, 0 )
					Chyron:setShaderVector( 1, 1, 1, 0, 0 )
					Chyron:setShaderVector( 2, 1, 0, 0, 0 )
					Chyron:setShaderVector( 3, 1, 1, 0, 0 )
					Chyron:setShaderVector( 4, 1, 1, 0, 0 )
					if event.interrupted then
						self.clipFinished( Chyron, event )
					else
						Chyron:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Chyron:completeAnimation()
				self.Chyron:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_animated" ) )
				self.Chyron:setShaderVector( 0, 0, 0, 0, 0 )
				self.Chyron:setShaderVector( 1, 1, 1, 0, 0 )
				self.Chyron:setShaderVector( 2, 0, 0, 0, 0 )
				self.Chyron:setShaderVector( 3, 1, 1, 0, 0 )
				self.Chyron:setShaderVector( 4, 1, 1, 0, 0 )
				ChyronFrame2( Chyron, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

