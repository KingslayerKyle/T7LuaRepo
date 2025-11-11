local PostLoadFunc = function ( self, controller, menu )
	if CursorInputEnabledForBuild() then
		self:setHandleMouse( true )
		self.m_preventFromBeingActive = true
	end
end

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
	self:setLeftRight( 0, 0, 0, 84 )
	self:setTopBottom( 0, 0, 0, 84 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local arrow = LUI.UIImage.new()
	arrow:setLeftRight( 0, 1, 0, 0 )
	arrow:setTopBottom( 0, 1, 0, 0 )
	arrow:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_arrow" ) )
	arrow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( arrow )
	self.arrow = arrow
	
	self.resetProperties = function ()
		arrow:completeAnimation()
		arrow:setRGB( 1, 1, 1 )
		arrow:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				arrow:completeAnimation()
				self.arrow:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
				self.clipFinished( arrow, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self.resetProperties()
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

