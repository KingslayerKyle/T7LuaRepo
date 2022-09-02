-- 84444cc0509a077c946a669cf97d1700
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.GridItemBGBGlow" )
require( "ui.uieditor.widgets.CAC.GridItemConsumableLabel" )
require( "ui.uieditor.widgets.CAC.cac_FocusBarContainer" )

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

CoD.GobbleGumCookBookIcon = InheritFrom( LUI.UIElement )
CoD.GobbleGumCookBookIcon.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.GobbleGumCookBookIcon )
	self.id = "GobbleGumCookBookIcon"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 108 )
	self:setTopBottom( true, false, 0, 108 )
	self.anyChildUsesUpdateState = true
	
	local shadow = LUI.UIImage.new()
	shadow:setLeftRight( false, false, -69.94, 69.94 )
	shadow:setTopBottom( false, false, -47, 132.33 )
	shadow:setAlpha( 0 )
	shadow:setScale( 1.2 )
	shadow:setImage( RegisterImage( "uie_t7_zm_cookbook_gg_shadow" ) )
	self:addElement( shadow )
	self.shadow = shadow
	
	local GridItemBGBGlow = CoD.GridItemBGBGlow.new( menu, controller )
	GridItemBGBGlow:setLeftRight( true, true, -21, 21 )
	GridItemBGBGlow:setTopBottom( true, true, -21, 21 )
	GridItemBGBGlow:setAlpha( 0 )
	GridItemBGBGlow:setScale( 0.8 )
	GridItemBGBGlow:linkToElementModel( self, nil, false, function ( model )
		GridItemBGBGlow:setModel( model, controller )
	end )
	self:addElement( GridItemBGBGlow )
	self.GridItemBGBGlow = GridItemBGBGlow
	
	local itemImage = LUI.UIImage.new()
	itemImage:setLeftRight( true, true, 1, 1 )
	itemImage:setTopBottom( true, true, 2, 2 )
	itemImage:setScale( 0.8 )
	itemImage:setupUIStreamedImage( 0 )
	itemImage:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			itemImage:setImage( RegisterImage( image ) )
		end
	end )
	self:addElement( itemImage )
	self.itemImage = itemImage
	
	local ConsumableLabel = CoD.GridItemConsumableLabel.new( menu, controller )
	ConsumableLabel:setLeftRight( true, false, 23, 45 )
	ConsumableLabel:setTopBottom( true, true, 7, -83 )
	ConsumableLabel:setScale( 0.8 )
	ConsumableLabel:linkToElementModel( self, nil, false, function ( model )
		ConsumableLabel:setModel( model, controller )
	end )
	ConsumableLabel:linkToElementModel( self, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			ConsumableLabel.ComsumableCountLabel:setText( Engine.Localize( GetConsumableCountFromIndex( controller, itemIndex ) ) )
		end
	end )
	self:addElement( ConsumableLabel )
	self.ConsumableLabel = ConsumableLabel
	
	local FocusWhiteT = CoD.cac_FocusBarContainer.new( menu, controller )
	FocusWhiteT:setLeftRight( true, true, -2, 2 )
	FocusWhiteT:setTopBottom( true, false, -4, 0 )
	FocusWhiteT:setAlpha( 0 )
	FocusWhiteT:setZoom( 1 )
	self:addElement( FocusWhiteT )
	self.FocusWhiteT = FocusWhiteT
	
	local FocusWhiteB = CoD.cac_FocusBarContainer.new( menu, controller )
	FocusWhiteB:setLeftRight( true, true, -2, 2 )
	FocusWhiteB:setTopBottom( false, true, 0, 4 )
	FocusWhiteB:setAlpha( 0 )
	FocusWhiteB:setZoom( 1 )
	self:addElement( FocusWhiteB )
	self.FocusWhiteB = FocusWhiteB
	
	local dlcDownloadImage = LUI.UIImage.new()
	dlcDownloadImage:setLeftRight( false, false, -20, 20 )
	dlcDownloadImage:setTopBottom( false, false, -20, 20 )
	dlcDownloadImage:setAlpha( 0 )
	dlcDownloadImage:setImage( RegisterImage( "uie_t7_icon_contextual_purchase" ) )
	self:addElement( dlcDownloadImage )
	self.dlcDownloadImage = dlcDownloadImage
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				shadow:completeAnimation()
				self.shadow:setAlpha( 1 )
				self.clipFinished( shadow, {} )

				GridItemBGBGlow:completeAnimation()
				self.GridItemBGBGlow:setAlpha( 0 )
				self.clipFinished( GridItemBGBGlow, {} )

				itemImage:completeAnimation()
				self.itemImage:setAlpha( 1 )
				self.itemImage:setScale( 0.8 )
				self.clipFinished( itemImage, {} )
			end
		},
		NoConsumablesRemaining = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				shadow:completeAnimation()
				self.shadow:setAlpha( 1 )
				self.clipFinished( shadow, {} )

				GridItemBGBGlow:completeAnimation()
				self.GridItemBGBGlow:setAlpha( 0.1 )
				self.clipFinished( GridItemBGBGlow, {} )

				itemImage:completeAnimation()
				self.itemImage:setAlpha( 1 )
				self.itemImage:setScale( 0.8 )
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
		element.GridItemBGBGlow:close()
		element.ConsumableLabel:close()
		element.FocusWhiteT:close()
		element.FocusWhiteB:close()
		element.itemImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

