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
	self:setLeftRight( 0, 0, 0, 93 )
	self:setTopBottom( 0, 0, 0, 217 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local perkPlus = CoD.WeaponItemModelWidgetNew.new( menu, controller )
	perkPlus:mergeStateConditions( {
		{
			stateName = "LockedByWildcard",
			condition = function ( menu, element, event )
				local f2_local0
				if not IsCACSlotEquipped( menu, element, controller ) then
					f2_local0 = IsCACSlotWildcardLocked( menu, element, controller )
				else
					f2_local0 = false
				end
				return f2_local0
			end
		}
	} )
	perkPlus:setLeftRight( 0, 1, 0, 0 )
	perkPlus:setTopBottom( 0, 0, 125, 218 )
	perkPlus.plusIcon:setRGB( 1, 0.41, 0 )
	perkPlus:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			perkPlus.itemImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( perkPlus )
	self.perkPlus = perkPlus
	
	local perk = CoD.WeaponItemModelWidgetNew.new( menu, controller )
	perk:setLeftRight( 0.5, 0.5, -46.5, 46.5 )
	perk:setTopBottom( 0, 0, 24, 117 )
	perk.plusIcon:setRGB( 1, 0.41, 0 )
	perk:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			perk.itemImage:setImage( RegisterImage( modelValue ) )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.perkPlus:close()
		self.perk:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

