require( "ui.uieditor.widgets.CAC.GridItemBGBGlow" )

CoD.LobbyBubbleGumBuff = InheritFrom( LUI.UIElement )
CoD.LobbyBubbleGumBuff.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LobbyBubbleGumBuff )
	self.id = "LobbyBubbleGumBuff"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 64 )
	self:setTopBottom( true, false, 0, 64 )
	self.anyChildUsesUpdateState = true
	
	local GridItemBGBGlow = CoD.GridItemBGBGlow.new( menu, controller )
	GridItemBGBGlow:setLeftRight( false, false, -46, 46 )
	GridItemBGBGlow:setTopBottom( false, false, -46, 46 )
	GridItemBGBGlow:setAlpha( 0 )
	GridItemBGBGlow:linkToElementModel( self, nil, false, function ( model )
		GridItemBGBGlow:setModel( model, controller )
	end )
	self:addElement( GridItemBGBGlow )
	self.GridItemBGBGlow = GridItemBGBGlow
	
	local BubbleGumBuffImage = LUI.UIImage.new()
	BubbleGumBuffImage:setLeftRight( false, false, -32, 32 )
	BubbleGumBuffImage:setTopBottom( false, false, -32, 32 )
	self:addElement( BubbleGumBuffImage )
	self.BubbleGumBuffImage = BubbleGumBuffImage
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				GridItemBGBGlow:completeAnimation()
				self.GridItemBGBGlow:setAlpha( 1 )
				self.clipFinished( GridItemBGBGlow, {} )
				BubbleGumBuffImage:completeAnimation()
				self.BubbleGumBuffImage:setAlpha( 1 )
				self.clipFinished( BubbleGumBuffImage, {} )
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
				return IsOutOfLobbyBubbleGum( element, controller )
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
	self:linkToElementModel( self, "remaining", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "remaining"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GridItemBGBGlow:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

