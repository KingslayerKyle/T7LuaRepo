-- a3e887adaa732b60bd368c4a4ea3b3a5
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 51 )
	self:setTopBottom( true, false, 0, 25 )
	self.anyChildUsesUpdateState = true
	
	local CallingCardSetCount = LUI.UITightText.new()
	CallingCardSetCount:setLeftRight( true, false, 0, 100 )
	CallingCardSetCount:setTopBottom( true, false, 2, 22 )
	CallingCardSetCount:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	CallingCardSetCount:linkToElementModel( self, "setCount", true, function ( model )
		local setCount = Engine.GetModelValue( model )
		if setCount then
			CallingCardSetCount:setText( Engine.Localize( setCount ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( CallingCardSetCount, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 0 )
	end )
	self:addElement( CallingCardSetCount )
	self.CallingCardSetCount = CallingCardSetCount
	
	local breadcrumbCount = CoD.NewBreadcrumbCount.new( menu, controller )
	breadcrumbCount:setLeftRight( false, true, 5, 23 )
	breadcrumbCount:setTopBottom( false, false, -9, 9 )
	breadcrumbCount:linkToElementModel( self, nil, false, function ( model )
		breadcrumbCount:setModel( model, controller )
	end )
	breadcrumbCount:linkToElementModel( self, "newCount", true, function ( model )
		local newCount = Engine.GetModelValue( model )
		if newCount then
			breadcrumbCount.countText:setText( Engine.Localize( newCount ) )
		end
	end )
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
	self:addElement( breadcrumbCount )
	self.breadcrumbCount = breadcrumbCount
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				CallingCardSetCount:completeAnimation()
				self.CallingCardSetCount:setLeftRight( true, false, 0, 100 )
				self.CallingCardSetCount:setTopBottom( true, false, 2, 22 )
				self.clipFinished( CallingCardSetCount, {} )
			end
		},
		isBMClassified = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				CallingCardSetCount:completeAnimation()
				self.CallingCardSetCount:setLeftRight( true, false, 0, 100 )
				self.CallingCardSetCount:setTopBottom( true, false, 2, 22 )
				self.CallingCardSetCount:setAlpha( 0 )
				self.clipFinished( CallingCardSetCount, {} )
			end
		},
		CommonSet = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				CallingCardSetCount:completeAnimation()
				self.CallingCardSetCount:setLeftRight( false, false, -50, 50 )
				self.CallingCardSetCount:setTopBottom( true, false, 70.5, 90.5 )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.breadcrumbCount:close()
		element.CallingCardSetCount:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

