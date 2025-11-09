CoD.LeftBumperWidget = InheritFrom( LUI.UIElement )
CoD.LeftBumperWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LeftBumperWidget )
	self.id = "LeftBumperWidget"
	self.soundSet = "CAC_PrimaryWeapon"
	self:setLeftRight( true, false, 0, 32 )
	self:setTopBottom( true, false, 0, 32 )
	
	local bumper = LUI.UIImage.new()
	bumper:setLeftRight( true, false, 0, 32 )
	bumper:setTopBottom( true, false, 0, 32 )
	bumper:setRGB( 1, 1, 1 )
	bumper:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	bumper:subscribeToGlobalModel( controller, "Controller", "left_shoulder_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			bumper:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( bumper )
	self.bumper = bumper
	
	local bottomBar = LUI.UIImage.new()
	bottomBar:setLeftRight( true, true, 0, 0 )
	bottomBar:setTopBottom( false, true, -2, 0 )
	bottomBar:setRGB( 0.43, 0.43, 0.44 )
	bottomBar:setAlpha( 0 )
	bottomBar:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( bottomBar )
	self.bottomBar = bottomBar
	
	self.close = function ( self )
		self.bumper:close()
		CoD.LeftBumperWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

