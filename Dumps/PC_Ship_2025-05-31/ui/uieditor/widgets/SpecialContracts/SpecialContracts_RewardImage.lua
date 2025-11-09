require( "ui.uieditor.widgets.CallingCards.CallingCards_FrameWidget" )

CoD.SpecialContracts_RewardImage = InheritFrom( LUI.UIElement )
CoD.SpecialContracts_RewardImage.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SpecialContracts_RewardImage )
	self.id = "SpecialContracts_RewardImage"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 188 )
	self:setTopBottom( true, false, 0, 104 )
	self.anyChildUsesUpdateState = true
	
	local ItemImage = LUI.UIImage.new()
	ItemImage:setLeftRight( false, false, -94, 94 )
	ItemImage:setTopBottom( false, false, -52, 52 )
	self:addElement( ItemImage )
	self.ItemImage = ItemImage
	
	local CallingCard = CoD.CallingCards_FrameWidget.new( menu, controller )
	CallingCard:setLeftRight( false, false, -1, 1 )
	CallingCard:setTopBottom( false, false, -1, 1 )
	CallingCard.CardIconFrame:setScale( 0.37 )
	CallingCard:linkToElementModel( self, nil, false, function ( model )
		CallingCard:setModel( model, controller )
	end )
	self:addElement( CallingCard )
	self.CallingCard = CallingCard
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				ItemImage:completeAnimation()
				self.ItemImage:setLeftRight( false, false, -94, 94 )
				self.ItemImage:setTopBottom( false, false, -40.75, 40.75 )
				self.ItemImage:setAlpha( 1 )
				self.clipFinished( ItemImage, {} )
				CallingCard:completeAnimation()
				self.CallingCard:setAlpha( 0 )
				self.clipFinished( CallingCard, {} )
			end
		},
		Dimensions4by1 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				ItemImage:completeAnimation()
				self.ItemImage:setAlpha( 0 )
				self.clipFinished( ItemImage, {} )
				CallingCard:completeAnimation()
				self.CallingCard:setAlpha( 1 )
				self.clipFinished( CallingCard, {} )
			end
		},
		Dimensions2by1 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				ItemImage:completeAnimation()
				self.ItemImage:setLeftRight( false, false, -84, 84 )
				self.ItemImage:setTopBottom( false, false, -42, 42 )
				self.ItemImage:setAlpha( 1 )
				self.clipFinished( ItemImage, {} )
				CallingCard:completeAnimation()
				self.CallingCard:setAlpha( 0 )
				self.clipFinished( CallingCard, {} )
			end
		},
		Dimensions1by1 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				ItemImage:completeAnimation()
				self.ItemImage:setLeftRight( false, false, -48, 48 )
				self.ItemImage:setTopBottom( false, false, -48, 48 )
				self.ItemImage:setAlpha( 1 )
				self.clipFinished( ItemImage, {} )
				CallingCard:completeAnimation()
				self.CallingCard:setAlpha( 0 )
				self.clipFinished( CallingCard, {} )
			end
		},
		DropBundle = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				ItemImage:completeAnimation()
				self.ItemImage:setLeftRight( false, false, -94, 94 )
				self.ItemImage:setTopBottom( false, false, -39.56, 37.56 )
				self.ItemImage:setAlpha( 1 )
				self.clipFinished( ItemImage, {} )
				CallingCard:completeAnimation()
				self.CallingCard:setAlpha( 0 )
				self.clipFinished( CallingCard, {} )
			end
		},
		BlackjackContract = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				ItemImage:completeAnimation()
				self.ItemImage:setLeftRight( false, false, -76.5, 76.5 )
				self.ItemImage:setTopBottom( false, false, -52, 52 )
				self.ItemImage:setAlpha( 1 )
				self.clipFinished( ItemImage, {} )
				CallingCard:completeAnimation()
				self.CallingCard:setAlpha( 0 )
				self.clipFinished( CallingCard, {} )
			end
		},
		Camo = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				ItemImage:completeAnimation()
				self.ItemImage:setLeftRight( false, false, -76.5, 76.5 )
				self.ItemImage:setTopBottom( false, false, -52, 52 )
				self.ItemImage:setAlpha( 1 )
				self.clipFinished( ItemImage, {} )
				CallingCard:completeAnimation()
				self.CallingCard:setAlpha( 0 )
				self.clipFinished( CallingCard, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Dimensions4by1",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "category", "calling_card" )
			end
		},
		{
			stateName = "Dimensions2by1",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "category", "trifecta" )
			end
		},
		{
			stateName = "Dimensions1by1",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "category", "grand_slam" )
			end
		},
		{
			stateName = "DropBundle",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "category", "default" )
			end
		},
		{
			stateName = "BlackjackContract",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "category", "blackjack_contract" )
			end
		},
		{
			stateName = "Camo",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "category", "camo" )
			end
		}
	} )
	self:linkToElementModel( self, "category", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "category"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CallingCard:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

