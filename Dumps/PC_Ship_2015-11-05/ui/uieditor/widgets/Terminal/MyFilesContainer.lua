require( "ui.uieditor.widgets.Terminal.Generalframe" )

CoD.MyFilesContainer = InheritFrom( LUI.UIElement )
CoD.MyFilesContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MyFilesContainer )
	self.id = "MyFilesContainer"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 544 )
	self:setTopBottom( true, false, 0, 336 )
	self.anyChildUsesUpdateState = true
	
	local Generalframe0 = CoD.Generalframe.new( menu, controller )
	Generalframe0:setLeftRight( true, true, 0, -8 )
	Generalframe0:setTopBottom( true, true, 0, -11 )
	self:addElement( Generalframe0 )
	self.Generalframe0 = Generalframe0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Generalframe0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

