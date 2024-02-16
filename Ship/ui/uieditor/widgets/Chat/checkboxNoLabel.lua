-- c5f37ec0d0157ee5279b801e48ca45c7
-- This hash is used for caching, delete to decompile the file again

CoD.checkboxNoLabel = InheritFrom( LUI.UIElement )
CoD.checkboxNoLabel.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.checkboxNoLabel )
	self.id = "checkboxNoLabel"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 14 )
	self:setTopBottom( true, false, 0, 14 )
	
	local checkboxBkg = LUI.UIImage.new()
	checkboxBkg:setLeftRight( true, true, 0, 0 )
	checkboxBkg:setTopBottom( true, true, 0, 0 )
	checkboxBkg:setImage( RegisterImage( "uie_t7_menu_cacselection_checkbox_empty" ) )
	self:addElement( checkboxBkg )
	self.checkboxBkg = checkboxBkg
	
	local checkboxCheck = LUI.UIImage.new()
	checkboxCheck:setLeftRight( true, true, 0, 0 )
	checkboxCheck:setTopBottom( true, true, 0, 0 )
	checkboxCheck:setImage( RegisterImage( "uie_t7_menu_cacselection_checkbox" ) )
	self:addElement( checkboxCheck )
	self.checkboxCheck = checkboxCheck
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				checkboxBkg:completeAnimation()
				self.checkboxBkg:setRGB( 1, 1, 1 )
				self.checkboxBkg:setAlpha( 1 )
				self.clipFinished( checkboxBkg, {} )

				checkboxCheck:completeAnimation()
				self.checkboxCheck:setRGB( 1, 1, 1 )
				self.checkboxCheck:setAlpha( 0 )
				self.clipFinished( checkboxCheck, {} )
			end
		},
		Checked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				checkboxBkg:completeAnimation()
				self.checkboxBkg:setRGB( 1, 1, 1 )
				self.clipFinished( checkboxBkg, {} )

				checkboxCheck:completeAnimation()
				self.checkboxCheck:setRGB( 1, 1, 1 )
				self.checkboxCheck:setAlpha( 1 )
				self.clipFinished( checkboxCheck, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Checked",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "checked" )
			end
		}
	} )
	self:linkToElementModel( self, "checked", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "checked"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
