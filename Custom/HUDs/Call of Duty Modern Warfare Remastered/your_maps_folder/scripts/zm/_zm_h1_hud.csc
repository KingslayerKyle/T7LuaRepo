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

REGISTER_SYSTEM_EX( "zm_h1_hud", &__init__, &__main__, undefined )

function __init__()
{
    for( i = 0; i < GetDvarInt( "com_maxclients" ); i++ )
    {
        clientfield::register( "world", "h1_health_" + i, VERSION_SHIP, 7, "float", &set_ui_model_value, !CF_HOST_ONLY, !CF_CALLBACK_ZERO_ON_NEW_ENT );
        clientfield::register( "world", "h1_shield_" + i, VERSION_SHIP, 1, "int", &set_ui_model_value, !CF_HOST_ONLY, !CF_CALLBACK_ZERO_ON_NEW_ENT );
        clientfield::register( "world", "h1_shield_health_" + i, VERSION_SHIP, 7, "float", &set_ui_model_value, !CF_HOST_ONLY, !CF_CALLBACK_ZERO_ON_NEW_ENT );
    }

    clientfield::register( "clientuimodel", "powerup_instant_kill.time", VERSION_SHIP, 8, "int", undefined, !CF_HOST_ONLY, !CF_CALLBACK_ZERO_ON_NEW_ENT );
    clientfield::register( "clientuimodel", "powerup_double_points.time", VERSION_SHIP, 8, "int", undefined, !CF_HOST_ONLY, !CF_CALLBACK_ZERO_ON_NEW_ENT );
    clientfield::register( "clientuimodel", "powerup_fire_sale.time", VERSION_SHIP, 8, "int", undefined, !CF_HOST_ONLY, !CF_CALLBACK_ZERO_ON_NEW_ENT );
    clientfield::register( "clientuimodel", "powerup_mini_gun.time", VERSION_SHIP, 8, "int", undefined, !CF_HOST_ONLY, !CF_CALLBACK_ZERO_ON_NEW_ENT );

    LuiLoad( "ui.uieditor.menus.hud.H1Hud_zm_factory" );
}

function __main__()
{
    callback::on_localplayer_spawned( &on_localplayer_spawned );
}

function on_localplayer_spawned( localClientNum )
{
    self thread set_dw_clip_max( localClientNum );
    self thread set_weapon_class( localClientNum );
}

function set_dw_clip_max( localClientNum )
{
    self endon( "entityshutdown" );
    self endon( "disconnect" );
    self notify( "set_dw_clip_max" );
    self endon( "set_dw_clip_max" );

    controllerModel = GetUIModelForController( localClientNum );
    clipMaxAmmoDWModel = CreateUIModel( controllerModel, "currentWeapon.clipMaxAmmoDW" );

    while( true )
    {
        WAIT_CLIENT_FRAME;

        current_weapon = GetCurrentWeapon( localClientNum );
        clipMaxAmmoDW = current_weapon.dualWieldWeapon.clipSize;

        if( IS_EQUAL( GetUIModelValue( clipMaxAmmoDWModel ), clipMaxAmmoDW ) )
            continue;

        SetUIModelValue( clipMaxAmmoDWModel, clipMaxAmmoDW );
    }
}

function set_weapon_class( localClientNum )
{
    self endon( "entityshutdown" );
    self endon( "disconnect" );
    self notify( "set_weapon_class" );
    self endon( "set_weapon_class" );

    controllerModel = GetUIModelForController( localClientNum );
    weaponClassModel = CreateUIModel( controllerModel, "currentWeapon.weaponClass" );

    while( true )
    {
        WAIT_CLIENT_FRAME;

        current_weapon = GetCurrentWeapon( localClientNum );
        weaponClass = current_weapon.weapClass;

        if( IS_EQUAL( GetUIModelValue( weaponClassModel ), weaponClass ) )
            continue;

        SetUIModelValue( weaponClassModel, weaponClass );
    }
}

function set_ui_model_value( localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump )
{
	SetUIModelValue( CreateUIModel( GetUIModelForController( localClientNum ), fieldName ), newVal );
}
