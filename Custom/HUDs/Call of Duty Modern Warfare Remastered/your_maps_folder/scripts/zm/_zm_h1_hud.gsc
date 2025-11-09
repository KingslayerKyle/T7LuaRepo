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
#using scripts\zm\_zm_score;
#using scripts\zm\_zm_utility;
#using scripts\zm\_zm_weap_riotshield;

#insert scripts\shared\shared.gsh;
#insert scripts\shared\version.gsh;

#insert scripts\zm\_zm_utility.gsh;

#precache( "string", "ZOMBIE ELIMINATION" );
#precache( "string", "ZOMBIE CRITICAL KILL" );
#precache( "string", "ZOMBIE MELEE KILL" );

REGISTER_SYSTEM_EX( "zm_h1_hud", &__init__, &__main__, undefined )

function __init__()
{
	for( i = 0; i < GetDvarInt( "com_maxclients" ); i++ )
	{
		clientfield::register( "world", "h1_health_" + i, VERSION_SHIP, 7, "float" );
		clientfield::register( "world", "h1_shield_" + i, VERSION_SHIP, 1, "int" );
		clientfield::register( "world", "h1_shield_health_" + i, VERSION_SHIP, 7, "float" );
	}

	clientfield::register( "clientuimodel", "powerup_instant_kill.time", VERSION_SHIP, 8, "int" );
	clientfield::register( "clientuimodel", "powerup_double_points.time", VERSION_SHIP, 8, "int" );
	clientfield::register( "clientuimodel", "powerup_fire_sale.time", VERSION_SHIP, 8, "int" );
	clientfield::register( "clientuimodel", "powerup_mini_gun.time", VERSION_SHIP, 8, "int" );

	zm::register_zombie_damage_override_callback( &zombie_damage_override_callback );
}

function __main__()
{
    callback::on_spawned( &on_player_spawned );
}

function on_player_spawned()
{
	self thread ui_health_monitor();
	self thread ui_shield_monitor();
	self.player_shield_reset_health = &player_init_shield_health;
	self.player_shield_apply_damage = &player_damage_shield;
	self thread ui_powerup_monitor();
}

function ui_health_monitor()
{
    self endon( "bled_out" );
    self endon( "disconnect" );
    self endon( "spawned_player" );

	while( true )
	{
		if( isdefined( self ) )
		{
			health_cf = "h1_health_" + self GetEntityNumber();
			health = ( zm_utility::is_player_valid( self ) ? Float( self.health / self.maxhealth ) : 0 );

			if( !IS_EQUAL( level clientfield::get( health_cf ), health ) )
				level clientfield::set( health_cf, health );
		}

		WAIT_SERVER_FRAME;
	}
}

function ui_shield_monitor()
{
    self endon( "bled_out" );
    self endon( "disconnect" );
    self endon( "spawned_player" );

	while( true )
	{
		if( isdefined( self ) )
		{
			shield_cf = "h1_shield_" + self GetEntityNumber();
			shield = IS_TRUE( self.hasRiotShield );

			if( !IS_EQUAL( level clientfield::get( shield_cf ), shield ) )
				level clientfield::set( shield_cf, shield );
		}

		WAIT_SERVER_FRAME;
	}
}

function player_init_shield_health()
{
	self riotshield::UpdateRiotShieldModel();
	self clientfield::set_player_uimodel( "zmInventory.shield_health", 1.0 );
	level clientfield::set( "h1_shield_health_" + self GetEntityNumber(), 1.0 );
	return 1;
}

function player_damage_shield( iDamage, bHeld, fromCode = false, smod = "MOD_UNKNOWN" )
{
	damageMax = level.weaponRiotshield.weaponstarthitpoints;

	if( isdefined( self.weaponRiotshield ) )
		damageMax = self.weaponRiotshield.weaponstarthitpoints;

	shieldHealth = damageMax;
	shieldDamage = iDamage;
	rumbled = false;

	if( fromCode )
		shieldDamage = 0;

	shieldHealth = self DamageRiotShield( shieldDamage );

	if( shieldHealth <= 0 )
	{
		if( !rumbled )
		{
			self PlayRumbleOnEntity( "damage_heavy" );
			Earthquake( 1.0, 0.75, self.origin, 100 );
		}

		self thread riotshield::player_take_riotshield();
	}
	else
	{
		if( !rumbled )
		{
			self PlayRumbleOnEntity( "damage_light" );
			Earthquake( 0.5, 0.5, self.origin, 100 );
		}

		self PlaySound( "fly_riotshield_zm_impact_zombies" );
	}

	self riotshield::UpdateRiotShieldModel();
	self clientfield::set_player_uimodel( "zmInventory.shield_health", shieldHealth / damageMax );
	level clientfield::set( "h1_shield_health_" + self GetEntityNumber(), shieldHealth / damageMax );
}

