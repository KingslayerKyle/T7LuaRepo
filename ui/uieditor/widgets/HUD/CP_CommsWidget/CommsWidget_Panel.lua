-- 748f1205b1fcb81fb04b9b132e60e9a8
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_PanelOct" )

CoD.CommsWidget_Panel = InheritFrom( LUI.UIElement )
CoD.CommsWidget_Panel.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CommsWidget_Panel )
	self.id = "CommsWidget_Panel"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 97 )
	self:setTopBottom( true, false, 0, 97 )
	
	local PanelOctagon = CoD.AmmoWidget_PanelOct.new( menu, controller )
	PanelOctagon:setLeftRight( false, true, -97.33, 0 )
	PanelOctagon:setTopBottom( true, false, 0, 97.33 )
	PanelOctagon:setZoom( -10 )
	self:addElement( PanelOctagon )
	self.PanelOctagon = PanelOctagon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			OffsiteCommsActive = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		OffsiteCommsActive = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.PanelOctagon:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

