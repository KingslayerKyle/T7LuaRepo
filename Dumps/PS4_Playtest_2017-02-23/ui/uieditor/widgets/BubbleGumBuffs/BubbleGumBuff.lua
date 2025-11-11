require( "ui.uieditor.widgets.CAC.GridItemBGBGlow" )
require( "ui.uieditor.widgets.CAC.GridItemConsumableLabel" )

CoD.BubbleGumBuff = InheritFrom( LUI.UIElement )
CoD.BubbleGumBuff.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BubbleGumBuff )
	self.id = "BubbleGumBuff"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 96 )
	self:setTopBottom( 0, 0, 0, 163 )
	self.anyChildUsesUpdateState = true
	
	local GridItemBGBGlow = CoD.GridItemBGBGlow.new( menu, controller )
	GridItemBGBGlow:setLeftRight( 0, 1, -15, 15 )
	GridItemBGBGlow:setTopBottom( 0, 1, -15, -53 )
	GridItemBGBGlow:linkToElementModel( self, nil, false, function ( model )
		GridItemBGBGlow:setModel( model, controller )
	end )
	self:addElement( GridItemBGBGlow )
	self.GridItemBGBGlow = GridItemBGBGlow
	
	local BubbleGumBuffImage = LUI.UIImage.new()
	BubbleGumBuffImage:setLeftRight( 0.5, 0.5, -48, 48 )
	BubbleGumBuffImage:setTopBottom( 0, 0, 0, 96 )
	BubbleGumBuffImage:setScale( 0.9 )
	self:addElement( BubbleGumBuffImage )
	self.BubbleGumBuffImage = BubbleGumBuffImage
	
	local BubbleGumBuffName = LUI.UIText.new()
	BubbleGumBuffName:setLeftRight( 0.5, 0.5, -48, 48 )
	BubbleGumBuffName:setTopBottom( 0, 0, 90, 114 )
	BubbleGumBuffName:setTTF( "fonts/default.ttf" )
	BubbleGumBuffName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	BubbleGumBuffName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( BubbleGumBuffName )
	self.BubbleGumBuffName = BubbleGumBuffName
	
	local ConsumableLabel = CoD.GridItemConsumableLabel.new( menu, controller )
	ConsumableLabel:setLeftRight( 0, 0, 3, 36 )
	ConsumableLabel:setTopBottom( 0, 0, 9, 36 )
	ConsumableLabel:setScale( 0.8 )
	ConsumableLabel:linkToElementModel( self, nil, false, function ( model )
		ConsumableLabel:setModel( model, controller )
	end )
	self:addElement( ConsumableLabel )
	self.ConsumableLabel = ConsumableLabel
	
	self.BubbleGumBuffImage:linkToElementModel( self, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BubbleGumBuffImage:setImage( RegisterImage( GetItemImageFromIndex( modelValue ) ) )
		end
	end )
	self.BubbleGumBuffName:linkToElementModel( self, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BubbleGumBuffName:setText( Engine.Localize( GetItemNameFromIndex( modelValue ) ) )
		end
	end )
	self.resetProperties = function ()
		BubbleGumBuffImage:completeAnimation()
		GridItemBGBGlow:completeAnimation()
		BubbleGumBuffImage:setAlpha( 1 )
		GridItemBGBGlow:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		OutOfBubbleGum = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				GridItemBGBGlow:completeAnimation()
				self.GridItemBGBGlow:setAlpha( 0.25 )
				self.clipFinished( GridItemBGBGlow, {} )
				BubbleGumBuffImage:completeAnimation()
				self.BubbleGumBuffImage:setAlpha( 0.5 )
				self.clipFinished( BubbleGumBuffImage, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "OutOfBubbleGum",
			condition = function ( menu, element, event )
				return not DoesCACItemHaveConsumablesRemaining( menu, element, controller )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GridItemBGBGlow:close()
		self.ConsumableLabel:close()
		self.BubbleGumBuffImage:close()
		self.BubbleGumBuffName:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

