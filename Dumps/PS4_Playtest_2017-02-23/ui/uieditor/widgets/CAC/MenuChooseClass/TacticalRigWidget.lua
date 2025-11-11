require( "ui.uieditor.widgets.CAC.MenuChooseClass.CategoryHeader" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.WeaponItemModelWidgetNew" )

CoD.TacticalRigWidget = InheritFrom( LUI.UIElement )
CoD.TacticalRigWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.TacticalRigWidget )
	self.id = "TacticalRigWidget"
	self.soundSet = "CAC"
	self:setLeftRight( 0, 0, 0, 93 )
	self:setTopBottom( 0, 0, 0, 217 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local TacRig2 = CoD.WeaponItemModelWidgetNew.new( menu, controller )
	TacRig2:setLeftRight( 0, 1, 0, 0 )
	TacRig2:setTopBottom( 0, 0, 125, 218 )
	TacRig2.plusIcon:setRGB( 1, 0.41, 0 )
	TacRig2:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TacRig2.itemImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( TacRig2 )
	self.TacRig2 = TacRig2
	
	local TacRig1 = CoD.WeaponItemModelWidgetNew.new( menu, controller )
	TacRig1:setLeftRight( 0, 1, 0, 0 )
	TacRig1:setTopBottom( 0, 0, 24, 117 )
	TacRig1.plusIcon:setRGB( 1, 0.41, 0 )
	TacRig1:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TacRig1.itemImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( TacRig1 )
	self.TacRig1 = TacRig1
	
	local rig1Name = LUI.UIText.new()
	rig1Name:setLeftRight( 0, 0, 5, 215 )
	rig1Name:setTopBottom( 0, 0, 38, 62 )
	rig1Name:setRGB( 0.86, 0.89, 0.75 )
	rig1Name:setAlpha( 0 )
	rig1Name:setText( Engine.Localize( "" ) )
	rig1Name:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	rig1Name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	rig1Name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( rig1Name )
	self.rig1Name = rig1Name
	
	local rig1Upgraded = LUI.UIText.new()
	rig1Upgraded:setLeftRight( 0, 0, 5, 215 )
	rig1Upgraded:setTopBottom( 0, 0, 82, 106 )
	rig1Upgraded:setRGB( 0.75, 0.37, 0.29 )
	rig1Upgraded:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	rig1Upgraded:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	rig1Upgraded:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	rig1Upgraded:linkToElementModel( self, "rig1_upgraded", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rig1Upgraded:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( rig1Upgraded )
	self.rig1Upgraded = rig1Upgraded
	
	local rig2Name = LUI.UIText.new()
	rig2Name:setLeftRight( 0, 0, 5, 215 )
	rig2Name:setTopBottom( 0, 0, 142, 166 )
	rig2Name:setRGB( 0.86, 0.89, 0.75 )
	rig2Name:setAlpha( 0 )
	rig2Name:setText( Engine.Localize( "" ) )
	rig2Name:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	rig2Name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	rig2Name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( rig2Name )
	self.rig2Name = rig2Name
	
	local rig2Upgraded = LUI.UIText.new()
	rig2Upgraded:setLeftRight( 0, 0, 5, 215 )
	rig2Upgraded:setTopBottom( 0, 0, 186, 210 )
	rig2Upgraded:setRGB( 0.75, 0.37, 0.29 )
	rig2Upgraded:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	rig2Upgraded:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	rig2Upgraded:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	rig2Upgraded:linkToElementModel( self, "rig2_upgraded", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rig2Upgraded:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( rig2Upgraded )
	self.rig2Upgraded = rig2Upgraded
	
	local CategoryHeader = CoD.CategoryHeader.new( menu, controller )
	CategoryHeader:mergeStateConditions( {
		{
			stateName = "BreadcrumbVisible",
			condition = function ( menu, element, event )
				return IsCACSpecificLoadoutSlotNew( element, controller, "cybercom_tacrig1" )
			end
		}
	} )
	CategoryHeader:setLeftRight( 0, 0, 0, 98 )
	CategoryHeader:setTopBottom( 0, 0, -7, 23 )
	CategoryHeader.header:setText( Engine.Localize( "MENU_TAC_RIG_CAPS" ) )
	self:addElement( CategoryHeader )
	self.CategoryHeader = CategoryHeader
	
	TacRig2.navigation = {
		up = TacRig1
	}
	TacRig1.navigation = {
		down = TacRig2
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	TacRig2.id = "TacRig2"
	TacRig1.id = "TacRig1"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.TacRig1:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.TacRig2:close()
		self.TacRig1:close()
		self.CategoryHeader:close()
		self.rig1Upgraded:close()
		self.rig2Upgraded:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

