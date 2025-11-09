require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.WeaponItemModelWidgetNew" )

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
	
	local perkPlus = CoD.WeaponItemModelWidgetNew.new( menu, controller )
	perkPlus:setLeftRight( true, true, 0, 0 )
	perkPlus:setTopBottom( true, false, 83, 145 )
	perkPlus.plusIcon:setRGB( 1, 0.41, 0 )
	perkPlus:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			perkPlus.itemImage:setImage( RegisterImage( image ) )
		end
	end )
	perkPlus:mergeStateConditions( {
		{
			stateName = "LockedByWildcard",
			condition = function ( menu, element, event )
				local f3_local0
				if not IsCACSlotEquipped( menu, element, controller ) then
					f3_local0 = IsCACSlotWildcardLocked( menu, element, controller )
				else
					f3_local0 = false
				end
				return f3_local0
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
		local image = Engine.GetModelValue( model )
		if image then
			perk.itemImage:setImage( RegisterImage( image ) )
		end
	end )
	self:addElement( perk )
	self.perk = perk
	
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.perkPlus:close()
		element.perk:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

