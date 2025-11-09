require( "ui.uieditor.widgets.Lobby.Common.FE_PanelNoBlur" )

CoD.scorestreaks_BoxLabel = InheritFrom( LUI.UIElement )
CoD.scorestreaks_BoxLabel.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.scorestreaks_BoxLabel )
	self.id = "scorestreaks_BoxLabel"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 114 )
	self:setTopBottom( true, false, 0, 19 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local Panel = CoD.FE_PanelNoBlur.new( menu, controller )
	Panel:setLeftRight( true, true, 0, 0 )
	Panel:setTopBottom( false, false, -9.5, 9.5 )
	Panel:setRGB( 0, 0, 0 )
	Panel:setAlpha( 0.7 )
	self:addElement( Panel )
	self.Panel = Panel
	
	local name = LUI.UITightText.new()
	name:setLeftRight( true, true, 3, 0 )
	name:setTopBottom( false, false, -8.5, 7.5 )
	name:setRGB( 1, 1, 1 )
	name:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	name:setLetterSpacing( 0.5 )
	name:linkToElementModel( self, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			name:setText( Engine.Localize( GetItemNameFromIndex( modelValue ) ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( name, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 1 )
	end )
	self:addElement( name )
	self.name = name
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self:setupElementClipCounter( 0 )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Equipped = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self:setupElementClipCounter( 0 )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		New = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self:setupElementClipCounter( 0 )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				return IsCACItemEquipped( menu, element, controller )
			end
		},
		{
			stateName = "New",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self.close = function ( self )
		self.Panel:close()
		self.name:close()
		CoD.scorestreaks_BoxLabel.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

