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

#using scripts\zm\_zm;
#using scripts\zm\_zm_utility;

#insert scripts\shared\shared.gsh;
#insert scripts\shared\version.gsh;

#insert scripts\zm\_zm_utility.gsh;

REGISTER_SYSTEM_EX( "zm_t4_hud", &__init__, &__main__, undefined )

function __init__()
{
	// Clientfields
	clientfield::register( "clientuimodel", "t4_mule_kick", VERSION_SHIP, 1, "int" );

	// Callbacks
	callback::on_connect( &on_player_connect );
}

function __main__()
{
	// Remove default game-over text
	level._supress_survived_screen = true;
	
	// Set team colors
	level thread set_team_colors();
}

function on_player_connect()
{
	self thread set_mule_kick_clientfield();
	self thread set_revive_text();
}

function set_player_uimodel_clientfield( name, val )
{
	if( IS_EQUAL( self clientfield::get_player_uimodel( name ), val ) )
	{
		return;
	}

	self clientfield::set_player_uimodel( name, val );
}

function set_world_clientfield( name, val )
{
	if( IS_EQUAL( level clientfield::get( name ), val ) )
	{
		return;
	}

	level clientfield::set( name, val );
}

function set_mule_kick_clientfield()
{
    self endon( "disconnect" );
	self notify( "set_mule_kick_clientfield" );
	self endon( "set_mule_kick_clientfield" );

	while( true )
	{
		self waittill( "weapon_change", weapon );

		mule_kick = false;
		primary_weapons = self getweaponslistprimaries();

		if( primary_weapons.size > 2 )
		{
			last_weapon = primary_weapons[primary_weapons.size - 1];

			if( IS_EQUAL( last_weapon, weapon ) )
			{
				mule_kick = !IS_EQUAL( last_weapon, level.zombie_powerup_weapon["minigun"] );
			}
		}

		self set_player_uimodel_clientfield( "t4_mule_kick", mule_kick );
	}
}

function set_revive_text()
{
    self endon( "disconnect" );
	self notify( "set_revive_text" );
	self endon( "set_revive_text" );

	while( true )
	{
		WAIT_SERVER_FRAME;

		if( isdefined( self.revivetexthud ) )
		{
			self.revivetexthud settext( "" );
		}
	}
}

function set_team_colors()
{
	team_colors = array::randomize( array(
		"1.00 1.00 1.00 1",
		"0.48 0.81 0.93 1",
		"0.96 0.79 0.31 1",
		"0.51 0.92 0.53 1"
	) );

	foreach( index, color in team_colors )
	{
		setdvar( "cg_scorescolor_gamertag_" + index, color );
	}
}
