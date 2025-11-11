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
	self:setLeftRight( 0, 0, 0, 525 )
	self:setTopBottom( 0, 0, 0, 150 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local ItemId = LUI.UIText.new()
	ItemId:setLeftRight( 0, 0, 192, 525 )
	ItemId:setTopBottom( 0, 0, 11, 65 )
	ItemId:setTTF( "fonts/default.ttf" )
	ItemId:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ItemId:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ItemId )
	self.ItemId = ItemId
	
	local FocusIcon = LUI.UIImage.new()
	FocusIcon:setLeftRight( 0, 0, -6, 90 )
	FocusIcon:setTopBottom( 0, 0, 27, 123 )
	FocusIcon:setImage( RegisterImage( "uie_headicon_dead" ) )
	self:addElement( FocusIcon )
	self.FocusIcon = FocusIcon
	
	local ItemQuantity = LUI.UIText.new()
	ItemQuantity:setLeftRight( 0, 0, 151, 219 )
	ItemQuantity:setTopBottom( 0, 0, 65, 98 )
	ItemQuantity:setTTF( "fonts/default.ttf" )
	ItemQuantity:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ItemQuantity:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ItemQuantity )
	self.ItemQuantity = ItemQuantity
	
	local ItemXp = LUI.UIText.new()
	ItemXp:setLeftRight( 0, 0, 122, 192 )
	ItemXp:setTopBottom( 0, 0, 107, 140 )
	ItemXp:setTTF( "fonts/default.ttf" )
	ItemXp:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ItemXp:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ItemXp )
	self.ItemXp = ItemXp
	
	local ItemIdLabel = LUI.UITightText.new()
	ItemIdLabel:setLeftRight( 0, 0, 90, 206 )
	ItemIdLabel:setTopBottom( 0, 0, 11, 65 )
	ItemIdLabel:setText( Engine.Localize( "Name:" ) )
	ItemIdLabel:setTTF( "fonts/default.ttf" )
	self:addElement( ItemIdLabel )
	self.ItemIdLabel = ItemIdLabel
	
	local ItemQuantityLabel = LUI.UITightText.new()
	ItemQuantityLabel:setLeftRight( 0, 0, 90, 141 )
	ItemQuantityLabel:setTopBottom( 0, 0, 65, 98 )
	ItemQuantityLabel:setText( Engine.Localize( "Count:" ) )
	ItemQuantityLabel:setTTF( "fonts/default.ttf" )
	self:addElement( ItemQuantityLabel )
	self.ItemQuantityLabel = ItemQuantityLabel
	
	local ItemXpLabel = LUI.UITightText.new()
	ItemXpLabel:setLeftRight( 0, 0, 90, 118 )
	ItemXpLabel:setTopBottom( 0, 0, 107, 140 )
	ItemXpLabel:setText( Engine.Localize( "XP:" ) )
	ItemXpLabel:setTTF( "fonts/default.ttf" )
	self:addElement( ItemXpLabel )
	self.ItemXpLabel = ItemXpLabel
	
	local ConsumabilityLabel = LUI.UITightText.new()
	ConsumabilityLabel:setLeftRight( 0, 0, 196, 328 )
	ConsumabilityLabel:setTopBottom( 0, 0, 65, 98 )
	ConsumabilityLabel:setText( Engine.Localize( "Is Consumable:" ) )
	ConsumabilityLabel:setTTF( "fonts/default.ttf" )
	self:addElement( ConsumabilityLabel )
	self.ConsumabilityLabel = ConsumabilityLabel
	
	local IsConsumable = LUI.UIText.new()
	IsConsumable:setLeftRight( 0, 0, 334, 382 )
	IsConsumable:setTopBottom( 0, 0, 65, 98 )
	IsConsumable:setTTF( "fonts/default.ttf" )
	IsConsumable:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	IsConsumable:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( IsConsumable )
	self.IsConsumable = IsConsumable
	
	local ExpiryDurationLabel = LUI.UITightText.new()
	ExpiryDurationLabel:setLeftRight( 0, 0, 193, 331 )
	ExpiryDurationLabel:setTopBottom( 0, 0, 107, 140 )
	ExpiryDurationLabel:setText( Engine.Localize( "Expiry Duration:" ) )
	ExpiryDurationLabel:setTTF( "fonts/default.ttf" )
	self:addElement( ExpiryDurationLabel )
	self.ExpiryDurationLabel = ExpiryDurationLabel
	
	local ExpiryDuration = LUI.UIText.new()
	ExpiryDuration:setLeftRight( 0, 0, 345, 437 )
	ExpiryDuration:setTopBottom( 0, 0, 107, 140 )
	ExpiryDuration:setTTF( "fonts/default.ttf" )
	ExpiryDuration:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ExpiryDuration:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ExpiryDuration )
	self.ExpiryDuration = ExpiryDuration
	
	self.ItemId:linkToElementModel( self, "productName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ItemId:setText( ToString( modelValue ) )
		end
	end )
	self.ItemQuantity:linkToElementModel( self, "itemQuantity", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ItemQuantity:setText( ToString( modelValue ) )
		end
	end )
	self.ItemXp:linkToElementModel( self, "itemXp", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ItemXp:setText( ToString( modelValue ) )
		end
	end )
	self.IsConsumable:linkToElementModel( self, "isConsumable", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			IsConsumable:setText( ToString( modelValue ) )
		end
	end )
	self.ExpiryDuration:linkToElementModel( self, "expiryDuration", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ExpiryDuration:setText( ToString( modelValue ) )
		end
	end )
	self.resetProperties = function ()
		FocusIcon:completeAnimation()
		FocusIcon:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				FocusIcon:completeAnimation()
				self.FocusIcon:setAlpha( 0 )
				self.clipFinished( FocusIcon, {} )
			end,
			Focus = function ()
				self.resetProperties()
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
				self.resetProperties()
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.ItemId:close()
		self.ItemQuantity:close()
		self.ItemXp:close()
		self.IsConsumable:close()
		self.ExpiryDuration:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

