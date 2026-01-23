require( "ui.uieditor.widgets.DOA.island" )
require( "ui.uieditor.widgets.DOA.mapdot" )

CoD.overworld_map = InheritFrom( LUI.UIElement )
CoD.overworld_map.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.overworld_map )
	self.id = "overworld_map"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, false, 64, 1216 )
	background:setTopBottom( true, false, 36, 684 )
	background:setImage( RegisterImage( "uie_doa_overworld_bg" ) )
	self:addElement( background )
	self.background = background
	
	local chinatown = CoD.island.new( menu, controller )
	chinatown:setLeftRight( true, false, 618.57, 874.57 )
	chinatown:setTopBottom( true, false, 435, 563 )
	chinatown:setScale( 0.7 )
	chinatown.island:setImage( RegisterImage( "uie_chinatown" ) )
	chinatown.islandlit:setImage( RegisterImage( "uie_chinatown_stroke" ) )
	chinatown:mergeStateConditions( {
		{
			stateName = "highlighted",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "DeadOpsArcadeGlobal.level", 9 )
			end
		}
	} )
	chinatown:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( chinatown, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( chinatown )
	self.chinatown = chinatown
	
	local mapdotcavetochina6 = CoD.mapdot.new( menu, controller )
	mapdotcavetochina6:setLeftRight( true, false, 730.57, 746.57 )
	mapdotcavetochina6:setTopBottom( true, false, 540, 556 )
	mapdotcavetochina6:mergeStateConditions( {
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "DeadOpsArcadeGlobal.level", 8 )
			end
		}
	} )
	mapdotcavetochina6:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( mapdotcavetochina6, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( mapdotcavetochina6 )
	self.mapdotcavetochina6 = mapdotcavetochina6
	
	local mapdotcavetochina5 = CoD.mapdot.new( menu, controller )
	mapdotcavetochina5:setLeftRight( true, false, 730.57, 746.57 )
	mapdotcavetochina5:setTopBottom( true, false, 577, 593 )
	mapdotcavetochina5:mergeStateConditions( {
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "DeadOpsArcadeGlobal.level", 8 )
			end
		}
	} )
	mapdotcavetochina5:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( mapdotcavetochina5, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( mapdotcavetochina5 )
	self.mapdotcavetochina5 = mapdotcavetochina5
	
	local mapdotcavetochina4 = CoD.mapdot.new( menu, controller )
	mapdotcavetochina4:setLeftRight( true, false, 685.57, 701.57 )
	mapdotcavetochina4:setTopBottom( true, false, 577, 593 )
	mapdotcavetochina4:mergeStateConditions( {
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "DeadOpsArcadeGlobal.level", 8 )
			end
		}
	} )
	mapdotcavetochina4:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( mapdotcavetochina4, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( mapdotcavetochina4 )
	self.mapdotcavetochina4 = mapdotcavetochina4
	
	local mapdotcavetochina3 = CoD.mapdot.new( menu, controller )
	mapdotcavetochina3:setLeftRight( true, false, 640, 656 )
	mapdotcavetochina3:setTopBottom( true, false, 577, 593 )
	mapdotcavetochina3:mergeStateConditions( {
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "DeadOpsArcadeGlobal.level", 8 )
			end
		}
	} )
	mapdotcavetochina3:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( mapdotcavetochina3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( mapdotcavetochina3 )
	self.mapdotcavetochina3 = mapdotcavetochina3
	
	local mapdotcavetochina1 = CoD.mapdot.new( menu, controller )
	mapdotcavetochina1:setLeftRight( true, false, 595.57, 611.57 )
	mapdotcavetochina1:setTopBottom( true, false, 577, 593 )
	mapdotcavetochina1:mergeStateConditions( {
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "DeadOpsArcadeGlobal.level", 8 )
			end
		}
	} )
	mapdotcavetochina1:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( mapdotcavetochina1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( mapdotcavetochina1 )
	self.mapdotcavetochina1 = mapdotcavetochina1
	
	local mapdotcavetochina0 = CoD.mapdot.new( menu, controller )
	mapdotcavetochina0:setLeftRight( true, false, 553.57, 569.57 )
	mapdotcavetochina0:setTopBottom( true, false, 577, 593 )
	mapdotcavetochina0:mergeStateConditions( {
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "DeadOpsArcadeGlobal.level", 8 )
			end
		}
	} )
	mapdotcavetochina0:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( mapdotcavetochina0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( mapdotcavetochina0 )
	self.mapdotcavetochina0 = mapdotcavetochina0
	
	local cave = CoD.island.new( menu, controller )
	cave:setLeftRight( true, false, 437.57, 693.57 )
	cave:setTopBottom( true, false, 466.5, 594.5 )
	cave:setScale( 0.7 )
	cave.island:setImage( RegisterImage( "uie_cave" ) )
	cave.islandlit:setImage( RegisterImage( "uie_cave_stroke" ) )
	cave:mergeStateConditions( {
		{
			stateName = "highlighted",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "DeadOpsArcadeGlobal.level", 8 )
			end
		}
	} )
	cave:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( cave, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( cave )
	self.cave = cave
	
	local mapdotblood2cave2 = CoD.mapdot.new( menu, controller )
	mapdotblood2cave2:setLeftRight( true, false, 515.57, 531.57 )
	mapdotblood2cave2:setTopBottom( true, false, 483, 499 )
	mapdotblood2cave2:mergeStateConditions( {
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "DeadOpsArcadeGlobal.level", 7 )
			end
		}
	} )
	mapdotblood2cave2:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( mapdotblood2cave2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( mapdotblood2cave2 )
	self.mapdotblood2cave2 = mapdotblood2cave2
	
	local mapdotblood2cave1 = CoD.mapdot.new( menu, controller )
	mapdotblood2cave1:setLeftRight( true, false, 476.57, 492.57 )
	mapdotblood2cave1:setTopBottom( true, false, 447, 463 )
	mapdotblood2cave1:mergeStateConditions( {
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "DeadOpsArcadeGlobal.level", 7 )
			end
		}
	} )
	mapdotblood2cave1:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( mapdotblood2cave1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( mapdotblood2cave1 )
	self.mapdotblood2cave1 = mapdotblood2cave1
	
	local mapdotblood2cave0 = CoD.mapdot.new( menu, controller )
	mapdotblood2cave0:setLeftRight( true, false, 476.57, 492.57 )
	mapdotblood2cave0:setTopBottom( true, false, 483, 499 )
	mapdotblood2cave0:mergeStateConditions( {
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "DeadOpsArcadeGlobal.level", 7 )
			end
		}
	} )
	mapdotblood2cave0:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( mapdotblood2cave0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( mapdotblood2cave0 )
	self.mapdotblood2cave0 = mapdotblood2cave0
	
	local bloodlake = CoD.island.new( menu, controller )
	bloodlake:setLeftRight( true, false, 368.57, 624.57 )
	bloodlake:setTopBottom( true, false, 335, 463 )
	bloodlake:setScale( 0.7 )
	bloodlake.island:setImage( RegisterImage( "uie_bloodlake" ) )
	bloodlake.islandlit:setImage( RegisterImage( "uie_bloodlake_strokecopy" ) )
	bloodlake:mergeStateConditions( {
		{
			stateName = "highlighted",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "DeadOpsArcadeGlobal.level", 7 )
			end
		}
	} )
	bloodlake:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( bloodlake, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( bloodlake )
	self.bloodlake = bloodlake
	
	local mapdotsafe2blood3 = CoD.mapdot.new( menu, controller )
	mapdotsafe2blood3:setLeftRight( true, false, 618.57, 634.57 )
	mapdotsafe2blood3:setTopBottom( true, false, 371, 387 )
	mapdotsafe2blood3:mergeStateConditions( {
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "DeadOpsArcadeGlobal.level", 6 )
			end
		}
	} )
	mapdotsafe2blood3:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( mapdotsafe2blood3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( mapdotsafe2blood3 )
	self.mapdotsafe2blood3 = mapdotsafe2blood3
	
	local mapdotsafe2blood2 = CoD.mapdot.new( menu, controller )
	mapdotsafe2blood2:setLeftRight( true, false, 582.57, 598.57 )
	mapdotsafe2blood2:setTopBottom( true, false, 371, 387 )
	mapdotsafe2blood2:mergeStateConditions( {
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "DeadOpsArcadeGlobal.level", 6 )
			end
		}
	} )
	mapdotsafe2blood2:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( mapdotsafe2blood2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( mapdotsafe2blood2 )
	self.mapdotsafe2blood2 = mapdotsafe2blood2
	
	local mapdotsafe2blood1 = CoD.mapdot.new( menu, controller )
	mapdotsafe2blood1:setLeftRight( true, false, 618.57, 630.57 )
	mapdotsafe2blood1:setTopBottom( true, false, 337, 353 )
	mapdotsafe2blood1:mergeStateConditions( {
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "DeadOpsArcadeGlobal.level", 6 )
			end
		}
	} )
	mapdotsafe2blood1:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( mapdotsafe2blood1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( mapdotsafe2blood1 )
	self.mapdotsafe2blood1 = mapdotsafe2blood1
	
	local mapdotsafe2blood0 = CoD.mapdot.new( menu, controller )
	mapdotsafe2blood0:setLeftRight( true, false, 618.57, 634.57 )
	mapdotsafe2blood0:setTopBottom( true, false, 303, 319 )
	mapdotsafe2blood0:mergeStateConditions( {
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "DeadOpsArcadeGlobal.level", 6 )
			end
		}
	} )
	mapdotsafe2blood0:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( mapdotsafe2blood0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( mapdotsafe2blood0 )
	self.mapdotsafe2blood0 = mapdotsafe2blood0
	
	local safehouse = CoD.island.new( menu, controller )
	safehouse:setLeftRight( true, false, 437.57, 693.57 )
	safehouse:setTopBottom( true, false, 217, 345 )
	safehouse:setScale( 0.7 )
	safehouse.island:setImage( RegisterImage( "uie_safehouse" ) )
	safehouse.islandlit:setImage( RegisterImage( "uie_safehouse_stroke" ) )
	safehouse:mergeStateConditions( {
		{
			stateName = "highlighted",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "DeadOpsArcadeGlobal.level", 6 )
			end
		}
	} )
	safehouse:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( safehouse, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( safehouse )
	self.safehouse = safehouse
	
	local mapdottemple2safe2 = CoD.mapdot.new( menu, controller )
	mapdottemple2safe2:setLeftRight( true, false, 587.57, 603.57 )
	mapdottemple2safe2:setTopBottom( true, false, 225, 241 )
	mapdottemple2safe2:mergeStateConditions( {
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "DeadOpsArcadeGlobal.level", 5 )
			end
		}
	} )
	mapdottemple2safe2:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( mapdottemple2safe2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( mapdottemple2safe2 )
	self.mapdottemple2safe2 = mapdottemple2safe2
	
	local mapdottemple2safe1 = CoD.mapdot.new( menu, controller )
	mapdottemple2safe1:setLeftRight( true, false, 587.57, 603.57 )
	mapdottemple2safe1:setTopBottom( true, false, 189, 205 )
	mapdottemple2safe1:mergeStateConditions( {
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "DeadOpsArcadeGlobal.level", 5 )
			end
		}
	} )
	mapdottemple2safe1:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( mapdottemple2safe1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( mapdottemple2safe1 )
	self.mapdottemple2safe1 = mapdottemple2safe1
	
	local mapdottemple2safe0 = CoD.mapdot.new( menu, controller )
	mapdottemple2safe0:setLeftRight( true, false, 587.57, 603.57 )
	mapdottemple2safe0:setTopBottom( true, false, 156, 172 )
	mapdottemple2safe0:mergeStateConditions( {
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "DeadOpsArcadeGlobal.level", 5 )
			end
		}
	} )
	mapdottemple2safe0:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( mapdottemple2safe0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( mapdottemple2safe0 )
	self.mapdottemple2safe0 = mapdottemple2safe0
	
	local temple = CoD.island.new( menu, controller )
	temple:setLeftRight( true, false, 403.57, 659.57 )
	temple:setTopBottom( true, false, 44, 172 )
	temple:setScale( 0.9 )
	temple.island:setImage( RegisterImage( "uie_temple" ) )
	temple.islandlit:setImage( RegisterImage( "uie_temple_stroke" ) )
	temple:mergeStateConditions( {
		{
			stateName = "highlighted",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "DeadOpsArcadeGlobal.level", 5 )
			end
		}
	} )
	temple:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( temple, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( temple )
	self.temple = temple
	
	local mapdotfgrave2temple4 = CoD.mapdot.new( menu, controller )
	mapdotfgrave2temple4:setLeftRight( true, false, 444.57, 460.57 )
	mapdotfgrave2temple4:setTopBottom( true, false, 54, 70 )
	mapdotfgrave2temple4:mergeStateConditions( {
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "DeadOpsArcadeGlobal.level", 4 )
			end
		}
	} )
	mapdotfgrave2temple4:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( mapdotfgrave2temple4, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( mapdotfgrave2temple4 )
	self.mapdotfgrave2temple4 = mapdotfgrave2temple4
	
	local mapdotfgrave2temple3 = CoD.mapdot.new( menu, controller )
	mapdotfgrave2temple3:setLeftRight( true, false, 403.57, 419.57 )
	mapdotfgrave2temple3:setTopBottom( true, false, 54, 70 )
	mapdotfgrave2temple3:mergeStateConditions( {
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "DeadOpsArcadeGlobal.level", 4 )
			end
		}
	} )
	mapdotfgrave2temple3:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( mapdotfgrave2temple3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( mapdotfgrave2temple3 )
	self.mapdotfgrave2temple3 = mapdotfgrave2temple3
	
	local mapdotfgrave2temple2 = CoD.mapdot.new( menu, controller )
	mapdotfgrave2temple2:setLeftRight( true, false, 365.57, 381.57 )
	mapdotfgrave2temple2:setTopBottom( true, false, 54, 70 )
	mapdotfgrave2temple2:mergeStateConditions( {
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "DeadOpsArcadeGlobal.level", 4 )
			end
		}
	} )
	mapdotfgrave2temple2:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( mapdotfgrave2temple2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( mapdotfgrave2temple2 )
	self.mapdotfgrave2temple2 = mapdotfgrave2temple2
	
	local mapdotfgrave2temple1 = CoD.mapdot.new( menu, controller )
	mapdotfgrave2temple1:setLeftRight( true, false, 324.57, 340.57 )
	mapdotfgrave2temple1:setTopBottom( true, false, 54, 70 )
	mapdotfgrave2temple1:mergeStateConditions( {
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "DeadOpsArcadeGlobal.level", 4 )
			end
		}
	} )
	mapdotfgrave2temple1:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( mapdotfgrave2temple1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( mapdotfgrave2temple1 )
	self.mapdotfgrave2temple1 = mapdotfgrave2temple1
	
	local mapdotfgrave2temple0 = CoD.mapdot.new( menu, controller )
	mapdotfgrave2temple0:setLeftRight( true, false, 324.57, 340.57 )
	mapdotfgrave2temple0:setTopBottom( true, false, 85, 101 )
	mapdotfgrave2temple0:mergeStateConditions( {
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "DeadOpsArcadeGlobal.level", 4 )
			end
		}
	} )
	mapdotfgrave2temple0:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( mapdotfgrave2temple0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( mapdotfgrave2temple0 )
	self.mapdotfgrave2temple0 = mapdotfgrave2temple0
	
	local graveyard = CoD.island.new( menu, controller )
	graveyard:setLeftRight( true, false, 156.57, 412.57 )
	graveyard:setTopBottom( true, false, 70, 198 )
	graveyard:setScale( 0.6 )
	graveyard.island:setImage( RegisterImage( "uie_graveyard" ) )
	graveyard.islandlit:setImage( RegisterImage( "uie_graveyard_stroke" ) )
	graveyard:mergeStateConditions( {
		{
			stateName = "highlighted",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "DeadOpsArcadeGlobal.level", 4 )
			end
		}
	} )
	graveyard:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( graveyard, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( graveyard )
	self.graveyard = graveyard
	
	local mapdotfarmtograve3 = CoD.mapdot.new( menu, controller )
	mapdotfarmtograve3:setLeftRight( true, false, 230.57, 246.57 )
	mapdotfarmtograve3:setTopBottom( true, false, 172, 188 )
	mapdotfarmtograve3:mergeStateConditions( {
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "DeadOpsArcadeGlobal.level", 3 )
			end
		}
	} )
	mapdotfarmtograve3:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( mapdotfarmtograve3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( mapdotfarmtograve3 )
	self.mapdotfarmtograve3 = mapdotfarmtograve3
	
	local mapdotfarmtograve2 = CoD.mapdot.new( menu, controller )
	mapdotfarmtograve2:setLeftRight( true, false, 230.57, 246.57 )
	mapdotfarmtograve2:setTopBottom( true, false, 209, 225 )
	mapdotfarmtograve2:mergeStateConditions( {
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "DeadOpsArcadeGlobal.level", 3 )
			end
		}
	} )
	mapdotfarmtograve2:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( mapdotfarmtograve2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( mapdotfarmtograve2 )
	self.mapdotfarmtograve2 = mapdotfarmtograve2
	
	local mapdotfarmtograve1 = CoD.mapdot.new( menu, controller )
	mapdotfarmtograve1:setLeftRight( true, false, 230.57, 246.57 )
	mapdotfarmtograve1:setTopBottom( true, false, 247, 263 )
	mapdotfarmtograve1:mergeStateConditions( {
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "DeadOpsArcadeGlobal.level", 3 )
			end
		}
	} )
	mapdotfarmtograve1:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( mapdotfarmtograve1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( mapdotfarmtograve1 )
	self.mapdotfarmtograve1 = mapdotfarmtograve1
	
	local mapdotfarmtograve0 = CoD.mapdot.new( menu, controller )
	mapdotfarmtograve0:setLeftRight( true, false, 268.57, 284.57 )
	mapdotfarmtograve0:setTopBottom( true, false, 247, 271 )
	mapdotfarmtograve0:mergeStateConditions( {
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "DeadOpsArcadeGlobal.level", 3 )
			end
		}
	} )
	mapdotfarmtograve0:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( mapdotfarmtograve0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( mapdotfarmtograve0 )
	self.mapdotfarmtograve0 = mapdotfarmtograve0
	
	local farm = CoD.island.new( menu, controller )
	farm:setLeftRight( true, false, 247.57, 503.57 )
	farm:setTopBottom( true, false, 207, 335 )
	farm:setScale( 0.7 )
	farm.island:setImage( RegisterImage( "uie_farm" ) )
	farm.islandlit:setImage( RegisterImage( "uie_farm_stroke" ) )
	farm:mergeStateConditions( {
		{
			stateName = "highlighted",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "DeadOpsArcadeGlobal.level", 3 )
			end
		}
	} )
	farm:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( farm, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( farm )
	self.farm = farm
	
	local mapdotdock2farm2 = CoD.mapdot.new( menu, controller )
	mapdotdock2farm2:setLeftRight( true, false, 378.57, 394.57 )
	mapdotdock2farm2:setTopBottom( true, false, 319, 335 )
	mapdotdock2farm2:mergeStateConditions( {
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "DeadOpsArcadeGlobal.level", 2 )
			end
		}
	} )
	mapdotdock2farm2:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( mapdotdock2farm2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( mapdotdock2farm2 )
	self.mapdotdock2farm2 = mapdotdock2farm2
	
	local mapdotdock2farm1 = CoD.mapdot.new( menu, controller )
	mapdotdock2farm1:setLeftRight( true, false, 378.57, 394.57 )
	mapdotdock2farm1:setTopBottom( true, false, 352, 368 )
	mapdotdock2farm1:mergeStateConditions( {
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "DeadOpsArcadeGlobal.level", 2 )
			end
		}
	} )
	mapdotdock2farm1:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( mapdotdock2farm1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( mapdotdock2farm1 )
	self.mapdotdock2farm1 = mapdotdock2farm1
	
	local mapdotdock2farm0 = CoD.mapdot.new( menu, controller )
	mapdotdock2farm0:setLeftRight( true, false, 340.57, 356.57 )
	mapdotdock2farm0:setTopBottom( true, false, 352, 368 )
	mapdotdock2farm0:mergeStateConditions( {
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "DeadOpsArcadeGlobal.level", 2 )
			end
		}
	} )
	mapdotdock2farm0:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( mapdotdock2farm0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( mapdotdock2farm0 )
	self.mapdotdock2farm0 = mapdotdock2farm0
	
	local dock = CoD.island.new( menu, controller )
	dock:setLeftRight( true, false, 119.57, 375.57 )
	dock:setTopBottom( true, false, 325, 453 )
	dock:setScale( 0.7 )
	dock.island:setImage( RegisterImage( "uie_dock" ) )
	dock.islandlit:setImage( RegisterImage( "uie_dock_stroke" ) )
	dock:mergeStateConditions( {
		{
			stateName = "highlighted",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "DeadOpsArcadeGlobal.level", 2 )
			end
		}
	} )
	dock:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( dock, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( dock )
	self.dock = dock
	
	local mapdotisland2dock3 = CoD.mapdot.new( menu, controller )
	mapdotisland2dock3:setLeftRight( true, false, 257.57, 273.57 )
	mapdotisland2dock3:setTopBottom( true, false, 415.5, 431.5 )
	mapdotisland2dock3:mergeStateConditions( {
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "DeadOpsArcadeGlobal.level", 1 )
			end
		}
	} )
	mapdotisland2dock3:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( mapdotisland2dock3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( mapdotisland2dock3 )
	self.mapdotisland2dock3 = mapdotisland2dock3
	
	local mapdotisland2dock2 = CoD.mapdot.new( menu, controller )
	mapdotisland2dock2:setLeftRight( true, false, 257.57, 273.57 )
	mapdotisland2dock2:setTopBottom( true, false, 447.5, 466.5 )
	mapdotisland2dock2:mergeStateConditions( {
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "DeadOpsArcadeGlobal.level", 1 )
			end
		}
	} )
	mapdotisland2dock2:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( mapdotisland2dock2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( mapdotisland2dock2 )
	self.mapdotisland2dock2 = mapdotisland2dock2
	
	local mapdotisland2dock1 = CoD.mapdot.new( menu, controller )
	mapdotisland2dock1:setLeftRight( true, false, 257.57, 273.57 )
	mapdotisland2dock1:setTopBottom( true, false, 483, 499 )
	mapdotisland2dock1:mergeStateConditions( {
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "DeadOpsArcadeGlobal.level", 1 )
			end
		}
	} )
	mapdotisland2dock1:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( mapdotisland2dock1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( mapdotisland2dock1 )
	self.mapdotisland2dock1 = mapdotisland2dock1
	
	local mapdotisland2dock0 = CoD.mapdot.new( menu, controller )
	mapdotisland2dock0:setLeftRight( true, false, 257.57, 273.57 )
	mapdotisland2dock0:setTopBottom( true, false, 515.5, 531.5 )
	mapdotisland2dock0:mergeStateConditions( {
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "DeadOpsArcadeGlobal.level", 1 )
			end
		}
	} )
	mapdotisland2dock0:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( mapdotisland2dock0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( mapdotisland2dock0 )
	self.mapdotisland2dock0 = mapdotisland2dock0
	
	local island = CoD.island.new( menu, controller )
	island:setLeftRight( true, false, 127.57, 349.57 )
	island:setTopBottom( true, false, 508, 646 )
	island:setScale( 0.8 )
	island:mergeStateConditions( {
		{
			stateName = "highlighted",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "DeadOpsArcadeGlobal.level", 1 )
			end
		}
	} )
	island:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( island, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( island )
	self.island = island
	
	local sgen = CoD.island.new( menu, controller )
	sgen:setLeftRight( true, false, 648, 904 )
	sgen:setTopBottom( true, false, 315, 443 )
	sgen:setScale( 0.6 )
	sgen.island:setImage( RegisterImage( "uie_silo" ) )
	sgen.islandlit:setImage( RegisterImage( "uie_silo_stroke" ) )
	sgen:mergeStateConditions( {
		{
			stateName = "highlighted",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "DeadOpsArcadeGlobal.level", 10 )
			end
		}
	} )
	sgen:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( sgen, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( sgen )
	self.sgen = sgen
	
	local mapdotchina2sgen0 = CoD.mapdot.new( menu, controller )
	mapdotchina2sgen0:setLeftRight( true, false, 829.57, 845.57 )
	mapdotchina2sgen0:setTopBottom( true, false, 470.5, 486.5 )
	mapdotchina2sgen0:mergeStateConditions( {
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "DeadOpsArcadeGlobal.level", 9 )
			end
		}
	} )
	mapdotchina2sgen0:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( mapdotchina2sgen0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( mapdotchina2sgen0 )
	self.mapdotchina2sgen0 = mapdotchina2sgen0
	
	local mapdotchina2sgen1 = CoD.mapdot.new( menu, controller )
	mapdotchina2sgen1:setLeftRight( true, false, 829.57, 845.57 )
	mapdotchina2sgen1:setTopBottom( true, false, 438, 454 )
	mapdotchina2sgen1:mergeStateConditions( {
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "DeadOpsArcadeGlobal.level", 9 )
			end
		}
	} )
	mapdotchina2sgen1:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( mapdotchina2sgen1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( mapdotchina2sgen1 )
	self.mapdotchina2sgen1 = mapdotchina2sgen1
	
	local mapdotchina2sgen2 = CoD.mapdot.new( menu, controller )
	mapdotchina2sgen2:setLeftRight( true, false, 829.57, 845.57 )
	mapdotchina2sgen2:setTopBottom( true, false, 406.5, 422.5 )
	mapdotchina2sgen2:mergeStateConditions( {
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "DeadOpsArcadeGlobal.level", 9 )
			end
		}
	} )
	mapdotchina2sgen2:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( mapdotchina2sgen2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( mapdotchina2sgen2 )
	self.mapdotchina2sgen2 = mapdotchina2sgen2
	
	local apartments = CoD.island.new( menu, controller )
	apartments:setLeftRight( true, false, 634.57, 890.57 )
	apartments:setTopBottom( true, false, 195, 323 )
	apartments:setScale( 0.6 )
	apartments.island:setImage( RegisterImage( "uie_apartments" ) )
	apartments.islandlit:setImage( RegisterImage( "uie_apartments_stroke" ) )
	apartments:mergeStateConditions( {
		{
			stateName = "highlighted",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "DeadOpsArcadeGlobal.level", 11 )
			end
		}
	} )
	apartments:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( apartments, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( apartments )
	self.apartments = apartments
	
	local mapdotsgen2apartment0 = CoD.mapdot.new( menu, controller )
	mapdotsgen2apartment0:setLeftRight( true, false, 693.57, 709.57 )
	mapdotsgen2apartment0:setTopBottom( true, false, 337, 353 )
	mapdotsgen2apartment0:mergeStateConditions( {
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "DeadOpsArcadeGlobal.level", 10 )
			end
		}
	} )
	mapdotsgen2apartment0:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( mapdotsgen2apartment0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( mapdotsgen2apartment0 )
	self.mapdotsgen2apartment0 = mapdotsgen2apartment0
	
	local mapdotsgen2apartment1 = CoD.mapdot.new( menu, controller )
	mapdotsgen2apartment1:setLeftRight( true, false, 693.57, 709.57 )
	mapdotsgen2apartment1:setTopBottom( true, false, 303, 319 )
	mapdotsgen2apartment1:mergeStateConditions( {
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "DeadOpsArcadeGlobal.level", 10 )
			end
		}
	} )
	mapdotsgen2apartment1:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( mapdotsgen2apartment1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( mapdotsgen2apartment1 )
	self.mapdotsgen2apartment1 = mapdotsgen2apartment1
	
	local mapdotsgen2apartment2 = CoD.mapdot.new( menu, controller )
	mapdotsgen2apartment2:setLeftRight( true, false, 693.57, 709.57 )
	mapdotsgen2apartment2:setTopBottom( true, false, 273, 289 )
	mapdotsgen2apartment2:mergeStateConditions( {
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "DeadOpsArcadeGlobal.level", 10 )
			end
		}
	} )
	mapdotsgen2apartment2:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( mapdotsgen2apartment2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( mapdotsgen2apartment2 )
	self.mapdotsgen2apartment2 = mapdotsgen2apartment2
	
	local sector = CoD.island.new( menu, controller )
	sector:setLeftRight( true, false, 654.57, 910.57 )
	sector:setTopBottom( true, false, 20, 148 )
	sector:setScale( 0.6 )
	sector.island:setImage( RegisterImage( "uie_sector" ) )
	sector.islandlit:setImage( RegisterImage( "uie_sector_stroke" ) )
	sector:mergeStateConditions( {
		{
			stateName = "highlighted",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "DeadOpsArcadeGlobal.level", 12 )
			end
		}
	} )
	sector:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( sector, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( sector )
	self.sector = sector
	
	local mapdotapartment2sector0 = CoD.mapdot.new( menu, controller )
	mapdotapartment2sector0:setLeftRight( true, false, 760, 776 )
	mapdotapartment2sector0:setTopBottom( true, false, 199, 215 )
	mapdotapartment2sector0:mergeStateConditions( {
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "DeadOpsArcadeGlobal.level", 11 )
			end
		}
	} )
	mapdotapartment2sector0:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( mapdotapartment2sector0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( mapdotapartment2sector0 )
	self.mapdotapartment2sector0 = mapdotapartment2sector0
	
	local mapdotapartment2sector00 = CoD.mapdot.new( menu, controller )
	mapdotapartment2sector00:setLeftRight( true, false, 759.57, 775.57 )
	mapdotapartment2sector00:setTopBottom( true, false, 165, 181 )
	mapdotapartment2sector00:mergeStateConditions( {
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "DeadOpsArcadeGlobal.level", 11 )
			end
		}
	} )
	mapdotapartment2sector00:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( mapdotapartment2sector00, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( mapdotapartment2sector00 )
	self.mapdotapartment2sector00 = mapdotapartment2sector00
	
	local mapdotapartment2sector01 = CoD.mapdot.new( menu, controller )
	mapdotapartment2sector01:setLeftRight( true, false, 794.57, 810.57 )
	mapdotapartment2sector01:setTopBottom( true, false, 164, 180 )
	mapdotapartment2sector01:mergeStateConditions( {
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "DeadOpsArcadeGlobal.level", 11 )
			end
		}
	} )
	mapdotapartment2sector01:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( mapdotapartment2sector01, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( mapdotapartment2sector01 )
	self.mapdotapartment2sector01 = mapdotapartment2sector01
	
	local mapdotapartment2sector02 = CoD.mapdot.new( menu, controller )
	mapdotapartment2sector02:setLeftRight( true, false, 829.57, 845.57 )
	mapdotapartment2sector02:setTopBottom( true, false, 164, 180 )
	mapdotapartment2sector02:mergeStateConditions( {
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "DeadOpsArcadeGlobal.level", 11 )
			end
		}
	} )
	mapdotapartment2sector02:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( mapdotapartment2sector02, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( mapdotapartment2sector02 )
	self.mapdotapartment2sector02 = mapdotapartment2sector02
	
	local mapdotapartment2sector03 = CoD.mapdot.new( menu, controller )
	mapdotapartment2sector03:setLeftRight( true, false, 829.57, 845.57 )
	mapdotapartment2sector03:setTopBottom( true, false, 134, 150 )
	mapdotapartment2sector03:mergeStateConditions( {
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "DeadOpsArcadeGlobal.level", 11 )
			end
		}
	} )
	mapdotapartment2sector03:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( mapdotapartment2sector03, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( mapdotapartment2sector03 )
	self.mapdotapartment2sector03 = mapdotapartment2sector03
	
	local mapdotapartment2sector04 = CoD.mapdot.new( menu, controller )
	mapdotapartment2sector04:setLeftRight( true, false, 829.57, 845.57 )
	mapdotapartment2sector04:setTopBottom( true, false, 101, 117 )
	mapdotapartment2sector04:mergeStateConditions( {
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "DeadOpsArcadeGlobal.level", 11 )
			end
		}
	} )
	mapdotapartment2sector04:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( mapdotapartment2sector04, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( mapdotapartment2sector04 )
	self.mapdotapartment2sector04 = mapdotapartment2sector04
	
	local metro = CoD.island.new( menu, controller )
	metro:setLeftRight( true, false, 910.57, 1166.57 )
	metro:setTopBottom( true, false, 14, 142 )
	metro:setScale( 0.6 )
	metro.island:setImage( RegisterImage( "uie_metro" ) )
	metro.islandlit:setImage( RegisterImage( "uie_metro_stroke" ) )
	metro:mergeStateConditions( {
		{
			stateName = "highlighted",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "DeadOpsArcadeGlobal.level", 13 )
			end
		}
	} )
	metro:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( metro, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( metro )
	self.metro = metro
	
	local mapdotsector2metro0 = CoD.mapdot.new( menu, controller )
	mapdotsector2metro0:setLeftRight( true, false, 850.57, 866.57 )
	mapdotsector2metro0:setTopBottom( true, false, 46, 62 )
	mapdotsector2metro0:mergeStateConditions( {
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "DeadOpsArcadeGlobal.level", 12 )
			end
		}
	} )
	mapdotsector2metro0:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( mapdotsector2metro0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( mapdotsector2metro0 )
	self.mapdotsector2metro0 = mapdotsector2metro0
	
	local mapdotsector2metro00 = CoD.mapdot.new( menu, controller )
	mapdotsector2metro00:setLeftRight( true, false, 883.57, 899.57 )
	mapdotsector2metro00:setTopBottom( true, false, 46, 62 )
	mapdotsector2metro00:mergeStateConditions( {
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "DeadOpsArcadeGlobal.level", 12 )
			end
		}
	} )
	mapdotsector2metro00:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( mapdotsector2metro00, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( mapdotsector2metro00 )
	self.mapdotsector2metro00 = mapdotsector2metro00
	
	local mapdotsector2metro01 = CoD.mapdot.new( menu, controller )
	mapdotsector2metro01:setLeftRight( true, false, 916.57, 932.57 )
	mapdotsector2metro01:setTopBottom( true, false, 46, 62 )
	mapdotsector2metro01:mergeStateConditions( {
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "DeadOpsArcadeGlobal.level", 12 )
			end
		}
	} )
	mapdotsector2metro01:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( mapdotsector2metro01, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( mapdotsector2metro01 )
	self.mapdotsector2metro01 = mapdotsector2metro01
	
	local mapdotsector2metro02 = CoD.mapdot.new( menu, controller )
	mapdotsector2metro02:setLeftRight( true, false, 950.57, 966.57 )
	mapdotsector2metro02:setTopBottom( true, false, 46, 62 )
	mapdotsector2metro02:mergeStateConditions( {
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "DeadOpsArcadeGlobal.level", 12 )
			end
		}
	} )
	mapdotsector2metro02:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( mapdotsector2metro02, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( mapdotsector2metro02 )
	self.mapdotsector2metro02 = mapdotsector2metro02
	
	local clearing = CoD.island.new( menu, controller )
	clearing:setLeftRight( true, false, 822.57, 1078.57 )
	clearing:setTopBottom( true, false, 124, 252 )
	clearing:setScale( 0.8 )
	clearing.island:setImage( RegisterImage( "uie_clearing" ) )
	clearing.islandlit:setImage( RegisterImage( "uie_clearing_stroke" ) )
	clearing:mergeStateConditions( {
		{
			stateName = "highlighted",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "DeadOpsArcadeGlobal.level", 14 )
			end
		}
	} )
	clearing:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( clearing, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( clearing )
	self.clearing = clearing
	
	local mapdotmetro2clearing = CoD.mapdot.new( menu, controller )
	mapdotmetro2clearing:setLeftRight( true, false, 1070.57, 1086.57 )
	mapdotmetro2clearing:setTopBottom( true, false, 100, 116 )
	mapdotmetro2clearing:mergeStateConditions( {
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "DeadOpsArcadeGlobal.level", 13 )
			end
		}
	} )
	mapdotmetro2clearing:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( mapdotmetro2clearing, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( mapdotmetro2clearing )
	self.mapdotmetro2clearing = mapdotmetro2clearing
	
	local mapdotmetro2clearing0 = CoD.mapdot.new( menu, controller )
	mapdotmetro2clearing0:setLeftRight( true, false, 1070.57, 1086.57 )
	mapdotmetro2clearing0:setTopBottom( true, false, 126, 142 )
	mapdotmetro2clearing0:mergeStateConditions( {
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "DeadOpsArcadeGlobal.level", 13 )
			end
		}
	} )
	mapdotmetro2clearing0:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( mapdotmetro2clearing0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( mapdotmetro2clearing0 )
	self.mapdotmetro2clearing0 = mapdotmetro2clearing0
	
	local mapdotmetro2clearing1 = CoD.mapdot.new( menu, controller )
	mapdotmetro2clearing1:setLeftRight( true, false, 1070.57, 1086.57 )
	mapdotmetro2clearing1:setTopBottom( true, false, 156, 172 )
	mapdotmetro2clearing1:mergeStateConditions( {
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "DeadOpsArcadeGlobal.level", 13 )
			end
		}
	} )
	mapdotmetro2clearing1:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( mapdotmetro2clearing1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( mapdotmetro2clearing1 )
	self.mapdotmetro2clearing1 = mapdotmetro2clearing1
	
	local mapdotmetro2clearing2 = CoD.mapdot.new( menu, controller )
	mapdotmetro2clearing2:setLeftRight( true, false, 1038.57, 1054.57 )
	mapdotmetro2clearing2:setTopBottom( true, false, 156, 172 )
	mapdotmetro2clearing2:mergeStateConditions( {
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "DeadOpsArcadeGlobal.level", 13 )
			end
		}
	} )
	mapdotmetro2clearing2:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( mapdotmetro2clearing2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( mapdotmetro2clearing2 )
	self.mapdotmetro2clearing2 = mapdotmetro2clearing2
	
	local mapdotmetro2clearing3 = CoD.mapdot.new( menu, controller )
	mapdotmetro2clearing3:setLeftRight( true, false, 1003.57, 1019.57 )
	mapdotmetro2clearing3:setTopBottom( true, false, 157, 173 )
	mapdotmetro2clearing3:mergeStateConditions( {
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "DeadOpsArcadeGlobal.level", 13 )
			end
		}
	} )
	mapdotmetro2clearing3:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( mapdotmetro2clearing3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( mapdotmetro2clearing3 )
	self.mapdotmetro2clearing3 = mapdotmetro2clearing3
	
	local newworld = CoD.island.new( menu, controller )
	newworld:setLeftRight( true, false, 875.57, 1131.57 )
	newworld:setTopBottom( true, false, 281, 409 )
	newworld:setScale( 0.9 )
	newworld.island:setImage( RegisterImage( "uie_newworld" ) )
	newworld.islandlit:setImage( RegisterImage( "uie_newworld_stroke" ) )
	newworld:mergeStateConditions( {
		{
			stateName = "highlighted",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "DeadOpsArcadeGlobal.level", 15 )
			end
		}
	} )
	newworld:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( newworld, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( newworld )
	self.newworld = newworld
	
	local mapdotclearingtonewworld0 = CoD.mapdot.new( menu, controller )
	mapdotclearingtonewworld0:setLeftRight( true, false, 904, 920 )
	mapdotclearingtonewworld0:setTopBottom( true, false, 233, 249 )
	mapdotclearingtonewworld0:mergeStateConditions( {
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "DeadOpsArcadeGlobal.level", 14 )
			end
		}
	} )
	mapdotclearingtonewworld0:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( mapdotclearingtonewworld0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( mapdotclearingtonewworld0 )
	self.mapdotclearingtonewworld0 = mapdotclearingtonewworld0
	
	local mapdotclearingtonewworld1 = CoD.mapdot.new( menu, controller )
	mapdotclearingtonewworld1:setLeftRight( true, false, 904, 920 )
	mapdotclearingtonewworld1:setTopBottom( true, false, 265, 281 )
	mapdotclearingtonewworld1:mergeStateConditions( {
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "DeadOpsArcadeGlobal.level", 14 )
			end
		}
	} )
	mapdotclearingtonewworld1:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( mapdotclearingtonewworld1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( mapdotclearingtonewworld1 )
	self.mapdotclearingtonewworld1 = mapdotclearingtonewworld1
	
	local mapdotclearingtonewworld2 = CoD.mapdot.new( menu, controller )
	mapdotclearingtonewworld2:setLeftRight( true, false, 904, 920 )
	mapdotclearingtonewworld2:setTopBottom( true, false, 299, 315 )
	mapdotclearingtonewworld2:mergeStateConditions( {
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "DeadOpsArcadeGlobal.level", 14 )
			end
		}
	} )
	mapdotclearingtonewworld2:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( mapdotclearingtonewworld2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( mapdotclearingtonewworld2 )
	self.mapdotclearingtonewworld2 = mapdotclearingtonewworld2
	
	local silverback = CoD.island.new( menu, controller )
	silverback:setLeftRight( true, false, 858.57, 1114.57 )
	silverback:setTopBottom( true, false, 435, 563 )
	silverback:setScale( 1 )
	silverback.island:setImage( RegisterImage( "uie_final_stage" ) )
	silverback.islandlit:setImage( RegisterImage( "uie_final_stage_stroke" ) )
	silverback:mergeStateConditions( {
		{
			stateName = "highlighted",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "DeadOpsArcadeGlobal.level", 16 )
			end
		}
	} )
	silverback:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( silverback, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( silverback )
	self.silverback = silverback
	
	local mapdotnewworld2silverback0 = CoD.mapdot.new( menu, controller )
	mapdotnewworld2silverback0:setLeftRight( true, false, 1095, 1111 )
	mapdotnewworld2silverback0:setTopBottom( true, false, 387, 403 )
	mapdotnewworld2silverback0:mergeStateConditions( {
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "DeadOpsArcadeGlobal.level", 15 )
			end
		}
	} )
	mapdotnewworld2silverback0:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( mapdotnewworld2silverback0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( mapdotnewworld2silverback0 )
	self.mapdotnewworld2silverback0 = mapdotnewworld2silverback0
	
	local mapdotnewworld2silverback1 = CoD.mapdot.new( menu, controller )
	mapdotnewworld2silverback1:setLeftRight( true, false, 1095, 1111 )
	mapdotnewworld2silverback1:setTopBottom( true, false, 415.5, 431.5 )
	mapdotnewworld2silverback1:mergeStateConditions( {
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "DeadOpsArcadeGlobal.level", 15 )
			end
		}
	} )
	mapdotnewworld2silverback1:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( mapdotnewworld2silverback1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( mapdotnewworld2silverback1 )
	self.mapdotnewworld2silverback1 = mapdotnewworld2silverback1
	
	local mapdotnewworld2silverback2 = CoD.mapdot.new( menu, controller )
	mapdotnewworld2silverback2:setLeftRight( true, false, 1095, 1111 )
	mapdotnewworld2silverback2:setTopBottom( true, false, 447, 463 )
	mapdotnewworld2silverback2:mergeStateConditions( {
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "DeadOpsArcadeGlobal.level", 15 )
			end
		}
	} )
	mapdotnewworld2silverback2:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( mapdotnewworld2silverback2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( mapdotnewworld2silverback2 )
	self.mapdotnewworld2silverback2 = mapdotnewworld2silverback2
	
	local mapdotnewworld2silverback3 = CoD.mapdot.new( menu, controller )
	mapdotnewworld2silverback3:setLeftRight( true, false, 1095, 1111 )
	mapdotnewworld2silverback3:setTopBottom( true, false, 478.5, 494.5 )
	mapdotnewworld2silverback3:mergeStateConditions( {
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "DeadOpsArcadeGlobal.level", 15 )
			end
		}
	} )
	mapdotnewworld2silverback3:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.level" ), function ( model )
		menu:updateElementState( mapdotnewworld2silverback3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.level"
		} )
	end )
	self:addElement( mapdotnewworld2silverback3 )
	self.mapdotnewworld2silverback3 = mapdotnewworld2silverback3
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( true, false, 738.57, 1099.57 )
	TextBox0:setTopBottom( true, false, 572.5, 618.5 )
	TextBox0:setRGB( 0.35, 0.27, 0.24 )
	TextBox0:setText( Engine.Localize( "MENU_DOA2_TITLE" ) )
	TextBox0:setTTF( "fonts/UnitedSansSmCdBd_0.ttf" )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	local TextBox1 = LUI.UIText.new()
	TextBox1:setLeftRight( true, false, 867.57, 1099.57 )
	TextBox1:setTopBottom( true, false, 611.5, 643.5 )
	TextBox1:setRGB( 0.35, 0.27, 0.11 )
	TextBox1:setText( Engine.Localize( "MENU_DOA_TITLE2" ) )
	TextBox1:setTTF( "fonts/UnitedSansSmCdLt_0.ttf" )
	TextBox1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	TextBox1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox1 )
	self.TextBox1 = TextBox1
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.chinatown:close()
		element.mapdotcavetochina6:close()
		element.mapdotcavetochina5:close()
		element.mapdotcavetochina4:close()
		element.mapdotcavetochina3:close()
		element.mapdotcavetochina1:close()
		element.mapdotcavetochina0:close()
		element.cave:close()
		element.mapdotblood2cave2:close()
		element.mapdotblood2cave1:close()
		element.mapdotblood2cave0:close()
		element.bloodlake:close()
		element.mapdotsafe2blood3:close()
		element.mapdotsafe2blood2:close()
		element.mapdotsafe2blood1:close()
		element.mapdotsafe2blood0:close()
		element.safehouse:close()
		element.mapdottemple2safe2:close()
		element.mapdottemple2safe1:close()
		element.mapdottemple2safe0:close()
		element.temple:close()
		element.mapdotfgrave2temple4:close()
		element.mapdotfgrave2temple3:close()
		element.mapdotfgrave2temple2:close()
		element.mapdotfgrave2temple1:close()
		element.mapdotfgrave2temple0:close()
		element.graveyard:close()
		element.mapdotfarmtograve3:close()
		element.mapdotfarmtograve2:close()
		element.mapdotfarmtograve1:close()
		element.mapdotfarmtograve0:close()
		element.farm:close()
		element.mapdotdock2farm2:close()
		element.mapdotdock2farm1:close()
		element.mapdotdock2farm0:close()
		element.dock:close()
		element.mapdotisland2dock3:close()
		element.mapdotisland2dock2:close()
		element.mapdotisland2dock1:close()
		element.mapdotisland2dock0:close()
		element.island:close()
		element.sgen:close()
		element.mapdotchina2sgen0:close()
		element.mapdotchina2sgen1:close()
		element.mapdotchina2sgen2:close()
		element.apartments:close()
		element.mapdotsgen2apartment0:close()
		element.mapdotsgen2apartment1:close()
		element.mapdotsgen2apartment2:close()
		element.sector:close()
		element.mapdotapartment2sector0:close()
		element.mapdotapartment2sector00:close()
		element.mapdotapartment2sector01:close()
		element.mapdotapartment2sector02:close()
		element.mapdotapartment2sector03:close()
		element.mapdotapartment2sector04:close()
		element.metro:close()
		element.mapdotsector2metro0:close()
		element.mapdotsector2metro00:close()
		element.mapdotsector2metro01:close()
		element.mapdotsector2metro02:close()
		element.clearing:close()
		element.mapdotmetro2clearing:close()
		element.mapdotmetro2clearing0:close()
		element.mapdotmetro2clearing1:close()
		element.mapdotmetro2clearing2:close()
		element.mapdotmetro2clearing3:close()
		element.newworld:close()
		element.mapdotclearingtonewworld0:close()
		element.mapdotclearingtonewworld1:close()
		element.mapdotclearingtonewworld2:close()
		element.silverback:close()
		element.mapdotnewworld2silverback0:close()
		element.mapdotnewworld2silverback1:close()
		element.mapdotnewworld2silverback2:close()
		element.mapdotnewworld2silverback3:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

