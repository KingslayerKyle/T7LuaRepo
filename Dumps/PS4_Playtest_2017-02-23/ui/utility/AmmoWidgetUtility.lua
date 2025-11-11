CoD.AmmoWidgetUtility = {}
CoD.AmmoWidgetUtility.InitTacticalEmptyPulse = function ( self, element, controller, exprWidgetClass, menu )
	local perControllerModel = Engine.GetModelForController( controller )
	element.previousPulseValue = 0
	element:subscribeToModel( Engine.GetModel( perControllerModel, "hudItems.pulseNoTactical" ), function ( model )
		local modelValue = Engine.GetModelValue( model )
		if element.previousPulseValue == modelValue then
			return 
		else
			element.previousPulseValue = modelValue
			if not PulseNoTactical( controller ) then
				return 
			elseif Engine.GetModelValue( Engine.GetModel( perControllerModel, "currentSecondaryOffhand.secondaryOffhand" ) ) == nil then
				return 
			else
				local tacticalEmptyCopy = exprWidgetClass.new( menu, controller )
				tacticalEmptyCopy:setLeftRight( element:getLocalLeftRight() )
				tacticalEmptyCopy:setTopBottom( element:getLocalTopBottom() )
				tacticalEmptyCopy:subscribeToGlobalModel( controller, "CurrentSecondaryOffhand", "secondaryOffhand", function ( model )
					local modelValue = Engine.GetModelValue( model )
					if modelValue then
						tacticalEmptyCopy.ImgIcon:setImage( RegisterImage( modelValue ) )
						tacticalEmptyCopy.ImgIconGrow:setImage( RegisterImage( modelValue ) )
					end
				end )
				tacticalEmptyCopy:registerEventHandler( "clip_over", function ( newElement, event )
					newElement:close()
				end )
				tacticalEmptyCopy:setState( "Empty" )
				self:addElement( tacticalEmptyCopy )
			end
		end
	end )
end

CoD.AmmoWidgetUtility.InitLethalEmptyPulse = function ( self, element, controller, exprWidgetClass, menu )
	local perControllerModel = Engine.GetModelForController( controller )
	element.previousPulseValue = 0
	element:subscribeToModel( Engine.GetModel( perControllerModel, "hudItems.pulseNoLethal" ), function ( model )
		local modelValue = Engine.GetModelValue( model )
		if element.previousPulseValue == modelValue then
			return 
		else
			element.previousPulseValue = modelValue
			if not PulseNoLethal( controller ) then
				return 
			elseif Engine.GetModelValue( Engine.GetModel( perControllerModel, "currentPrimaryOffhand.primaryOffhand" ) ) == nil then
				return 
			else
				local LethalEmptyCopy = exprWidgetClass.new( menu, controller )
				LethalEmptyCopy:setLeftRight( element:getLocalLeftRight() )
				LethalEmptyCopy:setTopBottom( element:getLocalTopBottom() )
				LethalEmptyCopy:subscribeToGlobalModel( controller, "CurrentPrimaryOffhand", "primaryOffhand", function ( model )
					local modelValue = Engine.GetModelValue( model )
					if modelValue then
						LethalEmptyCopy.ImgIcon:setImage( RegisterImage( modelValue ) )
						LethalEmptyCopy.ImgIconGrow:setImage( RegisterImage( modelValue ) )
					end
				end )
				LethalEmptyCopy:registerEventHandler( "clip_over", function ( newElement, event )
					newElement:close()
				end )
				LethalEmptyCopy:setState( "Empty" )
				self:addElement( LethalEmptyCopy )
			end
		end
	end )
end

