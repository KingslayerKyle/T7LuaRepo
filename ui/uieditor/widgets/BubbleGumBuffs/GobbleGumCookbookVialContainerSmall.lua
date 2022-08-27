-- fe2b6605ae8bb7e7d2ddd44bf986e0a9
-- This hash is used for caching, delete to decompile the file again

CoD.GobbleGumCookbookVialContainerSmall = InheritFrom( LUI.UIElement )
CoD.GobbleGumCookbookVialContainerSmall.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GobbleGumCookbookVialContainerSmall )
	self.id = "GobbleGumCookbookVialContainerSmall"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 79 )
	self:setTopBottom( true, false, 0, 28 )
	
	local vialIcon = LUI.UIImage.new()
	vialIcon:setLeftRight( true, false, 0, 25 )
	vialIcon:setTopBottom( false, false, -12.5, 12.5 )
	vialIcon:setImage( RegisterImage( "uie_t7_hud_zm_vial_aar_256" ) )
	self:addElement( vialIcon )
	self.vialIcon = vialIcon
	
	local vialText = LUI.UITightText.new()
	vialText:setLeftRight( true, false, 20.75, 70.75 )
	vialText:setTopBottom( false, false, -11, 11 )
	vialText:setTTF( "fonts/default.ttf" )
	vialText:linkToElementModel( self, "itemVialCost", true, function ( model )
		local itemVialCost = Engine.GetModelValue( model )
		if itemVialCost then
			vialText:setText( Engine.Localize( SetValueIfNumberEqualTo( -1, "-", itemVialCost ) ) )
		end
	end )
	self:addElement( vialText )
	self.vialText = vialText
	
	self.clipsPerState = {
		HiddenForLootSale = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				vialIcon:completeAnimation()
				self.vialIcon:setAlpha( 0 )
				self.clipFinished( vialIcon, {} )
				vialText:completeAnimation()
				self.vialText:setAlpha( 0 )
				self.clipFinished( vialText, {} )
			end
		},
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				vialIcon:completeAnimation()
				self.vialIcon:setAlpha( 0 )
				self.clipFinished( vialIcon, {} )
				vialText:completeAnimation()
				self.vialText:setAlpha( 0 )
				self.clipFinished( vialText, {} )
			end
		},
		ShownInsufficientFunds = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				vialIcon:completeAnimation()
				self.vialIcon:setAlpha( 1 )
				self.clipFinished( vialIcon, {} )
				vialText:completeAnimation()
				self.vialText:setRGB( 0.93, 0.17, 0.17 )
				self.vialText:setAlpha( 1 )
				self.clipFinished( vialText, {} )
			end
		},
		Shown = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				vialIcon:completeAnimation()
				self.vialIcon:setAlpha( 1 )
				self.clipFinished( vialIcon, {} )
				vialText:completeAnimation()
				self.vialText:setRGB( 1, 1, 1 )
				self.vialText:setAlpha( 1 )
				self.clipFinished( vialText, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "HiddenForLootSale",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThan( element, controller, "itemVialCost", 0 ) and IsDistillLDSaleActive( controller )
			end
		},
		{
			stateName = "ShownInsufficientFunds",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThan( element, controller, "itemVialCost", 0 ) and not IsControllerModelValueGreaterThanOrEqualToSelfModelValue( element, controller, "MegaChewTokens.remainingTokens", "itemVialCost" )
			end
		},
		{
			stateName = "Shown",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThan( element, controller, "itemVialCost", 0 )
			end
		}
	} )
	self:linkToElementModel( self, "itemVialCost", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemVialCost"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "autoevents.cycled" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "autoevents.cycled"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "MegaChewTokens.remainingTokens" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "MegaChewTokens.remainingTokens"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.vialText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

