-- 25361da194f04e9bbe40706ffd046811
-- This hash is used for caching, delete to decompile the file again

CoD.CallingCard_loot_blacklightposters = InheritFrom( LUI.UIElement )
CoD.CallingCard_loot_blacklightposters.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.CallingCard_loot_blacklightposters )
	self.id = "CallingCard_loot_blacklightposters"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	
	local black = LUI.UIImage.new()
	black:setLeftRight( true, false, 0, 480 )
	black:setTopBottom( true, false, 0, 120 )
	black:setRGB( 0, 0, 0 )
	self:addElement( black )
	self.black = black
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, false, 0, 480 )
	bg:setTopBottom( true, false, 0, 120 )
	bg:setImage( RegisterImage( "uie_t7_loot_callingcard_blacklightposters_bg" ) )
	bg:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
	bg:setShaderVector( 0, 0, 0.7, 0, 0 )
	bg:setShaderVector( 1, 0.24, 0.17, 0, 0 )
	bg:setShaderVector( 2, 0, 1, 0, 0 )
	bg:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( bg )
	self.bg = bg
	
	local bg0 = LUI.UIImage.new()
	bg0:setLeftRight( true, false, 0, 480 )
	bg0:setTopBottom( true, false, 0, 120 )
	bg0:setAlpha( 0 )
	bg0:setImage( RegisterImage( "uie_t7_loot_callingcard_blacklightposters_bg" ) )
	bg0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( bg0 )
	self.bg0 = bg0
	
	local cloud = LUI.UIImage.new()
	cloud:setLeftRight( true, false, 0, 480 )
	cloud:setTopBottom( true, false, 0, 120 )
	cloud:setImage( RegisterImage( "uie_t7_loot_callingcard_blacklightposters_cloud_flipbook" ) )
	cloud:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
	cloud:setShaderVector( 0, 3, 0, 0, 0 )
	cloud:setShaderVector( 1, 6, 0, 0, 0 )
	self:addElement( cloud )
	self.cloud = cloud
	
	local biker = LUI.UIImage.new()
	biker:setLeftRight( true, false, 0, 480 )
	biker:setTopBottom( true, false, 0, 120 )
	biker:setImage( RegisterImage( "uie_t7_loot_callingcard_blacklightposters_biker1_flipbook" ) )
	biker:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
	biker:setShaderVector( 0, 2, 0, 0, 0 )
	biker:setShaderVector( 1, 15.9, 0, 0, 0 )
	self:addElement( biker )
	self.biker = biker
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				local bgFrame2 = function ( bg, event )
					local bgFrame3 = function ( bg, event )
						if not event.interrupted then
							bg:beginAnimation( "keyframe", 429, false, false, CoD.TweenType.Linear )
						end
						bg:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
						bg:setShaderVector( 0, 0, 0.7, 0, 0 )
						bg:setShaderVector( 1, 0.24, 0.17, 0, 0 )
						bg:setShaderVector( 2, 0, 1, 0, 0 )
						bg:setShaderVector( 3, 0, 0, 0, 0 )
						if event.interrupted then
							self.clipFinished( bg, event )
						else
							bg:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						bgFrame3( bg, event )
						return 
					else
						bg:beginAnimation( "keyframe", 469, false, false, CoD.TweenType.Linear )
						bg:setShaderVector( 0, 0.3, 1.02, 0, 0 )
						bg:registerEventHandler( "transition_complete_keyframe", bgFrame3 )
					end
				end
				
				bg:completeAnimation()
				self.bg:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
				self.bg:setShaderVector( 0, 0, 0.7, 0, 0 )
				self.bg:setShaderVector( 1, 0.24, 0.17, 0, 0 )
				self.bg:setShaderVector( 2, 0, 1, 0, 0 )
				self.bg:setShaderVector( 3, 0, 0, 0, 0 )
				bgFrame2( bg, {} )
				local bg0Frame2 = function ( bg0, event )
					local bg0Frame3 = function ( bg0, event )
						local bg0Frame4 = function ( bg0, event )
							local bg0Frame5 = function ( bg0, event )
								if not event.interrupted then
									bg0:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
								end
								bg0:setAlpha( 0.5 )
								if event.interrupted then
									self.clipFinished( bg0, event )
								else
									bg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								bg0Frame5( bg0, event )
								return 
							else
								bg0:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
								bg0:setAlpha( 1 )
								bg0:registerEventHandler( "transition_complete_keyframe", bg0Frame5 )
							end
						end
						
						if event.interrupted then
							bg0Frame4( bg0, event )
							return 
						else
							bg0:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
							bg0:setAlpha( 0 )
							bg0:registerEventHandler( "transition_complete_keyframe", bg0Frame4 )
						end
					end
					
					if event.interrupted then
						bg0Frame3( bg0, event )
						return 
					else
						bg0:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
						bg0:setAlpha( 1 )
						bg0:registerEventHandler( "transition_complete_keyframe", bg0Frame3 )
					end
				end
				
				bg0:completeAnimation()
				self.bg0:setAlpha( 0.5 )
				bg0Frame2( bg0, {} )
				local bikerFrame2 = function ( biker, event )
					local bikerFrame3 = function ( biker, event )
						local bikerFrame4 = function ( biker, event )
							local bikerFrame5 = function ( biker, event )
								local bikerFrame6 = function ( biker, event )
									if not event.interrupted then
										biker:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
									end
									biker:setLeftRight( true, false, 0, 480 )
									biker:setTopBottom( true, false, 0, 120 )
									biker:setScale( 1 )
									if event.interrupted then
										self.clipFinished( biker, event )
									else
										biker:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									bikerFrame6( biker, event )
									return 
								else
									biker:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
									biker:setLeftRight( true, false, 0, 480 )
									biker:setScale( 1.01 )
									biker:registerEventHandler( "transition_complete_keyframe", bikerFrame6 )
								end
							end
							
							if event.interrupted then
								bikerFrame5( biker, event )
								return 
							else
								biker:beginAnimation( "keyframe", 130, false, false, CoD.TweenType.Linear )
								biker:setLeftRight( true, false, 3, 483 )
								biker:setScale( 1.03 )
								biker:registerEventHandler( "transition_complete_keyframe", bikerFrame5 )
							end
						end
						
						if event.interrupted then
							bikerFrame4( biker, event )
							return 
						else
							biker:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
							biker:setScale( 1.04 )
							biker:registerEventHandler( "transition_complete_keyframe", bikerFrame4 )
						end
					end
					
					if event.interrupted then
						bikerFrame3( biker, event )
						return 
					else
						biker:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
						biker:setScale( 1.05 )
						biker:registerEventHandler( "transition_complete_keyframe", bikerFrame3 )
					end
				end
				
				biker:completeAnimation()
				self.biker:setLeftRight( true, false, 0, 480 )
				self.biker:setTopBottom( true, false, 0, 120 )
				self.biker:setScale( 1 )
				bikerFrame2( biker, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

