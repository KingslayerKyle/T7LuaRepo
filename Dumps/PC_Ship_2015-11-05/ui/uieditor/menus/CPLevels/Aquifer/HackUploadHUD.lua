require( "ui.uieditor.widgets.CPLevels.Aquifer.HackUploadProgress" )

local PreLoadFunc = function ( self, controller )
	Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( controller ), "hackUpload" ), "objId" ), 0 )
end

LUI.createMenu.HackUploadHUD = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "HackUploadHUD" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "none"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "HackUploadHUD.buttonPrompts" )
	local f2_local1 = self
	
	local progressWidget = CoD.HackUploadProgress.new( f2_local1, controller )
	progressWidget:setLeftRight( true, false, 32.5, 232.5 )
	progressWidget:setTopBottom( true, false, 124, 149 )
	progressWidget:subscribeToGlobalModel( controller, "PerController", "hackUpload", function ( model )
		progressWidget:setModel( model, controller )
	end )
	self:addElement( progressWidget )
	self.progressWidget = progressWidget
	
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f2_local1
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.progressWidget:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "HackUploadHUD.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

