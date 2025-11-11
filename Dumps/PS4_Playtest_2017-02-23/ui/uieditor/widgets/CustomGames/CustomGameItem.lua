require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgIdle" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.Theater.Theater_TextLable" )

CoD.CustomGameItem = InheritFrom( LUI.UIElement )
CoD.CustomGameItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CustomGameItem )
	self.id = "CustomGameItem"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 264 )
	self:setTopBottom( 0, 0, 0, 162 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgIdle = CoD.cac_ButtonBoxLrgIdle.new( menu, controller )
	BoxButtonLrgIdle:setLeftRight( 0, 1, 0, 0 )
	BoxButtonLrgIdle:setTopBottom( 0, 1, 0, 0 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local GameTypeImage = LUI.UIImage.new()
	GameTypeImage:setLeftRight( 0, 0, 55, 209 )
	GameTypeImage:setTopBottom( 0, 0, 6, 160 )
	GameTypeImage:subscribeToGlobalModel( controller, "MediaManager", "isBuyMoreSlot", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GameTypeImage:setAlpha( BoolToNumber( modelValue ) )
		end
	end )
	self:addElement( GameTypeImage )
	self.GameTypeImage = GameTypeImage
	
	local PlusImage = LUI.UIImage.new()
	PlusImage:setLeftRight( 0, 0, 84, 180 )
	PlusImage:setTopBottom( 0, 0, 21, 117 )
	PlusImage:setAlpha( 0 )
	PlusImage:setImage( RegisterImage( "uie_t7_menu_cacselection_plus" ) )
	self:addElement( PlusImage )
	self.PlusImage = PlusImage
	
	local LabelButton = CoD.Theater_TextLable.new( menu, controller )
	LabelButton:setLeftRight( 0, 0, 1, 262 )
	LabelButton:setTopBottom( 1, 1, -30, -2 )
	LabelButton.itemName:setRGB( 0.99, 0.99, 0.99 )
	LabelButton.itemName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( LabelButton )
	self.LabelButton = LabelButton
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( 0, 1, -2, 2 )
	FocusBarT:setTopBottom( 0, 0, -5, 1 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( 0, 1, -2, 2 )
	FocusBarB:setTopBottom( 1, 1, -1, 5 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	self.GameTypeImage:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GameTypeImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self.LabelButton:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LabelButton.itemName:setText( modelValue )
		end
	end )
	self.resetProperties = function ()
		BoxButtonLrgIdle:completeAnimation()
		FocusBarT:completeAnimation()
		FocusBarB:completeAnimation()
		BoxButtonLrgIdle:setAlpha( 1 )
		FocusBarT:setAlpha( 0 )
		FocusBarB:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0.3 )
				self.clipFinished( BoxButtonLrgIdle, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0.3 )
				self.clipFinished( BoxButtonLrgIdle, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BoxButtonLrgIdle:close()
		self.LabelButton:close()
		self.FocusBarT:close()
		self.FocusBarB:close()
		self.GameTypeImage:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

