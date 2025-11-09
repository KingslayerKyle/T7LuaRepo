require( "ui.uieditor.widgets.Border" )

CoD.ChannelSelectorButton = InheritFrom( LUI.UIElement )
CoD.ChannelSelectorButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChannelSelectorButton )
	self.id = "ChannelSelectorButton"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 103 )
	self:setTopBottom( true, false, 0, 14 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local ChannelLabel = LUI.UIText.new()
	ChannelLabel:setLeftRight( true, false, 0, 103 )
	ChannelLabel:setTopBottom( true, false, 0, 14 )
	ChannelLabel:setText( Engine.Localize( "MENU_NEW" ) )
	ChannelLabel:setTTF( "fonts/default.ttf" )
	ChannelLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ChannelLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ChannelLabel )
	self.ChannelLabel = ChannelLabel
	
	local focusBorder = CoD.Border.new( menu, controller )
	focusBorder:setLeftRight( true, true, 0, 0 )
	focusBorder:setTopBottom( true, true, 0, 0 )
	focusBorder:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
	self:addElement( focusBorder )
	self.focusBorder = focusBorder
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				focusBorder:completeAnimation()
				self.focusBorder:setAlpha( 0 )
				self.clipFinished( focusBorder, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 1 )
				focusBorder:completeAnimation()
				self.focusBorder:setAlpha( 1 )
				self.clipFinished( focusBorder, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.focusBorder:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

