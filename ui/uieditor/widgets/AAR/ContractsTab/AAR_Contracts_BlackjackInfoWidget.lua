-- ded8312bd0cc525163433915b0ae55ff
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.BlackMarket.BM_Contracts_CC_AAR_Widget" )
require( "ui.uieditor.widgets.BlackMarket.BM_Contracts_ContractAmount_ARR_Widget" )
require( "ui.uieditor.widgets.BlackMarket.BM_Contracts_BJ_ActivatedWidget" )
require( "ui.uieditor.widgets.BlackMarket.BM_Contracts_AAR_title" )

CoD.AAR_Contracts_BlackjackInfoWidget = InheritFrom( LUI.UIElement )
CoD.AAR_Contracts_BlackjackInfoWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.AAR_Contracts_BlackjackInfoWidget )
	self.id = "AAR_Contracts_BlackjackInfoWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 414 )
	self:setTopBottom( true, false, 0, 518 )
	self.anyChildUsesUpdateState = true
	
	local FEButtonPanel0 = CoD.FE_ButtonPanel.new( menu, controller )
	FEButtonPanel0:setLeftRight( true, true, 0, -2 )
	FEButtonPanel0:setTopBottom( true, true, 2, -485 )
	FEButtonPanel0:setRGB( 0, 0, 0 )
	FEButtonPanel0:setAlpha( 0.4 )
	self:addElement( FEButtonPanel0 )
	self.FEButtonPanel0 = FEButtonPanel0
	
	local BlackjackIconOff = LUI.UIImage.new()
	BlackjackIconOff:setLeftRight( false, true, -426, 0.84 )
	BlackjackIconOff:setTopBottom( false, true, -494.76, 7.41 )
	BlackjackIconOff:setAlpha( 0 )
	BlackjackIconOff:setImage( RegisterImage( "uie_t7_blackmarket_contracts_blackjack_off" ) )
	self:addElement( BlackjackIconOff )
	self.BlackjackIconOff = BlackjackIconOff
	
	local BlackjackIconOn = LUI.UIImage.new()
	BlackjackIconOn:setLeftRight( false, true, -409, 17.84 )
	BlackjackIconOn:setTopBottom( false, true, -494.76, 7.41 )
	BlackjackIconOn:setAlpha( 0.8 )
	BlackjackIconOn:setImage( RegisterImage( "uie_t7_blackmarket_contracts_blackjack_completed" ) )
	self:addElement( BlackjackIconOn )
	self.BlackjackIconOn = BlackjackIconOn
	
	local BlackjackContractsDescription = LUI.UIText.new()
	BlackjackContractsDescription:setLeftRight( true, false, 13, 273.75 )
	BlackjackContractsDescription:setTopBottom( true, false, 169.5, 187.5 )
	BlackjackContractsDescription:setRGB( 0.75, 0.75, 0.75 )
	BlackjackContractsDescription:setText( Engine.Localize( "MPUI_BM_CONTRACT_BLACKJACK_CONTRACTS_DESC" ) )
	BlackjackContractsDescription:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	BlackjackContractsDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	BlackjackContractsDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( BlackjackContractsDescription )
	self.BlackjackContractsDescription = BlackjackContractsDescription
	
	local SideBetTitle = LUI.UIText.new()
	SideBetTitle:setLeftRight( true, false, 12, 289.25 )
	SideBetTitle:setTopBottom( true, false, 295.5, 315.5 )
	SideBetTitle:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	SideBetTitle:setLetterSpacing( -0.5 )
	SideBetTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	SideBetTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	SideBetTitle:subscribeToGlobalModel( controller, "SideBetCurrentChallenge", "title", function ( model )
		local title = Engine.GetModelValue( model )
		if title then
			SideBetTitle:setText( Engine.Localize( title ) )
		end
	end )
	self:addElement( SideBetTitle )
	self.SideBetTitle = SideBetTitle
	
	local CategoryListLine000 = LUI.UIImage.new()
	CategoryListLine000:setLeftRight( true, false, 36, 250 )
	CategoryListLine000:setTopBottom( true, false, 273, 277 )
	CategoryListLine000:setAlpha( 0.15 )
	CategoryListLine000:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CategoryListLine000 )
	self.CategoryListLine000 = CategoryListLine000
	
	local BMContractsCCAARWidget = CoD.BM_Contracts_CC_AAR_Widget.new( menu, controller )
	BMContractsCCAARWidget:setLeftRight( true, false, -16.38, 333.63 )
	BMContractsCCAARWidget:setTopBottom( true, false, 305.5, 481.5 )
	BMContractsCCAARWidget:subscribeToGlobalModel( controller, "SideBetCurrentChallenge", nil, function ( model )
		BMContractsCCAARWidget:setModel( model, controller )
	end )
	self:addElement( BMContractsCCAARWidget )
	self.BMContractsCCAARWidget = BMContractsCCAARWidget
	
	local BMContractsContractAmountARRWidget = CoD.BM_Contracts_ContractAmount_ARR_Widget.new( menu, controller )
	BMContractsContractAmountARRWidget:setLeftRight( true, false, 9, 214 )
	BMContractsContractAmountARRWidget:setTopBottom( true, false, 85.5, 165.5 )
	BMContractsContractAmountARRWidget:mergeStateConditions( {
		{
			stateName = "None",
			condition = function ( menu, element, event )
				return IsStorageValueEqualTo( controller, "stats_mp", "blackjack_contract_count", 0 )
			end
		}
	} )
	self:addElement( BMContractsContractAmountARRWidget )
	self.BMContractsContractAmountARRWidget = BMContractsContractAmountARRWidget
	
	local BlackjackContractsDescription0 = LUI.UIText.new()
	BlackjackContractsDescription0:setLeftRight( true, false, 13, 273.75 )
	BlackjackContractsDescription0:setTopBottom( true, false, 241, 258 )
	BlackjackContractsDescription0:setRGB( 0.75, 0.75, 0.75 )
	BlackjackContractsDescription0:setAlpha( 0 )
	BlackjackContractsDescription0:setText( Engine.Localize( "MPUI_BM_CONTRACT_BLACKJACK_CONTRACTS_DESC_2" ) )
	BlackjackContractsDescription0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	BlackjackContractsDescription0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	BlackjackContractsDescription0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( BlackjackContractsDescription0 )
	self.BlackjackContractsDescription0 = BlackjackContractsDescription0
	
	local BMContractsBJActivatedWidget = CoD.BM_Contracts_BJ_ActivatedWidget.new( menu, controller )
	BMContractsBJActivatedWidget:setLeftRight( true, false, 8.25, 272.25 )
	BMContractsBJActivatedWidget:setTopBottom( true, false, 235.5, 259.5 )
	BMContractsBJActivatedWidget.BMContractsBJTextWidget.Activated:setText( Engine.Localize( "MENU_ACTIVATED_CAPS" ) )
	BMContractsBJActivatedWidget:subscribeToGlobalModel( controller, "SideBetCurrentChallenge", "timeSeconds", function ( model )
		local timeSeconds = Engine.GetModelValue( model )
		if timeSeconds then
			BMContractsBJActivatedWidget.BMContractsBJTextWidget.TimeRemaining0:setText( LocalizeIntoString( "MPUI_BM_CONTRACTS_TIME_REMAINING", SecondsAsTime( timeSeconds ) ) )
		end
	end )
	self:addElement( BMContractsBJActivatedWidget )
	self.BMContractsBJActivatedWidget = BMContractsBJActivatedWidget
	
	local BMContractsAARtitle = CoD.BM_Contracts_AAR_title.new( menu, controller )
	BMContractsAARtitle:setLeftRight( true, true, 1, -1 )
	BMContractsAARtitle:setTopBottom( true, false, 0, 33 )
	BMContractsAARtitle.SubTitle:setText( Engine.Localize( "MPUI_BM_CONTRACT_BLACKJACK" ) )
	BMContractsAARtitle.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( BMContractsAARtitle )
	self.BMContractsAARtitle = BMContractsAARtitle
	
	local ContractLabel = LUI.UIText.new()
	ContractLabel:setLeftRight( true, false, 12, 294.5 )
	ContractLabel:setTopBottom( true, false, 69.69, 89.69 )
	ContractLabel:setRGB( 0.94, 0.89, 0.59 )
	ContractLabel:setText( Engine.Localize( "FEATURE_CONTRACTS_CAPS" ) )
	ContractLabel:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	ContractLabel:setLetterSpacing( -0.5 )
	ContractLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ContractLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ContractLabel )
	self.ContractLabel = ContractLabel
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				BlackjackIconOff:completeAnimation()
				self.BlackjackIconOff:setLeftRight( false, true, -426, 0.84 )
				self.BlackjackIconOff:setTopBottom( false, true, -494.76, 7.41 )
				self.BlackjackIconOff:setAlpha( 0.6 )
				self.clipFinished( BlackjackIconOff, {} )
				BlackjackIconOn:completeAnimation()
				self.BlackjackIconOn:setAlpha( 0 )
				self.clipFinished( BlackjackIconOn, {} )
				BlackjackContractsDescription:completeAnimation()
				self.BlackjackContractsDescription:setLeftRight( true, false, 13, 273.75 )
				self.BlackjackContractsDescription:setTopBottom( true, false, 184.5, 202.5 )
				self.clipFinished( BlackjackContractsDescription, {} )
				SideBetTitle:completeAnimation()
				self.SideBetTitle:setAlpha( 0 )
				self.clipFinished( SideBetTitle, {} )
				CategoryListLine000:completeAnimation()
				self.CategoryListLine000:setLeftRight( true, false, 12, 226 )
				self.CategoryListLine000:setTopBottom( true, false, 234, 238 )
				self.CategoryListLine000:setAlpha( 0.25 )
				self.clipFinished( CategoryListLine000, {} )
				BMContractsCCAARWidget:completeAnimation()
				self.BMContractsCCAARWidget:setAlpha( 0 )
				self.clipFinished( BMContractsCCAARWidget, {} )
				BlackjackContractsDescription0:completeAnimation()
				self.BlackjackContractsDescription0:setLeftRight( true, false, 13, 273.75 )
				self.BlackjackContractsDescription0:setTopBottom( true, false, 256, 274 )
				self.BlackjackContractsDescription0:setAlpha( 1 )
				self.BlackjackContractsDescription0:setText( Engine.Localize( "MPUI_BM_CONTRACT_BLACKJACK_CONTRACTS_DESC_2" ) )
				self.clipFinished( BlackjackContractsDescription0, {} )
				BMContractsBJActivatedWidget:completeAnimation()
				self.BMContractsBJActivatedWidget:setAlpha( 0 )
				self.clipFinished( BMContractsBJActivatedWidget, {} )
			end
		},
		Activated = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				BlackjackIconOff:completeAnimation()
				self.BlackjackIconOff:setAlpha( 0 )
				self.clipFinished( BlackjackIconOff, {} )
				BlackjackIconOn:completeAnimation()
				self.BlackjackIconOn:setAlpha( 0.6 )
				self.clipFinished( BlackjackIconOn, {} )
				SideBetTitle:completeAnimation()
				self.SideBetTitle:setAlpha( 1 )
				self.clipFinished( SideBetTitle, {} )
				CategoryListLine000:completeAnimation()
				self.CategoryListLine000:setLeftRight( true, false, 21, 235 )
				self.CategoryListLine000:setTopBottom( true, false, 273, 277 )
				self.CategoryListLine000:setAlpha( 0.15 )
				self.clipFinished( CategoryListLine000, {} )
				BMContractsCCAARWidget:completeAnimation()
				self.BMContractsCCAARWidget:setScale( 1 )
				self.clipFinished( BMContractsCCAARWidget, {} )
				BlackjackContractsDescription0:completeAnimation()
				self.BlackjackContractsDescription0:setAlpha( 0 )
				self.clipFinished( BlackjackContractsDescription0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Activated",
			condition = function ( menu, element, event )
				return IsBlackjackContractActive( controller )
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEButtonPanel0:close()
		element.BMContractsCCAARWidget:close()
		element.BMContractsContractAmountARRWidget:close()
		element.BMContractsBJActivatedWidget:close()
		element.BMContractsAARtitle:close()
		element.SideBetTitle:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

