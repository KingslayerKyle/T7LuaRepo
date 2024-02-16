require( "ui.uieditor.widgets.HUD.T8ScoreWidget.T8ClientScore" )
require( "ui.uieditor.widgets.HUD.T8ScoreWidget.T8SelfScore" )
require( "ui.uieditor.widgets.HUD.ZM_Score.ZMScr_PlusPointsContainer" )

DataSources.ZMPlayerList = {
	getModel = function ( controller )
		return Engine.CreateModel( Engine.GetModelForController( controller ), "PlayerList" )
	end
}

local CreateNewPlusPointsElement = function ( element, score, controller, menu, small, table )
	if score == 0 or score < -10000 or score > 10000 then
		return
	end

	local newPlusPointsElement = CoD.ZMScr_PlusPointsContainer.new( menu, controller )
	newPlusPointsElement.scoreEmitterInfo = table

	if score > 0 then
		newPlusPointsElement.ZMScrPlusPoints.Label1:setText( "+" .. score )
		newPlusPointsElement.ZMScrPlusPoints.Label2:setText( "+" .. score )
		newPlusPointsElement.ZMScrPlusPoints:playClip( "DefaultClip" )
	else
		newPlusPointsElement.ZMScrPlusPoints.Label1:setText( score )
		newPlusPointsElement.ZMScrPlusPoints.Label2:setText( score )
		newPlusPointsElement.ZMScrPlusPoints:playClip( "NegativeScore" )
	end

	newPlusPointsElement:setLeftRight( element:getLocalLeftRight() )
	newPlusPointsElement:setTopBottom( element:getLocalTopBottom() )

	if small then
		newPlusPointsElement:setScale( 0.75 )
	end

	element.lastAnim = element.lastAnim + 1

	newPlusPointsElement:setState( "DefaultState" )

	if not newPlusPointsElement:hasClip( "Anim" .. element.lastAnim ) then
		element.lastAnim = 1
	end

	newPlusPointsElement:registerEventHandler( "clip_over", function ( element, event )
		local scoreEmitterInfo = element.scoreEmitterInfo
		element:close()
		CoD.perController[scoreEmitterInfo.controller].scoreEmitterCount[scoreEmitterInfo.index][scoreEmitterInfo.type] = CoD.perController[scoreEmitterInfo.controller].scoreEmitterCount[scoreEmitterInfo.index][scoreEmitterInfo.type] - 1
	end )

	local parent = element:getParent()
	parent:addElement( newPlusPointsElement )

	newPlusPointsElement:playClip( "Anim" .. element.lastAnim )
end

local PreLoadFunc = function ( self, controller )
	for index = 0, 3 do
		Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( DataSources.ZMPlayerList.getModel( controller ), index ), "zombieInventoryIcon" ), "blacktransparent" )
		Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( DataSources.ZMPlayerList.getModel( controller ), index ), "zombieWearableIcon" ), "blacktransparent" )
	end
end

