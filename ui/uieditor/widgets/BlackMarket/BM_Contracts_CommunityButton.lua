-- 6ee4e08240586a3f4026736e0709d192
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BlackMarket.BM_Contracts_PercentCompleteWidgetWithPips" )
require( "ui.uieditor.widgets.BlackMarket.BM_Contracts_timer" )
require( "ui.uieditor.widgets.BlackMarket.BM_Contracts_CommunityButton_TitleAndDesc" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	local f1_local0 = function ()
		f1_arg0.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, GetPromoCircleFill( f1_arg1, 0, 0, 0, 0 ) )
		f1_arg0.PercentCompleteWidget.percentText:setText( Engine.Localize( GetPromoCirclePercentText( "MPUI_PERCENT" ) ) )
	end
	
	if CoD.GetThermometerProgress() >= 0 then
		f1_local0()
	else
		f1_arg0.thermometerUpdateTimer = LUI.UITimer.newElementTimer( 2000, false, function ( f3_arg0 )
			if CoD.GetThermometerProgress() >= 0 then
				f1_local0()
				if f1_arg0.thermometerUpdateTimer then
					f1_arg0.thermometerUpdateTimer:close()
					f1_arg0.thermometerUpdateTimer = nil
				end
			end
		end )
		f1_arg0:addElement( f1_arg0.thermometerUpdateTimer )
	end
end

