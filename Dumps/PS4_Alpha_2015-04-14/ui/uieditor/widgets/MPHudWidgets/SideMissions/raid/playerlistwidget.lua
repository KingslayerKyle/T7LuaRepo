require( "ui.uieditor.widgets.MPHudWidgets.SideMissions.raid.playerScoreWidget" )

local pickupsTable = "gamedata/tables/cp/cp_smPickupsTable.csv"
local pickupsTableColumns = {
	index = 0,
	client_field = 1,
	playerListMaterial = 2
}
local UpdateInventoryClientField = function ( self, event )
	if event.name then
		local inventoryMaterial = Engine.TableLookup( nil, pickupsTable, pickupsTableColumns.client_field, event.name, pickupsTableColumns.playerListMaterial )
		if event.oldValue ~= 0 then
			local model = Engine.GetModel( DataSources.PlayerList.getModelForPlayer( event.controller, self.playerScores, event.oldValue - 1 ), "objectiveIcon" )
			if model and Engine.GetModelValue( model ) == inventoryMaterial then
				Engine.SetModelValue( model, "" )
			end
		end
		if event.newValue ~= 0 then
			local model = Engine.GetModel( DataSources.PlayerList.getModelForPlayer( event.controller, self.playerScores, event.newValue - 1 ), "objectiveIcon" )
			if model then
				Engine.SetModelValue( model, inventoryMaterial )
			end
		end
		self:dispatchEventToChildren( {
			name = "player_objectives_change",
			controller = event.controller
		} )
	end
end

local PostLoadFunc = function ( self, controller )
	local connectionChangeHandler = function ( scoreList, event )
		if event.data ~= nil then
			DataSources.PlayerList.updateModelsForClient( event.controller, scoreList, event.data[1] )
		else
			DataSources.PlayerList.updateModelsForClient( event.controller, scoreList, event.clientNum )
		end
		scoreList:dispatchEventToParent( {
			name = "player_list_change"
		} )
	end
	
	self.playerScores:registerEventHandler( "player_connected", connectionChangeHandler )
	self.playerScores:registerEventHandler( "player_disconnected", connectionChangeHandler )
	self:registerEventHandler( "sm_score", function ( element, event )
		local model = Engine.GetModel( DataSources.PlayerList.getModelForPlayer( event.controller, element.playerScores, event.entNum ), "playerScore" )
		if model then
			Engine.SetModelValue( model, event.newValue )
		end
	end )
	self:registerEventHandler( "client_rank_up", function ( element, event )
		local model = Engine.GetModel( DataSources.PlayerList.getModelForPlayer( event.controller, element.playerScores, event.data[1] ), "playerRankIcon" )
		if model then
			Engine.SetModelValue( model, Engine.TableLookup( nil, CoD.rankIconTable, 0, event.data[2], event.data[3] + 1 ) )
		end
	end )
	local inventoryItemCount = Engine.TableLookup( nil, pickupsTable, 0, "inventory_item_count", 1 )
	for inventoryIndex = 0, inventoryItemCount - 1, 1 do
		local inventoryClientFieldName = Engine.TableLookup( nil, pickupsTable, pickupsTableColumns.index, inventoryIndex, pickupsTableColumns.client_field )
		self:registerEventHandler( inventoryClientFieldName, UpdateInventoryClientField )
	end
	self:processEvent( "player_list_change" )
end

CoD.playerListWidget = InheritFrom( LUI.UIElement )
CoD.playerListWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.playerListWidget )
	self.id = "playerListWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 500 )
	self:setTopBottom( true, false, 0, 254 )
	self.anyChildUsesUpdateState = true
	
	local playerScores = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, true )
	playerScores:makeFocusable()
	playerScores:setLeftRight( true, false, 0, 500 )
	playerScores:setTopBottom( true, false, 0, 254 )
	playerScores:setRGB( 1, 1, 1 )
	playerScores:setDataSource( "PlayerList" )
	playerScores:setWidgetType( CoD.playerScoreWidget )
	playerScores:setVerticalCount( 4 )
	self:addElement( playerScores )
	self.playerScores = playerScores
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				playerScores:completeAnimation()
				self.playerScores:setLeftRight( true, false, 0, 500 )
				self.playerScores:setTopBottom( false, true, -166, 0 )
				self.clipFinished( playerScores, {} )
			end
		},
		PlayerCount_2 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				playerScores:completeAnimation()
				self.playerScores:setLeftRight( true, false, 0, 500 )
				self.playerScores:setTopBottom( true, false, 130, 254 )
				self.clipFinished( playerScores, {} )
			end
		},
		PlayerCount_3 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				playerScores:completeAnimation()
				self.playerScores:setLeftRight( true, false, 0, 500 )
				self.playerScores:setTopBottom( true, false, 64, 254 )
				self.clipFinished( playerScores, {} )
			end
		},
		PlayerCount_4 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				playerScores:completeAnimation()
				self.playerScores:setLeftRight( true, false, 0, 500 )
				self.playerScores:setTopBottom( true, false, 0, 254 )
				self.clipFinished( playerScores, {} )
			end
		},
		PlayerCount_1 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				playerScores:completeAnimation()
				self.playerScores:setLeftRight( true, false, 0, 500 )
				self.playerScores:setTopBottom( true, false, 192, 254 )
				self.clipFinished( playerScores, {} )
			end
		}
	}
	playerScores.id = "playerScores"
	self.close = function ( self )
		self.playerScores:close()
		CoD.playerListWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

