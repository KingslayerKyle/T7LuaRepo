-- 602a10ea3889a3bd0a999c79dfeb1f95
-- This hash is used for caching, delete to decompile the file again

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
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
	self:setLeftRight( true, false, 0, 56 )
	self:setTopBottom( true, false, 0, 56 )
	
	local arrow = LUI.UIImage.new()
	arrow:setLeftRight( true, true, 0, 0 )
	arrow:setTopBottom( true, true, 0, 0 )
	arrow:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_arrow" ) )
	arrow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( arrow )
	self.arrow = arrow
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				arrow:completeAnimation()
				self.arrow:setRGB( 1, 1, 1 )
				self.arrow:setAlpha( 1 )
				self.clipFinished( arrow, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 1 )

				arrow:completeAnimation()
				self.arrow:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
				self.arrow:setAlpha( 1 )
				self.clipFinished( arrow, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				arrow:completeAnimation()
				self.arrow:setRGB( 1, 1, 1 )
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

