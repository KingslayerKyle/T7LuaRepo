CoD.FE_HelpItemsLabel = InheritFrom( LUI.UIElement )
CoD.FE_HelpItemsLabel.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_HelpItemsLabel )
	self.id = "FE_HelpItemsLabel"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 20 )
	self:setTopBottom( true, false, 0, 20 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 20 )
	Image0:setTopBottom( true, false, 0, 20 )
	Image0:setImage( RegisterImage( "uie_t7_menu_frontend_helptag" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Label0 = LUI.UITightText.new()
	Label0:setLeftRight( false, false, -2, 5 )
	Label0:setTopBottom( false, true, -18, -2 )
	Label0:setRGB( 0, 0, 0 )
	Label0:setText( Engine.Localize( "5" ) )
	Label0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Image0:completeAnimation()
				self.Image0:setAlpha( 0 )
				self.clipFinished( Image0, {} )
				Label0:completeAnimation()
				self.Label0:setAlpha( 0 )
				self.clipFinished( Label0, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Image0:completeAnimation()
				self.Image0:setAlpha( 1 )
				self.clipFinished( Image0, {} )
				Label0:completeAnimation()
				self.Label0:setAlpha( 1 )
				self.clipFinished( Label0, {} )
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
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsDisabled( element, controller )
			end
		}
	} )
	self:linkToElementModel( self, "disabled", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		} )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

