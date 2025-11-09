require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_Slider_Small" )

CoD.StartMenu_MusicTracks_FilterFlyout = InheritFrom( LUI.UIElement )
CoD.StartMenu_MusicTracks_FilterFlyout.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_MusicTracks_FilterFlyout )
	self.id = "StartMenu_MusicTracks_FilterFlyout"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 530 )
	self:setTopBottom( true, false, 0, 720 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local leftBackground = LUI.UIImage.new()
	leftBackground:setLeftRight( true, true, 25.5, 0.5 )
	leftBackground:setTopBottom( true, true, 0, 0 )
	leftBackground:setRGB( 0.04, 0.04, 0.04 )
	leftBackground:setAlpha( 0.98 )
	self:addElement( leftBackground )
	self.leftBackground = leftBackground
	
	local tileTexture = LUI.UIImage.new()
	tileTexture:setLeftRight( true, true, 25.5, 0.5 )
	tileTexture:setTopBottom( true, true, 0, 0 )
	tileTexture:setAlpha( 0.5 )
	tileTexture:setImage( RegisterImage( "uie_t7_tile_texture" ) )
	tileTexture:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	tileTexture:setShaderVector( 0, 30, 55, 0, 0 )
	tileTexture:setShaderVector( 1, 0, 0, 0, 0 )
	self:addElement( tileTexture )
	self.tileTexture = tileTexture
	
	local Border00 = LUI.UIImage.new()
	Border00:setLeftRight( true, false, 24.5, 25.5 )
	Border00:setTopBottom( true, true, 0, 0 )
	Border00:setAlpha( 0.42 )
	self:addElement( Border00 )
	self.Border00 = Border00
	
	local Border0 = LUI.UIImage.new()
	Border0:setLeftRight( true, false, 24.5, 25.5 )
	Border0:setTopBottom( true, true, 0, 0 )
	Border0:setAlpha( 0.42 )
	self:addElement( Border0 )
	self.Border0 = Border0
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( true, false, 54.5, 341.5 )
	Title:setTopBottom( true, false, 96, 122 )
	Title:setRGB( 1, 0.39, 0 )
	Title:setText( Engine.Localize( "MENU_OPTIONS" ) )
	Title:setTTF( "fonts/escom.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Title )
	self.Title = Title
	
	local optionsList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	optionsList:makeFocusable()
	optionsList:setLeftRight( true, false, 42.5, 430.5 )
	optionsList:setTopBottom( true, false, 137, 591 )
	optionsList:setWidgetType( CoD.StartMenu_Options_Slider_Small )
	optionsList:setVerticalCount( 8 )
	optionsList:setDataSource( "MusicTracksOptions" )
	self:addElement( optionsList )
	self.optionsList = optionsList
	
	optionsList.id = "optionsList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.optionsList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.optionsList:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

