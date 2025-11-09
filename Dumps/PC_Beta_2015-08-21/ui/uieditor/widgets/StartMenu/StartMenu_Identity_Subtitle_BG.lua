CoD.StartMenu_Identity_Subtitle_BG = InheritFrom( LUI.UIElement )
CoD.StartMenu_Identity_Subtitle_BG.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Identity_Subtitle_BG )
	self.id = "StartMenu_Identity_Subtitle_BG"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 235 )
	self:setTopBottom( true, false, 0, 24 )
	
	local Image56 = LUI.UIImage.new()
	Image56:setLeftRight( true, false, 0, 16 )
	Image56:setTopBottom( false, true, -4, 0 )
	Image56:setImage( RegisterImage( "uie_t7_menu_frontend_listheaderpanelll" ) )
	self:addElement( Image56 )
	self.Image56 = Image56
	
	local Image57 = LUI.UIImage.new()
	Image57:setLeftRight( true, true, 16, -16 )
	Image57:setTopBottom( false, true, -4, 0 )
	Image57:setImage( RegisterImage( "uie_t7_menu_frontend_listheaderpanellm" ) )
	self:addElement( Image57 )
	self.Image57 = Image57
	
	local Image58 = LUI.UIImage.new()
	Image58:setLeftRight( false, true, -16, 0 )
	Image58:setTopBottom( false, true, -4, 0 )
	Image58:setImage( RegisterImage( "uie_t7_menu_frontend_listheaderpanellr" ) )
	self:addElement( Image58 )
	self.Image58 = Image58
	
	local Image59 = LUI.UIImage.new()
	Image59:setLeftRight( true, false, 0, 16 )
	Image59:setTopBottom( true, true, 4, -4 )
	Image59:setImage( RegisterImage( "uie_t7_menu_frontend_listheaderpanelml" ) )
	self:addElement( Image59 )
	self.Image59 = Image59
	
	local Image60 = LUI.UIImage.new()
	Image60:setLeftRight( false, true, -16, 0 )
	Image60:setTopBottom( true, true, 4, -4 )
	Image60:setImage( RegisterImage( "uie_t7_menu_frontend_listheaderpanelmr" ) )
	self:addElement( Image60 )
	self.Image60 = Image60
	
	local Image61 = LUI.UIImage.new()
	Image61:setLeftRight( true, false, 0, 16 )
	Image61:setTopBottom( true, false, 0, 4 )
	Image61:setImage( RegisterImage( "uie_t7_menu_frontend_listheaderpanelul" ) )
	self:addElement( Image61 )
	self.Image61 = Image61
	
	local Image62 = LUI.UIImage.new()
	Image62:setLeftRight( true, true, 16, -16 )
	Image62:setTopBottom( true, false, 0, 4 )
	Image62:setImage( RegisterImage( "uie_t7_menu_frontend_listheaderpanelum" ) )
	self:addElement( Image62 )
	self.Image62 = Image62
	
	local Image63 = LUI.UIImage.new()
	Image63:setLeftRight( false, true, -16, 0 )
	Image63:setTopBottom( true, false, 0, 4 )
	Image63:setImage( RegisterImage( "uie_t7_menu_frontend_listheaderpanelur" ) )
	self:addElement( Image63 )
	self.Image63 = Image63
	
	local Image64 = LUI.UIImage.new()
	Image64:setLeftRight( true, true, 16, -16 )
	Image64:setTopBottom( true, true, 4, -4 )
	Image64:setImage( RegisterImage( "uie_t7_menu_frontend_listheaderpanelmm" ) )
	self:addElement( Image64 )
	self.Image64 = Image64
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

