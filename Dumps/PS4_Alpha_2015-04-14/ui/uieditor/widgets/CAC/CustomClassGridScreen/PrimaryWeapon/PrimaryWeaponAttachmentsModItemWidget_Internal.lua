require( "ui.uieditor.widgets.CAC.CustomClassGridScreen.PrimaryWeapon.PrimaryWeaponModItemWidget" )
require( "ui.uieditor.widgets.Border" )

CoD.PrimaryWeaponAttachmentsModItemWidget_Internal = InheritFrom( LUI.UIElement )
CoD.PrimaryWeaponAttachmentsModItemWidget_Internal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PrimaryWeaponAttachmentsModItemWidget_Internal )
	self.id = "PrimaryWeaponAttachmentsModItemWidget_Internal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 447 )
	self:setTopBottom( true, false, 0, 85 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local attachmentsLabel = LUI.UITightText.new()
	attachmentsLabel:setLeftRight( true, false, 0, 112 )
	attachmentsLabel:setTopBottom( true, false, 4, 24 )
	attachmentsLabel:setRGB( 0.4, 0.44, 0.52 )
	attachmentsLabel:setText( Engine.Localize( "MPUI_ATTACHMENTS_CAPS" ) )
	attachmentsLabel:setTTF( "fonts/default.ttf" )
	self:addElement( attachmentsLabel )
	self.attachmentsLabel = attachmentsLabel
	
	local PrimaryWeaponModItemWidgetInternal0 = CoD.PrimaryWeaponModItemWidget.new( menu, controller )
	PrimaryWeaponModItemWidgetInternal0:setLeftRight( true, false, 0, 87 )
	PrimaryWeaponModItemWidgetInternal0:setTopBottom( true, false, 25, 85 )
	PrimaryWeaponModItemWidgetInternal0:setRGB( 1, 1, 1 )
	self:addElement( PrimaryWeaponModItemWidgetInternal0 )
	self.PrimaryWeaponModItemWidgetInternal0 = PrimaryWeaponModItemWidgetInternal0
	
	local PrimaryWeaponModItemWidgetInternal1 = CoD.PrimaryWeaponModItemWidget.new( menu, controller )
	PrimaryWeaponModItemWidgetInternal1:setLeftRight( true, false, 90, 177 )
	PrimaryWeaponModItemWidgetInternal1:setTopBottom( true, false, 25, 85 )
	PrimaryWeaponModItemWidgetInternal1:setRGB( 1, 1, 1 )
	self:addElement( PrimaryWeaponModItemWidgetInternal1 )
	self.PrimaryWeaponModItemWidgetInternal1 = PrimaryWeaponModItemWidgetInternal1
	
	local PrimaryWeaponModItemWidgetInternal2 = CoD.PrimaryWeaponModItemWidget.new( menu, controller )
	PrimaryWeaponModItemWidgetInternal2:setLeftRight( true, false, 180, 267 )
	PrimaryWeaponModItemWidgetInternal2:setTopBottom( true, false, 25, 85 )
	PrimaryWeaponModItemWidgetInternal2:setRGB( 1, 1, 1 )
	self:addElement( PrimaryWeaponModItemWidgetInternal2 )
	self.PrimaryWeaponModItemWidgetInternal2 = PrimaryWeaponModItemWidgetInternal2
	
	local PrimaryWeaponModItemWidgetInternal3 = CoD.PrimaryWeaponModItemWidget.new( menu, controller )
	PrimaryWeaponModItemWidgetInternal3:setLeftRight( true, false, 270, 357 )
	PrimaryWeaponModItemWidgetInternal3:setTopBottom( true, false, 25, 85 )
	PrimaryWeaponModItemWidgetInternal3:setRGB( 1, 1, 1 )
	self:addElement( PrimaryWeaponModItemWidgetInternal3 )
	self.PrimaryWeaponModItemWidgetInternal3 = PrimaryWeaponModItemWidgetInternal3
	
	local PrimaryWeaponModItemWidgetInternal4 = CoD.PrimaryWeaponModItemWidget.new( menu, controller )
	PrimaryWeaponModItemWidgetInternal4:setLeftRight( true, false, 360, 447 )
	PrimaryWeaponModItemWidgetInternal4:setTopBottom( true, false, 25, 85 )
	PrimaryWeaponModItemWidgetInternal4:setRGB( 1, 1, 1 )
	self:addElement( PrimaryWeaponModItemWidgetInternal4 )
	self.PrimaryWeaponModItemWidgetInternal4 = PrimaryWeaponModItemWidgetInternal4
	
	local notAvailableCover = LUI.UIImage.new()
	notAvailableCover:setLeftRight( true, true, 0, 0 )
	notAvailableCover:setTopBottom( true, true, 19, -6 )
	notAvailableCover:setRGB( 0, 0, 0 )
	notAvailableCover:setAlpha( 0 )
	notAvailableCover:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( notAvailableCover )
	self.notAvailableCover = notAvailableCover
	
	local notAvailableLabel = LUI.UITightText.new()
	notAvailableLabel:setLeftRight( true, false, 5, 125 )
	notAvailableLabel:setTopBottom( false, true, -31, -11 )
	notAvailableLabel:setRGB( 0.21, 0.23, 0.28 )
	notAvailableLabel:setAlpha( 0 )
	notAvailableLabel:setText( Engine.Localize( "NOT AVAILABLE" ) )
	notAvailableLabel:setTTF( "fonts/default.ttf" )
	self:addElement( notAvailableLabel )
	self.notAvailableLabel = notAvailableLabel
	
	local notAvailableBorder = CoD.Border.new( menu, controller )
	notAvailableBorder:setLeftRight( true, true, 0, 0 )
	notAvailableBorder:setTopBottom( true, true, 19, -6 )
	notAvailableBorder:setRGB( 0, 0, 0 )
	notAvailableBorder:setAlpha( 0 )
	self:addElement( notAvailableBorder )
	self.notAvailableBorder = notAvailableBorder
	
	PrimaryWeaponModItemWidgetInternal0.navigation = {
		right = PrimaryWeaponModItemWidgetInternal1
	}
	PrimaryWeaponModItemWidgetInternal1.navigation = {
		left = PrimaryWeaponModItemWidgetInternal0,
		right = PrimaryWeaponModItemWidgetInternal2
	}
	PrimaryWeaponModItemWidgetInternal2.navigation = {
		left = PrimaryWeaponModItemWidgetInternal1,
		right = PrimaryWeaponModItemWidgetInternal3
	}
	PrimaryWeaponModItemWidgetInternal3.navigation = {
		left = PrimaryWeaponModItemWidgetInternal2,
		right = PrimaryWeaponModItemWidgetInternal4
	}
	PrimaryWeaponModItemWidgetInternal4.navigation = {
		left = PrimaryWeaponModItemWidgetInternal3
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				PrimaryWeaponModItemWidgetInternal0:completeAnimation()
				self.PrimaryWeaponModItemWidgetInternal0:setAlpha( 1 )
				self.clipFinished( PrimaryWeaponModItemWidgetInternal0, {} )
				PrimaryWeaponModItemWidgetInternal1:completeAnimation()
				self.PrimaryWeaponModItemWidgetInternal1:setAlpha( 1 )
				self.clipFinished( PrimaryWeaponModItemWidgetInternal1, {} )
				PrimaryWeaponModItemWidgetInternal2:completeAnimation()
				self.PrimaryWeaponModItemWidgetInternal2:setAlpha( 0 )
				self.clipFinished( PrimaryWeaponModItemWidgetInternal2, {} )
				notAvailableCover:completeAnimation()
				self.notAvailableCover:setAlpha( 0 )
				self.clipFinished( notAvailableCover, {} )
				notAvailableLabel:completeAnimation()
				self.notAvailableLabel:setAlpha( 0 )
				self.clipFinished( notAvailableLabel, {} )
				notAvailableBorder:completeAnimation()
				self.notAvailableBorder:setAlpha( 0 )
				self.clipFinished( notAvailableBorder, {} )
			end
		},
		ThreeAttachments = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				PrimaryWeaponModItemWidgetInternal0:completeAnimation()
				self.PrimaryWeaponModItemWidgetInternal0:setAlpha( 1 )
				self.clipFinished( PrimaryWeaponModItemWidgetInternal0, {} )
				PrimaryWeaponModItemWidgetInternal1:completeAnimation()
				self.PrimaryWeaponModItemWidgetInternal1:setAlpha( 1 )
				self.clipFinished( PrimaryWeaponModItemWidgetInternal1, {} )
				PrimaryWeaponModItemWidgetInternal2:completeAnimation()
				self.PrimaryWeaponModItemWidgetInternal2:setAlpha( 1 )
				self.clipFinished( PrimaryWeaponModItemWidgetInternal2, {} )
				notAvailableCover:completeAnimation()
				self.notAvailableCover:setAlpha( 0 )
				self.clipFinished( notAvailableCover, {} )
				notAvailableLabel:completeAnimation()
				self.notAvailableLabel:setAlpha( 0 )
				self.clipFinished( notAvailableLabel, {} )
				notAvailableBorder:completeAnimation()
				self.notAvailableBorder:setAlpha( 0 )
				self.clipFinished( notAvailableBorder, {} )
			end
		}
	}
	PrimaryWeaponModItemWidgetInternal0.id = "PrimaryWeaponModItemWidgetInternal0"
	PrimaryWeaponModItemWidgetInternal1.id = "PrimaryWeaponModItemWidgetInternal1"
	PrimaryWeaponModItemWidgetInternal2.id = "PrimaryWeaponModItemWidgetInternal2"
	PrimaryWeaponModItemWidgetInternal3.id = "PrimaryWeaponModItemWidgetInternal3"
	PrimaryWeaponModItemWidgetInternal4.id = "PrimaryWeaponModItemWidgetInternal4"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.PrimaryWeaponModItemWidgetInternal0:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.PrimaryWeaponModItemWidgetInternal0:close()
		self.PrimaryWeaponModItemWidgetInternal1:close()
		self.PrimaryWeaponModItemWidgetInternal2:close()
		self.PrimaryWeaponModItemWidgetInternal3:close()
		self.PrimaryWeaponModItemWidgetInternal4:close()
		self.notAvailableBorder:close()
		CoD.PrimaryWeaponAttachmentsModItemWidget_Internal.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

