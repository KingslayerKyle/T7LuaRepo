require( "ui.uieditor.widgets.button" )

CoD.client_demo_files_button = InheritFrom( LUI.UIElement )
CoD.client_demo_files_button.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.client_demo_files_button )
	self.id = "client_demo_files_button"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 500 )
	self:setTopBottom( true, false, 0, 50 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local Button = CoD.button.new( menu, controller )
	Button:setLeftRight( true, false, 0, 500 )
	Button:setTopBottom( true, false, 0, 50 )
	self:addElement( Button )
	self.Button = Button
	
	local Author = LUI.UITightText.new()
	Author:setLeftRight( true, false, 315, 369 )
	Author:setTopBottom( true, false, 0, 25 )
	Author:setTTF( "fonts/default.ttf" )
	self:addElement( Author )
	self.Author = Author
	
	local Map = LUI.UITightText.new()
	Map:setLeftRight( true, false, 0, 114 )
	Map:setTopBottom( true, false, 25, 50 )
	Map:setTTF( "fonts/default.ttf" )
	self:addElement( Map )
	self.Map = Map
	
	local Gametype = LUI.UITightText.new()
	Gametype:setLeftRight( true, false, 220, 255 )
	Gametype:setTopBottom( true, false, 25, 50 )
	Gametype:setTTF( "fonts/default.ttf" )
	self:addElement( Gametype )
	self.Gametype = Gametype
	
	local CreateTime = LUI.UITightText.new()
	CreateTime:setLeftRight( true, false, 315, 399 )
	CreateTime:setTopBottom( true, false, 25, 50 )
	CreateTime:setTTF( "fonts/default.ttf" )
	self:addElement( CreateTime )
	self.CreateTime = CreateTime
	
	self.Button:linkToElementModel( self, "fileName", true, function ( model )
		local fileName = Engine.GetModelValue( model )
		if fileName then
			Button.buttoninternal0.Text0:setText( Engine.Localize( fileName ) )
		end
	end )
	self.Author:linkToElementModel( self, "authorName", true, function ( model )
		local authorName = Engine.GetModelValue( model )
		if authorName then
			Author:setText( Engine.Localize( authorName ) )
		end
	end )
	self.Map:linkToElementModel( self, "mapName", true, function ( model )
		local mapName = Engine.GetModelValue( model )
		if mapName then
			Map:setText( Engine.Localize( mapName ) )
		end
	end )
	self.Gametype:linkToElementModel( self, "gameType", true, function ( model )
		local gameType = Engine.GetModelValue( model )
		if gameType then
			Gametype:setText( Engine.Localize( gameType ) )
		end
	end )
	self.CreateTime:linkToElementModel( self, "createTime", true, function ( model )
		local createTime = Engine.GetModelValue( model )
		if createTime then
			CreateTime:setText( Engine.Localize( createTime ) )
		end
	end )
	Button.id = "Button"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.Button:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Button:close()
		element.Author:close()
		element.Map:close()
		element.Gametype:close()
		element.CreateTime:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

