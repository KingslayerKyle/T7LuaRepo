-- a19e8922ed86fdb4b355bb187b106ade
-- This hash is used for caching, delete to decompile the file again

CoD.GobbleGumCookbook_VialSaleActive = InheritFrom( LUI.UIElement )
CoD.GobbleGumCookbook_VialSaleActive.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GobbleGumCookbook_VialSaleActive )
	self.id = "GobbleGumCookbook_VialSaleActive"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 58 )
	self:setTopBottom( true, false, 0, 50 )
	
	local cost = LUI.UITightText.new()
	cost:setLeftRight( true, false, 15, 47 )
	cost:setTopBottom( true, false, 2, 24 )
	cost:setRGB( 1, 0.55, 0.55 )
	cost:setTTF( "fonts/default.ttf" )
	cost:linkToElementModel( self, "itemVialCost", true, function ( model )
		local itemVialCost = Engine.GetModelValue( model )
		if itemVialCost then
			cost:setText( Engine.Localize( SetValueIfNumberEqualTo( -1, "-", GetVialCostBeforeDiscount( controller, itemVialCost ) ) ) )
		end
	end )
	self:addElement( cost )
	self.cost = cost
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, false, 9.5, 48.5 )
	bg:setTopBottom( true, false, 3, 42 )
	bg:setImage( RegisterImage( "uie_t7_blackmarket_promo_crossout" ) )
	self:addElement( bg )
	self.bg = bg
	
	local vialText = LUI.UITightText.new()
	vialText:setLeftRight( true, false, 15, 47 )
	vialText:setTopBottom( true, false, 20, 42 )
	vialText:setTTF( "fonts/default.ttf" )
	vialText:linkToElementModel( self, "itemVialCost", true, function ( model )
		local itemVialCost = Engine.GetModelValue( model )
		if itemVialCost then
			vialText:setText( Engine.Localize( SetValueIfNumberEqualTo( -1, "-", itemVialCost ) ) )
		end
	end )
	self:addElement( vialText )
	self.vialText = vialText
	
	local vialIcon = LUI.UIImage.new()
	vialIcon:setLeftRight( true, false, -5.75, 19.75 )
	vialIcon:setTopBottom( true, false, 0.5, 25.5 )
	vialIcon:setImage( RegisterImage( "uie_t7_hud_zm_vial_aar_256" ) )
	self:addElement( vialIcon )
	self.vialIcon = vialIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				cost:completeAnimation()
				self.cost:setAlpha( 0 )
				self.clipFinished( cost, {} )
				bg:completeAnimation()
				self.bg:setAlpha( 0 )
				self.clipFinished( bg, {} )
				vialText:completeAnimation()
				self.vialText:setAlpha( 0 )
				self.clipFinished( vialText, {} )
				vialIcon:completeAnimation()
				self.vialIcon:setAlpha( 0 )
				self.clipFinished( vialIcon, {} )
			end
		},
		SaleOnInsufficientFunds = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				cost:completeAnimation()
				self.cost:setAlpha( 1 )
				self.clipFinished( cost, {} )
				bg:completeAnimation()
				self.bg:setAlpha( 1 )
				self.clipFinished( bg, {} )
				vialText:completeAnimation()
				self.vialText:setRGB( 0.93, 0.17, 0.17 )
				self.vialText:setAlpha( 1 )
				self.clipFinished( vialText, {} )
				vialIcon:completeAnimation()
				self.vialIcon:setAlpha( 1 )
				self.clipFinished( vialIcon, {} )
			end
		},
		SaleOn = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				cost:completeAnimation()
				self.cost:setAlpha( 1 )
				self.clipFinished( cost, {} )
				bg:completeAnimation()
				self.bg:setAlpha( 1 )
				self.clipFinished( bg, {} )
				vialText:completeAnimation()
				self.vialText:setRGB( 1, 1, 1 )
				self.vialText:setAlpha( 1 )
				self.clipFinished( vialText, {} )
				vialIcon:completeAnimation()
				self.vialIcon:setAlpha( 1 )
				self.clipFinished( vialIcon, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "SaleOnInsufficientFunds",
			condition = function ( menu, element, event )
				local f7_local0 = IsDistillLDSaleActive( controller )
				if f7_local0 then
					if not IsControllerModelValueGreaterThanOrEqualToSelfModelValue( element, controller, "MegaChewTokens.remainingTokens", "itemVialCost" ) then
						f7_local0 = IsSelfModelValueGreaterThan( element, controller, "itemVialCost", 0 )
					else
						f7_local0 = false
					end
				end
				return f7_local0
			end
		},
		{
			stateName = "SaleOn",
			condition = function ( menu, element, event )
				return IsDistillLDSaleActive( controller ) and IsSelfModelValueGreaterThan( element, controller, "itemVialCost", 0 )
			end
		}
	} )
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
	self:linkToElementModel( self, "itemVialCost", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemVialCost"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.cost:close()
		element.vialText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

