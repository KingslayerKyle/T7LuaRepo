require( "ui.uieditor.widgets.Lobby.Common.FE_PanelNoBlur" )
require( "ui.uieditor.widgets.Border" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_BackLine" )

CoD.Pregame_ItemVote_PlayerIndicator = InheritFrom( LUI.UIElement )
CoD.Pregame_ItemVote_PlayerIndicator.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Pregame_ItemVote_PlayerIndicator )
	self.id = "Pregame_ItemVote_PlayerIndicator"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 108 )
	self:setTopBottom( true, false, 0, 19 )
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( true, true, 0, 0 )
	Image:setTopBottom( true, false, 0, 18 )
	Image:setRGB( 0, 0, 0 )
	Image:setAlpha( 0.5 )
	self:addElement( Image )
	self.Image = Image
	
	local Panel = CoD.FE_PanelNoBlur.new( menu, controller )
	Panel:setLeftRight( true, true, 0, 0 )
	Panel:setTopBottom( true, false, 0, 19 )
	Panel:setRGB( 0, 0, 0 )
	Panel:setAlpha( 0.4 )
	self:addElement( Panel )
	self.Panel = Panel
	
	local itemName = LUI.UIText.new()
	itemName:setLeftRight( false, false, -54, 54 )
	itemName:setTopBottom( true, false, 2, 18 )
	itemName:setRGB( 0.82, 0.85, 0.88 )
	itemName:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	itemName:setLetterSpacing( 0.5 )
	itemName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	itemName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_BOTTOM )
	itemName:linkToElementModel( self, "hintText", true, function ( model )
		local hintText = Engine.GetModelValue( model )
		if hintText then
			itemName:setText( Engine.Localize( hintText ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( itemName, "setText", function ( element, controller )
		ScaleWidgetToLabelCentered( self, element, 10 )
	end )
	self:addElement( itemName )
	self.itemName = itemName
	
	local Border = CoD.Border.new( menu, controller )
	Border:setLeftRight( true, true, 0, 0 )
	Border:setTopBottom( true, false, 0, 18 )
	self:addElement( Border )
	self.Border = Border
	
	local LineTop0 = CoD.AmmoWidget_BackLine.new( menu, controller )
	LineTop0:setLeftRight( true, false, 38, 70 )
	LineTop0:setTopBottom( true, false, 0, 32 )
	LineTop0:setZRot( -90 )
	self:addElement( LineTop0 )
	self.LineTop0 = LineTop0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				Image:completeAnimation()
				self.Image:setAlpha( 0 )
				self.clipFinished( Image, {} )
				Panel:completeAnimation()
				self.Panel:setAlpha( 0 )
				self.clipFinished( Panel, {} )
				itemName:completeAnimation()
				self.itemName:setAlpha( 0 )
				self.clipFinished( itemName, {} )
				Border:completeAnimation()
				self.Border:setAlpha( 0 )
				self.clipFinished( Border, {} )
				LineTop0:completeAnimation()
				self.LineTop0:setAlpha( 0 )
				self.clipFinished( LineTop0, {} )
			end,
			ShowTooltip = function ()
				self:setupElementClipCounter( 5 )
				Image:completeAnimation()
				self.Image:setAlpha( 0.5 )
				self.clipFinished( Image, {} )
				Panel:completeAnimation()
				self.Panel:setAlpha( 0.4 )
				self.clipFinished( Panel, {} )
				itemName:completeAnimation()
				self.itemName:setAlpha( 1 )
				self.clipFinished( itemName, {} )
				Border:completeAnimation()
				self.Border:setAlpha( 1 )
				self.clipFinished( Border, {} )
				LineTop0:completeAnimation()
				self.LineTop0:setAlpha( 1 )
				self.clipFinished( LineTop0, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Panel:close()
		element.Border:close()
		element.LineTop0:close()
		element.itemName:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

