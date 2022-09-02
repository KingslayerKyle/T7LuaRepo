-- 641346fe714d570a8ffba79c241f500b
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_TextAttachmentInfo" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_TextAttachmentInfoFire" )
require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidget_Pixel" )

local f0_local0 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = f1_arg0.AttachmentInfo.currentWeapon
	local f1_local1, f1_local2 = CoD.CACUtility.GetWeaponAndAttachments( f1_arg0.AttachmentInfo, f1_arg1 )
	if not f1_arg0.AttachmentInfo.currentWeapon then
		return 
	elseif f1_local0 ~= f1_arg0.AttachmentInfo.currentWeapon or f1_local2 then
		f1_arg0.AttachmentInfo:UpdateAttachments()
	end
	local f1_local3 = "DefaultState"
	if f1_local1 == 0 then
		f1_local3 = "NoAttachments"
	end
	if f1_arg0.currentState ~= f1_local3 then
		f1_arg0:setState( f1_local3 )
	elseif f1_local0 ~= f1_arg0.AttachmentInfo.currentWeapon or f1_local2 then
		f1_arg0:playClip( "DefaultClip" )
	end
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	f2_arg0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f2_arg1 ), "currentWeapon.updateWeaponSelect" ), function ( model )
		f0_local0( f2_arg0, f2_arg1 )
	end )
end

