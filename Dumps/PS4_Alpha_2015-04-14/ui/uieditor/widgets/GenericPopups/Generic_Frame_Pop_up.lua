require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemEditorFrame" )

CoD.Generic_Frame_Pop_up = InheritFrom( LUI.UIElement )
CoD.Generic_Frame_Pop_up.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Generic_Frame_Pop_up )
	self.id = "Generic_Frame_Pop_up"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 134 )
	self:setTopBottom( true, false, 0, 129 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local EmblemEditorFrame0 = CoD.EmblemEditorFrame.new( menu, controller )
	EmblemEditorFrame0:setLeftRight( true, true, 0, 0 )
	EmblemEditorFrame0:setTopBottom( true, true, 0, 0 )
	EmblemEditorFrame0:setRGB( 1, 1, 1 )
	self:addElement( EmblemEditorFrame0 )
	self.EmblemEditorFrame0 = EmblemEditorFrame0
	
	EmblemEditorFrame0.id = "EmblemEditorFrame0"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.EmblemEditorFrame0:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.EmblemEditorFrame0:close()
		CoD.Generic_Frame_Pop_up.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

