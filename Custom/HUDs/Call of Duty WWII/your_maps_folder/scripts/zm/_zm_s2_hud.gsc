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

#using scripts\zm\_zm_weap_mad_minute;

#insert scripts\shared\shared.gsh;
#insert scripts\shared\version.gsh;

#insert scripts\zm\_zm_utility.gsh;

REGISTER_SYSTEM_EX( "zm_s2_hud", &__init__, &__main__, undefined )

function __init__()
{
    clientfield::register( "clientuimodel", "S2.MuleKick", VERSION_SHIP, 1, "int" );
    clientfield::register( "clientuimodel", "S2.PerkSlots", VERSION_SHIP, GetMinBitCountForNum( 31 ), "int" );
}

function __main__()
{
    callback::on_spawned( &on_player_spawned );
}

function on_player_spawned()
{
	self thread mule_kick_monitor();
	self thread perk_slots_monitor();
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

			if( !IS_EQUAL( self clientfield::get_player_uimodel( "S2.MuleKick" ), mule_kick ) )
				self clientfield::set_player_uimodel( "S2.MuleKick", mule_kick );
		}
	}
}

function perk_slots_monitor()
{
    self endon( "bled_out" );
    self endon( "disconnect" );
    self endon( "spawned_player" );

	while( true )
	{
		if( isdefined( self ) )
		{
			perk_limit = self zm_utility::get_player_perk_purchase_limit();

			if( isdefined( perk_limit ) )
			{
				if( !IS_EQUAL( self clientfield::get_player_uimodel( "S2.PerkSlots" ), perk_limit ) )
				{
					if( perk_limit <= 31 )
						self clientfield::set_player_uimodel( "S2.PerkSlots", perk_limit );
				}
			}
		}

		WAIT_SERVER_FRAME;
	}
}
