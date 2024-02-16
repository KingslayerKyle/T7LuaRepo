require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.WeaponItemModelWidgetNew" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.NewNumberBreadcrumb" )

CoD.PerksWidget = InheritFrom( LUI.UIElement )
CoD.PerksWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PerksWidget )
	self.id = "PerksWidget"
	self.soundSet = "CAC"
	self:setLeftRight( true, false, 0, 62 )
	self:setTopBottom( true, false, 0, 145 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local header = LUI.UITightText.new()
	header:setLeftRight( true, false, 0, 48 )
	header:setTopBottom( true, false, -5, 14 )
	header:setRGB( 0.76, 0.76, 0.76 )
	header:setText( Engine.Localize( "MPUI_PRIMARY_CAPS" ) )
	header:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	header:setLetterSpacing( 0.5 )
	self:addElement( header )
	self.header = header
	
	local perkPlus = CoD.WeaponItemModelWidgetNew.new( menu, controller )
	perkPlus:setLeftRight( true, true, 0, 0 )
	perkPlus:setTopBottom( true, false, 83, 145 )
	perkPlus.plusIcon:setRGB( 1, 0.41, 0 )
	perkPlus:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			perkPlus.itemImageSolid:setImage( RegisterImage( modelValue ) )
		end
	end )
	perkPlus:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			perkPlus.itemImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	perkPlus:mergeStateConditions( {
		{
			stateName = "LockedByWildcard",
			condition = function ( menu, element, event )
				local f4_local0
				if not IsCACSlotEquipped( menu, element, controller ) then
					f4_local0 = IsCACSlotWildcardLocked( menu, element, controller )
				else
					f4_local0 = false
				end
				return f4_local0
			end
		}
	} )
	self:addElement( perkPlus )
	self.perkPlus = perkPlus
	
	local perk = CoD.WeaponItemModelWidgetNew.new( menu, controller )
	perk:setLeftRight( false, false, -31, 31 )
	perk:setTopBottom( true, false, 16, 78 )
	perk.plusIcon:setRGB( 1, 0.41, 0 )
	perk:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			perk.itemImageSolid:setImage( RegisterImage( modelValue ) )
		end
	end )
	perk:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			perk.itemImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( perk )
	self.perk = perk
	
	local perk1NewNumber = CoD.NewNumberBreadcrumb.new( menu, controller )
	perk1NewNumber:setLeftRight( false, true, -19, -3 )
	perk1NewNumber:setTopBottom( true, false, 19, 35 )
	self:addElement( perk1NewNumber )
	self.perk1NewNumber = perk1NewNumber
	
	perkPlus.navigation = {
		up = perk
	}
	perk.navigation = {
		down = perkPlus
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	perkPlus.id = "perkPlus"
	perk.id = "perk"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.perkPlus:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.perkPlus:close()
		self.perk:close()
		self.perk1NewNumber:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

