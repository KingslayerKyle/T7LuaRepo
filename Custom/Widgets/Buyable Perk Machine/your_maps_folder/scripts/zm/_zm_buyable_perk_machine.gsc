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

#using scripts\zm\_zm_audio;
#using scripts\zm\_zm_perks;
#using scripts\zm\_zm_score;
#using scripts\zm\_zm_unitrigger;
#using scripts\zm\_zm_utility;

#insert scripts\shared\shared.gsh;
#insert scripts\shared\version.gsh;

#insert scripts\zm\_zm_perks.gsh;

#precache( "menu", "BuyablePerk_Main" );
#precache( "triggerstring", "ZOMBIE_RANDOM_PERK_PICKUP" );

REGISTER_SYSTEM_EX( "zm_buyable_perk_machine", &__init__, &__main__, undefined )

function __init__()
{
	structs = struct::get_array( "zm_buyable_perk_machine", "targetname" );

	if( structs.size < 1 )
		return;

	array::thread_all( structs, &buyable_perk_spawn_init );
}

function __main__()
{
	callback::on_connect( &on_player_connect );
	callback::on_laststand( &on_player_laststand );
}

function on_player_connect()
{
	self thread buyable_perk_menu_handler();
}

function on_player_laststand()
{
	self buyable_perk_close_menu();
}

function buyable_perk_spawn_init()
{
	if( !isdefined( self.model ) )
		return;

	self.machine = Spawn( "script_model", self.origin );
	self.machine.angles = self.angles;
	self.machine SetModel( self.model );
	self.origin += ( 0, 0, 60 );
	self.script_unitrigger_type = "unitrigger_box_use";
	self.cursor_hint = "HINT_NOICON";
	self.require_look_at = true;
	zm_unitrigger::unitrigger_force_per_player_triggers( self, true );
	self.prompt_and_visibility_func = &buyable_perk_update_prompt;
	zm_unitrigger::register_static_unitrigger( self, &buyable_perk_trigger_think );
}

function buyable_perk_update_prompt( player )
{
	if( !level flag::get( "power_on" ) )
	{
		self SetHintString( &"ZOMBIE_NEED_POWER" );
		return false;
	}

	self SetHintString( &"ZOMBIE_RANDOM_PERK_PICKUP" );
	return true;
}

function buyable_perk_trigger_think()
{
	self endon( "kill_trigger" );
	
	while( true )
	{
		self waittill( "trigger", player );

		player buyable_perk_open_menu();
	}
}

function buyable_perk_close_menu()
{
	self closeInGameMenu();
	self CloseMenu( "BuyablePerk_Main" );
}

function buyable_perk_open_menu()
{
	self buyable_perk_close_menu();
    self OpenMenu( "BuyablePerk_Main" );
}

function buyable_perk_menu_handler()
{
	self endon( "disconnect" );
	self notify( "buyable_perk_menu_handler" );
	self endon( "buyable_perk_menu_handler" );

	while( true )
	{
		self waittill( "menuresponse", menu, response );

		if( !IS_EQUAL( menu, "BuyablePerk_Main" ) )
		{
			continue;
		}

		if( IS_EQUAL( response, "close" ) )
		{
			self buyable_perk_close_menu();
			continue;
		}

		split = strtok( response, "," );
		cost = Int( split[0] );
		perk = STR( split[1] );

		if( self HasPerk( perk ) || self zm_perks::has_perk_paused( perk ) || !self zm_utility::can_player_purchase_perk() )
		{
			self playsound( "zmb_no_cha_ching" );
			self zm_audio::create_and_play_dialog( "general", "sigh" );
			continue;
		}

		if( !self zm_score::can_player_purchase( cost ) )
		{
			self playsound( "zmb_no_cha_ching" );
			self zm_audio::create_and_play_dialog( "general", "outofmoney" );
			continue;
		}

		self playsound( "zmb_cha_ching" );
		self zm_score::minus_to_player_score( cost );
		self.perk_purchased = perk;
		self notify( "perk_purchased", perk );
		self buyable_perk_give( perk );
	}
}

function buyable_perk_give( perk )
{
	self endon( "disconnect" );
	self endon( "perk_abort_drinking" );

	// do the drink animation
	gun = self zm_perks::perk_give_bottle_begin( perk );
	evt = self util::waittill_any_return( "fake_death", "death", "self_downed", "weapon_change_complete", "perk_abort_drinking", "disconnect" );
	
	// once they start drinking they get the perk - if the machine is disabled in mid drink they will have it disabled
	if( evt == "weapon_change_complete" )
	{
		self thread zm_perks::wait_give_perk( perk, true );
	}
	
	// restore self controls and movement
	self zm_perks::perk_give_bottle_end( gun, perk );

	// TODO: race condition?
	if( self laststand::player_is_in_laststand() || IS_TRUE( self.intermission ) )
	{
		return;
	}

	self notify( "burp" );
	
	if( isdefined( level.perk_bought_func ) )
	{
		self [[ level.perk_bought_func ]]( perk );
	}

	self.perk_purchased = undefined;

	// Check If Perk Machine Was Powered Down While Drinking, Is So Pause The Perks
	//-----------------------------------------------------------------------------
	machine_trigger = GetEnt( perk, "script_noteworthy" );

	if( isdefined( machine_trigger ) )
	{
		if( !IS_TRUE( machine_trigger.power_on ) )
		{
			wait( 1 ); 
			zm_perks::perk_pause( perk );
		}
	}
}
