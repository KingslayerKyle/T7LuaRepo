require( "ui.uieditor.widgets.Border" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_BackLine" )
require( "ui.uieditor.widgets.Lobby.Common.FE_PanelNoBlur" )

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
	self:setLeftRight( 0, 0, 0, 162 )
	self:setTopBottom( 0, 0, 0, 28 )
	
	local LineTop0 = CoD.AmmoWidget_BackLine.new( menu, controller )
	LineTop0:setLeftRight( 0, 0, 57, 105 )
	LineTop0:setTopBottom( 0, 0, 0, 48 )
	LineTop0:setAlpha( 0 )
	LineTop0:setZRot( -90 )
	self:addElement( LineTop0 )
	self.LineTop0 = LineTop0
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( 0, 1, 0, 0 )
	Image:setTopBottom( 0, 0, 0, 27 )
	Image:setRGB( 0, 0, 0 )
	Image:setAlpha( 0.5 )
	self:addElement( Image )
	self.Image = Image
	
	local Panel = CoD.FE_PanelNoBlur.new( menu, controller )
	Panel:setLeftRight( 0, 1, 4, 0 )
	Panel:setTopBottom( 0, 0, 0, 28 )
	Panel:setRGB( 0, 0, 0 )
	Panel:setAlpha( 0.4 )
	self:addElement( Panel )
	self.Panel = Panel
	
	local itemName = LUI.UIText.new()
	itemName:setLeftRight( 0.5, 0.5, -81, 81 )
	itemName:setTopBottom( 0, 0, 3, 27 )
	itemName:setRGB( 0.82, 0.85, 0.88 )
	itemName:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	itemName:setLetterSpacing( 0.5 )
	itemName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	itemName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_BOTTOM )
	itemName:linkToElementModel( self, "hintText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( itemName, "setText", function ( element, text )
		ScaleWidgetToLabelCentered( self, element, 10 )
	end )
	self:addElement( itemName )
	self.itemName = itemName
	
	local Border = CoD.Border.new( menu, controller )
	Border:setLeftRight( 0, 1, 0, 0 )
	Border:setTopBottom( 0, 0, 0, 27 )
	self:addElement( Border )
	self.Border = Border
	
	local AlliesColor = LUI.UIImage.new()
	AlliesColor:setLeftRight( 0, 1, 2, 0 )
	AlliesColor:setTopBottom( 0, 0, -1, 3 )
	AlliesColor:subscribeToGlobalModel( controller, "Factions", "alliesFactionColor", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			AlliesColor:setRGB( modelValue )
		end
	end )
	self:addElement( AlliesColor )
	self.AlliesColor = AlliesColor
	
	local AxisColor = LUI.UIImage.new()
	AxisColor:setLeftRight( 0, 1, 2, 0 )
	AxisColor:setTopBottom( 0, 0, -1, 3 )
	AxisColor:subscribeToGlobalModel( controller, "Factions", "axisFactionColor", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			AxisColor:setRGB( modelValue )
		end
	end )
	self:addElement( AxisColor )
	self.AxisColor = AxisColor
	
	self.resetProperties = function ()
		Image:completeAnimation()
		Panel:completeAnimation()
		itemName:completeAnimation()
		Border:completeAnimation()
		AlliesColor:completeAnimation()
		AxisColor:completeAnimation()
		Image:setAlpha( 0.5 )
		Panel:setAlpha( 0.4 )
		itemName:setAlpha( 1 )
		Border:setAlpha( 1 )
		AlliesColor:setAlpha( 1 )
		AxisColor:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
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
				AlliesColor:completeAnimation()
				self.AlliesColor:setAlpha( 0 )
				self.clipFinished( AlliesColor, {} )
				AxisColor:completeAnimation()
				self.AxisColor:setAlpha( 0 )
				self.clipFinished( AxisColor, {} )
			end,
			ShowTooltip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				AxisColor:completeAnimation()
				self.AxisColor:setAlpha( 0 )
				self.clipFinished( AxisColor, {} )
			end
		},
		IfisAxis = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
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
				AlliesColor:completeAnimation()
				self.AlliesColor:setAlpha( 0 )
				self.clipFinished( AlliesColor, {} )
				AxisColor:completeAnimation()
				self.AxisColor:setAlpha( 0 )
				self.clipFinished( AxisColor, {} )
			end,
			ShowTooltip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				AlliesColor:completeAnimation()
				self.AlliesColor:setAlpha( 0 )
				self.clipFinished( AlliesColor, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "IfisAxis",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "intData", Enum.team_t.TEAM_AXIS )
			end
		}
	} )
	self:linkToElementModel( self, "intData", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "intData"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LineTop0:close()
		self.Panel:close()
		self.Border:close()
		self.itemName:close()
		self.AlliesColor:close()
		self.AxisColor:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

