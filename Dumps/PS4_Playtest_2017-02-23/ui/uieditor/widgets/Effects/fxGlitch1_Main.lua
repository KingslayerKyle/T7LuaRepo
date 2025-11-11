require( "ui.uieditor.widgets.Effects.fxGlitch1_1" )
require( "ui.uieditor.widgets.Effects.fxGlitch1_2" )
require( "ui.uieditor.widgets.Effects.fxGlitch1_3" )
require( "ui.uieditor.widgets.Effects.fxGlitch1_4" )
require( "ui.uieditor.widgets.Effects.fxGlitch1_5" )
require( "ui.uieditor.widgets.Effects.fxGlitch1_6" )
require( "ui.uieditor.widgets.Effects.fxGlitch1_7" )
require( "ui.uieditor.widgets.Effects.fxGlitch1_8" )
require( "ui.uieditor.widgets.Effects.fxGlitch1_9" )

CoD.fxGlitch1_Main = InheritFrom( LUI.UIElement )
CoD.fxGlitch1_Main.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.fxGlitch1_Main )
	self.id = "fxGlitch1_Main"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( 0, 0, 0, 708 )
	self:setTopBottom( 0, 0, 0, 384 )
	
	local fxGlitch1900 = CoD.fxGlitch1_9.new( menu, controller )
	fxGlitch1900:setLeftRight( 0, 1, 177, -177 )
	fxGlitch1900:setTopBottom( 0, 1, 123, -225 )
	fxGlitch1900:setAlpha( 0 )
	self:addElement( fxGlitch1900 )
	self.fxGlitch1900 = fxGlitch1900
	
	local fxGlitch1800 = CoD.fxGlitch1_8.new( menu, controller )
	fxGlitch1800:setLeftRight( 0, 1, 0, 0 )
	fxGlitch1800:setTopBottom( 0, 1, 142, -190 )
	fxGlitch1800:setAlpha( 0.8 )
	self:addElement( fxGlitch1800 )
	self.fxGlitch1800 = fxGlitch1800
	
	local fxGlitch1700 = CoD.fxGlitch1_7.new( menu, controller )
	fxGlitch1700:setLeftRight( 0, 1, 0, 0 )
	fxGlitch1700:setTopBottom( 0, 1, 169, -163 )
	fxGlitch1700:setAlpha( 0 )
	self:addElement( fxGlitch1700 )
	self.fxGlitch1700 = fxGlitch1700
	
	local fxGlitch1600 = CoD.fxGlitch1_6.new( menu, controller )
	fxGlitch1600:setLeftRight( 0, 1, 0, 0 )
	fxGlitch1600:setTopBottom( 0, 1, 82, -110 )
	fxGlitch1600:setAlpha( 0.28 )
	self:addElement( fxGlitch1600 )
	self.fxGlitch1600 = fxGlitch1600
	
	local fxGlitch1500 = CoD.fxGlitch1_5.new( menu, controller )
	fxGlitch1500:setLeftRight( 0, 1, 208, -236 )
	fxGlitch1500:setTopBottom( 0, 1, 82, -124 )
	fxGlitch1500:setAlpha( 0 )
	self:addElement( fxGlitch1500 )
	self.fxGlitch1500 = fxGlitch1500
	
	local fxGlitch1400 = CoD.fxGlitch1_4.new( menu, controller )
	fxGlitch1400:setLeftRight( 0, 1, 0, 0 )
	fxGlitch1400:setTopBottom( 0, 1, 82, -74 )
	fxGlitch1400:setAlpha( 0 )
	self:addElement( fxGlitch1400 )
	self.fxGlitch1400 = fxGlitch1400
	
	local fxGlitch1300 = CoD.fxGlitch1_3.new( menu, controller )
	fxGlitch1300:setLeftRight( 0, 1, 6, -6 )
	fxGlitch1300:setTopBottom( 0, 1, 0, 0 )
	fxGlitch1300:setAlpha( 0 )
	self:addElement( fxGlitch1300 )
	self.fxGlitch1300 = fxGlitch1300
	
	local fxGlitch1200 = CoD.fxGlitch1_2.new( menu, controller )
	fxGlitch1200:setLeftRight( 0, 1, 0, 0 )
	fxGlitch1200:setTopBottom( 0, 1, 46, -14 )
	fxGlitch1200:setAlpha( 0 )
	self:addElement( fxGlitch1200 )
	self.fxGlitch1200 = fxGlitch1200
	
	local fxGlitch1100 = CoD.fxGlitch1_1.new( menu, controller )
	fxGlitch1100:setLeftRight( 0, 1, 0, 0 )
	fxGlitch1100:setTopBottom( 0, 1, 69, -51 )
	fxGlitch1100:setAlpha( 0 )
	self:addElement( fxGlitch1100 )
	self.fxGlitch1100 = fxGlitch1100
	
	self.resetProperties = function ()
		fxGlitch1600:completeAnimation()
		fxGlitch1700:completeAnimation()
		fxGlitch1800:completeAnimation()
		fxGlitch1900:completeAnimation()
		fxGlitch1400:completeAnimation()
		fxGlitch1500:completeAnimation()
		fxGlitch1300:completeAnimation()
		fxGlitch1100:completeAnimation()
		fxGlitch1200:completeAnimation()
		fxGlitch1600:setAlpha( 0.28 )
		fxGlitch1700:setLeftRight( 0, 1, 0, 0 )
		fxGlitch1700:setTopBottom( 0, 1, 169, -163 )
		fxGlitch1700:setAlpha( 0 )
		fxGlitch1800:setLeftRight( 0, 1, 0, 0 )
		fxGlitch1800:setTopBottom( 0, 1, 142, -190 )
		fxGlitch1800:setAlpha( 0.8 )
		fxGlitch1900:setLeftRight( 0, 1, 177, -177 )
		fxGlitch1900:setTopBottom( 0, 1, 123, -225 )
		fxGlitch1900:setAlpha( 0 )
		fxGlitch1400:setAlpha( 0 )
		fxGlitch1500:setLeftRight( 0, 1, 208, -236 )
		fxGlitch1500:setTopBottom( 0, 1, 82, -124 )
		fxGlitch1500:setAlpha( 0 )
		fxGlitch1300:setAlpha( 0 )
		fxGlitch1100:setAlpha( 0 )
		fxGlitch1200:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				fxGlitch1800:completeAnimation()
				self.fxGlitch1800:setLeftRight( 0, 1, 0, 0 )
				self.fxGlitch1800:setTopBottom( 0, 1, 150, -150 )
				self.fxGlitch1800:setAlpha( 0 )
				self.clipFinished( fxGlitch1800, {} )
				fxGlitch1700:completeAnimation()
				self.fxGlitch1700:setLeftRight( 0, 1, 0, 0 )
				self.fxGlitch1700:setTopBottom( 0, 1, 123, -165 )
				self.clipFinished( fxGlitch1700, {} )
				fxGlitch1600:completeAnimation()
				self.fxGlitch1600:setAlpha( 0 )
				self.clipFinished( fxGlitch1600, {} )
			end,
			GlitchSmall1 = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				local fxGlitch1900Frame2 = function ( fxGlitch1900, event )
					local fxGlitch1900Frame3 = function ( fxGlitch1900, event )
						local fxGlitch1900Frame4 = function ( fxGlitch1900, event )
							local fxGlitch1900Frame5 = function ( fxGlitch1900, event )
								local fxGlitch1900Frame6 = function ( fxGlitch1900, event )
									local fxGlitch1900Frame7 = function ( fxGlitch1900, event )
										local fxGlitch1900Frame8 = function ( fxGlitch1900, event )
											local fxGlitch1900Frame9 = function ( fxGlitch1900, event )
												if not event.interrupted then
													fxGlitch1900:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												end
												fxGlitch1900:setLeftRight( 0, 1, 177, -177 )
												fxGlitch1900:setTopBottom( 0, 1, 228, -120 )
												fxGlitch1900:setAlpha( 0 )
												if event.interrupted then
													self.clipFinished( fxGlitch1900, event )
												else
													fxGlitch1900:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												fxGlitch1900Frame9( fxGlitch1900, event )
												return 
											else
												fxGlitch1900:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												fxGlitch1900:registerEventHandler( "transition_complete_keyframe", fxGlitch1900Frame9 )
											end
										end
										
										if event.interrupted then
											fxGlitch1900Frame8( fxGlitch1900, event )
											return 
										else
											fxGlitch1900:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											fxGlitch1900:setTopBottom( 0, 1, 228, -120 )
											fxGlitch1900:setAlpha( 0.5 )
											fxGlitch1900:registerEventHandler( "transition_complete_keyframe", fxGlitch1900Frame8 )
										end
									end
									
									if event.interrupted then
										fxGlitch1900Frame7( fxGlitch1900, event )
										return 
									else
										fxGlitch1900:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										fxGlitch1900:setTopBottom( 0, 1, 210.5, -137.5 )
										fxGlitch1900:registerEventHandler( "transition_complete_keyframe", fxGlitch1900Frame7 )
									end
								end
								
								if event.interrupted then
									fxGlitch1900Frame6( fxGlitch1900, event )
									return 
								else
									fxGlitch1900:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									fxGlitch1900:setTopBottom( 0, 1, 140.5, -207.5 )
									fxGlitch1900:setAlpha( 0 )
									fxGlitch1900:registerEventHandler( "transition_complete_keyframe", fxGlitch1900Frame6 )
								end
							end
							
							if event.interrupted then
								fxGlitch1900Frame5( fxGlitch1900, event )
								return 
							else
								fxGlitch1900:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								fxGlitch1900:registerEventHandler( "transition_complete_keyframe", fxGlitch1900Frame5 )
							end
						end
						
						if event.interrupted then
							fxGlitch1900Frame4( fxGlitch1900, event )
							return 
						else
							fxGlitch1900:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							fxGlitch1900:setAlpha( 1 )
							fxGlitch1900:registerEventHandler( "transition_complete_keyframe", fxGlitch1900Frame4 )
						end
					end
					
					if event.interrupted then
						fxGlitch1900Frame3( fxGlitch1900, event )
						return 
					else
						fxGlitch1900:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						fxGlitch1900:registerEventHandler( "transition_complete_keyframe", fxGlitch1900Frame3 )
					end
				end
				
				fxGlitch1900:completeAnimation()
				self.fxGlitch1900:setLeftRight( 0, 1, 177, -177 )
				self.fxGlitch1900:setTopBottom( 0, 1, 123, -225 )
				self.fxGlitch1900:setAlpha( 0 )
				fxGlitch1900Frame2( fxGlitch1900, {} )
				local fxGlitch1800Frame2 = function ( fxGlitch1800, event )
					local fxGlitch1800Frame3 = function ( fxGlitch1800, event )
						local fxGlitch1800Frame4 = function ( fxGlitch1800, event )
							local fxGlitch1800Frame5 = function ( fxGlitch1800, event )
								local fxGlitch1800Frame6 = function ( fxGlitch1800, event )
									local fxGlitch1800Frame7 = function ( fxGlitch1800, event )
										local fxGlitch1800Frame8 = function ( fxGlitch1800, event )
											if not event.interrupted then
												fxGlitch1800:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											end
											fxGlitch1800:setLeftRight( 0, 1, 0, 0 )
											fxGlitch1800:setTopBottom( 0, 1, 150, -182 )
											fxGlitch1800:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( fxGlitch1800, event )
											else
												fxGlitch1800:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											fxGlitch1800Frame8( fxGlitch1800, event )
											return 
										else
											fxGlitch1800:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											fxGlitch1800:setAlpha( 1 )
											fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame8 )
										end
									end
									
									if event.interrupted then
										fxGlitch1800Frame7( fxGlitch1800, event )
										return 
									else
										fxGlitch1800:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame7 )
									end
								end
								
								if event.interrupted then
									fxGlitch1800Frame6( fxGlitch1800, event )
									return 
								else
									fxGlitch1800:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									fxGlitch1800:setAlpha( 0 )
									fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame6 )
								end
							end
							
							if event.interrupted then
								fxGlitch1800Frame5( fxGlitch1800, event )
								return 
							else
								fxGlitch1800:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame5 )
							end
						end
						
						if event.interrupted then
							fxGlitch1800Frame4( fxGlitch1800, event )
							return 
						else
							fxGlitch1800:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							fxGlitch1800:setAlpha( 1 )
							fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame4 )
						end
					end
					
					if event.interrupted then
						fxGlitch1800Frame3( fxGlitch1800, event )
						return 
					else
						fxGlitch1800:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
						fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame3 )
					end
				end
				
				fxGlitch1800:completeAnimation()
				self.fxGlitch1800:setLeftRight( 0, 1, 0, 0 )
				self.fxGlitch1800:setTopBottom( 0, 1, 150, -182 )
				self.fxGlitch1800:setAlpha( 0 )
				fxGlitch1800Frame2( fxGlitch1800, {} )
				local fxGlitch1700Frame2 = function ( fxGlitch1700, event )
					local fxGlitch1700Frame3 = function ( fxGlitch1700, event )
						local fxGlitch1700Frame4 = function ( fxGlitch1700, event )
							local fxGlitch1700Frame5 = function ( fxGlitch1700, event )
								local fxGlitch1700Frame6 = function ( fxGlitch1700, event )
									local fxGlitch1700Frame7 = function ( fxGlitch1700, event )
										if not event.interrupted then
											fxGlitch1700:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										end
										fxGlitch1700:setLeftRight( 0, 1, 0, 0 )
										fxGlitch1700:setTopBottom( 0, 1, 146, -206 )
										fxGlitch1700:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( fxGlitch1700, event )
										else
											fxGlitch1700:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										fxGlitch1700Frame7( fxGlitch1700, event )
										return 
									else
										fxGlitch1700:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										fxGlitch1700:setTopBottom( 0, 1, 146, -206 )
										fxGlitch1700:registerEventHandler( "transition_complete_keyframe", fxGlitch1700Frame7 )
									end
								end
								
								if event.interrupted then
									fxGlitch1700Frame6( fxGlitch1700, event )
									return 
								else
									fxGlitch1700:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									fxGlitch1700:setTopBottom( 0, 1, 153.67, -191.67 )
									fxGlitch1700:setAlpha( 1 )
									fxGlitch1700:registerEventHandler( "transition_complete_keyframe", fxGlitch1700Frame6 )
								end
							end
							
							if event.interrupted then
								fxGlitch1700Frame5( fxGlitch1700, event )
								return 
							else
								fxGlitch1700:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								fxGlitch1700:setTopBottom( 0, 1, 161.33, -177.33 )
								fxGlitch1700:setAlpha( 0 )
								fxGlitch1700:registerEventHandler( "transition_complete_keyframe", fxGlitch1700Frame5 )
							end
						end
						
						if event.interrupted then
							fxGlitch1700Frame4( fxGlitch1700, event )
							return 
						else
							fxGlitch1700:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							fxGlitch1700:setAlpha( 0.34 )
							fxGlitch1700:registerEventHandler( "transition_complete_keyframe", fxGlitch1700Frame4 )
						end
					end
					
					if event.interrupted then
						fxGlitch1700Frame3( fxGlitch1700, event )
						return 
					else
						fxGlitch1700:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
						fxGlitch1700:registerEventHandler( "transition_complete_keyframe", fxGlitch1700Frame3 )
					end
				end
				
				fxGlitch1700:completeAnimation()
				self.fxGlitch1700:setLeftRight( 0, 1, 0, 0 )
				self.fxGlitch1700:setTopBottom( 0, 1, 169, -163 )
				self.fxGlitch1700:setAlpha( 0 )
				fxGlitch1700Frame2( fxGlitch1700, {} )
			end,
			GlitchSmall2 = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				local fxGlitch1900Frame2 = function ( fxGlitch1900, event )
					local fxGlitch1900Frame3 = function ( fxGlitch1900, event )
						local fxGlitch1900Frame4 = function ( fxGlitch1900, event )
							if not event.interrupted then
								fxGlitch1900:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							end
							fxGlitch1900:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( fxGlitch1900, event )
							else
								fxGlitch1900:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							fxGlitch1900Frame4( fxGlitch1900, event )
							return 
						else
							fxGlitch1900:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							fxGlitch1900:registerEventHandler( "transition_complete_keyframe", fxGlitch1900Frame4 )
						end
					end
					
					if event.interrupted then
						fxGlitch1900Frame3( fxGlitch1900, event )
						return 
					else
						fxGlitch1900:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						fxGlitch1900:setAlpha( 1 )
						fxGlitch1900:registerEventHandler( "transition_complete_keyframe", fxGlitch1900Frame3 )
					end
				end
				
				fxGlitch1900:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
				fxGlitch1900:setAlpha( 0 )
				fxGlitch1900:registerEventHandler( "transition_complete_keyframe", fxGlitch1900Frame2 )
				local fxGlitch1800Frame2 = function ( fxGlitch1800, event )
					local fxGlitch1800Frame3 = function ( fxGlitch1800, event )
						local fxGlitch1800Frame4 = function ( fxGlitch1800, event )
							local fxGlitch1800Frame5 = function ( fxGlitch1800, event )
								local fxGlitch1800Frame6 = function ( fxGlitch1800, event )
									local fxGlitch1800Frame7 = function ( fxGlitch1800, event )
										local fxGlitch1800Frame8 = function ( fxGlitch1800, event )
											local fxGlitch1800Frame9 = function ( fxGlitch1800, event )
												local fxGlitch1800Frame10 = function ( fxGlitch1800, event )
													local fxGlitch1800Frame11 = function ( fxGlitch1800, event )
														if not event.interrupted then
															fxGlitch1800:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
														end
														fxGlitch1800:setLeftRight( 0, 1, 0, 0 )
														fxGlitch1800:setTopBottom( 0, 1, 145, -187 )
														fxGlitch1800:setAlpha( 0 )
														if event.interrupted then
															self.clipFinished( fxGlitch1800, event )
														else
															fxGlitch1800:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														fxGlitch1800Frame11( fxGlitch1800, event )
														return 
													else
														fxGlitch1800:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														fxGlitch1800:setAlpha( 0.72 )
														fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame11 )
													end
												end
												
												if event.interrupted then
													fxGlitch1800Frame10( fxGlitch1800, event )
													return 
												else
													fxGlitch1800:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													fxGlitch1800:setTopBottom( 0, 1, 145, -187 )
													fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame10 )
												end
											end
											
											if event.interrupted then
												fxGlitch1800Frame9( fxGlitch1800, event )
												return 
											else
												fxGlitch1800:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												fxGlitch1800:setTopBottom( 0, 1, 169.67, -162.33 )
												fxGlitch1800:setAlpha( 0 )
												fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame9 )
											end
										end
										
										if event.interrupted then
											fxGlitch1800Frame8( fxGlitch1800, event )
											return 
										else
											fxGlitch1800:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											fxGlitch1800:setTopBottom( 0, 1, 182, -150 )
											fxGlitch1800:setAlpha( 1 )
											fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame8 )
										end
									end
									
									if event.interrupted then
										fxGlitch1800Frame7( fxGlitch1800, event )
										return 
									else
										fxGlitch1800:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
										fxGlitch1800:setTopBottom( 0, 1, 174, -158 )
										fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame7 )
									end
								end
								
								if event.interrupted then
									fxGlitch1800Frame6( fxGlitch1800, event )
									return 
								else
									fxGlitch1800:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									fxGlitch1800:setTopBottom( 0, 1, 150, -182 )
									fxGlitch1800:setAlpha( 0 )
									fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame6 )
								end
							end
							
							if event.interrupted then
								fxGlitch1800Frame5( fxGlitch1800, event )
								return 
							else
								fxGlitch1800:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame5 )
							end
						end
						
						if event.interrupted then
							fxGlitch1800Frame4( fxGlitch1800, event )
							return 
						else
							fxGlitch1800:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							fxGlitch1800:setAlpha( 0.8 )
							fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame4 )
						end
					end
					
					if event.interrupted then
						fxGlitch1800Frame3( fxGlitch1800, event )
						return 
					else
						fxGlitch1800:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame3 )
					end
				end
				
				fxGlitch1800:completeAnimation()
				self.fxGlitch1800:setLeftRight( 0, 1, 0, 0 )
				self.fxGlitch1800:setTopBottom( 0, 1, 142, -190 )
				self.fxGlitch1800:setAlpha( 0 )
				fxGlitch1800Frame2( fxGlitch1800, {} )
				local fxGlitch1700Frame2 = function ( fxGlitch1700, event )
					local fxGlitch1700Frame3 = function ( fxGlitch1700, event )
						local fxGlitch1700Frame4 = function ( fxGlitch1700, event )
							if not event.interrupted then
								fxGlitch1700:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							end
							fxGlitch1700:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( fxGlitch1700, event )
							else
								fxGlitch1700:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							fxGlitch1700Frame4( fxGlitch1700, event )
							return 
						else
							fxGlitch1700:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							fxGlitch1700:setAlpha( 0.16 )
							fxGlitch1700:registerEventHandler( "transition_complete_keyframe", fxGlitch1700Frame4 )
						end
					end
					
					if event.interrupted then
						fxGlitch1700Frame3( fxGlitch1700, event )
						return 
					else
						fxGlitch1700:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						fxGlitch1700:setAlpha( 0.19 )
						fxGlitch1700:registerEventHandler( "transition_complete_keyframe", fxGlitch1700Frame3 )
					end
				end
				
				fxGlitch1700:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
				fxGlitch1700:setAlpha( 0 )
				fxGlitch1700:registerEventHandler( "transition_complete_keyframe", fxGlitch1700Frame2 )
				local fxGlitch1600Frame2 = function ( fxGlitch1600, event )
					local fxGlitch1600Frame3 = function ( fxGlitch1600, event )
						if not event.interrupted then
							fxGlitch1600:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						end
						fxGlitch1600:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( fxGlitch1600, event )
						else
							fxGlitch1600:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						fxGlitch1600Frame3( fxGlitch1600, event )
						return 
					else
						fxGlitch1600:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						fxGlitch1600:setAlpha( 0.28 )
						fxGlitch1600:registerEventHandler( "transition_complete_keyframe", fxGlitch1600Frame3 )
					end
				end
				
				fxGlitch1600:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
				fxGlitch1600:setAlpha( 0 )
				fxGlitch1600:registerEventHandler( "transition_complete_keyframe", fxGlitch1600Frame2 )
				local fxGlitch1400Frame2 = function ( fxGlitch1400, event )
					local fxGlitch1400Frame3 = function ( fxGlitch1400, event )
						if not event.interrupted then
							fxGlitch1400:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						end
						fxGlitch1400:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( fxGlitch1400, event )
						else
							fxGlitch1400:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						fxGlitch1400Frame3( fxGlitch1400, event )
						return 
					else
						fxGlitch1400:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						fxGlitch1400:setAlpha( 0.33 )
						fxGlitch1400:registerEventHandler( "transition_complete_keyframe", fxGlitch1400Frame3 )
					end
				end
				
				fxGlitch1400:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
				fxGlitch1400:setAlpha( 0 )
				fxGlitch1400:registerEventHandler( "transition_complete_keyframe", fxGlitch1400Frame2 )
			end,
			GlitchSmall3 = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				local fxGlitch1900Frame2 = function ( fxGlitch1900, event )
					local fxGlitch1900Frame3 = function ( fxGlitch1900, event )
						local fxGlitch1900Frame4 = function ( fxGlitch1900, event )
							local fxGlitch1900Frame5 = function ( fxGlitch1900, event )
								local fxGlitch1900Frame6 = function ( fxGlitch1900, event )
									local fxGlitch1900Frame7 = function ( fxGlitch1900, event )
										local fxGlitch1900Frame8 = function ( fxGlitch1900, event )
											local fxGlitch1900Frame9 = function ( fxGlitch1900, event )
												local fxGlitch1900Frame10 = function ( fxGlitch1900, event )
													local fxGlitch1900Frame11 = function ( fxGlitch1900, event )
														local fxGlitch1900Frame12 = function ( fxGlitch1900, event )
															if not event.interrupted then
																fxGlitch1900:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
															end
															fxGlitch1900:setLeftRight( 0, 1, 177, -177 )
															fxGlitch1900:setTopBottom( 0, 1, 171, -177 )
															fxGlitch1900:setAlpha( 0 )
															if event.interrupted then
																self.clipFinished( fxGlitch1900, event )
															else
																fxGlitch1900:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															fxGlitch1900Frame12( fxGlitch1900, event )
															return 
														else
															fxGlitch1900:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
															fxGlitch1900:setAlpha( 0.55 )
															fxGlitch1900:registerEventHandler( "transition_complete_keyframe", fxGlitch1900Frame12 )
														end
													end
													
													if event.interrupted then
														fxGlitch1900Frame11( fxGlitch1900, event )
														return 
													else
														fxGlitch1900:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														fxGlitch1900:setTopBottom( 0, 1, 171, -177 )
														fxGlitch1900:registerEventHandler( "transition_complete_keyframe", fxGlitch1900Frame11 )
													end
												end
												
												if event.interrupted then
													fxGlitch1900Frame10( fxGlitch1900, event )
													return 
												else
													fxGlitch1900:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													fxGlitch1900:registerEventHandler( "transition_complete_keyframe", fxGlitch1900Frame10 )
												end
											end
											
											if event.interrupted then
												fxGlitch1900Frame9( fxGlitch1900, event )
												return 
											else
												fxGlitch1900:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												fxGlitch1900:setAlpha( 0 )
												fxGlitch1900:registerEventHandler( "transition_complete_keyframe", fxGlitch1900Frame9 )
											end
										end
										
										if event.interrupted then
											fxGlitch1900Frame8( fxGlitch1900, event )
											return 
										else
											fxGlitch1900:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											fxGlitch1900:registerEventHandler( "transition_complete_keyframe", fxGlitch1900Frame8 )
										end
									end
									
									if event.interrupted then
										fxGlitch1900Frame7( fxGlitch1900, event )
										return 
									else
										fxGlitch1900:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										fxGlitch1900:setTopBottom( 0, 1, 220, -128 )
										fxGlitch1900:setAlpha( 1 )
										fxGlitch1900:registerEventHandler( "transition_complete_keyframe", fxGlitch1900Frame7 )
									end
								end
								
								if event.interrupted then
									fxGlitch1900Frame6( fxGlitch1900, event )
									return 
								else
									fxGlitch1900:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
									fxGlitch1900:setTopBottom( 0, 1, 206.14, -141.86 )
									fxGlitch1900:registerEventHandler( "transition_complete_keyframe", fxGlitch1900Frame6 )
								end
							end
							
							if event.interrupted then
								fxGlitch1900Frame5( fxGlitch1900, event )
								return 
							else
								fxGlitch1900:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								fxGlitch1900:setTopBottom( 0, 1, 136.86, -211.14 )
								fxGlitch1900:setAlpha( 0 )
								fxGlitch1900:registerEventHandler( "transition_complete_keyframe", fxGlitch1900Frame5 )
							end
						end
						
						if event.interrupted then
							fxGlitch1900Frame4( fxGlitch1900, event )
							return 
						else
							fxGlitch1900:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							fxGlitch1900:registerEventHandler( "transition_complete_keyframe", fxGlitch1900Frame4 )
						end
					end
					
					if event.interrupted then
						fxGlitch1900Frame3( fxGlitch1900, event )
						return 
					else
						fxGlitch1900:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						fxGlitch1900:setAlpha( 0.69 )
						fxGlitch1900:registerEventHandler( "transition_complete_keyframe", fxGlitch1900Frame3 )
					end
				end
				
				fxGlitch1900:completeAnimation()
				self.fxGlitch1900:setLeftRight( 0, 1, 177, -177 )
				self.fxGlitch1900:setTopBottom( 0, 1, 123, -225 )
				self.fxGlitch1900:setAlpha( 0 )
				fxGlitch1900Frame2( fxGlitch1900, {} )
				local fxGlitch1800Frame2 = function ( fxGlitch1800, event )
					local fxGlitch1800Frame3 = function ( fxGlitch1800, event )
						local fxGlitch1800Frame4 = function ( fxGlitch1800, event )
							local fxGlitch1800Frame5 = function ( fxGlitch1800, event )
								local fxGlitch1800Frame6 = function ( fxGlitch1800, event )
									local fxGlitch1800Frame7 = function ( fxGlitch1800, event )
										local fxGlitch1800Frame8 = function ( fxGlitch1800, event )
											local fxGlitch1800Frame9 = function ( fxGlitch1800, event )
												if not event.interrupted then
													fxGlitch1800:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
												end
												fxGlitch1800:setLeftRight( 0, 1, 0, 0 )
												fxGlitch1800:setTopBottom( 0, 1, 127, -205 )
												fxGlitch1800:setAlpha( 0 )
												if event.interrupted then
													self.clipFinished( fxGlitch1800, event )
												else
													fxGlitch1800:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												fxGlitch1800Frame9( fxGlitch1800, event )
												return 
											else
												fxGlitch1800:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												fxGlitch1800:setAlpha( 0.55 )
												fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame9 )
											end
										end
										
										if event.interrupted then
											fxGlitch1800Frame8( fxGlitch1800, event )
											return 
										else
											fxGlitch1800:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											fxGlitch1800:setTopBottom( 0, 1, 127, -205 )
											fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame8 )
										end
									end
									
									if event.interrupted then
										fxGlitch1800Frame7( fxGlitch1800, event )
										return 
									else
										fxGlitch1800:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame7 )
									end
								end
								
								if event.interrupted then
									fxGlitch1800Frame6( fxGlitch1800, event )
									return 
								else
									fxGlitch1800:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									fxGlitch1800:setAlpha( 0 )
									fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame6 )
								end
							end
							
							if event.interrupted then
								fxGlitch1800Frame5( fxGlitch1800, event )
								return 
							else
								fxGlitch1800:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								fxGlitch1800:setAlpha( 0.69 )
								fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame5 )
							end
						end
						
						if event.interrupted then
							fxGlitch1800Frame4( fxGlitch1800, event )
							return 
						else
							fxGlitch1800:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							fxGlitch1800:setAlpha( 0.31 )
							fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame4 )
						end
					end
					
					if event.interrupted then
						fxGlitch1800Frame3( fxGlitch1800, event )
						return 
					else
						fxGlitch1800:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame3 )
					end
				end
				
				fxGlitch1800:completeAnimation()
				self.fxGlitch1800:setLeftRight( 0, 1, 0, 0 )
				self.fxGlitch1800:setTopBottom( 0, 1, 145, -187 )
				self.fxGlitch1800:setAlpha( 0 )
				fxGlitch1800Frame2( fxGlitch1800, {} )
				local fxGlitch1700Frame2 = function ( fxGlitch1700, event )
					local fxGlitch1700Frame3 = function ( fxGlitch1700, event )
						local fxGlitch1700Frame4 = function ( fxGlitch1700, event )
							local fxGlitch1700Frame5 = function ( fxGlitch1700, event )
								if not event.interrupted then
									fxGlitch1700:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								end
								fxGlitch1700:setLeftRight( 0, 1, 0, 0 )
								fxGlitch1700:setTopBottom( 0, 1, 157, -175 )
								fxGlitch1700:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( fxGlitch1700, event )
								else
									fxGlitch1700:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								fxGlitch1700Frame5( fxGlitch1700, event )
								return 
							else
								fxGlitch1700:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								fxGlitch1700:setAlpha( 0.51 )
								fxGlitch1700:registerEventHandler( "transition_complete_keyframe", fxGlitch1700Frame5 )
							end
						end
						
						if event.interrupted then
							fxGlitch1700Frame4( fxGlitch1700, event )
							return 
						else
							fxGlitch1700:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							fxGlitch1700:setAlpha( 1 )
							fxGlitch1700:registerEventHandler( "transition_complete_keyframe", fxGlitch1700Frame4 )
						end
					end
					
					if event.interrupted then
						fxGlitch1700Frame3( fxGlitch1700, event )
						return 
					else
						fxGlitch1700:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						fxGlitch1700:registerEventHandler( "transition_complete_keyframe", fxGlitch1700Frame3 )
					end
				end
				
				fxGlitch1700:completeAnimation()
				self.fxGlitch1700:setLeftRight( 0, 1, 0, 0 )
				self.fxGlitch1700:setTopBottom( 0, 1, 157, -175 )
				self.fxGlitch1700:setAlpha( 0 )
				fxGlitch1700Frame2( fxGlitch1700, {} )
				local fxGlitch1500Frame2 = function ( fxGlitch1500, event )
					local fxGlitch1500Frame3 = function ( fxGlitch1500, event )
						local fxGlitch1500Frame4 = function ( fxGlitch1500, event )
							local fxGlitch1500Frame5 = function ( fxGlitch1500, event )
								if not event.interrupted then
									fxGlitch1500:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								end
								fxGlitch1500:setLeftRight( 0, 1, 192, -184 )
								fxGlitch1500:setTopBottom( 0, 1, 102, -144 )
								fxGlitch1500:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( fxGlitch1500, event )
								else
									fxGlitch1500:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								fxGlitch1500Frame5( fxGlitch1500, event )
								return 
							else
								fxGlitch1500:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								fxGlitch1500:setLeftRight( 0, 1, 192, -184 )
								fxGlitch1500:setTopBottom( 0, 1, 102, -144 )
								fxGlitch1500:setAlpha( 0.8 )
								fxGlitch1500:registerEventHandler( "transition_complete_keyframe", fxGlitch1500Frame5 )
							end
						end
						
						if event.interrupted then
							fxGlitch1500Frame4( fxGlitch1500, event )
							return 
						else
							fxGlitch1500:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							fxGlitch1500:setAlpha( 0.18 )
							fxGlitch1500:registerEventHandler( "transition_complete_keyframe", fxGlitch1500Frame4 )
						end
					end
					
					if event.interrupted then
						fxGlitch1500Frame3( fxGlitch1500, event )
						return 
					else
						fxGlitch1500:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						fxGlitch1500:registerEventHandler( "transition_complete_keyframe", fxGlitch1500Frame3 )
					end
				end
				
				fxGlitch1500:completeAnimation()
				self.fxGlitch1500:setLeftRight( 0, 1, 66, -46 )
				self.fxGlitch1500:setTopBottom( 0, 1, 104, -142 )
				self.fxGlitch1500:setAlpha( 0 )
				fxGlitch1500Frame2( fxGlitch1500, {} )
			end,
			GlitchLarge1 = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				local fxGlitch1900Frame2 = function ( fxGlitch1900, event )
					local fxGlitch1900Frame3 = function ( fxGlitch1900, event )
						local fxGlitch1900Frame4 = function ( fxGlitch1900, event )
							local fxGlitch1900Frame5 = function ( fxGlitch1900, event )
								local fxGlitch1900Frame6 = function ( fxGlitch1900, event )
									local fxGlitch1900Frame7 = function ( fxGlitch1900, event )
										if not event.interrupted then
											fxGlitch1900:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										end
										fxGlitch1900:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( fxGlitch1900, event )
										else
											fxGlitch1900:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										fxGlitch1900Frame7( fxGlitch1900, event )
										return 
									else
										fxGlitch1900:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										fxGlitch1900:setAlpha( 1 )
										fxGlitch1900:registerEventHandler( "transition_complete_keyframe", fxGlitch1900Frame7 )
									end
								end
								
								if event.interrupted then
									fxGlitch1900Frame6( fxGlitch1900, event )
									return 
								else
									fxGlitch1900:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
									fxGlitch1900:registerEventHandler( "transition_complete_keyframe", fxGlitch1900Frame6 )
								end
							end
							
							if event.interrupted then
								fxGlitch1900Frame5( fxGlitch1900, event )
								return 
							else
								fxGlitch1900:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								fxGlitch1900:setAlpha( 0 )
								fxGlitch1900:registerEventHandler( "transition_complete_keyframe", fxGlitch1900Frame5 )
							end
						end
						
						if event.interrupted then
							fxGlitch1900Frame4( fxGlitch1900, event )
							return 
						else
							fxGlitch1900:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							fxGlitch1900:registerEventHandler( "transition_complete_keyframe", fxGlitch1900Frame4 )
						end
					end
					
					if event.interrupted then
						fxGlitch1900Frame3( fxGlitch1900, event )
						return 
					else
						fxGlitch1900:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						fxGlitch1900:setAlpha( 1 )
						fxGlitch1900:registerEventHandler( "transition_complete_keyframe", fxGlitch1900Frame3 )
					end
				end
				
				fxGlitch1900:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
				fxGlitch1900:setAlpha( 0 )
				fxGlitch1900:registerEventHandler( "transition_complete_keyframe", fxGlitch1900Frame2 )
				local fxGlitch1800Frame2 = function ( fxGlitch1800, event )
					local fxGlitch1800Frame3 = function ( fxGlitch1800, event )
						local fxGlitch1800Frame4 = function ( fxGlitch1800, event )
							local fxGlitch1800Frame5 = function ( fxGlitch1800, event )
								local fxGlitch1800Frame6 = function ( fxGlitch1800, event )
									local fxGlitch1800Frame7 = function ( fxGlitch1800, event )
										local fxGlitch1800Frame8 = function ( fxGlitch1800, event )
											local fxGlitch1800Frame9 = function ( fxGlitch1800, event )
												if not event.interrupted then
													fxGlitch1800:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												end
												fxGlitch1800:setLeftRight( 0, 1, 0, 0 )
												fxGlitch1800:setTopBottom( 0, 1, 145, -187 )
												fxGlitch1800:setAlpha( 0 )
												if event.interrupted then
													self.clipFinished( fxGlitch1800, event )
												else
													fxGlitch1800:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												fxGlitch1800Frame9( fxGlitch1800, event )
												return 
											else
												fxGlitch1800:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame9 )
											end
										end
										
										if event.interrupted then
											fxGlitch1800Frame8( fxGlitch1800, event )
											return 
										else
											fxGlitch1800:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											fxGlitch1800:setAlpha( 1 )
											fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame8 )
										end
									end
									
									if event.interrupted then
										fxGlitch1800Frame7( fxGlitch1800, event )
										return 
									else
										fxGlitch1800:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
										fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame7 )
									end
								end
								
								if event.interrupted then
									fxGlitch1800Frame6( fxGlitch1800, event )
									return 
								else
									fxGlitch1800:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									fxGlitch1800:setAlpha( 0 )
									fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame6 )
								end
							end
							
							if event.interrupted then
								fxGlitch1800Frame5( fxGlitch1800, event )
								return 
							else
								fxGlitch1800:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame5 )
							end
						end
						
						if event.interrupted then
							fxGlitch1800Frame4( fxGlitch1800, event )
							return 
						else
							fxGlitch1800:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							fxGlitch1800:setAlpha( 1 )
							fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame4 )
						end
					end
					
					if event.interrupted then
						fxGlitch1800Frame3( fxGlitch1800, event )
						return 
					else
						fxGlitch1800:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
						fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame3 )
					end
				end
				
				fxGlitch1800:completeAnimation()
				self.fxGlitch1800:setLeftRight( 0, 1, 0, 0 )
				self.fxGlitch1800:setTopBottom( 0, 1, 145, -187 )
				self.fxGlitch1800:setAlpha( 0 )
				fxGlitch1800Frame2( fxGlitch1800, {} )
				local fxGlitch1700Frame2 = function ( fxGlitch1700, event )
					local fxGlitch1700Frame3 = function ( fxGlitch1700, event )
						local fxGlitch1700Frame4 = function ( fxGlitch1700, event )
							local fxGlitch1700Frame5 = function ( fxGlitch1700, event )
								if not event.interrupted then
									fxGlitch1700:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								end
								fxGlitch1700:setLeftRight( 0, 1, 0, 0 )
								fxGlitch1700:setTopBottom( 0, 1, 157, -175 )
								fxGlitch1700:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( fxGlitch1700, event )
								else
									fxGlitch1700:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								fxGlitch1700Frame5( fxGlitch1700, event )
								return 
							else
								fxGlitch1700:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								fxGlitch1700:registerEventHandler( "transition_complete_keyframe", fxGlitch1700Frame5 )
							end
						end
						
						if event.interrupted then
							fxGlitch1700Frame4( fxGlitch1700, event )
							return 
						else
							fxGlitch1700:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							fxGlitch1700:setAlpha( 1 )
							fxGlitch1700:registerEventHandler( "transition_complete_keyframe", fxGlitch1700Frame4 )
						end
					end
					
					if event.interrupted then
						fxGlitch1700Frame3( fxGlitch1700, event )
						return 
					else
						fxGlitch1700:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						fxGlitch1700:registerEventHandler( "transition_complete_keyframe", fxGlitch1700Frame3 )
					end
				end
				
				fxGlitch1700:completeAnimation()
				self.fxGlitch1700:setLeftRight( 0, 1, 0, 0 )
				self.fxGlitch1700:setTopBottom( 0, 1, 157, -175 )
				self.fxGlitch1700:setAlpha( 0 )
				fxGlitch1700Frame2( fxGlitch1700, {} )
				fxGlitch1500:completeAnimation()
				self.fxGlitch1500:setLeftRight( 0, 1, 66, -46 )
				self.fxGlitch1500:setTopBottom( 0, 1, 104, -142 )
				self.clipFinished( fxGlitch1500, {} )
				local fxGlitch1400Frame2 = function ( fxGlitch1400, event )
					local fxGlitch1400Frame3 = function ( fxGlitch1400, event )
						local fxGlitch1400Frame4 = function ( fxGlitch1400, event )
							if not event.interrupted then
								fxGlitch1400:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							end
							fxGlitch1400:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( fxGlitch1400, event )
							else
								fxGlitch1400:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							fxGlitch1400Frame4( fxGlitch1400, event )
							return 
						else
							fxGlitch1400:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							fxGlitch1400:setAlpha( 0 )
							fxGlitch1400:registerEventHandler( "transition_complete_keyframe", fxGlitch1400Frame4 )
						end
					end
					
					if event.interrupted then
						fxGlitch1400Frame3( fxGlitch1400, event )
						return 
					else
						fxGlitch1400:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						fxGlitch1400:setAlpha( 1 )
						fxGlitch1400:registerEventHandler( "transition_complete_keyframe", fxGlitch1400Frame3 )
					end
				end
				
				fxGlitch1400:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
				fxGlitch1400:setAlpha( 0 )
				fxGlitch1400:registerEventHandler( "transition_complete_keyframe", fxGlitch1400Frame2 )
				local fxGlitch1300Frame2 = function ( fxGlitch1300, event )
					local fxGlitch1300Frame3 = function ( fxGlitch1300, event )
						local fxGlitch1300Frame4 = function ( fxGlitch1300, event )
							if not event.interrupted then
								fxGlitch1300:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							end
							fxGlitch1300:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( fxGlitch1300, event )
							else
								fxGlitch1300:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							fxGlitch1300Frame4( fxGlitch1300, event )
							return 
						else
							fxGlitch1300:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							fxGlitch1300:setAlpha( 1 )
							fxGlitch1300:registerEventHandler( "transition_complete_keyframe", fxGlitch1300Frame4 )
						end
					end
					
					if event.interrupted then
						fxGlitch1300Frame3( fxGlitch1300, event )
						return 
					else
						fxGlitch1300:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						fxGlitch1300:setAlpha( 0.25 )
						fxGlitch1300:registerEventHandler( "transition_complete_keyframe", fxGlitch1300Frame3 )
					end
				end
				
				fxGlitch1300:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
				fxGlitch1300:setAlpha( 0 )
				fxGlitch1300:registerEventHandler( "transition_complete_keyframe", fxGlitch1300Frame2 )
				local fxGlitch1100Frame2 = function ( fxGlitch1100, event )
					local fxGlitch1100Frame3 = function ( fxGlitch1100, event )
						local fxGlitch1100Frame4 = function ( fxGlitch1100, event )
							if not event.interrupted then
								fxGlitch1100:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							end
							fxGlitch1100:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( fxGlitch1100, event )
							else
								fxGlitch1100:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							fxGlitch1100Frame4( fxGlitch1100, event )
							return 
						else
							fxGlitch1100:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							fxGlitch1100:registerEventHandler( "transition_complete_keyframe", fxGlitch1100Frame4 )
						end
					end
					
					if event.interrupted then
						fxGlitch1100Frame3( fxGlitch1100, event )
						return 
					else
						fxGlitch1100:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						fxGlitch1100:setAlpha( 1 )
						fxGlitch1100:registerEventHandler( "transition_complete_keyframe", fxGlitch1100Frame3 )
					end
				end
				
				fxGlitch1100:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
				fxGlitch1100:setAlpha( 0 )
				fxGlitch1100:registerEventHandler( "transition_complete_keyframe", fxGlitch1100Frame2 )
			end,
			GlitchLarge2 = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				local fxGlitch1900Frame2 = function ( fxGlitch1900, event )
					local fxGlitch1900Frame3 = function ( fxGlitch1900, event )
						local fxGlitch1900Frame4 = function ( fxGlitch1900, event )
							local fxGlitch1900Frame5 = function ( fxGlitch1900, event )
								local fxGlitch1900Frame6 = function ( fxGlitch1900, event )
									local fxGlitch1900Frame7 = function ( fxGlitch1900, event )
										local fxGlitch1900Frame8 = function ( fxGlitch1900, event )
											if not event.interrupted then
												fxGlitch1900:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											end
											fxGlitch1900:setLeftRight( 0, 1, 177, -177 )
											fxGlitch1900:setTopBottom( 0, 1, 119, -229 )
											fxGlitch1900:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( fxGlitch1900, event )
											else
												fxGlitch1900:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											fxGlitch1900Frame8( fxGlitch1900, event )
											return 
										else
											fxGlitch1900:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											fxGlitch1900:registerEventHandler( "transition_complete_keyframe", fxGlitch1900Frame8 )
										end
									end
									
									if event.interrupted then
										fxGlitch1900Frame7( fxGlitch1900, event )
										return 
									else
										fxGlitch1900:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										fxGlitch1900:setTopBottom( 0, 1, 119, -229 )
										fxGlitch1900:setAlpha( 1 )
										fxGlitch1900:registerEventHandler( "transition_complete_keyframe", fxGlitch1900Frame7 )
									end
								end
								
								if event.interrupted then
									fxGlitch1900Frame6( fxGlitch1900, event )
									return 
								else
									fxGlitch1900:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									fxGlitch1900:setTopBottom( 0, 1, 171.5, -176.5 )
									fxGlitch1900:setAlpha( 0 )
									fxGlitch1900:registerEventHandler( "transition_complete_keyframe", fxGlitch1900Frame6 )
								end
							end
							
							if event.interrupted then
								fxGlitch1900Frame5( fxGlitch1900, event )
								return 
							else
								fxGlitch1900:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								fxGlitch1900:setTopBottom( 0, 1, 224, -124 )
								fxGlitch1900:registerEventHandler( "transition_complete_keyframe", fxGlitch1900Frame5 )
							end
						end
						
						if event.interrupted then
							fxGlitch1900Frame4( fxGlitch1900, event )
							return 
						else
							fxGlitch1900:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							fxGlitch1900:setTopBottom( 0, 1, 221.03, -126.97 )
							fxGlitch1900:setAlpha( 1 )
							fxGlitch1900:registerEventHandler( "transition_complete_keyframe", fxGlitch1900Frame4 )
						end
					end
					
					if event.interrupted then
						fxGlitch1900Frame3( fxGlitch1900, event )
						return 
					else
						fxGlitch1900:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
						fxGlitch1900:setTopBottom( 0, 1, 218.06, -129.94 )
						fxGlitch1900:registerEventHandler( "transition_complete_keyframe", fxGlitch1900Frame3 )
					end
				end
				
				fxGlitch1900:completeAnimation()
				self.fxGlitch1900:setLeftRight( 0, 1, 177, -177 )
				self.fxGlitch1900:setTopBottom( 0, 1, 123, -225 )
				self.fxGlitch1900:setAlpha( 0 )
				fxGlitch1900Frame2( fxGlitch1900, {} )
				local fxGlitch1800Frame2 = function ( fxGlitch1800, event )
					local fxGlitch1800Frame3 = function ( fxGlitch1800, event )
						local fxGlitch1800Frame4 = function ( fxGlitch1800, event )
							local fxGlitch1800Frame5 = function ( fxGlitch1800, event )
								local fxGlitch1800Frame6 = function ( fxGlitch1800, event )
									local fxGlitch1800Frame7 = function ( fxGlitch1800, event )
										local fxGlitch1800Frame8 = function ( fxGlitch1800, event )
											local fxGlitch1800Frame9 = function ( fxGlitch1800, event )
												local fxGlitch1800Frame10 = function ( fxGlitch1800, event )
													local fxGlitch1800Frame11 = function ( fxGlitch1800, event )
														local fxGlitch1800Frame12 = function ( fxGlitch1800, event )
															local fxGlitch1800Frame13 = function ( fxGlitch1800, event )
																if not event.interrupted then
																	fxGlitch1800:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																end
																fxGlitch1800:setLeftRight( 0, 1, 0, 0 )
																fxGlitch1800:setTopBottom( 0, 1, 208, -124 )
																fxGlitch1800:setAlpha( 0 )
																if event.interrupted then
																	self.clipFinished( fxGlitch1800, event )
																else
																	fxGlitch1800:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																end
															end
															
															if event.interrupted then
																fxGlitch1800Frame13( fxGlitch1800, event )
																return 
															else
																fxGlitch1800:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame13 )
															end
														end
														
														if event.interrupted then
															fxGlitch1800Frame12( fxGlitch1800, event )
															return 
														else
															fxGlitch1800:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
															fxGlitch1800:setTopBottom( 0, 1, 208, -124 )
															fxGlitch1800:setAlpha( 1 )
															fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame12 )
														end
													end
													
													if event.interrupted then
														fxGlitch1800Frame11( fxGlitch1800, event )
														return 
													else
														fxGlitch1800:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
														fxGlitch1800:setTopBottom( 0, 1, 197.29, -134.71 )
														fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame11 )
													end
												end
												
												if event.interrupted then
													fxGlitch1800Frame10( fxGlitch1800, event )
													return 
												else
													fxGlitch1800:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													fxGlitch1800:setTopBottom( 0, 1, 154.43, -177.57 )
													fxGlitch1800:setAlpha( 0 )
													fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame10 )
												end
											end
											
											if event.interrupted then
												fxGlitch1800Frame9( fxGlitch1800, event )
												return 
											else
												fxGlitch1800:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												fxGlitch1800:setTopBottom( 0, 1, 143.71, -188.29 )
												fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame9 )
											end
										end
										
										if event.interrupted then
											fxGlitch1800Frame8( fxGlitch1800, event )
											return 
										else
											fxGlitch1800:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											fxGlitch1800:setTopBottom( 0, 1, 133, -199 )
											fxGlitch1800:setAlpha( 1 )
											fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame8 )
										end
									end
									
									if event.interrupted then
										fxGlitch1800Frame7( fxGlitch1800, event )
										return 
									else
										fxGlitch1800:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
										fxGlitch1800:setTopBottom( 0, 1, 144.88, -187.12 )
										fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame7 )
									end
								end
								
								if event.interrupted then
									fxGlitch1800Frame6( fxGlitch1800, event )
									return 
								else
									fxGlitch1800:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									fxGlitch1800:setTopBottom( 0, 1, 216.13, -115.87 )
									fxGlitch1800:setAlpha( 0 )
									fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame6 )
								end
							end
							
							if event.interrupted then
								fxGlitch1800Frame5( fxGlitch1800, event )
								return 
							else
								fxGlitch1800:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame5 )
							end
						end
						
						if event.interrupted then
							fxGlitch1800Frame4( fxGlitch1800, event )
							return 
						else
							fxGlitch1800:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							fxGlitch1800:setAlpha( 1 )
							fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame4 )
						end
					end
					
					if event.interrupted then
						fxGlitch1800Frame3( fxGlitch1800, event )
						return 
					else
						fxGlitch1800:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
						fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame3 )
					end
				end
				
				fxGlitch1800:completeAnimation()
				self.fxGlitch1800:setLeftRight( 0, 1, 0, 0 )
				self.fxGlitch1800:setTopBottom( 0, 1, 228, -104 )
				self.fxGlitch1800:setAlpha( 0 )
				fxGlitch1800Frame2( fxGlitch1800, {} )
				local fxGlitch1700Frame2 = function ( fxGlitch1700, event )
					local fxGlitch1700Frame3 = function ( fxGlitch1700, event )
						local fxGlitch1700Frame4 = function ( fxGlitch1700, event )
							local fxGlitch1700Frame5 = function ( fxGlitch1700, event )
								if not event.interrupted then
									fxGlitch1700:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								end
								fxGlitch1700:setLeftRight( 0, 1, 0, 0 )
								fxGlitch1700:setTopBottom( 0, 1, 140, -192 )
								fxGlitch1700:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( fxGlitch1700, event )
								else
									fxGlitch1700:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								fxGlitch1700Frame5( fxGlitch1700, event )
								return 
							else
								fxGlitch1700:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								fxGlitch1700:registerEventHandler( "transition_complete_keyframe", fxGlitch1700Frame5 )
							end
						end
						
						if event.interrupted then
							fxGlitch1700Frame4( fxGlitch1700, event )
							return 
						else
							fxGlitch1700:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							fxGlitch1700:setAlpha( 1 )
							fxGlitch1700:registerEventHandler( "transition_complete_keyframe", fxGlitch1700Frame4 )
						end
					end
					
					if event.interrupted then
						fxGlitch1700Frame3( fxGlitch1700, event )
						return 
					else
						fxGlitch1700:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
						fxGlitch1700:registerEventHandler( "transition_complete_keyframe", fxGlitch1700Frame3 )
					end
				end
				
				fxGlitch1700:completeAnimation()
				self.fxGlitch1700:setLeftRight( 0, 1, 0, 0 )
				self.fxGlitch1700:setTopBottom( 0, 1, 140, -192 )
				self.fxGlitch1700:setAlpha( 0 )
				fxGlitch1700Frame2( fxGlitch1700, {} )
				fxGlitch1500:completeAnimation()
				self.fxGlitch1500:setLeftRight( 0, 1, 66, -46 )
				self.fxGlitch1500:setTopBottom( 0, 1, 104, -142 )
				self.clipFinished( fxGlitch1500, {} )
				local fxGlitch1400Frame2 = function ( fxGlitch1400, event )
					local fxGlitch1400Frame3 = function ( fxGlitch1400, event )
						if not event.interrupted then
							fxGlitch1400:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						end
						fxGlitch1400:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( fxGlitch1400, event )
						else
							fxGlitch1400:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						fxGlitch1400Frame3( fxGlitch1400, event )
						return 
					else
						fxGlitch1400:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						fxGlitch1400:setAlpha( 1 )
						fxGlitch1400:registerEventHandler( "transition_complete_keyframe", fxGlitch1400Frame3 )
					end
				end
				
				fxGlitch1400:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
				fxGlitch1400:setAlpha( 0 )
				fxGlitch1400:registerEventHandler( "transition_complete_keyframe", fxGlitch1400Frame2 )
				local fxGlitch1200Frame2 = function ( fxGlitch1200, event )
					local fxGlitch1200Frame3 = function ( fxGlitch1200, event )
						local fxGlitch1200Frame4 = function ( fxGlitch1200, event )
							if not event.interrupted then
								fxGlitch1200:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							end
							fxGlitch1200:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( fxGlitch1200, event )
							else
								fxGlitch1200:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							fxGlitch1200Frame4( fxGlitch1200, event )
							return 
						else
							fxGlitch1200:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							fxGlitch1200:registerEventHandler( "transition_complete_keyframe", fxGlitch1200Frame4 )
						end
					end
					
					if event.interrupted then
						fxGlitch1200Frame3( fxGlitch1200, event )
						return 
					else
						fxGlitch1200:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						fxGlitch1200:setAlpha( 1 )
						fxGlitch1200:registerEventHandler( "transition_complete_keyframe", fxGlitch1200Frame3 )
					end
				end
				
				fxGlitch1200:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
				fxGlitch1200:setAlpha( 0 )
				fxGlitch1200:registerEventHandler( "transition_complete_keyframe", fxGlitch1200Frame2 )
				local fxGlitch1100Frame2 = function ( fxGlitch1100, event )
					local fxGlitch1100Frame3 = function ( fxGlitch1100, event )
						if not event.interrupted then
							fxGlitch1100:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						end
						fxGlitch1100:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( fxGlitch1100, event )
						else
							fxGlitch1100:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						fxGlitch1100Frame3( fxGlitch1100, event )
						return 
					else
						fxGlitch1100:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						fxGlitch1100:setAlpha( 1 )
						fxGlitch1100:registerEventHandler( "transition_complete_keyframe", fxGlitch1100Frame3 )
					end
				end
				
				fxGlitch1100:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
				fxGlitch1100:setAlpha( 0 )
				fxGlitch1100:registerEventHandler( "transition_complete_keyframe", fxGlitch1100Frame2 )
			end,
			GlitchSmall2Slow = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				local fxGlitch1900Frame2 = function ( fxGlitch1900, event )
					local fxGlitch1900Frame3 = function ( fxGlitch1900, event )
						local fxGlitch1900Frame4 = function ( fxGlitch1900, event )
							if not event.interrupted then
								fxGlitch1900:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							end
							fxGlitch1900:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( fxGlitch1900, event )
							else
								fxGlitch1900:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							fxGlitch1900Frame4( fxGlitch1900, event )
							return 
						else
							fxGlitch1900:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							fxGlitch1900:registerEventHandler( "transition_complete_keyframe", fxGlitch1900Frame4 )
						end
					end
					
					if event.interrupted then
						fxGlitch1900Frame3( fxGlitch1900, event )
						return 
					else
						fxGlitch1900:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						fxGlitch1900:setAlpha( 1 )
						fxGlitch1900:registerEventHandler( "transition_complete_keyframe", fxGlitch1900Frame3 )
					end
				end
				
				fxGlitch1900:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
				fxGlitch1900:setAlpha( 0 )
				fxGlitch1900:registerEventHandler( "transition_complete_keyframe", fxGlitch1900Frame2 )
				local fxGlitch1800Frame2 = function ( fxGlitch1800, event )
					local fxGlitch1800Frame3 = function ( fxGlitch1800, event )
						local fxGlitch1800Frame4 = function ( fxGlitch1800, event )
							local fxGlitch1800Frame5 = function ( fxGlitch1800, event )
								local fxGlitch1800Frame6 = function ( fxGlitch1800, event )
									local fxGlitch1800Frame7 = function ( fxGlitch1800, event )
										local fxGlitch1800Frame8 = function ( fxGlitch1800, event )
											local fxGlitch1800Frame9 = function ( fxGlitch1800, event )
												local fxGlitch1800Frame10 = function ( fxGlitch1800, event )
													local fxGlitch1800Frame11 = function ( fxGlitch1800, event )
														if not event.interrupted then
															fxGlitch1800:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
														end
														fxGlitch1800:setLeftRight( 0, 1, 0, 0 )
														fxGlitch1800:setTopBottom( 0, 1, 145, -187 )
														fxGlitch1800:setAlpha( 0 )
														if event.interrupted then
															self.clipFinished( fxGlitch1800, event )
														else
															fxGlitch1800:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														fxGlitch1800Frame11( fxGlitch1800, event )
														return 
													else
														fxGlitch1800:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														fxGlitch1800:setAlpha( 0.72 )
														fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame11 )
													end
												end
												
												if event.interrupted then
													fxGlitch1800Frame10( fxGlitch1800, event )
													return 
												else
													fxGlitch1800:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													fxGlitch1800:setTopBottom( 0, 1, 145, -187 )
													fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame10 )
												end
											end
											
											if event.interrupted then
												fxGlitch1800Frame9( fxGlitch1800, event )
												return 
											else
												fxGlitch1800:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												fxGlitch1800:setTopBottom( 0, 1, 169.67, -162.33 )
												fxGlitch1800:setAlpha( 0 )
												fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame9 )
											end
										end
										
										if event.interrupted then
											fxGlitch1800Frame8( fxGlitch1800, event )
											return 
										else
											fxGlitch1800:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											fxGlitch1800:setTopBottom( 0, 1, 182, -150 )
											fxGlitch1800:setAlpha( 1 )
											fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame8 )
										end
									end
									
									if event.interrupted then
										fxGlitch1800Frame7( fxGlitch1800, event )
										return 
									else
										fxGlitch1800:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
										fxGlitch1800:setTopBottom( 0, 1, 174, -158 )
										fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame7 )
									end
								end
								
								if event.interrupted then
									fxGlitch1800Frame6( fxGlitch1800, event )
									return 
								else
									fxGlitch1800:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									fxGlitch1800:setTopBottom( 0, 1, 150, -182 )
									fxGlitch1800:setAlpha( 0 )
									fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame6 )
								end
							end
							
							if event.interrupted then
								fxGlitch1800Frame5( fxGlitch1800, event )
								return 
							else
								fxGlitch1800:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame5 )
							end
						end
						
						if event.interrupted then
							fxGlitch1800Frame4( fxGlitch1800, event )
							return 
						else
							fxGlitch1800:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							fxGlitch1800:setAlpha( 0.8 )
							fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame4 )
						end
					end
					
					if event.interrupted then
						fxGlitch1800Frame3( fxGlitch1800, event )
						return 
					else
						fxGlitch1800:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
						fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame3 )
					end
				end
				
				fxGlitch1800:completeAnimation()
				self.fxGlitch1800:setLeftRight( 0, 1, 0, 0 )
				self.fxGlitch1800:setTopBottom( 0, 1, 142, -190 )
				self.fxGlitch1800:setAlpha( 0 )
				fxGlitch1800Frame2( fxGlitch1800, {} )
				local fxGlitch1700Frame2 = function ( fxGlitch1700, event )
					local fxGlitch1700Frame3 = function ( fxGlitch1700, event )
						local fxGlitch1700Frame4 = function ( fxGlitch1700, event )
							if not event.interrupted then
								fxGlitch1700:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							end
							fxGlitch1700:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( fxGlitch1700, event )
							else
								fxGlitch1700:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							fxGlitch1700Frame4( fxGlitch1700, event )
							return 
						else
							fxGlitch1700:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							fxGlitch1700:setAlpha( 0.16 )
							fxGlitch1700:registerEventHandler( "transition_complete_keyframe", fxGlitch1700Frame4 )
						end
					end
					
					if event.interrupted then
						fxGlitch1700Frame3( fxGlitch1700, event )
						return 
					else
						fxGlitch1700:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						fxGlitch1700:setAlpha( 0.19 )
						fxGlitch1700:registerEventHandler( "transition_complete_keyframe", fxGlitch1700Frame3 )
					end
				end
				
				fxGlitch1700:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
				fxGlitch1700:setAlpha( 0 )
				fxGlitch1700:registerEventHandler( "transition_complete_keyframe", fxGlitch1700Frame2 )
				local fxGlitch1600Frame2 = function ( fxGlitch1600, event )
					local fxGlitch1600Frame3 = function ( fxGlitch1600, event )
						if not event.interrupted then
							fxGlitch1600:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						end
						fxGlitch1600:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( fxGlitch1600, event )
						else
							fxGlitch1600:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						fxGlitch1600Frame3( fxGlitch1600, event )
						return 
					else
						fxGlitch1600:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						fxGlitch1600:setAlpha( 0.28 )
						fxGlitch1600:registerEventHandler( "transition_complete_keyframe", fxGlitch1600Frame3 )
					end
				end
				
				fxGlitch1600:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
				fxGlitch1600:setAlpha( 0 )
				fxGlitch1600:registerEventHandler( "transition_complete_keyframe", fxGlitch1600Frame2 )
				local fxGlitch1400Frame2 = function ( fxGlitch1400, event )
					local fxGlitch1400Frame3 = function ( fxGlitch1400, event )
						if not event.interrupted then
							fxGlitch1400:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						end
						fxGlitch1400:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( fxGlitch1400, event )
						else
							fxGlitch1400:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						fxGlitch1400Frame3( fxGlitch1400, event )
						return 
					else
						fxGlitch1400:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						fxGlitch1400:setAlpha( 0.33 )
						fxGlitch1400:registerEventHandler( "transition_complete_keyframe", fxGlitch1400Frame3 )
					end
				end
				
				fxGlitch1400:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
				fxGlitch1400:setAlpha( 0 )
				fxGlitch1400:registerEventHandler( "transition_complete_keyframe", fxGlitch1400Frame2 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.fxGlitch1900:close()
		self.fxGlitch1800:close()
		self.fxGlitch1700:close()
		self.fxGlitch1600:close()
		self.fxGlitch1500:close()
		self.fxGlitch1400:close()
		self.fxGlitch1300:close()
		self.fxGlitch1200:close()
		self.fxGlitch1100:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