function ui_powerup_monitor()
{
    self endon( "bled_out" );
    self endon( "disconnect" );
    self endon( "spawned_player" );

	powerup_cfs = array( "powerup_instant_kill", "powerup_double_points", "powerup_fire_sale", "powerup_mini_gun" );

	while( true )
	{
		WAIT_SERVER_FRAME;

		foreach( powerup in level.zombie_powerups )
		{
			cf = powerup.client_field_name;

			if( !IsInArray( powerup_cfs, cf ) )
				continue;

			on_name = powerup.on_name;
			time_name = powerup.time_name;
			powerup_timer = undefined;
			powerup_on = undefined;
			time = undefined;
			
			if( isdefined( on_name ) && isdefined( time_name ) )
			{
				if( powerup.only_affects_grabber )
				{
					if( IS_TRUE( self._show_solo_hud ) )
					{
						powerup_timer = self.zombie_vars[time_name];
						powerup_on = self.zombie_vars[on_name];
					}
				}
				else if( isdefined( level.zombie_vars[self.team][time_name] ) )
				{
					powerup_timer = level.zombie_vars[self.team][time_name];
					powerup_on = level.zombie_vars[self.team][on_name];
				}
				else if( isdefined( level.zombie_vars[time_name] ) )
				{
					powerup_timer = level.zombie_vars[time_name];
					powerup_on = level.zombie_vars[on_name];
				}

				if( isdefined( powerup_timer ) && isdefined( powerup_on ) )
				{
					time = ( Int( powerup_timer ) <= 255 ? Int( powerup_timer ) : 255 );

					if( !IS_EQUAL( self clientfield::get_player_uimodel( cf + ".time" ), time ) )
						self clientfield::set_player_uimodel( cf + ".time", time );
				}
			}
		}
	}
}

function zombie_damage_override_callback( death, inflictor, attacker, damage, flags, mod, weapon, vpoint, vdir, sHitLoc, psOffsetTime, boneIndex, surfaceType )
{
	if( IS_EQUAL( self.archetype, "zombie" ) && IS_EQUAL( self.team, level.zombie_team ) )
	{
		if( death && isdefined( attacker ) && isplayer( attacker ) )
		{
			player_points = zm_score::get_zombie_death_player_points();
			kill_bonus = get_points_kill_bonus( mod, sHitLoc, weapon, player_points );
			points = kill_bonus[0];
			text = kill_bonus[1];

			if( level.zombie_vars[attacker.team]["zombie_powerup_insta_kill_on"] == 1 && mod == "MOD_UNKNOWN" )
			{
				points *= 2;
			}

			player_points += points;
			player_points *= level.zombie_vars[attacker.team]["zombie_point_scalar"];

			attacker luinotifyevent( &"score_event", 2, text, player_points );
		}
	}
	
	return false;
}

function get_points_kill_bonus( mod, hit_location, weapon, player_points = undefined )
{
	ret_val = array( 0, &"ZOMBIE ELIMINATION" );

	if( mod == "MOD_MELEE" )
	{
		ret_val[0] = level.zombie_vars["zombie_score_bonus_melee"];
		ret_val[1] = &"ZOMBIE MELEE KILL";
		return ret_val;
	}

	if( mod == "MOD_BURNED" )
	{
		ret_val[0] = level.zombie_vars["zombie_score_bonus_burn"];
		ret_val[1] = &"ZOMBIE BURNED KILL";
		return ret_val;
	}

	if ( isdefined( hit_location ) )
    {
		switch ( hit_location )
		{
			case "head":
			case "helmet":
				ret_val[0] = level.zombie_vars["zombie_score_bonus_head"];
				ret_val[1] = &"ZOMBIE CRITICAL KILL";
				break;
		
			case "neck":
				ret_val[0] = level.zombie_vars["zombie_score_bonus_neck"];
				ret_val[1] = &"ZOMBIE ELIMINATION";
				break;
		
			case "torso_upper":
			case "torso_lower":
				ret_val[0] = level.zombie_vars["zombie_score_bonus_torso"];
				ret_val[1] = &"ZOMBIE ELIMINATION";
				break;
			
			default:
				break;
		}
    }

	return ret_val; 
}
