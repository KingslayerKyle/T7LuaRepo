-- ea8c8acd3579e86be8476fd7d662662d
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.WeaponItemModelWidgetNew_InGame" )

CoD.PerksWidget_InGame = InheritFrom( LUI.UIElement )
CoD.PerksWidget_InGame.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.PerksWidget_InGame )
	self.id = "PerksWidget_InGame"
	self.soundSet = "CAC"
	self:setLeftRight( true, false, 0, 62 )
	self:setTopBottom( true, false, 0, 145 )
	self.anyChildUsesUpdateState = true
	
	local header = LUI.UITightText.new()
	header:setLeftRight( true, false, 0, 51 )
	header:setTopBottom( true, false, -5, 14 )
	header:setRGB( 0.57, 0.6, 0.65 )
	header:setText( Engine.Localize( "MPUI_PRIMARY_CAPS" ) )
	header:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	header:setLetterSpacing( 0.5 )
	self:addElement( header )
	self.header = header
	
	local perkPlus = CoD.WeaponItemModelWidgetNew_InGame.new( menu, controller )
	perkPlus:setLeftRight( false, false, -31, 31 )
	perkPlus:setTopBottom( false, true, -62, 0 )
	perkPlus:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			perkPlus.itemImage:setImage( RegisterImage( image ) )
		end
	end )
	self:addElement( perkPlus )
	self.perkPlus = perkPlus
	
	local perk = CoD.WeaponItemModelWidgetNew_InGame.new( menu, controller )
	perk:setLeftRight( false, false, -31, 31 )
	perk:setTopBottom( true, false, 16, 78 )
	perk:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			perk.itemImage:setImage( RegisterImage( image ) )
		end
	end )
	self:addElement( perk )
	self.perk = perk
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.perkPlus:close()
		element.perk:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
