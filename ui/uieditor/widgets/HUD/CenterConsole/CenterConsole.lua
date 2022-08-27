-- 38fd99a3ba0cdea591a00b830a4fb42e
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.CenterConsole.CenterConsoleEntryContainer" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	CoD.ConsoleUtility.Init( f1_arg0, f1_arg1, "centerConsole", IsMultiplayer() and 0 or nil )
end

CoD.CenterConsole = InheritFrom( LUI.UIElement )
CoD.CenterConsole.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CenterConsole )
	self.id = "CenterConsole"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 740 )
	self:setTopBottom( true, false, 0, 98 )
	
	local ConsoleEntry0 = CoD.CenterConsoleEntryContainer.new( menu, controller )
	ConsoleEntry0:setLeftRight( true, false, 0, 740 )
	ConsoleEntry0:setTopBottom( false, true, -20, 0 )
	ConsoleEntry0:subscribeToGlobalModel( controller, "HUDItems", "centerConsole.line0", function ( model )
		ConsoleEntry0:setModel( model, controller )
	end )
	self:addElement( ConsoleEntry0 )
	self.ConsoleEntry0 = ConsoleEntry0
	
	local ConsoleEntry1 = CoD.CenterConsoleEntryContainer.new( menu, controller )
	ConsoleEntry1:setLeftRight( true, false, 0, 740 )
	ConsoleEntry1:setTopBottom( false, true, -20, 0 )
	ConsoleEntry1:subscribeToGlobalModel( controller, "HUDItems", "centerConsole.line1", function ( model )
		ConsoleEntry1:setModel( model, controller )
	end )
	self:addElement( ConsoleEntry1 )
	self.ConsoleEntry1 = ConsoleEntry1
	
	local ConsoleEntry2 = CoD.CenterConsoleEntryContainer.new( menu, controller )
	ConsoleEntry2:setLeftRight( true, false, 0, 740 )
	ConsoleEntry2:setTopBottom( false, true, -20, 0 )
	ConsoleEntry2:subscribeToGlobalModel( controller, "HUDItems", "centerConsole.line2", function ( model )
		ConsoleEntry2:setModel( model, controller )
	end )
	self:addElement( ConsoleEntry2 )
	self.ConsoleEntry2 = ConsoleEntry2
	
	local ConsoleEntry3 = CoD.CenterConsoleEntryContainer.new( menu, controller )
	ConsoleEntry3:setLeftRight( true, false, 0, 740 )
	ConsoleEntry3:setTopBottom( false, true, -20, 0 )
	ConsoleEntry3:subscribeToGlobalModel( controller, "HUDItems", "centerConsole.line3", function ( model )
		ConsoleEntry3:setModel( model, controller )
	end )
	self:addElement( ConsoleEntry3 )
	self.ConsoleEntry3 = ConsoleEntry3
	
	local ConsoleEntry4 = CoD.CenterConsoleEntryContainer.new( menu, controller )
	ConsoleEntry4:setLeftRight( true, false, 0, 740 )
	ConsoleEntry4:setTopBottom( false, true, -20, 0 )
	ConsoleEntry4:subscribeToGlobalModel( controller, "HUDItems", "centerConsole.line4", function ( model )
		ConsoleEntry4:setModel( model, controller )
	end )
	self:addElement( ConsoleEntry4 )
	self.ConsoleEntry4 = ConsoleEntry4
	
	local ConsoleEntry5 = CoD.CenterConsoleEntryContainer.new( menu, controller )
	ConsoleEntry5:setLeftRight( true, false, 0, 740 )
	ConsoleEntry5:setTopBottom( false, true, -20, 0 )
	ConsoleEntry5:subscribeToGlobalModel( controller, "HUDItems", "centerConsole.line5", function ( model )
		ConsoleEntry5:setModel( model, controller )
	end )
	self:addElement( ConsoleEntry5 )
	self.ConsoleEntry5 = ConsoleEntry5
	
	local ConsoleEntry6 = CoD.CenterConsoleEntryContainer.new( menu, controller )
	ConsoleEntry6:setLeftRight( true, false, 0, 740 )
	ConsoleEntry6:setTopBottom( false, true, -20, 0 )
	ConsoleEntry6:subscribeToGlobalModel( controller, "HUDItems", "centerConsole.line6", function ( model )
		ConsoleEntry6:setModel( model, controller )
	end )
	self:addElement( ConsoleEntry6 )
	self.ConsoleEntry6 = ConsoleEntry6
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ConsoleEntry0:close()
		element.ConsoleEntry1:close()
		element.ConsoleEntry2:close()
		element.ConsoleEntry3:close()
		element.ConsoleEntry4:close()
		element.ConsoleEntry5:close()
		element.ConsoleEntry6:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

