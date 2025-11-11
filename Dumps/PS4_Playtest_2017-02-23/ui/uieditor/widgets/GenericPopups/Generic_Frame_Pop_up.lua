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
	self:setLeftRight( 0, 0, 0, 201 )
	self:setTopBottom( 0, 0, 0, 193 )
	
	local EmblemEditorFrame0 = CoD.EmblemEditorFrame.new( menu, controller )
	EmblemEditorFrame0:setLeftRight( 0, 1, 0, 0 )
	EmblemEditorFrame0:setTopBottom( 0, 1, 0, 0 )
	self:addElement( EmblemEditorFrame0 )
	self.EmblemEditorFrame0 = EmblemEditorFrame0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.EmblemEditorFrame0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

