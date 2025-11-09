CoD.GridItemConsumableLabel = InheritFrom( LUI.UIElement )
CoD.GridItemConsumableLabel.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GridItemConsumableLabel )
	self.id = "GridItemConsumableLabel"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 22 )
	self:setTopBottom( true, false, 0, 18 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local ConsumableCountLabel = LUI.UITightText.new()
	ConsumableCountLabel:setLeftRight( true, false, 0, 7 )
	ConsumableCountLabel:setTopBottom( true, false, 0, 18 )
	ConsumableCountLabel:setRGB( 0.82, 0.85, 0.88 )
	ConsumableCountLabel:setText( Engine.Localize( "0" ) )
	ConsumableCountLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( ConsumableCountLabel )
	self.ConsumableCountLabel = ConsumableCountLabel
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				ConsumableCountLabel:completeAnimation()
				self.ConsumableCountLabel:setAlpha( 1 )
				self.clipFinished( ConsumableCountLabel, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self:setupElementClipCounter( 0 )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				ConsumableCountLabel:completeAnimation()
				self.ConsumableCountLabel:setAlpha( 0 )
				self.clipFinished( ConsumableCountLabel, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return not IsCACItemConsumable( menu, element, controller )
			end
		}
	} )
	self:linkToElementModel( self, "itemIndex", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

