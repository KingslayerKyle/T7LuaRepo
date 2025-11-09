require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_Layout_ForegroundVLayout" )

CoD.systemOverlay_Layout_GenericForeground_Full = InheritFrom( LUI.UIElement )
CoD.systemOverlay_Layout_GenericForeground_Full.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.systemOverlay_Layout_GenericForeground_Full )
	self.id = "systemOverlay_Layout_GenericForeground_Full"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 320 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local categoryTypeImage = LUI.UIImage.new()
	categoryTypeImage:setLeftRight( true, false, 384, 414 )
	categoryTypeImage:setTopBottom( true, false, 11, 41 )
	categoryTypeImage:linkToElementModel( self, "categoryType", true, function ( model )
		local categoryType = Engine.GetModelValue( model )
		if categoryType then
			categoryTypeImage:setImage( RegisterImage( GetCategoryIconForOverlayType( categoryType ) ) )
		end
	end )
	self:addElement( categoryTypeImage )
	self.categoryTypeImage = categoryTypeImage
	
	local title = LUI.UITightText.new()
	title:setLeftRight( true, false, 421, 1216 )
	title:setTopBottom( true, false, 10, 40 )
	title:setTTF( "fonts/escom.ttf" )
	title:linkToElementModel( self, "title", true, function ( model )
		local _title = Engine.GetModelValue( model )
		if _title then
			title:setText( Engine.Localize( _title ) )
		end
	end )
	self:addElement( title )
	self.title = title
	
	local systemOverlayLayoutForegroundVLayout0 = CoD.systemOverlay_Layout_ForegroundVLayout.new( menu, controller )
	systemOverlayLayoutForegroundVLayout0:setLeftRight( true, false, 421, 1216 )
	systemOverlayLayoutForegroundVLayout0:setTopBottom( true, false, 41, 321 )
	systemOverlayLayoutForegroundVLayout0:linkToElementModel( self, nil, false, function ( model )
		systemOverlayLayoutForegroundVLayout0:setModel( model, controller )
	end )
	self:addElement( systemOverlayLayoutForegroundVLayout0 )
	self.systemOverlayLayoutForegroundVLayout0 = systemOverlayLayoutForegroundVLayout0
	
	systemOverlayLayoutForegroundVLayout0.id = "systemOverlayLayoutForegroundVLayout0"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.systemOverlayLayoutForegroundVLayout0:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.systemOverlayLayoutForegroundVLayout0:close()
		element.categoryTypeImage:close()
		element.title:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

