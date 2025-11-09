require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_TextAttachmentInfo" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_TextAttachmentInfoFire" )
require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidget_Pixel" )

local ClassSelected = function ( self, event )
	if self.currentWeapon ~= event.weaponDisplayName or self.currentAttachment1 ~= event.attachment1DisplayName or self.currentAttachment2 ~= event.attachment2DisplayName or self.currentAttachment3 ~= event.attachment3DisplayName or self.currentAttachment4 ~= event.attachment4DisplayName or self.currentAttachment5 ~= event.attachment5DisplayName or self.currentAttachment6 ~= event.attachment6DisplayName then
		self.AttachmentInfo:UpdateAttachments( event )
		self.currentWeapon = event.weaponDisplayName
		self.currentAttachment1 = event.attachment1DisplayName
		self.currentAttachment2 = event.attachment2DisplayName
		self.currentAttachment3 = event.attachment3DisplayName
		self.currentAttachment4 = event.attachment4DisplayName
		self.currentAttachment5 = event.attachment5DisplayName
		self.currentAttachment6 = event.attachment6DisplayName
	end
	local newState = "DefaultState"
	if event.attachment1DisplayName == nil then
		newState = "NoAttachments"
	end
	if self.currentState ~= newState then
		self:setState( newState )
	else
		self:playClip( "DefaultClip" )
	end
end

