require( "ui.uieditor.widgets.CAC.NewBreadcrumbCount" )

CoD.CallingCards_BlackMarket_Set_CountWidget = InheritFrom( LUI.UIElement )
CoD.CallingCards_BlackMarket_Set_CountWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CallingCards_BlackMarket_Set_CountWidget )
	self.id = "CallingCards_BlackMarket_Set_CountWidget"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 76 )
	self:setTopBottom( 0, 0, 0, 37 )
	self.anyChildUsesUpdateState = true
	
	local CallingCardSetCount = LUI.UITightText.new()
	CallingCardSetCount:setLeftRight( 0, 0, 0, 150 )
	CallingCardSetCount:setTopBottom( 0, 0, 3, 33 )
	CallingCardSetCount:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	CallingCardSetCount:linkToElementModel( self, "setCount", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CallingCardSetCount:setText( Engine.Localize( modelValue ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( CallingCardSetCount, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 0 )
	end )
	self:addElement( CallingCardSetCount )
	self.CallingCardSetCount = CallingCardSetCount
	
	local breadcrumbCount = CoD.NewBreadcrumbCount.new( menu, controller )
	breadcrumbCount:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThan( element, controller, "newCount", 0 )
			end
		}
	} )
	breadcrumbCount:linkToElementModel( breadcrumbCount, "newCount", true, function ( model )
		menu:updateElementState( breadcrumbCount, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "newCount"
		} )
	end )
	breadcrumbCount:setLeftRight( 1, 1, 7.5, 34.5 )
	breadcrumbCount:setTopBottom( 0.5, 0.5, -13.5, 13.5 )
	breadcrumbCount:linkToElementModel( self, nil, false, function ( model )
		breadcrumbCount:setModel( model, controller )
	end )
	breadcrumbCount:linkToElementModel( self, "newCount", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			breadcrumbCount.countText:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( breadcrumbCount )
	self.breadcrumbCount = breadcrumbCount
	
	self.resetProperties = function ()
		CallingCardSetCount:completeAnimation()
		CallingCardSetCount:setLeftRight( 0, 0, 0, 150 )
		CallingCardSetCount:setTopBottom( 0, 0, 3, 33 )
		CallingCardSetCount:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		isBMClassified = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				CallingCardSetCount:completeAnimation()
				self.CallingCardSetCount:setAlpha( 0 )
				self.clipFinished( CallingCardSetCount, {} )
			end
		},
		CommonSet = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				CallingCardSetCount:completeAnimation()
				self.CallingCardSetCount:setLeftRight( 0.5, 0.5, -75, 75 )
				self.CallingCardSetCount:setTopBottom( 0, 0, 106, 136 )
				self.clipFinished( CallingCardSetCount, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "isBMClassified",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isSetBMClassified" )
			end
		},
		{
			stateName = "CommonSet",
			condition = function ( menu, element, event )
				return PropertyIsTrue( self, "commonSet" )
			end
		}
	} )
	self:linkToElementModel( self, "isSetBMClassified", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isSetBMClassified"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.breadcrumbCount:close()
		self.CallingCardSetCount:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

