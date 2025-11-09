require( "ui.uieditor.widgets.Heroes.ChooseCharacterLoadout_CardBack_FrontOfCardFooter" )
require( "ui.uieditor.widgets.BlackMarket.BM_contracts_choosespecialist_CC" )

CoD.ChooseCharacterLoadoutCarouselItem_SideBet = InheritFrom( LUI.UIElement )
CoD.ChooseCharacterLoadoutCarouselItem_SideBet.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.ChooseCharacterLoadoutCarouselItem_SideBet )
	self.id = "ChooseCharacterLoadoutCarouselItem_SideBet"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 816 )
	self:setTopBottom( true, false, 0, 500 )
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 0 )
	background:setRGB( 0, 0, 0 )
	self:addElement( background )
	self.background = background
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( true, false, -4, 821 )
	Image:setTopBottom( true, false, -49, 505 )
	Image:setImage( RegisterImage( "uie_t7_blackmarket_contracts_character_backimg" ) )
	self:addElement( Image )
	self.Image = Image
	
	local ContractBacking = LUI.UIImage.new()
	ContractBacking:setLeftRight( true, true, 422.29, -30 )
	ContractBacking:setTopBottom( true, true, 215.13, -74.25 )
	ContractBacking:setImage( RegisterImage( "uie_t7_blackmarket_contract_blackjack_bg" ) )
	ContractBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	ContractBacking:setShaderVector( 0, 0.08, 0.14, 0, 0 )
	ContractBacking:setupNineSliceShader( 30, 30 )
	self:addElement( ContractBacking )
	self.ContractBacking = ContractBacking
	
	local ChooseCharacterLoadoutCardBackFrontOfCardFooter = CoD.ChooseCharacterLoadout_CardBack_FrontOfCardFooter.new( menu, controller )
	ChooseCharacterLoadoutCardBackFrontOfCardFooter:setLeftRight( false, true, -97, -23 )
	ChooseCharacterLoadoutCardBackFrontOfCardFooter:setTopBottom( false, true, -59, -25.5 )
	ChooseCharacterLoadoutCardBackFrontOfCardFooter.BMContractsspecialistesinglebtnbg:setAlpha( 1 )
	ChooseCharacterLoadoutCardBackFrontOfCardFooter.BlackBox0:setAlpha( 0 )
	ChooseCharacterLoadoutCardBackFrontOfCardFooter.BlackBox:setAlpha( 0 )
	ChooseCharacterLoadoutCardBackFrontOfCardFooter.Line:setAlpha( 0 )
	ChooseCharacterLoadoutCardBackFrontOfCardFooter.frameImage:setAlpha( 0 )
	ChooseCharacterLoadoutCardBackFrontOfCardFooter:subscribeToGlobalModel( controller, "Controller", "alt2_button_image", function ( model )
		local alt2ButtonImage = Engine.GetModelValue( model )
		if alt2ButtonImage then
			ChooseCharacterLoadoutCardBackFrontOfCardFooter.Button2:setImage( RegisterImage( alt2ButtonImage ) )
		end
	end )
	self:addElement( ChooseCharacterLoadoutCardBackFrontOfCardFooter )
	self.ChooseCharacterLoadoutCardBackFrontOfCardFooter = ChooseCharacterLoadoutCardBackFrontOfCardFooter
	
	local keyline1 = LUI.UIImage.new()
	keyline1:setLeftRight( true, true, 425, -30 )
	keyline1:setTopBottom( true, false, 97.25, 98 )
	keyline1:setRGB( 0.87, 0.99, 1 )
	keyline1:setAlpha( 0.5 )
	self:addElement( keyline1 )
	self.keyline1 = keyline1
	
	local ContractLabel = LUI.UIText.new()
	ContractLabel:setLeftRight( true, false, 428.93, 793 )
	ContractLabel:setTopBottom( true, false, 72.25, 96.25 )
	ContractLabel:setRGB( 0.46, 0.8, 0.75 )
	ContractLabel:setText( LocalizeToUpperString( "CONTRACT_SIDE_BET" ) )
	ContractLabel:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	ContractLabel:setLetterSpacing( -0.5 )
	ContractLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ContractLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ContractLabel )
	self.ContractLabel = ContractLabel
	
	local ContractLabel0 = LUI.UIText.new()
	ContractLabel0:setLeftRight( true, false, 429.93, 794 )
	ContractLabel0:setTopBottom( true, false, 195, 215 )
	ContractLabel0:setRGB( 0.46, 0.8, 0.75 )
	ContractLabel0:setText( Engine.Localize( "MENU_REWARD_CAPS" ) )
	ContractLabel0:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	ContractLabel0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ContractLabel0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ContractLabel0 )
	self.ContractLabel0 = ContractLabel0
	
	local loadoutItemDescription0 = LUI.UIText.new()
	loadoutItemDescription0:setLeftRight( true, false, 440, 786 )
	loadoutItemDescription0:setTopBottom( true, false, 106.88, 124.88 )
	loadoutItemDescription0:setRGB( 0.88, 0.88, 0.88 )
	loadoutItemDescription0:setText( Engine.Localize( "MENU_CONTRACT_DESCRIPTIONS" ) )
	loadoutItemDescription0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	loadoutItemDescription0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	loadoutItemDescription0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( loadoutItemDescription0 )
	self.loadoutItemDescription0 = loadoutItemDescription0
	
	local BMcontractschoosespecialistCC = CoD.BM_contracts_choosespecialist_CC.new( menu, controller )
	BMcontractschoosespecialistCC:setLeftRight( true, false, 416.43, 785 )
	BMcontractschoosespecialistCC:setTopBottom( true, false, 229, 426.75 )
	BMcontractschoosespecialistCC:subscribeToGlobalModel( controller, "SideBetCurrentChallenge", nil, function ( model )
		BMcontractschoosespecialistCC:setModel( model, controller )
	end )
	BMcontractschoosespecialistCC:subscribeToGlobalModel( controller, "SideBetCurrentChallenge", "setCount", function ( model )
		local setCount = Engine.GetModelValue( model )
		if setCount then
			BMcontractschoosespecialistCC.text:setText( Engine.Localize( setCount ) )
		end
	end )
	self:addElement( BMcontractschoosespecialistCC )
	self.BMcontractschoosespecialistCC = BMcontractschoosespecialistCC
	
	self:mergeStateConditions( {
		{
			stateName = "DisabledFocus",
			condition = function ( menu, element, event )
				return IsGlobalModelValueTrue( element, controller, "heroSelectionTutorial" )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "heroSelectionTutorial" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "heroSelectionTutorial"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ChooseCharacterLoadoutCardBackFrontOfCardFooter:close()
		element.BMcontractschoosespecialistCC:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