local PostLoadFunc = function ( self )
	self:registerEventHandler( "hud_update_weapon_select", ClassSelected )
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
	AttachmentInfo:setRGB( 1, 1, 1 )
	AttachmentInfo:setAlpha( 0 )
	self:addElement( AttachmentInfo )
	self.AttachmentInfo = AttachmentInfo
	
	local AttachmentInfoFireRate = CoD.AmmoWidget_TextAttachmentInfoFire.new( menu, controller )
	AttachmentInfoFireRate:setLeftRight( false, true, -296, 0 )
	AttachmentInfoFireRate:setTopBottom( false, true, -18, 0 )
	AttachmentInfoFireRate:setRGB( 1, 1, 1 )
	AttachmentInfoFireRate:setAlpha( 0.5 )
	self:addElement( AttachmentInfoFireRate )
	self.AttachmentInfoFireRate = AttachmentInfoFireRate
	
	local Pixel0 = CoD.DamageWidget_Pixel.new( menu, controller )
	Pixel0:setLeftRight( true, false, 224.25, 235.25 )
	Pixel0:setTopBottom( true, false, 4.5, 6 )
	Pixel0:setRGB( 1, 1, 1 )
	Pixel0:setAlpha( 0 )
	self:addElement( Pixel0 )
	self.Pixel0 = Pixel0
	
	local Pixel1 = CoD.DamageWidget_Pixel.new( menu, controller )
	Pixel1:setLeftRight( true, false, 224.25, 235.25 )
	Pixel1:setTopBottom( true, false, 12.5, 14 )
	Pixel1:setRGB( 1, 1, 1 )
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
				local Pixel0Frame2 = function ( Pixel0, event )
					local Pixel0Frame3 = function ( Pixel0, event )
						local Pixel0Frame4 = function ( Pixel0, event )
							local Pixel0Frame5 = function ( Pixel0, event )
								local Pixel0Frame6 = function ( Pixel0, event )
									local Pixel0Frame7 = function ( Pixel0, event )
										local Pixel0Frame8 = function ( Pixel0, event )
											if not event.interrupted then
												Pixel0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											end
											Pixel0:setLeftRight( true, false, 224.25, 252.25 )
											Pixel0:setTopBottom( true, false, 13.5, 11 )
											Pixel0:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( Pixel0, event )
											else
												Pixel0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											Pixel0Frame8( Pixel0, event )
											return 
										else
											Pixel0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											Pixel0:registerEventHandler( "transition_complete_keyframe", Pixel0Frame8 )
										end
									end
									
									if event.interrupted then
										Pixel0Frame7( Pixel0, event )
										return 
									else
										Pixel0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										Pixel0:setLeftRight( true, false, 224.25, 252.25 )
										Pixel0:setTopBottom( true, false, 13.5, 11 )
										Pixel0:setAlpha( 1 )
										Pixel0:registerEventHandler( "transition_complete_keyframe", Pixel0Frame7 )
									end
								end
								
								if event.interrupted then
									Pixel0Frame6( Pixel0, event )
									return 
								else
									Pixel0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
									Pixel0:registerEventHandler( "transition_complete_keyframe", Pixel0Frame6 )
								end
							end
							
							if event.interrupted then
								Pixel0Frame5( Pixel0, event )
								return 
							else
								Pixel0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								Pixel0:setAlpha( 0 )
								Pixel0:registerEventHandler( "transition_complete_keyframe", Pixel0Frame5 )
							end
						end
						
						if event.interrupted then
							Pixel0Frame4( Pixel0, event )
							return 
						else
							Pixel0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Pixel0:registerEventHandler( "transition_complete_keyframe", Pixel0Frame4 )
						end
					end
					
					if event.interrupted then
						Pixel0Frame3( Pixel0, event )
						return 
					else
						Pixel0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						Pixel0:setAlpha( 1 )
						Pixel0:registerEventHandler( "transition_complete_keyframe", Pixel0Frame3 )
					end
				end
				
				Pixel0:beginAnimation( "keyframe", 2099, false, false, CoD.TweenType.Linear )
				Pixel0:setLeftRight( true, false, 224.25, 295.25 )
				Pixel0:setTopBottom( true, false, 9.5, 11 )
				Pixel0:setAlpha( 0 )
				Pixel0:registerEventHandler( "transition_complete_keyframe", Pixel0Frame2 )
				local Pixel1Frame2 = function ( Pixel1, event )
					local Pixel1Frame3 = function ( Pixel1, event )
						local Pixel1Frame4 = function ( Pixel1, event )
							local Pixel1Frame5 = function ( Pixel1, event )
								local Pixel1Frame6 = function ( Pixel1, event )
									local Pixel1Frame7 = function ( Pixel1, event )
										local Pixel1Frame8 = function ( Pixel1, event )
											if not event.interrupted then
												Pixel1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											end
											Pixel1:setLeftRight( true, false, 224.25, 295.25 )
											Pixel1:setTopBottom( true, false, 4.5, 3 )
											Pixel1:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( Pixel1, event )
											else
												Pixel1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											Pixel1Frame8( Pixel1, event )
											return 
										else
											Pixel1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											Pixel1:registerEventHandler( "transition_complete_keyframe", Pixel1Frame8 )
										end
									end
									
									if event.interrupted then
										Pixel1Frame7( Pixel1, event )
										return 
									else
										Pixel1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										Pixel1:setLeftRight( true, false, 224.25, 295.25 )
										Pixel1:setTopBottom( true, false, 4.5, 3 )
										Pixel1:setAlpha( 1 )
										Pixel1:registerEventHandler( "transition_complete_keyframe", Pixel1Frame7 )
									end
								end
								
								if event.interrupted then
									Pixel1Frame6( Pixel1, event )
									return 
								else
									Pixel1:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
									Pixel1:registerEventHandler( "transition_complete_keyframe", Pixel1Frame6 )
								end
							end
							
							if event.interrupted then
								Pixel1Frame5( Pixel1, event )
								return 
							else
								Pixel1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								Pixel1:setAlpha( 0 )
								Pixel1:registerEventHandler( "transition_complete_keyframe", Pixel1Frame5 )
							end
						end
						
						if event.interrupted then
							Pixel1Frame4( Pixel1, event )
							return 
						else
							Pixel1:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							Pixel1:registerEventHandler( "transition_complete_keyframe", Pixel1Frame4 )
						end
					end
					
					if event.interrupted then
						Pixel1Frame3( Pixel1, event )
						return 
					else
						Pixel1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						Pixel1:setAlpha( 1 )
						Pixel1:registerEventHandler( "transition_complete_keyframe", Pixel1Frame3 )
					end
				end
				
				Pixel1:beginAnimation( "keyframe", 2009, false, false, CoD.TweenType.Linear )
				Pixel1:setLeftRight( true, false, 239.25, 250.25 )
				Pixel1:setTopBottom( true, false, 6.5, 3 )
				Pixel1:setAlpha( 0 )
				Pixel1:registerEventHandler( "transition_complete_keyframe", Pixel1Frame2 )
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
														AttachmentInfoFireRate:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
													end
													AttachmentInfoFireRate:setAlpha( 1 )
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
													AttachmentInfoFireRate:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													AttachmentInfoFireRate:registerEventHandler( "transition_complete_keyframe", AttachmentInfoFireRateFrame10 )
												end
											end
											
											if event.interrupted then
												AttachmentInfoFireRateFrame9( AttachmentInfoFireRate, event )
												return 
											else
												AttachmentInfoFireRate:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												AttachmentInfoFireRate:setAlpha( 0 )
												AttachmentInfoFireRate:registerEventHandler( "transition_complete_keyframe", AttachmentInfoFireRateFrame9 )
											end
										end
										
										if event.interrupted then
											AttachmentInfoFireRateFrame8( AttachmentInfoFireRate, event )
											return 
										else
											AttachmentInfoFireRate:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											AttachmentInfoFireRate:registerEventHandler( "transition_complete_keyframe", AttachmentInfoFireRateFrame8 )
										end
									end
									
									if event.interrupted then
										AttachmentInfoFireRateFrame7( AttachmentInfoFireRate, event )
										return 
									else
										AttachmentInfoFireRate:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										AttachmentInfoFireRate:setAlpha( 0.8 )
										AttachmentInfoFireRate:registerEventHandler( "transition_complete_keyframe", AttachmentInfoFireRateFrame7 )
									end
								end
								
								if event.interrupted then
									AttachmentInfoFireRateFrame6( AttachmentInfoFireRate, event )
									return 
								else
									AttachmentInfoFireRate:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									AttachmentInfoFireRate:registerEventHandler( "transition_complete_keyframe", AttachmentInfoFireRateFrame6 )
								end
							end
							
							if event.interrupted then
								AttachmentInfoFireRateFrame5( AttachmentInfoFireRate, event )
								return 
							else
								AttachmentInfoFireRate:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								AttachmentInfoFireRate:setAlpha( 0 )
								AttachmentInfoFireRate:registerEventHandler( "transition_complete_keyframe", AttachmentInfoFireRateFrame5 )
							end
						end
						
						if event.interrupted then
							AttachmentInfoFireRateFrame4( AttachmentInfoFireRate, event )
							return 
						else
							AttachmentInfoFireRate:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							AttachmentInfoFireRate:registerEventHandler( "transition_complete_keyframe", AttachmentInfoFireRateFrame4 )
						end
					end
					
					if event.interrupted then
						AttachmentInfoFireRateFrame3( AttachmentInfoFireRate, event )
						return 
					else
						AttachmentInfoFireRate:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						AttachmentInfoFireRate:setAlpha( 1 )
						AttachmentInfoFireRate:registerEventHandler( "transition_complete_keyframe", AttachmentInfoFireRateFrame3 )
					end
				end
				
				AttachmentInfoFireRate:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
				AttachmentInfoFireRate:setAlpha( 0 )
				AttachmentInfoFireRate:registerEventHandler( "transition_complete_keyframe", AttachmentInfoFireRateFrame2 )
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
														AttachmentInfo:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
													end
													AttachmentInfo:setAlpha( 1 )
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
													AttachmentInfo:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													AttachmentInfo:registerEventHandler( "transition_complete_keyframe", AttachmentInfoFrame10 )
												end
											end
											
											if event.interrupted then
												AttachmentInfoFrame9( AttachmentInfo, event )
												return 
											else
												AttachmentInfo:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												AttachmentInfo:setAlpha( 0 )
												AttachmentInfo:registerEventHandler( "transition_complete_keyframe", AttachmentInfoFrame9 )
											end
										end
										
										if event.interrupted then
											AttachmentInfoFrame8( AttachmentInfo, event )
											return 
										else
											AttachmentInfo:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											AttachmentInfo:registerEventHandler( "transition_complete_keyframe", AttachmentInfoFrame8 )
										end
									end
									
									if event.interrupted then
										AttachmentInfoFrame7( AttachmentInfo, event )
										return 
									else
										AttachmentInfo:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										AttachmentInfo:setAlpha( 0.8 )
										AttachmentInfo:registerEventHandler( "transition_complete_keyframe", AttachmentInfoFrame7 )
									end
								end
								
								if event.interrupted then
									AttachmentInfoFrame6( AttachmentInfo, event )
									return 
								else
									AttachmentInfo:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									AttachmentInfo:registerEventHandler( "transition_complete_keyframe", AttachmentInfoFrame6 )
								end
							end
							
							if event.interrupted then
								AttachmentInfoFrame5( AttachmentInfo, event )
								return 
							else
								AttachmentInfo:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								AttachmentInfo:setAlpha( 0 )
								AttachmentInfo:registerEventHandler( "transition_complete_keyframe", AttachmentInfoFrame5 )
							end
						end
						
						if event.interrupted then
							AttachmentInfoFrame4( AttachmentInfo, event )
							return 
						else
							AttachmentInfo:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							AttachmentInfo:registerEventHandler( "transition_complete_keyframe", AttachmentInfoFrame4 )
						end
					end
					
					if event.interrupted then
						AttachmentInfoFrame3( AttachmentInfo, event )
						return 
					else
						AttachmentInfo:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						AttachmentInfo:setAlpha( 1 )
						AttachmentInfo:registerEventHandler( "transition_complete_keyframe", AttachmentInfoFrame3 )
					end
				end
				
				AttachmentInfo:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
				AttachmentInfo:setAlpha( 0 )
				AttachmentInfo:registerEventHandler( "transition_complete_keyframe", AttachmentInfoFrame2 )
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
				local Pixel1Frame2 = function ( Pixel1, event )
					local Pixel1Frame3 = function ( Pixel1, event )
						local Pixel1Frame4 = function ( Pixel1, event )
							local Pixel1Frame5 = function ( Pixel1, event )
								local Pixel1Frame6 = function ( Pixel1, event )
									local Pixel1Frame7 = function ( Pixel1, event )
										local Pixel1Frame8 = function ( Pixel1, event )
											local Pixel1Frame9 = function ( Pixel1, event )
												local Pixel1Frame10 = function ( Pixel1, event )
													if not event.interrupted then
														Pixel1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
													end
													Pixel1:setLeftRight( true, false, 224.25, 235.25 )
													Pixel1:setTopBottom( true, false, 12.5, 14 )
													Pixel1:setAlpha( 0 )
													if event.interrupted then
														self.clipFinished( Pixel1, event )
													else
														Pixel1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													Pixel1Frame10( Pixel1, event )
													return 
												else
													Pixel1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													Pixel1:registerEventHandler( "transition_complete_keyframe", Pixel1Frame10 )
												end
											end
											
											if event.interrupted then
												Pixel1Frame9( Pixel1, event )
												return 
											else
												Pixel1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												Pixel1:setLeftRight( true, false, 224.25, 235.25 )
												Pixel1:setAlpha( 1 )
												Pixel1:registerEventHandler( "transition_complete_keyframe", Pixel1Frame9 )
											end
										end
										
										if event.interrupted then
											Pixel1Frame8( Pixel1, event )
											return 
										else
											Pixel1:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											Pixel1:setLeftRight( true, false, 249.25, 334.25 )
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
								Pixel1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								Pixel1:setAlpha( 0 )
								Pixel1:registerEventHandler( "transition_complete_keyframe", Pixel1Frame5 )
							end
						end
						
						if event.interrupted then
							Pixel1Frame4( Pixel1, event )
							return 
						else
							Pixel1:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							Pixel1:registerEventHandler( "transition_complete_keyframe", Pixel1Frame4 )
						end
					end
					
					if event.interrupted then
						Pixel1Frame3( Pixel1, event )
						return 
					else
						Pixel1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						Pixel1:setAlpha( 1 )
						Pixel1:registerEventHandler( "transition_complete_keyframe", Pixel1Frame3 )
					end
				end
				
				Pixel1:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
				Pixel1:setLeftRight( true, false, 249.25, 334.25 )
				Pixel1:setTopBottom( true, false, 12.5, 14 )
				Pixel1:setAlpha( 0 )
				Pixel1:registerEventHandler( "transition_complete_keyframe", Pixel1Frame2 )
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
	self.close = function ( self )
		self.AttachmentInfo:close()
		self.AttachmentInfoFireRate:close()
		self.Pixel0:close()
		self.Pixel1:close()
		CoD.AmmoWidget_AttachmentInfo.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

