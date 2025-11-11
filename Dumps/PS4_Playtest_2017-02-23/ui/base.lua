require( "lua.Shared.LuaDefine" )
require( "lua.Shared.LuaEnum" )
require( "lua.Shared.LuaReadOnlyTables" )
require( "lua.Shared.LuaUtils" )
require( "ui.LUI.LUI" )

if Engine.IsDevelopmentBuild() then
	require( "ui.rat.rat" )
end
if Engine.IsDevelopmentBuild() or Engine.IsProfileBuild() then
	require( "ui.LUI.luidev" )
end
require( "ui.CoDRoot" )
EnableGlobals()
require( "ui.uieditor.actions" )
require( "ui.uieditor.colorsets" )
require( "ui.uieditor.conditions" )
require( "ui.uieditor.datasources" )
require( "ui.uieditor.modifyFunctions" )
require( "ui.uieditor.soundsets" )
require( "lua.Shared.CoDShared" )
require( "ui.CoDBase" )
require( "ui.CoDMenu" )
DisableGlobals()
