require( "ui.uieditor.widgets.MPHudWidgets.WaypointArrowWidget" )

CoD.WaypointArrowContainer = InheritFrom( LUI.UIElement )
CoD.WaypointArrowContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.WaypointArrowContainer )
	self.id = "WaypointArrowContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 44 )
	self:setTopBottom( true, false, 0, 44 )
	self.anyChildUsesUpdateState = true
	
	local WaypointArrowWidget = CoD.WaypointArrowWidget.new( menu, controller )
	WaypointArrowWidget:setLeftRight( true, true, 6, -6 )
	WaypointArrowWidget:setTopBottom( true, true, 29, 17 )
	WaypointArrowWidget:setRGB( 1, 1, 1 )
	self:addElement( WaypointArrowWidget )
	self.WaypointArrowWidget = WaypointArrowWidget
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				WaypointArrowWidget:completeAnimation()
				self.WaypointArrowWidget:setAlpha( 1 )
				self.clipFinished( WaypointArrowWidget, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				WaypointArrowWidget:completeAnimation()
				self.WaypointArrowWidget:setAlpha( 0 )
				self.clipFinished( WaypointArrowWidget, {} )
			end
		}
	}
	self.close = function ( self )
		self.WaypointArrowWidget:close()
		CoD.WaypointArrowContainer.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

