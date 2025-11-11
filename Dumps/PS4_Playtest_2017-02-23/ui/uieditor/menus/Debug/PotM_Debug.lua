LUI.createMenu.PotM_Debug = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "PotM_Debug" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "PotM_Debug.buttonPrompts" )
	local menu = self
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( 0, 0, 58, 582 )
	Title:setTopBottom( 0, 0, 28, 65 )
	Title:setText( Engine.Localize( "Play of the Match - Num Events = $(count)" ) )
	Title:setTTF( "fonts/default.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Title )
	self.Title = Title
	
	local OldestArchiveTime = LUI.UIText.new()
	OldestArchiveTime:setLeftRight( 0, 0, 57, 582 )
	OldestArchiveTime:setTopBottom( 0, 0, 71, 95 )
	OldestArchiveTime:setText( Engine.Localize( "Oldest Archive TIme: $(oldestArchiveTime)" ) )
	OldestArchiveTime:setTTF( "fonts/default.ttf" )
	OldestArchiveTime:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	OldestArchiveTime:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( OldestArchiveTime )
	self.OldestArchiveTime = OldestArchiveTime
	
	local EventNum = LUI.UIText.new()
	EventNum:setLeftRight( 0, 0, 58, 582 )
	EventNum:setTopBottom( 0, 0, 105, 129 )
	EventNum:setText( Engine.Localize( "Event#: $(eventNum)" ) )
	EventNum:setTTF( "fonts/default.ttf" )
	EventNum:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	EventNum:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( EventNum )
	self.EventNum = EventNum
	
	local RecTime = LUI.UIText.new()
	RecTime:setLeftRight( 0, 0, 58, 582 )
	RecTime:setTopBottom( 0, 0, 139, 163 )
	RecTime:setText( Engine.Localize( "Recording Time: $(recTime)" ) )
	RecTime:setTTF( "fonts/default.ttf" )
	RecTime:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	RecTime:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( RecTime )
	self.RecTime = RecTime
	
	local SpectatorClient = LUI.UIText.new()
	SpectatorClient:setLeftRight( 0, 0, 58, 582 )
	SpectatorClient:setTopBottom( 0, 0, 168, 192 )
	SpectatorClient:setText( Engine.Localize( "Spectator Client: $(spectatorClient)" ) )
	SpectatorClient:setTTF( "fonts/default.ttf" )
	SpectatorClient:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	SpectatorClient:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SpectatorClient )
	self.SpectatorClient = SpectatorClient
	
	local TargetEntity = LUI.UIText.new()
	TargetEntity:setLeftRight( 0, 0, 58, 582 )
	TargetEntity:setTopBottom( 0, 0, 200, 224 )
	TargetEntity:setText( Engine.Localize( "Target Entity: $(targetEntity)" ) )
	TargetEntity:setTTF( "fonts/default.ttf" )
	TargetEntity:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TargetEntity:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TargetEntity )
	self.TargetEntity = TargetEntity
	
	local Weapon = LUI.UIText.new()
	Weapon:setLeftRight( 0, 0, 57, 582 )
	Weapon:setTopBottom( 0, 0, 234, 258 )
	Weapon:setText( Engine.Localize( "Weapon: $(weaponName)" ) )
	Weapon:setTTF( "fonts/default.ttf" )
	Weapon:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Weapon:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Weapon )
	self.Weapon = Weapon
	
	local MeansOfDeath = LUI.UIText.new()
	MeansOfDeath:setLeftRight( 0, 0, 57, 582 )
	MeansOfDeath:setTopBottom( 0, 0, 265, 289 )
	MeansOfDeath:setText( Engine.Localize( "Means of Death: $(meansOfDeath)" ) )
	MeansOfDeath:setTTF( "fonts/default.ttf" )
	MeansOfDeath:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	MeansOfDeath:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( MeansOfDeath )
	self.MeansOfDeath = MeansOfDeath
	
	local DeathTime = LUI.UIText.new()
	DeathTime:setLeftRight( 0, 0, 57, 582 )
	DeathTime:setTopBottom( 0, 0, 295, 319 )
	DeathTime:setText( Engine.Localize( "Death Time: $(deathTime)" ) )
	DeathTime:setTTF( "fonts/default.ttf" )
	DeathTime:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	DeathTime:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( DeathTime )
	self.DeathTime = DeathTime
	
	local DeathTimeOffset = LUI.UIText.new()
	DeathTimeOffset:setLeftRight( 0, 0, 57, 582 )
	DeathTimeOffset:setTopBottom( 0, 0, 329, 353 )
	DeathTimeOffset:setText( Engine.Localize( "Death Time Offset: $(deathTimeOffset)" ) )
	DeathTimeOffset:setTTF( "fonts/default.ttf" )
	DeathTimeOffset:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	DeathTimeOffset:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( DeathTimeOffset )
	self.DeathTimeOffset = DeathTimeOffset
	
	local OffsetTime = LUI.UIText.new()
	OffsetTime:setLeftRight( 0, 0, 57, 582 )
	OffsetTime:setTopBottom( 0, 0, 362, 386 )
	OffsetTime:setText( Engine.Localize( "Offset Time: $(offsetTime)" ) )
	OffsetTime:setTTF( "fonts/default.ttf" )
	OffsetTime:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	OffsetTime:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( OffsetTime )
	self.OffsetTime = OffsetTime
	
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = menu
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "PotM_Debug.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

