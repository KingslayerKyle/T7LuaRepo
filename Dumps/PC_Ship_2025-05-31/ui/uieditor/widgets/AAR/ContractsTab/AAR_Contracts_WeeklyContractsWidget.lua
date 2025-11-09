require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.AAR.ContractsTab.AAR_Contracts_timer" )
require( "ui.uieditor.widgets.AAR.ContractsTab.AAR_Contracts_ContractProgressWidget" )
require( "ui.uieditor.widgets.BlackMarket.BM_CryptokeyCounterIcon" )

CoD.AAR_Contracts_WeeklyContractsWidget = InheritFrom( LUI.UIElement )
CoD.AAR_Contracts_WeeklyContractsWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AAR_Contracts_WeeklyContractsWidget )
	self.id = "AAR_Contracts_WeeklyContractsWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 495 )
	self:setTopBottom( true, false, 0, 296 )
	self.anyChildUsesUpdateState = true
	
	local FEButtonPanel0 = CoD.FE_ButtonPanel.new( menu, controller )
	FEButtonPanel0:setLeftRight( true, true, 0, -2 )
	FEButtonPanel0:setTopBottom( true, false, 2, 32 )
	FEButtonPanel0:setRGB( 0, 0, 0 )
	FEButtonPanel0:setAlpha( 0.4 )
	self:addElement( FEButtonPanel0 )
	self.FEButtonPanel0 = FEButtonPanel0
	
	local BMContractsAARtitle0 = CoD.AAR_Contracts_timer.new( menu, controller )
	BMContractsAARtitle0:setLeftRight( true, false, 9, 346 )
	BMContractsAARtitle0:setTopBottom( true, false, 7, 26 )
	BMContractsAARtitle0.Weekly:setText( Engine.Localize( "MPUI_BM_CONTRACT_WEEKLY" ) )
	BMContractsAARtitle0.Timer:setText( Engine.Localize( "$(contractWeeklyRemaining)" ) )
	BMContractsAARtitle0:mergeStateConditions( {
		{
			stateName = "HideTimer",
			condition = function ( menu, element, event )
				return not AreWeeklyContractsValid( controller )
			end
		}
	} )
	BMContractsAARtitle0:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "contractWeeklyAIndex" ), function ( model )
		menu:updateElementState( BMContractsAARtitle0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "contractWeeklyAIndex"
		} )
	end )
	BMContractsAARtitle0:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "contractWeeklyBIndex" ), function ( model )
		menu:updateElementState( BMContractsAARtitle0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "contractWeeklyBIndex"
		} )
	end )
	self:addElement( BMContractsAARtitle0 )
	self.BMContractsAARtitle0 = BMContractsAARtitle0
	
	local ContractProgress = LUI.UIList.new( menu, controller, 0, 0, nil, false, false, 0, 0, false, true )
	ContractProgress:makeFocusable()
	ContractProgress:setLeftRight( false, false, -273, 273 )
	ContractProgress:setTopBottom( true, false, 25, 275 )
	ContractProgress:setWidgetType( CoD.AAR_Contracts_ContractProgressWidget )
	ContractProgress:setHorizontalCount( 2 )
	ContractProgress:setSpacing( 0 )
	ContractProgress:setDataSource( "BlackMarketWeeklyContracts" )
	self:addElement( ContractProgress )
	self.ContractProgress = ContractProgress
	
	local CryptokeyIcon = CoD.BM_CryptokeyCounterIcon.new( menu, controller )
	CryptokeyIcon:setLeftRight( false, false, -95.75, -67.75 )
	CryptokeyIcon:setTopBottom( false, true, -50.76, -22.76 )
	self:addElement( CryptokeyIcon )
	self.CryptokeyIcon = CryptokeyIcon
	
	local Kryptokeys = LUI.UIText.new()
	Kryptokeys:setLeftRight( false, false, -62.75, -34.75 )
	Kryptokeys:setTopBottom( false, true, -45.76, -25.76 )
	Kryptokeys:setRGB( 0.75, 0.75, 0.75 )
	Kryptokeys:setText( DvarLocalizedIntoString( "weekly_contract_cryptokey_reward_count", "PERKS_ITEMTEXT" ) )
	Kryptokeys:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Kryptokeys:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Kryptokeys:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Kryptokeys )
	self.Kryptokeys = Kryptokeys
	
	local CategoryListLine000 = LUI.UIImage.new()
	CategoryListLine000:setLeftRight( false, false, -158, 153 )
	CategoryListLine000:setTopBottom( false, true, -59, -55 )
	CategoryListLine000:setAlpha( 0.25 )
	CategoryListLine000:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CategoryListLine000 )
	self.CategoryListLine000 = CategoryListLine000
	
	local Contracts = LUI.UIText.new()
	Contracts:setLeftRight( false, false, 62.25, 109.25 )
	Contracts:setTopBottom( false, true, -45.76, -25.76 )
	Contracts:setRGB( 0.75, 0.75, 0.75 )
	Contracts:setText( DvarLocalizedIntoString( "weekly_contract_blackjack_contract_reward_count", "PERKS_ITEMTEXT" ) )
	Contracts:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Contracts:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Contracts:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Contracts )
	self.Contracts = Contracts
	
	local cryptokey = LUI.UIImage.new()
	cryptokey:setLeftRight( false, false, 28.75, 62.25 )
	cryptokey:setTopBottom( false, true, -52.51, -19.01 )
	cryptokey:setImage( RegisterImage( "uie_t7_blackmarket_contract_smallicon" ) )
	self:addElement( cryptokey )
	self.cryptokey = cryptokey
	
	local InvalidContractName = LUI.UIText.new()
	InvalidContractName:setLeftRight( true, true, 24, -26 )
	InvalidContractName:setTopBottom( true, false, 195, 215 )
	InvalidContractName:setRGB( 0.94, 0.89, 0.59 )
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
	InvalidContractDesc:setTopBottom( true, false, 215, 235 )
	InvalidContractDesc:setRGB( 0.8, 0.8, 0.8 )
	InvalidContractDesc:setAlpha( 0 )
	InvalidContractDesc:setText( Engine.Localize( "CONTRACT_NULL_DESC" ) )
	InvalidContractDesc:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	InvalidContractDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	InvalidContractDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( InvalidContractDesc )
	self.InvalidContractDesc = InvalidContractDesc
	
	local CompletedIcon = LUI.UIImage.new()
	CompletedIcon:setLeftRight( false, true, -43, 6 )
	CompletedIcon:setTopBottom( true, false, 1, 33 )
	CompletedIcon:setImage( RegisterImage( "uie_t7_bm_contracts_completed_ribbon" ) )
	self:addElement( CompletedIcon )
	self.CompletedIcon = CompletedIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				ContractProgress:completeAnimation()
				self.ContractProgress:setAlpha( 1 )
				self.clipFinished( ContractProgress, {} )
				CryptokeyIcon:completeAnimation()
				self.CryptokeyIcon:setAlpha( 1 )
				self.clipFinished( CryptokeyIcon, {} )
				Kryptokeys:completeAnimation()
				self.Kryptokeys:setAlpha( 1 )
				self.clipFinished( Kryptokeys, {} )
				CategoryListLine000:completeAnimation()
				self.CategoryListLine000:setAlpha( 0.15 )
				self.clipFinished( CategoryListLine000, {} )
				InvalidContractName:completeAnimation()
				self.InvalidContractName:setAlpha( 0 )
				self.clipFinished( InvalidContractName, {} )
				InvalidContractDesc:completeAnimation()
				self.InvalidContractDesc:setAlpha( 0 )
				self.clipFinished( InvalidContractDesc, {} )
				CompletedIcon:completeAnimation()
				self.CompletedIcon:setAlpha( 0 )
				self.clipFinished( CompletedIcon, {} )
			end
		},
		InvalidContract = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				ContractProgress:completeAnimation()
				self.ContractProgress:setAlpha( 0 )
				self.clipFinished( ContractProgress, {} )
				CryptokeyIcon:completeAnimation()
				self.CryptokeyIcon:setAlpha( 0 )
				self.clipFinished( CryptokeyIcon, {} )
				Kryptokeys:completeAnimation()
				self.Kryptokeys:setAlpha( 0 )
				self.clipFinished( Kryptokeys, {} )
				CategoryListLine000:completeAnimation()
				self.CategoryListLine000:setAlpha( 0 )
				self.clipFinished( CategoryListLine000, {} )
				Contracts:completeAnimation()
				self.Contracts:setAlpha( 0 )
				self.clipFinished( Contracts, {} )
				cryptokey:completeAnimation()
				self.cryptokey:setAlpha( 0 )
				self.clipFinished( cryptokey, {} )
				InvalidContractName:completeAnimation()
				self.InvalidContractName:setAlpha( 1 )
				self.clipFinished( InvalidContractName, {} )
				InvalidContractDesc:completeAnimation()
				self.InvalidContractDesc:setAlpha( 1 )
				self.clipFinished( InvalidContractDesc, {} )
				CompletedIcon:completeAnimation()
				self.CompletedIcon:setAlpha( 0 )
				self.clipFinished( CompletedIcon, {} )
			end
		},
		Completed = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				ContractProgress:completeAnimation()
				self.ContractProgress:setAlpha( 1 )
				self.clipFinished( ContractProgress, {} )
				CryptokeyIcon:completeAnimation()
				self.CryptokeyIcon:setAlpha( 0 )
				self.clipFinished( CryptokeyIcon, {} )
				Kryptokeys:completeAnimation()
				self.Kryptokeys:setAlpha( 0 )
				self.clipFinished( Kryptokeys, {} )
				CategoryListLine000:completeAnimation()
				self.CategoryListLine000:setAlpha( 0 )
				self.clipFinished( CategoryListLine000, {} )
				Contracts:completeAnimation()
				self.Contracts:setAlpha( 0 )
				self.clipFinished( Contracts, {} )
				cryptokey:completeAnimation()
				self.cryptokey:setAlpha( 0 )
				self.clipFinished( cryptokey, {} )
				InvalidContractName:completeAnimation()
				self.InvalidContractName:setAlpha( 0 )
				self.clipFinished( InvalidContractName, {} )
				InvalidContractDesc:completeAnimation()
				self.InvalidContractDesc:setAlpha( 0 )
				self.clipFinished( InvalidContractDesc, {} )
				CompletedIcon:completeAnimation()
				self.CompletedIcon:setAlpha( 1 )
				self.clipFinished( CompletedIcon, {} )
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
		element.FEButtonPanel0:close()
		element.BMContractsAARtitle0:close()
		element.ContractProgress:close()
		element.CryptokeyIcon:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

