require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )

CoD.DuplicateCounter = InheritFrom( LUI.UIElement )
CoD.DuplicateCounter.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.DuplicateCounter )
	self.id = "DuplicateCounter"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 30 )
	self:setTopBottom( 0, 0, 0, 30 )
	
	local labelBg = CoD.cac_ItemTitleGlow.new( menu, controller )
	labelBg:setLeftRight( 0, 1, 0, 0 )
	labelBg:setTopBottom( 0, 1, 0, 0 )
	self:addElement( labelBg )
	self.labelBg = labelBg
	
	local count = LUI.UITightText.new()
	count:setLeftRight( 0, 1, 2, -2 )
	count:setTopBottom( 0, 0, 0, 30 )
	count:setRGB( 0, 0, 0 )
	count:setTTF( "fonts/default.ttf" )
	count:linkToElementModel( self, "duplicateCount", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			count:setText( Engine.Localize( modelValue ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( count, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 1 )
	end )
	self:addElement( count )
	self.count = count
	
	self.resetProperties = function ()
		count:completeAnimation()
		labelBg:completeAnimation()
		count:setAlpha( 1 )
		labelBg:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				labelBg:completeAnimation()
				self.labelBg:setAlpha( 0 )
				self.clipFinished( labelBg, {} )
				count:completeAnimation()
				self.count:setAlpha( 0 )
				self.clipFinished( count, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThan( element, controller, "duplicateCount", 1 )
			end
		}
	} )
	self:linkToElementModel( self, "duplicateCount", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "duplicateCount"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.labelBg:close()
		self.count:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

