require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )

CoD.StartMenu_Option_IconContainer = InheritFrom( LUI.UIElement )
CoD.StartMenu_Option_IconContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Option_IconContainer )
	self.id = "StartMenu_Option_IconContainer"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 186 )
	self:setTopBottom( 0, 0, 0, 186 )
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( 0, 1, 0, 0 )
	StartMenuframenoBG0:setTopBottom( 0, 1, 0, 0 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( 0, 1, 16, -16 )
	Image:setTopBottom( 0, 1, 16, -16 )
	Image:setAlpha( 0.65 )
	Image:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_logowhite" ) )
	self:addElement( Image )
	self.Image = Image
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.StartMenuframenoBG0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

