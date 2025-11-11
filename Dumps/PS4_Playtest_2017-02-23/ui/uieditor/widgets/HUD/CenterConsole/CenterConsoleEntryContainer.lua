require( "ui.uieditor.widgets.HUD.CenterConsole.CenterConsoleEntry" )

local PostLoadFunc = function ( self, controller )
	CoD.ConsoleUtility.EntryInit( self, controller, Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
end

CoD.CenterConsoleEntryContainer = InheritFrom( LUI.UIElement )
CoD.CenterConsoleEntryContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CenterConsoleEntryContainer )
	self.id = "CenterConsoleEntryContainer"
	self.soundSet = "HUD"
	self:setLeftRight( 0, 0, 0, 1110 )
	self:setTopBottom( 0, 0, 0, 33 )
	
	local ConsoleEntry = CoD.CenterConsoleEntry.new( menu, controller )
	ConsoleEntry:setLeftRight( 0, 0, 0, 1110 )
	ConsoleEntry:setTopBottom( 1, 1, -39, 0 )
	ConsoleEntry:linkToElementModel( self, nil, false, function ( model )
		ConsoleEntry:setModel( model, controller )
	end )
	self:addElement( ConsoleEntry )
	self.ConsoleEntry = ConsoleEntry
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.ConsoleEntry:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

