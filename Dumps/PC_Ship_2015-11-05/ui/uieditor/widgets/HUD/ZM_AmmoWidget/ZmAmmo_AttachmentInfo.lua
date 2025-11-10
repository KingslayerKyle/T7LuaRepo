require( "ui.uieditor.widgets.HUD.ZM_AmmoWidget.ZmAmmo_TextAttachmentInfo" )
require( "ui.uieditor.widgets.HUD.ZM_AmmoWidget.ZmAmmo_TextAttachmentInfoFire" )
require( "ui.uieditor.widgets.HUD.ZM_FX.ZmFx_Spark2" )

local PreLoadFunc = function ( self, controller )
	Engine.CreateModel( Engine.GetModelForController( controller ), "currentWeapon.aat" )
end

local f0_local1 = function ( f2_arg0, f2_arg1 )
	local f2_local0 = Engine.GetModel( Engine.GetModelForController( f2_arg1 ), "currentWeapon" )
	if f2_local0 == nil then
		return 
	end
	local f2_local1 = Engine.GetModelValue( Engine.GetModel( f2_local0, "weaponName" ) )
	if f2_arg0.currentWeapon ~= f2_local1 then
		f2_arg0.AttachmentInfo:UpdateAttachments( f2_arg0.currentAttachment1, f2_arg0.currentAttachment2, f2_arg0.currentAttachment3 )
		f2_arg0.currentWeapon = f2_local1
		f2_arg0:setState( "DefaultState" )
		f2_arg0:setState( "NoAttachments" )
	end
end

local PostLoadFunc = function ( f3_arg0, f3_arg1 )
	f3_arg0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f3_arg1 ), "currentWeapon.updateWeaponSelect" ), function ( model )
		f0_local1( f3_arg0, f3_arg1 )
	end )
end

