-- d552c6b963edc6c6e957db0d8dd5aafc
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

CoD.RegisterField = InheritFrom( LUI.UIElement )
CoD.RegisterField.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.RegisterField )
	self.id = "RegisterField"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 385 )
	self:setTopBottom( true, false, 0, 34 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local Label = LUI.UIText.new()
	Label:setLeftRight( true, true, 12.75, -12.75 )
	Label:setTopBottom( true, false, 5.5, 30.5 )
	Label:setText( Engine.Localize( "MENU_NEW" ) )
	Label:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Label:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Label:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Label )
	self.Label = Label
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( true, true, 0, 0 )
	StartMenuframenoBG0:setTopBottom( true, true, 0, -1 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, 0, 0 )
	FocusBarB:setTopBottom( false, true, -3.5, 0 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, 0, 0 )
	FocusBarT:setTopBottom( true, false, -1, 3 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local Value = LUI.UIText.new()
	Value:setLeftRight( true, true, 12.5, -12.5 )
	Value:setTopBottom( true, false, 5.5, 30.5 )
	Value:setText( Engine.Localize( "" ) )
	Value:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Value:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Value:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Value )
	self.Value = Value
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				Label:completeAnimation()
				self.Label:setRGB( 1, 1, 1 )
				self.clipFinished( Label, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 3 )
				Label:completeAnimation()
				self.Label:setRGB( 1, 1, 1 )
				self.clipFinished( Label, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, true, 0, 0 )
				self.FocusBarB:setTopBottom( false, true, -3.5, 0 )
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 3 )
				Label:completeAnimation()
				self.Label:setRGB( 1, 1, 1 )
				self.clipFinished( Label, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Label:completeAnimation()
				self.Label:setRGB( 0.5, 0.51, 0.52 )
				self.clipFinished( Label, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuframenoBG0:close()
		element.FocusBarB:close()
		element.FocusBarT:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

