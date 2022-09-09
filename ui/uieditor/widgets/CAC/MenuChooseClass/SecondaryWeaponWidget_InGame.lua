-- f628f7d43eecbeabda973ba649643e25
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.WeaponItemModelWidgetNew_InGame" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.ItemWeaponLevel" )
require( "ui.uieditor.widgets.CAC.cac_ListButtonLabelMedium" )

CoD.SecondaryWeaponWidget_InGame = InheritFrom( LUI.UIElement )
CoD.SecondaryWeaponWidget_InGame.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.SecondaryWeaponWidget_InGame )
	self.id = "SecondaryWeaponWidget_InGame"
	self.soundSet = "CAC"
	self:setLeftRight( true, false, 0, 129 )
	self:setTopBottom( true, false, 0, 145 )
	self.anyChildUsesUpdateState = true
	
	local WeaponItemModel = CoD.WeaponItemModelWidgetNew_InGame.new( menu, controller )
	WeaponItemModel:setLeftRight( true, true, 0, 0 )
	WeaponItemModel:setTopBottom( false, true, -129, 0 )
	WeaponItemModel:linkToElementModel( self, nil, false, function ( model )
		WeaponItemModel:setModel( model, controller )
	end )
	WeaponItemModel:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			WeaponItemModel.itemImage:setImage( RegisterImage( image ) )
		end
	end )
	WeaponItemModel:mergeStateConditions( {
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				return IsCACSlotEquipped( menu, element, controller ) and AlwaysFalse()
			end
		},
		{
			stateName = "WeaponEquipped",
			condition = function ( menu, element, event )
				return IsCACSlotEquipped( menu, element, controller )
			end
		}
	} )
	self:addElement( WeaponItemModel )
	self.WeaponItemModel = WeaponItemModel
	
	local weaponLevel = CoD.ItemWeaponLevel.new( menu, controller )
	weaponLevel:setLeftRight( true, false, 94, 126 )
	weaponLevel:setTopBottom( false, true, -130, -97 )
	weaponLevel:linkToElementModel( self, nil, false, function ( model )
		weaponLevel:setModel( model, controller )
	end )
	self:addElement( weaponLevel )
	self.weaponLevel = weaponLevel
	
	local header = LUI.UITightText.new()
	header:setLeftRight( true, false, 0, 68 )
	header:setTopBottom( true, false, -4, 14 )
	header:setRGB( 0.57, 0.6, 0.65 )
	header:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	header:setLetterSpacing( 0.5 )
	header:linkToElementModel( self, "headerName", true, function ( model )
		local headerName = Engine.GetModelValue( model )
		if headerName then
			header:setText( Engine.Localize( headerName ) )
		end
	end )
	self:addElement( header )
	self.header = header
	
	local cacListButtonLabelMedium = CoD.cac_ListButtonLabelMedium.new( menu, controller )
	cacListButtonLabelMedium:setLeftRight( true, false, 2, 127 )
	cacListButtonLabelMedium:setTopBottom( true, false, 119.5, 143.5 )
	cacListButtonLabelMedium:setAlpha( 0.6 )
	cacListButtonLabelMedium.itemName:setRGB( 1, 1, 1 )
	cacListButtonLabelMedium:linkToElementModel( self, nil, false, function ( model )
		cacListButtonLabelMedium:setModel( model, controller )
	end )
	cacListButtonLabelMedium:linkToElementModel( self, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			cacListButtonLabelMedium.itemName:setText( Engine.Localize( name ) )
		end
	end )
	self:addElement( cacListButtonLabelMedium )
	self.cacListButtonLabelMedium = cacListButtonLabelMedium
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.WeaponItemModel:close()
		element.weaponLevel:close()
		element.cacListButtonLabelMedium:close()
		element.header:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
