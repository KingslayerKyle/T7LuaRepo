-- 694d1e0fc23428b03103208b86e9fb4b
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BlackMarket.BM_Contracts_ContractProgressWidget" )
require( "ui.uieditor.widgets.BlackMarket.BM_CryptokeyCounterIcon" )
require( "ui.uieditor.widgets.BlackMarket.BM_Contracts_timer" )

CoD.BM_Contracts_WeeklyContractsWidget = InheritFrom( LUI.UIElement )
CoD.BM_Contracts_WeeklyContractsWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BM_Contracts_WeeklyContractsWidget )
	self.id = "BM_Contracts_WeeklyContractsWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 479 )
	self:setTopBottom( true, false, 0, 290 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local Gradient = LUI.UIImage.new()
	Gradient:setLeftRight( true, true, 2.98, -1.48 )
	Gradient:setTopBottom( true, true, 2, 0 )
	Gradient:setAlpha( 0.5 )
	Gradient:setImage( RegisterImage( "uie_t7_blackmarket_contracts_daily_gradient" ) )
	Gradient:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	Gradient:setShaderVector( 0, 0.03, 0.47, 0, 0 )
	Gradient:setupNineSliceShader( 16, 136 )
	self:addElement( Gradient )
	self.Gradient = Gradient
	
	local Header = LUI.UIImage.new()
	Header:setLeftRight( true, true, 0.16, 2 )
	Header:setTopBottom( true, false, -0.76, 39.31 )
	Header:setImage( RegisterImage( "uie_t7_blackmarket_contracts_weekly" ) )
	self:addElement( Header )
	self.Header = Header
	
	local BackgroundCompleted = LUI.UIImage.new()
	BackgroundCompleted:setLeftRight( true, true, 1.16, -0.16 )
	BackgroundCompleted:setTopBottom( true, true, 0, 0 )
	BackgroundCompleted:setImage( RegisterImage( "uie_t7_blackmarket_contracts_bigframe_completed" ) )
	BackgroundCompleted:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	BackgroundCompleted:setShaderVector( 0, 0.12, 0.19, 0, 0 )
	BackgroundCompleted:setupNineSliceShader( 56, 56 )
	self:addElement( BackgroundCompleted )
	self.BackgroundCompleted = BackgroundCompleted
	
	local Background0 = LUI.UIImage.new()
	Background0:setLeftRight( true, true, 1.16, -0.16 )
	Background0:setTopBottom( true, true, 0, 0 )
	Background0:setImage( RegisterImage( "uie_t7_blackmarket_contracts_bigframe" ) )
	Background0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	Background0:setShaderVector( 0, 0.12, 0.19, 0, 0 )
	Background0:setupNineSliceShader( 56, 56 )
	self:addElement( Background0 )
	self.Background0 = Background0
	
	local ContractProgress = LUI.UIList.new( menu, controller, 0, 0, nil, false, false, 0, 0, false, true )
	ContractProgress:makeFocusable()
	ContractProgress:setLeftRight( false, false, -231.25, 232.75 )
	ContractProgress:setTopBottom( true, false, 0, 300 )
	ContractProgress:setWidgetType( CoD.BM_Contracts_ContractProgressWidget )
	ContractProgress:setHorizontalCount( 2 )
	ContractProgress:setSpacing( 0 )
	ContractProgress:setDataSource( "BlackMarketWeeklyContracts" )
	self:addElement( ContractProgress )
	self.ContractProgress = ContractProgress
	
	local CryptokeyIcon = CoD.BM_CryptokeyCounterIcon.new( menu, controller )
	CryptokeyIcon:setLeftRight( false, false, -94.5, -66.5 )
	CryptokeyIcon:setTopBottom( false, true, -38.26, -10.26 )
	self:addElement( CryptokeyIcon )
	self.CryptokeyIcon = CryptokeyIcon
	
	local Divider0 = LUI.UIImage.new()
	Divider0:setLeftRight( false, false, -136.5, 138 )
	Divider0:setTopBottom( false, true, -50, -42 )
	Divider0:setImage( RegisterImage( "uie_t7_blackmarket_contract_divider" ) )
	Divider0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	Divider0:setShaderVector( 0, 0.04, 0.5, 0, 0 )
	Divider0:setupNineSliceShader( 10, 4 )
	self:addElement( Divider0 )
	self.Divider0 = Divider0
	
	local BMContractstimer = CoD.BM_Contracts_timer.new( menu, controller )
	BMContractstimer:setLeftRight( true, false, 18, 326 )
	BMContractstimer:setTopBottom( true, false, 9.24, 28.28 )
	BMContractstimer.Weekly:setText( Engine.Localize( "MPUI_BM_CONTRACT_WEEKLY" ) )
	BMContractstimer.Timer:setText( Engine.Localize( "$(contractWeeklyRemaining)" ) )
	BMContractstimer:mergeStateConditions( {
		{
			stateName = "HideTimer",
			condition = function ( menu, element, event )
				return not AreWeeklyContractsValid( controller )
			end
		}
	} )
	BMContractstimer:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "contractWeeklyAIndex" ), function ( model )
		menu:updateElementState( BMContractstimer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "contractWeeklyAIndex"
		} )
	end )
	BMContractstimer:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "contractWeeklyBIndex" ), function ( model )
		menu:updateElementState( BMContractstimer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "contractWeeklyBIndex"
		} )
	end )
	self:addElement( BMContractstimer )
	self.BMContractstimer = BMContractstimer
	
	local ContractDesc0 = LUI.UIText.new()
	ContractDesc0:setLeftRight( false, false, -62.5, -15.5 )
	ContractDesc0:setTopBottom( false, true, -34.26, -14.26 )
	ContractDesc0:setRGB( 0.46, 0.8, 0.75 )
	ContractDesc0:setText( DvarLocalizedIntoString( "weekly_contract_cryptokey_reward_count", "PERKS_ITEMTEXT" ) )
	ContractDesc0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ContractDesc0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ContractDesc0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ContractDesc0 )
	self.ContractDesc0 = ContractDesc0
	
	local ContractDesc1 = LUI.UIText.new()
	ContractDesc1:setLeftRight( false, false, 67, 114 )
	ContractDesc1:setTopBottom( false, true, -34.26, -14.26 )
	ContractDesc1:setRGB( 0.46, 0.8, 0.75 )
	ContractDesc1:setText( DvarLocalizedIntoString( "weekly_contract_blackjack_contract_reward_count", "PERKS_ITEMTEXT" ) )
	ContractDesc1:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ContractDesc1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ContractDesc1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ContractDesc1 )
	self.ContractDesc1 = ContractDesc1
	
	local contractsIcon = LUI.UIImage.new()
	contractsIcon:setLeftRight( false, false, 32.25, 65.75 )
	contractsIcon:setTopBottom( false, true, -41.01, -7.51 )
	contractsIcon:setImage( RegisterImage( "uie_t7_blackmarket_contract_smallicon" ) )
	self:addElement( contractsIcon )
	self.contractsIcon = contractsIcon
	
	local InvalidContractName = LUI.UIText.new()
	InvalidContractName:setLeftRight( false, false, -242.5, 242.5 )
	InvalidContractName:setTopBottom( false, true, -172, -153 )
	InvalidContractName:setRGB( 0.46, 0.8, 0.75 )
	InvalidContractName:setAlpha( 0 )
	InvalidContractName:setText( LocalizeToUpperString( "CONTRACT_NULL" ) )
	InvalidContractName:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	InvalidContractName:setLetterSpacing( -0.5 )
	InvalidContractName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	InvalidContractName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( InvalidContractName )
	self.InvalidContractName = InvalidContractName
	
	local InvalidContractDesc = LUI.UIText.new()
	InvalidContractDesc:setLeftRight( false, false, -200, 200 )
	InvalidContractDesc:setTopBottom( false, true, -153, -135 )
	InvalidContractDesc:setRGB( 0.88, 0.88, 0.88 )
	InvalidContractDesc:setAlpha( 0 )
	InvalidContractDesc:setText( Engine.Localize( "CONTRACT_NULL_DESC" ) )
	InvalidContractDesc:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	InvalidContractDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	InvalidContractDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( InvalidContractDesc )
	self.InvalidContractDesc = InvalidContractDesc
	
	local NineSliceShaderImage = LUI.UIImage.new()
	NineSliceShaderImage:setLeftRight( true, true, -5, 7 )
	NineSliceShaderImage:setTopBottom( true, true, -6.54, 7 )
	NineSliceShaderImage:setRGB( 0.81, 0.81, 0.81 )
	NineSliceShaderImage:setAlpha( 0 )
	NineSliceShaderImage:setImage( RegisterImage( "uie_t7_bm_contracts_hover_9slice_white" ) )
	NineSliceShaderImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	NineSliceShaderImage:setShaderVector( 0, 0.1, 0.16, 0, 0 )
	NineSliceShaderImage:setupNineSliceShader( 48, 48 )
	self:addElement( NineSliceShaderImage )
	self.NineSliceShaderImage = NineSliceShaderImage
	
	local upperglow = LUI.UIImage.new()
	upperglow:setLeftRight( false, false, -126.13, 122.13 )
	upperglow:setTopBottom( true, false, -19.77, 28.28 )
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
	CompletedIcon:setLeftRight( false, true, -47, 2 )
	CompletedIcon:setTopBottom( true, false, 4, 36 )
	CompletedIcon:setImage( RegisterImage( "uie_t7_bm_contracts_completed_ribbon" ) )
	self:addElement( CompletedIcon )
	self.CompletedIcon = CompletedIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 15 )
				Header:completeAnimation()
				self.Header:setAlpha( 1 )
				self.clipFinished( Header, {} )
				BackgroundCompleted:completeAnimation()
				self.BackgroundCompleted:setAlpha( 0 )
				self.clipFinished( BackgroundCompleted, {} )
				Background0:completeAnimation()
				self.Background0:setAlpha( 1 )
				self.clipFinished( Background0, {} )
				ContractProgress:completeAnimation()
				self.ContractProgress:setAlpha( 1 )
				self.clipFinished( ContractProgress, {} )
				CryptokeyIcon:completeAnimation()
				self.CryptokeyIcon:setAlpha( 1 )
				self.clipFinished( CryptokeyIcon, {} )
				Divider0:completeAnimation()
				self.Divider0:setAlpha( 1 )
				self.clipFinished( Divider0, {} )
				ContractDesc0:completeAnimation()
				self.ContractDesc0:setAlpha( 1 )
				self.clipFinished( ContractDesc0, {} )
				ContractDesc1:completeAnimation()
				self.ContractDesc1:setAlpha( 1 )
				self.clipFinished( ContractDesc1, {} )
				contractsIcon:completeAnimation()
				self.contractsIcon:setAlpha( 1 )
				self.clipFinished( contractsIcon, {} )
				InvalidContractName:completeAnimation()
				self.InvalidContractName:setAlpha( 0 )
				self.clipFinished( InvalidContractName, {} )
				InvalidContractDesc:completeAnimation()
				self.InvalidContractDesc:setAlpha( 0 )
				self.clipFinished( InvalidContractDesc, {} )
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
				self:setupElementClipCounter( 15 )
				Header:completeAnimation()
				self.Header:setAlpha( 1 )
				self.clipFinished( Header, {} )
				BackgroundCompleted:completeAnimation()
				self.BackgroundCompleted:setAlpha( 0 )
				self.clipFinished( BackgroundCompleted, {} )
				Background0:completeAnimation()
				self.Background0:setAlpha( 1 )
				self.clipFinished( Background0, {} )
				ContractProgress:completeAnimation()
				self.ContractProgress:setAlpha( 1 )
				self.clipFinished( ContractProgress, {} )
				CryptokeyIcon:completeAnimation()
				self.CryptokeyIcon:setAlpha( 1 )
				self.clipFinished( CryptokeyIcon, {} )
				Divider0:completeAnimation()
				self.Divider0:setAlpha( 1 )
				self.clipFinished( Divider0, {} )
				ContractDesc0:completeAnimation()
				self.ContractDesc0:setAlpha( 1 )
				self.clipFinished( ContractDesc0, {} )
				ContractDesc1:completeAnimation()
				self.ContractDesc1:setAlpha( 1 )
				self.clipFinished( ContractDesc1, {} )
				contractsIcon:completeAnimation()
				self.contractsIcon:setAlpha( 1 )
				self.clipFinished( contractsIcon, {} )
				InvalidContractName:completeAnimation()
				self.InvalidContractName:setAlpha( 0 )
				self.clipFinished( InvalidContractName, {} )
				InvalidContractDesc:completeAnimation()
				self.InvalidContractDesc:setAlpha( 0 )
				self.clipFinished( InvalidContractDesc, {} )
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
				self:setupElementClipCounter( 15 )
				Header:completeAnimation()
				self.Header:setAlpha( 1 )
				self.clipFinished( Header, {} )
				BackgroundCompleted:completeAnimation()
				self.BackgroundCompleted:setAlpha( 0 )
				self.clipFinished( BackgroundCompleted, {} )
				Background0:completeAnimation()
				self.Background0:setAlpha( 1 )
				self.clipFinished( Background0, {} )
				ContractProgress:completeAnimation()
				self.ContractProgress:setAlpha( 0 )
				self.clipFinished( ContractProgress, {} )
				CryptokeyIcon:completeAnimation()
				self.CryptokeyIcon:setAlpha( 0 )
				self.clipFinished( CryptokeyIcon, {} )
				Divider0:completeAnimation()
				self.Divider0:setAlpha( 0 )
				self.clipFinished( Divider0, {} )
				ContractDesc0:completeAnimation()
				self.ContractDesc0:setAlpha( 0 )
				self.clipFinished( ContractDesc0, {} )
				ContractDesc1:completeAnimation()
				self.ContractDesc1:setAlpha( 0 )
				self.clipFinished( ContractDesc1, {} )
				contractsIcon:completeAnimation()
				self.contractsIcon:setAlpha( 0 )
				self.clipFinished( contractsIcon, {} )
				InvalidContractName:completeAnimation()
				self.InvalidContractName:setAlpha( 1 )
				self.clipFinished( InvalidContractName, {} )
				InvalidContractDesc:completeAnimation()
				self.InvalidContractDesc:setAlpha( 1 )
				self.clipFinished( InvalidContractDesc, {} )
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
				self:setupElementClipCounter( 15 )
				Header:completeAnimation()
				self.Header:setAlpha( 1 )
				self.clipFinished( Header, {} )
				BackgroundCompleted:completeAnimation()
				self.BackgroundCompleted:setAlpha( 0 )
				self.clipFinished( BackgroundCompleted, {} )
				Background0:completeAnimation()
				self.Background0:setAlpha( 1 )
				self.clipFinished( Background0, {} )
				ContractProgress:completeAnimation()
				self.ContractProgress:setAlpha( 0 )
				self.clipFinished( ContractProgress, {} )
				CryptokeyIcon:completeAnimation()
				self.CryptokeyIcon:setAlpha( 0 )
				self.clipFinished( CryptokeyIcon, {} )
				Divider0:completeAnimation()
				self.Divider0:setAlpha( 0 )
				self.clipFinished( Divider0, {} )
				ContractDesc0:completeAnimation()
				self.ContractDesc0:setAlpha( 0 )
				self.clipFinished( ContractDesc0, {} )
				ContractDesc1:completeAnimation()
				self.ContractDesc1:setAlpha( 0 )
				self.clipFinished( ContractDesc1, {} )
				contractsIcon:completeAnimation()
				self.contractsIcon:setAlpha( 0 )
				self.clipFinished( contractsIcon, {} )
				InvalidContractName:completeAnimation()
				self.InvalidContractName:setAlpha( 1 )
				self.clipFinished( InvalidContractName, {} )
				InvalidContractDesc:completeAnimation()
				self.InvalidContractDesc:setAlpha( 1 )
				self.clipFinished( InvalidContractDesc, {} )
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
				self:setupElementClipCounter( 16 )
				Header:completeAnimation()
				self.Header:setAlpha( 0.5 )
				self.clipFinished( Header, {} )
				BackgroundCompleted:completeAnimation()
				self.BackgroundCompleted:setAlpha( 0 )
				self.clipFinished( BackgroundCompleted, {} )
				Background0:completeAnimation()
				self.Background0:setAlpha( 1 )
				self.clipFinished( Background0, {} )
				ContractProgress:completeAnimation()
				self.ContractProgress:setAlpha( 1 )
				self.clipFinished( ContractProgress, {} )
				CryptokeyIcon:completeAnimation()
				self.CryptokeyIcon:setAlpha( 0 )
				self.clipFinished( CryptokeyIcon, {} )
				Divider0:completeAnimation()
				self.Divider0:setAlpha( 0 )
				self.clipFinished( Divider0, {} )
				BMContractstimer:completeAnimation()
				self.clipFinished( BMContractstimer, {} )
				ContractDesc0:completeAnimation()
				self.ContractDesc0:setAlpha( 0 )
				self.clipFinished( ContractDesc0, {} )
				ContractDesc1:completeAnimation()
				self.ContractDesc1:setAlpha( 0 )
				self.clipFinished( ContractDesc1, {} )
				contractsIcon:completeAnimation()
				self.contractsIcon:setAlpha( 0 )
				self.clipFinished( contractsIcon, {} )
				InvalidContractName:completeAnimation()
				self.InvalidContractName:setAlpha( 0 )
				self.clipFinished( InvalidContractName, {} )
				InvalidContractDesc:completeAnimation()
				self.InvalidContractDesc:setAlpha( 0 )
				self.clipFinished( InvalidContractDesc, {} )
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
				self.CompletedIcon:setAlpha( 1 )
				self.clipFinished( CompletedIcon, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 16 )
				Header:completeAnimation()
				self.Header:setAlpha( 0.5 )
				self.clipFinished( Header, {} )
				BackgroundCompleted:completeAnimation()
				self.BackgroundCompleted:setAlpha( 0 )
				self.clipFinished( BackgroundCompleted, {} )
				Background0:completeAnimation()
				self.Background0:setAlpha( 1 )
				self.clipFinished( Background0, {} )
				ContractProgress:completeAnimation()
				self.ContractProgress:setAlpha( 1 )
				self.clipFinished( ContractProgress, {} )
				CryptokeyIcon:completeAnimation()
				self.CryptokeyIcon:setAlpha( 0 )
				self.clipFinished( CryptokeyIcon, {} )
				Divider0:completeAnimation()
				self.Divider0:setAlpha( 0 )
				self.clipFinished( Divider0, {} )
				BMContractstimer:completeAnimation()
				self.clipFinished( BMContractstimer, {} )
				ContractDesc0:completeAnimation()
				self.ContractDesc0:setAlpha( 0 )
				self.clipFinished( ContractDesc0, {} )
				ContractDesc1:completeAnimation()
				self.ContractDesc1:setAlpha( 0 )
				self.clipFinished( ContractDesc1, {} )
				contractsIcon:completeAnimation()
				self.contractsIcon:setAlpha( 0 )
				self.clipFinished( contractsIcon, {} )
				InvalidContractName:completeAnimation()
				self.InvalidContractName:setAlpha( 0 )
				self.clipFinished( InvalidContractName, {} )
				InvalidContractDesc:completeAnimation()
				self.InvalidContractDesc:setAlpha( 0 )
				self.clipFinished( InvalidContractDesc, {} )
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
				return not AreWeeklyContractsValid( controller )
			end
		},
		{
			stateName = "Completed",
			condition = function ( menu, element, event )
				return AreWeeklyContractsComplete( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "contractWeeklyAIndex" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "contractWeeklyAIndex"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "contractWeeklyBIndex" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "contractWeeklyBIndex"
		} )
	end )
	ContractProgress.id = "ContractProgress"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ContractProgress:close()
		element.CryptokeyIcon:close()
		element.BMContractstimer:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

