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
	self:setLeftRight( 0, 0, 0, 96 )
	self:setTopBottom( 0, 0, 0, 96 )
	self.anyChildUsesUpdateState = true
	
	local GridItemBGBGlow = CoD.GridItemBGBGlow.new( menu, controller )
	GridItemBGBGlow:setLeftRight( 0.5, 0.5, -69, 69 )
	GridItemBGBGlow:setTopBottom( 0.5, 0.5, -69, 69 )
	GridItemBGBGlow:setAlpha( 0 )
	GridItemBGBGlow:linkToElementModel( self, nil, false, function ( model )
		GridItemBGBGlow:setModel( model, controller )
	end )
	self:addElement( GridItemBGBGlow )
	self.GridItemBGBGlow = GridItemBGBGlow
	
	local BubbleGumBuffImage = LUI.UIImage.new()
	BubbleGumBuffImage:setLeftRight( 0.5, 0.5, -48, 48 )
	BubbleGumBuffImage:setTopBottom( 0.5, 0.5, -48, 48 )
	self:addElement( BubbleGumBuffImage )
	self.BubbleGumBuffImage = BubbleGumBuffImage
	
	self.resetProperties = function ()
		GridItemBGBGlow:completeAnimation()
		BubbleGumBuffImage:completeAnimation()
		GridItemBGBGlow:setAlpha( 0 )
		BubbleGumBuffImage:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				GridItemBGBGlow:completeAnimation()
				self.GridItemBGBGlow:setAlpha( 1 )
				self.clipFinished( GridItemBGBGlow, {} )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GridItemBGBGlow:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

