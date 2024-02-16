-- fb11bc07a6b289629f3b14cbfcd2c6ae
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.Console.ConsoleEntry" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	CoD.ConsoleUtility.EntryInit( f1_arg0, f1_arg1, Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
end

CoD.ConsoleEntryContainer = InheritFrom( LUI.UIElement )
CoD.ConsoleEntryContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ConsoleEntryContainer )
	self.id = "ConsoleEntryContainer"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 680 )
	self:setTopBottom( true, false, 0, 16 )
	
	local ConsoleEntry = CoD.ConsoleEntry.new( menu, controller )
	ConsoleEntry:setLeftRight( true, false, 0, 680 )
	ConsoleEntry:setTopBottom( false, true, -14, 0 )
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
