require( "ui.uieditor.widgets.Border" )

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
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local checkboxBkg = LUI.UIImage.new()
	checkboxBkg:setLeftRight( true, true, 1, -1 )
	checkboxBkg:setTopBottom( true, true, 1, -1 )
	checkboxBkg:setImage( RegisterImage( "uie_t7_menu_cacselection_checkbox_empty" ) )
	self:addElement( checkboxBkg )
	self.checkboxBkg = checkboxBkg
	
	local checkboxCheck = LUI.UIImage.new()
	checkboxCheck:setLeftRight( true, true, 1, -1 )
	checkboxCheck:setTopBottom( true, true, 1, -1 )
	checkboxCheck:setImage( RegisterImage( "uie_t7_menu_cacselection_checkbox" ) )
	self:addElement( checkboxCheck )
	self.checkboxCheck = checkboxCheck
	
	local focusBorder = CoD.Border.new( menu, controller )
	focusBorder:setLeftRight( true, true, 0, 0 )
	focusBorder:setTopBottom( true, true, 0, 0 )
	focusBorder:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
	focusBorder.FETitleNumBrdr0:setAlpha( 1 )
	self:addElement( focusBorder )
	self.focusBorder = focusBorder
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				checkboxCheck:completeAnimation()
				self.checkboxCheck:setAlpha( 0 )
				self.clipFinished( checkboxCheck, {} )
				focusBorder:completeAnimation()
				self.focusBorder:setAlpha( 0 )
				self.clipFinished( focusBorder, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 2 )
				checkboxCheck:completeAnimation()
				self.checkboxCheck:setAlpha( 0 )
				self.clipFinished( checkboxCheck, {} )
				focusBorder:completeAnimation()
				self.focusBorder:setAlpha( 1 )
				self.clipFinished( focusBorder, {} )
			end
		},
		Checked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				checkboxCheck:completeAnimation()
				self.checkboxCheck:setAlpha( 1 )
				self.clipFinished( checkboxCheck, {} )
				focusBorder:completeAnimation()
				self.focusBorder:setAlpha( 0 )
				self.clipFinished( focusBorder, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 2 )
				checkboxCheck:completeAnimation()
				self.checkboxCheck:setAlpha( 1 )
				self.clipFinished( checkboxCheck, {} )
				focusBorder:completeAnimation()
				self.focusBorder:setAlpha( 1 )
				self.clipFinished( focusBorder, {} )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.focusBorder:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

