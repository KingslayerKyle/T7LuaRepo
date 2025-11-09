CoD.StartMenu_Objectives_Item = InheritFrom( LUI.UIElement )
CoD.StartMenu_Objectives_Item.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Objectives_Item )
	self.id = "StartMenu_Objectives_Item"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 414 )
	self:setTopBottom( true, false, 0, 34 )
	
	local fill = LUI.UIImage.new()
	fill:setLeftRight( true, false, 0, 25 )
	fill:setTopBottom( false, false, -12, 12 )
	fill:setImage( RegisterImage( "uie_cp_menu_t7_checkbox" ) )
	self:addElement( fill )
	self.fill = fill
	
	local check = LUI.UIImage.new()
	check:setLeftRight( true, false, 0, 25 )
	check:setTopBottom( false, false, -12, 12 )
	check:setImage( RegisterImage( "uie_cp_menu_t7_checkmark" ) )
	self:addElement( check )
	self.check = check
	
	local objective = LUI.UIText.new()
	objective:setLeftRight( true, true, 35, 0 )
	objective:setTopBottom( false, false, -12, 10 )
	objective:setScale( LanguageOverrideNumber( "japanese", 0.85, 1 ) )
	objective:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	objective:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	objective:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	objective:linkToElementModel( self, "objective", true, function ( model )
		local _objective = Engine.GetModelValue( model )
		if _objective then
			objective:setText( Engine.Localize( _objective ) )
		end
	end )
	self:addElement( objective )
	self.objective = objective
	
	local subobjectiveImage = LUI.UIImage.new()
	subobjectiveImage:setLeftRight( true, false, 35, 60 )
	subobjectiveImage:setTopBottom( false, false, -12.5, 12.5 )
	subobjectiveImage:setAlpha( 0 )
	subobjectiveImage:linkToElementModel( self, "subobjective_image", true, function ( model )
		local _subobjectiveImage = Engine.GetModelValue( model )
		if _subobjectiveImage then
			subobjectiveImage:setImage( RegisterImage( _subobjectiveImage ) )
		end
	end )
	self:addElement( subobjectiveImage )
	self.subobjectiveImage = subobjectiveImage
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				fill:completeAnimation()
				self.fill:setAlpha( 0 )
				self.clipFinished( fill, {} )
				check:completeAnimation()
				self.check:setAlpha( 0 )
				self.clipFinished( check, {} )
				objective:completeAnimation()
				self.objective:setLeftRight( true, true, 1, -34 )
				self.objective:setTopBottom( false, false, -10, 10 )
				self.clipFinished( objective, {} )
				subobjectiveImage:completeAnimation()
				self.subobjectiveImage:setAlpha( 0 )
				self.clipFinished( subobjectiveImage, {} )
			end
		},
		completed = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				fill:completeAnimation()
				self.fill:setAlpha( 1 )
				self.clipFinished( fill, {} )
				check:completeAnimation()
				self.check:setAlpha( 1 )
				self.clipFinished( check, {} )
				objective:completeAnimation()
				self.objective:setLeftRight( true, true, 28, -113.12 )
				self.objective:setTopBottom( false, false, -9, 9 )
				self.objective:setAlpha( 0.5 )
				self.clipFinished( objective, {} )
				subobjectiveImage:completeAnimation()
				self.subobjectiveImage:setAlpha( 0 )
				self.clipFinished( subobjectiveImage, {} )
			end
		},
		AwaitingSubobjective = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				fill:completeAnimation()
				self.fill:setAlpha( 0 )
				self.clipFinished( fill, {} )
				check:completeAnimation()
				self.check:setAlpha( 0 )
				self.clipFinished( check, {} )
				objective:completeAnimation()
				self.objective:setLeftRight( true, true, 1, -34 )
				self.objective:setTopBottom( false, false, -10, 10 )
				self.objective:setAlpha( 1 )
				self.clipFinished( objective, {} )
				subobjectiveImage:completeAnimation()
				self.subobjectiveImage:setAlpha( 0 )
				self.clipFinished( subobjectiveImage, {} )
			end
		},
		Subobjective = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				fill:completeAnimation()
				self.fill:setAlpha( 0 )
				self.clipFinished( fill, {} )
				check:completeAnimation()
				self.check:setAlpha( 0 )
				self.clipFinished( check, {} )
				objective:completeAnimation()
				self.objective:setLeftRight( true, true, 54, -3 )
				self.objective:setTopBottom( false, false, -10.5, 14.5 )
				self.objective:setRGB( 0.95, 0.89, 0.03 )
				self.clipFinished( objective, {} )
				subobjectiveImage:completeAnimation()
				self.subobjectiveImage:setLeftRight( true, false, 10, 50 )
				self.subobjectiveImage:setTopBottom( false, false, -17, 23 )
				self.subobjectiveImage:setAlpha( 1 )
				self.clipFinished( subobjectiveImage, {} )
			end
		},
		AwaitingObjective = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				fill:completeAnimation()
				self.fill:setAlpha( 0 )
				self.clipFinished( fill, {} )
				check:completeAnimation()
				self.check:setAlpha( 0 )
				self.clipFinished( check, {} )
				objective:completeAnimation()
				self.objective:setLeftRight( true, true, 1, -34 )
				self.objective:setTopBottom( false, false, -10, 10 )
				self.clipFinished( objective, {} )
				subobjectiveImage:completeAnimation()
				self.subobjectiveImage:setAlpha( 0 )
				self.clipFinished( subobjectiveImage, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "completed",
			condition = function ( menu, element, event )
				return PropertyIsTrue( self, "completed" )
			end
		},
		{
			stateName = "AwaitingSubobjective",
			condition = function ( menu, element, event )
				return PropertyIsTrue( self, "awaitingOrders" ) and PropertyIsTrue( self, "subobjective" )
			end
		},
		{
			stateName = "Subobjective",
			condition = function ( menu, element, event )
				return PropertyIsTrue( self, "subobjective" )
			end
		},
		{
			stateName = "AwaitingObjective",
			condition = function ( menu, element, event )
				return PropertyIsTrue( self, "awaitingOrders" )
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.objective:close()
		element.subobjectiveImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

