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
	self:setLeftRight( true, false, 0, 32 )
	self:setTopBottom( true, false, 0, 32 )
	
	local ComsumableBacking = LUI.UIImage.new()
	ComsumableBacking:setLeftRight( false, false, -32, 32 )
	ComsumableBacking:setTopBottom( false, false, -32, 32 )
	ComsumableBacking:setScale( 0.5 )
	ComsumableBacking:setImage( RegisterImage( "uie_t7_menu_gobblegum_comsumable" ) )
	self:addElement( ComsumableBacking )
	self.ComsumableBacking = ComsumableBacking
	
	local NoComsumable = LUI.UIImage.new()
	NoComsumable:setLeftRight( false, false, -32, 32 )
	NoComsumable:setTopBottom( false, false, -32, 32 )
	NoComsumable:setScale( 0.5 )
	NoComsumable:setImage( RegisterImage( "uie_t7_menu_gobblegum_noncomsumable" ) )
	self:addElement( NoComsumable )
	self.NoComsumable = NoComsumable
	
	local ComsumableCountLabel = LUI.UIText.new()
	ComsumableCountLabel:setLeftRight( false, false, -10.5, 10.5 )
	ComsumableCountLabel:setTopBottom( false, false, -10, 8 )
	ComsumableCountLabel:setRGB( 0.82, 0.85, 0.88 )
	ComsumableCountLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ComsumableCountLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ComsumableCountLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	ComsumableCountLabel:linkToElementModel( self, "remaining", true, function ( model )
		local remaining = Engine.GetModelValue( model )
		if remaining then
			ComsumableCountLabel:setText( Engine.Localize( remaining ) )
		end
	end )
	self:addElement( ComsumableCountLabel )
	self.ComsumableCountLabel = ComsumableCountLabel
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				ComsumableBacking:completeAnimation()
				self.ComsumableBacking:setAlpha( 1 )
				self.clipFinished( ComsumableBacking, {} )
				NoComsumable:completeAnimation()
				self.NoComsumable:setAlpha( 0 )
				self.clipFinished( NoComsumable, {} )
				ComsumableCountLabel:completeAnimation()
				self.ComsumableCountLabel:setAlpha( 1 )
				self.clipFinished( ComsumableCountLabel, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				ComsumableBacking:completeAnimation()
				self.ComsumableBacking:setAlpha( 0 )
				self.clipFinished( ComsumableBacking, {} )
				NoComsumable:completeAnimation()
				self.NoComsumable:setAlpha( 0 )
				self.clipFinished( NoComsumable, {} )
				ComsumableCountLabel:completeAnimation()
				self.ComsumableCountLabel:setAlpha( 0 )
				self.clipFinished( ComsumableCountLabel, {} )
			end
		},
		Nocomsumable = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				ComsumableBacking:completeAnimation()
				self.ComsumableBacking:setAlpha( 0 )
				self.clipFinished( ComsumableBacking, {} )
				NoComsumable:completeAnimation()
				self.NoComsumable:setAlpha( 1 )
				self.clipFinished( NoComsumable, {} )
				ComsumableCountLabel:completeAnimation()
				self.ComsumableCountLabel:setAlpha( 1 )
				self.clipFinished( ComsumableCountLabel, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return not IsCACItemConsumable( menu, element, controller )
			end
		},
		{
			stateName = "Nocomsumable",
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
		element.ComsumableCountLabel:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

