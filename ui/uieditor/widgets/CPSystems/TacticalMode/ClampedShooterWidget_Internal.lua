-- 7e70abc15a92b7b60930062074fd7002
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CPSystems.TacticalMode.ClampedShooterWidgetArrow" )

CoD.ClampedShooterWidget_Internal = InheritFrom( LUI.UIElement )
CoD.ClampedShooterWidget_Internal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ClampedShooterWidget_Internal )
	self.id = "ClampedShooterWidget_Internal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 64 )
	self:setTopBottom( true, false, 0, 64 )
	
	local archetypeImage = LUI.UIImage.new()
	archetypeImage:setLeftRight( true, true, 0, 0 )
	archetypeImage:setTopBottom( true, true, 0, 0 )
	archetypeImage:setRGB( 0.76, 0.79, 0.87 )
	archetypeImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	archetypeImage:linkToElementModel( self, "archetypeImage", true, function ( model )
		local _archetypeImage = Engine.GetModelValue( model )
		if _archetypeImage then
			archetypeImage:setImage( RegisterImage( _archetypeImage ) )
		end
	end )
	self:addElement( archetypeImage )
	self.archetypeImage = archetypeImage
	
	local arrow = CoD.ClampedShooterWidgetArrow.new( menu, controller )
	arrow:setLeftRight( false, false, -43, 43 )
	arrow:setTopBottom( false, false, -14, 14 )
	arrow:linkToElementModel( self, "arrowRotation", true, function ( model )
		local arrowRotation = Engine.GetModelValue( model )
		if arrowRotation then
			arrow:setZRot( arrowRotation )
		end
	end )
	self:addElement( arrow )
	self.arrow = arrow
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.arrow:close()
		element.archetypeImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

