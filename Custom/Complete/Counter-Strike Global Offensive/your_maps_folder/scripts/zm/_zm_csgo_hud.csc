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

#insert scripts\shared\shared.gsh;
#insert scripts\shared\version.gsh;

REGISTER_SYSTEM_EX( "zm_csgo_hud", &__init__, &__main__, undefined )

function __init__()
{
    LuiLoad( "ui.uieditor.menus.hud.CSGOHud_zm_factory" );
}

function __main__()
{
    callback::on_localplayer_spawned( &on_localplayer_spawned );
}

function on_localplayer_spawned( localClientNum )
{
    self thread set_health_bar( localClientNum );
}

function set_health_bar( localClientNum )
{
    self endon( "entityshutdown" );
    self endon( "disconnect" );
    self notify( "set_health_bar" );
    self endon( "set_health_bar" );

    controllerModel = GetUIModelForController( localClientNum );
    healthModel = CreateUIModel( controllerModel, "CSGO.Health" );

    while( true )
    {
        WAIT_CLIENT_FRAME;

        health = renderhealthoverlayhealth( localClientNum );

        if( IS_EQUAL( GetUIModelValue( healthModel ), health ) )
            continue;

        SetUIModelValue( healthModel, health );
    }
}
