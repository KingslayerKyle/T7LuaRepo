require( "ui.uieditor.widgets.ZMInventoryIsland.IslandSkullWidgetSkull" )

CoD.IslandSkullWidget = InheritFrom( LUI.UIElement )
CoD.IslandSkullWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.IslandSkullWidget )
	self.id = "IslandSkullWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 164 )
	self:setTopBottom( true, false, 0, 164 )
	self.anyChildUsesUpdateState = true
	
	local IslandSkullWidgetSkull0 = CoD.IslandSkullWidgetSkull.new( menu, controller )
	IslandSkullWidgetSkull0:setLeftRight( true, true, 0, 0 )
	IslandSkullWidgetSkull0:setTopBottom( true, true, 0, 0 )
	self:addElement( IslandSkullWidgetSkull0 )
	self.IslandSkullWidgetSkull0 = IslandSkullWidgetSkull0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				IslandSkullWidgetSkull0:completeAnimation()
				self.IslandSkullWidgetSkull0:setAlpha( 0 )
				self.clipFinished( IslandSkullWidgetSkull0, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				IslandSkullWidgetSkull0:completeAnimation()
				self.IslandSkullWidgetSkull0:setAlpha( 1 )
				self.clipFinished( IslandSkullWidgetSkull0, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.IslandSkullWidgetSkull0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

