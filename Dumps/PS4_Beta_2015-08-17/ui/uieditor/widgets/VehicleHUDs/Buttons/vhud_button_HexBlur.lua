require( "ui.uieditor.widgets.VehicleHUDs.Buttons.vhud_button_HexBlurWidget" )

CoD.vhud_button_HexBlur = InheritFrom( LUI.UIElement )
CoD.vhud_button_HexBlur.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.vhud_button_HexBlur )
	self.id = "vhud_button_HexBlur"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 73 )
	self:setTopBottom( true, false, 0, 73 )
	self.anyChildUsesUpdateState = true
	
	local vhudbuttonHexBlurWidget = CoD.vhud_button_HexBlurWidget.new( menu, controller )
	vhudbuttonHexBlurWidget:setLeftRight( true, false, 0, 73 )
	vhudbuttonHexBlurWidget:setTopBottom( true, false, 0, 73 )
	vhudbuttonHexBlurWidget:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2" ) )
	vhudbuttonHexBlurWidget:setShaderVector( 0, 10, 10, 0, 0 )
	self:addElement( vhudbuttonHexBlurWidget )
	self.vhudbuttonHexBlurWidget = vhudbuttonHexBlurWidget
	
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.vhudbuttonHexBlurWidget:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

