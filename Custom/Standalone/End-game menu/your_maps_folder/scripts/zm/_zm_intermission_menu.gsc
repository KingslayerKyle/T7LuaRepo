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

#using scripts\zm\_zm_audio;

#insert scripts\shared\shared.gsh;
#insert scripts\shared\version.gsh;

#precache( "menu", "Intermission_Main" );

REGISTER_SYSTEM_EX( "zm_intermission_menu", &__init__, &__main__, undefined )

function __init__()
{
}

function __main__()
{
    level.disable_intermission = true;
    callback::on_connect( &on_player_connect );
}

function on_player_connect()
{
    self thread intermission_menu_handler();
}

function intermission_menu_handler()
{
    level waittill( "end_game" );

    if( IS_TRUE( level.host_ended_game ) )
    {
        level.disable_intermission = undefined;
        return;
    }

	level thread zm_audio::sndMusicSystem_PlayState( "game_over" );
	
    array::run_all( level.players, &clientfield::set, "zmbLastStand", 0 );
    
    level clientfield::set( "game_end_time", int( ( GetTime() - level.n_gameplay_start_time + 500 ) / 1000 ) );

	self closeInGameMenu();
	self CloseMenu( "StartMenu_Main" );
    
    wait( 2 );

    self OpenMenu( "Intermission_Main" );
}
