require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )

CoD.RegionItem = InheritFrom( LUI.UIElement )
CoD.RegionItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.RegionItem )
	self.id = "RegionItem"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 577 )
	self:setTopBottom( 0, 0, 0, 51 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( 0, 0, 0, 578 )
	bg:setTopBottom( 0, 0, -1, 51 )
	bg:setRGB( 0, 0, 0 )
	self:addElement( bg )
	self.bg = bg
	
	local Text = LUI.UIText.new()
	Text:setLeftRight( 0, 1, 19, -19 )
	Text:setTopBottom( 0, 0, 8, 46 )
	Text:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Text )
	self.Text = Text
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( 0, 1, 0, 0 )
	StartMenuframenoBG0:setTopBottom( 0, 1, 0, -2 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( 0, 1, 0, 0 )
	FocusBarB:setTopBottom( 1, 1, -5, 0 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( 0, 1, 0, 0 )
	FocusBarT:setTopBottom( 0, 0, -1, 5 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	self.Text:linkToElementModel( self, "itemName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Text:setText( modelValue )
		end
	end )
	self.resetProperties = function ()
		FocusBarB:completeAnimation()
		FocusBarT:completeAnimation()
		Text:completeAnimation()
		FocusBarB:setAlpha( 0 )
		FocusBarT:setAlpha( 0 )
		Text:setRGB( 1, 1, 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
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
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Text:completeAnimation()
				self.Text:setRGB( 0.5, 0.51, 0.52 )
				self.clipFinished( Text, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.StartMenuframenoBG0:close()
		self.FocusBarB:close()
		self.FocusBarT:close()
		self.Text:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

