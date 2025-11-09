require( "ui.uieditor.widgets.CAC.CustomClassGridScreen.SecondaryWeapon.SecondaryWeaponModItemWidget" )
require( "ui.uieditor.widgets.Border" )

CoD.SecondaryWeaponAttachmentsModItemWidget_Internal = InheritFrom( LUI.UIElement )
CoD.SecondaryWeaponAttachmentsModItemWidget_Internal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SecondaryWeaponAttachmentsModItemWidget_Internal )
	self.id = "SecondaryWeaponAttachmentsModItemWidget_Internal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 267 )
	self:setTopBottom( true, false, 0, 85 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local attachmentsLabel = LUI.UITightText.new()
	attachmentsLabel:setLeftRight( true, false, 0, 112 )
	attachmentsLabel:setTopBottom( true, false, 5, 25 )
	attachmentsLabel:setRGB( 0.4, 0.44, 0.52 )
	attachmentsLabel:setText( Engine.Localize( "MPUI_ATTACHMENTS_CAPS" ) )
	attachmentsLabel:setTTF( "fonts/default.ttf" )
	self:addElement( attachmentsLabel )
	self.attachmentsLabel = attachmentsLabel
	
	local SecondaryWeaponModItemWidgetInternal0 = CoD.SecondaryWeaponModItemWidget.new( menu, controller )
	SecondaryWeaponModItemWidgetInternal0:setLeftRight( true, false, 0, 132 )
	SecondaryWeaponModItemWidgetInternal0:setTopBottom( true, false, 25, 85 )
	SecondaryWeaponModItemWidgetInternal0:setRGB( 1, 1, 1 )
	self:addElement( SecondaryWeaponModItemWidgetInternal0 )
	self.SecondaryWeaponModItemWidgetInternal0 = SecondaryWeaponModItemWidgetInternal0
	
	local SecondaryWeaponModItemWidgetInternal1 = CoD.SecondaryWeaponModItemWidget.new( menu, controller )
	SecondaryWeaponModItemWidgetInternal1:setLeftRight( true, false, 135, 267 )
	SecondaryWeaponModItemWidgetInternal1:setTopBottom( true, false, 25, 85 )
	SecondaryWeaponModItemWidgetInternal1:setRGB( 1, 1, 1 )
	self:addElement( SecondaryWeaponModItemWidgetInternal1 )
	self.SecondaryWeaponModItemWidgetInternal1 = SecondaryWeaponModItemWidgetInternal1
	
	local notAvailableCover = LUI.UIImage.new()
	notAvailableCover:setLeftRight( true, true, 0, 0 )
	notAvailableCover:setTopBottom( true, true, 25, 0 )
	notAvailableCover:setRGB( 0, 0, 0 )
	notAvailableCover:setAlpha( 0 )
	notAvailableCover:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( notAvailableCover )
	self.notAvailableCover = notAvailableCover
	
	local notAvailableText = LUI.UITightText.new()
	notAvailableText:setLeftRight( true, false, 5, 125 )
	notAvailableText:setTopBottom( false, true, -25, -5 )
	notAvailableText:setRGB( 0.22, 0.23, 0.28 )
	notAvailableText:setAlpha( 0 )
	notAvailableText:setText( Engine.Localize( "NOT AVAILABLE" ) )
	notAvailableText:setTTF( "fonts/default.ttf" )
	self:addElement( notAvailableText )
	self.notAvailableText = notAvailableText
	
	local notAvailableBorder = CoD.Border.new( menu, controller )
	notAvailableBorder:setLeftRight( true, true, 0, 0 )
	notAvailableBorder:setTopBottom( true, true, 25, 0 )
	notAvailableBorder:setRGB( 0, 0, 0 )
	notAvailableBorder:setAlpha( 0 )
	self:addElement( notAvailableBorder )
	self.notAvailableBorder = notAvailableBorder
	
	SecondaryWeaponModItemWidgetInternal0.navigation = {
		right = SecondaryWeaponModItemWidgetInternal1
	}
	SecondaryWeaponModItemWidgetInternal1.navigation = {
		left = SecondaryWeaponModItemWidgetInternal0
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				SecondaryWeaponModItemWidgetInternal0:completeAnimation()
				self.SecondaryWeaponModItemWidgetInternal0:setLeftRight( true, false, 0, 202 )
				self.SecondaryWeaponModItemWidgetInternal0:setTopBottom( true, false, 25, 85 )
				self.SecondaryWeaponModItemWidgetInternal0:setAlpha( 1 )
				self.clipFinished( SecondaryWeaponModItemWidgetInternal0, {} )
				SecondaryWeaponModItemWidgetInternal1:completeAnimation()
				self.SecondaryWeaponModItemWidgetInternal1:setAlpha( 0 )
				self.clipFinished( SecondaryWeaponModItemWidgetInternal1, {} )
				notAvailableCover:completeAnimation()
				self.notAvailableCover:setAlpha( 0 )
				self.clipFinished( notAvailableCover, {} )
				notAvailableText:completeAnimation()
				self.notAvailableText:setAlpha( 0 )
				self.clipFinished( notAvailableText, {} )
				notAvailableBorder:completeAnimation()
				self.notAvailableBorder:setAlpha( 0 )
				self.clipFinished( notAvailableBorder, {} )
			end
		},
		NotAvailable = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				SecondaryWeaponModItemWidgetInternal0:completeAnimation()
				self.SecondaryWeaponModItemWidgetInternal0:setAlpha( 0 )
				self.clipFinished( SecondaryWeaponModItemWidgetInternal0, {} )
				SecondaryWeaponModItemWidgetInternal1:completeAnimation()
				self.SecondaryWeaponModItemWidgetInternal1:setAlpha( 0 )
				self.clipFinished( SecondaryWeaponModItemWidgetInternal1, {} )
				notAvailableCover:completeAnimation()
				self.notAvailableCover:setAlpha( 0.28 )
				self.clipFinished( notAvailableCover, {} )
				notAvailableText:completeAnimation()
				self.notAvailableText:setAlpha( 1 )
				self.clipFinished( notAvailableText, {} )
				notAvailableBorder:completeAnimation()
				self.notAvailableBorder:setAlpha( 0.28 )
				self.clipFinished( notAvailableBorder, {} )
			end
		},
		TwoAttachments = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				SecondaryWeaponModItemWidgetInternal0:completeAnimation()
				self.SecondaryWeaponModItemWidgetInternal0:setLeftRight( true, false, 0, 134 )
				self.SecondaryWeaponModItemWidgetInternal0:setTopBottom( true, false, 25, 85 )
				self.SecondaryWeaponModItemWidgetInternal0:setAlpha( 1 )
				self.clipFinished( SecondaryWeaponModItemWidgetInternal0, {} )
				SecondaryWeaponModItemWidgetInternal1:completeAnimation()
				self.SecondaryWeaponModItemWidgetInternal1:setLeftRight( true, false, 135, 269 )
				self.SecondaryWeaponModItemWidgetInternal1:setTopBottom( true, false, 25, 85 )
				self.SecondaryWeaponModItemWidgetInternal1:setAlpha( 1 )
				self.clipFinished( SecondaryWeaponModItemWidgetInternal1, {} )
				notAvailableCover:completeAnimation()
				self.notAvailableCover:setAlpha( 0 )
				self.clipFinished( notAvailableCover, {} )
				notAvailableText:completeAnimation()
				self.notAvailableText:setAlpha( 0 )
				self.clipFinished( notAvailableText, {} )
				notAvailableBorder:completeAnimation()
				self.notAvailableBorder:setAlpha( 0 )
				self.clipFinished( notAvailableBorder, {} )
			end
		}
	}
	SecondaryWeaponModItemWidgetInternal0.id = "SecondaryWeaponModItemWidgetInternal0"
	SecondaryWeaponModItemWidgetInternal1.id = "SecondaryWeaponModItemWidgetInternal1"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.SecondaryWeaponModItemWidgetInternal0:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.SecondaryWeaponModItemWidgetInternal0:close()
		self.SecondaryWeaponModItemWidgetInternal1:close()
		self.notAvailableBorder:close()
		CoD.SecondaryWeaponAttachmentsModItemWidget_Internal.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

