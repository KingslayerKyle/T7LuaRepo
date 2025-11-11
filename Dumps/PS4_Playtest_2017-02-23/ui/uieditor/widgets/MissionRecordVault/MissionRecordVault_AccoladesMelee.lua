CoD.MissionRecordVault_AccoladesMelee = InheritFrom( LUI.UIElement )
CoD.MissionRecordVault_AccoladesMelee.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MissionRecordVault_AccoladesMelee )
	self.id = "MissionRecordVault_AccoladesMelee"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 150 )
	self:setTopBottom( 0, 0, 0, 150 )
	
	local image = LUI.UIImage.new()
	image:setLeftRight( 0, 1, 0, 0 )
	image:setTopBottom( 0, 1, 0, 0 )
	image:setRGB( 0.99, 0.97, 0.58 )
	image:setImage( RegisterImage( "uie_melee" ) )
	self:addElement( image )
	self.image = image
	
	local centerText = LUI.UIText.new()
	centerText:setLeftRight( 0, 1, 25, -87 )
	centerText:setTopBottom( 0.5, 0.5, 11, 56 )
	centerText:setRGB( 0.99, 1, 0 )
	centerText:setAlpha( 0 )
	centerText:setTTF( "fonts/escom.ttf" )
	centerText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	centerText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	centerText:linkToElementModel( self, "centerText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			centerText:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( centerText )
	self.centerText = centerText
	
	self.resetProperties = function ()
		image:completeAnimation()
		centerText:completeAnimation()
		image:setRGB( 0.99, 0.97, 0.58 )
		centerText:setRGB( 0.99, 1, 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				image:completeAnimation()
				self.image:setRGB( 1, 0.96, 0 )
				self.clipFinished( image, {} )
			end
		},
		Incomplete = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				image:completeAnimation()
				self.image:setRGB( 1, 1, 1 )
				self.clipFinished( image, {} )
				centerText:completeAnimation()
				self.centerText:setRGB( 1, 1, 1 )
				self.clipFinished( centerText, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			LoseFocus = function ()
				self.resetProperties()
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.centerText:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

