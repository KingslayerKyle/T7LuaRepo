require( "ui.uieditor.widgets.CAC.CurrentSelectionInfo" )
require( "ui.uieditor.widgets.CAC.ClassAllocation" )
require( "ui.uieditor.widgets.CAC.SpecWidget" )
require( "ui.uieditor.widgets.CAC.SelectionPreviewImage" )

CoD.SelectionMenuWidget = InheritFrom( LUI.UIElement )
CoD.SelectionMenuWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SelectionMenuWidget )
	self.id = "SelectionMenuWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local bgImage = LUI.UIImage.new()
	bgImage:setLeftRight( true, true, 0, 0 )
	bgImage:setTopBottom( true, true, 0, 0 )
	bgImage:setRGB( 0.83, 0.83, 0.83 )
	bgImage:setImage( RegisterImage( "uie_t7_menu_mp_cac_backdrop" ) )
	bgImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( bgImage )
	self.bgImage = bgImage
	
	local weaponBgImage = LUI.UIImage.new()
	weaponBgImage:setLeftRight( true, true, 0, 0 )
	weaponBgImage:setTopBottom( true, false, 91, 445 )
	weaponBgImage:setRGB( 0.91, 0.91, 0.92 )
	weaponBgImage:setAlpha( 0.09 )
	weaponBgImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( weaponBgImage )
	self.weaponBgImage = weaponBgImage
	
	local currentSelectionInfo = CoD.CurrentSelectionInfo.new( menu, controller )
	currentSelectionInfo:setLeftRight( true, false, 70, 470 )
	currentSelectionInfo:setTopBottom( true, false, 54, 232 )
	currentSelectionInfo:setRGB( 1, 1, 1 )
	currentSelectionInfo.categoryLabel:setText( Engine.Localize( "MPUI_ATTACHMENTS_CAPS" ) )
	currentSelectionInfo.weaponNameLabel:setText( Engine.Localize( "WEAPON_PDW57" ) )
	currentSelectionInfo.weaponDescTextBox:setText( Engine.Localize( "WEAPON_PDW57_DESC" ) )
	self:addElement( currentSelectionInfo )
	self.currentSelectionInfo = currentSelectionInfo
	
	local classAllocation = CoD.ClassAllocation.new( menu, controller )
	classAllocation:setLeftRight( true, false, 749, 1184 )
	classAllocation:setTopBottom( true, false, 43, 78 )
	classAllocation:setRGB( 1, 1, 1 )
	self:addElement( classAllocation )
	self.classAllocation = classAllocation
	
	local specWidget = CoD.SpecWidget.new( menu, controller )
	specWidget:setLeftRight( true, false, 1091, 1233 )
	specWidget:setTopBottom( true, false, 43, 78 )
	specWidget:setRGB( 1, 1, 1 )
	specWidget:setAlpha( 0 )
	self:addElement( specWidget )
	self.specWidget = specWidget
	
	local previewImage = CoD.SelectionPreviewImage.new( menu, controller )
	previewImage:setLeftRight( false, false, -354, 354 )
	previewImage:setTopBottom( true, false, 91, 445 )
	previewImage:setRGB( 1, 1, 1 )
	previewImage:setAlpha( 0 )
	previewImage:mergeStateConditions( {
		{
			stateName = "Square",
			condition = function ( menu, element, event )
				return IsMenuPreviewImageSquare( menu )
			end
		}
	} )
	self:addElement( previewImage )
	self.previewImage = previewImage
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				previewImage:completeAnimation()
				self.previewImage:setAlpha( 1 )
				self.clipFinished( previewImage, {} )
			end
		}
	}
	self.close = function ( self )
		self.currentSelectionInfo:close()
		self.classAllocation:close()
		self.specWidget:close()
		self.previewImage:close()
		CoD.SelectionMenuWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

