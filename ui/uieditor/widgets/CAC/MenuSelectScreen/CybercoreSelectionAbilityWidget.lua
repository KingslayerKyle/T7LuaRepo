-- 87c66c403b3a3ecafc8c1e9286fa38f1
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.AbilityWheel.AbilityWheel_IconHex" )

CoD.CybercoreSelectionAbilityWidget = InheritFrom( LUI.UIElement )
CoD.CybercoreSelectionAbilityWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CybercoreSelectionAbilityWidget )
	self.id = "CybercoreSelectionAbilityWidget"
	self.soundSet = "CAC"
	self:setLeftRight( true, false, 0, 82 )
	self:setTopBottom( true, false, 0, 95 )
	self.anyChildUsesUpdateState = true
	
	local AbilityWheelIconHex0 = CoD.AbilityWheel_IconHex.new( menu, controller )
	AbilityWheelIconHex0:setLeftRight( true, true, 0, 0 )
	AbilityWheelIconHex0:setTopBottom( true, true, 0, 0 )
	AbilityWheelIconHex0:setAlpha( 0 )
	self:addElement( AbilityWheelIconHex0 )
	self.AbilityWheelIconHex0 = AbilityWheelIconHex0
	
	local abilityIcon = LUI.UIImage.new()
	abilityIcon:setLeftRight( false, false, -41, 41 )
	abilityIcon:setTopBottom( false, false, -41, 41 )
	abilityIcon:setAlpha( 0 )
	abilityIcon:setupUIStreamedImage( 0 )
	abilityIcon:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			abilityIcon:setImage( RegisterImage( image ) )
		end
	end )
	self:addElement( abilityIcon )
	self.abilityIcon = abilityIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				abilityIcon:completeAnimation()
				self.abilityIcon:setAlpha( 0 )
				self.clipFinished( abilityIcon, {} )
			end
		},
		Active = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				abilityIcon:completeAnimation()
				self.abilityIcon:setAlpha( 1 )
				self.clipFinished( abilityIcon, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Active",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "enabled" )
			end
		}
	} )
	self:linkToElementModel( self, "enabled", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "enabled"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.AbilityWheelIconHex0:close()
		element.abilityIcon:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

