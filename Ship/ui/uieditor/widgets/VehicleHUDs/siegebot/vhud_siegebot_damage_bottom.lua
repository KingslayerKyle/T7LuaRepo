-- e2fe859f5bf86ba1cc3f15634b7b79ab
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.VehicleHUDs.siegebot.vhud_siegebot_directionalarrow" )

CoD.vhud_siegebot_damage_bottom = InheritFrom( LUI.UIElement )
CoD.vhud_siegebot_damage_bottom.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.vhud_siegebot_damage_bottom )
	self.id = "vhud_siegebot_damage_bottom"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 106 )
	self:setTopBottom( true, false, 0, 106 )
	self.anyChildUsesUpdateState = true
	
	local bottom = LUI.UIImage.new()
	bottom:setLeftRight( true, false, 0, 106 )
	bottom:setTopBottom( true, false, 0, 106 )
	bottom:setImage( RegisterImage( "uie_t7_mp_hud_vehicle_siegebot_circleouter" ) )
	bottom:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( bottom )
	self.bottom = bottom
	
	local vhudsiegebotdirectionalarrow = CoD.vhud_siegebot_directionalarrow.new( menu, controller )
	vhudsiegebotdirectionalarrow:setLeftRight( true, false, 0, 106 )
	vhudsiegebotdirectionalarrow:setTopBottom( true, false, 0, 106 )
	vhudsiegebotdirectionalarrow:setAlpha( 0.5 )
	self:addElement( vhudsiegebotdirectionalarrow )
	self.vhudsiegebotdirectionalarrow = vhudsiegebotdirectionalarrow
	
	local bottom0 = LUI.UIImage.new()
	bottom0:setLeftRight( true, false, 0, 106 )
	bottom0:setTopBottom( true, false, 0, 106 )
	bottom0:setAlpha( 0.75 )
	bottom0:setImage( RegisterImage( "uie_t7_mp_hud_vehicle_siegebot_iconbottom" ) )
	bottom0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( bottom0 )
	self.bottom0 = bottom0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				bottom:completeAnimation()
				self.bottom:setAlpha( 1 )
				self.clipFinished( bottom, {} )
			end,
			StartUp = function ()
				self:setupElementClipCounter( 0 )
			end,
			Zoom = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		EMP = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "EMP",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.vhudsiegebotdirectionalarrow:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
