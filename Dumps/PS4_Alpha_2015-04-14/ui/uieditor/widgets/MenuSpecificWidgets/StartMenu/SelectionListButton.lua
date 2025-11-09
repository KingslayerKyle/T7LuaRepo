require( "ui.uieditor.widgets.MenuSpecificWidgets.StartMenu.StartMenuButtonItem" )

CoD.SelectionListButton = InheritFrom( LUI.UIElement )
CoD.SelectionListButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.SelectionListButton )
	self.id = "SelectionListButton"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 260 )
	self:setTopBottom( true, false, 0, 30 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local internal = CoD.StartMenuButtonItem.new( menu, controller )
	internal:setLeftRight( true, true, 0, 0 )
	internal:setTopBottom( true, true, 0, 0 )
	internal:setRGB( 1, 1, 1 )
	self:addElement( internal )
	self.internal = internal
	
	self.internal:linkToElementModel( self, "displayText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			internal.text:setText( Engine.Localize( modelValue ) )
		end
	end )
	internal.id = "internal"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.internal:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.internal:close()
		CoD.SelectionListButton.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

