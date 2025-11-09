require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgIdle" )
require( "ui.uieditor.widgets.horizontalScrollingTextBox_26pt" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.BlackMarket.BM_GoldBarMed" )
require( "ui.uieditor.widgets.BlackMarket.BM_Contracts_LockBars" )

local PreLoadFunc = function ( self, controller )
	Engine.CreateModel( Engine.GetModelForController( controller ), "CombatRecordComparing" )
end

CoD.CombatRecordStatListItem = InheritFrom( LUI.UIElement )
CoD.CombatRecordStatListItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CombatRecordStatListItem )
	self.id = "CombatRecordStatListItem"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 280 )
	self:setTopBottom( true, false, 0, 45 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, true, 0, 0 )
	Background:setTopBottom( true, true, 0, 0 )
	Background:setRGB( 0.5, 0.5, 0.5 )
	Background:setAlpha( 0 )
	self:addElement( Background )
	self.Background = Background
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgInactive:setTopBottom( true, true, -2, 2 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local BoxButtonLrgIdle = CoD.cac_ButtonBoxLrgIdle.new( menu, controller )
	BoxButtonLrgIdle:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgIdle:setTopBottom( true, true, -2, 2 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local blackMarketBackground = LUI.UIImage.new()
	blackMarketBackground:setLeftRight( true, true, 0, 0 )
	blackMarketBackground:setTopBottom( true, true, 0, 0 )
	blackMarketBackground:setRGB( 0, 0, 0 )
	blackMarketBackground:setAlpha( 0 )
	self:addElement( blackMarketBackground )
	self.blackMarketBackground = blackMarketBackground
	
	local ScrollingTextName = CoD.horizontalScrollingTextBox_26pt.new( menu, controller )
	ScrollingTextName:setLeftRight( true, false, 10, 179 )
	ScrollingTextName:setTopBottom( false, false, -13, 13 )
	ScrollingTextName.textBox:setTTF( "fonts/default.ttf" )
	ScrollingTextName.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ScrollingTextName:linkToElementModel( self, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			ScrollingTextName.textBox:setText( Engine.Localize( name ) )
		end
	end )
	self:addElement( ScrollingTextName )
	self.ScrollingTextName = ScrollingTextName
	
	local Stat = LUI.UIText.new()
	Stat:setLeftRight( false, true, -283, -65 )
	Stat:setTopBottom( false, false, -12.5, 12.5 )
	Stat:setTTF( "fonts/default.ttf" )
	Stat:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	Stat:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Stat:linkToElementModel( self, "stat", true, function ( model )
		local stat = Engine.GetModelValue( model )
		if stat then
			Stat:setText( Engine.Localize( stat ) )
		end
	end )
	Stat:registerEventHandler( "menu_loaded", function ( element, event )
		local f5_local0 = nil
		SetupAutoHorizontalAlignArabicText( element )
		if not f5_local0 then
			f5_local0 = element:dispatchEventToChildren( event )
		end
		return f5_local0
	end )
	self:addElement( Stat )
	self.Stat = Stat
	
	local ComparisonStat = LUI.UIText.new()
	ComparisonStat:setLeftRight( false, true, -270, -10 )
	ComparisonStat:setTopBottom( false, false, -12.5, 12.5 )
	ComparisonStat:setRGB( ColorSet.PartyFriendlyBlue.r, ColorSet.PartyFriendlyBlue.g, ColorSet.PartyFriendlyBlue.b )
	ComparisonStat:setTTF( "fonts/default.ttf" )
	ComparisonStat:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	ComparisonStat:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	ComparisonStat:linkToElementModel( self, "statComparison", true, function ( model )
		local statComparison = Engine.GetModelValue( model )
		if statComparison then
			ComparisonStat:setText( Engine.Localize( statComparison ) )
		end
	end )
	ComparisonStat:registerEventHandler( "menu_loaded", function ( element, event )
		local f7_local0 = nil
		SetupAutoHorizontalAlignArabicText( element )
		if not f7_local0 then
			f7_local0 = element:dispatchEventToChildren( event )
		end
		return f7_local0
	end )
	self:addElement( ComparisonStat )
	self.ComparisonStat = ComparisonStat
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, -1.5, 1.5 )
	FocusBarB:setTopBottom( false, true, -3, 1 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, -1.5, 1.5 )
	FocusBarT:setTopBottom( true, false, -1, 3 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local BMGoldBarMed = CoD.BM_GoldBarMed.new( menu, controller )
	BMGoldBarMed:setLeftRight( false, false, -99, 99 )
	BMGoldBarMed:setTopBottom( false, false, -6.5, 6.5 )
	BMGoldBarMed:setAlpha( 0 )
	self:addElement( BMGoldBarMed )
	self.BMGoldBarMed = BMGoldBarMed
	
	local blackMarketBrandIcon = LUI.UIImage.new()
	blackMarketBrandIcon:setLeftRight( false, false, -23, 23 )
	blackMarketBrandIcon:setTopBottom( false, false, -23, 23 )
	blackMarketBrandIcon:setAlpha( 0 )
	blackMarketBrandIcon:setImage( RegisterImage( "uie_t7_icon_blackmarket_encryptedicon_large" ) )
	self:addElement( blackMarketBrandIcon )
	self.blackMarketBrandIcon = blackMarketBrandIcon
	
	local BMContractsLockBars = CoD.BM_Contracts_LockBars.new( menu, controller )
	BMContractsLockBars:setLeftRight( false, false, 8.8, 111.8 )
	BMContractsLockBars:setTopBottom( false, false, -19.25, 15.75 )
	BMContractsLockBars:setAlpha( 0 )
	self:addElement( BMContractsLockBars )
	self.BMContractsLockBars = BMContractsLockBars
	
	local BMContractsLockBars0 = CoD.BM_Contracts_LockBars.new( menu, controller )
	BMContractsLockBars0:setLeftRight( false, false, -111.2, -7.2 )
	BMContractsLockBars0:setTopBottom( false, false, -19.25, 15.75 )
	BMContractsLockBars0:setAlpha( 0 )
	BMContractsLockBars0:setYRot( 180 )
	self:addElement( BMContractsLockBars0 )
	self.BMContractsLockBars0 = BMContractsLockBars0
	
	local bmContractBrandIcon = LUI.UIImage.new()
	bmContractBrandIcon:setLeftRight( false, false, -32.75, 32.75 )
	bmContractBrandIcon:setTopBottom( false, false, -32, 33.5 )
	bmContractBrandIcon:setAlpha( 0 )
	bmContractBrandIcon:setImage( RegisterImage( "uie_t7_bm_special_contracts_logo" ) )
	self:addElement( bmContractBrandIcon )
	self.bmContractBrandIcon = bmContractBrandIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				Stat:completeAnimation()
				self.Stat:setLeftRight( false, true, -270, -10 )
				self.Stat:setTopBottom( false, false, -12.5, 12.5 )
				self.clipFinished( Stat, {} )
				ComparisonStat:completeAnimation()
				self.ComparisonStat:setAlpha( 0 )
				self.clipFinished( ComparisonStat, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				BMContractsLockBars:completeAnimation()
				self.BMContractsLockBars:setAlpha( 0 )
				self.clipFinished( BMContractsLockBars, {} )
				BMContractsLockBars0:completeAnimation()
				self.BMContractsLockBars0:setAlpha( 0 )
				self.clipFinished( BMContractsLockBars0, {} )
				bmContractBrandIcon:completeAnimation()
				self.bmContractBrandIcon:setAlpha( 0 )
				self.clipFinished( bmContractBrandIcon, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 5 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				Stat:completeAnimation()
				self.Stat:setLeftRight( false, true, -270, -10 )
				self.Stat:setTopBottom( false, false, -12.5, 12.5 )
				self.clipFinished( Stat, {} )
				ComparisonStat:completeAnimation()
				self.ComparisonStat:setAlpha( 0 )
				self.clipFinished( ComparisonStat, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end
		},
		BMClassified = {
			DefaultClip = function ()
				self:setupElementClipCounter( 14 )
				Background:completeAnimation()
				self.Background:setAlpha( 0 )
				self.clipFinished( Background, {} )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				blackMarketBackground:completeAnimation()
				self.blackMarketBackground:setAlpha( 1 )
				self.clipFinished( blackMarketBackground, {} )
				ScrollingTextName:completeAnimation()
				self.ScrollingTextName:setAlpha( 0 )
				self.clipFinished( ScrollingTextName, {} )
				Stat:completeAnimation()
				self.Stat:setAlpha( 0 )
				self.clipFinished( Stat, {} )
				ComparisonStat:completeAnimation()
				self.ComparisonStat:setAlpha( 0 )
				self.clipFinished( ComparisonStat, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				BMGoldBarMed:completeAnimation()
				self.BMGoldBarMed:setAlpha( 1 )
				self.clipFinished( BMGoldBarMed, {} )
				blackMarketBrandIcon:completeAnimation()
				self.blackMarketBrandIcon:setAlpha( 1 )
				self.clipFinished( blackMarketBrandIcon, {} )
				BMContractsLockBars:completeAnimation()
				self.BMContractsLockBars:setAlpha( 0 )
				self.clipFinished( BMContractsLockBars, {} )
				BMContractsLockBars0:completeAnimation()
				self.BMContractsLockBars0:setAlpha( 0 )
				self.clipFinished( BMContractsLockBars0, {} )
				bmContractBrandIcon:completeAnimation()
				self.bmContractBrandIcon:setAlpha( 0 )
				self.clipFinished( bmContractBrandIcon, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 11 )
				Background:completeAnimation()
				self.Background:setAlpha( 0 )
				self.clipFinished( Background, {} )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				blackMarketBackground:completeAnimation()
				self.blackMarketBackground:setAlpha( 1 )
				self.clipFinished( blackMarketBackground, {} )
				ScrollingTextName:completeAnimation()
				self.ScrollingTextName:setAlpha( 0 )
				self.clipFinished( ScrollingTextName, {} )
				Stat:completeAnimation()
				self.Stat:setAlpha( 0 )
				self.clipFinished( Stat, {} )
				ComparisonStat:completeAnimation()
				self.ComparisonStat:setAlpha( 0 )
				self.clipFinished( ComparisonStat, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				BMGoldBarMed:completeAnimation()
				self.BMGoldBarMed:setAlpha( 1 )
				self.clipFinished( BMGoldBarMed, {} )
				blackMarketBrandIcon:completeAnimation()
				self.blackMarketBrandIcon:setAlpha( 1 )
				self.clipFinished( blackMarketBrandIcon, {} )
			end
		},
		ContractClassified = {
			DefaultClip = function ()
				self:setupElementClipCounter( 14 )
				Background:completeAnimation()
				self.Background:setAlpha( 0 )
				self.clipFinished( Background, {} )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				blackMarketBackground:completeAnimation()
				self.blackMarketBackground:setAlpha( 1 )
				self.clipFinished( blackMarketBackground, {} )
				ScrollingTextName:completeAnimation()
				self.ScrollingTextName:setAlpha( 0 )
				self.clipFinished( ScrollingTextName, {} )
				Stat:completeAnimation()
				self.Stat:setAlpha( 0 )
				self.clipFinished( Stat, {} )
				ComparisonStat:completeAnimation()
				self.ComparisonStat:setAlpha( 0 )
				self.clipFinished( ComparisonStat, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				BMGoldBarMed:completeAnimation()
				self.BMGoldBarMed:setAlpha( 0 )
				self.clipFinished( BMGoldBarMed, {} )
				blackMarketBrandIcon:completeAnimation()
				self.blackMarketBrandIcon:setAlpha( 0 )
				self.clipFinished( blackMarketBrandIcon, {} )
				BMContractsLockBars:completeAnimation()
				self.BMContractsLockBars:setAlpha( 1 )
				self.clipFinished( BMContractsLockBars, {} )
				BMContractsLockBars0:completeAnimation()
				self.BMContractsLockBars0:setAlpha( 1 )
				self.clipFinished( BMContractsLockBars0, {} )
				bmContractBrandIcon:completeAnimation()
				self.bmContractBrandIcon:setAlpha( 1 )
				self.clipFinished( bmContractBrandIcon, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 14 )
				Background:completeAnimation()
				self.Background:setAlpha( 0 )
				self.clipFinished( Background, {} )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				blackMarketBackground:completeAnimation()
				self.blackMarketBackground:setAlpha( 1 )
				self.clipFinished( blackMarketBackground, {} )
				ScrollingTextName:completeAnimation()
				self.ScrollingTextName:setAlpha( 0 )
				self.clipFinished( ScrollingTextName, {} )
				Stat:completeAnimation()
				self.Stat:setAlpha( 0 )
				self.clipFinished( Stat, {} )
				ComparisonStat:completeAnimation()
				self.ComparisonStat:setAlpha( 0 )
				self.clipFinished( ComparisonStat, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				BMGoldBarMed:completeAnimation()
				self.BMGoldBarMed:setAlpha( 0 )
				self.clipFinished( BMGoldBarMed, {} )
				blackMarketBrandIcon:completeAnimation()
				self.blackMarketBrandIcon:setAlpha( 0 )
				self.clipFinished( blackMarketBrandIcon, {} )
				BMContractsLockBars:completeAnimation()
				self.BMContractsLockBars:setAlpha( 1 )
				self.clipFinished( BMContractsLockBars, {} )
				BMContractsLockBars0:completeAnimation()
				self.BMContractsLockBars0:setAlpha( 1 )
				self.clipFinished( BMContractsLockBars0, {} )
				bmContractBrandIcon:completeAnimation()
				self.bmContractBrandIcon:setAlpha( 1 )
				self.clipFinished( bmContractBrandIcon, {} )
			end
		},
		Comparing = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				ComparisonStat:completeAnimation()
				self.ComparisonStat:setAlpha( 1 )
				self.clipFinished( ComparisonStat, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				BMContractsLockBars:completeAnimation()
				self.BMContractsLockBars:setAlpha( 0 )
				self.clipFinished( BMContractsLockBars, {} )
				BMContractsLockBars0:completeAnimation()
				self.BMContractsLockBars0:setAlpha( 0 )
				self.clipFinished( BMContractsLockBars0, {} )
				bmContractBrandIcon:completeAnimation()
				self.bmContractBrandIcon:setAlpha( 0 )
				self.clipFinished( bmContractBrandIcon, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 4 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				ComparisonStat:completeAnimation()
				self.ComparisonStat:setAlpha( 1 )
				self.clipFinished( ComparisonStat, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "BMClassified",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isBMClassified" )
			end
		},
		{
			stateName = "ContractClassified",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isContractClassified" )
			end
		},
		{
			stateName = "Comparing",
			condition = function ( menu, element, event )
				return IsComparingStats( controller )
			end
		}
	} )
	self:linkToElementModel( self, "isBMClassified", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		} )
	end )
	self:linkToElementModel( self, "isContractClassified", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isContractClassified"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CombatRecordComparing" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CombatRecordComparing"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "OtherPlayerStats.InProgress" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "OtherPlayerStats.InProgress"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "OtherPlayerStats.Success" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "OtherPlayerStats.Success"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BoxButtonLrgInactive:close()
		element.BoxButtonLrgIdle:close()
		element.ScrollingTextName:close()
		element.FocusBarB:close()
		element.FocusBarT:close()
		element.BMGoldBarMed:close()
		element.BMContractsLockBars:close()
		element.BMContractsLockBars0:close()
		element.Stat:close()
		element.ComparisonStat:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