CoD.AmmoWidget_AttachmentInfo = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_AttachmentInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_AttachmentInfo )
	self.id = "AmmoWidget_AttachmentInfo"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 316 )
	self:setTopBottom( true, false, 0, 18 )
	self.anyChildUsesUpdateState = true
	
	local AttachmentInfo = CoD.AmmoWidget_TextAttachmentInfo.new( menu, controller )
	AttachmentInfo:setLeftRight( false, true, -296, 0 )
	AttachmentInfo:setTopBottom( false, true, -18, 0 )
	self:addElement( AttachmentInfo )
	self.AttachmentInfo = AttachmentInfo
	
	local AttachmentInfoFireRate = CoD.AmmoWidget_TextAttachmentInfoFire.new( menu, controller )
	AttachmentInfoFireRate:setLeftRight( false, true, -296, 0 )
	AttachmentInfoFireRate:setTopBottom( false, true, -18, 0 )
	AttachmentInfoFireRate:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	AttachmentInfoFireRate:setShaderVector( 0, 0, 0, 0, 0 )
	AttachmentInfoFireRate:setShaderVector( 1, 0.1, 0, 0, 0 )
	AttachmentInfoFireRate:setShaderVector( 2, -1, 0, 0, 0 )
	AttachmentInfoFireRate:setShaderVector( 3, 0, 0, 0, 0 )
	AttachmentInfoFireRate:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( AttachmentInfoFireRate )
	self.AttachmentInfoFireRate = AttachmentInfoFireRate
	
	local Pixel0 = CoD.DamageWidget_Pixel.new( menu, controller )
	Pixel0:setLeftRight( true, false, 224.25, 235.25 )
	Pixel0:setTopBottom( true, false, 4.5, 6 )
	Pixel0:setAlpha( 0 )
	self:addElement( Pixel0 )
	self.Pixel0 = Pixel0
	
	local Pixel1 = CoD.DamageWidget_Pixel.new( menu, controller )
	Pixel1:setLeftRight( true, false, 224.25, 235.25 )
	Pixel1:setTopBottom( true, false, 12.5, 14 )
	Pixel1:setAlpha( 0 )
	self:addElement( Pixel1 )
	self.Pixel1 = Pixel1
	
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
				local f5_local2 = function ( f17_arg0, f17_arg1 )
					local f17_local0 = function ( f18_arg0, f18_arg1 )
						local f18_local0 = function ( f19_arg0, f19_arg1 )
							local f19_local0 = function ( f20_arg0, f20_arg1 )
								local f20_local0 = function ( f21_arg0, f21_arg1 )
									local f21_local0 = function ( f22_arg0, f22_arg1 )
										local f22_local0 = function ( f23_arg0, f23_arg1 )
											if not f23_arg1.interrupted then
												f23_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											end
											f23_arg0:setLeftRight( true, false, 224.25, 252.25 )
											f23_arg0:setTopBottom( true, false, 13.5, 11 )
											f23_arg0:setAlpha( 0 )
											if f23_arg1.interrupted then
												self.clipFinished( f23_arg0, f23_arg1 )
											else
												f23_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if f22_arg1.interrupted then
											f22_local0( f22_arg0, f22_arg1 )
											return 
										else
											f22_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											f22_arg0:registerEventHandler( "transition_complete_keyframe", f22_local0 )
										end
									end
									
									if f21_arg1.interrupted then
										f21_local0( f21_arg0, f21_arg1 )
										return 
									else
										f21_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										f21_arg0:setLeftRight( true, false, 224.25, 252.25 )
										f21_arg0:setTopBottom( true, false, 13.5, 11 )
										f21_arg0:setAlpha( 1 )
										f21_arg0:registerEventHandler( "transition_complete_keyframe", f21_local0 )
									end
								end
								
								if f20_arg1.interrupted then
									f20_local0( f20_arg0, f20_arg1 )
									return 
								else
									f20_arg0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
									f20_arg0:registerEventHandler( "transition_complete_keyframe", f20_local0 )
								end
							end
							
							if f19_arg1.interrupted then
								f19_local0( f19_arg0, f19_arg1 )
								return 
							else
								f19_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								f19_arg0:setAlpha( 0 )
								f19_arg0:registerEventHandler( "transition_complete_keyframe", f19_local0 )
							end
						end
						
						if f18_arg1.interrupted then
							f18_local0( f18_arg0, f18_arg1 )
							return 
						else
							f18_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							f18_arg0:registerEventHandler( "transition_complete_keyframe", f18_local0 )
						end
					end
					
					if f17_arg1.interrupted then
						f17_local0( f17_arg0, f17_arg1 )
						return 
					else
						f17_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						f17_arg0:setAlpha( 1 )
						f17_arg0:registerEventHandler( "transition_complete_keyframe", f17_local0 )
					end
				end
				
				Pixel0:beginAnimation( "keyframe", 2099, false, false, CoD.TweenType.Linear )
				Pixel0:setLeftRight( true, false, 224.25, 295.25 )
				Pixel0:setTopBottom( true, false, 9.5, 11 )
				Pixel0:setAlpha( 0 )
				Pixel0:registerEventHandler( "transition_complete_keyframe", f5_local2 )
				local f5_local3 = function ( f24_arg0, f24_arg1 )
					local f24_local0 = function ( f25_arg0, f25_arg1 )
						local f25_local0 = function ( f26_arg0, f26_arg1 )
							local f26_local0 = function ( f27_arg0, f27_arg1 )
								local f27_local0 = function ( f28_arg0, f28_arg1 )
									local f28_local0 = function ( f29_arg0, f29_arg1 )
										local f29_local0 = function ( f30_arg0, f30_arg1 )
											if not f30_arg1.interrupted then
												f30_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											end
											f30_arg0:setLeftRight( true, false, 224.25, 295.25 )
											f30_arg0:setTopBottom( true, false, 4.5, 3 )
											f30_arg0:setAlpha( 0 )
											if f30_arg1.interrupted then
												self.clipFinished( f30_arg0, f30_arg1 )
											else
												f30_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if f29_arg1.interrupted then
											f29_local0( f29_arg0, f29_arg1 )
											return 
										else
											f29_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											f29_arg0:registerEventHandler( "transition_complete_keyframe", f29_local0 )
										end
									end
									
									if f28_arg1.interrupted then
										f28_local0( f28_arg0, f28_arg1 )
										return 
									else
										f28_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										f28_arg0:setLeftRight( true, false, 224.25, 295.25 )
										f28_arg0:setTopBottom( true, false, 4.5, 3 )
										f28_arg0:setAlpha( 1 )
										f28_arg0:registerEventHandler( "transition_complete_keyframe", f28_local0 )
									end
								end
								
								if f27_arg1.interrupted then
									f27_local0( f27_arg0, f27_arg1 )
									return 
								else
									f27_arg0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
									f27_arg0:registerEventHandler( "transition_complete_keyframe", f27_local0 )
								end
							end
							
							if f26_arg1.interrupted then
								f26_local0( f26_arg0, f26_arg1 )
								return 
							else
								f26_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f26_arg0:setAlpha( 0 )
								f26_arg0:registerEventHandler( "transition_complete_keyframe", f26_local0 )
							end
						end
						
						if f25_arg1.interrupted then
							f25_local0( f25_arg0, f25_arg1 )
							return 
						else
							f25_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							f25_arg0:registerEventHandler( "transition_complete_keyframe", f25_local0 )
						end
					end
					
					if f24_arg1.interrupted then
						f24_local0( f24_arg0, f24_arg1 )
						return 
					else
						f24_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						f24_arg0:setAlpha( 1 )
						f24_arg0:registerEventHandler( "transition_complete_keyframe", f24_local0 )
					end
				end
				
				Pixel1:beginAnimation( "keyframe", 2009, false, false, CoD.TweenType.Linear )
				Pixel1:setLeftRight( true, false, 239.25, 250.25 )
				Pixel1:setTopBottom( true, false, 6.5, 3 )
				Pixel1:setAlpha( 0 )
				Pixel1:registerEventHandler( "transition_complete_keyframe", f5_local3 )
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
				local f31_local1 = function ( f41_arg0, f41_arg1 )
					local f41_local0 = function ( f42_arg0, f42_arg1 )
						local f42_local0 = function ( f43_arg0, f43_arg1 )
							local f43_local0 = function ( f44_arg0, f44_arg1 )
								local f44_local0 = function ( f45_arg0, f45_arg1 )
									local f45_local0 = function ( f46_arg0, f46_arg1 )
										local f46_local0 = function ( f47_arg0, f47_arg1 )
											local f47_local0 = function ( f48_arg0, f48_arg1 )
												local f48_local0 = function ( f49_arg0, f49_arg1 )
													if not f49_arg1.interrupted then
														f49_arg0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
													end
													f49_arg0:setAlpha( 1 )
													if f49_arg1.interrupted then
														self.clipFinished( f49_arg0, f49_arg1 )
													else
														f49_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if f48_arg1.interrupted then
													f48_local0( f48_arg0, f48_arg1 )
													return 
												else
													f48_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													f48_arg0:registerEventHandler( "transition_complete_keyframe", f48_local0 )
												end
											end
											
											if f47_arg1.interrupted then
												f47_local0( f47_arg0, f47_arg1 )
												return 
											else
												f47_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												f47_arg0:setAlpha( 0 )
												f47_arg0:registerEventHandler( "transition_complete_keyframe", f47_local0 )
											end
										end
										
										if f46_arg1.interrupted then
											f46_local0( f46_arg0, f46_arg1 )
											return 
										else
											f46_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											f46_arg0:registerEventHandler( "transition_complete_keyframe", f46_local0 )
										end
									end
									
									if f45_arg1.interrupted then
										f45_local0( f45_arg0, f45_arg1 )
										return 
									else
										f45_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										f45_arg0:setAlpha( 0.8 )
										f45_arg0:registerEventHandler( "transition_complete_keyframe", f45_local0 )
									end
								end
								
								if f44_arg1.interrupted then
									f44_local0( f44_arg0, f44_arg1 )
									return 
								else
									f44_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									f44_arg0:registerEventHandler( "transition_complete_keyframe", f44_local0 )
								end
							end
							
							if f43_arg1.interrupted then
								f43_local0( f43_arg0, f43_arg1 )
								return 
							else
								f43_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f43_arg0:setAlpha( 0 )
								f43_arg0:registerEventHandler( "transition_complete_keyframe", f43_local0 )
							end
						end
						
						if f42_arg1.interrupted then
							f42_local0( f42_arg0, f42_arg1 )
							return 
						else
							f42_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							f42_arg0:registerEventHandler( "transition_complete_keyframe", f42_local0 )
						end
					end
					
					if f41_arg1.interrupted then
						f41_local0( f41_arg0, f41_arg1 )
						return 
					else
						f41_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						f41_arg0:setAlpha( 1 )
						f41_arg0:registerEventHandler( "transition_complete_keyframe", f41_local0 )
					end
				end
				
				AttachmentInfoFireRate:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
				AttachmentInfoFireRate:setAlpha( 0 )
				AttachmentInfoFireRate:registerEventHandler( "transition_complete_keyframe", f31_local1 )
				local Pixel0Frame2 = function ( Pixel0, event )
					local Pixel0Frame3 = function ( Pixel0, event )
						local Pixel0Frame4 = function ( Pixel0, event )
							local Pixel0Frame5 = function ( Pixel0, event )
								local Pixel0Frame6 = function ( Pixel0, event )
									local Pixel0Frame7 = function ( Pixel0, event )
										local Pixel0Frame8 = function ( Pixel0, event )
											local Pixel0Frame9 = function ( Pixel0, event )
												if not event.interrupted then
													Pixel0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												end
												Pixel0:setLeftRight( true, false, 224.25, 235.25 )
												Pixel0:setTopBottom( true, false, 4.5, 8 )
												Pixel0:setAlpha( 0 )
												if event.interrupted then
													self.clipFinished( Pixel0, event )
												else
													Pixel0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												Pixel0Frame9( Pixel0, event )
												return 
											else
												Pixel0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												Pixel0:registerEventHandler( "transition_complete_keyframe", Pixel0Frame9 )
											end
										end
										
										if event.interrupted then
											Pixel0Frame8( Pixel0, event )
											return 
										else
											Pixel0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											Pixel0:setLeftRight( true, false, 224.25, 235.25 )
											Pixel0:setTopBottom( true, false, 4.5, 8 )
											Pixel0:setAlpha( 1 )
											Pixel0:registerEventHandler( "transition_complete_keyframe", Pixel0Frame8 )
										end
									end
									
									if event.interrupted then
										Pixel0Frame7( Pixel0, event )
										return 
									else
										Pixel0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
										Pixel0:registerEventHandler( "transition_complete_keyframe", Pixel0Frame7 )
									end
								end
								
								if event.interrupted then
									Pixel0Frame6( Pixel0, event )
									return 
								else
									Pixel0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									Pixel0:setAlpha( 0 )
									Pixel0:registerEventHandler( "transition_complete_keyframe", Pixel0Frame6 )
								end
							end
							
							if event.interrupted then
								Pixel0Frame5( Pixel0, event )
								return 
							else
								Pixel0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								Pixel0:registerEventHandler( "transition_complete_keyframe", Pixel0Frame5 )
							end
						end
						
						if event.interrupted then
							Pixel0Frame4( Pixel0, event )
							return 
						else
							Pixel0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Pixel0:setAlpha( 1 )
							Pixel0:registerEventHandler( "transition_complete_keyframe", Pixel0Frame4 )
						end
					end
					
					if event.interrupted then
						Pixel0Frame3( Pixel0, event )
						return 
					else
						Pixel0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						Pixel0:registerEventHandler( "transition_complete_keyframe", Pixel0Frame3 )
					end
				end
				
				Pixel0:completeAnimation()
				self.Pixel0:setLeftRight( true, false, 249.25, 334.25 )
				self.Pixel0:setTopBottom( true, false, 4.5, 6 )
				self.Pixel0:setAlpha( 0 )
				Pixel0Frame2( Pixel0, {} )
				local Pixel1Frame2 = function ( Pixel1, event )
					local Pixel1Frame3 = function ( Pixel1, event )
						local Pixel1Frame4 = function ( Pixel1, event )
							local Pixel1Frame5 = function ( Pixel1, event )
								local Pixel1Frame6 = function ( Pixel1, event )
									local Pixel1Frame7 = function ( Pixel1, event )
										local Pixel1Frame8 = function ( Pixel1, event )
											local Pixel1Frame9 = function ( Pixel1, event )
												local Pixel1Frame10 = function ( Pixel1, event )
													local Pixel1Frame11 = function ( Pixel1, event )
														if not event.interrupted then
															Pixel1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														end
														Pixel1:setLeftRight( true, false, 224.25, 235.25 )
														Pixel1:setTopBottom( true, false, 10.5, 14 )
														Pixel1:setAlpha( 0 )
														if event.interrupted then
															self.clipFinished( Pixel1, event )
														else
															Pixel1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														Pixel1Frame11( Pixel1, event )
														return 
													else
														Pixel1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														Pixel1:registerEventHandler( "transition_complete_keyframe", Pixel1Frame11 )
													end
												end
												
												if event.interrupted then
													Pixel1Frame10( Pixel1, event )
													return 
												else
													Pixel1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
													Pixel1:setLeftRight( true, false, 224.25, 235.25 )
													Pixel1:setTopBottom( true, false, 10.5, 14 )
													Pixel1:setAlpha( 1 )
													Pixel1:registerEventHandler( "transition_complete_keyframe", Pixel1Frame10 )
												end
											end
											
											if event.interrupted then
												Pixel1Frame9( Pixel1, event )
												return 
											else
												Pixel1:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
												Pixel1:setLeftRight( true, false, 249.25, 334.25 )
												Pixel1:registerEventHandler( "transition_complete_keyframe", Pixel1Frame9 )
											end
										end
										
										if event.interrupted then
											Pixel1Frame8( Pixel1, event )
											return 
										else
											Pixel1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											Pixel1:setLeftRight( true, false, 229.92, 334.25 )
											Pixel1:setAlpha( 0 )
											Pixel1:registerEventHandler( "transition_complete_keyframe", Pixel1Frame8 )
										end
									end
									
									if event.interrupted then
										Pixel1Frame7( Pixel1, event )
										return 
									else
										Pixel1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										Pixel1:registerEventHandler( "transition_complete_keyframe", Pixel1Frame7 )
									end
								end
								
								if event.interrupted then
									Pixel1Frame6( Pixel1, event )
									return 
								else
									Pixel1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									Pixel1:setLeftRight( true, false, 220.25, 334.25 )
									Pixel1:registerEventHandler( "transition_complete_keyframe", Pixel1Frame6 )
								end
							end
							
							if event.interrupted then
								Pixel1Frame5( Pixel1, event )
								return 
							else
								Pixel1:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								Pixel1:registerEventHandler( "transition_complete_keyframe", Pixel1Frame5 )
							end
						end
						
						if event.interrupted then
							Pixel1Frame4( Pixel1, event )
							return 
						else
							Pixel1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Pixel1:setAlpha( 1 )
							Pixel1:registerEventHandler( "transition_complete_keyframe", Pixel1Frame4 )
						end
					end
					
					if event.interrupted then
						Pixel1Frame3( Pixel1, event )
						return 
					else
						Pixel1:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						Pixel1:registerEventHandler( "transition_complete_keyframe", Pixel1Frame3 )
					end
				end
				
				Pixel1:completeAnimation()
				self.Pixel1:setLeftRight( true, false, 249.25, 334.25 )
				self.Pixel1:setTopBottom( true, false, 12.5, 14 )
				self.Pixel1:setAlpha( 0 )
				Pixel1Frame2( Pixel1, {} )
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

				Pixel0:completeAnimation()
				self.Pixel0:setLeftRight( true, false, 249.25, 334.25 )
				self.Pixel0:setTopBottom( true, false, 4.5, 6 )
				self.clipFinished( Pixel0, {} )

				Pixel1:completeAnimation()
				self.Pixel1:setLeftRight( true, false, 249.25, 334.25 )
				self.Pixel1:setTopBottom( true, false, 12.5, 14 )
				self.clipFinished( Pixel1, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 4 )

				local f69_local0 = function ( f70_arg0, f70_arg1 )
					local f70_local0 = function ( f71_arg0, f71_arg1 )
						local f71_local0 = function ( f72_arg0, f72_arg1 )
							local f72_local0 = function ( f73_arg0, f73_arg1 )
								local f73_local0 = function ( f74_arg0, f74_arg1 )
									local f74_local0 = function ( f75_arg0, f75_arg1 )
										local f75_local0 = function ( f76_arg0, f76_arg1 )
											local f76_local0 = function ( f77_arg0, f77_arg1 )
												local f77_local0 = function ( f78_arg0, f78_arg1 )
													if not f78_arg1.interrupted then
														f78_arg0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
													end
													f78_arg0:setAlpha( 1 )
													if f78_arg1.interrupted then
														self.clipFinished( f78_arg0, f78_arg1 )
													else
														f78_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if f77_arg1.interrupted then
													f77_local0( f77_arg0, f77_arg1 )
													return 
												else
													f77_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													f77_arg0:registerEventHandler( "transition_complete_keyframe", f77_local0 )
												end
											end
											
											if f76_arg1.interrupted then
												f76_local0( f76_arg0, f76_arg1 )
												return 
											else
												f76_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												f76_arg0:setAlpha( 0 )
												f76_arg0:registerEventHandler( "transition_complete_keyframe", f76_local0 )
											end
										end
										
										if f75_arg1.interrupted then
											f75_local0( f75_arg0, f75_arg1 )
											return 
										else
											f75_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											f75_arg0:registerEventHandler( "transition_complete_keyframe", f75_local0 )
										end
									end
									
									if f74_arg1.interrupted then
										f74_local0( f74_arg0, f74_arg1 )
										return 
									else
										f74_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										f74_arg0:setAlpha( 0.8 )
										f74_arg0:registerEventHandler( "transition_complete_keyframe", f74_local0 )
									end
								end
								
								if f73_arg1.interrupted then
									f73_local0( f73_arg0, f73_arg1 )
									return 
								else
									f73_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									f73_arg0:registerEventHandler( "transition_complete_keyframe", f73_local0 )
								end
							end
							
							if f72_arg1.interrupted then
								f72_local0( f72_arg0, f72_arg1 )
								return 
							else
								f72_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f72_arg0:setAlpha( 0 )
								f72_arg0:registerEventHandler( "transition_complete_keyframe", f72_local0 )
							end
						end
						
						if f71_arg1.interrupted then
							f71_local0( f71_arg0, f71_arg1 )
							return 
						else
							f71_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							f71_arg0:registerEventHandler( "transition_complete_keyframe", f71_local0 )
						end
					end
					
					if f70_arg1.interrupted then
						f70_local0( f70_arg0, f70_arg1 )
						return 
					else
						f70_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						f70_arg0:setAlpha( 1 )
						f70_arg0:registerEventHandler( "transition_complete_keyframe", f70_local0 )
					end
				end
				
				AttachmentInfo:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
				AttachmentInfo:setAlpha( 0 )
				AttachmentInfo:registerEventHandler( "transition_complete_keyframe", f69_local0 )
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
				local Pixel0Frame2 = function ( Pixel0, event )
					local Pixel0Frame3 = function ( Pixel0, event )
						local Pixel0Frame4 = function ( Pixel0, event )
							local Pixel0Frame5 = function ( Pixel0, event )
								local Pixel0Frame6 = function ( Pixel0, event )
									local Pixel0Frame7 = function ( Pixel0, event )
										local Pixel0Frame8 = function ( Pixel0, event )
											local Pixel0Frame9 = function ( Pixel0, event )
												if not event.interrupted then
													Pixel0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												end
												Pixel0:setLeftRight( true, false, 224.25, 235.25 )
												Pixel0:setTopBottom( true, false, 4.5, 6 )
												Pixel0:setAlpha( 0 )
												if event.interrupted then
													self.clipFinished( Pixel0, event )
												else
													Pixel0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												Pixel0Frame9( Pixel0, event )
												return 
											else
												Pixel0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												Pixel0:registerEventHandler( "transition_complete_keyframe", Pixel0Frame9 )
											end
										end
										
										if event.interrupted then
											Pixel0Frame8( Pixel0, event )
											return 
										else
											Pixel0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											Pixel0:setLeftRight( true, false, 224.25, 235.25 )
											Pixel0:setAlpha( 1 )
											Pixel0:registerEventHandler( "transition_complete_keyframe", Pixel0Frame8 )
										end
									end
									
									if event.interrupted then
										Pixel0Frame7( Pixel0, event )
										return 
									else
										Pixel0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
										Pixel0:registerEventHandler( "transition_complete_keyframe", Pixel0Frame7 )
									end
								end
								
								if event.interrupted then
									Pixel0Frame6( Pixel0, event )
									return 
								else
									Pixel0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									Pixel0:setAlpha( 0 )
									Pixel0:registerEventHandler( "transition_complete_keyframe", Pixel0Frame6 )
								end
							end
							
							if event.interrupted then
								Pixel0Frame5( Pixel0, event )
								return 
							else
								Pixel0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								Pixel0:registerEventHandler( "transition_complete_keyframe", Pixel0Frame5 )
							end
						end
						
						if event.interrupted then
							Pixel0Frame4( Pixel0, event )
							return 
						else
							Pixel0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Pixel0:setAlpha( 1 )
							Pixel0:registerEventHandler( "transition_complete_keyframe", Pixel0Frame4 )
						end
					end
					
					if event.interrupted then
						Pixel0Frame3( Pixel0, event )
						return 
					else
						Pixel0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						Pixel0:registerEventHandler( "transition_complete_keyframe", Pixel0Frame3 )
					end
				end
				
				Pixel0:completeAnimation()
				self.Pixel0:setLeftRight( true, false, 249.25, 334.25 )
				self.Pixel0:setTopBottom( true, false, 4.5, 6 )
				self.Pixel0:setAlpha( 0 )
				Pixel0Frame2( Pixel0, {} )
				local f69_local3 = function ( f96_arg0, f96_arg1 )
					local f96_local0 = function ( f97_arg0, f97_arg1 )
						local f97_local0 = function ( f98_arg0, f98_arg1 )
							local f98_local0 = function ( f99_arg0, f99_arg1 )
								local f99_local0 = function ( f100_arg0, f100_arg1 )
									local f100_local0 = function ( f101_arg0, f101_arg1 )
										local f101_local0 = function ( f102_arg0, f102_arg1 )
											local f102_local0 = function ( f103_arg0, f103_arg1 )
												local f103_local0 = function ( f104_arg0, f104_arg1 )
													if not f104_arg1.interrupted then
														f104_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
													end
													f104_arg0:setLeftRight( true, false, 224.25, 235.25 )
													f104_arg0:setTopBottom( true, false, 12.5, 14 )
													f104_arg0:setAlpha( 0 )
													if f104_arg1.interrupted then
														self.clipFinished( f104_arg0, f104_arg1 )
													else
														f104_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if f103_arg1.interrupted then
													f103_local0( f103_arg0, f103_arg1 )
													return 
												else
													f103_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													f103_arg0:registerEventHandler( "transition_complete_keyframe", f103_local0 )
												end
											end
											
											if f102_arg1.interrupted then
												f102_local0( f102_arg0, f102_arg1 )
												return 
											else
												f102_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												f102_arg0:setLeftRight( true, false, 224.25, 235.25 )
												f102_arg0:setAlpha( 1 )
												f102_arg0:registerEventHandler( "transition_complete_keyframe", f102_local0 )
											end
										end
										
										if f101_arg1.interrupted then
											f101_local0( f101_arg0, f101_arg1 )
											return 
										else
											f101_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											f101_arg0:setLeftRight( true, false, 249.25, 334.25 )
											f101_arg0:registerEventHandler( "transition_complete_keyframe", f101_local0 )
										end
									end
									
									if f100_arg1.interrupted then
										f100_local0( f100_arg0, f100_arg1 )
										return 
									else
										f100_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										f100_arg0:registerEventHandler( "transition_complete_keyframe", f100_local0 )
									end
								end
								
								if f99_arg1.interrupted then
									f99_local0( f99_arg0, f99_arg1 )
									return 
								else
									f99_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									f99_arg0:setLeftRight( true, false, 220.25, 334.25 )
									f99_arg0:registerEventHandler( "transition_complete_keyframe", f99_local0 )
								end
							end
							
							if f98_arg1.interrupted then
								f98_local0( f98_arg0, f98_arg1 )
								return 
							else
								f98_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								f98_arg0:setAlpha( 0 )
								f98_arg0:registerEventHandler( "transition_complete_keyframe", f98_local0 )
							end
						end
						
						if f97_arg1.interrupted then
							f97_local0( f97_arg0, f97_arg1 )
							return 
						else
							f97_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							f97_arg0:registerEventHandler( "transition_complete_keyframe", f97_local0 )
						end
					end
					
					if f96_arg1.interrupted then
						f96_local0( f96_arg0, f96_arg1 )
						return 
					else
						f96_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						f96_arg0:setAlpha( 1 )
						f96_arg0:registerEventHandler( "transition_complete_keyframe", f96_local0 )
					end
				end
				
				Pixel1:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
				Pixel1:setLeftRight( true, false, 249.25, 334.25 )
				Pixel1:setTopBottom( true, false, 12.5, 14 )
				Pixel1:setAlpha( 0 )
				Pixel1:registerEventHandler( "transition_complete_keyframe", f69_local3 )
			end
		},
		HeroWeapon = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				AttachmentInfo:completeAnimation()
				self.AttachmentInfo:setAlpha( 0 )
				self.clipFinished( AttachmentInfo, {} )

				AttachmentInfoFireRate:completeAnimation()
				self.AttachmentInfoFireRate:setAlpha( 0.5 )
				self.clipFinished( AttachmentInfoFireRate, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.AttachmentInfo:close()
		element.AttachmentInfoFireRate:close()
		element.Pixel0:close()
		element.Pixel1:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

