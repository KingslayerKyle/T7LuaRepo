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
	self:setLeftRight( 0, 0, 0, 21 )
	self:setTopBottom( 0, 0, 0, 21 )
	
	local checkboxBkg = LUI.UIImage.new()
	checkboxBkg:setLeftRight( 0, 1, 0, 0 )
	checkboxBkg:setTopBottom( 0, 1, 0, 0 )
	checkboxBkg:setImage( RegisterImage( "uie_t7_menu_cacselection_checkbox_empty" ) )
	self:addElement( checkboxBkg )
	self.checkboxBkg = checkboxBkg
	
	local checkboxCheck = LUI.UIImage.new()
	checkboxCheck:setLeftRight( 0, 1, 0, 0 )
	checkboxCheck:setTopBottom( 0, 1, 0, 0 )
	checkboxCheck:setImage( RegisterImage( "uie_t7_menu_cacselection_checkbox" ) )
	self:addElement( checkboxCheck )
	self.checkboxCheck = checkboxCheck
	
	self.resetProperties = function ()
		checkboxCheck:completeAnimation()
		checkboxCheck:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				checkboxCheck:completeAnimation()
				self.checkboxCheck:setAlpha( 0 )
				self.clipFinished( checkboxCheck, {} )
			end
		},
		Checked = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
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

