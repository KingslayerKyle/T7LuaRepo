require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_Layout_SaveEmblem" )

CoD.systemOverlay_SaveEmblemFrame = InheritFrom( LUI.UIElement )
CoD.systemOverlay_SaveEmblemFrame.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.systemOverlay_SaveEmblemFrame )
	self.id = "systemOverlay_SaveEmblemFrame"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 480 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local emblem = LUI.UIElement.new()
	emblem:setLeftRight( 0, 0, 55, 575 )
	emblem:setTopBottom( 0, 0, 22, 342 )
	emblem:subscribeToGlobalModel( controller, "Customization", "type", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			emblem:setupEmblem( modelValue )
		end
	end )
	self:addElement( emblem )
	self.emblem = emblem
	
	local emblemBG = LUI.UIImage.new()
	emblemBG:setLeftRight( 0, 0, 55, 575 )
	emblemBG:setTopBottom( 0, 0, 22, 342 )
	emblemBG:setAlpha( 0.1 )
	self:addElement( emblemBG )
	self.emblemBG = emblemBG
	
	local foreground = CoD.systemOverlay_Layout_SaveEmblem.new( menu, controller )
	foreground:setLeftRight( 0, 0, 0, 1920 )
	foreground:setTopBottom( 0, 0, 0, 480 )
	foreground:linkToElementModel( self, nil, false, function ( model )
		foreground:setModel( model, controller )
	end )
	self:addElement( foreground )
	self.foreground = foreground
	
	foreground.id = "foreground"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.foreground:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.foreground:close()
		self.emblem:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

