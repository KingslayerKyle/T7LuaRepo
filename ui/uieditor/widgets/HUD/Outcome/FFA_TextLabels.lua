-- 0ddaec14fea4aba594edb4dd612110e0
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_PanelNoBlur" )

CoD.FFA_TextLabels = InheritFrom( LUI.UIElement )
CoD.FFA_TextLabels.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FFA_TextLabels )
	self.id = "FFA_TextLabels"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 218 )
	self:setTopBottom( true, false, 0, 28 )
	
	local Panel = CoD.FE_PanelNoBlur.new( menu, controller )
	Panel:setLeftRight( true, true, 0, 0 )
	Panel:setTopBottom( true, true, 0, 0 )
	Panel:setRGB( 0, 0, 0 )
	Panel:setAlpha( 0.4 )
	self:addElement( Panel )
	self.Panel = Panel
	
	local itemName = LUI.UIText.new()
	itemName:setLeftRight( true, false, 4.18, 270 )
	itemName:setTopBottom( false, false, -13, 13 )
	itemName:setText( Engine.Localize( "WWWWWWWWWWWWWW" ) )
	itemName:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	itemName:setLetterSpacing( 0.5 )
	itemName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	itemName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( itemName, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 1 )
	end )
	self:addElement( itemName )
	self.itemName = itemName
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				itemName:completeAnimation()
				self.itemName:setRGB( 1, 1, 1 )
				self.clipFinished( itemName, {} )
			end
		},
		PlayerYellow = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				itemName:completeAnimation()
				self.itemName:setRGB( ColorSet.PlayerYellow.r, ColorSet.PlayerYellow.g, ColorSet.PlayerYellow.b )
				self.clipFinished( itemName, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Panel:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

