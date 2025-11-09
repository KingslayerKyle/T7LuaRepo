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
	
	local header = LUI.UITightText.new()
	header:setLeftRight( true, false, 0, 51 )
	header:setTopBottom( true, false, -5, 14 )
	header:setRGB( 0.76, 0.76, 0.76 )
	header:setText( Engine.Localize( "MPUI_PRIMARY_CAPS" ) )
	header:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	header:setLetterSpacing( 0.5 )
	self:addElement( header )
	self.header = header
	
	local perkPlus = CoD.WeaponItemModelWidgetNew.new( menu, controller )
	perkPlus:setLeftRight( false, false, -31, 31 )
	perkPlus:setTopBottom( false, true, -62, 0 )
	perkPlus:setRGB( 1, 1, 1 )
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
	self:addElement( perkPlus )
	self.perkPlus = perkPlus
	
	local perk = CoD.WeaponItemModelWidgetNew.new( menu, controller )
	perk:setLeftRight( false, false, -31, 31 )
	perk:setTopBottom( true, false, 16, 78 )
	perk:setRGB( 1, 1, 1 )
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
	
	perkPlus.navigation = {
		up = perk
	}
	perk.navigation = {
		down = perkPlus
	}
	perkPlus.id = "perkPlus"
	perk.id = "perk"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.perkPlus:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.perkPlus:close()
		self.perk:close()
		CoD.PerksWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

