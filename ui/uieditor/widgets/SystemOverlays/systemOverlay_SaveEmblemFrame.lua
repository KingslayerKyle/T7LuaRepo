-- cac261a847f86517db450adaff80a951
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 320 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local emblem = LUI.UIElement.new()
	emblem:setLeftRight( true, false, 36.5, 383.5 )
	emblem:setTopBottom( true, false, 15, 228 )
	emblem:subscribeToGlobalModel( controller, "Customization", "type", function ( model )
		local type = Engine.GetModelValue( model )
		if type then
			emblem:setupEmblem( type )
		end
	end )
	self:addElement( emblem )
	self.emblem = emblem
	
	local emblemBG = LUI.UIImage.new()
	emblemBG:setLeftRight( true, false, 36.5, 383.5 )
	emblemBG:setTopBottom( true, false, 15, 228 )
	emblemBG:setAlpha( 0.1 )
	self:addElement( emblemBG )
	self.emblemBG = emblemBG
	
	local foreground = CoD.systemOverlay_Layout_SaveEmblem.new( menu, controller )
	foreground:setLeftRight( true, false, 0, 1280 )
	foreground:setTopBottom( true, false, 0, 320 )
	foreground:linkToElementModel( self, nil, false, function ( model )
		foreground:setModel( model, controller )
	end )
	self:addElement( foreground )
	self.foreground = foreground
	
	foreground.id = "foreground"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.foreground:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.foreground:close()
		element.emblem:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
