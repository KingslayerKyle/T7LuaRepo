require( "ui.uieditor.widgets.BubbleGumBuffs.GobbleGumCookbookNumbersWidget" )

CoD.GobbleGumCookbookConsumableCountNumbers = InheritFrom( LUI.UIElement )
CoD.GobbleGumCookbookConsumableCountNumbers.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GobbleGumCookbookConsumableCountNumbers )
	self.id = "GobbleGumCookbookConsumableCountNumbers"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 81 )
	self:setTopBottom( true, false, 0, 33 )
	self.anyChildUsesUpdateState = true
	
	local OnesDigit = CoD.GobbleGumCookbookNumbersWidget.new( menu, controller )
	OnesDigit:setLeftRight( false, true, -27, 0 )
	OnesDigit:setTopBottom( true, true, 0, 0 )
	OnesDigit:linkToElementModel( self, nil, false, function ( model )
		OnesDigit:setModel( model, controller )
	end )
	OnesDigit:mergeStateConditions( {
		{
			stateName = "One",
			condition = function ( menu, element, event )
				return IsConsumableCountOnesDigitEqualTo( element, controller, 1 )
			end
		},
		{
			stateName = "Two",
			condition = function ( menu, element, event )
				return IsConsumableCountOnesDigitEqualTo( element, controller, 2 )
			end
		},
		{
			stateName = "Three",
			condition = function ( menu, element, event )
				return IsConsumableCountOnesDigitEqualTo( element, controller, 3 )
			end
		},
		{
			stateName = "Four",
			condition = function ( menu, element, event )
				return IsConsumableCountOnesDigitEqualTo( element, controller, 4 )
			end
		},
		{
			stateName = "Five",
			condition = function ( menu, element, event )
				return IsConsumableCountOnesDigitEqualTo( element, controller, 5 )
			end
		},
		{
			stateName = "Six",
			condition = function ( menu, element, event )
				return IsConsumableCountOnesDigitEqualTo( element, controller, 6 )
			end
		},
		{
			stateName = "Seven",
			condition = function ( menu, element, event )
				return IsConsumableCountOnesDigitEqualTo( element, controller, 7 )
			end
		},
		{
			stateName = "Eight",
			condition = function ( menu, element, event )
				return IsConsumableCountOnesDigitEqualTo( element, controller, 8 )
			end
		},
		{
			stateName = "Nine",
			condition = function ( menu, element, event )
				return IsConsumableCountOnesDigitEqualTo( element, controller, 9 )
			end
		}
	} )
	OnesDigit:linkToElementModel( OnesDigit, "itemIndex", true, function ( model )
		menu:updateElementState( OnesDigit, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( OnesDigit )
	self.OnesDigit = OnesDigit
	
	local TensDigit = CoD.GobbleGumCookbookNumbersWidget.new( menu, controller )
	TensDigit:setLeftRight( false, false, -13.5, 13.5 )
	TensDigit:setTopBottom( true, true, 0, 0 )
	TensDigit:linkToElementModel( self, nil, false, function ( model )
		TensDigit:setModel( model, controller )
	end )
	TensDigit:mergeStateConditions( {
		{
			stateName = "One",
			condition = function ( menu, element, event )
				return IsConsumableCountTensDigitEqualTo( element, controller, 1 )
			end
		},
		{
			stateName = "Two",
			condition = function ( menu, element, event )
				return IsConsumableCountTensDigitEqualTo( element, controller, 2 )
			end
		},
		{
			stateName = "Three",
			condition = function ( menu, element, event )
				return IsConsumableCountTensDigitEqualTo( element, controller, 3 )
			end
		},
		{
			stateName = "Four",
			condition = function ( menu, element, event )
				return IsConsumableCountTensDigitEqualTo( element, controller, 4 )
			end
		},
		{
			stateName = "Five",
			condition = function ( menu, element, event )
				return IsConsumableCountTensDigitEqualTo( element, controller, 5 )
			end
		},
		{
			stateName = "Six",
			condition = function ( menu, element, event )
				return IsConsumableCountTensDigitEqualTo( element, controller, 6 )
			end
		},
		{
			stateName = "Seven",
			condition = function ( menu, element, event )
				return IsConsumableCountTensDigitEqualTo( element, controller, 7 )
			end
		},
		{
			stateName = "Eight",
			condition = function ( menu, element, event )
				return IsConsumableCountTensDigitEqualTo( element, controller, 8 )
			end
		},
		{
			stateName = "Nine",
			condition = function ( menu, element, event )
				return IsConsumableCountTensDigitEqualTo( element, controller, 9 )
			end
		}
	} )
	TensDigit:linkToElementModel( TensDigit, "itemIndex", true, function ( model )
		menu:updateElementState( TensDigit, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( TensDigit )
	self.TensDigit = TensDigit
	
	local HundredsDigit = CoD.GobbleGumCookbookNumbersWidget.new( menu, controller )
	HundredsDigit:setLeftRight( true, false, 0, 27 )
	HundredsDigit:setTopBottom( true, true, 0, 0 )
	HundredsDigit:linkToElementModel( self, nil, false, function ( model )
		HundredsDigit:setModel( model, controller )
	end )
	HundredsDigit:mergeStateConditions( {
		{
			stateName = "One",
			condition = function ( menu, element, event )
				return IsConsumableCountHundredsDigitEqualTo( element, controller, 1 )
			end
		},
		{
			stateName = "Two",
			condition = function ( menu, element, event )
				return IsConsumableCountHundredsDigitEqualTo( element, controller, 2 )
			end
		},
		{
			stateName = "Three",
			condition = function ( menu, element, event )
				return IsConsumableCountHundredsDigitEqualTo( element, controller, 3 )
			end
		},
		{
			stateName = "Four",
			condition = function ( menu, element, event )
				return IsConsumableCountHundredsDigitEqualTo( element, controller, 4 )
			end
		},
		{
			stateName = "Five",
			condition = function ( menu, element, event )
				return IsConsumableCountHundredsDigitEqualTo( element, controller, 5 )
			end
		},
		{
			stateName = "Six",
			condition = function ( menu, element, event )
				return IsConsumableCountHundredsDigitEqualTo( element, controller, 6 )
			end
		},
		{
			stateName = "Seven",
			condition = function ( menu, element, event )
				return IsConsumableCountHundredsDigitEqualTo( element, controller, 7 )
			end
		},
		{
			stateName = "Eight",
			condition = function ( menu, element, event )
				return IsConsumableCountHundredsDigitEqualTo( element, controller, 8 )
			end
		},
		{
			stateName = "Nine",
			condition = function ( menu, element, event )
				return IsConsumableCountHundredsDigitEqualTo( element, controller, 9 )
			end
		}
	} )
	HundredsDigit:linkToElementModel( HundredsDigit, "itemIndex", true, function ( model )
		menu:updateElementState( HundredsDigit, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( HundredsDigit )
	self.HundredsDigit = HundredsDigit
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				OnesDigit:completeAnimation()
				self.OnesDigit:setLeftRight( false, true, -54, -27 )
				self.OnesDigit:setTopBottom( true, true, 0, 0 )
				self.OnesDigit:setAlpha( 1 )
				self.clipFinished( OnesDigit, {} )
				TensDigit:completeAnimation()
				self.TensDigit:setLeftRight( false, false, 8.5, 35.5 )
				self.TensDigit:setTopBottom( true, true, 0, 66 )
				self.TensDigit:setAlpha( 0 )
				self.clipFinished( TensDigit, {} )
				HundredsDigit:completeAnimation()
				self.HundredsDigit:setLeftRight( true, false, 0, 27 )
				self.HundredsDigit:setTopBottom( true, true, 0, 66 )
				self.HundredsDigit:setAlpha( 0 )
				self.clipFinished( HundredsDigit, {} )
			end
		},
		Triple = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				OnesDigit:completeAnimation()
				self.OnesDigit:setLeftRight( false, true, -27, 0 )
				self.OnesDigit:setTopBottom( true, true, 0, 0 )
				self.OnesDigit:setAlpha( 1 )
				self.clipFinished( OnesDigit, {} )
				TensDigit:completeAnimation()
				self.TensDigit:setLeftRight( false, false, -13.5, 13.5 )
				self.TensDigit:setTopBottom( true, true, 0, 0 )
				self.TensDigit:setAlpha( 1 )
				self.clipFinished( TensDigit, {} )
				HundredsDigit:completeAnimation()
				self.HundredsDigit:setLeftRight( true, false, 0, 27 )
				self.HundredsDigit:setTopBottom( true, true, 0, 0 )
				self.HundredsDigit:setAlpha( 1 )
				self.clipFinished( HundredsDigit, {} )
			end
		},
		Double = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				OnesDigit:completeAnimation()
				self.OnesDigit:setLeftRight( false, true, -40.5, -13.5 )
				self.OnesDigit:setTopBottom( true, true, 0, 0 )
				self.OnesDigit:setAlpha( 1 )
				self.clipFinished( OnesDigit, {} )
				TensDigit:completeAnimation()
				self.TensDigit:setLeftRight( false, false, -27, 0 )
				self.TensDigit:setTopBottom( true, true, 0, 0 )
				self.TensDigit:setAlpha( 1 )
				self.clipFinished( TensDigit, {} )
				HundredsDigit:completeAnimation()
				self.HundredsDigit:setLeftRight( true, false, 40.5, 13.5 )
				self.HundredsDigit:setTopBottom( true, true, 0, 0 )
				self.HundredsDigit:setAlpha( 0 )
				self.clipFinished( HundredsDigit, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.OnesDigit:close()
		element.TensDigit:close()
		element.HundredsDigit:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

