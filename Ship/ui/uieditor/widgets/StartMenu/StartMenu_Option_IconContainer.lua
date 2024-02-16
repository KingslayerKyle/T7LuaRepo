-- 4a443539295bcec5ee4beda907144f77
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 124 )
	self:setTopBottom( true, false, 0, 124 )
	self.anyChildUsesUpdateState = true
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( true, true, 0, 0 )
	StartMenuframenoBG0:setTopBottom( true, true, 0, 0 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( true, true, 11, -11 )
	Image:setTopBottom( true, true, 11, -11 )
	Image:setAlpha( 0.65 )
	Image:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_logowhite" ) )
	self:addElement( Image )
	self.Image = Image
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuframenoBG0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
