CoD.SelectionItemCount = InheritFrom( LUI.UIElement )
CoD.SelectionItemCount.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SelectionItemCount )
	self.id = "SelectionItemCount"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 40 )
	self:setTopBottom( 0, 0, 0, 30 )
	
	local backing = LUI.UIImage.new()
	backing:setLeftRight( 0, 1, 0, 0 )
	backing:setTopBottom( 0, 1, 0, 0 )
	backing:setAlpha( 0.7 )
	self:addElement( backing )
	self.backing = backing
	
	local countTextBox = LUI.UIText.new()
	countTextBox:setLeftRight( 0, 0, 0, 40 )
	countTextBox:setTopBottom( 0, 0, 0, 30 )
	countTextBox:setRGB( 0, 0, 0 )
	countTextBox:setTTF( "fonts/default.ttf" )
	countTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	countTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	countTextBox:linkToElementModel( self, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			countTextBox:setText( Engine.Localize( PrependString( "x", modelValue ) ) )
		end
	end )
	self:addElement( countTextBox )
	self.countTextBox = countTextBox
	
	self.resetProperties = function ()
		countTextBox:completeAnimation()
		backing:completeAnimation()
		countTextBox:setAlpha( 1 )
		backing:setAlpha( 0.7 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				backing:completeAnimation()
				self.backing:setAlpha( 0 )
				self.clipFinished( backing, {} )
				countTextBox:completeAnimation()
				self.countTextBox:setAlpha( 0 )
				self.clipFinished( countTextBox, {} )
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
				return IsSelfModelValueGreaterThan( self, controller, "itemIndex", CoD.CACUtility.EmptyItemIndex )
			end
		}
	} )
	self:linkToElementModel( self, "itemIndex", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.countTextBox:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

