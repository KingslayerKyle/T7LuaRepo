#using scripts\codescripts\struct;

#using scripts\shared\array_shared;
#using scripts\shared\callbacks_shared;
#using scripts\shared\clientfield_shared;
#using scripts\shared\compass;
#using scripts\shared\exploder_shared;
#using scripts\shared\flag_shared;
#using scripts\shared\gameobjects_shared;
#using scripts\shared\math_shared;
#using scripts\shared\scene_shared;
#using scripts\shared\spawner_shared;
#using scripts\shared\system_shared;
#using scripts\shared\util_shared;

#insert scripts\shared\shared.gsh;
#insert scripts\shared\version.gsh;

#precache( "objective", "zm_enemy_waypoint" );

REGISTER_SYSTEM_EX( "zm_minimap", &__init__, &__main__, undefined )

function __init__()
{
}

function __main__()
{
	SetDvar( "compassmaxrange", "1000" );
    
    compass::setupMiniMap( "compass_map_mp_combine" );

    array::thread_all( level.zombie_spawners, &spawner::add_spawn_function, &add_zombie_minimap_waypoint );
}

function add_zombie_minimap_waypoint()
{
    // Add the objective
    enemyObjId = gameobjects::get_next_obj_id();
    objective_add( enemyObjId, "active", self, istring( "zm_enemy_waypoint" ) );

    self util::waittill_any( "death", "entityshutdown" );

    // Delete the objective
    objective_delete( enemyObjId );
    gameobjects::release_obj_id( enemyObjId );
}
