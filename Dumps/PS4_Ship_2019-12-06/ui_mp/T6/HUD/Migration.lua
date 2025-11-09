require( "ui.T6.CoDBase" )
require( "ui.T6.CoDMenu" )

CoD.Migration = {}
LUI.createMenu.migration_ingame = function ( f1_arg0, f1_arg1 )
	local f1_local0 = CoD.Menu.New( "migration_ingame" )
	if Engine.IsInGame() and Engine.IsSplitscreen() then
		f1_local0:sizeToSafeArea( f1_arg0 )
	end
	local self = LUI.UIImage.new()
	self:setLeftRight( false, false, -1280, 1280 )
	self:setTopBottom( false, false, -720, 720 )
	self:setRGB( 0, 0, 0 )
	f1_local0:addElement( self )
	local f1_local2 = 64
	local f1_local3 = LUI.UIImage.new( {
		shaderVector0 = {
			0,
			0,
			0,
			0
		}
	} )
	f1_local3:setLeftRight( false, false, -f1_local2 / 2, f1_local2 / 2 )
	f1_local3:setTopBottom( false, false, -f1_local2 / 2, f1_local2 / 2 )
	f1_local3:setImage( RegisterMaterial( "lui_loader" ) )
	f1_local0:addElement( f1_local3 )
	local f1_local4 = f1_local2 / 2 + 10
	local f1_local5 = LUI.UIText.new()
	f1_local5:setLeftRight( true, true, 0, 0 )
	f1_local5:setTopBottom( false, false, f1_local4, f1_local4 + CoD.textSize.Condensed )
	f1_local5:setFont( CoD.fonts.Condensed )
	f1_local5:setAlignment( LUI.Alignment.Center )
	f1_local5:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	f1_local5:setText( Engine.Localize( "MP_MIGRATINGHOSTS_CAPS" ) )
	f1_local0:addElement( f1_local5 )
	f1_local0.buttonModel = Engine.CreateModel( Engine.GetModelForController( f1_arg0 ), "Migration.buttonPrompts" )
	if CoD.isMultiplayer then
		local VoipContainer = CoD.Voip_Container.new( f1_local0, f1_arg0 )
		VoipContainer:setLeftRight( true, false, 64, 337 )
		VoipContainer:setTopBottom( true, false, 36, 108 )
		VoipContainer:mergeStateConditions( {
			{
				stateName = "HudStart",
				condition = function ( menu, element, event )
					return AlwaysTrue()
				end
			},
			{
				stateName = "ShowForCodCaster",
				condition = function ( menu, element, event )
					return AlwaysFalse()
				end
			}
		} )
		f1_local0:addElement( VoipContainer )
		f1_local0.VoipContainer = VoipContainer
		
	else
		local VoipContainer = LUI.UIList.new( f1_local0, f1_arg0, 5, 0, nil, false, false, 0, 0, false, false )
		VoipContainer:makeFocusable()
		VoipContainer:setLeftRight( false, false, -576, -386 )
		VoipContainer:setTopBottom( true, false, 36, 123 )
		VoipContainer:setDataSource( "LoadingScreenPlayerListTeam1" )
		VoipContainer:setWidgetType( CoD.LoadingScreenTalkerWidgetCPZM )
		VoipContainer:setVerticalCount( 4 )
		VoipContainer:setSpacing( 5 )
		f1_local0:addElement( VoipContainer )
		f1_local0.Team1PlayerList = VoipContainer
	end
	LUI.OverrideFunction_CallOriginalSecond( f1_local0, "close", function ( element )
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( f1_arg0 ), "Migration.buttonPrompts" ) )
	end )
	return f1_local0
end

