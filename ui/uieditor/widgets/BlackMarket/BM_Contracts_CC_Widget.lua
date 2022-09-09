-- 2afa545e1092066b0770186f52bd08d9
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BlackMarket.BM_Contracts_SideBetCallingCard" )

CoD.BM_Contracts_CC_Widget = InheritFrom( LUI.UIElement )
CoD.BM_Contracts_CC_Widget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.BM_Contracts_CC_Widget )
	self.id = "BM_Contracts_CC_Widget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 350 )
	self:setTopBottom( true, false, 0, 178 )
	self.anyChildUsesUpdateState = true
	
	local CalingCardBg = LUI.UIImage.new()
	CalingCardBg:setLeftRight( true, false, 43.84, 306.16 )
	CalingCardBg:setTopBottom( true, false, 4.72, 112.73 )
	CalingCardBg:setImage( RegisterImage( "uie_t7_blackmarket_contract_callingcard" ) )
	self:addElement( CalingCardBg )
	self.CalingCardBg = CalingCardBg
	
	local SideBetCallingCard = CoD.BM_Contracts_SideBetCallingCard.new( menu, controller )
	SideBetCallingCard:setLeftRight( true, false, 0, 350 )
	SideBetCallingCard:setTopBottom( true, false, -1, 91 )
	SideBetCallingCard:setAlpha( 0.25 )
	SideBetCallingCard:setScale( 0.5 )
	SideBetCallingCard:subscribeToGlobalModel( controller, "SideBetCurrentChallenge", nil, function ( model )
		SideBetCallingCard:setModel( model, controller )
	end )
	self:addElement( SideBetCallingCard )
	self.SideBetCallingCard = SideBetCallingCard
	
	local black = LUI.UIImage.new()
	black:setLeftRight( true, false, 55, 295 )
	black:setTopBottom( true, false, 42, 45 )
	black:setRGB( 0, 0, 0 )
	self:addElement( black )
	self.black = black
	
	local Lock = LUI.UIImage.new()
	Lock:setLeftRight( true, false, 159, 191 )
	Lock:setTopBottom( true, false, 27.72, 59.72 )
	Lock:setImage( RegisterImage( "uie_t7_blackmarket_contract_callingcard_lock" ) )
	self:addElement( Lock )
	self.Lock = Lock
	
	local text = LUI.UIText.new()
	text:setLeftRight( true, false, 57, 292 )
	text:setTopBottom( true, false, 79.78, 97.78 )
	text:setRGB( 0.58, 1, 0.83 )
	text:setText( Engine.Localize( "Set 1 /6" ) )
	text:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( text )
	self.text = text
	
	local SideBetDescription = LUI.UIText.new()
	SideBetDescription:setLeftRight( true, false, 53.25, 300.75 )
	SideBetDescription:setTopBottom( true, false, 113.73, 131.73 )
	SideBetDescription:setRGB( 0.88, 0.88, 0.88 )
	SideBetDescription:setText( Engine.Localize( "BLACKJACK_CHALLENGE_SIDE_BET_DESC" ) )
	SideBetDescription:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	SideBetDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	SideBetDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SideBetDescription )
	self.SideBetDescription = SideBetDescription
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				CalingCardBg:completeAnimation()
				self.CalingCardBg:setAlpha( 1 )
				self.clipFinished( CalingCardBg, {} )

				SideBetCallingCard:completeAnimation()
				self.SideBetCallingCard:setAlpha( 1 )
				self.clipFinished( SideBetCallingCard, {} )

				black:completeAnimation()
				self.black:setAlpha( 0 )
				self.clipFinished( black, {} )

				Lock:completeAnimation()
				self.Lock:setAlpha( 0 )
				self.clipFinished( Lock, {} )

				SideBetDescription:completeAnimation()
				self.SideBetDescription:setAlpha( 1 )
				self.SideBetDescription:setText( Engine.Localize( "BLACKJACK_CHALLENGE_SIDE_BET_DESC" ) )
				self.clipFinished( SideBetDescription, {} )
			end
		},
		Locked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				SideBetCallingCard:completeAnimation()
				self.SideBetCallingCard:setAlpha( 0.25 )
				self.clipFinished( SideBetCallingCard, {} )

				black:completeAnimation()
				self.black:setAlpha( 1 )
				self.clipFinished( black, {} )

				Lock:completeAnimation()
				self.Lock:setAlpha( 1 )
				self.clipFinished( Lock, {} )

				SideBetDescription:completeAnimation()
				self.SideBetDescription:setAlpha( 1 )
				self.SideBetDescription:setText( Engine.Localize( "BLACKJACK_CHALLENGE_SIDE_BET_DESC" ) )
				self.clipFinished( SideBetDescription, {} )
			end
		},
		CompletedCard = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				CalingCardBg:completeAnimation()
				self.CalingCardBg:setAlpha( 1 )
				self.clipFinished( CalingCardBg, {} )

				SideBetCallingCard:completeAnimation()
				self.SideBetCallingCard:setAlpha( 1 )
				self.clipFinished( SideBetCallingCard, {} )

				black:completeAnimation()
				self.black:setAlpha( 0 )
				self.clipFinished( black, {} )

				Lock:completeAnimation()
				self.Lock:setAlpha( 0 )
				self.clipFinished( Lock, {} )

				SideBetDescription:completeAnimation()
				self.SideBetDescription:setAlpha( 1 )
				self.SideBetDescription:setText( Engine.Localize( "BLACKJACK_CARD_COMPLETED" ) )
				self.clipFinished( SideBetDescription, {} )
			end
		},
		CompletedCardSet = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				CalingCardBg:completeAnimation()
				self.CalingCardBg:setAlpha( 1 )
				self.clipFinished( CalingCardBg, {} )

				SideBetCallingCard:completeAnimation()
				self.SideBetCallingCard:setAlpha( 1 )
				self.clipFinished( SideBetCallingCard, {} )

				black:completeAnimation()
				self.black:setAlpha( 0 )
				self.clipFinished( black, {} )

				Lock:completeAnimation()
				self.Lock:setAlpha( 0 )
				self.clipFinished( Lock, {} )

				SideBetDescription:completeAnimation()
				self.SideBetDescription:setAlpha( 1 )
				self.SideBetDescription:setText( Engine.Localize( "BLACKJACK_CARD_SET_COMPLETED" ) )
				self.clipFinished( SideBetDescription, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isLocked" )
			end
		},
		{
			stateName = "CompletedCard",
			condition = function ( menu, element, event )
				return not IsSelfModelValueTrue( element, controller, "isMastery" )
			end
		},
		{
			stateName = "CompletedCardSet",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isMastery" )
			end
		}
	} )
	self:linkToElementModel( self, "isLocked", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isLocked"
		} )
	end )
	self:linkToElementModel( self, "isMastery", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isMastery"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.SideBetCallingCard:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
