CoD.ArmorOverlayContainer = InheritFrom( LUI.UIElement )
CoD.ArmorOverlayContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ArmorOverlayContainer )
	self.id = "ArmorOverlayContainer"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	
	local ArmorOverlayImage = LUI.UIImage.new()
	ArmorOverlayImage:setLeftRight( false, false, -640, 640 )
	ArmorOverlayImage:setTopBottom( false, false, -360, 360 )
	ArmorOverlayImage:subscribeToGlobalModel( controller, "HUDItems", "armorOverlay", function ( model )
		local armorOverlay = Engine.GetModelValue( model )
		if armorOverlay then
			ArmorOverlayImage:setImage( RegisterImage( armorOverlay ) )
		end
	end )
	self:addElement( ArmorOverlayImage )
	self.ArmorOverlayImage = ArmorOverlayImage
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				ArmorOverlayImage:completeAnimation()
				self.ArmorOverlayImage:setAlpha( 0 )
				self.clipFinished( ArmorOverlayImage, {} )
			end
		},
		ArmorActive = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				ArmorOverlayImage:completeAnimation()
				self.ArmorOverlayImage:setAlpha( 1 )
				self.clipFinished( ArmorOverlayImage, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "ArmorActive",
			condition = function ( menu, element, event )
				return IsArmorOverlayActive( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.armorOverlay" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.armorOverlay"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ArmorOverlayImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

