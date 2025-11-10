CoD.MissionRecordVault_AccoladesDifficulty = InheritFrom( LUI.UIElement )
CoD.MissionRecordVault_AccoladesDifficulty.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MissionRecordVault_AccoladesDifficulty )
	self.id = "MissionRecordVault_AccoladesDifficulty"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 100 )
	self:setTopBottom( true, false, 0, 100 )
	
	local image = LUI.UIImage.new()
	image:setLeftRight( true, true, 0, 0 )
	image:setTopBottom( true, true, 0, 0 )
	image:setRGB( 1, 0.96, 0 )
	image:linkToElementModel( self, "centerText", true, function ( model )
		local centerText = Engine.GetModelValue( model )
		if centerText then
			image:setImage( RegisterImage( DifficultyIconFromNumber( centerText ) ) )
		end
	end )
	self:addElement( image )
	self.image = image
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				image:completeAnimation()
				self.image:setRGB( 1, 0.96, 0 )
				self.clipFinished( image, {} )
			end
		},
		Incomplete = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				image:completeAnimation()
				self.image:setRGB( 1, 1, 1 )
				self.clipFinished( image, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self:setupElementClipCounter( 0 )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Incomplete",
			condition = function ( menu, element, event )
				return not IsSelfModelValueTrue( element, controller, "completed" )
			end
		}
	} )
	self:linkToElementModel( self, "completed", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "completed"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.image:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

