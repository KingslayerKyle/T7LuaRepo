-- 5e8ca6a5996e38ab757be23c79d04c3e
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgIdle" )
require( "ui.uieditor.widgets.Theater.Theater_TextLable" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

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
	self:setLeftRight( true, false, 0, 176 )
	self:setTopBottom( true, false, 0, 108 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgIdle = CoD.cac_ButtonBoxLrgIdle.new( menu, controller )
	BoxButtonLrgIdle:setLeftRight( true, true, 0, 0 )
	BoxButtonLrgIdle:setTopBottom( true, true, 0, 0 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local GameTypeImage = LUI.UIImage.new()
	GameTypeImage:setLeftRight( true, false, 36.63, 139.38 )
	GameTypeImage:setTopBottom( true, false, 4.25, 107 )
	GameTypeImage:subscribeToGlobalModel( controller, "MediaManager", "isBuyMoreSlot", function ( model )
		local isBuyMoreSlot = Engine.GetModelValue( model )
		if isBuyMoreSlot then
			GameTypeImage:setAlpha( BoolToNumber( isBuyMoreSlot ) )
		end
	end )
	self:addElement( GameTypeImage )
	self.GameTypeImage = GameTypeImage
	
	local PlusImage = LUI.UIImage.new()
	PlusImage:setLeftRight( true, false, 56, 120 )
	PlusImage:setTopBottom( true, false, 14, 78 )
	PlusImage:setAlpha( 0 )
	PlusImage:setImage( RegisterImage( "uie_t7_menu_cacselection_plus" ) )
	self:addElement( PlusImage )
	self.PlusImage = PlusImage
	
	local LabelButton = CoD.Theater_TextLable.new( menu, controller )
	LabelButton:setLeftRight( true, false, 1, 175 )
	LabelButton:setTopBottom( false, true, -20, -1 )
	LabelButton.itemName:setRGB( 0.99, 0.99, 0.99 )
	LabelButton.itemName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( LabelButton )
	self.LabelButton = LabelButton
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, -1, 1 )
	FocusBarT:setTopBottom( true, false, -3, 1 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, -1, 1 )
	FocusBarB:setTopBottom( false, true, -1, 3 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	self.GameTypeImage:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			GameTypeImage:setImage( RegisterImage( image ) )
		end
	end )
	self.LabelButton:linkToElementModel( self, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			LabelButton.itemName:setText( name )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0.3 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 3 )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 3 )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 3 )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0.3 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BoxButtonLrgIdle:close()
		element.LabelButton:close()
		element.FocusBarT:close()
		element.FocusBarB:close()
		element.GameTypeImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