local PostLoadFunc = function ( self, controller, menu )
	local scoreAwards = {
		damage = 10,
		death_normal = 50,
		death_torso = 60,
		death_neck = 70,
		death_head = 100,
		death_melee = 130
	}

	CoD.perController[controller].scoreEmitterCount = {}
	
	for index = 0, 3 do
		local playerIdx = index

		local element = self["ZMScrPlusPoints" .. playerIdx]
		element:setAlpha( 0 )
		element.lastAnim = 0

		CoD.perController[controller].scoreEmitterCount[playerIdx] = {}
		CoD.perController[controller].scoreEmitterCount[playerIdx].delayed = 0
		CoD.perController[controller].scoreEmitterCount[playerIdx].instant = 0

		local clientNum = Engine.GetModel( Engine.GetModelForController( controller ), "PlayerList." .. playerIdx .. ".clientNum" )

		if clientNum then
			clientNum = Engine.GetModelValue( clientNum )
		end

		if clientNum ~= nil then
			local client = Engine.GetModel( Engine.GetModelForController( controller ), "PlayerList.client" .. clientNum )

			if client ~= nil then
				for key, value in pairs( scoreAwards ) do
					element:registerEventHandler( "delayed_score", function ( element, event )
						CreateNewPlusPointsElement( element, event.score, controller, menu, playerIdx > 0, {
							controller = controller,
							index = playerIdx,
							type = "delayed"
						} )
					end )

					element:subscribeToModel( Engine.CreateModel( client, "score_cf_" .. key ), function ( model )
						if Engine.GetModelValue( model ) ~= nil then
							local score = value

							local doublePointsStatus = Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.doublePointsActive" )

							if doublePointsStatus ~= nil and Engine.GetModelValue( doublePointsStatus ) == 1 then
								score = value * 2
							end

							if element.accountedForScore ~= nil then
								element.accountedForScore = element.accountedForScore + score
							end

							if CoD.perController[controller].scoreEmitterCount[playerIdx].delayed < 128 then
								CoD.perController[controller].scoreEmitterCount[playerIdx].delayed = CoD.perController[controller].scoreEmitterCount[playerIdx].delayed + 1
								self:addElement( LUI.UITimer.new( 16 * Engine.GetModelValue( model ) % 3, {
									name = "delayed_score",
									score = score
								}, true, element ) )
							end
						end
					end )
				end
			end
		end

		local client = Engine.GetModel( Engine.GetModelForController( controller ), "PlayerList." .. playerIdx .. ".playerScore" )

		element.accountedForScore = Engine.GetModelValue( client )

		element:subscribeToModel( client, function ( model )
			local modelValue = Engine.GetModelValue( model )

			if element.accountedForScore == nil then
				element.accountedForScore = modelValue
			end

			if modelValue ~= element.accountedForScore then
				if CoD.perController[controller].scoreEmitterCount[playerIdx].instant < 64 then
					CoD.perController[controller].scoreEmitterCount[playerIdx].instant = CoD.perController[controller].scoreEmitterCount[playerIdx].instant + 1
					CreateNewPlusPointsElement( element, modelValue - element.accountedForScore, controller, menu, playerIdx > 0, {
						controller = controller,
						index = playerIdx,
						type = "instant"
					} )
				end

				element.accountedForScore = modelValue
			end
		end )
	end

	Engine.CreateModel( Engine.GetModelForController( controller ), "hudItems.doublePointsActive" )
end

