require( "ui.uieditor.widgets.CPLevels.RamsesStation.NasserInterviewMeter" )

local MeterHeightToLabel = function ( meter )
	return math.floor( 80 + (meter:getHeight() - 111) / 2.1 )
end

local PostLoadFunc = function ( self, controller, menu )
	self:registerEventHandler( "update_heart_rate", function ( self, event )
		local heartRate = math.random( 110, 120 )
		self.HeartRateNumber:setText( heartRate )
		self.HorizontalMeterHeartRateNumber:setText( heartRate )
	end )
	self:registerEventHandler( "update_meter_text", function ( self, event )
		self.LeftMeterNumber:setText( MeterHeightToLabel( self.LeftMeter ) )
		self.MiddleMeterNumber:setText( MeterHeightToLabel( self.MiddleMeter ) )
		self.RightMeterNumber:setText( MeterHeightToLabel( self.RightMeter ) )
	end )
	self:addElement( LUI.UITimer.new( 1000, "update_heart_rate", false, self ) )
	self:addElement( LUI.UITimer.new( 1, "update_meter_text", false, self ) )
end

CoD.NasserInterviewWidget = InheritFrom( LUI.UIElement )
CoD.NasserInterviewWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.NasserInterviewWidget )
	self.id = "NasserInterviewWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 403 )
	self:setTopBottom( true, false, 0, 224 )
	self.anyChildUsesUpdateState = true
	
	local ExtraCam2 = LUI.UIImage.new()
	ExtraCam2:setLeftRight( true, true, 0, 0 )
	ExtraCam2:setTopBottom( true, true, 0, 0 )
	ExtraCam2:setRGB( 1, 1, 1 )
	ExtraCam2:setMaterial( LUI.UIImage.GetCachedMaterial( "extracam" ) )
	ExtraCam2:setShaderVector( 0, 0, 0.22, 1, 0.78 )
	ExtraCam2:setShaderVector( 1, 0, 0, 0, 0 )
	self:addElement( ExtraCam2 )
	self.ExtraCam2 = ExtraCam2
	
	local Vignette = LUI.UIImage.new()
	Vignette:setLeftRight( true, true, 0, 0 )
	Vignette:setTopBottom( true, true, 0, 0 )
	Vignette:setRGB( 1, 1, 1 )
	Vignette:setImage( RegisterImage( "uie_img_t7_hud_cp_biometrics_vignette" ) )
	Vignette:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Vignette )
	self.Vignette = Vignette
	
	local Frame = LUI.UIImage.new()
	Frame:setLeftRight( true, true, 0, 0 )
	Frame:setTopBottom( true, true, 0, 0 )
	Frame:setRGB( 1, 1, 1 )
	Frame:setImage( RegisterImage( "uie_img_t7_hud_cp_biometrics_framework" ) )
	Frame:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Frame )
	self.Frame = Frame
	
	local LeftMeterNumber = LUI.UITightText.new()
	LeftMeterNumber:setLeftRight( true, false, 10, 22 )
	LeftMeterNumber:setTopBottom( true, false, 9, 23 )
	LeftMeterNumber:setRGB( 0.21, 0.63, 0.69 )
	LeftMeterNumber:setText( Engine.Localize( "74" ) )
	LeftMeterNumber:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	self:addElement( LeftMeterNumber )
	self.LeftMeterNumber = LeftMeterNumber
	
	local MiddleMeterNumber = LUI.UITightText.new()
	MiddleMeterNumber:setLeftRight( true, true, 31, -358 )
	MiddleMeterNumber:setTopBottom( true, false, 9, 23 )
	MiddleMeterNumber:setRGB( 0.21, 0.63, 0.69 )
	MiddleMeterNumber:setText( Engine.Localize( "88" ) )
	MiddleMeterNumber:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	self:addElement( MiddleMeterNumber )
	self.MiddleMeterNumber = MiddleMeterNumber
	
	local RightMeterNumber = LUI.UITightText.new()
	RightMeterNumber:setLeftRight( true, true, 51, -338 )
	RightMeterNumber:setTopBottom( true, false, 9, 23 )
	RightMeterNumber:setRGB( 0.21, 0.63, 0.69 )
	RightMeterNumber:setText( Engine.Localize( "90" ) )
	RightMeterNumber:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	self:addElement( RightMeterNumber )
	self.RightMeterNumber = RightMeterNumber
	
	local HorizontalMeterHeartRateNumber = LUI.UITightText.new()
	HorizontalMeterHeartRateNumber:setLeftRight( false, true, -323, -304 )
	HorizontalMeterHeartRateNumber:setTopBottom( false, true, -43, -29 )
	HorizontalMeterHeartRateNumber:setRGB( 0.21, 0.63, 0.69 )
	HorizontalMeterHeartRateNumber:setText( Engine.Localize( "120" ) )
	HorizontalMeterHeartRateNumber:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	self:addElement( HorizontalMeterHeartRateNumber )
	self.HorizontalMeterHeartRateNumber = HorizontalMeterHeartRateNumber
	
	local BPMImage = LUI.UIImage.new()
	BPMImage:setLeftRight( true, false, 375, 383 )
	BPMImage:setTopBottom( true, false, 128, 163 )
	BPMImage:setRGB( 1, 1, 1 )
	BPMImage:setImage( RegisterImage( "uie_img_t7_hud_cp_biometrics_state1bpm" ) )
	BPMImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( BPMImage )
	self.BPMImage = BPMImage
	
	local HeartRateLabel = LUI.UITightText.new()
	HeartRateLabel:setLeftRight( true, false, 349, 380 )
	HeartRateLabel:setTopBottom( true, false, 138, 146.5 )
	HeartRateLabel:setRGB( 0.22, 0.56, 0.64 )
	HeartRateLabel:setText( Engine.Localize( "HEART RATE" ) )
	HeartRateLabel:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	self:addElement( HeartRateLabel )
	self.HeartRateLabel = HeartRateLabel
	
	local HeartRateNumber = LUI.UITightText.new()
	HeartRateNumber:setLeftRight( false, true, -66, -30 )
	HeartRateNumber:setTopBottom( false, true, -82.75, -56 )
	HeartRateNumber:setRGB( 0.56, 0.71, 0.69 )
	HeartRateNumber:setText( Engine.Localize( "120" ) )
	HeartRateNumber:setTTF( "fonts/default.ttf" )
	self:addElement( HeartRateNumber )
	self.HeartRateNumber = HeartRateNumber
	
	local LowAlphaDetailNumber = LUI.UITightText.new()
	LowAlphaDetailNumber:setLeftRight( false, true, -49, -22 )
	LowAlphaDetailNumber:setTopBottom( true, false, 37.25, 51 )
	LowAlphaDetailNumber:setRGB( 0.56, 0.71, 0.69 )
	LowAlphaDetailNumber:setAlpha( 0.4 )
	LowAlphaDetailNumber:setText( Engine.Localize( "88.26" ) )
	LowAlphaDetailNumber:setTTF( "fonts/default.ttf" )
	self:addElement( LowAlphaDetailNumber )
	self.LowAlphaDetailNumber = LowAlphaDetailNumber
	
	local LeftMeter = CoD.NasserInterviewMeter.new( menu, controller )
	LeftMeter:setLeftRight( true, false, -1.5, 35.5 )
	LeftMeter:setTopBottom( true, false, 102.38, 203 )
	LeftMeter:setRGB( 1, 1, 1 )
	LeftMeter.MeterOrbit:setRGB( 0, 0, 0 )
	self:addElement( LeftMeter )
	self.LeftMeter = LeftMeter
	
	local TopRightNumber1 = LUI.UITightText.new()
	TopRightNumber1:setLeftRight( false, true, -78, -54 )
	TopRightNumber1:setTopBottom( true, false, 15.13, 30.88 )
	TopRightNumber1:setRGB( 0.56, 0.71, 0.69 )
	TopRightNumber1:setText( Engine.Localize( "0.12" ) )
	TopRightNumber1:setTTF( "fonts/default.ttf" )
	self:addElement( TopRightNumber1 )
	self.TopRightNumber1 = TopRightNumber1
	
	local TopRightNumber2 = LUI.UITightText.new()
	TopRightNumber2:setLeftRight( false, true, -46, -22 )
	TopRightNumber2:setTopBottom( true, false, 15.13, 30.88 )
	TopRightNumber2:setRGB( 0.56, 0.71, 0.69 )
	TopRightNumber2:setText( Engine.Localize( "98.7" ) )
	TopRightNumber2:setTTF( "fonts/default.ttf" )
	self:addElement( TopRightNumber2 )
	self.TopRightNumber2 = TopRightNumber2
	
	local MiddleMeter = CoD.NasserInterviewMeter.new( menu, controller )
	MiddleMeter:setLeftRight( true, false, 19.5, 56.5 )
	MiddleMeter:setTopBottom( true, false, 68.5, 203 )
	MiddleMeter:setRGB( 1, 1, 1 )
	MiddleMeter.MeterOrbit:setRGB( 0, 0, 0 )
	self:addElement( MiddleMeter )
	self.MiddleMeter = MiddleMeter
	
	local RightMeter = CoD.NasserInterviewMeter.new( menu, controller )
	RightMeter:setLeftRight( true, false, 39.5, 76.5 )
	RightMeter:setTopBottom( true, false, 57.5, 203 )
	RightMeter:setRGB( 1, 1, 1 )
	RightMeter.MeterOrbit:setRGB( 1, 1, 1 )
	self:addElement( RightMeter )
	self.RightMeter = RightMeter
	
	local HorizontalMeterNumber2 = LUI.UITightText.new()
	HorizontalMeterNumber2:setLeftRight( false, true, -38, -18 )
	HorizontalMeterNumber2:setTopBottom( false, true, -43, -29 )
	HorizontalMeterNumber2:setRGB( 0.56, 0.71, 0.69 )
	HorizontalMeterNumber2:setText( Engine.Localize( "043" ) )
	HorizontalMeterNumber2:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	self:addElement( HorizontalMeterNumber2 )
	self.HorizontalMeterNumber2 = HorizontalMeterNumber2
	
	local EKG = LUI.UIImage.new()
	EKG:setLeftRight( true, false, 102.41, 362.41 )
	EKG:setTopBottom( true, false, 174, 204 )
	EKG:setRGB( 1, 1, 1 )
	EKG:setImage( RegisterImage( "uie_img_t7_hud_cp_biometrics_scrollheartbeat" ) )
	EKG:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	EKG:setShaderVector( 0, 4.5, 1, 0, 0 )
	EKG:setShaderVector( 1, 0.5, 0, 0, 0 )
	self:addElement( EKG )
	self.EKG = EKG
	
	local Brainwave = LUI.UIImage.new()
	Brainwave:setLeftRight( true, false, 102.41, 362.41 )
	Brainwave:setTopBottom( true, false, 174, 203 )
	Brainwave:setRGB( 1, 1, 1 )
	Brainwave:setImage( RegisterImage( "uie_img_t7_hud_cp_biometrics_scrollbrainwaves" ) )
	Brainwave:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	Brainwave:setShaderVector( 0, 1.5, 1, 0, 0 )
	Brainwave:setShaderVector( 1, 0.5, 0, 0, 0 )
	self:addElement( Brainwave )
	self.Brainwave = Brainwave
	
	local ScrollMetrics = LUI.UIImage.new()
	ScrollMetrics:setLeftRight( true, false, 10, 389 )
	ScrollMetrics:setTopBottom( true, false, 208, 221 )
	ScrollMetrics:setRGB( 1, 1, 1 )
	ScrollMetrics:setImage( RegisterImage( "uie_img_t7_hud_cp_biometrics_scrollmetrics" ) )
	ScrollMetrics:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	ScrollMetrics:setShaderVector( 0, 4, 1, 0, 0 )
	ScrollMetrics:setShaderVector( 1, 0.1, 0, 0, 0 )
	self:addElement( ScrollMetrics )
	self.ScrollMetrics = ScrollMetrics
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				local LeftMeterFrame2 = function ( LeftMeter, event )
					local LeftMeterFrame3 = function ( LeftMeter, event )
						local LeftMeterFrame4 = function ( LeftMeter, event )
							local LeftMeterFrame5 = function ( LeftMeter, event )
								local LeftMeterFrame6 = function ( LeftMeter, event )
									if not event.interrupted then
										LeftMeter:beginAnimation( "keyframe", 850, false, false, CoD.TweenType.Linear )
									end
									LeftMeter:setLeftRight( true, false, -1.5, 35.5 )
									LeftMeter:setTopBottom( true, false, 91.5, 203 )
									if event.interrupted then
										self.clipFinished( LeftMeter, event )
									else
										LeftMeter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									LeftMeterFrame6( LeftMeter, event )
									return 
								else
									LeftMeter:beginAnimation( "keyframe", 759, false, false, CoD.TweenType.Linear )
									LeftMeter:setTopBottom( true, false, 68.5, 203 )
									LeftMeter:registerEventHandler( "transition_complete_keyframe", LeftMeterFrame6 )
								end
							end
							
							if event.interrupted then
								LeftMeterFrame5( LeftMeter, event )
								return 
							else
								LeftMeter:beginAnimation( "keyframe", 559, false, false, CoD.TweenType.Linear )
								LeftMeter:setTopBottom( true, false, 105.11, 203 )
								LeftMeter:registerEventHandler( "transition_complete_keyframe", LeftMeterFrame5 )
							end
						end
						
						if event.interrupted then
							LeftMeterFrame4( LeftMeter, event )
							return 
						else
							LeftMeter:beginAnimation( "keyframe", 920, false, false, CoD.TweenType.Linear )
							LeftMeter:setTopBottom( true, false, 79.7, 203 )
							LeftMeter:registerEventHandler( "transition_complete_keyframe", LeftMeterFrame4 )
						end
					end
					
					if event.interrupted then
						LeftMeterFrame3( LeftMeter, event )
						return 
					else
						LeftMeter:beginAnimation( "keyframe", 800, false, false, CoD.TweenType.Linear )
						LeftMeter:setTopBottom( true, false, 108.5, 203 )
						LeftMeter:registerEventHandler( "transition_complete_keyframe", LeftMeterFrame3 )
					end
				end
				
				LeftMeter:completeAnimation()
				self.LeftMeter:setLeftRight( true, false, -1.5, 35.5 )
				self.LeftMeter:setTopBottom( true, false, 91.5, 203 )
				LeftMeterFrame2( LeftMeter, {} )
				local MiddleMeterFrame2 = function ( MiddleMeter, event )
					local MiddleMeterFrame3 = function ( MiddleMeter, event )
						local MiddleMeterFrame4 = function ( MiddleMeter, event )
							local MiddleMeterFrame5 = function ( MiddleMeter, event )
								local MiddleMeterFrame6 = function ( MiddleMeter, event )
									local MiddleMeterFrame7 = function ( MiddleMeter, event )
										if not event.interrupted then
											MiddleMeter:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
										end
										MiddleMeter:setLeftRight( true, false, 19.5, 56.5 )
										MiddleMeter:setTopBottom( true, false, 67.5, 203 )
										if event.interrupted then
											self.clipFinished( MiddleMeter, event )
										else
											MiddleMeter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										MiddleMeterFrame7( MiddleMeter, event )
										return 
									else
										MiddleMeter:beginAnimation( "keyframe", 420, false, false, CoD.TweenType.Linear )
										MiddleMeter:setTopBottom( true, false, 75.65, 203 )
										MiddleMeter:registerEventHandler( "transition_complete_keyframe", MiddleMeterFrame7 )
									end
								end
								
								if event.interrupted then
									MiddleMeterFrame6( MiddleMeter, event )
									return 
								else
									MiddleMeter:beginAnimation( "keyframe", 1129, false, false, CoD.TweenType.Linear )
									MiddleMeter:setTopBottom( true, false, 55.5, 203 )
									MiddleMeter:registerEventHandler( "transition_complete_keyframe", MiddleMeterFrame6 )
								end
							end
							
							if event.interrupted then
								MiddleMeterFrame5( MiddleMeter, event )
								return 
							else
								MiddleMeter:beginAnimation( "keyframe", 760, false, false, CoD.TweenType.Linear )
								MiddleMeter:setTopBottom( true, false, 95.5, 203 )
								MiddleMeter:registerEventHandler( "transition_complete_keyframe", MiddleMeterFrame5 )
							end
						end
						
						if event.interrupted then
							MiddleMeterFrame4( MiddleMeter, event )
							return 
						else
							MiddleMeter:beginAnimation( "keyframe", 539, false, false, CoD.TweenType.Linear )
							MiddleMeter:setTopBottom( true, false, 66.5, 203 )
							MiddleMeter:registerEventHandler( "transition_complete_keyframe", MiddleMeterFrame4 )
						end
					end
					
					if event.interrupted then
						MiddleMeterFrame3( MiddleMeter, event )
						return 
					else
						MiddleMeter:beginAnimation( "keyframe", 639, false, false, CoD.TweenType.Linear )
						MiddleMeter:setTopBottom( true, false, 77.5, 203 )
						MiddleMeter:registerEventHandler( "transition_complete_keyframe", MiddleMeterFrame3 )
					end
				end
				
				MiddleMeter:completeAnimation()
				self.MiddleMeter:setLeftRight( true, false, 19.5, 56.5 )
				self.MiddleMeter:setTopBottom( true, false, 67.5, 203 )
				MiddleMeterFrame2( MiddleMeter, {} )
				local RightMeterFrame2 = function ( RightMeter, event )
					local RightMeterFrame3 = function ( RightMeter, event )
						local RightMeterFrame4 = function ( RightMeter, event )
							local RightMeterFrame5 = function ( RightMeter, event )
								if not event.interrupted then
									RightMeter:beginAnimation( "keyframe", 780, false, false, CoD.TweenType.Linear )
								end
								RightMeter:setLeftRight( true, false, 39.5, 76.5 )
								RightMeter:setTopBottom( true, false, 57.5, 203 )
								if event.interrupted then
									self.clipFinished( RightMeter, event )
								else
									RightMeter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								RightMeterFrame5( RightMeter, event )
								return 
							else
								RightMeter:beginAnimation( "keyframe", 939, false, false, CoD.TweenType.Linear )
								RightMeter:setTopBottom( true, false, 64.5, 203 )
								RightMeter:registerEventHandler( "transition_complete_keyframe", RightMeterFrame5 )
							end
						end
						
						if event.interrupted then
							RightMeterFrame4( RightMeter, event )
							return 
						else
							RightMeter:beginAnimation( "keyframe", 1140, false, false, CoD.TweenType.Linear )
							RightMeter:setTopBottom( true, false, 52.5, 203 )
							RightMeter:registerEventHandler( "transition_complete_keyframe", RightMeterFrame4 )
						end
					end
					
					if event.interrupted then
						RightMeterFrame3( RightMeter, event )
						return 
					else
						RightMeter:beginAnimation( "keyframe", 1029, false, false, CoD.TweenType.Linear )
						RightMeter:setTopBottom( true, false, 65.5, 203 )
						RightMeter:registerEventHandler( "transition_complete_keyframe", RightMeterFrame3 )
					end
				end
				
				RightMeter:completeAnimation()
				self.RightMeter:setLeftRight( true, false, 39.5, 76.5 )
				self.RightMeter:setTopBottom( true, false, 57.5, 203 )
				RightMeterFrame2( RightMeter, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	self.close = function ( self )
		self.LeftMeter:close()
		self.MiddleMeter:close()
		self.RightMeter:close()
		CoD.NasserInterviewWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

