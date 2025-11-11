require( "ui.uieditor.widgets.HUD.MP_VoipWidget.Voip_Container" )
require( "ui.uieditor.widgets.StartGameFlow.LoadingScreenTalkerWidgetCPZM" )

LUI.createMenu.Migration = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Migration" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Migration.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local elementDarkenBg = LUI.UIImage.new()
	elementDarkenBg:setLeftRight( 0, 1, 0, 0 )
	elementDarkenBg:setTopBottom( 0, 1, 0, 0 )
	elementDarkenBg:setRGB( 0, 0, 0 )
	self:addElement( elementDarkenBg )
	self.elementDarkenBg = elementDarkenBg
	
	local VoipContainer = CoD.Voip_Container.new( self, controller )
	VoipContainer:mergeStateConditions( {
		{
			stateName = "HudStart",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		},
		{
			stateName = "ShowForCodCaster",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	VoipContainer:setLeftRight( 0, 0, 96, 505 )
	VoipContainer:setTopBottom( 0, 0, 54, 162 )
	self:addElement( VoipContainer )
	self.VoipContainer = VoipContainer
	
	local Team1PlayerList = LUI.UIList.new( self, controller, 7, 0, nil, false, false, 0, 0, false, false )
	Team1PlayerList:makeFocusable()
	Team1PlayerList:setLeftRight( 0.5, 0.5, -864, -579 )
	Team1PlayerList:setTopBottom( 0, 0, 54, 183 )
	Team1PlayerList:setWidgetType( CoD.LoadingScreenTalkerWidgetCPZM )
	Team1PlayerList:setVerticalCount( 4 )
	Team1PlayerList:setSpacing( 7 )
	self:addElement( Team1PlayerList )
	self.Team1PlayerList = Team1PlayerList
	
	local migratingHostsLabel = LUI.UIText.new()
	migratingHostsLabel:setLeftRight( 0.5, 0.5, -564.5, 564.5 )
	migratingHostsLabel:setTopBottom( 0, 0, 63, 143 )
	migratingHostsLabel:setText( Engine.Localize( "MP_MIGRATINGHOSTS_CAPS" ) )
	migratingHostsLabel:setTTF( "fonts/default.ttf" )
	migratingHostsLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	migratingHostsLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( migratingHostsLabel )
	self.migratingHostsLabel = migratingHostsLabel
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( 0.5, 0.5, -64, 64 )
	Image:setTopBottom( 0.5, 0.5, -64, 64 )
	Image:setImage( RegisterImage( "t7_menu_loadingspinner_flipbook" ) )
	Image:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
	Image:setShaderVector( 0, 28, 1, 0, 0 )
	Image:setShaderVector( 1, 20.83, 0, 0, 0 )
	self:addElement( Image )
	self.Image = Image
	
	self.resetProperties = function ()
		VoipContainer:completeAnimation()
		Team1PlayerList:completeAnimation()
		VoipContainer:setAlpha( 1 )
		Team1PlayerList:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				VoipContainer:completeAnimation()
				self.VoipContainer:setAlpha( 0 )
				self.clipFinished( VoipContainer, {} )
			end
		},
		Multiplayer = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Team1PlayerList:completeAnimation()
				self.Team1PlayerList:setAlpha( 0 )
				self.clipFinished( Team1PlayerList, {} )
			end
		}
	}
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.VoipContainer:close()
		self.Team1PlayerList:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Migration.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

