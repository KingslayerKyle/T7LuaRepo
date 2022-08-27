-- 6c90155b13d801a88114efde99f3bfbd
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.CenterConsole.CenterConsoleEntry" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	CoD.ConsoleUtility.EntryInit( f1_arg0, f1_arg1, Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
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
	self:setLeftRight( true, false, 0, 740 )
	self:setTopBottom( true, false, 0, 22 )
	
	local ConsoleEntry = CoD.CenterConsoleEntry.new( menu, controller )
	ConsoleEntry:setLeftRight( true, false, 0, 740 )
	ConsoleEntry:setTopBottom( false, true, -26, 0 )
	ConsoleEntry:linkToElementModel( self, nil, false, function ( model )
		ConsoleEntry:setModel( model, controller )
	end )
	self:addElement( ConsoleEntry )
	self.ConsoleEntry = ConsoleEntry
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ConsoleEntry:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

