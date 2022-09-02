-- 027b77f5bdb96dcc7bf4d28060db01b9
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BlackMarket.BM_Contracts_ContractProgressWidget" )
require( "ui.uieditor.widgets.BlackMarket.BM_Contracts_timer" )
require( "ui.uieditor.widgets.BlackMarket.BM_Contracts_DoubleCryptokeys" )

CoD.BM_Contracts_DailyContractWidget = InheritFrom( LUI.UIElement )
CoD.BM_Contracts_DailyContractWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.BM_Contracts_DailyContractWidget )
	self.id = "BM_Contracts_DailyContractWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 232 )
	self:setTopBottom( true, false, 0, 290 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local Gradient = LUI.UIImage.new()
	Gradient:setLeftRight( true, true, 0.66, -2.34 )
	Gradient:setTopBottom( true, true, -0.76, 0.76 )
	Gradient:setImage( RegisterImage( "uie_t7_blackmarket_contracts_daily_gradient" ) )
	Gradient:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	Gradient:setShaderVector( 0, 0.09, 0.48, 0, 0 )
	Gradient:setupNineSliceShader( 20, 140 )
	self:addElement( Gradient )
	self.Gradient = Gradient
	
	local header = LUI.UIImage.new()
	header:setLeftRight( true, true, 0, -1 )
	header:setTopBottom( true, false, -0.76, 39.07 )
	header:setImage( RegisterImage( "uie_t7_blackmarket_contracts_daily" ) )
	self:addElement( header )
	self.header = header
	
	local BackgroundCompleted = LUI.UIImage.new()
	BackgroundCompleted:setLeftRight( true, true, -0.68, -1 )
	BackgroundCompleted:setTopBottom( true, true, -1, 0 )
	BackgroundCompleted:setAlpha( 0 )
	BackgroundCompleted:setImage( RegisterImage( "uie_t7_blackmarket_contracts_bigframe_completed" ) )
	BackgroundCompleted:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	BackgroundCompleted:setShaderVector( 0, 0.24, 0.19, 0, 0 )
	BackgroundCompleted:setupNineSliceShader( 56, 56 )
	self:addElement( BackgroundCompleted )
	self.BackgroundCompleted = BackgroundCompleted
	
	local Background0 = LUI.UIImage.new()
	Background0:setLeftRight( true, true, -0.68, -1 )
	Background0:setTopBottom( true, true, -1, 0 )
	Background0:setImage( RegisterImage( "uie_t7_blackmarket_contracts_bigframe" ) )
	Background0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	Background0:setShaderVector( 0, 0.24, 0.19, 0, 0 )
	Background0:setupNineSliceShader( 56, 56 )
	self:addElement( Background0 )
	self.Background0 = Background0
	
	local ContractProgress = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, true )
	ContractProgress:makeFocusable()
	ContractProgress:setLeftRight( false, false, -115.34, 116.66 )
	ContractProgress:setTopBottom( true, false, 0, 300 )
	ContractProgress:setWidgetType( CoD.BM_Contracts_ContractProgressWidget )
	ContractProgress:setDataSource( "BlackMarketDailyContracts" )
	self:addElement( ContractProgress )
	self.ContractProgress = ContractProgress
	
	local Divider = LUI.UIImage.new()
	Divider:setLeftRight( false, false, -50.5, 50.5 )
	Divider:setTopBottom( false, true, -50, -42 )
	Divider:setImage( RegisterImage( "uie_t7_blackmarket_contract_divider" ) )
	Divider:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	Divider:setShaderVector( 0, 0.1, 0.5, 0, 0 )
	Divider:setupNineSliceShader( 10, 4 )
	self:addElement( Divider )
	self.Divider = Divider
	
	local BMContractstimer = CoD.BM_Contracts_timer.new( menu, controller )
	BMContractstimer:setLeftRight( true, false, 14, 139 )
	BMContractstimer:setTopBottom( true, false, 8.24, 27.28 )
	BMContractstimer.Weekly:setText( Engine.Localize( "MPUI_BM_CONTRACT_DAILY" ) )
	BMContractstimer.Timer:setText( Engine.Localize( "$(contractDailyRemaining)" ) )
	BMContractstimer:mergeStateConditions( {
		{
			stateName = "HideTimer",
			condition = function ( menu, element, event )
				return not IsDailyContractValid( controller )
			end
		}
	} )
	BMContractstimer:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "contractDailyIndex" ), function ( model )
		menu:updateElementState( BMContractstimer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "contractDailyIndex"
		} )
	end )
	self:addElement( BMContractstimer )
	self.BMContractstimer = BMContractstimer
	
	local BMContractsDoubleCryptokeys0 = CoD.BM_Contracts_DoubleCryptokeys.new( menu, controller )
	BMContractsDoubleCryptokeys0:setLeftRight( true, false, -6, 208 )
	BMContractsDoubleCryptokeys0:setTopBottom( false, true, -72.76, 15.24 )
	self:addElement( BMContractsDoubleCryptokeys0 )
	self.BMContractsDoubleCryptokeys0 = BMContractsDoubleCryptokeys0
	
	local NineSliceShaderImage = LUI.UIImage.new()
	NineSliceShaderImage:setLeftRight( true, true, -7, 5 )
	NineSliceShaderImage:setTopBottom( true, true, -7.54, 7 )
	NineSliceShaderImage:setRGB( 0.81, 0.81, 0.81 )
	NineSliceShaderImage:setAlpha( 0 )
	NineSliceShaderImage:setImage( RegisterImage( "uie_t7_bm_contracts_hover_9slice_white" ) )
	NineSliceShaderImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	NineSliceShaderImage:setShaderVector( 0, 0.2, 0.16, 0, 0 )
	NineSliceShaderImage:setupNineSliceShader( 48, 48 )
	self:addElement( NineSliceShaderImage )
	self.NineSliceShaderImage = NineSliceShaderImage
	
	local upperglow = LUI.UIImage.new()
	upperglow:setLeftRight( false, false, -126.13, 122.13 )
	upperglow:setTopBottom( true, false, -20.77, 27.28 )
	upperglow:setAlpha( 0 )
	upperglow:setImage( RegisterImage( "uie_t7_bm_contracts_hover_upperglow_white" ) )
	self:addElement( upperglow )
	self.upperglow = upperglow
	
	local lowerglow = LUI.UIImage.new()
	lowerglow:setLeftRight( false, false, -99, 85 )
	lowerglow:setTopBottom( false, true, -3.75, 36.25 )
	lowerglow:setRGB( 0.71, 0.71, 0.71 )
	lowerglow:setAlpha( 0 )
	lowerglow:setImage( RegisterImage( "uie_t7_bm_contracts_hover_lowerglow_white" ) )
	self:addElement( lowerglow )
	self.lowerglow = lowerglow
	
	local CompletedIcon = LUI.UIImage.new()
	CompletedIcon:setLeftRight( false, true, -48, 1 )
	CompletedIcon:setTopBottom( true, false, 1, 33 )
	CompletedIcon:setAlpha( 0 )
	CompletedIcon:setImage( RegisterImage( "uie_t7_bm_contracts_completed_ribbon" ) )
	self:addElement( CompletedIcon )
	self.CompletedIcon = CompletedIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )

				BackgroundCompleted:completeAnimation()
				self.BackgroundCompleted:setAlpha( 0 )
				self.clipFinished( BackgroundCompleted, {} )

				Divider:completeAnimation()
				self.Divider:setAlpha( 1 )
				self.clipFinished( Divider, {} )

				BMContractstimer:completeAnimation()
				self.clipFinished( BMContractstimer, {} )

				BMContractsDoubleCryptokeys0:completeAnimation()
				self.BMContractsDoubleCryptokeys0:setAlpha( 1 )
				self.clipFinished( BMContractsDoubleCryptokeys0, {} )

				NineSliceShaderImage:completeAnimation()
				self.NineSliceShaderImage:setAlpha( 0 )
				self.clipFinished( NineSliceShaderImage, {} )

				upperglow:completeAnimation()
				self.upperglow:setAlpha( 0 )
				self.clipFinished( upperglow, {} )

				lowerglow:completeAnimation()
				self.lowerglow:setAlpha( 0 )
				self.clipFinished( lowerglow, {} )

				CompletedIcon:completeAnimation()
				self.CompletedIcon:setAlpha( 0 )
				self.clipFinished( CompletedIcon, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 8 )

				BackgroundCompleted:completeAnimation()
				self.BackgroundCompleted:setAlpha( 0 )
				self.clipFinished( BackgroundCompleted, {} )

				Divider:completeAnimation()
				self.Divider:setAlpha( 1 )
				self.clipFinished( Divider, {} )

				BMContractstimer:completeAnimation()
				self.clipFinished( BMContractstimer, {} )

				BMContractsDoubleCryptokeys0:completeAnimation()
				self.BMContractsDoubleCryptokeys0:setAlpha( 1 )
				self.clipFinished( BMContractsDoubleCryptokeys0, {} )
				local NineSliceShaderImageFrame2 = function ( NineSliceShaderImage, event )
					local NineSliceShaderImageFrame3 = function ( NineSliceShaderImage, event )
						if not event.interrupted then
							NineSliceShaderImage:beginAnimation( "keyframe", 799, false, false, CoD.TweenType.Linear )
						end
						NineSliceShaderImage:setRGB( 1, 1, 1 )
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
				self.NineSliceShaderImage:setRGB( 1, 1, 1 )
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
						upperglow:setAlpha( 0.5 )
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

				CompletedIcon:completeAnimation()
				self.CompletedIcon:setAlpha( 0 )
				self.clipFinished( CompletedIcon, {} )

				self.nextClip = "Focus"
			end
		},
		InvalidContract = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )

				BackgroundCompleted:completeAnimation()
				self.BackgroundCompleted:setAlpha( 0 )
				self.clipFinished( BackgroundCompleted, {} )

				Divider:completeAnimation()
				self.Divider:setAlpha( 0 )
				self.clipFinished( Divider, {} )

				BMContractstimer:completeAnimation()
				self.clipFinished( BMContractstimer, {} )

				BMContractsDoubleCryptokeys0:completeAnimation()
				self.BMContractsDoubleCryptokeys0:setAlpha( 0 )
				self.clipFinished( BMContractsDoubleCryptokeys0, {} )

				NineSliceShaderImage:completeAnimation()
				self.NineSliceShaderImage:setRGB( 1, 1, 1 )
				self.NineSliceShaderImage:setAlpha( 0 )
				self.clipFinished( NineSliceShaderImage, {} )

				upperglow:completeAnimation()
				self.upperglow:setAlpha( 0 )
				self.clipFinished( upperglow, {} )

				lowerglow:completeAnimation()
				self.lowerglow:setAlpha( 0 )
				self.clipFinished( lowerglow, {} )

				CompletedIcon:completeAnimation()
				self.CompletedIcon:setAlpha( 0 )
				self.clipFinished( CompletedIcon, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 8 )

				BackgroundCompleted:completeAnimation()
				self.BackgroundCompleted:setAlpha( 0 )
				self.clipFinished( BackgroundCompleted, {} )

				Divider:completeAnimation()
				self.Divider:setAlpha( 0 )
				self.clipFinished( Divider, {} )

				BMContractstimer:completeAnimation()
				self.clipFinished( BMContractstimer, {} )

				BMContractsDoubleCryptokeys0:completeAnimation()
				self.BMContractsDoubleCryptokeys0:setAlpha( 0 )
				self.clipFinished( BMContractsDoubleCryptokeys0, {} )
				local NineSliceShaderImageFrame2 = function ( NineSliceShaderImage, event )
					local NineSliceShaderImageFrame3 = function ( NineSliceShaderImage, event )
						if not event.interrupted then
							NineSliceShaderImage:beginAnimation( "keyframe", 799, false, false, CoD.TweenType.Linear )
						end
						NineSliceShaderImage:setRGB( 1, 1, 1 )
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
				self.NineSliceShaderImage:setRGB( 1, 1, 1 )
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
						upperglow:setAlpha( 0.5 )
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

				CompletedIcon:completeAnimation()
				self.CompletedIcon:setAlpha( 0 )
				self.clipFinished( CompletedIcon, {} )

				self.nextClip = "Focus"
			end
		},
		Completed = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )

				header:completeAnimation()
				self.header:setAlpha( 0.5 )
				self.clipFinished( header, {} )

				BackgroundCompleted:completeAnimation()
				self.BackgroundCompleted:setAlpha( 0 )
				self.clipFinished( BackgroundCompleted, {} )

				Background0:completeAnimation()
				self.Background0:setAlpha( 1 )
				self.clipFinished( Background0, {} )

				Divider:completeAnimation()
				self.Divider:setAlpha( 0 )
				self.clipFinished( Divider, {} )

				BMContractstimer:completeAnimation()
				self.clipFinished( BMContractstimer, {} )

				BMContractsDoubleCryptokeys0:completeAnimation()
				self.BMContractsDoubleCryptokeys0:setAlpha( 0 )
				self.clipFinished( BMContractsDoubleCryptokeys0, {} )

				NineSliceShaderImage:completeAnimation()
				self.NineSliceShaderImage:setAlpha( 0 )
				self.clipFinished( NineSliceShaderImage, {} )

				upperglow:completeAnimation()
				self.upperglow:setAlpha( 0 )
				self.clipFinished( upperglow, {} )

				lowerglow:completeAnimation()
				self.lowerglow:setAlpha( 0 )
				self.clipFinished( lowerglow, {} )

				CompletedIcon:completeAnimation()
				self.CompletedIcon:setLeftRight( false, true, -48, 1 )
				self.CompletedIcon:setTopBottom( true, false, 2, 34 )
				self.CompletedIcon:setAlpha( 1 )
				self.clipFinished( CompletedIcon, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 10 )

				header:completeAnimation()
				self.header:setAlpha( 0.5 )
				self.clipFinished( header, {} )

				BackgroundCompleted:completeAnimation()
				self.BackgroundCompleted:setAlpha( 0 )
				self.clipFinished( BackgroundCompleted, {} )

				Background0:completeAnimation()
				self.Background0:setAlpha( 1 )
				self.clipFinished( Background0, {} )

				Divider:completeAnimation()
				self.Divider:setAlpha( 0 )
				self.clipFinished( Divider, {} )

				BMContractstimer:completeAnimation()
				self.clipFinished( BMContractstimer, {} )

				BMContractsDoubleCryptokeys0:completeAnimation()
				self.BMContractsDoubleCryptokeys0:setAlpha( 0 )
				self.clipFinished( BMContractsDoubleCryptokeys0, {} )
				local NineSliceShaderImageFrame2 = function ( NineSliceShaderImage, event )
					local NineSliceShaderImageFrame3 = function ( NineSliceShaderImage, event )
						if not event.interrupted then
							NineSliceShaderImage:beginAnimation( "keyframe", 799, false, false, CoD.TweenType.Linear )
						end
						NineSliceShaderImage:setRGB( 1, 1, 1 )
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
				self.NineSliceShaderImage:setRGB( 1, 1, 1 )
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
						upperglow:setAlpha( 0.5 )
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

				CompletedIcon:completeAnimation()
				self.CompletedIcon:setLeftRight( false, true, -48, 1 )
				self.CompletedIcon:setTopBottom( true, false, 2, 34 )
				self.CompletedIcon:setAlpha( 1 )
				self.clipFinished( CompletedIcon, {} )

				self.nextClip = "Focus"
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "InvalidContract",
			condition = function ( menu, element, event )
				return not IsDailyContractValid( controller )
			end
		},
		{
			stateName = "Completed",
			condition = function ( menu, element, event )
				return IsDailyContractComplete( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "contractDailyIndex" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "contractDailyIndex"
		} )
	end )
	ContractProgress.id = "ContractProgress"

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ContractProgress:close()
		element.BMContractstimer:close()
		element.BMContractsDoubleCryptokeys0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

