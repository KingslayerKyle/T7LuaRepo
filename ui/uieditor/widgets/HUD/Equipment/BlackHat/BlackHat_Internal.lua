-- f27b89f35087a80f7026a359d3267196
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.Equipment.BlackHat.HackingBar" )
require( "ui.uieditor.widgets.HUD.BlackHat.WaveformBlackHat" )
require( "ui.uieditor.widgets.HUD.BlackHat.blackhatEmp" )

CoD.BlackhatStatus = {}
CoD.BlackhatStatus.Scanning = 0
CoD.BlackhatStatus.Breaching = 1
CoD.BlackhatStatus.Hacking = 2
local PreLoadFunc = function ( self, controller )
	local f1_local0 = Engine.CreateModel( Engine.GetModelForController( controller ), "hudItems.blackhat" )
	local f1_local1 = Engine.CreateModel( f1_local0, "perc" )
	local f1_local2 = Engine.CreateModel( f1_local0, "offsetShaderValue" )
	local f1_local3 = Engine.CreateModel( f1_local0, "status" )
	Engine.SetModelValue( f1_local1, 0 )
	Engine.SetModelValue( f1_local2, "0 0 0 0" )
	Engine.SetModelValue( f1_local3, 0 )
end

CoD.BlackHat_Internal = InheritFrom( LUI.UIElement )
CoD.BlackHat_Internal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BlackHat_Internal )
	self.id = "BlackHat_Internal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 256 )
	self:setTopBottom( true, false, 0, 256 )
	self.anyChildUsesUpdateState = true
	
	local BLACKBG = LUI.UIImage.new()
	BLACKBG:setLeftRight( true, true, -24, 26 )
	BLACKBG:setTopBottom( true, true, 0, 0 )
	BLACKBG:setRGB( 0, 0, 0 )
	self:addElement( BLACKBG )
	self.BLACKBG = BLACKBG
	
	local BgScanning = LUI.UIImage.new()
	BgScanning:setLeftRight( true, true, -24, 26 )
	BgScanning:setTopBottom( true, true, 0, 0 )
	BgScanning:setImage( RegisterImage( "uie_t7_hud_blackhat_bg_scanning" ) )
	self:addElement( BgScanning )
	self.BgScanning = BgScanning
	
	local BgScanningDetail = LUI.UIImage.new()
	BgScanningDetail:setLeftRight( true, true, -24, 26 )
	BgScanningDetail:setTopBottom( true, true, 0, 0 )
	BgScanningDetail:setImage( RegisterImage( "uie_t7_hud_blackhat_bg_scanningdetail" ) )
	self:addElement( BgScanningDetail )
	self.BgScanningDetail = BgScanningDetail
	
	local BgHacking = LUI.UIImage.new()
	BgHacking:setLeftRight( true, true, -24, 26 )
	BgHacking:setTopBottom( true, true, 0, 0 )
	BgHacking:setAlpha( 0 )
	BgHacking:setImage( RegisterImage( "uie_t7_hud_blackhat_bg_hacking" ) )
	self:addElement( BgHacking )
	self.BgHacking = BgHacking
	
	local BgHackingDetail = LUI.UIImage.new()
	BgHackingDetail:setLeftRight( true, true, -24, 26 )
	BgHackingDetail:setTopBottom( true, true, 0, 0 )
	BgHackingDetail:setAlpha( 0 )
	BgHackingDetail:setImage( RegisterImage( "uie_t7_hud_blackhat_bg_hackingdetail" ) )
	self:addElement( BgHackingDetail )
	self.BgHackingDetail = BgHackingDetail
	
	local BgBreaching = LUI.UIImage.new()
	BgBreaching:setLeftRight( true, true, -24, 26 )
	BgBreaching:setTopBottom( true, true, 0, 0 )
	BgBreaching:setAlpha( 0 )
	BgBreaching:setImage( RegisterImage( "uie_t7_hud_blackhat_bg_breaching" ) )
	self:addElement( BgBreaching )
	self.BgBreaching = BgBreaching
	
	local BgBreachingDetail = LUI.UIImage.new()
	BgBreachingDetail:setLeftRight( true, true, -24, 26 )
	BgBreachingDetail:setTopBottom( true, true, 0, 0 )
	BgBreachingDetail:setAlpha( 0 )
	BgBreachingDetail:setImage( RegisterImage( "uie_t7_hud_blackhat_bg_breachingdetail" ) )
	self:addElement( BgBreachingDetail )
	self.BgBreachingDetail = BgBreachingDetail
	
	local BgError = LUI.UIImage.new()
	BgError:setLeftRight( true, false, -24, 282 )
	BgError:setTopBottom( true, false, 0, 256 )
	BgError:setAlpha( 0 )
	BgError:setImage( RegisterImage( "uie_t7_hud_blackhat_bg_error" ) )
	self:addElement( BgError )
	self.BgError = BgError
	
	local BgErrorDetail = LUI.UIImage.new()
	BgErrorDetail:setLeftRight( true, false, -24, 283 )
	BgErrorDetail:setTopBottom( true, false, 0, 256 )
	BgErrorDetail:setAlpha( 0 )
	BgErrorDetail:setImage( RegisterImage( "uie_t7_hud_blackhat_bg_errordetail" ) )
	self:addElement( BgErrorDetail )
	self.BgErrorDetail = BgErrorDetail
	
	local BgErrorXmarks = LUI.UIImage.new()
	BgErrorXmarks:setLeftRight( true, false, -24, 283 )
	BgErrorXmarks:setTopBottom( true, false, 0, 256 )
	BgErrorXmarks:setAlpha( 0 )
	BgErrorXmarks:setImage( RegisterImage( "uie_t7_hud_blackhat_bg_error_xmarks" ) )
	self:addElement( BgErrorXmarks )
	self.BgErrorXmarks = BgErrorXmarks
	
	local BgErrorStripes = LUI.UIImage.new()
	BgErrorStripes:setLeftRight( true, false, -24, 283 )
	BgErrorStripes:setTopBottom( true, false, 0, 256 )
	BgErrorStripes:setAlpha( 0 )
	BgErrorStripes:setImage( RegisterImage( "uie_t7_hud_blackhat_bg_error_stripes" ) )
	self:addElement( BgErrorStripes )
	self.BgErrorStripes = BgErrorStripes
	
	local BgErrorIcon = LUI.UIImage.new()
	BgErrorIcon:setLeftRight( true, false, -24, 283 )
	BgErrorIcon:setTopBottom( true, false, 0, 256 )
	BgErrorIcon:setAlpha( 0 )
	BgErrorIcon:setImage( RegisterImage( "uie_t7_hud_blackhat_bg_error_icon" ) )
	self:addElement( BgErrorIcon )
	self.BgErrorIcon = BgErrorIcon
	
	local BfErrorIconGlow = LUI.UIImage.new()
	BfErrorIconGlow:setLeftRight( true, false, -24, 283 )
	BfErrorIconGlow:setTopBottom( true, false, 0, 256 )
	BfErrorIconGlow:setAlpha( 0 )
	BfErrorIconGlow:setImage( RegisterImage( "uie_t7_hud_blackhat_bg_error_iconglow" ) )
	self:addElement( BfErrorIconGlow )
	self.BfErrorIconGlow = BfErrorIconGlow
	
	local IconScanning = LUI.UIImage.new()
	IconScanning:setLeftRight( true, true, -6, -197 )
	IconScanning:setTopBottom( true, true, 165.5, 0 )
	IconScanning:setAlpha( 0 )
	IconScanning:setScale( 0.8 )
	IconScanning:setImage( RegisterImage( "uie_t7_hud_blackhat_iconscanning" ) )
	self:addElement( IconScanning )
	self.IconScanning = IconScanning
	
	local IconBreaching = LUI.UIImage.new()
	IconBreaching:setLeftRight( true, true, -6, -197 )
	IconBreaching:setTopBottom( true, true, 165.5, 0 )
	IconBreaching:setAlpha( 0 )
	IconBreaching:setScale( 0.8 )
	IconBreaching:setImage( RegisterImage( "uie_t7_hud_blackhat_iconbreaching" ) )
	self:addElement( IconBreaching )
	self.IconBreaching = IconBreaching
	
	local IconHacking = LUI.UIImage.new()
	IconHacking:setLeftRight( true, true, -6, -197 )
	IconHacking:setTopBottom( true, true, 165.5, 0 )
	IconHacking:setAlpha( 0 )
	IconHacking:setScale( 0.8 )
	IconHacking:setImage( RegisterImage( "uie_t7_hud_blackhat_iconhacking" ) )
	self:addElement( IconHacking )
	self.IconHacking = IconHacking
	
	local StatusText = LUI.UIText.new()
	StatusText:setLeftRight( true, false, 16, 240 )
	StatusText:setTopBottom( true, false, 198, 222 )
	StatusText:setText( Engine.Localize( "" ) )
	StatusText:setTTF( "fonts/default.ttf" )
	StatusText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	StatusText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( StatusText )
	self.StatusText = StatusText
	
	local PercentText = LUI.UIText.new()
	PercentText:setLeftRight( true, false, 216.5, 251.5 )
	PercentText:setTopBottom( true, false, 197.5, 222.5 )
	PercentText:setTTF( "fonts/default.ttf" )
	PercentText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	PercentText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	PercentText:subscribeToGlobalModel( controller, "Blackhat", "perc", function ( model )
		local perc = Engine.GetModelValue( model )
		if perc then
			PercentText:setText( BlackhatHackingPercentage( perc ) )
		end
	end )
	self:addElement( PercentText )
	self.PercentText = PercentText
	
	local Spinner = LUI.UIImage.new()
	Spinner:setLeftRight( true, false, 5, 50 )
	Spinner:setTopBottom( true, false, 186, 234 )
	Spinner:setRGB( 0.85, 0.09, 0.73 )
	Spinner:setAlpha( 0 )
	self:addElement( Spinner )
	self.Spinner = Spinner
	
	local HackingBarRight = CoD.HackingBar.new( menu, controller )
	HackingBarRight:setLeftRight( true, false, 206, 283 )
	HackingBarRight:setTopBottom( true, false, 41, 156 )
	self:addElement( HackingBarRight )
	self.HackingBarRight = HackingBarRight
	
	local HackingBarLeft = CoD.HackingBar.new( menu, controller )
	HackingBarLeft:setLeftRight( true, false, -26.5, 50.5 )
	HackingBarLeft:setTopBottom( true, false, 41, 156 )
	HackingBarLeft:setYRot( 180 )
	self:addElement( HackingBarLeft )
	self.HackingBarLeft = HackingBarLeft
	
	local WaveformBlackHat = CoD.WaveformBlackHat.new( menu, controller )
	WaveformBlackHat:setLeftRight( true, false, 25, 231 )
	WaveformBlackHat:setTopBottom( true, false, 13, 186 )
	self:addElement( WaveformBlackHat )
	self.WaveformBlackHat = WaveformBlackHat
	
	local blackhatEmp0 = CoD.blackhatEmp.new( menu, controller )
	blackhatEmp0:setLeftRight( false, false, -99.46, 103 )
	blackhatEmp0:setTopBottom( false, false, -84, 84 )
	blackhatEmp0:setAlpha( 0 )
	blackhatEmp0:setScale( 1.5 )
	self:addElement( blackhatEmp0 )
	self.blackhatEmp0 = blackhatEmp0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 22 )
				BgScanning:completeAnimation()
				self.BgScanning:setAlpha( 1 )
				self.clipFinished( BgScanning, {} )
				local BgScanningDetailFrame2 = function ( BgScanningDetail, event )
					local BgScanningDetailFrame3 = function ( BgScanningDetail, event )
						local BgScanningDetailFrame4 = function ( BgScanningDetail, event )
							local BgScanningDetailFrame5 = function ( BgScanningDetail, event )
								local BgScanningDetailFrame6 = function ( BgScanningDetail, event )
									local BgScanningDetailFrame7 = function ( BgScanningDetail, event )
										local BgScanningDetailFrame8 = function ( BgScanningDetail, event )
											if not event.interrupted then
												BgScanningDetail:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
											end
											BgScanningDetail:setAlpha( 1 )
											BgScanningDetail:setScale( 1 )
											if event.interrupted then
												self.clipFinished( BgScanningDetail, event )
											else
												BgScanningDetail:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											BgScanningDetailFrame8( BgScanningDetail, event )
											return 
										else
											BgScanningDetail:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											BgScanningDetail:setAlpha( 0.5 )
											BgScanningDetail:registerEventHandler( "transition_complete_keyframe", BgScanningDetailFrame8 )
										end
									end
									
									if event.interrupted then
										BgScanningDetailFrame7( BgScanningDetail, event )
										return 
									else
										BgScanningDetail:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										BgScanningDetail:setAlpha( 1 )
										BgScanningDetail:registerEventHandler( "transition_complete_keyframe", BgScanningDetailFrame7 )
									end
								end
								
								if event.interrupted then
									BgScanningDetailFrame6( BgScanningDetail, event )
									return 
								else
									BgScanningDetail:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
									BgScanningDetail:setAlpha( 0.5 )
									BgScanningDetail:registerEventHandler( "transition_complete_keyframe", BgScanningDetailFrame6 )
								end
							end
							
							if event.interrupted then
								BgScanningDetailFrame5( BgScanningDetail, event )
								return 
							else
								BgScanningDetail:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								BgScanningDetail:setAlpha( 1 )
								BgScanningDetail:registerEventHandler( "transition_complete_keyframe", BgScanningDetailFrame5 )
							end
						end
						
						if event.interrupted then
							BgScanningDetailFrame4( BgScanningDetail, event )
							return 
						else
							BgScanningDetail:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							BgScanningDetail:setAlpha( 0.5 )
							BgScanningDetail:registerEventHandler( "transition_complete_keyframe", BgScanningDetailFrame4 )
						end
					end
					
					if event.interrupted then
						BgScanningDetailFrame3( BgScanningDetail, event )
						return 
					else
						BgScanningDetail:beginAnimation( "keyframe", 610, true, false, CoD.TweenType.Linear )
						BgScanningDetail:setAlpha( 1 )
						BgScanningDetail:setScale( 1 )
						BgScanningDetail:registerEventHandler( "transition_complete_keyframe", BgScanningDetailFrame3 )
					end
				end
				
				BgScanningDetail:completeAnimation()
				self.BgScanningDetail:setAlpha( 0 )
				self.BgScanningDetail:setScale( 0.93 )
				BgScanningDetailFrame2( BgScanningDetail, {} )
				BgHacking:completeAnimation()
				self.BgHacking:setAlpha( 0 )
				self.clipFinished( BgHacking, {} )
				BgHackingDetail:completeAnimation()
				self.BgHackingDetail:setAlpha( 0 )
				self.clipFinished( BgHackingDetail, {} )
				BgBreaching:completeAnimation()
				self.BgBreaching:setAlpha( 0 )
				self.clipFinished( BgBreaching, {} )
				BgBreachingDetail:completeAnimation()
				self.BgBreachingDetail:setAlpha( 0 )
				self.clipFinished( BgBreachingDetail, {} )
				BgError:completeAnimation()
				self.BgError:setAlpha( 0 )
				self.clipFinished( BgError, {} )
				BgErrorDetail:completeAnimation()
				self.BgErrorDetail:setAlpha( 0 )
				self.clipFinished( BgErrorDetail, {} )
				BgErrorXmarks:completeAnimation()
				self.BgErrorXmarks:setAlpha( 0 )
				self.BgErrorXmarks:setScale( 1 )
				self.clipFinished( BgErrorXmarks, {} )
				BgErrorStripes:completeAnimation()
				self.BgErrorStripes:setAlpha( 0 )
				self.clipFinished( BgErrorStripes, {} )
				BgErrorIcon:completeAnimation()
				self.BgErrorIcon:setAlpha( 0 )
				self.BgErrorIcon:setScale( 1 )
				self.clipFinished( BgErrorIcon, {} )
				BfErrorIconGlow:completeAnimation()
				self.BfErrorIconGlow:setAlpha( 0 )
				self.clipFinished( BfErrorIconGlow, {} )
				local f4_local1 = function ( f12_arg0, f12_arg1 )
					if not f12_arg1.interrupted then
						f12_arg0:beginAnimation( "keyframe", 450, true, false, CoD.TweenType.Linear )
					end
					f12_arg0:setAlpha( 1 )
					f12_arg0:setScale( 1 )
					if f12_arg1.interrupted then
						self.clipFinished( f12_arg0, f12_arg1 )
					else
						f12_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				IconScanning:beginAnimation( "keyframe", 419, false, false, CoD.TweenType.Linear )
				IconScanning:setAlpha( 0 )
				IconScanning:setScale( 0.9 )
				IconScanning:registerEventHandler( "transition_complete_keyframe", f4_local1 )
				IconBreaching:completeAnimation()
				self.IconBreaching:setAlpha( 0 )
				self.IconBreaching:setScale( 0.8 )
				self.clipFinished( IconBreaching, {} )
				IconHacking:completeAnimation()
				self.IconHacking:setAlpha( 0 )
				self.IconHacking:setScale( 0.8 )
				self.clipFinished( IconHacking, {} )
				local StatusTextFrame2 = function ( StatusText, event )
					if not event.interrupted then
						StatusText:beginAnimation( "keyframe", 870, false, false, CoD.TweenType.Linear )
					end
					StatusText:setAlpha( 1 )
					StatusText:setText( Engine.Localize( "MPUI_BLACKHAT_SCANNING" ) )
					if event.interrupted then
						self.clipFinished( StatusText, event )
					else
						StatusText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				StatusText:completeAnimation()
				self.StatusText:setAlpha( 1 )
				self.StatusText:setText( Engine.Localize( "MPUI_BLACKHAT_SCANNING" ) )
				StatusTextFrame2( StatusText, {} )
				PercentText:beginAnimation( "keyframe", 870, false, false, CoD.TweenType.Linear )
				PercentText:setAlpha( 1 )
				PercentText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				Spinner:completeAnimation()
				self.Spinner:setAlpha( 0 )
				self.clipFinished( Spinner, {} )
				HackingBarRight:completeAnimation()
				self.HackingBarRight:setAlpha( 1 )
				self.clipFinished( HackingBarRight, {} )
				HackingBarLeft:completeAnimation()
				self.HackingBarLeft:setAlpha( 1 )
				self.clipFinished( HackingBarLeft, {} )
				WaveformBlackHat:completeAnimation()
				self.WaveformBlackHat:setAlpha( 1 )
				self.clipFinished( WaveformBlackHat, {} )
				blackhatEmp0:completeAnimation()
				self.blackhatEmp0:setAlpha( 0 )
				self.clipFinished( blackhatEmp0, {} )
			end
		},
		TeamHacking = {
			DefaultClip = function ()
				self:setupElementClipCounter( 22 )
				BgScanning:completeAnimation()
				self.BgScanning:setAlpha( 0 )
				self.clipFinished( BgScanning, {} )
				BgScanningDetail:completeAnimation()
				self.BgScanningDetail:setAlpha( 0 )
				self.BgScanningDetail:setScale( 1 )
				self.clipFinished( BgScanningDetail, {} )
				local BgHackingFrame2 = function ( BgHacking, event )
					if not event.interrupted then
						BgHacking:beginAnimation( "keyframe", 730, false, false, CoD.TweenType.Linear )
					end
					BgHacking:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BgHacking, event )
					else
						BgHacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BgHacking:completeAnimation()
				self.BgHacking:setAlpha( 0 )
				BgHackingFrame2( BgHacking, {} )
				local BgHackingDetailFrame2 = function ( BgHackingDetail, event )
					if not event.interrupted then
						BgHackingDetail:beginAnimation( "keyframe", 730, true, false, CoD.TweenType.Bounce )
					end
					BgHackingDetail:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BgHackingDetail, event )
					else
						BgHackingDetail:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BgHackingDetail:completeAnimation()
				self.BgHackingDetail:setAlpha( 0 )
				BgHackingDetailFrame2( BgHackingDetail, {} )
				BgBreaching:completeAnimation()
				self.BgBreaching:setAlpha( 0 )
				self.clipFinished( BgBreaching, {} )
				BgBreachingDetail:completeAnimation()
				self.BgBreachingDetail:setAlpha( 0 )
				self.clipFinished( BgBreachingDetail, {} )
				BgError:completeAnimation()
				self.BgError:setAlpha( 0 )
				self.clipFinished( BgError, {} )
				BgErrorDetail:completeAnimation()
				self.BgErrorDetail:setAlpha( 0 )
				self.clipFinished( BgErrorDetail, {} )
				BgErrorXmarks:completeAnimation()
				self.BgErrorXmarks:setAlpha( 0 )
				self.BgErrorXmarks:setScale( 1 )
				self.clipFinished( BgErrorXmarks, {} )
				BgErrorStripes:completeAnimation()
				self.BgErrorStripes:setAlpha( 0 )
				self.clipFinished( BgErrorStripes, {} )
				BgErrorIcon:completeAnimation()
				self.BgErrorIcon:setAlpha( 0 )
				self.BgErrorIcon:setScale( 1 )
				self.clipFinished( BgErrorIcon, {} )
				BfErrorIconGlow:completeAnimation()
				self.BfErrorIconGlow:setAlpha( 0 )
				self.clipFinished( BfErrorIconGlow, {} )
				IconScanning:completeAnimation()
				self.IconScanning:setAlpha( 0 )
				self.IconScanning:setScale( 0.8 )
				self.clipFinished( IconScanning, {} )
				IconBreaching:completeAnimation()
				self.IconBreaching:setAlpha( 0 )
				self.IconBreaching:setScale( 0.8 )
				self.clipFinished( IconBreaching, {} )
				local f14_local2 = function ( f17_arg0, f17_arg1 )
					if not f17_arg1.interrupted then
						f17_arg0:beginAnimation( "keyframe", 310, true, false, CoD.TweenType.Linear )
					end
					f17_arg0:setAlpha( 1 )
					f17_arg0:setScale( 1 )
					if f17_arg1.interrupted then
						self.clipFinished( f17_arg0, f17_arg1 )
					else
						f17_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				IconHacking:beginAnimation( "keyframe", 419, false, false, CoD.TweenType.Linear )
				IconHacking:setAlpha( 0 )
				IconHacking:setScale( 0.9 )
				IconHacking:registerEventHandler( "transition_complete_keyframe", f14_local2 )
				local StatusTextFrame2 = function ( StatusText, event )
					if not event.interrupted then
						StatusText:beginAnimation( "keyframe", 870, false, false, CoD.TweenType.Linear )
					end
					StatusText:setAlpha( 1 )
					StatusText:setText( Engine.Localize( "MPUI_BLACKHAT_TEAM_HACKING" ) )
					if event.interrupted then
						self.clipFinished( StatusText, event )
					else
						StatusText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				StatusText:completeAnimation()
				self.StatusText:setAlpha( 1 )
				self.StatusText:setText( Engine.Localize( "MPUI_BLACKHAT_TEAM_HACKING" ) )
				StatusTextFrame2( StatusText, {} )
				PercentText:beginAnimation( "keyframe", 870, false, false, CoD.TweenType.Linear )
				PercentText:setAlpha( 1 )
				PercentText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				Spinner:completeAnimation()
				self.Spinner:setAlpha( 0 )
				self.clipFinished( Spinner, {} )
				HackingBarRight:completeAnimation()
				self.HackingBarRight:setAlpha( 1 )
				self.clipFinished( HackingBarRight, {} )
				HackingBarLeft:completeAnimation()
				self.HackingBarLeft:setAlpha( 1 )
				self.clipFinished( HackingBarLeft, {} )
				WaveformBlackHat:completeAnimation()
				self.WaveformBlackHat:setAlpha( 1 )
				self.clipFinished( WaveformBlackHat, {} )
				blackhatEmp0:completeAnimation()
				self.blackhatEmp0:setAlpha( 0 )
				self.clipFinished( blackhatEmp0, {} )
			end
		},
		Hacking = {
			DefaultClip = function ()
				self:setupElementClipCounter( 22 )
				BgScanning:completeAnimation()
				self.BgScanning:setAlpha( 0 )
				self.clipFinished( BgScanning, {} )
				BgScanningDetail:completeAnimation()
				self.BgScanningDetail:setAlpha( 0 )
				self.BgScanningDetail:setScale( 1 )
				self.clipFinished( BgScanningDetail, {} )
				local BgHackingFrame2 = function ( BgHacking, event )
					if not event.interrupted then
						BgHacking:beginAnimation( "keyframe", 730, false, false, CoD.TweenType.Linear )
					end
					BgHacking:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BgHacking, event )
					else
						BgHacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BgHacking:completeAnimation()
				self.BgHacking:setAlpha( 0 )
				BgHackingFrame2( BgHacking, {} )
				local BgHackingDetailFrame2 = function ( BgHackingDetail, event )
					if not event.interrupted then
						BgHackingDetail:beginAnimation( "keyframe", 730, true, false, CoD.TweenType.Bounce )
					end
					BgHackingDetail:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BgHackingDetail, event )
					else
						BgHackingDetail:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BgHackingDetail:completeAnimation()
				self.BgHackingDetail:setAlpha( 0 )
				BgHackingDetailFrame2( BgHackingDetail, {} )
				BgBreaching:completeAnimation()
				self.BgBreaching:setAlpha( 0 )
				self.clipFinished( BgBreaching, {} )
				BgBreachingDetail:completeAnimation()
				self.BgBreachingDetail:setAlpha( 0 )
				self.clipFinished( BgBreachingDetail, {} )
				BgError:completeAnimation()
				self.BgError:setAlpha( 0 )
				self.clipFinished( BgError, {} )
				BgErrorDetail:completeAnimation()
				self.BgErrorDetail:setAlpha( 0 )
				self.clipFinished( BgErrorDetail, {} )
				BgErrorXmarks:completeAnimation()
				self.BgErrorXmarks:setAlpha( 0 )
				self.BgErrorXmarks:setScale( 1 )
				self.clipFinished( BgErrorXmarks, {} )
				BgErrorStripes:completeAnimation()
				self.BgErrorStripes:setAlpha( 0 )
				self.clipFinished( BgErrorStripes, {} )
				BgErrorIcon:completeAnimation()
				self.BgErrorIcon:setAlpha( 0 )
				self.BgErrorIcon:setScale( 1 )
				self.clipFinished( BgErrorIcon, {} )
				BfErrorIconGlow:completeAnimation()
				self.BfErrorIconGlow:setAlpha( 0 )
				self.clipFinished( BfErrorIconGlow, {} )
				IconScanning:completeAnimation()
				self.IconScanning:setAlpha( 0 )
				self.IconScanning:setScale( 0.8 )
				self.clipFinished( IconScanning, {} )
				IconBreaching:completeAnimation()
				self.IconBreaching:setAlpha( 0 )
				self.IconBreaching:setScale( 0.8 )
				self.clipFinished( IconBreaching, {} )
				local f19_local2 = function ( f22_arg0, f22_arg1 )
					if not f22_arg1.interrupted then
						f22_arg0:beginAnimation( "keyframe", 310, true, false, CoD.TweenType.Linear )
					end
					f22_arg0:setAlpha( 1 )
					f22_arg0:setScale( 1 )
					if f22_arg1.interrupted then
						self.clipFinished( f22_arg0, f22_arg1 )
					else
						f22_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				IconHacking:beginAnimation( "keyframe", 419, false, false, CoD.TweenType.Linear )
				IconHacking:setAlpha( 0 )
				IconHacking:setScale( 0.9 )
				IconHacking:registerEventHandler( "transition_complete_keyframe", f19_local2 )
				local StatusTextFrame2 = function ( StatusText, event )
					if not event.interrupted then
						StatusText:beginAnimation( "keyframe", 870, false, false, CoD.TweenType.Linear )
					end
					StatusText:setAlpha( 1 )
					StatusText:setText( Engine.Localize( "MPUI_BLACKHAT_HACKING" ) )
					if event.interrupted then
						self.clipFinished( StatusText, event )
					else
						StatusText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				StatusText:completeAnimation()
				self.StatusText:setAlpha( 1 )
				self.StatusText:setText( Engine.Localize( "MPUI_BLACKHAT_HACKING" ) )
				StatusTextFrame2( StatusText, {} )
				PercentText:beginAnimation( "keyframe", 870, false, false, CoD.TweenType.Linear )
				PercentText:setAlpha( 1 )
				PercentText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				Spinner:completeAnimation()
				self.Spinner:setAlpha( 0 )
				self.clipFinished( Spinner, {} )
				HackingBarRight:completeAnimation()
				self.HackingBarRight:setAlpha( 1 )
				self.clipFinished( HackingBarRight, {} )
				HackingBarLeft:completeAnimation()
				self.HackingBarLeft:setAlpha( 1 )
				self.clipFinished( HackingBarLeft, {} )
				WaveformBlackHat:completeAnimation()
				self.WaveformBlackHat:setAlpha( 1 )
				self.clipFinished( WaveformBlackHat, {} )
				blackhatEmp0:completeAnimation()
				self.blackhatEmp0:setAlpha( 0 )
				self.clipFinished( blackhatEmp0, {} )
			end
		},
		Breaching = {
			DefaultClip = function ()
				self:setupElementClipCounter( 22 )
				BgScanning:completeAnimation()
				self.BgScanning:setAlpha( 1 )
				self.clipFinished( BgScanning, {} )
				BgScanningDetail:completeAnimation()
				self.BgScanningDetail:setAlpha( 1 )
				self.BgScanningDetail:setScale( 1 )
				self.clipFinished( BgScanningDetail, {} )
				BgHacking:completeAnimation()
				self.BgHacking:setAlpha( 0 )
				self.clipFinished( BgHacking, {} )
				BgHackingDetail:completeAnimation()
				self.BgHackingDetail:setAlpha( 0 )
				self.clipFinished( BgHackingDetail, {} )
				local BgBreachingFrame2 = function ( BgBreaching, event )
					if not event.interrupted then
						BgBreaching:beginAnimation( "keyframe", 730, false, false, CoD.TweenType.Linear )
					end
					BgBreaching:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BgBreaching, event )
					else
						BgBreaching:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BgBreaching:completeAnimation()
				self.BgBreaching:setAlpha( 0 )
				BgBreachingFrame2( BgBreaching, {} )
				local BgBreachingDetailFrame2 = function ( BgBreachingDetail, event )
					if not event.interrupted then
						BgBreachingDetail:beginAnimation( "keyframe", 730, true, false, CoD.TweenType.Bounce )
					end
					BgBreachingDetail:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BgBreachingDetail, event )
					else
						BgBreachingDetail:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BgBreachingDetail:completeAnimation()
				self.BgBreachingDetail:setAlpha( 0 )
				BgBreachingDetailFrame2( BgBreachingDetail, {} )
				BgError:completeAnimation()
				self.BgError:setAlpha( 0 )
				self.clipFinished( BgError, {} )
				BgErrorDetail:completeAnimation()
				self.BgErrorDetail:setAlpha( 0 )
				self.clipFinished( BgErrorDetail, {} )
				BgErrorXmarks:completeAnimation()
				self.BgErrorXmarks:setAlpha( 0 )
				self.BgErrorXmarks:setScale( 1 )
				self.clipFinished( BgErrorXmarks, {} )
				BgErrorStripes:completeAnimation()
				self.BgErrorStripes:setAlpha( 0 )
				self.clipFinished( BgErrorStripes, {} )
				BgErrorIcon:completeAnimation()
				self.BgErrorIcon:setAlpha( 0 )
				self.BgErrorIcon:setScale( 1 )
				self.clipFinished( BgErrorIcon, {} )
				BfErrorIconGlow:completeAnimation()
				self.BfErrorIconGlow:setAlpha( 0 )
				self.clipFinished( BfErrorIconGlow, {} )
				local IconScanningFrame2 = function ( IconScanning, event )
					if not event.interrupted then
						IconScanning:beginAnimation( "keyframe", 870, false, false, CoD.TweenType.Linear )
					end
					IconScanning:setAlpha( 0 )
					IconScanning:setScale( 0.8 )
					if event.interrupted then
						self.clipFinished( IconScanning, event )
					else
						IconScanning:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				IconScanning:completeAnimation()
				self.IconScanning:setAlpha( 1 )
				self.IconScanning:setScale( 0.8 )
				IconScanningFrame2( IconScanning, {} )
				local f24_local3 = function ( f28_arg0, f28_arg1 )
					if not f28_arg1.interrupted then
						f28_arg0:beginAnimation( "keyframe", 220, true, false, CoD.TweenType.Linear )
					end
					f28_arg0:setAlpha( 1 )
					f28_arg0:setScale( 1 )
					if f28_arg1.interrupted then
						self.clipFinished( f28_arg0, f28_arg1 )
					else
						f28_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				IconBreaching:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
				IconBreaching:setAlpha( 0 )
				IconBreaching:setScale( 0.9 )
				IconBreaching:registerEventHandler( "transition_complete_keyframe", f24_local3 )
				IconHacking:completeAnimation()
				self.IconHacking:setAlpha( 0 )
				self.IconHacking:setScale( 0.8 )
				self.clipFinished( IconHacking, {} )
				local StatusTextFrame2 = function ( StatusText, event )
					if not event.interrupted then
						StatusText:beginAnimation( "keyframe", 870, false, false, CoD.TweenType.Linear )
					end
					StatusText:setAlpha( 1 )
					StatusText:setText( Engine.Localize( "MPUI_BLACKHAT_BREACHING" ) )
					if event.interrupted then
						self.clipFinished( StatusText, event )
					else
						StatusText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				StatusText:completeAnimation()
				self.StatusText:setAlpha( 1 )
				self.StatusText:setText( Engine.Localize( "MPUI_BLACKHAT_BREACHING" ) )
				StatusTextFrame2( StatusText, {} )
				PercentText:beginAnimation( "keyframe", 870, false, false, CoD.TweenType.Linear )
				PercentText:setAlpha( 1 )
				PercentText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				Spinner:completeAnimation()
				self.Spinner:setAlpha( 0 )
				self.clipFinished( Spinner, {} )
				HackingBarRight:completeAnimation()
				self.HackingBarRight:setAlpha( 1 )
				self.clipFinished( HackingBarRight, {} )
				HackingBarLeft:completeAnimation()
				self.HackingBarLeft:setAlpha( 1 )
				self.clipFinished( HackingBarLeft, {} )
				WaveformBlackHat:completeAnimation()
				self.WaveformBlackHat:setAlpha( 1 )
				self.clipFinished( WaveformBlackHat, {} )
				blackhatEmp0:completeAnimation()
				self.blackhatEmp0:setAlpha( 0 )
				self.clipFinished( blackhatEmp0, {} )
			end
		},
		Error = {
			DefaultClip = function ()
				self:setupElementClipCounter( 22 )
				BgScanning:completeAnimation()
				self.BgScanning:setAlpha( 1 )
				self.clipFinished( BgScanning, {} )
				BgScanningDetail:completeAnimation()
				self.BgScanningDetail:setAlpha( 1 )
				self.BgScanningDetail:setScale( 1 )
				self.clipFinished( BgScanningDetail, {} )
				BgHacking:completeAnimation()
				self.BgHacking:setAlpha( 0 )
				self.clipFinished( BgHacking, {} )
				BgHackingDetail:completeAnimation()
				self.BgHackingDetail:setAlpha( 0 )
				self.clipFinished( BgHackingDetail, {} )
				BgBreaching:completeAnimation()
				self.BgBreaching:setAlpha( 0 )
				self.clipFinished( BgBreaching, {} )
				BgBreachingDetail:completeAnimation()
				self.BgBreachingDetail:setAlpha( 0 )
				self.clipFinished( BgBreachingDetail, {} )
				local BgErrorFrame2 = function ( BgError, event )
					if not event.interrupted then
						BgError:beginAnimation( "keyframe", 699, true, false, CoD.TweenType.Linear )
					end
					BgError:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BgError, event )
					else
						BgError:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BgError:completeAnimation()
				self.BgError:setAlpha( 0 )
				BgErrorFrame2( BgError, {} )
				local BgErrorDetailFrame2 = function ( BgErrorDetail, event )
					if not event.interrupted then
						BgErrorDetail:beginAnimation( "keyframe", 699, true, false, CoD.TweenType.Bounce )
					end
					BgErrorDetail:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BgErrorDetail, event )
					else
						BgErrorDetail:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BgErrorDetail:completeAnimation()
				self.BgErrorDetail:setAlpha( 0 )
				BgErrorDetailFrame2( BgErrorDetail, {} )
				local f30_local2 = function ( f33_arg0, f33_arg1 )
					local f33_local0 = function ( f34_arg0, f34_arg1 )
						local f34_local0 = function ( f35_arg0, f35_arg1 )
							local f35_local0 = function ( f36_arg0, f36_arg1 )
								local f36_local0 = function ( f37_arg0, f37_arg1 )
									local f37_local0 = function ( f38_arg0, f38_arg1 )
										local f38_local0 = function ( f39_arg0, f39_arg1 )
											local f39_local0 = function ( f40_arg0, f40_arg1 )
												local f40_local0 = function ( f41_arg0, f41_arg1 )
													if not f41_arg1.interrupted then
														f41_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													end
													f41_arg0:setAlpha( 1 )
													f41_arg0:setScale( 1 )
													if f41_arg1.interrupted then
														self.clipFinished( f41_arg0, f41_arg1 )
													else
														f41_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if f40_arg1.interrupted then
													f40_local0( f40_arg0, f40_arg1 )
													return 
												else
													f40_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													f40_arg0:setAlpha( 0.5 )
													f40_arg0:registerEventHandler( "transition_complete_keyframe", f40_local0 )
												end
											end
											
											if f39_arg1.interrupted then
												f39_local0( f39_arg0, f39_arg1 )
												return 
											else
												f39_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
												f39_arg0:setAlpha( 1 )
												f39_arg0:registerEventHandler( "transition_complete_keyframe", f39_local0 )
											end
										end
										
										if f38_arg1.interrupted then
											f38_local0( f38_arg0, f38_arg1 )
											return 
										else
											f38_arg0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
											f38_arg0:setAlpha( 0.5 )
											f38_arg0:registerEventHandler( "transition_complete_keyframe", f38_local0 )
										end
									end
									
									if f37_arg1.interrupted then
										f37_local0( f37_arg0, f37_arg1 )
										return 
									else
										f37_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										f37_arg0:setAlpha( 1 )
										f37_arg0:registerEventHandler( "transition_complete_keyframe", f37_local0 )
									end
								end
								
								if f36_arg1.interrupted then
									f36_local0( f36_arg0, f36_arg1 )
									return 
								else
									f36_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									f36_arg0:setAlpha( 0.5 )
									f36_arg0:registerEventHandler( "transition_complete_keyframe", f36_local0 )
								end
							end
							
							if f35_arg1.interrupted then
								f35_local0( f35_arg0, f35_arg1 )
								return 
							else
								f35_arg0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								f35_arg0:setAlpha( 1 )
								f35_arg0:registerEventHandler( "transition_complete_keyframe", f35_local0 )
							end
						end
						
						if f34_arg1.interrupted then
							f34_local0( f34_arg0, f34_arg1 )
							return 
						else
							f34_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							f34_arg0:setAlpha( 0.5 )
							f34_arg0:registerEventHandler( "transition_complete_keyframe", f34_local0 )
						end
					end
					
					if f33_arg1.interrupted then
						f33_local0( f33_arg0, f33_arg1 )
						return 
					else
						f33_arg0:beginAnimation( "keyframe", 250, true, false, CoD.TweenType.Linear )
						f33_arg0:setAlpha( 1 )
						f33_arg0:setScale( 1 )
						f33_arg0:registerEventHandler( "transition_complete_keyframe", f33_local0 )
					end
				end
				
				BgErrorXmarks:beginAnimation( "keyframe", 620, false, false, CoD.TweenType.Linear )
				BgErrorXmarks:setAlpha( 0 )
				BgErrorXmarks:setScale( 0.9 )
				BgErrorXmarks:registerEventHandler( "transition_complete_keyframe", f30_local2 )
				local f30_local3 = function ( f42_arg0, f42_arg1 )
					if not f42_arg1.interrupted then
						f42_arg0:beginAnimation( "keyframe", 250, true, false, CoD.TweenType.Linear )
					end
					f42_arg0:setAlpha( 1 )
					if f42_arg1.interrupted then
						self.clipFinished( f42_arg0, f42_arg1 )
					else
						f42_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BgErrorStripes:beginAnimation( "keyframe", 620, false, false, CoD.TweenType.Linear )
				BgErrorStripes:setAlpha( 0 )
				BgErrorStripes:registerEventHandler( "transition_complete_keyframe", f30_local3 )
				local f30_local4 = function ( f43_arg0, f43_arg1 )
					if not f43_arg1.interrupted then
						f43_arg0:beginAnimation( "keyframe", 240, true, false, CoD.TweenType.Linear )
					end
					f43_arg0:setAlpha( 1 )
					f43_arg0:setScale( 1 )
					if f43_arg1.interrupted then
						self.clipFinished( f43_arg0, f43_arg1 )
					else
						f43_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BgErrorIcon:beginAnimation( "keyframe", 870, false, false, CoD.TweenType.Linear )
				BgErrorIcon:setAlpha( 0 )
				BgErrorIcon:setScale( 0.9 )
				BgErrorIcon:registerEventHandler( "transition_complete_keyframe", f30_local4 )
				local f30_local5 = function ( f44_arg0, f44_arg1 )
					local f44_local0 = function ( f45_arg0, f45_arg1 )
						local f45_local0 = function ( f46_arg0, f46_arg1 )
							local f46_local0 = function ( f47_arg0, f47_arg1 )
								local f47_local0 = function ( f48_arg0, f48_arg1 )
									if not f48_arg1.interrupted then
										f48_arg0:beginAnimation( "keyframe", 669, true, false, CoD.TweenType.Linear )
									end
									f48_arg0:setAlpha( 1 )
									if f48_arg1.interrupted then
										self.clipFinished( f48_arg0, f48_arg1 )
									else
										f48_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f47_arg1.interrupted then
									f47_local0( f47_arg0, f47_arg1 )
									return 
								else
									f47_arg0:beginAnimation( "keyframe", 670, false, true, CoD.TweenType.Linear )
									f47_arg0:setAlpha( 0 )
									f47_arg0:registerEventHandler( "transition_complete_keyframe", f47_local0 )
								end
							end
							
							if f46_arg1.interrupted then
								f46_local0( f46_arg0, f46_arg1 )
								return 
							else
								f46_arg0:beginAnimation( "keyframe", 680, true, false, CoD.TweenType.Linear )
								f46_arg0:setAlpha( 1 )
								f46_arg0:registerEventHandler( "transition_complete_keyframe", f46_local0 )
							end
						end
						
						if f45_arg1.interrupted then
							f45_local0( f45_arg0, f45_arg1 )
							return 
						else
							f45_arg0:beginAnimation( "keyframe", 669, false, true, CoD.TweenType.Linear )
							f45_arg0:setAlpha( 0.3 )
							f45_arg0:registerEventHandler( "transition_complete_keyframe", f45_local0 )
						end
					end
					
					if f44_arg1.interrupted then
						f44_local0( f44_arg0, f44_arg1 )
						return 
					else
						f44_arg0:beginAnimation( "keyframe", 710, true, false, CoD.TweenType.Linear )
						f44_arg0:setAlpha( 1 )
						f44_arg0:registerEventHandler( "transition_complete_keyframe", f44_local0 )
					end
				end
				
				BfErrorIconGlow:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
				BfErrorIconGlow:setAlpha( 0 )
				BfErrorIconGlow:registerEventHandler( "transition_complete_keyframe", f30_local5 )
				IconScanning:completeAnimation()
				self.IconScanning:setAlpha( 0 )
				self.IconScanning:setScale( 0.8 )
				self.clipFinished( IconScanning, {} )
				IconBreaching:completeAnimation()
				self.IconBreaching:setAlpha( 0 )
				self.IconBreaching:setScale( 0.8 )
				self.clipFinished( IconBreaching, {} )
				IconHacking:completeAnimation()
				self.IconHacking:setAlpha( 0 )
				self.IconHacking:setScale( 0.8 )
				self.clipFinished( IconHacking, {} )
				StatusText:completeAnimation()
				self.StatusText:setAlpha( 1 )
				self.clipFinished( StatusText, {} )
				PercentText:completeAnimation()
				self.PercentText:setAlpha( 0 )
				self.clipFinished( PercentText, {} )
				Spinner:completeAnimation()
				self.Spinner:setAlpha( 0 )
				self.clipFinished( Spinner, {} )
				HackingBarRight:completeAnimation()
				self.HackingBarRight:setAlpha( 1 )
				self.clipFinished( HackingBarRight, {} )
				HackingBarLeft:completeAnimation()
				self.HackingBarLeft:setAlpha( 1 )
				self.clipFinished( HackingBarLeft, {} )
				WaveformBlackHat:completeAnimation()
				self.WaveformBlackHat:setAlpha( 1 )
				self.clipFinished( WaveformBlackHat, {} )
				blackhatEmp0:completeAnimation()
				self.blackhatEmp0:setAlpha( 0 )
				self.clipFinished( blackhatEmp0, {} )
			end
		},
		EMP = {
			DefaultClip = function ()
				self:setupElementClipCounter( 22 )
				BgScanning:completeAnimation()
				self.BgScanning:setAlpha( 0 )
				self.clipFinished( BgScanning, {} )
				BgScanningDetail:completeAnimation()
				self.BgScanningDetail:setAlpha( 0 )
				self.BgScanningDetail:setScale( 1 )
				self.clipFinished( BgScanningDetail, {} )
				BgHacking:completeAnimation()
				self.BgHacking:setAlpha( 0 )
				self.clipFinished( BgHacking, {} )
				BgHackingDetail:completeAnimation()
				self.BgHackingDetail:setAlpha( 0 )
				self.clipFinished( BgHackingDetail, {} )
				BgBreaching:completeAnimation()
				self.BgBreaching:setAlpha( 0 )
				self.clipFinished( BgBreaching, {} )
				BgBreachingDetail:completeAnimation()
				self.BgBreachingDetail:setAlpha( 0 )
				self.clipFinished( BgBreachingDetail, {} )
				BgError:completeAnimation()
				self.BgError:setAlpha( 0 )
				self.clipFinished( BgError, {} )
				BgErrorDetail:completeAnimation()
				self.BgErrorDetail:setAlpha( 0 )
				self.clipFinished( BgErrorDetail, {} )
				BgErrorXmarks:completeAnimation()
				self.BgErrorXmarks:setAlpha( 0 )
				self.BgErrorXmarks:setScale( 1 )
				self.clipFinished( BgErrorXmarks, {} )
				BgErrorStripes:completeAnimation()
				self.BgErrorStripes:setAlpha( 0 )
				self.clipFinished( BgErrorStripes, {} )
				BgErrorIcon:completeAnimation()
				self.BgErrorIcon:setAlpha( 0 )
				self.BgErrorIcon:setScale( 1 )
				self.clipFinished( BgErrorIcon, {} )
				BfErrorIconGlow:completeAnimation()
				self.BfErrorIconGlow:setAlpha( 0 )
				self.clipFinished( BfErrorIconGlow, {} )
				IconScanning:completeAnimation()
				self.IconScanning:setAlpha( 0 )
				self.IconScanning:setScale( 0.8 )
				self.clipFinished( IconScanning, {} )
				IconBreaching:completeAnimation()
				self.IconBreaching:setAlpha( 0 )
				self.IconBreaching:setScale( 0.8 )
				self.clipFinished( IconBreaching, {} )
				IconHacking:completeAnimation()
				self.IconHacking:setAlpha( 0 )
				self.IconHacking:setScale( 0.8 )
				self.clipFinished( IconHacking, {} )
				StatusText:completeAnimation()
				self.StatusText:setAlpha( 0 )
				self.clipFinished( StatusText, {} )
				PercentText:completeAnimation()
				self.PercentText:setAlpha( 0 )
				self.clipFinished( PercentText, {} )
				Spinner:completeAnimation()
				self.Spinner:setAlpha( 0 )
				self.clipFinished( Spinner, {} )
				HackingBarRight:completeAnimation()
				self.HackingBarRight:setAlpha( 0 )
				self.clipFinished( HackingBarRight, {} )
				HackingBarLeft:completeAnimation()
				self.HackingBarLeft:setAlpha( 0 )
				self.clipFinished( HackingBarLeft, {} )
				WaveformBlackHat:completeAnimation()
				self.WaveformBlackHat:setAlpha( 0 )
				self.clipFinished( WaveformBlackHat, {} )
				blackhatEmp0:completeAnimation()
				self.blackhatEmp0:setAlpha( 1 )
				self.clipFinished( blackhatEmp0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "TeamHacking",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "hudItems.blackhat.status", CoD.BlackhatStatus.Hacking ) and IsModelValueTrue( controller, "currentWeapon.lockedOnEnemyTeamHacking" )
			end
		},
		{
			stateName = "Hacking",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "hudItems.blackhat.status", CoD.BlackhatStatus.Hacking )
			end
		},
		{
			stateName = "Breaching",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "hudItems.blackhat.status", CoD.BlackhatStatus.Breaching )
			end
		},
		{
			stateName = "Error",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "EMP",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.blackhat.status" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.blackhat.status"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.lockedOnEnemyTeamHacking" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.lockedOnEnemyTeamHacking"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.HackingBarRight:close()
		element.HackingBarLeft:close()
		element.WaveformBlackHat:close()
		element.blackhatEmp0:close()
		element.PercentText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

