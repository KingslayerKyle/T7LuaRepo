-- 42965fbb5289994540e22f830d7d2e6b
-- This hash is used for caching, delete to decompile the file again

local PostLoadFunc = function ( self, controller, menu )
	local f1_local0 = CoD.BubbleGumBuffUtility.GetGobbleGumRecipeInfoModel( controller )
	if f1_local0 then
		self:subscribeToModel( Engine.CreateModel( f1_local0, "update" ), function ( model )
			local f2_local0 = self:getModel()
			if f2_local0 then
				f2_local0 = Engine.GetModel( self:getModel(), "itemIndex" )
			end
			if f2_local0 then
				Engine.ForceNotifyModelSubscriptions( f2_local0 )
			end
		end, false )
	end
end

CoD.GobbleGumRecipeIcon = InheritFrom( LUI.UIElement )
CoD.GobbleGumRecipeIcon.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.GobbleGumRecipeIcon )
	self.id = "GobbleGumRecipeIcon"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 108 )
	self:setTopBottom( true, false, 0, 108 )
	
	local shadow = LUI.UIImage.new()
	shadow:setLeftRight( true, false, -11.26, 119.7 )
	shadow:setTopBottom( true, false, 0.98, 168.86 )
	shadow:setImage( RegisterImage( "uie_t7_zm_cookbook_gg_shadow" ) )
	self:addElement( shadow )
	self.shadow = shadow
	
	local itemImage = LUI.UIImage.new()
	itemImage:setLeftRight( true, true, 0, 0 )
	itemImage:setTopBottom( true, true, 0, 0 )
	itemImage:setAlpha( 0 )
	itemImage:setupUIStreamedImage( 0 )
	itemImage:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			itemImage:setImage( RegisterImage( image ) )
		end
	end )
	self:addElement( itemImage )
	self.itemImage = itemImage
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				itemImage:completeAnimation()
				self.itemImage:setAlpha( 1 )
				self.itemImage:setScale( 1 )
				self.clipFinished( itemImage, {} )
			end
		},
		NoConsumablesRemaining = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				itemImage:completeAnimation()
				self.itemImage:setAlpha( 1 )
				self.itemImage:setScale( 1 )
				self.clipFinished( itemImage, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "NoConsumablesRemaining",
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
		element.itemImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
