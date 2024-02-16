-- 16bc99c4a430cc3880cc3b00b3c107d7
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Border" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

local PostLoadFunc = function ( self, controller, menu )
	self:setHandleMouse( true )
end

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
	self.anyChildUsesUpdateState = true
	
	local BackGroundImage = LUI.UIImage.new()
	BackGroundImage:setLeftRight( true, true, 0, 0 )
	BackGroundImage:setTopBottom( true, true, 15, -15 )
	BackGroundImage:setRGB( 0, 0, 0 )
	self:addElement( BackGroundImage )
	self.BackGroundImage = BackGroundImage
	
	local ChannelLabel = LUI.UIText.new()
	ChannelLabel:setLeftRight( true, false, 2, 103 )
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
	focusBorder:setAlpha( 0 )
	self:addElement( focusBorder )
	self.focusBorder = focusBorder
	
	local FocusBarB0 = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB0:setLeftRight( false, false, -88.5, 88.5 )
	FocusBarB0:setTopBottom( false, false, 5, 9 )
	FocusBarB0:setZoom( 1 )
	FocusBarB0:setScale( 0.6 )
	self:addElement( FocusBarB0 )
	self.FocusBarB0 = FocusBarB0
	
	local FEFocusBarTOP = CoD.FE_FocusBarContainer.new( menu, controller )
	FEFocusBarTOP:setLeftRight( false, false, -88.5, 88.5 )
	FEFocusBarTOP:setTopBottom( false, false, -9, -5 )
	FEFocusBarTOP:setZoom( 1 )
	FEFocusBarTOP:setScale( 0.6 )
	self:addElement( FEFocusBarTOP )
	self.FEFocusBarTOP = FEFocusBarTOP
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				BackGroundImage:completeAnimation()
				self.BackGroundImage:setAlpha( 1 )
				self.clipFinished( BackGroundImage, {} )

				focusBorder:completeAnimation()
				self.focusBorder:setAlpha( 0 )
				self.clipFinished( focusBorder, {} )

				FocusBarB0:completeAnimation()
				self.FocusBarB0:setAlpha( 0 )
				self.clipFinished( FocusBarB0, {} )

				FEFocusBarTOP:completeAnimation()
				self.FEFocusBarTOP:setAlpha( 0 )
				self.clipFinished( FEFocusBarTOP, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 4 )

				BackGroundImage:completeAnimation()
				self.BackGroundImage:setAlpha( 1 )
				self.clipFinished( BackGroundImage, {} )

				focusBorder:completeAnimation()
				self.focusBorder:setAlpha( 0 )
				self.clipFinished( focusBorder, {} )

				FocusBarB0:completeAnimation()
				self.FocusBarB0:setAlpha( 1 )
				self.clipFinished( FocusBarB0, {} )

				FEFocusBarTOP:completeAnimation()
				self.FEFocusBarTOP:setAlpha( 1 )
				self.clipFinished( FEFocusBarTOP, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.focusBorder:close()
		element.FocusBarB0:close()
		element.FEFocusBarTOP:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
