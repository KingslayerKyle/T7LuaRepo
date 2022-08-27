-- e785890a05db196ef388c2f5035ce67a
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

CoD.InputButton = InheritFrom( LUI.UIElement )
CoD.InputButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.InputButton )
	self.id = "InputButton"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 385 )
	self:setTopBottom( true, false, 0, 34 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( true, true, 0, 0 )
	StartMenuframenoBG0:setTopBottom( true, true, 0, -1 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local Text = LUI.UIText.new()
	Text:setLeftRight( true, true, 7, -9 )
	Text:setTopBottom( true, false, 8.5, 28.5 )
	Text:setText( Engine.Localize( "MENU_NEW" ) )
	Text:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Text )
	self.Text = Text
	
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
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				Text:completeAnimation()
				self.Text:setRGB( 1, 1, 1 )
				self.clipFinished( Text, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 3 )
				Text:completeAnimation()
				self.Text:setRGB( 1, 1, 1 )
				self.clipFinished( Text, {} )
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
				Text:completeAnimation()
				self.Text:setRGB( 1, 1, 1 )
				self.clipFinished( Text, {} )
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
				Text:completeAnimation()
				self.Text:setRGB( 0.5, 0.51, 0.52 )
				self.clipFinished( Text, {} )
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

