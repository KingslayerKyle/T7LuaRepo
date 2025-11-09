CoD.StartMenu_Options_Slider_Item_Arrow = InheritFrom( LUI.UIElement )
CoD.StartMenu_Options_Slider_Item_Arrow.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Options_Slider_Item_Arrow )
	self.id = "StartMenu_Options_Slider_Item_Arrow"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 56 )
	self:setTopBottom( true, false, 0, 56 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local arrow = LUI.UIImage.new()
	arrow:setLeftRight( true, true, 0, 0 )
	arrow:setTopBottom( true, true, 0, 0 )
	arrow:setRGB( 1, 1, 1 )
	arrow:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_arrow" ) )
	arrow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( arrow )
	self.arrow = arrow
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				arrow:completeAnimation()
				self.arrow:setAlpha( 0 )
				self.clipFinished( arrow, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

