-- c177e3b20710fc835e8aa96b19d88461
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_PanelNoBlur" )

CoD.scorestreaks_BoxLabel = InheritFrom( LUI.UIElement )
CoD.scorestreaks_BoxLabel.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.scorestreaks_BoxLabel )
	self.id = "scorestreaks_BoxLabel"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 114 )
	self:setTopBottom( true, false, 0, 19 )
	
	local Panel = CoD.FE_PanelNoBlur.new( menu, controller )
	Panel:setLeftRight( true, true, 0, 0 )
	Panel:setTopBottom( false, false, -9.5, 9.5 )
	Panel:setRGB( 0, 0, 0 )
	Panel:setAlpha( 0.7 )
	self:addElement( Panel )
	self.Panel = Panel
	
	local name = LUI.UITightText.new()
	name:setLeftRight( true, true, 1.5, -1.5 )
	name:setTopBottom( false, false, -9.5, 8.5 )
	name:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	name:setLetterSpacing( 0.5 )
	name:linkToElementModel( self, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			name:setText( Engine.Localize( GetItemNameFromIndex( itemIndex ) ) )
		end
	end )

	LUI.OverrideFunction_CallOriginalFirst( name, "setText", function ( element, controller )
		ScaleWidgetToLabelWrappedUp( self, element, 2, 2 )
	end )
	self:addElement( name )
	self.name = name
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Panel:close()
		element.name:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
