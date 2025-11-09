#using scripts\codescripts\struct;

#using scripts\shared\array_shared;
#using scripts\shared\callbacks_shared;
#using scripts\shared\clientfield_shared;
#using scripts\shared\exploder_shared;
#using scripts\shared\flag_shared;
#using scripts\shared\math_shared;
#using scripts\shared\scene_shared;
#using scripts\shared\system_shared;
#using scripts\shared\util_shared;

#using scripts\zm\_zm_utility;

#insert scripts\shared\shared.gsh;
#insert scripts\shared\version.gsh;

REGISTER_SYSTEM_EX( "zm_t6_hud", &__init__, &__main__, undefined )

function __init__()
{
    clientfield::register( "clientuimodel", "T6.MuleKick", VERSION_SHIP, 1, "int" );
}

function __main__()
{
    callback::on_spawned( &on_player_spawned );
}

function on_player_spawned()
{
	self thread mule_kick_monitor();
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

			if( !IS_EQUAL( self clientfield::get_player_uimodel( "T6.MuleKick" ), mule_kick ) )
				self clientfield::set_player_uimodel( "T6.MuleKick", mule_kick );
		}
	}
}
