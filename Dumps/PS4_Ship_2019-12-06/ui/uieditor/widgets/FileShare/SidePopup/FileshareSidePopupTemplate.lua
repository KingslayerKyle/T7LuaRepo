require( "ui.uieditor.widgets.FileShare.SidePopup.FileshareSidePopupLayout" )

local PreLoadFunc = function ( self, controller )
	self.animateInFromOffset = 380
end

CoD.FileshareSidePopupTemplate = InheritFrom( LUI.UIElement )
CoD.FileshareSidePopupTemplate.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FileshareSidePopupTemplate )
	self.id = "FileshareSidePopupTemplate"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 380 )
	self:setTopBottom( true, false, 0, 720 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local leftBackground = LUI.UIImage.new()
	leftBackground:setLeftRight( false, true, -354.5, 0.5 )
	leftBackground:setTopBottom( true, true, 0, 0 )
	leftBackground:setRGB( 0.04, 0.04, 0.04 )
	leftBackground:setAlpha( 0.98 )
	self:addElement( leftBackground )
	self.leftBackground = leftBackground
	
	local tileTexture = LUI.UIImage.new()
	tileTexture:setLeftRight( false, true, -354.5, 0.5 )
	tileTexture:setTopBottom( true, true, 0, 0 )
	tileTexture:setAlpha( 0.5 )
	tileTexture:setImage( RegisterImage( "uie_t7_tile_texture" ) )
	tileTexture:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	tileTexture:setShaderVector( 0, 30, 55, 0, 0 )
	tileTexture:setShaderVector( 1, 0, 0, 0, 0 )
	self:addElement( tileTexture )
	self.tileTexture = tileTexture
	
	local Border00 = LUI.UIImage.new()
	Border00:setLeftRight( false, true, -355.5, -354.5 )
	Border00:setTopBottom( true, false, 0, 720 )
	Border00:setAlpha( 0.42 )
	self:addElement( Border00 )
	self.Border00 = Border00
	
	local Border0 = LUI.UIImage.new()
	Border0:setLeftRight( false, true, -355.5, -354.5 )
	Border0:setTopBottom( true, false, 0, 720 )
	Border0:setAlpha( 0.42 )
	self:addElement( Border0 )
	self.Border0 = Border0
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( true, false, 54.5, 341.5 )
	Title:setTopBottom( true, false, 96, 122 )
	Title:setRGB( 1, 0.39, 0 )
	Title:setText( Engine.Localize( "MENU_ARE_YOU_SURE" ) )
	Title:setTTF( "fonts/escom.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Title )
	self.Title = Title
	
	local layout = CoD.FileshareSidePopupLayout.new( menu, controller )
	layout:setLeftRight( true, false, 51, 329 )
	layout:setTopBottom( true, false, 133, 677 )
	layout.hintText.ItemHintText:setText( Engine.Localize( "MENU_NEW" ) )
	self:addElement( layout )
	self.layout = layout
	
	layout.id = "layout"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.layout:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.layout:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

