-- f1cbad5f91035eb03f2fcf7739864321
-- This hash is used for caching, delete to decompile the file again

CoD.ItemTypeCost = InheritFrom( LUI.UIElement )
CoD.ItemTypeCost.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ItemTypeCost )
	self.id = "ItemTypeCost"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 78 )
	self:setTopBottom( true, false, 0, 36 )
	
	local bottomBg = LUI.UIImage.new()
	bottomBg:setLeftRight( true, true, 1, -1 )
	bottomBg:setTopBottom( false, true, -18, -1 )
	self:addElement( bottomBg )
	self.bottomBg = bottomBg
	
	local typeCountText = LUI.UIText.new()
	typeCountText:setLeftRight( true, true, 0, 0 )
	typeCountText:setTopBottom( false, false, 0, 18 )
	typeCountText:setRGB( 0, 0, 0 )
	typeCountText:setText( Engine.Localize( "5" ) )
	typeCountText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	typeCountText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	typeCountText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( typeCountText )
	self.typeCountText = typeCountText
	
	local costText = LUI.UIText.new()
	costText:setLeftRight( true, true, 0, 0 )
	costText:setTopBottom( false, false, -18, 0 )
	costText:setText( Engine.Localize( "MENU_COST" ) )
	costText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	costText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	costText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( costText )
	self.costText = costText
	
	local cachitBG0 = LUI.UIImage.new()
	cachitBG0:setLeftRight( true, true, 0, 0 )
	cachitBG0:setTopBottom( true, true, 0, 0 )
	cachitBG0:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrfull" ) )
	cachitBG0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	cachitBG0:setShaderVector( 0, 0.02, 0.08, 0, 0 )
	cachitBG0:setupNineSliceShader( 4, 4 )
	self:addElement( cachitBG0 )
	self.cachitBG0 = cachitBG0
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

