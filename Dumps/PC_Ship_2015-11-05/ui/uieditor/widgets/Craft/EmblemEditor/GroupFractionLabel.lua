CoD.GroupFractionLabel = InheritFrom( LUI.UIElement )
CoD.GroupFractionLabel.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GroupFractionLabel )
	self.id = "GroupFractionLabel"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 156 )
	self:setTopBottom( true, false, 0, 28 )
	
	local groupsUsedValue = LUI.UIText.new()
	groupsUsedValue:setLeftRight( false, true, -156, 0 )
	groupsUsedValue:setTopBottom( true, false, 4.5, 23.5 )
	groupsUsedValue:setTTF( "fonts/escom.ttf" )
	groupsUsedValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	groupsUsedValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	groupsUsedValue:subscribeToGlobalModel( controller, "EmblemProperties", "groupsUsedFraction", function ( model )
		local groupsUsedFraction = Engine.GetModelValue( model )
		if groupsUsedFraction then
			groupsUsedValue:setText( Engine.Localize( groupsUsedFraction ) )
		end
	end )
	self:addElement( groupsUsedValue )
	self.groupsUsedValue = groupsUsedValue
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				groupsUsedValue:completeAnimation()
				self.groupsUsedValue:setRGB( 1, 1, 1 )
				self.groupsUsedValue:setAlpha( 1 )
				self.clipFinished( groupsUsedValue, {} )
			end
		},
		GroupsFull = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				groupsUsedValue:completeAnimation()
				self.groupsUsedValue:setRGB( 1, 0, 0 )
				self.clipFinished( groupsUsedValue, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "GroupsFull",
			condition = function ( menu, element, event )
				return not IsGroupSlotAvailable( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemProperties.groupsUsed" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Emblem.EmblemProperties.groupsUsed"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.groupsUsedValue:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

