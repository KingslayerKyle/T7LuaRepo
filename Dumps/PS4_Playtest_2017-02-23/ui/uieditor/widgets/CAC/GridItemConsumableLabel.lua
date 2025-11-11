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
	self:setLeftRight( 0, 0, 0, 48 )
	self:setTopBottom( 0, 0, 0, 48 )
	
	local ComsumableBacking = LUI.UIImage.new()
	ComsumableBacking:setLeftRight( 0.5, 0.5, -48, 48 )
	ComsumableBacking:setTopBottom( 0.5, 0.5, -48, 48 )
	ComsumableBacking:setScale( 0.5 )
	ComsumableBacking:setImage( RegisterImage( "uie_t7_menu_gobblegum_comsumable" ) )
	self:addElement( ComsumableBacking )
	self.ComsumableBacking = ComsumableBacking
	
	local NoComsumable = LUI.UIImage.new()
	NoComsumable:setLeftRight( 0.5, 0.5, -48, 48 )
	NoComsumable:setTopBottom( 0.5, 0.5, -48, 48 )
	NoComsumable:setScale( 0.5 )
	NoComsumable:setImage( RegisterImage( "uie_t7_menu_gobblegum_noncomsumable" ) )
	self:addElement( NoComsumable )
	self.NoComsumable = NoComsumable
	
	local ComsumableCountLabel = LUI.UIText.new()
	ComsumableCountLabel:setLeftRight( 0.5, 0.5, -16, 16 )
	ComsumableCountLabel:setTopBottom( 0.5, 0.5, -15, 12 )
	ComsumableCountLabel:setRGB( 0.82, 0.85, 0.88 )
	ComsumableCountLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ComsumableCountLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ComsumableCountLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	ComsumableCountLabel:linkToElementModel( self, "remaining", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ComsumableCountLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( ComsumableCountLabel )
	self.ComsumableCountLabel = ComsumableCountLabel
	
	self.resetProperties = function ()
		NoComsumable:completeAnimation()
		ComsumableCountLabel:completeAnimation()
		ComsumableBacking:completeAnimation()
		NoComsumable:setAlpha( 1 )
		ComsumableCountLabel:setAlpha( 1 )
		ComsumableBacking:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				NoComsumable:completeAnimation()
				self.NoComsumable:setAlpha( 0 )
				self.clipFinished( NoComsumable, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self.resetProperties()
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
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				ComsumableBacking:completeAnimation()
				self.ComsumableBacking:setAlpha( 0 )
				self.clipFinished( ComsumableBacking, {} )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.ComsumableCountLabel:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

