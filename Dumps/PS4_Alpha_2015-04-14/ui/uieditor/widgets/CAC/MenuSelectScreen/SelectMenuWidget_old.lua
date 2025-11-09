require( "ui.uieditor.widgets.BackgroundFrames.CACBackground_old" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.SelectionInfoWidget_old" )

CoD.SelectMenuWidget_old = InheritFrom( LUI.UIElement )
CoD.SelectMenuWidget_old.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SelectMenuWidget_old )
	self.id = "SelectMenuWidget_old"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local background = CoD.CACBackground_old.new( menu, controller )
	background:setLeftRight( true, false, 0, 1280 )
	background:setTopBottom( true, false, 0, 720 )
	background:setRGB( 1, 1, 1 )
	background.titleLabel:setText( Engine.Localize( "MENU_NEW" ) )
	background:subscribeToGlobalModel( controller, "CustomClassMenu", nil, function ( model )
		background:setModel( model, controller )
	end )
	self:addElement( background )
	self.background = background
	
	local selectionInfoWidget = CoD.SelectionInfoWidget_old.new( menu, controller )
	selectionInfoWidget:setLeftRight( false, true, -813, -96 )
	selectionInfoWidget:setTopBottom( true, false, 151, 661 )
	selectionInfoWidget:setRGB( 1, 1, 1 )
	selectionInfoWidget:linkToElementModel( self, nil, false, function ( model )
		selectionInfoWidget:setModel( model, controller )
	end )
	selectionInfoWidget:linkToElementModel( self, "description", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			selectionInfoWidget.weaponDescTextBox:setText( Engine.Localize( modelValue ) )
		end
	end )
	selectionInfoWidget:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			selectionInfoWidget.WeaponNameWidget0.weaponNameLabel:setText( Engine.Localize( LocalizeToUpperString( modelValue ) ) )
		end
	end )
	selectionInfoWidget:mergeStateConditions( {
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsCACItemLocked( menu, element, controller )
			end
		}
	} )
	self:addElement( selectionInfoWidget )
	self.selectionInfoWidget = selectionInfoWidget
	
	local listBg = LUI.UIImage.new()
	listBg:setLeftRight( true, false, 104.5, 439 )
	listBg:setTopBottom( true, false, 150, 598 )
	listBg:setRGB( 1, 1, 1 )
	listBg:setAlpha( 0 )
	listBg:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( listBg )
	self.listBg = listBg
	
	self.close = function ( self )
		self.background:close()
		self.selectionInfoWidget:close()
		CoD.SelectMenuWidget_old.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

