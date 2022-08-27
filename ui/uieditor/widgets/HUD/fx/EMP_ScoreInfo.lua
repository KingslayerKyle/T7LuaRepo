-- 225d391f603e30e49402b08922ba0897
-- This hash is used for caching, delete to decompile the file again

local f0_local0 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = f1_arg1.controller
	if Engine.IsVisibilityBitSet( f1_local0, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and Engine.IsVisibilityBitSet( f1_local0, Enum.UIVisibilityBit.BIT_EMP_ACTIVE ) and not Engine.IsVisibilityBitSet( f1_local0, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) and not Engine.IsVisibilityBitSet( f1_local0, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and not Engine.IsVisibilityBitSet( f1_local0, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not Engine.IsVisibilityBitSet( f1_local0, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) and not Engine.IsVisibilityBitSet( f1_local0, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and not Engine.IsVisibilityBitSet( f1_local0, Enum.UIVisibilityBit.BIT_GAME_ENDED ) and (not CoD.IsShoutcaster( f1_local0 ) or CoD.ShoutcasterProfileVarBool( f1_local0, "shoutcaster_teamscore" )) and not Engine.IsVisibilityBitSet( f1_local0, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( f1_local0, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ) and not Engine.IsVisibilityBitSet( f1_local0, Enum.UIVisibilityBit.BIT_IN_VEHICLE ) and not Engine.IsVisibilityBitSet( f1_local0, Enum.UIVisibilityBit.BIT_HUD_HARDCORE ) and CoD.isCampaign ~= true and CoD.FSM_VISIBILITY( f1_local0 ) == 0 then
		if not f1_arg0.visible then
			f1_arg0:setAlpha( 1 )
			f1_arg0.visible = true
		end
	elseif f1_arg0.visible then
		f1_arg0:setAlpha( 0 )
		f1_arg0.visible = nil
	end
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	f2_arg0:setAlpha( 0 )
	local f2_local0 = function ( f3_arg0 )
		f0_local0( f2_arg0, {
			controller = f2_arg1
		} )
	end
	
	local f2_local1 = Engine.GetModelForController( f2_arg1 )
	f2_arg0:subscribeToModel( Engine.GetModel( f2_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), f2_local0 )
	f2_arg0:subscribeToModel( Engine.GetModel( f2_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), f2_local0 )
	f2_arg0:subscribeToModel( Engine.GetModel( f2_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE ), f2_local0 )
	f2_arg0:subscribeToModel( Engine.GetModel( f2_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ), f2_local0 )
	f2_arg0:subscribeToModel( Engine.GetModel( f2_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), f2_local0 )
	f2_arg0:subscribeToModel( Engine.GetModel( f2_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), f2_local0 )
	f2_arg0:subscribeToModel( Engine.GetModel( f2_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE ), f2_local0 )
	f2_arg0:subscribeToModel( Engine.GetModel( f2_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), f2_local0 )
	f2_arg0:subscribeToModel( Engine.GetModel( f2_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ), f2_local0 )
	f2_arg0:subscribeToModel( Engine.GetModel( f2_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ), f2_local0 )
	f2_arg0:subscribeToModel( Engine.GetModel( f2_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), f2_local0 )
	f2_arg0:subscribeToModel( Engine.GetModel( f2_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE ), f2_local0 )
	f2_arg0:subscribeToModel( Engine.GetModel( f2_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SELECTING_LOCATION ), f2_local0 )
end

CoD.EMP_ScoreInfo = InheritFrom( LUI.UIElement )
CoD.EMP_ScoreInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EMP_ScoreInfo )
	self.id = "EMP_ScoreInfo"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 341 )
	self:setTopBottom( true, false, 0, 171 )
	
	local EMPScoreInfoBlackOps = LUI.UIImage.new()
	EMPScoreInfoBlackOps:setLeftRight( true, false, 0, 342 )
	EMPScoreInfoBlackOps:setTopBottom( false, true, -171, 0 )
	EMPScoreInfoBlackOps:setImage( RegisterImage( "uie_hud_t7_emp_factionblackops" ) )
	EMPScoreInfoBlackOps:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_emp" ) )
	EMPScoreInfoBlackOps:setShaderVector( 0, 26, 0, 0, 0 )
	EMPScoreInfoBlackOps:setShaderVector( 1, 1, 0, 0, 0 )
	EMPScoreInfoBlackOps:setShaderVector( 2, 1, 0, 0, 0 )
	self:addElement( EMPScoreInfoBlackOps )
	self.EMPScoreInfoBlackOps = EMPScoreInfoBlackOps
	
	local EMPScoreInfoCDP = LUI.UIImage.new()
	EMPScoreInfoCDP:setLeftRight( true, false, 0, 342 )
	EMPScoreInfoCDP:setTopBottom( false, true, -171, 0 )
	EMPScoreInfoCDP:setAlpha( 0 )
	EMPScoreInfoCDP:setImage( RegisterImage( "uie_hud_t7_emp_factioncdp" ) )
	EMPScoreInfoCDP:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_emp" ) )
	EMPScoreInfoCDP:setShaderVector( 0, 26, 0, 0, 0 )
	EMPScoreInfoCDP:setShaderVector( 1, 1, 0, 0, 0 )
	EMPScoreInfoCDP:setShaderVector( 2, 1, 0, 0, 0 )
	self:addElement( EMPScoreInfoCDP )
	self.EMPScoreInfoCDP = EMPScoreInfoCDP
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				EMPScoreInfoBlackOps:completeAnimation()
				self.EMPScoreInfoBlackOps:setAlpha( 0 )
				self.clipFinished( EMPScoreInfoBlackOps, {} )
				EMPScoreInfoCDP:completeAnimation()
				self.EMPScoreInfoCDP:setAlpha( 0 )
				self.clipFinished( EMPScoreInfoCDP, {} )
			end
		},
		axis = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				EMPScoreInfoBlackOps:completeAnimation()
				self.EMPScoreInfoBlackOps:setAlpha( 0 )
				self.clipFinished( EMPScoreInfoBlackOps, {} )
				EMPScoreInfoCDP:completeAnimation()
				self.EMPScoreInfoCDP:setAlpha( 1 )
				self.clipFinished( EMPScoreInfoCDP, {} )
			end
		},
		allies = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				EMPScoreInfoBlackOps:completeAnimation()
				self.EMPScoreInfoBlackOps:setAlpha( 1 )
				self.clipFinished( EMPScoreInfoBlackOps, {} )
				EMPScoreInfoCDP:completeAnimation()
				self.EMPScoreInfoCDP:setAlpha( 0 )
				self.clipFinished( EMPScoreInfoCDP, {} )
			end
		},
		emblem = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				EMPScoreInfoBlackOps:completeAnimation()
				self.EMPScoreInfoBlackOps:setAlpha( 1 )
				self.clipFinished( EMPScoreInfoBlackOps, {} )
				EMPScoreInfoCDP:completeAnimation()
				self.EMPScoreInfoCDP:setAlpha( 0 )
				self.clipFinished( EMPScoreInfoCDP, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "axis",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "factions.playerFactionName", "axis" )
			end
		},
		{
			stateName = "allies",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "factions.playerFactionName", "allies" )
			end
		},
		{
			stateName = "emblem",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "factions.playerFactionName", "free" )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "factions.playerFactionName" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "factions.playerFactionName"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

