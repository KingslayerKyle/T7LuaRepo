require( "ui.uieditor.widgets.CharacterCustomization.ChooseCharacterLoadoutCarouselItem_InfoAreaWeapon" )

CoD.ChooseContracterCharacterLoadoutCarouselItem_ContractInfoArea = InheritFrom( LUI.UIElement )
CoD.ChooseContracterCharacterLoadoutCarouselItem_ContractInfoArea.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChooseContracterCharacterLoadoutCarouselItem_ContractInfoArea )
	self.id = "ChooseContracterCharacterLoadoutCarouselItem_ContractInfoArea"
	self.soundSet = "none"
	self:setLeftRight( 0, 0, 0, 283 )
	self:setTopBottom( 0, 0, 0, 94 )
	
	local contractsBacking = LUI.UIImage.new()
	contractsBacking:setLeftRight( 0, 0, 0, 138 )
	contractsBacking:setTopBottom( 0, 0, 70, 94 )
	contractsBacking:setRGB( 0, 0, 0 )
	self:addElement( contractsBacking )
	self.contractsBacking = contractsBacking
	
	local contractsHeader = LUI.UIText.new()
	contractsHeader:setLeftRight( 0, 0, 0, 138 )
	contractsHeader:setTopBottom( 0, 0, 46, 70 )
	contractsHeader:setText( Engine.Localize( "MENU_CONTRACTS" ) )
	contractsHeader:setTTF( "fonts/default.ttf" )
	contractsHeader:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	contractsHeader:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( contractsHeader )
	self.contractsHeader = contractsHeader
	
	local contracts = LUI.UIText.new()
	contracts:setLeftRight( 0, 0, 0, 138 )
	contracts:setTopBottom( 0, 0, 70, 94 )
	contracts:setTTF( "fonts/default.ttf" )
	contracts:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	contracts:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	contracts:linkToElementModel( self, "contractsRemaining", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			contracts:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( contracts )
	self.contracts = contracts
	
	local timeRemainingBacking = LUI.UIImage.new()
	timeRemainingBacking:setLeftRight( 0, 0, 145, 283 )
	timeRemainingBacking:setTopBottom( 0, 0, 70, 94 )
	timeRemainingBacking:setRGB( 0, 0, 0 )
	self:addElement( timeRemainingBacking )
	self.timeRemainingBacking = timeRemainingBacking
	
	local timeRemainingHeader = LUI.UIText.new()
	timeRemainingHeader:setLeftRight( 0, 0, 145, 283 )
	timeRemainingHeader:setTopBottom( 0, 0, 46, 70 )
	timeRemainingHeader:setText( Engine.Localize( "MENU_TIME_REMAINING" ) )
	timeRemainingHeader:setTTF( "fonts/default.ttf" )
	timeRemainingHeader:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	timeRemainingHeader:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( timeRemainingHeader )
	self.timeRemainingHeader = timeRemainingHeader
	
	local timeRemaining = LUI.UIText.new()
	timeRemaining:setLeftRight( 0, 0, 145, 283 )
	timeRemaining:setTopBottom( 0, 0, 70, 94 )
	timeRemaining:setTTF( "fonts/default.ttf" )
	timeRemaining:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	timeRemaining:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	timeRemaining:linkToElementModel( self, "activeTimeRemaining", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			timeRemaining:setText( NumberAsTime( modelValue ) )
		end
	end )
	self:addElement( timeRemaining )
	self.timeRemaining = timeRemaining
	
	local ChooseCharacterLoadoutCarouselItemInfoAreaWeapon = CoD.ChooseCharacterLoadoutCarouselItem_InfoAreaWeapon.new( menu, controller )
	ChooseCharacterLoadoutCarouselItemInfoAreaWeapon:setLeftRight( 0, 0, 0, 274 )
	ChooseCharacterLoadoutCarouselItemInfoAreaWeapon:setTopBottom( 0, 0, 0, 38 )
	ChooseCharacterLoadoutCarouselItemInfoAreaWeapon.BlackBox:setRGB( 0.42, 0.75, 0.27 )
	ChooseCharacterLoadoutCarouselItemInfoAreaWeapon.BlackBox:setAlpha( 1 )
	ChooseCharacterLoadoutCarouselItemInfoAreaWeapon.loadOutItemName:setRGB( 0, 0, 0 )
	ChooseCharacterLoadoutCarouselItemInfoAreaWeapon.loadOutItemName:setText( LocalizeToUpperString( "MENU_ACTIVATED_CAPS" ) )
	self:addElement( ChooseCharacterLoadoutCarouselItemInfoAreaWeapon )
	self.ChooseCharacterLoadoutCarouselItemInfoAreaWeapon = ChooseCharacterLoadoutCarouselItemInfoAreaWeapon
	
	self.resetProperties = function ()
		timeRemainingBacking:completeAnimation()
		timeRemainingHeader:completeAnimation()
		timeRemaining:completeAnimation()
		ChooseCharacterLoadoutCarouselItemInfoAreaWeapon:completeAnimation()
		timeRemainingBacking:setAlpha( 1 )
		timeRemainingHeader:setAlpha( 1 )
		timeRemaining:setAlpha( 1 )
		ChooseCharacterLoadoutCarouselItemInfoAreaWeapon:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				timeRemainingBacking:completeAnimation()
				self.timeRemainingBacking:setAlpha( 0 )
				self.clipFinished( timeRemainingBacking, {} )
				timeRemainingHeader:completeAnimation()
				self.timeRemainingHeader:setAlpha( 0 )
				self.clipFinished( timeRemainingHeader, {} )
				timeRemaining:completeAnimation()
				self.timeRemaining:setAlpha( 0 )
				self.clipFinished( timeRemaining, {} )
				ChooseCharacterLoadoutCarouselItemInfoAreaWeapon:completeAnimation()
				self.ChooseCharacterLoadoutCarouselItemInfoAreaWeapon:setAlpha( 0 )
				self.clipFinished( ChooseCharacterLoadoutCarouselItemInfoAreaWeapon, {} )
			end
		},
		Activated = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Activated",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isActivated" )
			end
		}
	} )
	self:linkToElementModel( self, "isActivated", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isActivated"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.ChooseCharacterLoadoutCarouselItemInfoAreaWeapon:close()
		self.contracts:close()
		self.timeRemaining:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

