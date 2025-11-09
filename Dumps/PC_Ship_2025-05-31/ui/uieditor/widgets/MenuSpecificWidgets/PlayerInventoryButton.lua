CoD.PlayerInventoryButton = InheritFrom( LUI.UIElement )
CoD.PlayerInventoryButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PlayerInventoryButton )
	self.id = "PlayerInventoryButton"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 350 )
	self:setTopBottom( true, false, 0, 100 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local ItemId = LUI.UIText.new()
	ItemId:setLeftRight( true, false, 128, 350 )
	ItemId:setTopBottom( true, false, 7, 43 )
	ItemId:setTTF( "fonts/default.ttf" )
	ItemId:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ItemId:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ItemId )
	self.ItemId = ItemId
	
	local FocusIcon = LUI.UIImage.new()
	FocusIcon:setLeftRight( true, false, -4, 60 )
	FocusIcon:setTopBottom( true, false, 18, 82 )
	FocusIcon:setImage( RegisterImage( "uie_headicon_dead" ) )
	self:addElement( FocusIcon )
	self.FocusIcon = FocusIcon
	
	local ItemQuantity = LUI.UIText.new()
	ItemQuantity:setLeftRight( true, false, 101, 146 )
	ItemQuantity:setTopBottom( true, false, 43, 65 )
	ItemQuantity:setTTF( "fonts/default.ttf" )
	ItemQuantity:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ItemQuantity:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ItemQuantity )
	self.ItemQuantity = ItemQuantity
	
	local ItemXp = LUI.UIText.new()
	ItemXp:setLeftRight( true, false, 81, 128 )
	ItemXp:setTopBottom( true, false, 71, 93 )
	ItemXp:setTTF( "fonts/default.ttf" )
	ItemXp:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ItemXp:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ItemXp )
	self.ItemXp = ItemXp
	
	local ItemIdLabel = LUI.UITightText.new()
	ItemIdLabel:setLeftRight( true, false, 60, 137 )
	ItemIdLabel:setTopBottom( true, false, 7, 43 )
	ItemIdLabel:setText( Engine.Localize( "Name:" ) )
	ItemIdLabel:setTTF( "fonts/default.ttf" )
	self:addElement( ItemIdLabel )
	self.ItemIdLabel = ItemIdLabel
	
	local ItemQuantityLabel = LUI.UITightText.new()
	ItemQuantityLabel:setLeftRight( true, false, 60, 94 )
	ItemQuantityLabel:setTopBottom( true, false, 43, 65 )
	ItemQuantityLabel:setText( Engine.Localize( "Count:" ) )
	ItemQuantityLabel:setTTF( "fonts/default.ttf" )
	self:addElement( ItemQuantityLabel )
	self.ItemQuantityLabel = ItemQuantityLabel
	
	local ItemXpLabel = LUI.UITightText.new()
	ItemXpLabel:setLeftRight( true, false, 60, 79 )
	ItemXpLabel:setTopBottom( true, false, 71, 93 )
	ItemXpLabel:setText( Engine.Localize( "XP:" ) )
	ItemXpLabel:setTTF( "fonts/default.ttf" )
	self:addElement( ItemXpLabel )
	self.ItemXpLabel = ItemXpLabel
	
	local ConsumabilityLabel = LUI.UITightText.new()
	ConsumabilityLabel:setLeftRight( true, false, 131, 219 )
	ConsumabilityLabel:setTopBottom( true, false, 43, 65 )
	ConsumabilityLabel:setText( Engine.Localize( "Is Consumable:" ) )
	ConsumabilityLabel:setTTF( "fonts/default.ttf" )
	self:addElement( ConsumabilityLabel )
	self.ConsumabilityLabel = ConsumabilityLabel
	
	local IsConsumable = LUI.UIText.new()
	IsConsumable:setLeftRight( true, false, 223, 255 )
	IsConsumable:setTopBottom( true, false, 43, 65 )
	IsConsumable:setTTF( "fonts/default.ttf" )
	IsConsumable:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	IsConsumable:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( IsConsumable )
	self.IsConsumable = IsConsumable
	
	local ExpiryDurationLabel = LUI.UITightText.new()
	ExpiryDurationLabel:setLeftRight( true, false, 129, 221 )
	ExpiryDurationLabel:setTopBottom( true, false, 71, 93 )
	ExpiryDurationLabel:setText( Engine.Localize( "Expiry Duration:" ) )
	ExpiryDurationLabel:setTTF( "fonts/default.ttf" )
	self:addElement( ExpiryDurationLabel )
	self.ExpiryDurationLabel = ExpiryDurationLabel
	
	local ExpiryDuration = LUI.UIText.new()
	ExpiryDuration:setLeftRight( true, false, 230, 291 )
	ExpiryDuration:setTopBottom( true, false, 71, 93 )
	ExpiryDuration:setTTF( "fonts/default.ttf" )
	ExpiryDuration:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ExpiryDuration:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ExpiryDuration )
	self.ExpiryDuration = ExpiryDuration
	
	self.ItemId:linkToElementModel( self, "productName", true, function ( model )
		local productName = Engine.GetModelValue( model )
		if productName then
			ItemId:setText( Engine.Localize( ToString( productName ) ) )
		end
	end )
	self.ItemQuantity:linkToElementModel( self, "itemQuantity", true, function ( model )
		local itemQuantity = Engine.GetModelValue( model )
		if itemQuantity then
			ItemQuantity:setText( Engine.Localize( ToString( itemQuantity ) ) )
		end
	end )
	self.ItemXp:linkToElementModel( self, "itemXp", true, function ( model )
		local itemXp = Engine.GetModelValue( model )
		if itemXp then
			ItemXp:setText( Engine.Localize( ToString( itemXp ) ) )
		end
	end )
	self.IsConsumable:linkToElementModel( self, "isConsumable", true, function ( model )
		local isConsumable = Engine.GetModelValue( model )
		if isConsumable then
			IsConsumable:setText( Engine.Localize( ToString( isConsumable ) ) )
		end
	end )
	self.ExpiryDuration:linkToElementModel( self, "expiryDuration", true, function ( model )
		local expiryDuration = Engine.GetModelValue( model )
		if expiryDuration then
			ExpiryDuration:setText( Engine.Localize( ToString( expiryDuration ) ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				FocusIcon:completeAnimation()
				self.FocusIcon:setAlpha( 0 )
				self.clipFinished( FocusIcon, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 1 )
				local FocusIconFrame2 = function ( FocusIcon, event )
					if not event.interrupted then
						FocusIcon:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					FocusIcon:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusIcon, event )
					else
						FocusIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusIcon:completeAnimation()
				self.FocusIcon:setAlpha( 0 )
				FocusIconFrame2( FocusIcon, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 1 )
				local FocusIconFrame2 = function ( FocusIcon, event )
					if not event.interrupted then
						FocusIcon:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					FocusIcon:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusIcon, event )
					else
						FocusIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusIcon:completeAnimation()
				self.FocusIcon:setAlpha( 1 )
				FocusIconFrame2( FocusIcon, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ItemId:close()
		element.ItemQuantity:close()
		element.ItemXp:close()
		element.IsConsumable:close()
		element.ExpiryDuration:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

