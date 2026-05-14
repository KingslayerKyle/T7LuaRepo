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

REGISTER_SYSTEM_EX( "zm_t5_hud", &__init__, &__main__, undefined )

function __init__()
{
    // Clientfields
    clientfield::register( "clientuimodel", "t5_mule_kick", VERSION_SHIP, 1, "int", undefined, !CF_HOST_ONLY, !CF_CALLBACK_ZERO_ON_NEW_ENT );

    // Load the menu
    luiload( "ui.uieditor.menus.hud.T5Hud_zm_factory" );

    // Callbacks
    callback::on_localplayer_spawned( &on_localplayer_spawned );
}

function __main__()
{
}

function set_ui_model_value( local_client_num, old_val, new_val, new_ent, initial_snap, field_name, was_time_jump )
{
	setuimodelvalue( createuimodel( getuimodelforcontroller( local_client_num ), field_name ), new_val );
}

function on_localplayer_spawned( local_client_num )
{
    self thread set_stock_max( local_client_num );
    self thread set_dw_clip_max( local_client_num );
}

function set_stock_max( local_client_num )
{
    self endon( "disconnect" );
    self endon( "entityshutdown" );
    self notify( "set_stock_max" );
    self endon( "set_stock_max" );

    controller_model = getuimodelforcontroller( local_client_num );
    ammo_stock_max_model = createuimodel( controller_model, "currentWeapon.ammoStockMax" );

    while( true )
    {
        WAIT_CLIENT_FRAME;

        current_weapon = getcurrentweapon( local_client_num );
        ammo_stock_max = current_weapon.maxammo;

        if( IS_EQUAL( getuimodelvalue( ammo_stock_max_model ), ammo_stock_max ) )
        {
            continue;
        }

        setuimodelvalue( ammo_stock_max_model, ammo_stock_max );
    }
}

function set_dw_clip_max( local_client_num )
{
    self endon( "disconnect" );
    self endon( "entityshutdown" );
    self notify( "set_dw_clip_max" );
    self endon( "set_dw_clip_max" );

    controller_model = getuimodelforcontroller( local_client_num );
    clip_max_ammo_dw_model = createuimodel( controller_model, "currentWeapon.clipMaxAmmoDW" );

    while( true )
    {
        WAIT_CLIENT_FRAME;

        current_weapon = getcurrentweapon( local_client_num );
        clip_max_ammo_dw = current_weapon.dualwieldweapon.clipsize;

        if( IS_EQUAL( getuimodelvalue( clip_max_ammo_dw_model ), clip_max_ammo_dw ) )
        {
            continue;
        }

        setuimodelvalue( clip_max_ammo_dw_model, clip_max_ammo_dw );
    }
}
