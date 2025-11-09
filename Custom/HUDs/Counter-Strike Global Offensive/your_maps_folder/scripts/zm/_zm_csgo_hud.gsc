#using scripts\codescripts\struct;

#using scripts\shared\aat_shared;
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

#precache( "lui_menu_data", "csgo_first_weapon" );
#precache( "lui_menu_data", "csgo_first_weapon_aat" );
#precache( "lui_menu_data", "csgo_second_weapon" );
#precache( "lui_menu_data", "csgo_second_weapon_aat" );
#precache( "lui_menu_data", "csgo_third_weapon" );
#precache( "lui_menu_data", "csgo_third_weapon_aat" );
#precache( "lui_menu_data", "csgo_zone_name" );

REGISTER_SYSTEM_EX( "zm_csgo_hud", &__init__, &__main__, undefined )

function __init__()
{
}

function __main__()
{
    callback::on_spawned( &on_player_spawned );
}

function on_player_spawned()
{
	self thread weapons_aats_monitor();
	self thread zone_name_monitor();
}

function weapons_aats_monitor()
{
    self endon( "bled_out" );
    self endon( "disconnect" );
    self endon( "spawned_player" );

	models = array( "csgo_first_weapon", "csgo_second_weapon", "csgo_third_weapon" );

	while( true )
	{
		WAIT_SERVER_FRAME;

		if( isdefined( self ) )
		{
			for( i = 0; i < models.size; i++ )
			{
				primaries = self GetWeaponsListPrimaries();
				weapon_name = "none";
				aat_name = "none";
				minigun = level.zombie_powerup_weapon["minigun"];

				if( isdefined( primaries[i] ) && !IS_EQUAL( primaries[i], minigun ) )
				{
					weapon_name = primaries[i].name;
					aat = self aat::getAATOnWeapon( primaries[i] );

					if( isdefined( aat ) )
						aat_name = aat.name;
				}

				if( !IS_EQUAL( self GetControllerUIModelValue( models[i] ), weapon_name ) )
					self SetControllerUIModelValue( models[i], weapon_name );

				if( !IS_EQUAL( self GetControllerUIModelValue( models[i] + "_aat" ), aat_name ) )
					self SetControllerUIModelValue( models[i] + "_aat", aat_name );
			}
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

			if( !IS_EQUAL( self GetControllerUIModelValue( "csgo_zone_name" ), zone_name ) )
				self SetControllerUIModelValue( "csgo_zone_name", zone_name );
		}
	}
}
