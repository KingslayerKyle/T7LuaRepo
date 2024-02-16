-- cd54264afe28683c877274e52ef392ea
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.ZM_Cookbook.Cookbook_Recipe_Fill" )
require( "ui.uieditor.widgets.ZM_Cookbook.GobbleGumRecipeIcon" )
require( "ui.uieditor.widgets.ZM_Cookbook.Cookbook_Indicator_Circle" )
require( "ui.uieditor.widgets.BubbleGumBuffs.GobbleGumCookbookConsumableCountNumbers" )

local PostLoadFunc = function ( self, controller, menu )
	self:linkToElementModel( self, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		local f2_local1 = Engine.GetUnlockableInfoModelByIndex( modelValue, "Unlockables." .. modelValue, Enum.eModes.MODE_ZOMBIES )
		if f2_local1 then
			self.GobbleGumRecipeIcon:setModel( f2_local1 )
		end
	end )
	self:subscribeToModel( Engine.GetModel( CoD.BubbleGumBuffUtility.GetGobbleGumRecipeInfoModel( controller ), "update" ), function ( model )
		Engine.ForceNotifyModelSubscriptions( Engine.GetModel( self:getModel(), "itemIndex" ) )
	end, false )
end

CoD.GobbleGumRecipeListItem = InheritFrom( LUI.UIElement )
CoD.GobbleGumRecipeListItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.GobbleGumRecipeListItem )
	self.id = "GobbleGumRecipeListItem"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 108 )
	self:setTopBottom( true, false, 0, 160 )
	self.anyChildUsesUpdateState = true
	
	local CookbookRecipeFill = CoD.Cookbook_Recipe_Fill.new( menu, controller )
	CookbookRecipeFill:setLeftRight( true, false, 116.5, 206.5 )
	CookbookRecipeFill:setTopBottom( true, false, 36, 77 )
	CookbookRecipeFill:linkToElementModel( self, nil, false, function ( model )
		CookbookRecipeFill:setModel( model, controller )
	end )
	self:addElement( CookbookRecipeFill )
	self.CookbookRecipeFill = CookbookRecipeFill
	
	local GobbleGumRecipeIcon = CoD.GobbleGumRecipeIcon.new( menu, controller )
	GobbleGumRecipeIcon:setLeftRight( true, false, 0, 108 )
	GobbleGumRecipeIcon:setTopBottom( true, false, 0, 108 )
	self:addElement( GobbleGumRecipeIcon )
	self.GobbleGumRecipeIcon = GobbleGumRecipeIcon
	
	local CookbookIndicatorCircleTop = CoD.Cookbook_Indicator_Circle.new( menu, controller )
	CookbookIndicatorCircleTop:setLeftRight( true, false, 259.5, 267.5 )
	CookbookIndicatorCircleTop:setTopBottom( true, false, 51.5, 59.5 )
	CookbookIndicatorCircleTop:linkToElementModel( self, nil, false, function ( model )
		CookbookIndicatorCircleTop:setModel( model, controller )
	end )
	CookbookIndicatorCircleTop:mergeStateConditions( {
		{
			stateName = "Red",
			condition = function ( menu, element, event )
				return IsSelfModelValueLessThan( element, controller, "percentComplete", 1 )
			end
		},
		{
			stateName = "Green",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "percentComplete", 1 )
			end
		}
	} )
	CookbookIndicatorCircleTop:linkToElementModel( CookbookIndicatorCircleTop, "percentComplete", true, function ( model )
		menu:updateElementState( CookbookIndicatorCircleTop, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "percentComplete"
		} )
	end )
	self:addElement( CookbookIndicatorCircleTop )
	self.CookbookIndicatorCircleTop = CookbookIndicatorCircleTop
	
	local Requirements = LUI.UIText.new()
	Requirements:setLeftRight( true, false, 215.5, 262.5 )
	Requirements:setTopBottom( true, false, 43, 67 )
	Requirements:setRGB( 0.3, 0.2, 0.14 )
	Requirements:setTTF( "fonts/default.ttf" )
	Requirements:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Requirements:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	Requirements:linkToElementModel( self, "count", true, function ( model )
		local count = Engine.GetModelValue( model )
		if count then
			Requirements:setText( Engine.Localize( count ) )
		end
	end )
	self:addElement( Requirements )
	self.Requirements = Requirements
	
	local GobbleGumCookbookConsumableCountNumbers = CoD.GobbleGumCookbookConsumableCountNumbers.new( menu, controller )
	GobbleGumCookbookConsumableCountNumbers:setLeftRight( true, false, 121, 202 )
	GobbleGumCookbookConsumableCountNumbers:setTopBottom( true, false, 39, 72 )
	GobbleGumCookbookConsumableCountNumbers:linkToElementModel( self, nil, false, function ( model )
		GobbleGumCookbookConsumableCountNumbers:setModel( model, controller )
	end )
	GobbleGumCookbookConsumableCountNumbers:mergeStateConditions( {
		{
			stateName = "Triple",
			condition = function ( menu, element, event )
				return IsConsumableCountGreaterThanOrEqualTo( element, controller, 100 )
			end
		},
		{
			stateName = "Double",
			condition = function ( menu, element, event )
				return IsConsumableCountGreaterThanOrEqualTo( element, controller, 10 )
			end
		}
	} )
	GobbleGumCookbookConsumableCountNumbers:linkToElementModel( GobbleGumCookbookConsumableCountNumbers, "itemIndex", true, function ( model )
		menu:updateElementState( GobbleGumCookbookConsumableCountNumbers, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( GobbleGumCookbookConsumableCountNumbers )
	self.GobbleGumCookbookConsumableCountNumbers = GobbleGumCookbookConsumableCountNumbers
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				CookbookRecipeFill:completeAnimation()
				self.CookbookRecipeFill:setAlpha( 1 )
				self.clipFinished( CookbookRecipeFill, {} )

				GobbleGumRecipeIcon:completeAnimation()
				self.GobbleGumRecipeIcon:setAlpha( 1 )
				self.clipFinished( GobbleGumRecipeIcon, {} )

				CookbookIndicatorCircleTop:completeAnimation()
				self.CookbookIndicatorCircleTop:setLeftRight( true, false, 259.5, 267.5 )
				self.CookbookIndicatorCircleTop:setTopBottom( true, false, 51.5, 59.5 )
				self.clipFinished( CookbookIndicatorCircleTop, {} )

				Requirements:completeAnimation()
				self.Requirements:setAlpha( 1 )
				self.clipFinished( Requirements, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CookbookRecipeFill:close()
		element.GobbleGumRecipeIcon:close()
		element.CookbookIndicatorCircleTop:close()
		element.GobbleGumCookbookConsumableCountNumbers:close()
		element.Requirements:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
