local PostLoadFunc = function ( self, controller, menu )
	self:linkToElementModel( self, "hintText", true, function ( model )
		self:processEvent( {
			name = "update_state",
			controller = controller,
			menu = menu
		} )
		self:completeAnimation()
	end )
end

CoD.HintTextArrow = InheritFrom( LUI.UIElement )
CoD.HintTextArrow.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.HintTextArrow )
	self.id = "HintTextArrow"
	self.soundSet = "CAC"
	self:setLeftRight( 0, 0, 0, 15 )
	self:setTopBottom( 0, 0, 0, 15 )
	
	local arrowUp = LUI.UIImage.new()
	arrowUp:setLeftRight( 0.5, 0.5, -16.5, 16.5 )
	arrowUp:setTopBottom( 0.5, 0.5, -12, 10 )
	arrowUp:setZRot( 180 )
	arrowUp:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_arrow" ) )
	arrowUp:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( arrowUp )
	self.arrowUp = arrowUp
	
	self.resetProperties = function ()
		arrowUp:completeAnimation()
		arrowUp:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		NoHintText = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				arrowUp:completeAnimation()
				self.arrowUp:setAlpha( 0 )
				self.clipFinished( arrowUp, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "NoHintText",
			condition = function ( menu, element, event )
				return not HasHintText( element )
			end
		}
	} )
	self:linkToElementModel( self, nil, true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		} )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

