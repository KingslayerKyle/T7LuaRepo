-- 957c9de44de4d222237b115b51ccc910
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.BlackMarket.BM_Contracts_AAR_title" )
require( "ui.uieditor.widgets.AAR.ContractsTab.AAR_Contracts_PercentCompleteWidget" )
require( "ui.uieditor.widgets.SpecialContracts.SpecialContracts_RewardImage" )
require( "ui.uieditor.widgets.BlackMarket.BM_CompleteRibbon" )

CoD.AAR_Contracts_SpecialContractWidget = InheritFrom( LUI.UIElement )
CoD.AAR_Contracts_SpecialContractWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.AAR_Contracts_SpecialContractWidget )
	self.id = "AAR_Contracts_SpecialContractWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 775 )
	self:setTopBottom( true, false, 0, 180 )
	self.anyChildUsesUpdateState = true
	
	local FEButtonPanel0 = CoD.FE_ButtonPanel.new( menu, controller )
	FEButtonPanel0:setLeftRight( true, true, 0, -2 )
	FEButtonPanel0:setTopBottom( true, false, 1, 31.5 )
	FEButtonPanel0:setRGB( 0, 0, 0 )
	FEButtonPanel0:setAlpha( 0.4 )
	self:addElement( FEButtonPanel0 )
	self.FEButtonPanel0 = FEButtonPanel0
	
	local BMContractsAARtitle = CoD.BM_Contracts_AAR_title.new( menu, controller )
	BMContractsAARtitle:setLeftRight( true, false, 1, 567.21 )
	BMContractsAARtitle:setTopBottom( true, false, 0, 33 )
	BMContractsAARtitle.SubTitle:setText( Engine.Localize( "MPUI_BM_CONTRACT_SPECIAL" ) )
	BMContractsAARtitle.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( BMContractsAARtitle )
	self.BMContractsAARtitle = BMContractsAARtitle
	
	local SpecialContractPercentCompleteWidget = CoD.AAR_Contracts_PercentCompleteWidget.new( menu, controller )
	SpecialContractPercentCompleteWidget:setLeftRight( true, false, -8, 116 )
	SpecialContractPercentCompleteWidget:setTopBottom( true, false, 32.5, 156.5 )
	SpecialContractPercentCompleteWidget:setScale( 0.7 )
	SpecialContractPercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, 0.5, 0, 0, 0 )
	SpecialContractPercentCompleteWidget.percentText:setText( Engine.Localize( "888/888" ) )
	SpecialContractPercentCompleteWidget:subscribeToGlobalModel( controller, "CurrentSpecialContract", nil, function ( model )
		SpecialContractPercentCompleteWidget:setModel( model, controller )
	end )
	SpecialContractPercentCompleteWidget:mergeStateConditions( {
		{
			stateName = "Complete",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isComplete" )
			end
		}
	} )
	SpecialContractPercentCompleteWidget:linkToElementModel( SpecialContractPercentCompleteWidget, "isComplete", true, function ( model )
		menu:updateElementState( SpecialContractPercentCompleteWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isComplete"
		} )
	end )
	self:addElement( SpecialContractPercentCompleteWidget )
	self.SpecialContractPercentCompleteWidget = SpecialContractPercentCompleteWidget
	
	local SpecialContractName = LUI.UIText.new()
	SpecialContractName:setLeftRight( true, false, 143.5, 398.5 )
	SpecialContractName:setTopBottom( true, false, 75, 94 )
	SpecialContractName:setRGB( 0.94, 0.89, 0.59 )
	SpecialContractName:setText( Engine.Localize( "MPUI_CONTRACTS_SPECIAL_TITLE_CAPS" ) )
	SpecialContractName:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	SpecialContractName:setLetterSpacing( -0.5 )
	SpecialContractName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	SpecialContractName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SpecialContractName )
	self.SpecialContractName = SpecialContractName
	
	local SpecialContractDesc = LUI.UIText.new()
	SpecialContractDesc:setLeftRight( true, false, 143.5, 445.5 )
	SpecialContractDesc:setTopBottom( true, false, 96, 114 )
	SpecialContractDesc:setRGB( 0.75, 0.75, 0.75 )
	SpecialContractDesc:setText( "" )
	SpecialContractDesc:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	SpecialContractDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	SpecialContractDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SpecialContractDesc )
	self.SpecialContractDesc = SpecialContractDesc
	
	local CategoryListLine000 = LUI.UIImage.new()
	CategoryListLine000:setLeftRight( true, false, 421, 512 )
	CategoryListLine000:setTopBottom( true, false, 103, 107 )
	CategoryListLine000:setAlpha( 0.25 )
	CategoryListLine000:setZRot( 90 )
	CategoryListLine000:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CategoryListLine000 )
	self.CategoryListLine000 = CategoryListLine000
	
	local RewardImage = CoD.SpecialContracts_RewardImage.new( menu, controller )
	RewardImage:setLeftRight( true, false, 514.04, 702.04 )
	RewardImage:setTopBottom( true, false, 49.06, 153.06 )
	RewardImage.CallingCard.CardIconFrame:setScale( 0.49 )
	RewardImage:subscribeToGlobalModel( controller, "CurrentSpecialContract", nil, function ( model )
		RewardImage:setModel( model, controller )
	end )
	RewardImage:subscribeToGlobalModel( controller, "CurrentSpecialContract", "image", function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			RewardImage.ItemImage:setImage( RegisterImage( image ) )
		end
	end )
	self:addElement( RewardImage )
	self.RewardImage = RewardImage
	
	local BMCompleteRibbon = CoD.BM_CompleteRibbon.new( menu, controller )
	BMCompleteRibbon:setLeftRight( false, true, -188.96, -35.46 )
	BMCompleteRibbon:setTopBottom( true, false, 4.5, 28.5 )
	BMCompleteRibbon.Text:setText( Engine.Localize( "MPUI_BM_CONTRACTS_AVAILABLE" ) )
	BMCompleteRibbon:mergeStateConditions( {
		{
			stateName = "Completed",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( BMCompleteRibbon )
	self.BMCompleteRibbon = BMCompleteRibbon
	
	local BMCompleteRibbon0 = CoD.BM_CompleteRibbon.new( menu, controller )
	BMCompleteRibbon0:setLeftRight( false, true, -580.96, -427.46 )
	BMCompleteRibbon0:setTopBottom( true, false, 4.5, 28.5 )
	BMCompleteRibbon0.Text:setText( Engine.Localize( "MPUI_BM_CONTRACTS_AVAILABLE" ) )
	BMCompleteRibbon0:mergeStateConditions( {
		{
			stateName = "Completed",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( BMCompleteRibbon0 )
	self.BMCompleteRibbon0 = BMCompleteRibbon0
	
	local CompletedIcon = LUI.UIImage.new()
	CompletedIcon:setLeftRight( true, false, 732, 781 )
	CompletedIcon:setTopBottom( true, false, 1, 33 )
	CompletedIcon:setImage( RegisterImage( "uie_t7_bm_contracts_completed_ribbon" ) )
	self:addElement( CompletedIcon )
	self.CompletedIcon = CompletedIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )

				FEButtonPanel0:completeAnimation()
				self.FEButtonPanel0:setLeftRight( true, true, 0, -2 )
				self.FEButtonPanel0:setTopBottom( true, false, 2, 32.5 )
				self.FEButtonPanel0:setAlpha( 0.4 )
				self.clipFinished( FEButtonPanel0, {} )

				BMContractsAARtitle:completeAnimation()
				self.BMContractsAARtitle:setLeftRight( true, true, 1, -149.79 )
				self.BMContractsAARtitle:setTopBottom( true, false, 0, 33 )
				self.clipFinished( BMContractsAARtitle, {} )

				SpecialContractName:completeAnimation()
				self.SpecialContractName:setAlpha( 1 )
				self.clipFinished( SpecialContractName, {} )

				SpecialContractDesc:completeAnimation()
				self.SpecialContractDesc:setAlpha( 1 )
				self.clipFinished( SpecialContractDesc, {} )

				CategoryListLine000:completeAnimation()
				self.CategoryListLine000:setAlpha( 0.25 )
				self.clipFinished( CategoryListLine000, {} )

				RewardImage:completeAnimation()

				RewardImage.ItemImage:completeAnimation()

				RewardImage.CallingCard.CardIconFrame:completeAnimation()
				self.RewardImage:setLeftRight( true, false, 514.04, 702.04 )
				self.RewardImage:setTopBottom( true, false, 49.06, 153.06 )
				self.RewardImage:setAlpha( 1 )
				self.RewardImage.ItemImage:setScale( 1 )
				self.RewardImage.CallingCard.CardIconFrame:setScale( 0.49 )
				self.clipFinished( RewardImage, {} )

				BMCompleteRibbon:completeAnimation()
				self.BMCompleteRibbon:setAlpha( 0 )
				self.clipFinished( BMCompleteRibbon, {} )

				BMCompleteRibbon0:completeAnimation()
				self.BMCompleteRibbon0:setAlpha( 0 )
				self.clipFinished( BMCompleteRibbon0, {} )

				CompletedIcon:completeAnimation()
				self.CompletedIcon:setAlpha( 0 )
				self.clipFinished( CompletedIcon, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )

				FEButtonPanel0:completeAnimation()
				self.FEButtonPanel0:setAlpha( 0 )
				self.clipFinished( FEButtonPanel0, {} )

				BMContractsAARtitle:completeAnimation()
				self.BMContractsAARtitle:setAlpha( 0 )
				self.clipFinished( BMContractsAARtitle, {} )

				SpecialContractPercentCompleteWidget:completeAnimation()
				self.SpecialContractPercentCompleteWidget:setAlpha( 0 )
				self.clipFinished( SpecialContractPercentCompleteWidget, {} )

				SpecialContractName:completeAnimation()
				self.SpecialContractName:setAlpha( 0 )
				self.clipFinished( SpecialContractName, {} )

				SpecialContractDesc:completeAnimation()
				self.SpecialContractDesc:setAlpha( 0 )
				self.clipFinished( SpecialContractDesc, {} )

				CategoryListLine000:completeAnimation()
				self.CategoryListLine000:setAlpha( 0 )
				self.clipFinished( CategoryListLine000, {} )

				RewardImage:completeAnimation()
				self.RewardImage:setAlpha( 0 )
				self.clipFinished( RewardImage, {} )

				BMCompleteRibbon:completeAnimation()
				self.BMCompleteRibbon:setAlpha( 0 )
				self.clipFinished( BMCompleteRibbon, {} )

				BMCompleteRibbon0:completeAnimation()
				self.BMCompleteRibbon0:setAlpha( 0 )
				self.clipFinished( BMCompleteRibbon0, {} )

				CompletedIcon:completeAnimation()
				self.CompletedIcon:setAlpha( 0 )
				self.clipFinished( CompletedIcon, {} )
			end
		},
		Short = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )

				FEButtonPanel0:completeAnimation()
				self.FEButtonPanel0:setLeftRight( true, false, 0, 383 )
				self.FEButtonPanel0:setTopBottom( true, false, 0.75, 31.25 )
				self.FEButtonPanel0:setAlpha( 0.4 )
				self.clipFinished( FEButtonPanel0, {} )

				BMContractsAARtitle:completeAnimation()
				self.BMContractsAARtitle:setLeftRight( true, false, 1, 383 )
				self.BMContractsAARtitle:setTopBottom( true, false, 0, 33 )
				self.clipFinished( BMContractsAARtitle, {} )

				SpecialContractPercentCompleteWidget:completeAnimation()
				self.SpecialContractPercentCompleteWidget:setLeftRight( true, false, -12, 112 )
				self.SpecialContractPercentCompleteWidget:setTopBottom( true, false, 21.54, 145.54 )
				self.SpecialContractPercentCompleteWidget:setScale( 0.65 )
				self.clipFinished( SpecialContractPercentCompleteWidget, {} )

				SpecialContractName:completeAnimation()
				self.SpecialContractName:setLeftRight( true, false, 112, 336 )
				self.SpecialContractName:setTopBottom( true, false, 57.91, 75.09 )
				self.SpecialContractName:setAlpha( 1 )
				self.clipFinished( SpecialContractName, {} )

				SpecialContractDesc:completeAnimation()
				self.SpecialContractDesc:setLeftRight( true, false, 113.5, 349.5 )
				self.SpecialContractDesc:setTopBottom( true, false, 75.09, 93.09 )
				self.SpecialContractDesc:setAlpha( 1 )
				self.clipFinished( SpecialContractDesc, {} )

				CategoryListLine000:completeAnimation()
				self.CategoryListLine000:setLeftRight( true, false, 71, 336 )
				self.CategoryListLine000:setTopBottom( true, false, 130, 134 )
				self.CategoryListLine000:setAlpha( 0.25 )
				self.CategoryListLine000:setZRot( 0 )
				self.clipFinished( CategoryListLine000, {} )

				RewardImage:completeAnimation()

				RewardImage.ItemImage:completeAnimation()

				RewardImage.CallingCard.CardIconFrame:completeAnimation()
				self.RewardImage:setLeftRight( true, false, 136.9, 270.1 )
				self.RewardImage:setTopBottom( true, false, 132, 205.17 )
				self.RewardImage:setAlpha( 1 )
				self.RewardImage.ItemImage:setScale( 0.71 )
				self.RewardImage.CallingCard.CardIconFrame:setScale( 0.42 )
				self.clipFinished( RewardImage, {} )

				BMCompleteRibbon:completeAnimation()
				self.BMCompleteRibbon:setAlpha( 0 )
				self.clipFinished( BMCompleteRibbon, {} )

				BMCompleteRibbon0:completeAnimation()
				self.BMCompleteRibbon0:setAlpha( 0 )
				self.clipFinished( BMCompleteRibbon0, {} )

				CompletedIcon:completeAnimation()
				self.CompletedIcon:setAlpha( 0 )
				self.clipFinished( CompletedIcon, {} )
			end
		},
		Completed = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				FEButtonPanel0:completeAnimation()
				self.FEButtonPanel0:setLeftRight( true, true, 0, -2 )
				self.FEButtonPanel0:setTopBottom( true, false, 2, 32.5 )
				self.FEButtonPanel0:setAlpha( 0.4 )
				self.clipFinished( FEButtonPanel0, {} )

				BMContractsAARtitle:completeAnimation()
				self.BMContractsAARtitle:setLeftRight( true, false, 1, 567.21 )
				self.BMContractsAARtitle:setTopBottom( true, false, 0, 33 )
				self.clipFinished( BMContractsAARtitle, {} )

				CategoryListLine000:completeAnimation()
				self.CategoryListLine000:setAlpha( 0.25 )
				self.clipFinished( CategoryListLine000, {} )

				RewardImage:completeAnimation()

				RewardImage.ItemImage:completeAnimation()

				RewardImage.CallingCard.CardIconFrame:completeAnimation()
				self.RewardImage:setLeftRight( true, false, 514.04, 702.04 )
				self.RewardImage:setTopBottom( true, false, 49.06, 153.06 )
				self.RewardImage:setAlpha( 1 )
				self.RewardImage.ItemImage:setScale( 1 )
				self.RewardImage.CallingCard.CardIconFrame:setScale( 0.39 )
				self.clipFinished( RewardImage, {} )

				BMCompleteRibbon:completeAnimation()
				self.BMCompleteRibbon:setAlpha( 1 )
				self.clipFinished( BMCompleteRibbon, {} )

				BMCompleteRibbon0:completeAnimation()
				self.BMCompleteRibbon0:setAlpha( 0 )
				self.clipFinished( BMCompleteRibbon0, {} )

				CompletedIcon:completeAnimation()
				self.CompletedIcon:setAlpha( 1 )
				self.clipFinished( CompletedIcon, {} )
			end
		},
		CompletedShort = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )

				FEButtonPanel0:completeAnimation()
				self.FEButtonPanel0:setLeftRight( true, false, 0, 383 )
				self.FEButtonPanel0:setTopBottom( true, false, 1, 31.5 )
				self.FEButtonPanel0:setAlpha( 0.4 )
				self.clipFinished( FEButtonPanel0, {} )

				BMContractsAARtitle:completeAnimation()
				self.BMContractsAARtitle:setLeftRight( true, false, 1, 177 )
				self.BMContractsAARtitle:setTopBottom( true, false, 0, 33 )
				self.clipFinished( BMContractsAARtitle, {} )

				SpecialContractPercentCompleteWidget:completeAnimation()
				self.SpecialContractPercentCompleteWidget:setLeftRight( true, false, -12, 112 )
				self.SpecialContractPercentCompleteWidget:setTopBottom( true, false, 21.54, 145.54 )
				self.SpecialContractPercentCompleteWidget:setScale( 0.65 )
				self.clipFinished( SpecialContractPercentCompleteWidget, {} )

				SpecialContractName:completeAnimation()
				self.SpecialContractName:setLeftRight( true, false, 112, 336 )
				self.SpecialContractName:setTopBottom( true, false, 57.91, 75.09 )
				self.SpecialContractName:setAlpha( 1 )
				self.clipFinished( SpecialContractName, {} )

				SpecialContractDesc:completeAnimation()
				self.SpecialContractDesc:setLeftRight( true, false, 113.5, 349.5 )
				self.SpecialContractDesc:setTopBottom( true, false, 75.09, 93.09 )
				self.SpecialContractDesc:setAlpha( 1 )
				self.clipFinished( SpecialContractDesc, {} )

				CategoryListLine000:completeAnimation()
				self.CategoryListLine000:setLeftRight( true, false, 71, 336 )
				self.CategoryListLine000:setTopBottom( true, false, 130, 134 )
				self.CategoryListLine000:setAlpha( 0.25 )
				self.CategoryListLine000:setZRot( 0 )
				self.clipFinished( CategoryListLine000, {} )

				RewardImage:completeAnimation()

				RewardImage.ItemImage:completeAnimation()

				RewardImage.CallingCard.CardIconFrame:completeAnimation()
				self.RewardImage:setLeftRight( true, false, 136.9, 270.1 )
				self.RewardImage:setTopBottom( true, false, 132, 205.17 )
				self.RewardImage:setAlpha( 1 )
				self.RewardImage.ItemImage:setScale( 0.71 )
				self.RewardImage.CallingCard.CardIconFrame:setScale( 0.42 )
				self.clipFinished( RewardImage, {} )

				BMCompleteRibbon:completeAnimation()
				self.BMCompleteRibbon:setAlpha( 0 )
				self.clipFinished( BMCompleteRibbon, {} )

				BMCompleteRibbon0:completeAnimation()
				self.BMCompleteRibbon0:setAlpha( 1 )
				self.clipFinished( BMCompleteRibbon0, {} )

				CompletedIcon:completeAnimation()
				self.CompletedIcon:setLeftRight( true, false, 340, 389 )
				self.CompletedIcon:setTopBottom( true, false, 1, 33 )
				self.clipFinished( CompletedIcon, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEButtonPanel0:close()
		element.BMContractsAARtitle:close()
		element.SpecialContractPercentCompleteWidget:close()
		element.RewardImage:close()
		element.BMCompleteRibbon:close()
		element.BMCompleteRibbon0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
