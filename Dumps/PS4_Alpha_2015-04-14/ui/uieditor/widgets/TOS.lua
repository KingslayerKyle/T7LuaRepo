local Tos_Update_Left = function ( self, event )
	local model = Engine.GetModel( DataSources.TeamOperationSystem.getModel( controller ), "leftBar" )
	local val = Engine.GetModelValue( model )
	local progress = 0.6 + val / 250
	self:setShaderVector( 0, progress, 0, 0, 0 )
end

local Tos_Update_Right = function ( self, event )
	local model = Engine.GetModel( DataSources.TeamOperationSystem.getModel( controller ), "rightBar" )
	local val = 100 - Engine.GetModelValue( model )
	local progress = val / 263
	self:setShaderVector( 0, progress, 0, 0, 0 )
end

local Tos_Update_State = function ( self, event )
	self:setState( event.state )
end

local UpdateVisibility = function ( self, event )
	local controller = event.controller
	if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_AMMO_COUNTER_HIDE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE ) and (not CoD.IsShoutcaster( controller ) or CoD.ExeProfileVarBool( controller, "shoutcaster_inventory" ) and Engine.IsSpectatingActiveClient( controller )) and CoD.FSM_VISIBILITY( controller ) == 0 then
		self:setAlpha( 1 )
	else
		self:setAlpha( 0 )
	end
end

local PostLoadFunc = function ( self, controller )
	local UpdateVisibility_Internal = function ( model )
		UpdateVisibility( self, {
			controller = controller
		} )
	end
	
	local perControllerModel = Engine.GetModelForController( controller )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ), UpdateVisibility_Internal )
	self.LeftProgressBarCir:registerEventHandler( "hud_tos_update_left", Tos_Update_Left )
	self.RightProgressBarCir:registerEventHandler( "hud_tos_update_right", Tos_Update_Right )
	self:registerEventHandler( "hud_tos_set_state", Tos_Update_State )
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
	TimeLimit:setRGB( 1, 1, 1 )
	TimeLimit:setAlpha( 0 )
	TimeLimit:setTTF( "fonts/default.ttf" )
	TimeLimit:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TimeLimit:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TimeLimit:subscribeToGlobalModel( controller, "TeamOperationSystem", "timeLimit", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TimeLimit:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( TimeLimit )
	self.TimeLimit = TimeLimit
	
	local RightIcon = LUI.UIImage.new()
	RightIcon:setLeftRight( true, false, 158.13, 190.87 )
	RightIcon:setTopBottom( true, false, 180, 210 )
	RightIcon:setRGB( 1, 1, 1 )
	RightIcon:setAlpha( 0 )
	RightIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	RightIcon:subscribeToGlobalModel( controller, "TeamOperationSystem", "rIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RightIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( RightIcon )
	self.RightIcon = RightIcon
	
	local LeftIcon = LUI.UIImage.new()
	LeftIcon:setLeftRight( true, false, 65.5, 95.5 )
	LeftIcon:setTopBottom( true, false, 180, 210 )
	LeftIcon:setRGB( 1, 1, 1 )
	LeftIcon:setAlpha( 0 )
	LeftIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	LeftIcon:subscribeToGlobalModel( controller, "TeamOperationSystem", "lIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LeftIcon:setImage( RegisterImage( modelValue ) )
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
	RewardIconBackground:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( RewardIconBackground )
	self.RewardIconBackground = RewardIconBackground
	
	local RightProgressBarBackground = LUI.UIImage.new()
	RightProgressBarBackground:setLeftRight( true, false, 30, 210 )
	RightProgressBarBackground:setTopBottom( true, false, 30, 210 )
	RightProgressBarBackground:setAlpha( 0 )
	RightProgressBarBackground:setImage( RegisterImage( "uie_t7_hud_widget_team_enemy_meter" ) )
	RightProgressBarBackground:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	RightProgressBarBackground:subscribeToGlobalModel( controller, "TeamOperationSystem", "enemyFactionColor", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RightProgressBarBackground:setRGB( modelValue )
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
	LeftProgressBarBackground:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
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
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LeftProgressBarCir:setRGB( modelValue )
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
	TeamOpsDescription:setRGB( 1, 1, 1 )
	TeamOpsDescription:setAlpha( 0 )
	TeamOpsDescription:setTTF( "fonts/default.ttf" )
	TeamOpsDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TeamOpsDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TeamOpsDescription:subscribeToGlobalModel( controller, "TeamOperationSystem", "opDesc", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TeamOpsDescription:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( TeamOpsDescription )
	self.TeamOpsDescription = TeamOpsDescription
	
	local RewardIcon = LUI.UIImage.new()
	RewardIcon:setLeftRight( true, false, 65.5, 174.5 )
	RewardIcon:setTopBottom( true, false, 75, 188 )
	RewardIcon:setRGB( 1, 1, 1 )
	RewardIcon:setAlpha( 0 )
	RewardIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	RewardIcon:subscribeToGlobalModel( controller, "TeamOperationSystem", "rewardIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RewardIcon:setImage( RegisterImage( modelValue ) )
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
	self.close = function ( self )
		self.TimeLimit:close()
		self.RightIcon:close()
		self.LeftIcon:close()
		self.RightProgressBarBackground:close()
		self.LeftProgressBarCir:close()
		self.TeamOpsDescription:close()
		self.RewardIcon:close()
		CoD.TOS.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

