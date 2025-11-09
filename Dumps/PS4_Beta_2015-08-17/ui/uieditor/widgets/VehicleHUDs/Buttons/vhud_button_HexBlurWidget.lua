CoD.vhud_button_HexBlurWidget = InheritFrom( LUI.UIElement )
CoD.vhud_button_HexBlurWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.vhud_button_HexBlurWidget )
	self.id = "vhud_button_HexBlurWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 73 )
	self:setTopBottom( true, false, 0, 73 )
	
	local BackBlur = LUI.UIImage.new()
	BackBlur:setLeftRight( true, false, 0, 73 )
	BackBlur:setTopBottom( true, false, 0, 73 )
	BackBlur:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_button_frameblurhex" ) )
	BackBlur:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	BackBlur:setShaderVector( 0, 30, 10, 0, 0 )
	self:addElement( BackBlur )
	self.BackBlur = BackBlur
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Active = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Active = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Active",
			condition = function ( menu, element, event )
				return not IsSelfModelValueEqualTo( element, controller, "text", "" )
			end
		}
	} )
	self:linkToElementModel( self, "text", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "text"
		} )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

