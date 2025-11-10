require( "ui.uieditor.widgets.HUD.ZM_RoundWidget.ZmRndDigitWidget" )

CoD.ZmRndDigitsInt = InheritFrom( LUI.UIElement )
CoD.ZmRndDigitsInt.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ZmRndDigitsInt )
	self.id = "ZmRndDigitsInt"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 106 )
	self:setTopBottom( true, false, 0, 80 )
	self.anyChildUsesUpdateState = true
	
	local ZmRndDigitWidget = CoD.ZmRndDigitWidget.new( menu, controller )
	ZmRndDigitWidget:setLeftRight( true, false, 3, 59 )
	ZmRndDigitWidget:setTopBottom( true, false, 0, 80 )
	ZmRndDigitWidget:linkToElementModel( self, nil, false, function ( model )
		ZmRndDigitWidget:setModel( model, controller )
	end )
	ZmRndDigitWidget:linkToElementModel( self, "roundsPlayed", true, function ( model )
		local f3_local0 = ZmRndDigitWidget
		PlayClipOnElement( self, {
			elementName = "ZmRndDigitWidget",
			clipName = "DefaultClip"
		}, controller )
	end )
	ZmRndDigitWidget:mergeStateConditions( {
		{
			stateName = "One",
			condition = function ( menu, element, event )
				return IsZombieRoundTensDigitEqualTo( element, controller, 1 )
			end
		},
		{
			stateName = "Two",
			condition = function ( menu, element, event )
				return IsZombieRoundTensDigitEqualTo( element, controller, 2 )
			end
		},
		{
			stateName = "Three",
			condition = function ( menu, element, event )
				return IsZombieRoundTensDigitEqualTo( element, controller, 3 )
			end
		},
		{
			stateName = "Four",
			condition = function ( menu, element, event )
				return IsZombieRoundTensDigitEqualTo( element, controller, 4 )
			end
		},
		{
			stateName = "Five",
			condition = function ( menu, element, event )
				return IsZombieRoundTensDigitEqualTo( element, controller, 5 )
			end
		},
		{
			stateName = "Six",
			condition = function ( menu, element, event )
				return IsZombieRoundTensDigitEqualTo( element, controller, 6 )
			end
		},
		{
			stateName = "Seven",
			condition = function ( menu, element, event )
				return IsZombieRoundTensDigitEqualTo( element, controller, 7 )
			end
		},
		{
			stateName = "Eight",
			condition = function ( menu, element, event )
				return IsZombieRoundTensDigitEqualTo( element, controller, 8 )
			end
		},
		{
			stateName = "Nine",
			condition = function ( menu, element, event )
				return IsZombieRoundTensDigitEqualTo( element, controller, 9 )
			end
		},
		{
			stateName = "Zero",
			condition = function ( menu, element, event )
				return IsZombieRoundTensDigitEqualTo( element, controller, 0 )
			end
		}
	} )
	ZmRndDigitWidget:linkToElementModel( ZmRndDigitWidget, "roundsPlayed", true, function ( model )
		menu:updateElementState( ZmRndDigitWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "roundsPlayed"
		} )
	end )
	self:addElement( ZmRndDigitWidget )
	self.ZmRndDigitWidget = ZmRndDigitWidget
	
	local ZmRndDigitWidget0 = CoD.ZmRndDigitWidget.new( menu, controller )
	ZmRndDigitWidget0:setLeftRight( true, false, 46, 102 )
	ZmRndDigitWidget0:setTopBottom( true, false, 0, 80 )
	ZmRndDigitWidget0:linkToElementModel( self, nil, false, function ( model )
		ZmRndDigitWidget0:setModel( model, controller )
	end )
	ZmRndDigitWidget0:mergeStateConditions( {
		{
			stateName = "One",
			condition = function ( menu, element, event )
				return IsZombieRoundOnesDigitEqualTo( element, controller, 1 )
			end
		},
		{
			stateName = "Two",
			condition = function ( menu, element, event )
				return IsZombieRoundOnesDigitEqualTo( element, controller, 2 )
			end
		},
		{
			stateName = "Three",
			condition = function ( menu, element, event )
				return IsZombieRoundOnesDigitEqualTo( element, controller, 3 )
			end
		},
		{
			stateName = "Four",
			condition = function ( menu, element, event )
				return IsZombieRoundOnesDigitEqualTo( element, controller, 4 )
			end
		},
		{
			stateName = "Five",
			condition = function ( menu, element, event )
				return IsZombieRoundOnesDigitEqualTo( element, controller, 5 )
			end
		},
		{
			stateName = "Six",
			condition = function ( menu, element, event )
				return IsZombieRoundOnesDigitEqualTo( element, controller, 6 )
			end
		},
		{
			stateName = "Seven",
			condition = function ( menu, element, event )
				return IsZombieRoundOnesDigitEqualTo( element, controller, 7 )
			end
		},
		{
			stateName = "Eight",
			condition = function ( menu, element, event )
				return IsZombieRoundOnesDigitEqualTo( element, controller, 8 )
			end
		},
		{
			stateName = "Nine",
			condition = function ( menu, element, event )
				return IsZombieRoundOnesDigitEqualTo( element, controller, 9 )
			end
		},
		{
			stateName = "Zero",
			condition = function ( menu, element, event )
				return IsZombieRoundOnesDigitEqualTo( element, controller, 0 )
			end
		}
	} )
	ZmRndDigitWidget0:linkToElementModel( ZmRndDigitWidget0, "roundsPlayed", true, function ( model )
		menu:updateElementState( ZmRndDigitWidget0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "roundsPlayed"
		} )
	end )
	self:addElement( ZmRndDigitWidget0 )
	self.ZmRndDigitWidget0 = ZmRndDigitWidget0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				ZmRndDigitWidget:completeAnimation()
				self.ZmRndDigitWidget:setAlpha( 0 )
				self.clipFinished( ZmRndDigitWidget, {} )
				ZmRndDigitWidget0:completeAnimation()
				self.ZmRndDigitWidget0:setAlpha( 1 )
				self.clipFinished( ZmRndDigitWidget0, {} )
			end
		},
		Double = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				ZmRndDigitWidget:completeAnimation()
				self.ZmRndDigitWidget:setAlpha( 1 )
				self.clipFinished( ZmRndDigitWidget, {} )
				ZmRndDigitWidget0:completeAnimation()
				self.ZmRndDigitWidget0:setAlpha( 1 )
				self.clipFinished( ZmRndDigitWidget0, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ZmRndDigitWidget:close()
		element.ZmRndDigitWidget0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

