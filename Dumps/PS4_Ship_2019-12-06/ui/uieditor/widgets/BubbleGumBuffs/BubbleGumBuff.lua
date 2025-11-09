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
	self:setLeftRight( true, false, 0, 64 )
	self:setTopBottom( true, false, 0, 109 )
	self.anyChildUsesUpdateState = true
	
	local GridItemBGBGlow = CoD.GridItemBGBGlow.new( menu, controller )
	GridItemBGBGlow:setLeftRight( true, true, -10, 10 )
	GridItemBGBGlow:setTopBottom( true, true, -10, -35 )
	GridItemBGBGlow:linkToElementModel( self, nil, false, function ( model )
		GridItemBGBGlow:setModel( model, controller )
	end )
	self:addElement( GridItemBGBGlow )
	self.GridItemBGBGlow = GridItemBGBGlow
	
	local BubbleGumBuffImage = LUI.UIImage.new()
	BubbleGumBuffImage:setLeftRight( false, false, -32, 32 )
	BubbleGumBuffImage:setTopBottom( true, false, 0, 64 )
	BubbleGumBuffImage:setScale( 0.9 )
	self:addElement( BubbleGumBuffImage )
	self.BubbleGumBuffImage = BubbleGumBuffImage
	
	local BubbleGumBuffName = LUI.UIText.new()
	BubbleGumBuffName:setLeftRight( false, false, -32, 32 )
	BubbleGumBuffName:setTopBottom( true, false, 60, LanguageOverrideNumber( "mexicanspanish", 72, LanguageOverrideNumber( "spanish", 72, LanguageOverrideNumber( "russian", 72, LanguageOverrideNumber( "polish", 72, LanguageOverrideNumber( "german", 72, 76 ) ) ) ) ) )
	BubbleGumBuffName:setTTF( "fonts/default.ttf" )
	BubbleGumBuffName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	BubbleGumBuffName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( BubbleGumBuffName )
	self.BubbleGumBuffName = BubbleGumBuffName
	
	local ConsumableLabel = CoD.GridItemConsumableLabel.new( menu, controller )
	ConsumableLabel:setLeftRight( true, false, 2, 24 )
	ConsumableLabel:setTopBottom( true, false, 5.75, 23.75 )
	ConsumableLabel:setScale( 0.8 )
	ConsumableLabel:linkToElementModel( self, nil, false, function ( model )
		ConsumableLabel:setModel( model, controller )
	end )
	ConsumableLabel:linkToElementModel( self, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			ConsumableLabel.ComsumableCountLabel:setText( Engine.Localize( GetConsumableCountFromIndex( controller, itemIndex ) ) )
		end
	end )
	self:addElement( ConsumableLabel )
	self.ConsumableLabel = ConsumableLabel
	
	self.BubbleGumBuffImage:linkToElementModel( self, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			BubbleGumBuffImage:setImage( RegisterImage( GetItemImageFromIndex( itemIndex ) ) )
		end
	end )
	self.BubbleGumBuffName:linkToElementModel( self, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			BubbleGumBuffName:setText( Engine.Localize( GetItemNameFromIndex( itemIndex ) ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				GridItemBGBGlow:completeAnimation()
				self.GridItemBGBGlow:setAlpha( 1 )
				self.clipFinished( GridItemBGBGlow, {} )
			end
		},
		OutOfBubbleGum = {
			DefaultClip = function ()
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GridItemBGBGlow:close()
		element.ConsumableLabel:close()
		element.BubbleGumBuffImage:close()
		element.BubbleGumBuffName:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

