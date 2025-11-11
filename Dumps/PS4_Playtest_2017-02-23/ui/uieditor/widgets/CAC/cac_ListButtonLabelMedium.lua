require( "ui.uieditor.widgets.Lobby.Common.FE_PanelNoBlur" )

CoD.cac_ListButtonLabelMedium = InheritFrom( LUI.UIElement )
CoD.cac_ListButtonLabelMedium.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.cac_ListButtonLabelMedium )
	self.id = "cac_ListButtonLabelMedium"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 156 )
	self:setTopBottom( 0, 0, 0, 36 )
	
	local Panel = CoD.FE_PanelNoBlur.new( menu, controller )
	Panel:setLeftRight( 0, 1, 0, 0 )
	Panel:setTopBottom( 0, 1, 0, 0 )
	Panel:setRGB( 0, 0, 0 )
	Panel:setAlpha( 0.4 )
	self:addElement( Panel )
	self.Panel = Panel
	
	local itemName = LUI.UIText.new()
	itemName:setLeftRight( 0, 0, 6, 150 )
	itemName:setTopBottom( 1, 1, -33, 0 )
	itemName:setRGB( 0.82, 0.85, 0.88 )
	itemName:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	itemName:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	itemName:setShaderVector( 0, 0.01, 0, 0, 0 )
	itemName:setShaderVector( 1, 0.01, 0, 0, 0 )
	itemName:setShaderVector( 2, 1, 0, 0, 0 )
	itemName:setLetterSpacing( 0.5 )
	itemName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	itemName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_BOTTOM )
	itemName:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( itemName, "setText", function ( element, text )
		ScaleWidgetToLabelWrappedUp( self, element, 1, 1 )
	end )
	self:addElement( itemName )
	self.itemName = itemName
	
	self.resetProperties = function ()
		Panel:completeAnimation()
		itemName:completeAnimation()
		Panel:setAlpha( 0.4 )
		itemName:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				Panel:completeAnimation()
				self.Panel:setAlpha( 0 )
				self.clipFinished( Panel, {} )
				itemName:completeAnimation()
				self.itemName:setAlpha( 0 )
				self.clipFinished( itemName, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return not IsCACSlotEquipped( menu, element, controller )
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Panel:close()
		self.itemName:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

