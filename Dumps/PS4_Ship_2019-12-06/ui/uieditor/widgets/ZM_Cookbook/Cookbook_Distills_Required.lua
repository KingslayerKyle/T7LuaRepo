CoD.Cookbook_Distills_Required = InheritFrom( LUI.UIElement )
CoD.Cookbook_Distills_Required.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Cookbook_Distills_Required )
	self.id = "Cookbook_Distills_Required"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 79 )
	self:setTopBottom( true, false, 0, 31 )
	
	local DistillIcon = LUI.UIImage.new()
	DistillIcon:setLeftRight( true, false, 0, 31 )
	DistillIcon:setTopBottom( true, false, 0, 31 )
	DistillIcon:setImage( RegisterImage( "uie_t7_zm_cookbook_distill_icon" ) )
	self:addElement( DistillIcon )
	self.DistillIcon = DistillIcon
	
	local DistillAmount = LUI.UIText.new()
	DistillAmount:setLeftRight( true, false, 27, 79 )
	DistillAmount:setTopBottom( true, false, 3, 28 )
	DistillAmount:setRGB( 0, 0, 0 )
	DistillAmount:setTTF( "fonts/default.ttf" )
	DistillAmount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	DistillAmount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	DistillAmount:subscribeToGlobalModel( controller, "GobbleGumRecipeInfo", "recipeDistillCost", function ( model )
		local recipeDistillCost = Engine.GetModelValue( model )
		if recipeDistillCost then
			DistillAmount:setText( Engine.Localize( recipeDistillCost ) )
		end
	end )
	self:addElement( DistillAmount )
	self.DistillAmount = DistillAmount
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				DistillAmount:completeAnimation()
				self.DistillAmount:setRGB( 0, 0, 0 )
				self.clipFinished( DistillAmount, {} )
			end
		},
		NotEnoughDistills = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				DistillAmount:completeAnimation()
				self.DistillAmount:setRGB( 0.9, 0, 0 )
				self.clipFinished( DistillAmount, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "NotEnoughDistills",
			condition = function ( menu, element, event )
				return IsModelValueLessThan( controller, "GobbleGumDistills.totalDistills", CoD.BubbleGumBuffUtility.GetRecipeDistillCost() )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "GobbleGumDistills.totalDistills" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "GobbleGumDistills.totalDistills"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.DistillAmount:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

