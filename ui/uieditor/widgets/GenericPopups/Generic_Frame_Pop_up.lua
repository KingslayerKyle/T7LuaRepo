-- 6d4edd435c1b700cda024b4f67b6d5bb
-- This hash is used for caching, delete to decompile the file again

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
	self:addElement( EmblemEditorFrame0 )
	self.EmblemEditorFrame0 = EmblemEditorFrame0
	
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.EmblemEditorFrame0:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.EmblemEditorFrame0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