CoD.T8ScoreContainer = InheritFrom( LUI.UIElement )
CoD.T8ScoreContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.T8ScoreContainer )
	self.id = "T8ScoreContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	self.ListingUser = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	self.ListingUser:makeFocusable()
	self.ListingUser:setLeftRight( true, true, 0, 0 )
	self.ListingUser:setTopBottom( true, true, 0, 0 )
	self.ListingUser:setWidgetType( CoD.T8SelfScore )
	self.ListingUser:setDataSource( "PlayerListZM" )
	self:addElement( self.ListingUser )
	
	self.Listing2 = CoD.T8ClientScore.new( menu, controller )
	self.Listing2:setLeftRight( true, true, 0, 0 )
	self.Listing2:setTopBottom( true, true, 0, 0 )
	self.Listing2:subscribeToGlobalModel( controller, "ZMPlayerList", "1", function ( model )
		self.Listing2:setModel( model, controller )
	end )
	self:addElement( self.Listing2 )
	
	self.Listing3 = CoD.T8ClientScore.new( menu, controller )
	self.Listing3:setLeftRight( true, true, 0, 0 )
	self.Listing3:setTopBottom( true, true, 0, -54 )
	self.Listing3:subscribeToGlobalModel( controller, "ZMPlayerList", "2", function ( model )
		self.Listing3:setModel( model, controller )
	end )
	self:addElement( self.Listing3 )
	
	self.Listing4 = CoD.T8ClientScore.new( menu, controller )
	self.Listing4:setLeftRight( true, true, 0, 0 )
	self.Listing4:setTopBottom( true, true, 0, -108 )
	self.Listing4:subscribeToGlobalModel( controller, "ZMPlayerList", "3", function ( model )
		self.Listing4:setModel( model, controller )
	end )
	self:addElement( self.Listing4 )

	self.ZMScrPlusPoints0 = CoD.ZMScr_PlusPointsContainer.new( menu, controller )
	self.ZMScrPlusPoints0:setLeftRight( true, false, 210, 0 )
	self.ZMScrPlusPoints0:setTopBottom( false, true, -95, 0 )
	self:addElement( self.ZMScrPlusPoints0 )
	
	self.ZMScrPlusPoints1 = CoD.ZMScr_PlusPointsContainer.new( menu, controller )
	self.ZMScrPlusPoints1:setLeftRight( true, false, 150, 0 )
	self.ZMScrPlusPoints1:setTopBottom( false, true, -195, 0 )
	self.ZMScrPlusPoints1:setScale( 0.75 )
	self:addElement( self.ZMScrPlusPoints1 )
	
	self.ZMScrPlusPoints2 = CoD.ZMScr_PlusPointsContainer.new( menu, controller )
	self.ZMScrPlusPoints2:setLeftRight( true, false, 150, 0 )
	self.ZMScrPlusPoints2:setTopBottom( false, true, -255, 0 )
	self.ZMScrPlusPoints2:setScale( 0.75 )
	self:addElement( self.ZMScrPlusPoints2 )
	
	self.ZMScrPlusPoints3 = CoD.ZMScr_PlusPointsContainer.new( menu, controller )
	self.ZMScrPlusPoints3:setLeftRight( true, false, 150, 0 )
	self.ZMScrPlusPoints3:setTopBottom( false, true, -318, 0 )
	self.ZMScrPlusPoints3:setScale( 0.75 )
	self:addElement( self.ZMScrPlusPoints3 )

	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				self.ListingUser:completeAnimation()
				self.ListingUser:setAlpha( 0 )
				self.clipFinished( self.ListingUser, {} )

				self.Listing2:completeAnimation()
				self.Listing2:setAlpha( 0 )
				self.clipFinished( self.Listing2, {} )

				self.Listing3:completeAnimation()
				self.Listing3:setAlpha( 0 )
				self.clipFinished( self.Listing3, {} )

				self.Listing4:completeAnimation()
				self.Listing4:setAlpha( 0 )
				self.clipFinished( self.Listing4, {} )
			end,
			HudStart = function ()
				self:setupElementClipCounter( 4 )

				local HudStartTransition = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
	
					element:setAlpha( 1 )
	
					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end

				self.ListingUser:completeAnimation()
				self.ListingUser:setAlpha( 0 )
				HudStartTransition( self.ListingUser, {} )

				self.Listing2:completeAnimation()
				self.Listing2:setAlpha( 0 )
				HudStartTransition( self.Listing2, {} )

				self.Listing3:completeAnimation()
				self.Listing3:setAlpha( 0 )
				HudStartTransition( self.Listing3, {} )

				self.Listing4:completeAnimation()
				self.Listing4:setAlpha( 0 )
				HudStartTransition( self.Listing4, {} )
			end
		},
		HudStart = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				self.ListingUser:completeAnimation()
				self.ListingUser:setAlpha( 1 )
				self.clipFinished( self.ListingUser, {} )

				self.Listing2:completeAnimation()
				self.Listing2:setAlpha( 1 )
				self.clipFinished( self.Listing2, {} )

				self.Listing3:completeAnimation()
				self.Listing3:setAlpha( 1 )
				self.clipFinished( self.Listing3, {} )

				self.Listing4:completeAnimation()
				self.Listing4:setAlpha( 1 )
				self.clipFinished( self.Listing4, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 4 )
				
				local DefaultStateTransition = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
	
					element:setAlpha( 0 )
	
					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end

				self.ListingUser:completeAnimation()
				self.ListingUser:setAlpha( 1 )
				DefaultStateTransition( self.ListingUser, {} )
				
				self.Listing2:completeAnimation()
				self.Listing2:setAlpha( 1 )
				DefaultStateTransition( self.Listing2, {} )

				self.Listing3:completeAnimation()
				self.Listing3:setAlpha( 1 )
				DefaultStateTransition( self.Listing3, {} )

				self.Listing4:completeAnimation()
				self.Listing4:setAlpha( 1 )
				DefaultStateTransition( self.Listing4, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "HudStart",
			condition = function ( menu, element, event )
				if IsModelValueTrue( controller, "hudItems.playerSpawned" ) then
					if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE )
					and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE )
					and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE )
					and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED )
					and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM )
					and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN )
					and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM )
					and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED )
					and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE )
					and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_SCOPED )
					and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE )
					and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE )
					and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
					and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC )
					and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE ) then
						return true
					else
						return false
					end
				end
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.playerSpawned" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.playerSpawned"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE
		} )
	end )

	self.ListingUser.id = "ListingUser"

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ListingUser:close()
		element.Listing2:close()
		element.Listing3:close()
		element.Listing4:close()
		element.ZMScrPlusPoints0:close()
		element.ZMScrPlusPoints1:close()
		element.ZMScrPlusPoints2:close()
		element.ZMScrPlusPoints3:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
