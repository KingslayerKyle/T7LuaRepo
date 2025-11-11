require( "ui.uieditor.widgets.BlackMarket.BM_GoldBarMed" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgIdle" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

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
	self:setLeftRight( 0, 0, 0, 420 )
	self:setTopBottom( 0, 0, 0, 67 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( 0, 1, 0, 0 )
	Background:setTopBottom( 0, 1, 0, 0 )
	Background:setRGB( 0.5, 0.5, 0.5 )
	Background:setAlpha( 0 )
	self:addElement( Background )
	self.Background = Background
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( 0, 1, -3, 3 )
	BoxButtonLrgInactive:setTopBottom( 0, 1, -3, 3 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local BoxButtonLrgIdle = CoD.cac_ButtonBoxLrgIdle.new( menu, controller )
	BoxButtonLrgIdle:setLeftRight( 0, 1, -3, 3 )
	BoxButtonLrgIdle:setTopBottom( 0, 1, -3, 3 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local blackMarketBackground = LUI.UIImage.new()
	blackMarketBackground:setLeftRight( 0, 1, 0, 0 )
	blackMarketBackground:setTopBottom( 0, 1, 0, 0 )
	blackMarketBackground:setRGB( 0, 0, 0 )
	blackMarketBackground:setAlpha( 0 )
	self:addElement( blackMarketBackground )
	self.blackMarketBackground = blackMarketBackground
	
	local Name = LUI.UITightText.new()
	Name:setLeftRight( 0, 0, 15, 405 )
	Name:setTopBottom( 0.5, 0.5, -19, 19 )
	Name:setTTF( "fonts/default.ttf" )
	Name:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Name:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Name )
	self.Name = Name
	
	local Stat = LUI.UIText.new()
	Stat:setLeftRight( 1, 1, -424, -97 )
	Stat:setTopBottom( 0.5, 0.5, -19, 19 )
	Stat:setTTF( "fonts/default.ttf" )
	Stat:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	Stat:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Stat:linkToElementModel( self, "stat", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Stat:setText( Engine.Localize( modelValue ) )
		end
	end )
	Stat:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SetupAutoHorizontalAlignArabicText( element )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( Stat )
	self.Stat = Stat
	
	local ComparisonStat = LUI.UIText.new()
	ComparisonStat:setLeftRight( 1, 1, -405, -15 )
	ComparisonStat:setTopBottom( 0.5, 0.5, -19, 19 )
	ComparisonStat:setRGB( ColorSet.PartyFriendlyBlue.r, ColorSet.PartyFriendlyBlue.g, ColorSet.PartyFriendlyBlue.b )
	ComparisonStat:setTTF( "fonts/default.ttf" )
	ComparisonStat:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	ComparisonStat:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	ComparisonStat:linkToElementModel( self, "statComparison", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ComparisonStat:setText( Engine.Localize( modelValue ) )
		end
	end )
	ComparisonStat:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SetupAutoHorizontalAlignArabicText( element )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( ComparisonStat )
	self.ComparisonStat = ComparisonStat
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( 0, 1, -2, 2 )
	FocusBarB:setTopBottom( 1, 1, -5, 1 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( 0, 1, -2, 2 )
	FocusBarT:setTopBottom( 0, 0, -1, 5 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local BMGoldBarMed = CoD.BM_GoldBarMed.new( menu, controller )
	BMGoldBarMed:setLeftRight( 0.5, 0.5, -148.5, 148.5 )
	BMGoldBarMed:setTopBottom( 0.5, 0.5, -10, 10 )
	BMGoldBarMed:setAlpha( 0 )
	self:addElement( BMGoldBarMed )
	self.BMGoldBarMed = BMGoldBarMed
	
	local blackMarketBrandIcon = LUI.UIImage.new()
	blackMarketBrandIcon:setLeftRight( 0.5, 0.5, -34.5, 34.5 )
	blackMarketBrandIcon:setTopBottom( 0.5, 0.5, -34.5, 34.5 )
	blackMarketBrandIcon:setAlpha( 0 )
	blackMarketBrandIcon:setImage( RegisterImage( "uie_t7_icon_blackmarket_encryptedicon_large" ) )
	self:addElement( blackMarketBrandIcon )
	self.blackMarketBrandIcon = blackMarketBrandIcon
	
	self.resetProperties = function ()
		FocusBarT:completeAnimation()
		FocusBarB:completeAnimation()
		BoxButtonLrgInactive:completeAnimation()
		Stat:completeAnimation()
		ComparisonStat:completeAnimation()
		BoxButtonLrgIdle:completeAnimation()
		Name:completeAnimation()
		blackMarketBackground:completeAnimation()
		BMGoldBarMed:completeAnimation()
		blackMarketBrandIcon:completeAnimation()
		FocusBarT:setAlpha( 1 )
		FocusBarB:setAlpha( 1 )
		BoxButtonLrgInactive:setAlpha( 1 )
		Stat:setLeftRight( 1, 1, -424, -97 )
		Stat:setTopBottom( 0.5, 0.5, -19, 19 )
		Stat:setAlpha( 1 )
		ComparisonStat:setAlpha( 1 )
		BoxButtonLrgIdle:setAlpha( 1 )
		Name:setAlpha( 1 )
		blackMarketBackground:setAlpha( 0 )
		BMGoldBarMed:setAlpha( 0 )
		blackMarketBrandIcon:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				Stat:completeAnimation()
				self.Stat:setLeftRight( 1, 1, -405.5, -15.5 )
				self.Stat:setTopBottom( 0.5, 0.5, -19, 19 )
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
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				Stat:completeAnimation()
				self.Stat:setLeftRight( 1, 1, -405.5, -15.5 )
				self.Stat:setTopBottom( 0.5, 0.5, -19, 19 )
				self.clipFinished( Stat, {} )
				ComparisonStat:completeAnimation()
				self.ComparisonStat:setAlpha( 0 )
				self.clipFinished( ComparisonStat, {} )
			end
		},
		BMClassified = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 10 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				blackMarketBackground:completeAnimation()
				self.blackMarketBackground:setAlpha( 1 )
				self.clipFinished( blackMarketBackground, {} )
				Name:completeAnimation()
				self.Name:setAlpha( 0 )
				self.clipFinished( Name, {} )
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
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 8 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				blackMarketBackground:completeAnimation()
				self.blackMarketBackground:setAlpha( 1 )
				self.clipFinished( blackMarketBackground, {} )
				Name:completeAnimation()
				self.Name:setAlpha( 0 )
				self.clipFinished( Name, {} )
				Stat:completeAnimation()
				self.Stat:setAlpha( 0 )
				self.clipFinished( Stat, {} )
				ComparisonStat:completeAnimation()
				self.ComparisonStat:setAlpha( 0 )
				self.clipFinished( ComparisonStat, {} )
				BMGoldBarMed:completeAnimation()
				self.BMGoldBarMed:setAlpha( 1 )
				self.clipFinished( BMGoldBarMed, {} )
				blackMarketBrandIcon:completeAnimation()
				self.blackMarketBrandIcon:setAlpha( 1 )
				self.clipFinished( blackMarketBrandIcon, {} )
			end
		},
		Comparing = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BoxButtonLrgInactive:close()
		self.BoxButtonLrgIdle:close()
		self.FocusBarB:close()
		self.FocusBarT:close()
		self.BMGoldBarMed:close()
		self.Name:close()
		self.Stat:close()
		self.ComparisonStat:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