CoD.ZmAmmo_AttachmentInfo = InheritFrom( LUI.UIElement )
CoD.ZmAmmo_AttachmentInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ZmAmmo_AttachmentInfo )
	self.id = "ZmAmmo_AttachmentInfo"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 316 )
	self:setTopBottom( true, false, 0, 38 )
	self.anyChildUsesUpdateState = true
	
	local AttachmentInfo = CoD.ZmAmmo_TextAttachmentInfo.new( menu, controller )
	AttachmentInfo:setLeftRight( false, true, -296, 0 )
	AttachmentInfo:setTopBottom( false, true, -27, -9 )
	AttachmentInfo:setRGB( 1, 0.99, 0.93 )
	AttachmentInfo:setAlpha( 0 )
	self:addElement( AttachmentInfo )
	self.AttachmentInfo = AttachmentInfo
	
	local AttachmentInfoFireRate = CoD.ZmAmmo_TextAttachmentInfoFire.new( menu, controller )
	AttachmentInfoFireRate:setLeftRight( false, true, -296, 0 )
	AttachmentInfoFireRate:setTopBottom( false, true, -27, -9 )
	AttachmentInfoFireRate:setRGB( 1, 0.99, 0.93 )
	self:addElement( AttachmentInfoFireRate )
	self.AttachmentInfoFireRate = AttachmentInfoFireRate
	
	local ZmFxSpark20 = CoD.ZmFx_Spark2.new( menu, controller )
	ZmFxSpark20:setLeftRight( true, false, 140, 316 )
	ZmFxSpark20:setTopBottom( true, false, 0.38, 37.25 )
	ZmFxSpark20:setAlpha( 0 )
	ZmFxSpark20:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	ZmFxSpark20.Image0:setShaderVector( 1, 0, 0.4, 0, 0 )
	ZmFxSpark20.Image00:setShaderVector( 1, 0, -0.2, 0, 0 )
	self:addElement( ZmFxSpark20 )
	self.ZmFxSpark20 = ZmFxSpark20
	
	local Flsh = LUI.UIImage.new()
	Flsh:setLeftRight( true, false, 291, 316 )
	Flsh:setTopBottom( true, false, 7.25, 30 )
	Flsh:setRGB( 1, 0.37, 0 )
	Flsh:setAlpha( 0 )
	Flsh:setImage( RegisterImage( "uie_t7_zm_hud_notif_txtstreak" ) )
	Flsh:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Flsh )
	self.Flsh = Flsh
	
	local Label0 = LUI.UITightText.new()
	Label0:setLeftRight( false, true, -200, 0 )
	Label0:setTopBottom( true, false, 30, 50 )
	Label0:setRGB( 1, 0.87, 0.54 )
	Label0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Label0:subscribeToGlobalModel( controller, "CurrentWeapon", "aat", function ( model )
		local aat = Engine.GetModelValue( model )
		if aat then
			Label0:setText( Engine.Localize( LocalizeString( aat ) ) )
		end
	end )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				local AttachmentInfoFrame2 = function ( AttachmentInfo, event )
					local AttachmentInfoFrame3 = function ( AttachmentInfo, event )
						local AttachmentInfoFrame4 = function ( AttachmentInfo, event )
							local AttachmentInfoFrame5 = function ( AttachmentInfo, event )
								local AttachmentInfoFrame6 = function ( AttachmentInfo, event )
									if not event.interrupted then
										AttachmentInfo:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
									end
									AttachmentInfo:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( AttachmentInfo, event )
									else
										AttachmentInfo:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									AttachmentInfoFrame6( AttachmentInfo, event )
									return 
								else
									AttachmentInfo:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
									AttachmentInfo:setAlpha( 0 )
									AttachmentInfo:registerEventHandler( "transition_complete_keyframe", AttachmentInfoFrame6 )
								end
							end
							
							if event.interrupted then
								AttachmentInfoFrame5( AttachmentInfo, event )
								return 
							else
								AttachmentInfo:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
								AttachmentInfo:setAlpha( 0.93 )
								AttachmentInfo:registerEventHandler( "transition_complete_keyframe", AttachmentInfoFrame5 )
							end
						end
						
						if event.interrupted then
							AttachmentInfoFrame4( AttachmentInfo, event )
							return 
						else
							AttachmentInfo:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							AttachmentInfo:setAlpha( 0 )
							AttachmentInfo:registerEventHandler( "transition_complete_keyframe", AttachmentInfoFrame4 )
						end
					end
					
					if event.interrupted then
						AttachmentInfoFrame3( AttachmentInfo, event )
						return 
					else
						AttachmentInfo:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
						AttachmentInfo:registerEventHandler( "transition_complete_keyframe", AttachmentInfoFrame3 )
					end
				end
				
				AttachmentInfo:completeAnimation()
				self.AttachmentInfo:setAlpha( 1 )
				AttachmentInfoFrame2( AttachmentInfo, {} )
				local AttachmentInfoFireRateFrame2 = function ( AttachmentInfoFireRate, event )
					local AttachmentInfoFireRateFrame3 = function ( AttachmentInfoFireRate, event )
						local AttachmentInfoFireRateFrame4 = function ( AttachmentInfoFireRate, event )
							local AttachmentInfoFireRateFrame5 = function ( AttachmentInfoFireRate, event )
								local AttachmentInfoFireRateFrame6 = function ( AttachmentInfoFireRate, event )
									local AttachmentInfoFireRateFrame7 = function ( AttachmentInfoFireRate, event )
										if not event.interrupted then
											AttachmentInfoFireRate:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
										end
										AttachmentInfoFireRate:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( AttachmentInfoFireRate, event )
										else
											AttachmentInfoFireRate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										AttachmentInfoFireRateFrame7( AttachmentInfoFireRate, event )
										return 
									else
										AttachmentInfoFireRate:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
										AttachmentInfoFireRate:setAlpha( 0 )
										AttachmentInfoFireRate:registerEventHandler( "transition_complete_keyframe", AttachmentInfoFireRateFrame7 )
									end
								end
								
								if event.interrupted then
									AttachmentInfoFireRateFrame6( AttachmentInfoFireRate, event )
									return 
								else
									AttachmentInfoFireRate:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									AttachmentInfoFireRate:setAlpha( 1 )
									AttachmentInfoFireRate:registerEventHandler( "transition_complete_keyframe", AttachmentInfoFireRateFrame6 )
								end
							end
							
							if event.interrupted then
								AttachmentInfoFireRateFrame5( AttachmentInfoFireRate, event )
								return 
							else
								AttachmentInfoFireRate:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
								AttachmentInfoFireRate:setAlpha( 0 )
								AttachmentInfoFireRate:registerEventHandler( "transition_complete_keyframe", AttachmentInfoFireRateFrame5 )
							end
						end
						
						if event.interrupted then
							AttachmentInfoFireRateFrame4( AttachmentInfoFireRate, event )
							return 
						else
							AttachmentInfoFireRate:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
							AttachmentInfoFireRate:setAlpha( 0.67 )
							AttachmentInfoFireRate:registerEventHandler( "transition_complete_keyframe", AttachmentInfoFireRateFrame4 )
						end
					end
					
					if event.interrupted then
						AttachmentInfoFireRateFrame3( AttachmentInfoFireRate, event )
						return 
					else
						AttachmentInfoFireRate:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
						AttachmentInfoFireRate:registerEventHandler( "transition_complete_keyframe", AttachmentInfoFireRateFrame3 )
					end
				end
				
				AttachmentInfoFireRate:completeAnimation()
				self.AttachmentInfoFireRate:setAlpha( 0 )
				AttachmentInfoFireRateFrame2( AttachmentInfoFireRate, {} )
				local ZmFxSpark20Frame2 = function ( ZmFxSpark20, event )
					local ZmFxSpark20Frame3 = function ( ZmFxSpark20, event )
						local ZmFxSpark20Frame4 = function ( ZmFxSpark20, event )
							local ZmFxSpark20Frame5 = function ( ZmFxSpark20, event )
								if not event.interrupted then
									ZmFxSpark20:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
								end
								ZmFxSpark20:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( ZmFxSpark20, event )
								else
									ZmFxSpark20:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								ZmFxSpark20Frame5( ZmFxSpark20, event )
								return 
							else
								ZmFxSpark20:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
								ZmFxSpark20:registerEventHandler( "transition_complete_keyframe", ZmFxSpark20Frame5 )
							end
						end
						
						if event.interrupted then
							ZmFxSpark20Frame4( ZmFxSpark20, event )
							return 
						else
							ZmFxSpark20:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Bounce )
							ZmFxSpark20:setAlpha( 1 )
							ZmFxSpark20:registerEventHandler( "transition_complete_keyframe", ZmFxSpark20Frame4 )
						end
					end
					
					if event.interrupted then
						ZmFxSpark20Frame3( ZmFxSpark20, event )
						return 
					else
						ZmFxSpark20:beginAnimation( "keyframe", 2029, false, false, CoD.TweenType.Linear )
						ZmFxSpark20:registerEventHandler( "transition_complete_keyframe", ZmFxSpark20Frame3 )
					end
				end
				
				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				ZmFxSpark20Frame2( ZmFxSpark20, {} )
				local f7_local3 = function ( f23_arg0, f23_arg1 )
					local f23_local0 = function ( f24_arg0, f24_arg1 )
						local f24_local0 = function ( f25_arg0, f25_arg1 )
							if not f25_arg1.interrupted then
								f25_arg0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
							end
							f25_arg0:setLeftRight( true, false, 0, 187 )
							f25_arg0:setTopBottom( true, false, 7.25, 30 )
							f25_arg0:setAlpha( 0 )
							if f25_arg1.interrupted then
								self.clipFinished( f25_arg0, f25_arg1 )
							else
								f25_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f24_arg1.interrupted then
							f24_local0( f24_arg0, f24_arg1 )
							return 
						else
							f24_arg0:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
							f24_arg0:setLeftRight( true, false, 23.17, 214.5 )
							f24_arg0:setTopBottom( true, false, 7.29, 30.04 )
							f24_arg0:setAlpha( 0.79 )
							f24_arg0:registerEventHandler( "transition_complete_keyframe", f24_local0 )
						end
					end
					
					if f23_arg1.interrupted then
						f23_local0( f23_arg0, f23_arg1 )
						return 
					else
						f23_arg0:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
						f23_arg0:setLeftRight( true, false, 104.25, 310.75 )
						f23_arg0:setTopBottom( true, false, 7.44, 30.19 )
						f23_arg0:setAlpha( 1 )
						f23_arg0:registerEventHandler( "transition_complete_keyframe", f23_local0 )
					end
				end
				
				Flsh:beginAnimation( "keyframe", 1950, false, false, CoD.TweenType.Linear )
				Flsh:setLeftRight( true, false, 291, 316 )
				Flsh:setTopBottom( true, false, 7.25, 30 )
				Flsh:setAlpha( 0 )
				Flsh:registerEventHandler( "transition_complete_keyframe", f7_local3 )
			end,
			NoAttachments = function ()
				self:setupElementClipCounter( 4 )
				local AttachmentInfoFrame2 = function ( AttachmentInfo, event )
					local AttachmentInfoFrame3 = function ( AttachmentInfo, event )
						local AttachmentInfoFrame4 = function ( AttachmentInfo, event )
							local AttachmentInfoFrame5 = function ( AttachmentInfo, event )
								local AttachmentInfoFrame6 = function ( AttachmentInfo, event )
									local AttachmentInfoFrame7 = function ( AttachmentInfo, event )
										local AttachmentInfoFrame8 = function ( AttachmentInfo, event )
											local AttachmentInfoFrame9 = function ( AttachmentInfo, event )
												local AttachmentInfoFrame10 = function ( AttachmentInfo, event )
													if not event.interrupted then
														AttachmentInfo:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
													end
													AttachmentInfo:setAlpha( 0 )
													if event.interrupted then
														self.clipFinished( AttachmentInfo, event )
													else
														AttachmentInfo:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													AttachmentInfoFrame10( AttachmentInfo, event )
													return 
												else
													AttachmentInfo:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
													AttachmentInfo:registerEventHandler( "transition_complete_keyframe", AttachmentInfoFrame10 )
												end
											end
											
											if event.interrupted then
												AttachmentInfoFrame9( AttachmentInfo, event )
												return 
											else
												AttachmentInfo:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												AttachmentInfo:setAlpha( 0.7 )
												AttachmentInfo:registerEventHandler( "transition_complete_keyframe", AttachmentInfoFrame9 )
											end
										end
										
										if event.interrupted then
											AttachmentInfoFrame8( AttachmentInfo, event )
											return 
										else
											AttachmentInfo:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
											AttachmentInfo:registerEventHandler( "transition_complete_keyframe", AttachmentInfoFrame8 )
										end
									end
									
									if event.interrupted then
										AttachmentInfoFrame7( AttachmentInfo, event )
										return 
									else
										AttachmentInfo:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										AttachmentInfo:setAlpha( 0 )
										AttachmentInfo:registerEventHandler( "transition_complete_keyframe", AttachmentInfoFrame7 )
									end
								end
								
								if event.interrupted then
									AttachmentInfoFrame6( AttachmentInfo, event )
									return 
								else
									AttachmentInfo:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
									AttachmentInfo:registerEventHandler( "transition_complete_keyframe", AttachmentInfoFrame6 )
								end
							end
							
							if event.interrupted then
								AttachmentInfoFrame5( AttachmentInfo, event )
								return 
							else
								AttachmentInfo:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								AttachmentInfo:setAlpha( 0.7 )
								AttachmentInfo:registerEventHandler( "transition_complete_keyframe", AttachmentInfoFrame5 )
							end
						end
						
						if event.interrupted then
							AttachmentInfoFrame4( AttachmentInfo, event )
							return 
						else
							AttachmentInfo:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							AttachmentInfo:registerEventHandler( "transition_complete_keyframe", AttachmentInfoFrame4 )
						end
					end
					
					if event.interrupted then
						AttachmentInfoFrame3( AttachmentInfo, event )
						return 
					else
						AttachmentInfo:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						AttachmentInfo:setAlpha( 0 )
						AttachmentInfo:registerEventHandler( "transition_complete_keyframe", AttachmentInfoFrame3 )
					end
				end
				
				AttachmentInfo:completeAnimation()
				self.AttachmentInfo:setAlpha( 1 )
				AttachmentInfoFrame2( AttachmentInfo, {} )
				local f26_local1 = function ( f36_arg0, f36_arg1 )
					local f36_local0 = function ( f37_arg0, f37_arg1 )
						local f37_local0 = function ( f38_arg0, f38_arg1 )
							local f38_local0 = function ( f39_arg0, f39_arg1 )
								local f39_local0 = function ( f40_arg0, f40_arg1 )
									local f40_local0 = function ( f41_arg0, f41_arg1 )
										local f41_local0 = function ( f42_arg0, f42_arg1 )
											local f42_local0 = function ( f43_arg0, f43_arg1 )
												local f43_local0 = function ( f44_arg0, f44_arg1 )
													if not f44_arg1.interrupted then
														f44_arg0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
													end
													f44_arg0:setAlpha( 1 )
													if f44_arg1.interrupted then
														self.clipFinished( f44_arg0, f44_arg1 )
													else
														f44_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if f43_arg1.interrupted then
													f43_local0( f43_arg0, f43_arg1 )
													return 
												else
													f43_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													f43_arg0:registerEventHandler( "transition_complete_keyframe", f43_local0 )
												end
											end
											
											if f42_arg1.interrupted then
												f42_local0( f42_arg0, f42_arg1 )
												return 
											else
												f42_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												f42_arg0:setAlpha( 0 )
												f42_arg0:registerEventHandler( "transition_complete_keyframe", f42_local0 )
											end
										end
										
										if f41_arg1.interrupted then
											f41_local0( f41_arg0, f41_arg1 )
											return 
										else
											f41_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											f41_arg0:registerEventHandler( "transition_complete_keyframe", f41_local0 )
										end
									end
									
									if f40_arg1.interrupted then
										f40_local0( f40_arg0, f40_arg1 )
										return 
									else
										f40_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										f40_arg0:setAlpha( 0.8 )
										f40_arg0:registerEventHandler( "transition_complete_keyframe", f40_local0 )
									end
								end
								
								if f39_arg1.interrupted then
									f39_local0( f39_arg0, f39_arg1 )
									return 
								else
									f39_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									f39_arg0:registerEventHandler( "transition_complete_keyframe", f39_local0 )
								end
							end
							
							if f38_arg1.interrupted then
								f38_local0( f38_arg0, f38_arg1 )
								return 
							else
								f38_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f38_arg0:setAlpha( 0 )
								f38_arg0:registerEventHandler( "transition_complete_keyframe", f38_local0 )
							end
						end
						
						if f37_arg1.interrupted then
							f37_local0( f37_arg0, f37_arg1 )
							return 
						else
							f37_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							f37_arg0:registerEventHandler( "transition_complete_keyframe", f37_local0 )
						end
					end
					
					if f36_arg1.interrupted then
						f36_local0( f36_arg0, f36_arg1 )
						return 
					else
						f36_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						f36_arg0:setAlpha( 1 )
						f36_arg0:registerEventHandler( "transition_complete_keyframe", f36_local0 )
					end
				end
				
				AttachmentInfoFireRate:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
				AttachmentInfoFireRate:setAlpha( 0 )
				AttachmentInfoFireRate:registerEventHandler( "transition_complete_keyframe", f26_local1 )
				local f26_local2 = function ( f45_arg0, f45_arg1 )
					local f45_local0 = function ( f46_arg0, f46_arg1 )
						local f46_local0 = function ( f47_arg0, f47_arg1 )
							if not f47_arg1.interrupted then
								f47_arg0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
							end
							f47_arg0:setAlpha( 0 )
							if f47_arg1.interrupted then
								self.clipFinished( f47_arg0, f47_arg1 )
							else
								f47_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f46_arg1.interrupted then
							f46_local0( f46_arg0, f46_arg1 )
							return 
						else
							f46_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
							f46_arg0:setAlpha( 0.85 )
							f46_arg0:registerEventHandler( "transition_complete_keyframe", f46_local0 )
						end
					end
					
					if f45_arg1.interrupted then
						f45_local0( f45_arg0, f45_arg1 )
						return 
					else
						f45_arg0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
						f45_arg0:setAlpha( 1 )
						f45_arg0:registerEventHandler( "transition_complete_keyframe", f45_local0 )
					end
				end
				
				ZmFxSpark20:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
				ZmFxSpark20:setAlpha( 0 )
				ZmFxSpark20:registerEventHandler( "transition_complete_keyframe", f26_local2 )
				local FlshFrame2 = function ( Flsh, event )
					local FlshFrame3 = function ( Flsh, event )
						local FlshFrame4 = function ( Flsh, event )
							local FlshFrame5 = function ( Flsh, event )
								local FlshFrame6 = function ( Flsh, event )
									if not event.interrupted then
										Flsh:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									end
									Flsh:setLeftRight( true, false, 0, 124 )
									Flsh:setTopBottom( true, false, 7.44, 30.19 )
									Flsh:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( Flsh, event )
									else
										Flsh:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									FlshFrame6( Flsh, event )
									return 
								else
									Flsh:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
									Flsh:setLeftRight( true, false, 0, 124 )
									Flsh:setTopBottom( true, false, 7.44, 30.19 )
									Flsh:setAlpha( 0.1 )
									Flsh:registerEventHandler( "transition_complete_keyframe", FlshFrame6 )
								end
							end
							
							if event.interrupted then
								FlshFrame5( Flsh, event )
								return 
							else
								Flsh:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
								Flsh:setLeftRight( true, false, 25.39, 162.4 )
								Flsh:setTopBottom( true, false, 7.4, 30.15 )
								Flsh:setAlpha( 0.6 )
								Flsh:registerEventHandler( "transition_complete_keyframe", FlshFrame5 )
							end
						end
						
						if event.interrupted then
							FlshFrame4( Flsh, event )
							return 
						else
							Flsh:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							Flsh:setLeftRight( true, false, 81.24, 246.88 )
							Flsh:setTopBottom( true, false, 7.32, 30.07 )
							Flsh:setAlpha( 0.91 )
							Flsh:registerEventHandler( "transition_complete_keyframe", FlshFrame4 )
						end
					end
					
					if event.interrupted then
						FlshFrame3( Flsh, event )
						return 
					else
						Flsh:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						Flsh:setLeftRight( true, false, 151.16, 269.92 )
						Flsh:setTopBottom( true, false, 7.3, 30.05 )
						Flsh:setAlpha( 1 )
						Flsh:registerEventHandler( "transition_complete_keyframe", FlshFrame3 )
					end
				end
				
				Flsh:completeAnimation()
				self.Flsh:setLeftRight( true, false, 291, 316 )
				self.Flsh:setTopBottom( true, false, 7.25, 30 )
				self.Flsh:setAlpha( 0 )
				FlshFrame2( Flsh, {} )
			end
		},
		NoAttachments = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				AttachmentInfo:completeAnimation()
				self.AttachmentInfo:setAlpha( 0 )
				self.clipFinished( AttachmentInfo, {} )
				AttachmentInfoFireRate:completeAnimation()
				self.AttachmentInfoFireRate:setAlpha( 1 )
				self.clipFinished( AttachmentInfoFireRate, {} )
				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				self.clipFinished( ZmFxSpark20, {} )
				Flsh:completeAnimation()
				self.Flsh:setAlpha( 0 )
				self.clipFinished( Flsh, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 4 )
				local f54_local0 = function ( f55_arg0, f55_arg1 )
					local f55_local0 = function ( f56_arg0, f56_arg1 )
						local f56_local0 = function ( f57_arg0, f57_arg1 )
							local f57_local0 = function ( f58_arg0, f58_arg1 )
								local f58_local0 = function ( f59_arg0, f59_arg1 )
									local f59_local0 = function ( f60_arg0, f60_arg1 )
										local f60_local0 = function ( f61_arg0, f61_arg1 )
											local f61_local0 = function ( f62_arg0, f62_arg1 )
												local f62_local0 = function ( f63_arg0, f63_arg1 )
													if not f63_arg1.interrupted then
														f63_arg0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
													end
													f63_arg0:setAlpha( 1 )
													if f63_arg1.interrupted then
														self.clipFinished( f63_arg0, f63_arg1 )
													else
														f63_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if f62_arg1.interrupted then
													f62_local0( f62_arg0, f62_arg1 )
													return 
												else
													f62_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													f62_arg0:registerEventHandler( "transition_complete_keyframe", f62_local0 )
												end
											end
											
											if f61_arg1.interrupted then
												f61_local0( f61_arg0, f61_arg1 )
												return 
											else
												f61_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												f61_arg0:setAlpha( 0 )
												f61_arg0:registerEventHandler( "transition_complete_keyframe", f61_local0 )
											end
										end
										
										if f60_arg1.interrupted then
											f60_local0( f60_arg0, f60_arg1 )
											return 
										else
											f60_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											f60_arg0:registerEventHandler( "transition_complete_keyframe", f60_local0 )
										end
									end
									
									if f59_arg1.interrupted then
										f59_local0( f59_arg0, f59_arg1 )
										return 
									else
										f59_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										f59_arg0:setAlpha( 0.8 )
										f59_arg0:registerEventHandler( "transition_complete_keyframe", f59_local0 )
									end
								end
								
								if f58_arg1.interrupted then
									f58_local0( f58_arg0, f58_arg1 )
									return 
								else
									f58_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									f58_arg0:registerEventHandler( "transition_complete_keyframe", f58_local0 )
								end
							end
							
							if f57_arg1.interrupted then
								f57_local0( f57_arg0, f57_arg1 )
								return 
							else
								f57_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f57_arg0:setAlpha( 0 )
								f57_arg0:registerEventHandler( "transition_complete_keyframe", f57_local0 )
							end
						end
						
						if f56_arg1.interrupted then
							f56_local0( f56_arg0, f56_arg1 )
							return 
						else
							f56_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							f56_arg0:registerEventHandler( "transition_complete_keyframe", f56_local0 )
						end
					end
					
					if f55_arg1.interrupted then
						f55_local0( f55_arg0, f55_arg1 )
						return 
					else
						f55_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						f55_arg0:setAlpha( 1 )
						f55_arg0:registerEventHandler( "transition_complete_keyframe", f55_local0 )
					end
				end
				
				AttachmentInfo:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
				AttachmentInfo:setAlpha( 0 )
				AttachmentInfo:registerEventHandler( "transition_complete_keyframe", f54_local0 )
				local AttachmentInfoFireRateFrame2 = function ( AttachmentInfoFireRate, event )
					local AttachmentInfoFireRateFrame3 = function ( AttachmentInfoFireRate, event )
						local AttachmentInfoFireRateFrame4 = function ( AttachmentInfoFireRate, event )
							local AttachmentInfoFireRateFrame5 = function ( AttachmentInfoFireRate, event )
								local AttachmentInfoFireRateFrame6 = function ( AttachmentInfoFireRate, event )
									local AttachmentInfoFireRateFrame7 = function ( AttachmentInfoFireRate, event )
										local AttachmentInfoFireRateFrame8 = function ( AttachmentInfoFireRate, event )
											local AttachmentInfoFireRateFrame9 = function ( AttachmentInfoFireRate, event )
												local AttachmentInfoFireRateFrame10 = function ( AttachmentInfoFireRate, event )
													if not event.interrupted then
														AttachmentInfoFireRate:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
													end
													AttachmentInfoFireRate:setAlpha( 0 )
													if event.interrupted then
														self.clipFinished( AttachmentInfoFireRate, event )
													else
														AttachmentInfoFireRate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													AttachmentInfoFireRateFrame10( AttachmentInfoFireRate, event )
													return 
												else
													AttachmentInfoFireRate:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
													AttachmentInfoFireRate:registerEventHandler( "transition_complete_keyframe", AttachmentInfoFireRateFrame10 )
												end
											end
											
											if event.interrupted then
												AttachmentInfoFireRateFrame9( AttachmentInfoFireRate, event )
												return 
											else
												AttachmentInfoFireRate:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												AttachmentInfoFireRate:setAlpha( 0.7 )
												AttachmentInfoFireRate:registerEventHandler( "transition_complete_keyframe", AttachmentInfoFireRateFrame9 )
											end
										end
										
										if event.interrupted then
											AttachmentInfoFireRateFrame8( AttachmentInfoFireRate, event )
											return 
										else
											AttachmentInfoFireRate:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
											AttachmentInfoFireRate:registerEventHandler( "transition_complete_keyframe", AttachmentInfoFireRateFrame8 )
										end
									end
									
									if event.interrupted then
										AttachmentInfoFireRateFrame7( AttachmentInfoFireRate, event )
										return 
									else
										AttachmentInfoFireRate:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										AttachmentInfoFireRate:setAlpha( 0 )
										AttachmentInfoFireRate:registerEventHandler( "transition_complete_keyframe", AttachmentInfoFireRateFrame7 )
									end
								end
								
								if event.interrupted then
									AttachmentInfoFireRateFrame6( AttachmentInfoFireRate, event )
									return 
								else
									AttachmentInfoFireRate:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
									AttachmentInfoFireRate:registerEventHandler( "transition_complete_keyframe", AttachmentInfoFireRateFrame6 )
								end
							end
							
							if event.interrupted then
								AttachmentInfoFireRateFrame5( AttachmentInfoFireRate, event )
								return 
							else
								AttachmentInfoFireRate:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								AttachmentInfoFireRate:setAlpha( 0.7 )
								AttachmentInfoFireRate:registerEventHandler( "transition_complete_keyframe", AttachmentInfoFireRateFrame5 )
							end
						end
						
						if event.interrupted then
							AttachmentInfoFireRateFrame4( AttachmentInfoFireRate, event )
							return 
						else
							AttachmentInfoFireRate:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							AttachmentInfoFireRate:registerEventHandler( "transition_complete_keyframe", AttachmentInfoFireRateFrame4 )
						end
					end
					
					if event.interrupted then
						AttachmentInfoFireRateFrame3( AttachmentInfoFireRate, event )
						return 
					else
						AttachmentInfoFireRate:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						AttachmentInfoFireRate:setAlpha( 0 )
						AttachmentInfoFireRate:registerEventHandler( "transition_complete_keyframe", AttachmentInfoFireRateFrame3 )
					end
				end
				
				AttachmentInfoFireRate:completeAnimation()
				self.AttachmentInfoFireRate:setAlpha( 1 )
				AttachmentInfoFireRateFrame2( AttachmentInfoFireRate, {} )
				local ZmFxSpark20Frame2 = function ( ZmFxSpark20, event )
					local ZmFxSpark20Frame3 = function ( ZmFxSpark20, event )
						local ZmFxSpark20Frame4 = function ( ZmFxSpark20, event )
							local ZmFxSpark20Frame5 = function ( ZmFxSpark20, event )
								local ZmFxSpark20Frame6 = function ( ZmFxSpark20, event )
									local ZmFxSpark20Frame7 = function ( ZmFxSpark20, event )
										if not event.interrupted then
											ZmFxSpark20:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
										end
										ZmFxSpark20:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( ZmFxSpark20, event )
										else
											ZmFxSpark20:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										ZmFxSpark20Frame7( ZmFxSpark20, event )
										return 
									else
										ZmFxSpark20:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
										ZmFxSpark20:registerEventHandler( "transition_complete_keyframe", ZmFxSpark20Frame7 )
									end
								end
								
								if event.interrupted then
									ZmFxSpark20Frame6( ZmFxSpark20, event )
									return 
								else
									ZmFxSpark20:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
									ZmFxSpark20:setAlpha( 1 )
									ZmFxSpark20:registerEventHandler( "transition_complete_keyframe", ZmFxSpark20Frame6 )
								end
							end
							
							if event.interrupted then
								ZmFxSpark20Frame5( ZmFxSpark20, event )
								return 
							else
								ZmFxSpark20:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								ZmFxSpark20:setAlpha( 0.49 )
								ZmFxSpark20:registerEventHandler( "transition_complete_keyframe", ZmFxSpark20Frame5 )
							end
						end
						
						if event.interrupted then
							ZmFxSpark20Frame4( ZmFxSpark20, event )
							return 
						else
							ZmFxSpark20:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							ZmFxSpark20:registerEventHandler( "transition_complete_keyframe", ZmFxSpark20Frame4 )
						end
					end
					
					if event.interrupted then
						ZmFxSpark20Frame3( ZmFxSpark20, event )
						return 
					else
						ZmFxSpark20:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						ZmFxSpark20:setAlpha( 1 )
						ZmFxSpark20:registerEventHandler( "transition_complete_keyframe", ZmFxSpark20Frame3 )
					end
				end
				
				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				ZmFxSpark20Frame2( ZmFxSpark20, {} )
				local FlshFrame2 = function ( Flsh, event )
					local FlshFrame3 = function ( Flsh, event )
						local FlshFrame4 = function ( Flsh, event )
							local FlshFrame5 = function ( Flsh, event )
								if not event.interrupted then
									Flsh:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
								end
								Flsh:setLeftRight( true, false, 0, 80 )
								Flsh:setTopBottom( true, false, 7.44, 30.19 )
								Flsh:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Flsh, event )
								else
									Flsh:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								FlshFrame5( Flsh, event )
								return 
							else
								Flsh:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
								Flsh:setLeftRight( true, false, 49.99, 149.21 )
								Flsh:registerEventHandler( "transition_complete_keyframe", FlshFrame5 )
							end
						end
						
						if event.interrupted then
							FlshFrame4( Flsh, event )
							return 
						else
							Flsh:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							Flsh:setLeftRight( true, false, 133.3, 264.57 )
							Flsh:registerEventHandler( "transition_complete_keyframe", FlshFrame4 )
						end
					end
					
					if event.interrupted then
						FlshFrame3( Flsh, event )
						return 
					else
						Flsh:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						Flsh:setLeftRight( true, false, 203.89, 286.61 )
						Flsh:setAlpha( 1 )
						Flsh:registerEventHandler( "transition_complete_keyframe", FlshFrame3 )
					end
				end
				
				Flsh:completeAnimation()
				self.Flsh:setLeftRight( true, false, 298, 316 )
				self.Flsh:setTopBottom( true, false, 7.44, 30.19 )
				self.Flsh:setAlpha( 0 )
				FlshFrame2( Flsh, {} )
			end
		},
		HeroWeapon = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				AttachmentInfo:completeAnimation()
				self.AttachmentInfo:setAlpha( 0 )
				self.clipFinished( AttachmentInfo, {} )
				AttachmentInfoFireRate:completeAnimation()
				self.AttachmentInfoFireRate:setAlpha( 0.5 )
				self.clipFinished( AttachmentInfoFireRate, {} )
				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				self.clipFinished( ZmFxSpark20, {} )
				Flsh:completeAnimation()
				self.Flsh:setAlpha( 0 )
				self.clipFinished( Flsh, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.AttachmentInfo:close()
		element.AttachmentInfoFireRate:close()
		element.ZmFxSpark20:close()
		element.Label0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

