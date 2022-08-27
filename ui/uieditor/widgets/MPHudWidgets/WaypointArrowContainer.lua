-- 33a4feaeaddb17fe41ade1bb8cdaf592
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 29 )
	self:setTopBottom( true, false, 0, 31 )
	self.anyChildUsesUpdateState = true
	
	local WaypointArrowWidget = CoD.WaypointArrowWidget.new( menu, controller )
	WaypointArrowWidget:setLeftRight( false, false, -16, 16 )
	WaypointArrowWidget:setTopBottom( false, false, 8, 40 )
	self:addElement( WaypointArrowWidget )
	self.WaypointArrowWidget = WaypointArrowWidget
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				WaypointArrowWidget:completeAnimation()
				self.WaypointArrowWidget:setLeftRight( false, false, -16, 16 )
				self.WaypointArrowWidget:setTopBottom( false, false, 8, 40 )
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
		},
		Progress = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				WaypointArrowWidget:completeAnimation()
				self.WaypointArrowWidget:setLeftRight( false, false, -16, 16 )
				self.WaypointArrowWidget:setTopBottom( false, false, 15, 47 )
				self.WaypointArrowWidget:setAlpha( 1 )
				self.clipFinished( WaypointArrowWidget, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.WaypointArrowWidget:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

