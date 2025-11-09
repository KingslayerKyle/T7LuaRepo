require( "ui.uieditor.widgets.StartGameFlow.LoadingScreenHeroListWidget" )

CoD.LoadingScreenTeamPlayerList = InheritFrom( LUI.UIElement )
CoD.LoadingScreenTeamPlayerList.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LoadingScreenTeamPlayerList )
	self.id = "LoadingScreenTeamPlayerList"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local Team2PlayerList = LUI.UIList.new( menu, controller, 4, 0, nil, false, false, 0, 0, false, false )
	Team2PlayerList:makeFocusable()
	Team2PlayerList:setLeftRight( false, false, -490, 490 )
	Team2PlayerList:setTopBottom( false, true, -259, -89 )
	Team2PlayerList:setScale( 1.1 )
	Team2PlayerList:setWidgetType( CoD.LoadingScreenHeroListWidget )
	Team2PlayerList:setHorizontalCount( 6 )
	Team2PlayerList:setSpacing( 4 )
	Team2PlayerList:setDataSource( "LoadingScreenPlayerListTeam2" )
	Team2PlayerList:mergeStateConditions( {
		{
			stateName = "FFA",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:addElement( Team2PlayerList )
	self.Team2PlayerList = Team2PlayerList
	
	local Team1PlayerList = LUI.UIList.new( menu, controller, 4, 0, nil, false, false, 0, 0, false, false )
	Team1PlayerList:makeFocusable()
	Team1PlayerList:setLeftRight( false, false, -490, 490 )
	Team1PlayerList:setTopBottom( true, false, 89, 259 )
	Team1PlayerList:setScale( 1.1 )
	Team1PlayerList:setWidgetType( CoD.LoadingScreenHeroListWidget )
	Team1PlayerList:setHorizontalCount( 6 )
	Team1PlayerList:setSpacing( 4 )
	Team1PlayerList:setDataSource( "LoadingScreenPlayerListTeam1" )
	Team1PlayerList:mergeStateConditions( {
		{
			stateName = "FFA",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:addElement( Team1PlayerList )
	self.Team1PlayerList = Team1PlayerList
	
	Team2PlayerList.navigation = {
		up = Team1PlayerList
	}
	Team1PlayerList.navigation = {
		down = Team2PlayerList
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			StartLoading = function ()
				self:setupElementClipCounter( 2 )
				local Team2PlayerListFrame2 = function ( Team2PlayerList, event )
					local Team2PlayerListFrame3 = function ( Team2PlayerList, event )
						if not event.interrupted then
							Team2PlayerList:beginAnimation( "keyframe", 229, false, false, CoD.TweenType.Bounce )
						end
						Team2PlayerList:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Team2PlayerList, event )
						else
							Team2PlayerList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Team2PlayerListFrame3( Team2PlayerList, event )
						return 
					else
						Team2PlayerList:beginAnimation( "keyframe", 1840, false, false, CoD.TweenType.Linear )
						Team2PlayerList:registerEventHandler( "transition_complete_keyframe", Team2PlayerListFrame3 )
					end
				end
				
				Team2PlayerList:completeAnimation()
				self.Team2PlayerList:setAlpha( 0 )
				Team2PlayerListFrame2( Team2PlayerList, {} )
				local Team1PlayerListFrame2 = function ( Team1PlayerList, event )
					local Team1PlayerListFrame3 = function ( Team1PlayerList, event )
						if not event.interrupted then
							Team1PlayerList:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Bounce )
						end
						Team1PlayerList:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Team1PlayerList, event )
						else
							Team1PlayerList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Team1PlayerListFrame3( Team1PlayerList, event )
						return 
					else
						Team1PlayerList:beginAnimation( "keyframe", 1509, false, false, CoD.TweenType.Linear )
						Team1PlayerList:registerEventHandler( "transition_complete_keyframe", Team1PlayerListFrame3 )
					end
				end
				
				Team1PlayerList:completeAnimation()
				self.Team1PlayerList:setAlpha( 0 )
				Team1PlayerListFrame2( Team1PlayerList, {} )
			end
		},
		CodCaster = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Demo = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Team2PlayerList:completeAnimation()
				self.Team2PlayerList:setAlpha( 0 )
				self.clipFinished( Team2PlayerList, {} )
				Team1PlayerList:completeAnimation()
				self.Team1PlayerList:setAlpha( 0 )
				self.clipFinished( Team1PlayerList, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "CodCaster",
			condition = function ( menu, element, event )
				return IsCodCaster( controller )
			end
		},
		{
			stateName = "Demo",
			condition = function ( menu, element, event )
				return IsDemoPlaying()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "factions.isCoDCaster" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "factions.isCoDCaster"
		} )
	end )
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	Team2PlayerList.id = "Team2PlayerList"
	Team1PlayerList.id = "Team1PlayerList"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Team2PlayerList:close()
		element.Team1PlayerList:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

