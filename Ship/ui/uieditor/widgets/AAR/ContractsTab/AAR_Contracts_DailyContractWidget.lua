-- f56d2d9c06551355b27ca2d3eaf59b62
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.AAR.ContractsTab.AAR_Contracts_timer" )
require( "ui.uieditor.widgets.AAR.ContractsTab.AAR_Contracts_ContractProgressWidget" )
require( "ui.uieditor.widgets.AAR.ContractsTab.AAR_Contracts_DoubleCryptokeys" )

CoD.AAR_Contracts_DailyContractWidget = InheritFrom( LUI.UIElement )
CoD.AAR_Contracts_DailyContractWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.AAR_Contracts_DailyContractWidget )
	self.id = "AAR_Contracts_DailyContractWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 275 )
	self:setTopBottom( true, false, 0, 296 )
	self.anyChildUsesUpdateState = true
	
	local FEButtonPanel0 = CoD.FE_ButtonPanel.new( menu, controller )
	FEButtonPanel0:setLeftRight( true, true, 0, -2 )
	FEButtonPanel0:setTopBottom( true, false, 2, 32 )
	FEButtonPanel0:setRGB( 0, 0, 0 )
	FEButtonPanel0:setAlpha( 0.4 )
	self:addElement( FEButtonPanel0 )
	self.FEButtonPanel0 = FEButtonPanel0
	
	local BMContractsAARtitle = CoD.AAR_Contracts_timer.new( menu, controller )
	BMContractsAARtitle:setLeftRight( true, false, 9, 176.5 )
	BMContractsAARtitle:setTopBottom( true, false, 7, 26 )
	BMContractsAARtitle.Weekly:setText( Engine.Localize( "MPUI_BM_CONTRACT_DAILY" ) )
	BMContractsAARtitle.Timer:setText( Engine.Localize( "$(contractDailyRemaining)" ) )
	BMContractsAARtitle:mergeStateConditions( {
		{
			stateName = "HideTimer",
			condition = function ( menu, element, event )
				return not IsDailyContractValid( controller )
			end
		}
	} )
	BMContractsAARtitle:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "contractDailyIndex" ), function ( model )
		menu:updateElementState( BMContractsAARtitle, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "contractDailyIndex"
		} )
	end )
	self:addElement( BMContractsAARtitle )
	self.BMContractsAARtitle = BMContractsAARtitle
	
	local ContractProgress = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, true )
	ContractProgress:makeFocusable()
	ContractProgress:setLeftRight( false, false, -137.5, 135.5 )
	ContractProgress:setTopBottom( true, false, 25, 275 )
	ContractProgress:setWidgetType( CoD.AAR_Contracts_ContractProgressWidget )
	ContractProgress:setDataSource( "BlackMarketDailyContracts" )
	self:addElement( ContractProgress )
	self.ContractProgress = ContractProgress
	
	local CategoryListLine000 = LUI.UIImage.new()
	CategoryListLine000:setLeftRight( false, false, -53.5, 53.5 )
	CategoryListLine000:setTopBottom( false, true, -53, -49 )
	CategoryListLine000:setAlpha( 0.15 )
	CategoryListLine000:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CategoryListLine000 )
	self.CategoryListLine000 = CategoryListLine000
	
	local AARContractsDoubleCryptokeys = CoD.AAR_Contracts_DoubleCryptokeys.new( menu, controller )
	AARContractsDoubleCryptokeys:setLeftRight( true, false, -6.84, 207.16 )
	AARContractsDoubleCryptokeys:setTopBottom( false, true, -70.76, 17.24 )
	AARContractsDoubleCryptokeys:mergeStateConditions( {
		{
			stateName = "DoubleCryptoKeys",
			condition = function ( menu, element, event )
				return IsDoubleDailyContract_NoValidation( controller )
			end
		}
	} )
	self:addElement( AARContractsDoubleCryptokeys )
	self.AARContractsDoubleCryptokeys = AARContractsDoubleCryptokeys
	
	local CompletedIcon = LUI.UIImage.new()
	CompletedIcon:setLeftRight( false, true, -43, 6 )
	CompletedIcon:setTopBottom( true, false, 1, 33 )
	CompletedIcon:setImage( RegisterImage( "uie_t7_bm_contracts_completed_ribbon" ) )
	self:addElement( CompletedIcon )
	self.CompletedIcon = CompletedIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				CategoryListLine000:completeAnimation()
				self.CategoryListLine000:setAlpha( 0.15 )
				self.clipFinished( CategoryListLine000, {} )

				AARContractsDoubleCryptokeys:completeAnimation()
				self.AARContractsDoubleCryptokeys:setAlpha( 1 )
				self.clipFinished( AARContractsDoubleCryptokeys, {} )

				CompletedIcon:completeAnimation()
				self.CompletedIcon:setAlpha( 0 )
				self.clipFinished( CompletedIcon, {} )
			end
		},
		InvalidContract = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				CategoryListLine000:completeAnimation()
				self.CategoryListLine000:setAlpha( 0 )
				self.clipFinished( CategoryListLine000, {} )

				AARContractsDoubleCryptokeys:completeAnimation()
				self.AARContractsDoubleCryptokeys:setAlpha( 0 )
				self.clipFinished( AARContractsDoubleCryptokeys, {} )
			end
		},
		Completed = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				CategoryListLine000:completeAnimation()
				self.CategoryListLine000:setAlpha( 0 )
				self.clipFinished( CategoryListLine000, {} )

				AARContractsDoubleCryptokeys:completeAnimation()
				self.AARContractsDoubleCryptokeys:setAlpha( 0 )
				self.clipFinished( AARContractsDoubleCryptokeys, {} )

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
		element.FEButtonPanel0:close()
		element.BMContractsAARtitle:close()
		element.ContractProgress:close()
		element.AARContractsDoubleCryptokeys:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
