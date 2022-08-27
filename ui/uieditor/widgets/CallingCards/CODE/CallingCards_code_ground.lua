-- c0ee5f7dcbcbfc31edfeba7834d9efd2
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CallingCards.CODE.CallingCards_code_ground_sun" )

CoD.CallingCards_code_ground = InheritFrom( LUI.UIElement )
CoD.CallingCards_code_ground.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_code_ground )
	self.id = "CallingCards_code_ground"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	self.anyChildUsesUpdateState = true
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( true, false, 0, 480 )
	BG:setTopBottom( true, false, 0, 120 )
	BG:setImage( RegisterImage( "uie_t7_callingcards_ground_bg" ) )
	self:addElement( BG )
	self.BG = BG
	
	local CallingCardscodegroundsun = CoD.CallingCards_code_ground_sun.new( menu, controller )
	CallingCardscodegroundsun:setLeftRight( true, false, 240, 480 )
	CallingCardscodegroundsun:setTopBottom( true, false, 0, 120 )
	self:addElement( CallingCardscodegroundsun )
	self.CallingCardscodegroundsun = CallingCardscodegroundsun
	
	local TANK = LUI.UIImage.new()
	TANK:setLeftRight( true, false, -11, 501 )
	TANK:setTopBottom( true, false, -4, 124 )
	TANK:setImage( RegisterImage( "uie_t7_callingcards_ground_tank" ) )
	self:addElement( TANK )
	self.TANK = TANK
	
	local helileft = LUI.UIImage.new()
	helileft:setLeftRight( true, false, 298, 334 )
	helileft:setTopBottom( true, false, 6, 42 )
	helileft:setImage( RegisterImage( "uie_t7_callingcards_ground_heli2" ) )
	self:addElement( helileft )
	self.helileft = helileft
	
	local heliright = LUI.UIImage.new()
	heliright:setLeftRight( true, false, 415, 475 )
	heliright:setTopBottom( true, false, 0, 50 )
	heliright:setImage( RegisterImage( "uie_t7_callingcards_ground_heli1" ) )
	self:addElement( heliright )
	self.heliright = heliright
	
	local helileft2 = LUI.UIImage.new()
	helileft2:setLeftRight( true, false, 381.4, 355 )
	helileft2:setTopBottom( true, false, 32, 56 )
	helileft2:setImage( RegisterImage( "uie_t7_callingcards_ground_heli1" ) )
	self:addElement( helileft2 )
	self.helileft2 = helileft2
	
	local heliright0 = LUI.UIImage.new()
	heliright0:setLeftRight( true, false, 377.48, 395.6 )
	heliright0:setTopBottom( true, false, 22, 37.1 )
	heliright0:setAlpha( 0.53 )
	heliright0:setImage( RegisterImage( "uie_t7_callingcards_ground_heli1" ) )
	self:addElement( heliright0 )
	self.heliright0 = heliright0
	
	local duderight = LUI.UIImage.new()
	duderight:setLeftRight( true, false, 387, 459 )
	duderight:setTopBottom( true, false, 0, 120 )
	duderight:setImage( RegisterImage( "uie_t7_callingcards_ground_duderight" ) )
	self:addElement( duderight )
	self.duderight = duderight
	
	local dudeleft = LUI.UIImage.new()
	dudeleft:setLeftRight( true, false, 298, 370 )
	dudeleft:setTopBottom( true, false, 0, 120 )
	dudeleft:setImage( RegisterImage( "uie_t7_callingcards_ground_dudeleft" ) )
	self:addElement( dudeleft )
	self.dudeleft = dudeleft
	
	local amber = LUI.UIImage.new()
	amber:setLeftRight( true, false, 157, 480 )
	amber:setTopBottom( true, false, 0, 120 )
	amber:setImage( RegisterImage( "uie_t7_callingcards_ground_ashes" ) )
	amber:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	amber:setShaderVector( 0, 1, 1, 0, 0 )
	amber:setShaderVector( 1, 0, -0.16, 0, 0 )
	self:addElement( amber )
	self.amber = amber
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				CallingCardscodegroundsun:completeAnimation()
				self.CallingCardscodegroundsun:setAlpha( 1 )
				self.clipFinished( CallingCardscodegroundsun, {} )
				local TANKFrame2 = function ( TANK, event )
					local TANKFrame3 = function ( TANK, event )
						local TANKFrame4 = function ( TANK, event )
							local TANKFrame5 = function ( TANK, event )
								if not event.interrupted then
									TANK:beginAnimation( "keyframe", 789, false, false, CoD.TweenType.Linear )
								end
								TANK:setLeftRight( true, false, -11, 501 )
								TANK:setTopBottom( true, false, -4, 124 )
								if event.interrupted then
									self.clipFinished( TANK, event )
								else
									TANK:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								TANKFrame5( TANK, event )
								return 
							else
								TANK:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
								TANK:setTopBottom( true, false, -4, 124 )
								TANK:registerEventHandler( "transition_complete_keyframe", TANKFrame5 )
							end
						end
						
						if event.interrupted then
							TANKFrame4( TANK, event )
							return 
						else
							TANK:beginAnimation( "keyframe", 1210, false, false, CoD.TweenType.Linear )
							TANK:setLeftRight( true, false, -5, 507 )
							TANK:setTopBottom( true, false, -5.41, 122.59 )
							TANK:registerEventHandler( "transition_complete_keyframe", TANKFrame4 )
						end
					end
					
					if event.interrupted then
						TANKFrame3( TANK, event )
						return 
					else
						TANK:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
						TANK:setLeftRight( true, false, -12, 500 )
						TANK:setTopBottom( true, false, -6, 122 )
						TANK:registerEventHandler( "transition_complete_keyframe", TANKFrame3 )
					end
				end
				
				TANK:completeAnimation()
				self.TANK:setLeftRight( true, false, -11, 501 )
				self.TANK:setTopBottom( true, false, -4, 124 )
				TANKFrame2( TANK, {} )
				local helileftFrame2 = function ( helileft, event )
					local helileftFrame3 = function ( helileft, event )
						if not event.interrupted then
							helileft:beginAnimation( "keyframe", 2519, false, false, CoD.TweenType.Linear )
						end
						helileft:setLeftRight( true, false, 240, 299 )
						helileft:setTopBottom( true, false, -38.7, 20.3 )
						helileft:setAlpha( 1 )
						helileft:setScale( 1 )
						if event.interrupted then
							self.clipFinished( helileft, event )
						else
							helileft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						helileftFrame3( helileft, event )
						return 
					else
						helileft:beginAnimation( "keyframe", 469, false, false, CoD.TweenType.Linear )
						helileft:setLeftRight( true, false, 307.42, 347.04 )
						helileft:setTopBottom( true, false, 11.62, 51.23 )
						helileft:setAlpha( 1 )
						helileft:registerEventHandler( "transition_complete_keyframe", helileftFrame3 )
					end
				end
				
				helileft:completeAnimation()
				self.helileft:setLeftRight( true, false, 320, 356 )
				self.helileft:setTopBottom( true, false, 21, 57 )
				self.helileft:setAlpha( 0 )
				self.helileft:setScale( 1 )
				helileftFrame2( helileft, {} )
				local helirightFrame2 = function ( heliright, event )
					local helirightFrame3 = function ( heliright, event )
						if not event.interrupted then
							heliright:beginAnimation( "keyframe", 1740, false, false, CoD.TweenType.Linear )
						end
						heliright:setLeftRight( true, false, 461, 546.2 )
						heliright:setTopBottom( true, false, -47, 24 )
						heliright:setAlpha( 1 )
						heliright:setScale( 1 )
						if event.interrupted then
							self.clipFinished( heliright, event )
						else
							heliright:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						helirightFrame3( heliright, event )
						return 
					else
						heliright:beginAnimation( "keyframe", 1250, false, false, CoD.TweenType.Linear )
						heliright:setLeftRight( true, false, 415.61, 468.45 )
						heliright:setTopBottom( true, false, 4.79, 48.83 )
						heliright:setAlpha( 1 )
						heliright:registerEventHandler( "transition_complete_keyframe", helirightFrame3 )
					end
				end
				
				heliright:completeAnimation()
				self.heliright:setLeftRight( true, false, 383, 412.6 )
				self.heliright:setTopBottom( true, false, 42, 66.66 )
				self.heliright:setAlpha( 0 )
				self.heliright:setScale( 1 )
				helirightFrame2( heliright, {} )
				local helileft2Frame2 = function ( helileft2, event )
					local helileft2Frame3 = function ( helileft2, event )
						local helileft2Frame4 = function ( helileft2, event )
							local helileft2Frame5 = function ( helileft2, event )
								if not event.interrupted then
									helileft2:beginAnimation( "keyframe", 1690, false, false, CoD.TweenType.Linear )
								end
								helileft2:setLeftRight( true, false, 346.4, 306.58 )
								helileft2:setTopBottom( true, false, -29.6, 6.6 )
								helileft2:setAlpha( 0.75 )
								if event.interrupted then
									self.clipFinished( helileft2, event )
								else
									helileft2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								helileft2Frame5( helileft2, event )
								return 
							else
								helileft2:beginAnimation( "keyframe", 759, false, false, CoD.TweenType.Linear )
								helileft2:setLeftRight( true, false, 364.12, 339.17 )
								helileft2:setTopBottom( true, false, 10.09, 32.76 )
								helileft2:setAlpha( 0.75 )
								helileft2:registerEventHandler( "transition_complete_keyframe", helileft2Frame5 )
							end
						end
						
						if event.interrupted then
							helileft2Frame4( helileft2, event )
							return 
						else
							helileft2:beginAnimation( "keyframe", 320, false, false, CoD.TweenType.Linear )
							helileft2:setLeftRight( true, false, 372.09, 353.83 )
							helileft2:setTopBottom( true, false, 27.94, 44.53 )
							helileft2:registerEventHandler( "transition_complete_keyframe", helileft2Frame4 )
						end
					end
					
					if event.interrupted then
						helileft2Frame3( helileft2, event )
						return 
					else
						helileft2:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
						helileft2:setLeftRight( true, false, 375.44, 360 )
						helileft2:setTopBottom( true, false, 35.45, 49.49 )
						helileft2:registerEventHandler( "transition_complete_keyframe", helileft2Frame3 )
					end
				end
				
				helileft2:completeAnimation()
				self.helileft2:setLeftRight( true, false, 375.4, 355 )
				self.helileft2:setTopBottom( true, false, 32, 50.55 )
				self.helileft2:setAlpha( 0 )
				helileft2Frame2( helileft2, {} )
				local heliright0Frame2 = function ( heliright0, event )
					local heliright0Frame3 = function ( heliright0, event )
						local heliright0Frame4 = function ( heliright0, event )
							local heliright0Frame5 = function ( heliright0, event )
								local heliright0Frame6 = function ( heliright0, event )
									if not event.interrupted then
										heliright0:beginAnimation( "keyframe", 849, false, false, CoD.TweenType.Linear )
									end
									heliright0:setLeftRight( true, false, 401.48, 419.6 )
									heliright0:setTopBottom( true, false, 5.2, 20.3 )
									heliright0:setAlpha( 0.7 )
									if event.interrupted then
										self.clipFinished( heliright0, event )
									else
										heliright0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									heliright0Frame6( heliright0, event )
									return 
								else
									heliright0:beginAnimation( "keyframe", 800, false, false, CoD.TweenType.Linear )
									heliright0:setLeftRight( true, false, 389.12, 407.23 )
									heliright0:setTopBottom( true, false, 13.86, 28.95 )
									heliright0:setAlpha( 1 )
									heliright0:registerEventHandler( "transition_complete_keyframe", heliright0Frame6 )
								end
							end
							
							if event.interrupted then
								heliright0Frame5( heliright0, event )
								return 
							else
								heliright0:beginAnimation( "keyframe", 580, false, false, CoD.TweenType.Linear )
								heliright0:setLeftRight( true, false, 377.48, 395.6 )
								heliright0:setTopBottom( true, false, 22, 37.1 )
								heliright0:registerEventHandler( "transition_complete_keyframe", heliright0Frame5 )
							end
						end
						
						if event.interrupted then
							heliright0Frame4( heliright0, event )
							return 
						else
							heliright0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							heliright0:setLeftRight( true, false, 422.43, 440.55 )
							heliright0:setTopBottom( true, false, -10.96, 4.14 )
							heliright0:setAlpha( 0 )
							heliright0:registerEventHandler( "transition_complete_keyframe", heliright0Frame4 )
						end
					end
					
					if event.interrupted then
						heliright0Frame3( heliright0, event )
						return 
					else
						heliright0:beginAnimation( "keyframe", 740, false, false, CoD.TweenType.Linear )
						heliright0:setLeftRight( true, false, 423.98, 442.1 )
						heliright0:setTopBottom( true, false, -12.1, 3 )
						heliright0:registerEventHandler( "transition_complete_keyframe", heliright0Frame3 )
					end
				end
				
				heliright0:completeAnimation()
				self.heliright0:setLeftRight( true, false, 401.48, 419.6 )
				self.heliright0:setTopBottom( true, false, 5.2, 20.3 )
				self.heliright0:setAlpha( 0.7 )
				heliright0Frame2( heliright0, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CallingCardscodegroundsun:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

