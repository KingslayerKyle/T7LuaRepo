-- 86661ea46a63d9fedb5b82ad4c88ff12
-- This hash is used for caching, delete to decompile the file again

local f0_local0 = function ( f1_arg0, f1_arg1 )
	f1_arg0:setShaderVector( 0, 0.6 + Engine.GetModelValue( Engine.GetModel( DataSources.TeamOperationSystem.getModel( controller ), "leftBar" ) ) / 250, 0, 0, 0 )
end

local f0_local1 = function ( f2_arg0, f2_arg1 )
	f2_arg0:setShaderVector( 0, (100 - Engine.GetModelValue( Engine.GetModel( DataSources.TeamOperationSystem.getModel( controller ), "rightBar" ) )) / 263, 0, 0, 0 )
end

local f0_local2 = function ( f3_arg0, f3_arg1 )
	f3_arg0:setState( f3_arg1.state )
end

local f0_local3 = function ( f4_arg0, f4_arg1 )
	local f4_local0 = f4_arg1.controller
	if Engine.IsVisibilityBitSet( f4_local0, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( f4_local0, Enum.UIVisibilityBit.BIT_EMP_ACTIVE ) and not Engine.IsVisibilityBitSet( f4_local0, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) and not Engine.IsVisibilityBitSet( f4_local0, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and not Engine.IsVisibilityBitSet( f4_local0, Enum.UIVisibilityBit.BIT_IN_VEHICLE ) and not Engine.IsVisibilityBitSet( f4_local0, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( f4_local0, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ) and not Engine.IsVisibilityBitSet( f4_local0, Enum.UIVisibilityBit.BIT_AMMO_COUNTER_HIDE ) and not Engine.IsVisibilityBitSet( f4_local0, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) and not Engine.IsVisibilityBitSet( f4_local0, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not Engine.IsVisibilityBitSet( f4_local0, Enum.UIVisibilityBit.BIT_GAME_ENDED ) and not Engine.IsVisibilityBitSet( f4_local0, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and not Engine.IsVisibilityBitSet( f4_local0, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) and not Engine.IsVisibilityBitSet( f4_local0, Enum.UIVisibilityBit.BIT_HUD_HARDCORE ) and (not CoD.IsShoutcaster( f4_local0 ) or CoD.ShoutcasterProfileVarBool( f4_local0, "shoutcaster_inventory" ) and Engine.IsSpectatingActiveClient( f4_local0 )) and CoD.FSM_VISIBILITY( f4_local0 ) == 0 then
		f4_arg0:setAlpha( 1 )
	else
		f4_arg0:setAlpha( 0 )
	end
end

local PostLoadFunc = function ( f5_arg0, f5_arg1 )
	local f5_local0 = function ( f6_arg0 )
		f0_local3( f5_arg0, {
			controller = f5_arg1
		} )
	end
	
	local f5_local1 = Engine.GetModelForController( f5_arg1 )
	f5_arg0:subscribeToModel( Engine.GetModel( f5_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), f5_local0 )
	f5_arg0:subscribeToModel( Engine.GetModel( f5_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), f5_local0 )
	f5_arg0:subscribeToModel( Engine.GetModel( f5_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), f5_local0 )
	f5_arg0:subscribeToModel( Engine.GetModel( f5_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), f5_local0 )
	f5_arg0:subscribeToModel( Engine.GetModel( f5_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE ), f5_local0 )
	f5_arg0:subscribeToModel( Engine.GetModel( f5_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), f5_local0 )
	f5_arg0:subscribeToModel( Engine.GetModel( f5_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ), f5_local0 )
	f5_arg0:subscribeToModel( Engine.GetModel( f5_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), f5_local0 )
	f5_arg0:subscribeToModel( Engine.GetModel( f5_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), f5_local0 )
	f5_arg0:subscribeToModel( Engine.GetModel( f5_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ), f5_local0 )
	f5_arg0.LeftProgressBarCir:registerEventHandler( "hud_tos_update_left", f0_local0 )
	f5_arg0.RightProgressBarCir:registerEventHandler( "hud_tos_update_right", f0_local1 )
	f5_arg0:registerEventHandler( "hud_tos_set_state", f0_local2 )
end

CoD.TOS = InheritFrom( LUI.UIElement )
CoD.TOS.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.TOS )
	self.id = "TOS"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 240 )
	self:setTopBottom( true, false, 0, 220 )
	
	local TimeLimit = LUI.UIText.new()
	TimeLimit:setLeftRight( true, false, 104, 150 )
	TimeLimit:setTopBottom( true, false, 192, 222 )
	TimeLimit:setAlpha( 0 )
	TimeLimit:setTTF( "fonts/default.ttf" )
	TimeLimit:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TimeLimit:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TimeLimit:subscribeToGlobalModel( controller, "TeamOperationSystem", "timeLimit", function ( model )
		local timeLimit = Engine.GetModelValue( model )
		if timeLimit then
			TimeLimit:setText( Engine.Localize( timeLimit ) )
		end
	end )
	self:addElement( TimeLimit )
	self.TimeLimit = TimeLimit
	
	local RightIcon = LUI.UIImage.new()
	RightIcon:setLeftRight( true, false, 158.13, 190.87 )
	RightIcon:setTopBottom( true, false, 180, 210 )
	RightIcon:setAlpha( 0 )
	RightIcon:subscribeToGlobalModel( controller, "TeamOperationSystem", "rIcon", function ( model )
		local rIcon = Engine.GetModelValue( model )
		if rIcon then
			RightIcon:setImage( RegisterImage( rIcon ) )
		end
	end )
	self:addElement( RightIcon )
	self.RightIcon = RightIcon
	
	local LeftIcon = LUI.UIImage.new()
	LeftIcon:setLeftRight( true, false, 65.5, 95.5 )
	LeftIcon:setTopBottom( true, false, 180, 210 )
	LeftIcon:setAlpha( 0 )
	LeftIcon:subscribeToGlobalModel( controller, "TeamOperationSystem", "lIcon", function ( model )
		local lIcon = Engine.GetModelValue( model )
		if lIcon then
			LeftIcon:setImage( RegisterImage( lIcon ) )
		end
	end )
	self:addElement( LeftIcon )
	self.LeftIcon = LeftIcon
	
	local RewardIconBackground = LUI.UIImage.new()
	RewardIconBackground:setLeftRight( true, false, 30, 210 )
	RewardIconBackground:setTopBottom( true, false, 30, 210 )
	RewardIconBackground:setRGB( 0.47, 0.47, 0.47 )
	RewardIconBackground:setAlpha( 0 )
	RewardIconBackground:setImage( RegisterImage( "uie_t7_hud_widget_team_ops_center_circle" ) )
	self:addElement( RewardIconBackground )
	self.RewardIconBackground = RewardIconBackground
	
	local RightProgressBarBackground = LUI.UIImage.new()
	RightProgressBarBackground:setLeftRight( true, false, 30, 210 )
	RightProgressBarBackground:setTopBottom( true, false, 30, 210 )
	RightProgressBarBackground:setAlpha( 0 )
	RightProgressBarBackground:setImage( RegisterImage( "uie_t7_hud_widget_team_enemy_meter" ) )
	RightProgressBarBackground:subscribeToGlobalModel( controller, "TeamOperationSystem", "enemyFactionColor", function ( model )
		local enemyFactionColor = Engine.GetModelValue( model )
		if enemyFactionColor then
			RightProgressBarBackground:setRGB( enemyFactionColor )
		end
	end )
	self:addElement( RightProgressBarBackground )
	self.RightProgressBarBackground = RightProgressBarBackground
	
	local LeftProgressBarBackground = LUI.UIImage.new()
	LeftProgressBarBackground:setLeftRight( true, false, 30, 210 )
	LeftProgressBarBackground:setTopBottom( true, false, 30, 210 )
	LeftProgressBarBackground:setRGB( 0.47, 0.47, 0.47 )
	LeftProgressBarBackground:setAlpha( 0 )
	LeftProgressBarBackground:setImage( RegisterImage( "uie_t7_hud_widget_team_meter" ) )
	self:addElement( LeftProgressBarBackground )
	self.LeftProgressBarBackground = LeftProgressBarBackground
	
	local LeftProgressBarCir = LUI.UIImage.new()
	LeftProgressBarCir:setLeftRight( true, false, 30, 210 )
	LeftProgressBarCir:setTopBottom( true, false, 30, 210 )
	LeftProgressBarCir:setAlpha( 0 )
	LeftProgressBarCir:setImage( RegisterImage( "uie_t7_hud_widget_team_meter" ) )
	LeftProgressBarCir:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	LeftProgressBarCir:setShaderVector( 0, 0.98, 0, 0, 0 )
	LeftProgressBarCir:setShaderVector( 1, 0.5, 0, 0, 0 )
	LeftProgressBarCir:setShaderVector( 2, 0.5, 0, 0, 0 )
	LeftProgressBarCir:setShaderVector( 3, 0, 0, 0, 0 )
	LeftProgressBarCir:subscribeToGlobalModel( controller, "TeamOperationSystem", "factionColor", function ( model )
		local factionColor = Engine.GetModelValue( model )
		if factionColor then
			LeftProgressBarCir:setRGB( factionColor )
		end
	end )
	self:addElement( LeftProgressBarCir )
	self.LeftProgressBarCir = LeftProgressBarCir
	
	local RightProgressBarCir = LUI.UIImage.new()
	RightProgressBarCir:setLeftRight( true, false, 30, 210 )
	RightProgressBarCir:setTopBottom( true, false, 30, 210 )
	RightProgressBarCir:setRGB( 0.47, 0.47, 0.47 )
	RightProgressBarCir:setAlpha( 0 )
	RightProgressBarCir:setImage( RegisterImage( "uie_t7_hud_widget_team_enemy_meter" ) )
	RightProgressBarCir:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	RightProgressBarCir:setShaderVector( 0, 0, 0, 0, 0 )
	RightProgressBarCir:setShaderVector( 1, 0.5, 0, 0, 0 )
	RightProgressBarCir:setShaderVector( 2, 0.5, 0, 0, 0 )
	RightProgressBarCir:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( RightProgressBarCir )
	self.RightProgressBarCir = RightProgressBarCir
	
	local TeamOpsDescription = LUI.UIText.new()
	TeamOpsDescription:setLeftRight( true, false, 0, 230 )
	TeamOpsDescription:setTopBottom( true, false, 6, 36 )
	TeamOpsDescription:setAlpha( 0 )
	TeamOpsDescription:setTTF( "fonts/default.ttf" )
	TeamOpsDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TeamOpsDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TeamOpsDescription:subscribeToGlobalModel( controller, "TeamOperationSystem", "opDesc", function ( model )
		local opDesc = Engine.GetModelValue( model )
		if opDesc then
			TeamOpsDescription:setText( Engine.Localize( opDesc ) )
		end
	end )
	self:addElement( TeamOpsDescription )
	self.TeamOpsDescription = TeamOpsDescription
	
	local RewardIcon = LUI.UIImage.new()
	RewardIcon:setLeftRight( true, false, 65.5, 174.5 )
	RewardIcon:setTopBottom( true, false, 75, 188 )
	RewardIcon:setAlpha( 0 )
	RewardIcon:subscribeToGlobalModel( controller, "TeamOperationSystem", "rewardIcon", function ( model )
		local rewardIcon = Engine.GetModelValue( model )
		if rewardIcon then
			RewardIcon:setImage( RegisterImage( rewardIcon ) )
		end
	end )
	self:addElement( RewardIcon )
	self.RewardIcon = RewardIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )

				TimeLimit:completeAnimation()
				self.TimeLimit:setAlpha( 0 )
				self.clipFinished( TimeLimit, {} )

				RightIcon:completeAnimation()
				self.RightIcon:setAlpha( 0 )
				self.clipFinished( RightIcon, {} )

				LeftIcon:completeAnimation()
				self.LeftIcon:setAlpha( 0 )
				self.clipFinished( LeftIcon, {} )

				RewardIconBackground:completeAnimation()
				self.RewardIconBackground:setAlpha( 0 )
				self.clipFinished( RewardIconBackground, {} )

				RightProgressBarBackground:completeAnimation()
				self.RightProgressBarBackground:setAlpha( 0 )
				self.clipFinished( RightProgressBarBackground, {} )

				LeftProgressBarBackground:completeAnimation()
				self.LeftProgressBarBackground:setAlpha( 0 )
				self.clipFinished( LeftProgressBarBackground, {} )

				LeftProgressBarCir:completeAnimation()
				self.LeftProgressBarCir:setAlpha( 0 )
				self.clipFinished( LeftProgressBarCir, {} )

				RightProgressBarCir:completeAnimation()
				self.RightProgressBarCir:setAlpha( 0 )
				self.clipFinished( RightProgressBarCir, {} )

				TeamOpsDescription:completeAnimation()
				self.TeamOpsDescription:setAlpha( 0 )
				self.clipFinished( TeamOpsDescription, {} )

				RewardIcon:completeAnimation()
				self.RewardIcon:setAlpha( 0 )
				self.clipFinished( RewardIcon, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )

				TimeLimit:completeAnimation()
				self.TimeLimit:setAlpha( 1 )
				self.clipFinished( TimeLimit, {} )

				RightIcon:completeAnimation()
				self.RightIcon:setAlpha( 1 )
				self.clipFinished( RightIcon, {} )

				LeftIcon:completeAnimation()
				self.LeftIcon:setAlpha( 1 )
				self.clipFinished( LeftIcon, {} )

				RewardIconBackground:completeAnimation()
				self.RewardIconBackground:setAlpha( 0.7 )
				self.clipFinished( RewardIconBackground, {} )

				RightProgressBarBackground:completeAnimation()
				self.RightProgressBarBackground:setAlpha( 1 )
				self.clipFinished( RightProgressBarBackground, {} )

				LeftProgressBarBackground:completeAnimation()
				self.LeftProgressBarBackground:setAlpha( 1 )
				self.clipFinished( LeftProgressBarBackground, {} )

				LeftProgressBarCir:completeAnimation()
				self.LeftProgressBarCir:setAlpha( 1 )
				self.clipFinished( LeftProgressBarCir, {} )

				RightProgressBarCir:completeAnimation()
				self.RightProgressBarCir:setAlpha( 1 )
				self.clipFinished( RightProgressBarCir, {} )

				TeamOpsDescription:completeAnimation()
				self.TeamOpsDescription:setAlpha( 1 )
				self.clipFinished( TeamOpsDescription, {} )

				RewardIcon:completeAnimation()
				self.RewardIcon:setAlpha( 1 )
				self.clipFinished( RewardIcon, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.TimeLimit:close()
		element.RightIcon:close()
		element.LeftIcon:close()
		element.RightProgressBarBackground:close()
		element.LeftProgressBarCir:close()
		element.TeamOpsDescription:close()
		element.RewardIcon:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
