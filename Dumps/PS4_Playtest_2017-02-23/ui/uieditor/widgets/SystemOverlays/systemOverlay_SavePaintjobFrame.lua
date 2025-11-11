require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_Layout_SavePaintjob" )

CoD.systemOverlay_SavePaintjobFrame = InheritFrom( LUI.UIElement )
CoD.systemOverlay_SavePaintjobFrame.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.systemOverlay_SavePaintjobFrame )
	self.id = "systemOverlay_SavePaintjobFrame"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 480 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local foreground = CoD.systemOverlay_Layout_SavePaintjob.new( menu, controller )
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
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

