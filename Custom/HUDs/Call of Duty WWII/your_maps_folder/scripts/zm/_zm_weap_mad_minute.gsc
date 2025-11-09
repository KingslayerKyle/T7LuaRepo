#insert scripts\shared\shared.gsh;
#insert scripts\shared\version.gsh;

#using scripts\codescripts\struct;

#using scripts\shared\array_shared;
#using scripts\shared\callbacks_shared;
#using scripts\shared\clientfield_shared;
#using scripts\shared\flag_shared;
#using scripts\shared\hud_util_shared;
#using scripts\shared\math_shared;
#using scripts\shared\system_shared;
#using scripts\shared\util_shared;

#using scripts\zm\_zm_audio;
#using scripts\zm\_zm_hero_weapon;
#using scripts\zm\_zm_magicbox;
#using scripts\zm\_zm_spawner;
#using scripts\zm\_zm_utility;
#using scripts\zm\_zm_weapons;

#define STR_MAD_MINUTE					"hero_mad_minute"

#define HERO_STATE_HIDDEN				0
#define HERO_STATE_CHARGING				1
#define HERO_STATE_READY				2
#define HERO_STATE_INUSE				3
#define HERO_STATE_UNAVAILABLE			4

#define HERO_MINPOWER					0
#define HERO_MAXPOWER					100

#define HERO_CLIENTFIELD_POWER			"zmhud.swordEnergy"
#define HERO_CLIENTFIELD_POWER_FLASH	"zmhud.swordChargeUpdate"
#define HERO_CLIENTFIELD_STATE			"zmhud.swordState"

#define ACTIVATION_SOUND				"zmb_electrocute_zombie"

#namespace zm_weap_mad_minute;

REGISTER_SYSTEM_EX( "zm_weap_mad_minute", &__init__, &__main__, undefined )

function __init__()
{
	zm_hero_weapon::register_hero_weapon( STR_MAD_MINUTE );
	zm_hero_weapon::register_hero_weapon_wield_unwield_callbacks( STR_MAD_MINUTE, &wield_mad_minute, &unwield_mad_minute );
	zm_hero_weapon::register_hero_weapon_power_callbacks( STR_MAD_MINUTE, undefined, &mad_minute_power_empty );
}

function __main__()
{
	callback::on_spawned( &on_player_spawned );
}

function on_player_spawned()
{
	self waittill( "weapon_change_complete" );
	self zm_magicbox::give_hero_weapon( GetWeapon( STR_MAD_MINUTE ) );
	self GadgetPowerSet( 0, 0 );
	self thread mad_minute_monitor();
}

function wield_mad_minute( wpn_mad_minute )
{
	self zm_hero_weapon::default_wield( wpn_mad_minute );

	self zm_weapons::switch_back_primary_weapon( undefined, true );
}

function unwield_mad_minute( wpn_mad_minute )
{
	self zm_hero_weapon::default_unwield( wpn_mad_minute );

	if( isdefined( self.hero_power ) && IS_EQUAL( self.hero_power, HERO_MAXPOWER ) )
	{
		self thread zm_hero_weapon::continue_draining_hero_weapon( wpn_mad_minute );

		self PlaySound( ACTIVATION_SOUND );
	}
}

function mad_minute_power_empty( wpn_mad_minute )
{
	self zm_hero_weapon::default_power_empty( wpn_mad_minute );

	self notify( "stop_draining_hero_weapon" );
}

function mad_minute_monitor()
{
	self endon( "bled_out" );
	self endon( "disconnect" );
	self endon( "spawned_player" );

	while( true )
	{
		wpn_mad_minute = GetWeapon( STR_MAD_MINUTE );

		if( zm_utility::is_player_valid( self ) && IS_EQUAL( self zm_utility::get_player_hero_weapon(), wpn_mad_minute ) )
		{
			if( isdefined( self.hero_power ) && IS_EQUAL( self.hero_power, HERO_MAXPOWER ) )
			{
				if( !IS_EQUAL( self GetWeaponAmmoClip( wpn_mad_minute ), wpn_mad_minute.clipSize ) )
					self SetWeaponAmmoClip( wpn_mad_minute, wpn_mad_minute.clipSize );
			}
			else
			{
				if( !IS_EQUAL( self GetWeaponAmmoClip( wpn_mad_minute ), 0 ) )
					self SetWeaponAmmoClip( wpn_mad_minute, 0 );
			}
		}

		if( zm_utility::is_player_valid( self ) && isdefined( self.hero_weapon_state ) && IS_EQUAL( self.hero_weapon_state, HERO_STATE_INUSE ) && IS_EQUAL( self zm_utility::get_player_hero_weapon(), wpn_mad_minute ) )
		{
			if( IsInArray( self GetWeaponsListPrimaries(), self GetCurrentWeapon() ) )
				self SetWeaponAmmoClip( self GetCurrentWeapon(), self GetCurrentWeapon().clipSize );
		}

		WAIT_SERVER_FRAME;
	}
}
