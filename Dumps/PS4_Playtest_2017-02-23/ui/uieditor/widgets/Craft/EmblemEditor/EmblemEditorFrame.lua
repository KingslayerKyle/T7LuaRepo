require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )

CoD.EmblemEditorFrame = InheritFrom( LUI.UIElement )
CoD.EmblemEditorFrame.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EmblemEditorFrame )
	self.id = "EmblemEditorFrame"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 201 )
	self:setTopBottom( 0, 0, 0, 193 )
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( 0, 1, 0, 0 )
	StartMenuframenoBG0:setTopBottom( 0, 1, 0, 0 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.StartMenuframenoBG0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

