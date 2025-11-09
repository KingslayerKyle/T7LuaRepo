require( "ui.uieditor.widgets.CAC.CustomClassGridScreen.ModItemWidget" )

CoD.ModItemCardWidget_Internal = InheritFrom( LUI.UIElement )
CoD.ModItemCardWidget_Internal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ModItemCardWidget_Internal )
	self.id = "ModItemCardWidget_Internal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 409 )
	self:setTopBottom( true, false, 0, 109 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local bgImage = LUI.UIImage.new()
	bgImage:setLeftRight( true, true, 0, 0 )
	bgImage:setTopBottom( true, true, 0, 0 )
	bgImage:setRGB( 0.78, 0.78, 0.78 )
	bgImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( bgImage )
	self.bgImage = bgImage
	
	local headerBgImage = LUI.UIImage.new()
	headerBgImage:setLeftRight( true, true, 0, 0 )
	headerBgImage:setTopBottom( true, false, 0, 25 )
	headerBgImage:setRGB( 0.71, 0.71, 0.71 )
	headerBgImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( headerBgImage )
	self.headerBgImage = headerBgImage
	
	local nameBgImage = LUI.UIImage.new()
	nameBgImage:setLeftRight( true, true, 0, 0 )
	nameBgImage:setTopBottom( false, true, -25, 0 )
	nameBgImage:setRGB( 0.74, 0.74, 0.74 )
	nameBgImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( nameBgImage )
	self.nameBgImage = nameBgImage
	
	local headerLabel = LUI.UITightText.new()
	headerLabel:setLeftRight( false, true, -110, -2 )
	headerLabel:setTopBottom( true, false, 0, 25 )
	headerLabel:setRGB( 0.32, 0.32, 0.32 )
	headerLabel:setText( Engine.Localize( "MPUI_ATTACHMENTS_CAPS" ) )
	headerLabel:setTTF( "fonts/default.ttf" )
	self:addElement( headerLabel )
	self.headerLabel = headerLabel
	
	local modItemWidget1 = CoD.ModItemWidget.new( menu, controller )
	modItemWidget1:setLeftRight( true, false, 0, 135 )
	modItemWidget1:setTopBottom( true, false, 0, 109 )
	modItemWidget1:setRGB( 1, 1, 1 )
	modItemWidget1.modItemWidget.nameLabel:setText( Engine.Localize( "MPUI_REFLEX_CAPS" ) )
	self:addElement( modItemWidget1 )
	self.modItemWidget1 = modItemWidget1
	
	local modItemWidget2 = CoD.ModItemWidget.new( menu, controller )
	modItemWidget2:setLeftRight( true, false, 137, 272 )
	modItemWidget2:setTopBottom( true, false, 0, 109 )
	modItemWidget2:setRGB( 1, 1, 1 )
	modItemWidget2.modItemWidget.nameLabel:setText( Engine.Localize( "MPUI_REFLEX_CAPS" ) )
	self:addElement( modItemWidget2 )
	self.modItemWidget2 = modItemWidget2
	
	local modItemWidget3 = CoD.ModItemWidget.new( menu, controller )
	modItemWidget3:setLeftRight( true, false, 274, 409 )
	modItemWidget3:setTopBottom( true, false, 0, 109 )
	modItemWidget3:setRGB( 1, 1, 1 )
	modItemWidget3.modItemWidget.nameLabel:setText( Engine.Localize( "MPUI_REFLEX_CAPS" ) )
	self:addElement( modItemWidget3 )
	self.modItemWidget3 = modItemWidget3
	
	modItemWidget1.navigation = {
		right = modItemWidget2
	}
	modItemWidget2.navigation = {
		left = modItemWidget1,
		right = modItemWidget3
	}
	modItemWidget3.navigation = {
		left = modItemWidget2
	}
	modItemWidget1.id = "modItemWidget1"
	modItemWidget2.id = "modItemWidget2"
	modItemWidget3.id = "modItemWidget3"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.modItemWidget1:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.modItemWidget1:close()
		self.modItemWidget2:close()
		self.modItemWidget3:close()
		CoD.ModItemCardWidget_Internal.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

