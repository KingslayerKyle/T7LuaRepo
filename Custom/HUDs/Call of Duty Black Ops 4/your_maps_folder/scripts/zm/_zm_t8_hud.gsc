#using scripts\codescripts\struct;

#using scripts\shared\array_shared;
#using scripts\shared\callbacks_shared;
#using scripts\shared\clientfield_shared;
#using scripts\shared\exploder_shared;
#using scripts\shared\flag_shared;
#using scripts\shared\laststand_shared;
#using scripts\shared\math_shared;
#using scripts\shared\scene_shared;
#using scripts\shared\system_shared;
#using scripts\shared\util_shared;

#using scripts\zm\_zm_equipment;
#using scripts\zm\_zm_utility;

#insert scripts\shared\shared.gsh;
#insert scripts\shared\version.gsh;

#insert scripts\zm\_zm_utility.gsh;

#precache( "lui_menu_data", "t8_zone_name" );

REGISTER_SYSTEM_EX( "zm_t8_hud", &__init__, &__main__, undefined )

function __init__()
{
    clientfield::register( "clientuimodel", "T8.MuleKick", VERSION_SHIP, 1, "int" );
}

function __main__()
{
	level._supress_survived_screen = true;
    callback::on_spawned( &on_player_spawned );
}

function on_player_spawned()
{
	self thread mule_kick_monitor();
	self thread zone_name_monitor();
}

function mule_kick_monitor()
{
    self endon( "bled_out" );
    self endon( "disconnect" );
    self endon( "spawned_player" );

	while( true )
	{
		WAIT_SERVER_FRAME;

		if( isdefined( self ) )
		{
			primaries = self GetWeaponsListPrimaries();
			current_weapon = self GetCurrentWeapon();
			minigun = level.zombie_powerup_weapon["minigun"];

			mule_kick = false;

			if( primaries.size > 2 )
			{
				if( IS_EQUAL( current_weapon, primaries[primaries.size - 1] ) )
				{
					IF( !IS_EQUAL( current_weapon, minigun ) )
					{
						mule_kick = true;
					}
				}
			}

			if( !IS_EQUAL( self clientfield::get_player_uimodel( "T8.MuleKick" ), mule_kick ) )
				self clientfield::set_player_uimodel( "T8.MuleKick", mule_kick );
		}
	}
}

function zone_name_monitor()
{
    self endon( "bled_out" );
    self endon( "disconnect" );
    self endon( "spawned_player" );

	while( true )
	{
		WAIT_SERVER_FRAME;
		
		if( isdefined( self ) )
		{
			zones = GetEntArray( "player_volume", "script_noteworthy" );
			zone_name = "none";

			foreach( zone in zones )
			{
				if( !isdefined( zone.script_string ) )
					continue;

				if( self IsTouching( zone ) )
					zone_name = zone.script_string;
			}

			if( !IS_EQUAL( self GetControllerUIModelValue( "t8_zone_name" ), zone_name ) )
				self SetControllerUIModelValue( "t8_zone_name", zone_name );
		}
	}
}
