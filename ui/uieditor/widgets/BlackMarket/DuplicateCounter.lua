-- 1c8c256d2ada4e9000ddd463cb1626f4
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 20 )
	self:setTopBottom( true, false, 0, 20 )
	
	local labelBg = CoD.cac_ItemTitleGlow.new( menu, controller )
	labelBg:setLeftRight( true, true, 0, 0 )
	labelBg:setTopBottom( true, true, 0, 0 )
	self:addElement( labelBg )
	self.labelBg = labelBg
	
	local count = LUI.UITightText.new()
	count:setLeftRight( true, true, 1, -1 )
	count:setTopBottom( true, false, 0, 20 )
	count:setRGB( 0, 0, 0 )
	count:setTTF( "fonts/default.ttf" )
	count:linkToElementModel( self, "duplicateCount", true, function ( model )
		local duplicateCount = Engine.GetModelValue( model )
		if duplicateCount then
			count:setText( Engine.Localize( duplicateCount ) )
		end
	end )

	LUI.OverrideFunction_CallOriginalFirst( count, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 1 )
	end )
	self:addElement( count )
	self.count = count
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
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
				self:setupElementClipCounter( 2 )

				labelBg:completeAnimation()
				self.labelBg:setAlpha( 1 )
				self.clipFinished( labelBg, {} )

				count:completeAnimation()
				self.count:setAlpha( 1 )
				self.clipFinished( count, {} )
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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.labelBg:close()
		element.count:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
