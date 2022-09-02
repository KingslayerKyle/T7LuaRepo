-- d2ebb9ae11b48c403df681bbc650e21c
-- This hash is used for caching, delete to decompile the file again

CoD.CallingCards_code_double_duty_war = InheritFrom( LUI.UIElement )
CoD.CallingCards_code_double_duty_war.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CallingCards_code_double_duty_war )
	self.id = "CallingCards_code_double_duty_war"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	
	local desert = LUI.UIImage.new()
	desert:setLeftRight( true, false, 0, 480 )
	desert:setTopBottom( true, false, 0, 120 )
	desert:setImage( RegisterImage( "uie_t7_callingcards_double_duty_desert" ) )
	self:addElement( desert )
	self.desert = desert
	
	local dust = LUI.UIImage.new()
	dust:setLeftRight( true, false, 63, 161 )
	dust:setTopBottom( true, false, 55, 101 )
	dust:setAlpha( 0.47 )
	dust:setImage( RegisterImage( "uie_t7_callingcards_double_duty_dust" ) )
	dust:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( dust )
	self.dust = dust
	
	local EMBER2c4 = LUI.UIImage.new()
	EMBER2c4:setLeftRight( true, false, 493, 409.05 )
	EMBER2c4:setTopBottom( true, false, -72, 81 )
	EMBER2c4:setYRot( 1 )
	EMBER2c4:setScale( 0.6 )
	EMBER2c4:setImage( RegisterImage( "uie_callingcards_cwl_ember2b" ) )
	EMBER2c4:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	EMBER2c4:setShaderVector( 0, 1, 1, 0, 0 )
	EMBER2c4:setShaderVector( 1, 0, 0.2, 0, 0 )
	self:addElement( EMBER2c4 )
	self.EMBER2c4 = EMBER2c4
	
	local firestill2a = LUI.UIImage.new()
	firestill2a:setLeftRight( true, false, 406, 502 )
	firestill2a:setTopBottom( true, false, 9, 81 )
	firestill2a:setScale( 0.5 )
	firestill2a:setImage( RegisterImage( "uie_t7_callingcard_mp_zeus_fire2" ) )
	self:addElement( firestill2a )
	self.firestill2a = firestill2a
	
	local firestill2b = LUI.UIImage.new()
	firestill2b:setLeftRight( true, false, 422.49, 485.51 )
	firestill2b:setTopBottom( true, false, 25.73, 73 )
	firestill2b:setScale( 0.5 )
	firestill2b:setImage( RegisterImage( "uie_t7_callingcard_mp_zeus_fire1" ) )
	self:addElement( firestill2b )
	self.firestill2b = firestill2b
	
	local hill = LUI.UIImage.new()
	hill:setLeftRight( true, false, 414.5, 474.5 )
	hill:setTopBottom( true, false, 34, 86 )
	hill:setImage( RegisterImage( "uie_t7_callingcards_double_duty_hill" ) )
	self:addElement( hill )
	self.hill = hill
	
	local smokelarge2 = LUI.UIImage.new()
	smokelarge2:setLeftRight( true, false, 154, 326 )
	smokelarge2:setTopBottom( true, false, -101.36, 211.36 )
	smokelarge2:setAlpha( 0.62 )
	smokelarge2:setZRot( 270 )
	smokelarge2:setScale( 2.4 )
	smokelarge2:setImage( RegisterImage( "uie_t7_callingcard_mp_zeus_smoke" ) )
	smokelarge2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	smokelarge2:setShaderVector( 0, 1, 1, 0, 0 )
	smokelarge2:setShaderVector( 1, 0, 0.1, 0, 0 )
	self:addElement( smokelarge2 )
	self.smokelarge2 = smokelarge2
	
	local soldier = LUI.UIImage.new()
	soldier:setLeftRight( true, false, 196, 406 )
	soldier:setTopBottom( true, false, 6, 122 )
	soldier:setImage( RegisterImage( "uie_t7_callingcards_double_duty_soldier" ) )
	self:addElement( soldier )
	self.soldier = soldier
	
	local gun = LUI.UIImage.new()
	gun:setLeftRight( true, false, 197, 407 )
	gun:setTopBottom( true, false, 5, 121 )
	gun:setImage( RegisterImage( "uie_t7_callingcards_double_duty_soldier_gun" ) )
	self:addElement( gun )
	self.gun = gun
	
	local muzzleFlash = LUI.UIImage.new()
	muzzleFlash:setLeftRight( true, false, 103, 188 )
	muzzleFlash:setTopBottom( true, false, 35.5, 90.5 )
	muzzleFlash:setScale( 1.8 )
	muzzleFlash:setImage( RegisterImage( "uie_t7_callingcards_double_duty_muzzle_flash" ) )
	self:addElement( muzzleFlash )
	self.muzzleFlash = muzzleFlash
	
	local muzzleFlash0 = LUI.UIImage.new()
	muzzleFlash0:setLeftRight( true, false, 69, 88 )
	muzzleFlash0:setTopBottom( true, false, 72.68, 87.32 )
	muzzleFlash0:setScale( 1.6 )
	muzzleFlash0:setImage( RegisterImage( "uie_t7_callingcards_double_duty_muzzle_flash" ) )
	self:addElement( muzzleFlash0 )
	self.muzzleFlash0 = muzzleFlash0
	
	local tankFlash02 = LUI.UIImage.new()
	tankFlash02:setLeftRight( true, false, -1, 63 )
	tankFlash02:setTopBottom( true, false, 60, 112 )
	tankFlash02:setScale( 0.3 )
	tankFlash02:setImage( RegisterImage( "uie_t7_callingcards_double_duty_muzzle_flash" ) )
	self:addElement( tankFlash02 )
	self.tankFlash02 = tankFlash02
	
	local flipbook0 = LUI.UIImage.new()
	flipbook0:setLeftRight( true, false, 491, 420 )
	flipbook0:setTopBottom( true, false, -17.39, 85 )
	flipbook0:setScale( 0.6 )
	flipbook0:setImage( RegisterImage( "uie_t7_callingcard_mp_zeus_fire_flipbook" ) )
	flipbook0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
	flipbook0:setShaderVector( 0, 6, 3, 0, 0 )
	flipbook0:setShaderVector( 1, 18, 0, 0, 0 )
	self:addElement( flipbook0 )
	self.flipbook0 = flipbook0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				dust:completeAnimation()
				self.dust:setAlpha( 0.28 )
				self.clipFinished( dust, {} )
				smokelarge2:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
				smokelarge2:setLeftRight( true, false, 59.5, 231.5 )
				smokelarge2:setTopBottom( true, false, -83.36, 229.36 )
				smokelarge2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				local f2_local0 = function ( f3_arg0, f3_arg1 )
					local f3_local0 = function ( f4_arg0, f4_arg1 )
						local f4_local0 = function ( f5_arg0, f5_arg1 )
							local f5_local0 = function ( f6_arg0, f6_arg1 )
								local f6_local0 = function ( f7_arg0, f7_arg1 )
									if not f7_arg1.interrupted then
										f7_arg0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
									end
									f7_arg0:setLeftRight( true, false, 197, 407 )
									f7_arg0:setTopBottom( true, false, 4, 120 )
									if f7_arg1.interrupted then
										self.clipFinished( f7_arg0, f7_arg1 )
									else
										f7_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f6_arg1.interrupted then
									f6_local0( f6_arg0, f6_arg1 )
									return 
								else
									f6_arg0:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
									f6_arg0:setLeftRight( true, false, 199, 409 )
									f6_arg0:registerEventHandler( "transition_complete_keyframe", f6_local0 )
								end
							end
							
							if f5_arg1.interrupted then
								f5_local0( f5_arg0, f5_arg1 )
								return 
							else
								f5_arg0:beginAnimation( "keyframe", 1279, false, false, CoD.TweenType.Linear )
								f5_arg0:registerEventHandler( "transition_complete_keyframe", f5_local0 )
							end
						end
						
						if f4_arg1.interrupted then
							f4_local0( f4_arg0, f4_arg1 )
							return 
						else
							f4_arg0:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
							f4_arg0:setLeftRight( true, false, 197, 407 )
							f4_arg0:registerEventHandler( "transition_complete_keyframe", f4_local0 )
						end
					end
					
					if f3_arg1.interrupted then
						f3_local0( f3_arg0, f3_arg1 )
						return 
					else
						f3_arg0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						f3_arg0:setLeftRight( true, false, 199, 409 )
						f3_arg0:registerEventHandler( "transition_complete_keyframe", f3_local0 )
					end
				end
				
				gun:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
				gun:setLeftRight( true, false, 197, 407 )
				gun:setTopBottom( true, false, 4, 120 )
				gun:registerEventHandler( "transition_complete_keyframe", f2_local0 )
				local f2_local1 = function ( f8_arg0, f8_arg1 )
					local f8_local0 = function ( f9_arg0, f9_arg1 )
						local f9_local0 = function ( f10_arg0, f10_arg1 )
							local f10_local0 = function ( f11_arg0, f11_arg1 )
								local f11_local0 = function ( f12_arg0, f12_arg1 )
									if not f12_arg1.interrupted then
										f12_arg0:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
									end
									f12_arg0:setAlpha( 0 )
									if f12_arg1.interrupted then
										self.clipFinished( f12_arg0, f12_arg1 )
									else
										f12_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f11_arg1.interrupted then
									f11_local0( f11_arg0, f11_arg1 )
									return 
								else
									f11_arg0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
									f11_arg0:setAlpha( 1 )
									f11_arg0:registerEventHandler( "transition_complete_keyframe", f11_local0 )
								end
							end
							
							if f10_arg1.interrupted then
								f10_local0( f10_arg0, f10_arg1 )
								return 
							else
								f10_arg0:beginAnimation( "keyframe", 1269, false, false, CoD.TweenType.Linear )
								f10_arg0:registerEventHandler( "transition_complete_keyframe", f10_local0 )
							end
						end
						
						if f9_arg1.interrupted then
							f9_local0( f9_arg0, f9_arg1 )
							return 
						else
							f9_arg0:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
							f9_arg0:setAlpha( 0 )
							f9_arg0:registerEventHandler( "transition_complete_keyframe", f9_local0 )
						end
					end
					
					if f8_arg1.interrupted then
						f8_local0( f8_arg0, f8_arg1 )
						return 
					else
						f8_arg0:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
						f8_arg0:setAlpha( 1 )
						f8_arg0:registerEventHandler( "transition_complete_keyframe", f8_local0 )
					end
				end
				
				muzzleFlash:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
				muzzleFlash:setAlpha( 0 )
				muzzleFlash:registerEventHandler( "transition_complete_keyframe", f2_local1 )
				local f2_local2 = function ( f13_arg0, f13_arg1 )
					local f13_local0 = function ( f14_arg0, f14_arg1 )
						if not f14_arg1.interrupted then
							f14_arg0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						end
						f14_arg0:setAlpha( 0 )
						if f14_arg1.interrupted then
							self.clipFinished( f14_arg0, f14_arg1 )
						else
							f14_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f13_arg1.interrupted then
						f13_local0( f13_arg0, f13_arg1 )
						return 
					else
						f13_arg0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						f13_arg0:setAlpha( 1 )
						f13_arg0:registerEventHandler( "transition_complete_keyframe", f13_local0 )
					end
				end
				
				muzzleFlash0:beginAnimation( "keyframe", 1179, false, false, CoD.TweenType.Linear )
				muzzleFlash0:setAlpha( 0 )
				muzzleFlash0:registerEventHandler( "transition_complete_keyframe", f2_local2 )
				local f2_local3 = function ( f15_arg0, f15_arg1 )
					local f15_local0 = function ( f16_arg0, f16_arg1 )
						if not f16_arg1.interrupted then
							f16_arg0:beginAnimation( "keyframe", 179, false, false, CoD.TweenType.Linear )
						end
						f16_arg0:setAlpha( 0 )
						if f16_arg1.interrupted then
							self.clipFinished( f16_arg0, f16_arg1 )
						else
							f16_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f15_arg1.interrupted then
						f15_local0( f15_arg0, f15_arg1 )
						return 
					else
						f15_arg0:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						f15_arg0:setAlpha( 1 )
						f15_arg0:registerEventHandler( "transition_complete_keyframe", f15_local0 )
					end
				end
				
				tankFlash02:beginAnimation( "keyframe", 720, false, false, CoD.TweenType.Linear )
				tankFlash02:setAlpha( 0 )
				tankFlash02:registerEventHandler( "transition_complete_keyframe", f2_local3 )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

