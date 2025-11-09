require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.WeaponItemModelWidgetNew" )

CoD.CybercoreWidget = InheritFrom( LUI.UIElement )
CoD.CybercoreWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.CybercoreWidget )
	self.id = "CybercoreWidget"
	self.soundSet = "CAC"
	self:setLeftRight( true, false, 0, 129 )
	self:setTopBottom( true, false, 0, 145 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local header = LUI.UITightText.new()
	header:setLeftRight( true, false, 0, 65 )
	header:setTopBottom( true, false, -5, 14 )
	header:setRGB( 0.76, 0.76, 0.76 )
	header:setText( Engine.Localize( "MENU_CYBERCORE_CAPS" ) )
	header:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	header:setLetterSpacing( 0.5 )
	self:addElement( header )
	self.header = header
	
	local cybercoreImage = CoD.WeaponItemModelWidgetNew.new( menu, controller )
	cybercoreImage:setLeftRight( true, true, 0, 0 )
	cybercoreImage:setTopBottom( false, true, -129, 0 )
	cybercoreImage:setRGB( 1, 1, 1 )
	cybercoreImage.plusIcon:setRGB( 1, 0.41, 0 )
	cybercoreImage:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			cybercoreImage.itemImageSolid:setImage( RegisterImage( modelValue ) )
		end
	end )
	cybercoreImage:mergeStateConditions( {
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Available",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "NotEquippable",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		},
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:addElement( cybercoreImage )
	self.cybercoreImage = cybercoreImage
	
	local cybercoreTypeName = LUI.UIText.new()
	cybercoreTypeName:setLeftRight( true, true, 6.5, -6.5 )
	cybercoreTypeName:setTopBottom( true, false, 25, 41 )
	cybercoreTypeName:setRGB( 0.86, 0.89, 0.75 )
	cybercoreTypeName:setAlpha( 0 )
	cybercoreTypeName:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	cybercoreTypeName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	cybercoreTypeName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	cybercoreTypeName:linkToElementModel( self, "abilityType", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			cybercoreTypeName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( cybercoreTypeName )
	self.cybercoreTypeName = cybercoreTypeName
	
	cybercoreImage.id = "cybercoreImage"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.cybercoreImage:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.cybercoreImage:close()
		self.cybercoreTypeName:close()
		CoD.CybercoreWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

