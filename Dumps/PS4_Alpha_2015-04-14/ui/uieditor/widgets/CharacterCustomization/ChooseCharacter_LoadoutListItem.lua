CoD.ChooseCharacter_LoadoutListItem = InheritFrom( LUI.UIElement )
CoD.ChooseCharacter_LoadoutListItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChooseCharacter_LoadoutListItem )
	self.id = "ChooseCharacter_LoadoutListItem"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 90 )
	self:setTopBottom( true, false, 0, 90 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local itemOff = LUI.UIImage.new()
	itemOff:setLeftRight( true, true, 10, -10 )
	itemOff:setTopBottom( true, true, 10, -10 )
	itemOff:setRGB( 1, 1, 1 )
	itemOff:setAlpha( 0 )
	itemOff:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	itemOff:linkToElementModel( self, "gameImageOff", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemOff:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( itemOff )
	self.itemOff = itemOff
	
	local itemOn = LUI.UIImage.new()
	itemOn:setLeftRight( true, true, 0, 0 )
	itemOn:setTopBottom( true, true, 0, 0 )
	itemOn:setRGB( 1, 1, 1 )
	itemOn:setZoom( -30 )
	itemOn:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	itemOn:linkToElementModel( self, "gameImageOn", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemOn:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( itemOn )
	self.itemOn = itemOn
	
	local itemOn0 = LUI.UIImage.new()
	itemOn0:setLeftRight( true, true, 0, 0 )
	itemOn0:setTopBottom( true, true, 0, 0 )
	itemOn0:setRGB( 1, 1, 1 )
	itemOn0:setAlpha( 0 )
	itemOn0:setZoom( -30 )
	itemOn0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	itemOn0:linkToElementModel( self, "gameImageOn", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemOn0:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( itemOn0 )
	self.itemOn0 = itemOn0
	
	local lock = LUI.UIImage.new()
	lock:setLeftRight( false, false, -32, 32 )
	lock:setTopBottom( false, false, -32, 32 )
	lock:setRGB( 1, 1, 1 )
	lock:setAlpha( 0 )
	lock:setImage( RegisterImage( "uie_t7_hud_cac_lock_64" ) )
	lock:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( lock )
	self.lock = lock
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				itemOff:completeAnimation()
				self.itemOff:setAlpha( 1 )
				self.itemOff:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				self.clipFinished( itemOff, {} )
				itemOn:completeAnimation()
				self.itemOn:setAlpha( 0 )
				self.clipFinished( itemOn, {} )
				itemOn0:completeAnimation()
				self.itemOn0:setAlpha( 0 )
				self.clipFinished( itemOn0, {} )
				lock:completeAnimation()
				self.lock:setAlpha( 0 )
				self.clipFinished( lock, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 4 )
				itemOff:completeAnimation()
				self.itemOff:setAlpha( 0 )
				self.clipFinished( itemOff, {} )
				itemOn:completeAnimation()
				self.itemOn:setAlpha( 1 )
				self.clipFinished( itemOn, {} )
				itemOn0:completeAnimation()
				self.itemOn0:setAlpha( 0.6 )
				self.clipFinished( itemOn0, {} )
				lock:completeAnimation()
				self.lock:setAlpha( 0 )
				self.clipFinished( lock, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				itemOff:completeAnimation()
				self.itemOff:setAlpha( 0 )
				self.clipFinished( itemOff, {} )
				itemOn:completeAnimation()
				self.itemOn:setAlpha( 0 )
				self.clipFinished( itemOn, {} )
				lock:completeAnimation()
				self.lock:setAlpha( 1 )
				self.clipFinished( lock, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 3 )
				itemOff:completeAnimation()
				self.itemOff:setAlpha( 0 )
				self.clipFinished( itemOff, {} )
				itemOn:completeAnimation()
				self.itemOn:setAlpha( 0 )
				self.clipFinished( itemOn, {} )
				lock:completeAnimation()
				self.lock:setAlpha( 1 )
				self.clipFinished( lock, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return IsDisabled( element, controller )
			end
		}
	} )
	self:linkToElementModel( self, "disabled", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		} )
	end )
	self.close = function ( self )
		self.itemOff:close()
		self.itemOn:close()
		self.itemOn0:close()
		CoD.ChooseCharacter_LoadoutListItem.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