CoD.BM_Contracts_CommunityButton = InheritFrom( LUI.UIElement )
CoD.BM_Contracts_CommunityButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.BM_Contracts_CommunityButton )
	self.id = "BM_Contracts_CommunityButton"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 358 )
	self:setTopBottom( true, false, 0, 217 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local Gradient = LUI.UIImage.new()
	Gradient:setLeftRight( true, true, 2.32, -1.5 )
	Gradient:setTopBottom( true, true, 3.17, -3 )
	Gradient:setAlpha( 0.5 )
	Gradient:setImage( RegisterImage( "uie_t7_blackmarket_contracts_special_gradient" ) )
	Gradient:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	Gradient:setShaderVector( 0, 0.05, 0.28, 0, 0 )
	Gradient:setupNineSliceShader( 18, 60 )
	self:addElement( Gradient )
	self.Gradient = Gradient
	
	local header = LUI.UIImage.new()
	header:setLeftRight( true, true, 4, -1.5 )
	header:setTopBottom( true, false, 1.56, 41.56 )
	header:setImage( RegisterImage( "uie_t7_blackmarket_contracts_special" ) )
	self:addElement( header )
	self.header = header
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, true, 2.32, -1.5 )
	Background:setTopBottom( true, true, 2.11, -2 )
	Background:setImage( RegisterImage( "uie_t7_blackmarket_contracts_bigframe" ) )
	Background:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	Background:setShaderVector( 0, 0.16, 0.26, 0, 0 )
	Background:setupNineSliceShader( 56, 56 )
	self:addElement( Background )
	self.Background = Background
	
	local BackgroundCompleted = LUI.UIImage.new()
	BackgroundCompleted:setLeftRight( true, true, 2.32, -1.5 )
	BackgroundCompleted:setTopBottom( true, true, 1.56, -2 )
	BackgroundCompleted:setAlpha( 0 )
	BackgroundCompleted:setImage( RegisterImage( "uie_t7_blackmarket_contracts_bigframe_completed" ) )
	BackgroundCompleted:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	BackgroundCompleted:setShaderVector( 0, 0.16, 0.26, 0, 0 )
	BackgroundCompleted:setupNineSliceShader( 56, 56 )
	self:addElement( BackgroundCompleted )
	self.BackgroundCompleted = BackgroundCompleted
	
	local PercentCompleteWidget = CoD.BM_Contracts_PercentCompleteWidgetWithPips.new( menu, controller )
	PercentCompleteWidget:setLeftRight( true, false, 9.5, 99.5 )
	PercentCompleteWidget:setTopBottom( true, false, 40.07, 130.07 )
	PercentCompleteWidget:setScale( 0.9 )
	PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, 0, 0, 0, 0 )
	PercentCompleteWidget.percentText:setText( Engine.Localize( "" ) )
	PercentCompleteWidget:mergeStateConditions( {
		{
			stateName = "TwoPips",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "ThreePips",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "FourPips",
			condition = function ( menu, element, event )
				return not IsThermometerProgressEqualTo( 1 )
			end
		},
		{
			stateName = "CompleteZeroPips",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "CompleteTwoPips",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "CompleteThreePips",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "CompleteFourPips",
			condition = function ( menu, element, event )
				return IsThermometerProgressEqualTo( 1 )
			end
		}
	} )
	self:addElement( PercentCompleteWidget )
	self.PercentCompleteWidget = PercentCompleteWidget
	
	local Divider = LUI.UIImage.new()
	Divider:setLeftRight( true, false, 73.5, 297 )
	Divider:setTopBottom( true, false, 132.07, 140.06 )
	Divider:setImage( RegisterImage( "uie_t7_blackmarket_contract_divider" ) )
	Divider:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	Divider:setShaderVector( 0, 0.04, 0.5, 0, 0 )
	Divider:setupNineSliceShader( 10, 4 )
	self:addElement( Divider )
	self.Divider = Divider
	
	local BMContractstimer = CoD.BM_Contracts_timer.new( menu, controller )
	BMContractstimer:setLeftRight( true, false, 21, 329 )
	BMContractstimer:setTopBottom( true, false, 12.24, 31.28 )
	BMContractstimer.Weekly:setText( Engine.Localize( "MENU_TAB_COMMUNITY_CAPS" ) )
	BMContractstimer.Timer:setText( Engine.Localize( "$(contractWeeklyRemaining)" ) )
	BMContractstimer:mergeStateConditions( {
		{
			stateName = "HideTimer",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( BMContractstimer )
	self.BMContractstimer = BMContractstimer
	
	local NineSliceShaderImage = LUI.UIImage.new()
	NineSliceShaderImage:setLeftRight( true, true, -4, 4 )
	NineSliceShaderImage:setTopBottom( true, true, -4.54, 4 )
	NineSliceShaderImage:setAlpha( 0 )
	NineSliceShaderImage:setImage( RegisterImage( "uie_t7_bm_contracts_hover_9slice" ) )
	NineSliceShaderImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	NineSliceShaderImage:setShaderVector( 0, 0.13, 0.21, 0, 0 )
	NineSliceShaderImage:setupNineSliceShader( 48, 48 )
	self:addElement( NineSliceShaderImage )
	self.NineSliceShaderImage = NineSliceShaderImage
	
	local upperglow = LUI.UIImage.new()
	upperglow:setLeftRight( false, false, -126.13, 122.13 )
	upperglow:setTopBottom( true, false, -17.77, 30.28 )
	upperglow:setAlpha( 0 )
	upperglow:setImage( RegisterImage( "uie_t7_bm_contracts_hover_upperglow" ) )
	self:addElement( upperglow )
	self.upperglow = upperglow
	
	local lowerglow = LUI.UIImage.new()
	lowerglow:setLeftRight( false, false, -99, 85 )
	lowerglow:setTopBottom( false, true, -6.75, 33.25 )
	lowerglow:setAlpha( 0 )
	lowerglow:setImage( RegisterImage( "uie_t7_bm_contracts_hover_lowerglow" ) )
	self:addElement( lowerglow )
	self.lowerglow = lowerglow
	
	local CompletedIcon = LUI.UIImage.new()
	CompletedIcon:setLeftRight( false, true, -49, 0 )
	CompletedIcon:setTopBottom( true, false, 7, 39 )
	CompletedIcon:setAlpha( 0 )
	CompletedIcon:setImage( RegisterImage( "uie_t7_bm_contracts_completed_ribbon" ) )
	self:addElement( CompletedIcon )
	self.CompletedIcon = CompletedIcon
	
	local TitleAndDesc = CoD.BM_Contracts_CommunityButton_TitleAndDesc.new( menu, controller )
	TitleAndDesc:setLeftRight( true, false, 104.5, 338 )
	TitleAndDesc:setTopBottom( true, false, 56.56, 74.56 )
	TitleAndDesc.SpecialContractName:setText( LocalizeToUpperString( "CONTRACT_COMMUNITY_CONTRACT_ZMHD_TITLE" ) )
	TitleAndDesc.SpecialContractDesc:setText( Engine.Localize( "MPUI_CONTRACTS_RTC_DESC" ) )
	self:addElement( TitleAndDesc )
	self.TitleAndDesc = TitleAndDesc
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				header:completeAnimation()
				self.header:setAlpha( 1 )
				self.clipFinished( header, {} )

				NineSliceShaderImage:completeAnimation()
				self.NineSliceShaderImage:setLeftRight( true, true, -4, 4 )
				self.NineSliceShaderImage:setTopBottom( true, true, -4.54, 4 )
				self.NineSliceShaderImage:setAlpha( 0 )
				self.clipFinished( NineSliceShaderImage, {} )

				CompletedIcon:completeAnimation()
				self.CompletedIcon:setAlpha( 0 )
				self.clipFinished( CompletedIcon, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 3 )

				local NineSliceShaderImageFrame2 = function ( NineSliceShaderImage, event )
					if not event.interrupted then
						NineSliceShaderImage:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					NineSliceShaderImage:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( NineSliceShaderImage, event )
					else
						NineSliceShaderImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				NineSliceShaderImage:completeAnimation()
				self.NineSliceShaderImage:setAlpha( 0 )
				NineSliceShaderImageFrame2( NineSliceShaderImage, {} )
				local upperglowFrame2 = function ( upperglow, event )
					if not event.interrupted then
						upperglow:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					upperglow:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( upperglow, event )
					else
						upperglow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				upperglow:completeAnimation()
				self.upperglow:setAlpha( 0 )
				upperglowFrame2( upperglow, {} )
				local lowerglowFrame2 = function ( lowerglow, event )
					if not event.interrupted then
						lowerglow:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lowerglow:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( lowerglow, event )
					else
						lowerglow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lowerglow:completeAnimation()
				self.lowerglow:setAlpha( 0 )
				lowerglowFrame2( lowerglow, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 3 )

				local NineSliceShaderImageFrame2 = function ( NineSliceShaderImage, event )
					local NineSliceShaderImageFrame3 = function ( NineSliceShaderImage, event )
						if not event.interrupted then
							NineSliceShaderImage:beginAnimation( "keyframe", 799, false, false, CoD.TweenType.Linear )
						end
						NineSliceShaderImage:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( NineSliceShaderImage, event )
						else
							NineSliceShaderImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						NineSliceShaderImageFrame3( NineSliceShaderImage, event )
						return 
					else
						NineSliceShaderImage:beginAnimation( "keyframe", 740, false, false, CoD.TweenType.Linear )
						NineSliceShaderImage:setAlpha( 0.8 )
						NineSliceShaderImage:registerEventHandler( "transition_complete_keyframe", NineSliceShaderImageFrame3 )
					end
				end
				
				NineSliceShaderImage:completeAnimation()
				self.NineSliceShaderImage:setAlpha( 1 )
				NineSliceShaderImageFrame2( NineSliceShaderImage, {} )
				local upperglowFrame2 = function ( upperglow, event )
					local upperglowFrame3 = function ( upperglow, event )
						if not event.interrupted then
							upperglow:beginAnimation( "keyframe", 799, false, false, CoD.TweenType.Linear )
						end
						upperglow:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( upperglow, event )
						else
							upperglow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						upperglowFrame3( upperglow, event )
						return 
					else
						upperglow:beginAnimation( "keyframe", 740, false, false, CoD.TweenType.Linear )
						upperglow:setAlpha( 0.48 )
						upperglow:registerEventHandler( "transition_complete_keyframe", upperglowFrame3 )
					end
				end
				
				upperglow:completeAnimation()
				self.upperglow:setAlpha( 1 )
				upperglowFrame2( upperglow, {} )
				local lowerglowFrame2 = function ( lowerglow, event )
					local lowerglowFrame3 = function ( lowerglow, event )
						if not event.interrupted then
							lowerglow:beginAnimation( "keyframe", 799, false, false, CoD.TweenType.Linear )
						end
						lowerglow:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( lowerglow, event )
						else
							lowerglow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						lowerglowFrame3( lowerglow, event )
						return 
					else
						lowerglow:beginAnimation( "keyframe", 740, false, false, CoD.TweenType.Linear )
						lowerglow:setAlpha( 0.5 )
						lowerglow:registerEventHandler( "transition_complete_keyframe", lowerglowFrame3 )
					end
				end
				
				lowerglow:completeAnimation()
				self.lowerglow:setAlpha( 1 )
				lowerglowFrame2( lowerglow, {} )

				self.nextClip = "Focus"
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 3 )

				local NineSliceShaderImageFrame2 = function ( NineSliceShaderImage, event )
					if not event.interrupted then
						NineSliceShaderImage:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					NineSliceShaderImage:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( NineSliceShaderImage, event )
					else
						NineSliceShaderImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				NineSliceShaderImage:completeAnimation()
				self.NineSliceShaderImage:setAlpha( 1 )
				NineSliceShaderImageFrame2( NineSliceShaderImage, {} )
				local upperglowFrame2 = function ( upperglow, event )
					if not event.interrupted then
						upperglow:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					upperglow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( upperglow, event )
					else
						upperglow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				upperglow:completeAnimation()
				self.upperglow:setAlpha( 1 )
				upperglowFrame2( upperglow, {} )
				local lowerglowFrame2 = function ( lowerglow, event )
					if not event.interrupted then
						lowerglow:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lowerglow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( lowerglow, event )
					else
						lowerglow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lowerglow:completeAnimation()
				self.lowerglow:setAlpha( 1 )
				lowerglowFrame2( lowerglow, {} )
			end
		},
		Complete = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				header:completeAnimation()
				self.header:setAlpha( 0.5 )
				self.clipFinished( header, {} )

				BMContractstimer:completeAnimation()
				self.BMContractstimer:setLeftRight( true, false, 21, 301.13 )
				self.BMContractstimer:setTopBottom( true, false, 12.24, 31.28 )
				self.clipFinished( BMContractstimer, {} )

				lowerglow:completeAnimation()
				self.lowerglow:setAlpha( 0 )
				self.clipFinished( lowerglow, {} )

				CompletedIcon:completeAnimation()
				self.CompletedIcon:setAlpha( 1 )
				self.clipFinished( CompletedIcon, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 3 )

				local NineSliceShaderImageFrame2 = function ( NineSliceShaderImage, event )
					if not event.interrupted then
						NineSliceShaderImage:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					NineSliceShaderImage:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( NineSliceShaderImage, event )
					else
						NineSliceShaderImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				NineSliceShaderImage:completeAnimation()
				self.NineSliceShaderImage:setAlpha( 0 )
				NineSliceShaderImageFrame2( NineSliceShaderImage, {} )
				local upperglowFrame2 = function ( upperglow, event )
					if not event.interrupted then
						upperglow:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					upperglow:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( upperglow, event )
					else
						upperglow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				upperglow:completeAnimation()
				self.upperglow:setAlpha( 0 )
				upperglowFrame2( upperglow, {} )
				local lowerglowFrame2 = function ( lowerglow, event )
					if not event.interrupted then
						lowerglow:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lowerglow:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( lowerglow, event )
					else
						lowerglow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lowerglow:completeAnimation()
				self.lowerglow:setAlpha( 0 )
				lowerglowFrame2( lowerglow, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 3 )

				local NineSliceShaderImageFrame2 = function ( NineSliceShaderImage, event )
					local NineSliceShaderImageFrame3 = function ( NineSliceShaderImage, event )
						if not event.interrupted then
							NineSliceShaderImage:beginAnimation( "keyframe", 799, false, false, CoD.TweenType.Linear )
						end
						NineSliceShaderImage:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( NineSliceShaderImage, event )
						else
							NineSliceShaderImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						NineSliceShaderImageFrame3( NineSliceShaderImage, event )
						return 
					else
						NineSliceShaderImage:beginAnimation( "keyframe", 740, false, false, CoD.TweenType.Linear )
						NineSliceShaderImage:setAlpha( 0.8 )
						NineSliceShaderImage:registerEventHandler( "transition_complete_keyframe", NineSliceShaderImageFrame3 )
					end
				end
				
				NineSliceShaderImage:completeAnimation()
				self.NineSliceShaderImage:setAlpha( 1 )
				NineSliceShaderImageFrame2( NineSliceShaderImage, {} )
				local upperglowFrame2 = function ( upperglow, event )
					local upperglowFrame3 = function ( upperglow, event )
						if not event.interrupted then
							upperglow:beginAnimation( "keyframe", 799, false, false, CoD.TweenType.Linear )
						end
						upperglow:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( upperglow, event )
						else
							upperglow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						upperglowFrame3( upperglow, event )
						return 
					else
						upperglow:beginAnimation( "keyframe", 740, false, false, CoD.TweenType.Linear )
						upperglow:setAlpha( 0.48 )
						upperglow:registerEventHandler( "transition_complete_keyframe", upperglowFrame3 )
					end
				end
				
				upperglow:completeAnimation()
				self.upperglow:setAlpha( 1 )
				upperglowFrame2( upperglow, {} )
				local lowerglowFrame2 = function ( lowerglow, event )
					local lowerglowFrame3 = function ( lowerglow, event )
						if not event.interrupted then
							lowerglow:beginAnimation( "keyframe", 799, false, false, CoD.TweenType.Linear )
						end
						lowerglow:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( lowerglow, event )
						else
							lowerglow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						lowerglowFrame3( lowerglow, event )
						return 
					else
						lowerglow:beginAnimation( "keyframe", 740, false, false, CoD.TweenType.Linear )
						lowerglow:setAlpha( 0.5 )
						lowerglow:registerEventHandler( "transition_complete_keyframe", lowerglowFrame3 )
					end
				end
				
				lowerglow:completeAnimation()
				self.lowerglow:setAlpha( 1 )
				lowerglowFrame2( lowerglow, {} )

				self.nextClip = "Focus"
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 3 )

				local NineSliceShaderImageFrame2 = function ( NineSliceShaderImage, event )
					if not event.interrupted then
						NineSliceShaderImage:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					NineSliceShaderImage:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( NineSliceShaderImage, event )
					else
						NineSliceShaderImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				NineSliceShaderImage:completeAnimation()
				self.NineSliceShaderImage:setAlpha( 1 )
				NineSliceShaderImageFrame2( NineSliceShaderImage, {} )
				local upperglowFrame2 = function ( upperglow, event )
					if not event.interrupted then
						upperglow:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					upperglow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( upperglow, event )
					else
						upperglow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				upperglow:completeAnimation()
				self.upperglow:setAlpha( 1 )
				upperglowFrame2( upperglow, {} )
				local lowerglowFrame2 = function ( lowerglow, event )
					if not event.interrupted then
						lowerglow:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lowerglow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( lowerglow, event )
					else
						lowerglow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lowerglow:completeAnimation()
				self.lowerglow:setAlpha( 1 )
				lowerglowFrame2( lowerglow, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Complete",
			condition = function ( menu, element, event )
				return IsThermometerProgressEqualTo( 1 )
			end
		}
	} )
	TitleAndDesc.id = "TitleAndDesc"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.TitleAndDesc:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.PercentCompleteWidget:close()
		element.BMContractstimer:close()
		element.TitleAndDesc:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

