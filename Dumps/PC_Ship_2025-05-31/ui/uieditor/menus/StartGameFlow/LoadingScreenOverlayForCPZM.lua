require( "ui.uieditor.widgets.StartGameFlow.LoadingScreenTalkerWidgetCPZM" )

LUI.createMenu.LoadingScreenOverlayForCPZM = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "LoadingScreenOverlayForCPZM" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "none"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "LoadingScreenOverlayForCPZM.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Team1PlayerList = LUI.UIList.new( self, controller, 5, 0, nil, false, false, 0, 0, false, false )
	Team1PlayerList:makeFocusable()
	Team1PlayerList:setLeftRight( false, false, -576, -386 )
	Team1PlayerList:setTopBottom( true, false, 36, 123 )
	Team1PlayerList:setDataSource( "LoadingScreenPlayerListTeam1" )
	Team1PlayerList:setWidgetType( CoD.LoadingScreenTalkerWidgetCPZM )
	Team1PlayerList:setVerticalCount( 4 )
	Team1PlayerList:setSpacing( 5 )
	self:addElement( Team1PlayerList )
	self.Team1PlayerList = Team1PlayerList
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Team1PlayerList:completeAnimation()
				self.Team1PlayerList:setLeftRight( false, false, -576, -386 )
				self.Team1PlayerList:setTopBottom( true, false, 36, 123 )
				self.clipFinished( Team1PlayerList, {} )
			end,
			StartLoading = function ()
				self:setupElementClipCounter( 1 )
				local Team1PlayerListFrame2 = function ( Team1PlayerList, event )
					if not event.interrupted then
						Team1PlayerList:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
					end
					Team1PlayerList:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Team1PlayerList, event )
					else
						Team1PlayerList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team1PlayerList:completeAnimation()
				self.Team1PlayerList:setAlpha( 0 )
				Team1PlayerListFrame2( Team1PlayerList, {} )
			end
		},
		Zombie = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Team1PlayerList:completeAnimation()
				self.Team1PlayerList:setLeftRight( false, false, -576, -386 )
				self.Team1PlayerList:setTopBottom( true, false, 106, 193 )
				self.clipFinished( Team1PlayerList, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Zombie",
			condition = function ( menu, element, event )
				return IsZombies()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		self:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	Team1PlayerList.id = "Team1PlayerList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.Team1PlayerList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Team1PlayerList:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "LoadingScreenOverlayForCPZM.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

