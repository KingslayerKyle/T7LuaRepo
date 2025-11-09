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
	Button:setRGB( 1, 1, 1 )
	self:addElement( Button )
	self.Button = Button
	
	local Author = LUI.UITightText.new()
	Author:setLeftRight( true, false, 315, 369 )
	Author:setTopBottom( true, false, 0, 25 )
	Author:setRGB( 1, 1, 1 )
	Author:setTTF( "fonts/default.ttf" )
	self:addElement( Author )
	self.Author = Author
	
	local Map = LUI.UITightText.new()
	Map:setLeftRight( true, false, 0, 114 )
	Map:setTopBottom( true, false, 25, 50 )
	Map:setRGB( 1, 1, 1 )
	Map:setTTF( "fonts/default.ttf" )
	self:addElement( Map )
	self.Map = Map
	
	local Gametype = LUI.UITightText.new()
	Gametype:setLeftRight( true, false, 220, 255 )
	Gametype:setTopBottom( true, false, 25, 50 )
	Gametype:setRGB( 1, 1, 1 )
	Gametype:setTTF( "fonts/default.ttf" )
	self:addElement( Gametype )
	self.Gametype = Gametype
	
	local CreateTime = LUI.UITightText.new()
	CreateTime:setLeftRight( true, false, 315, 399 )
	CreateTime:setTopBottom( true, false, 25, 50 )
	CreateTime:setRGB( 1, 1, 1 )
	CreateTime:setTTF( "fonts/default.ttf" )
	self:addElement( CreateTime )
	self.CreateTime = CreateTime
	
	self.Button:linkToElementModel( self, "fileName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Button.buttoninternal0.Text0:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.Author:linkToElementModel( self, "authorName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Author:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.Map:linkToElementModel( self, "mapName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Map:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.Gametype:linkToElementModel( self, "gameType", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Gametype:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.CreateTime:linkToElementModel( self, "createTime", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CreateTime:setText( Engine.Localize( modelValue ) )
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
	self.close = function ( self )
		self.Button:close()
		self.Author:close()
		self.Map:close()
		self.Gametype:close()
		self.CreateTime:close()
		CoD.client_demo_files_button.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

