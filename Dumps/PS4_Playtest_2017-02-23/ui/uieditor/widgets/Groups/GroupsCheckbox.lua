require( "ui.uieditor.widgets.Border" )

CoD.GroupsCheckbox = InheritFrom( LUI.UIElement )
CoD.GroupsCheckbox.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GroupsCheckbox )
	self.id = "GroupsCheckbox"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 21 )
	self:setTopBottom( 0, 0, 0, 21 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local checkboxBkg = LUI.UIImage.new()
	checkboxBkg:setLeftRight( 0, 1, 2, -2 )
	checkboxBkg:setTopBottom( 0, 1, 2, -2 )
	checkboxBkg:setImage( RegisterImage( "uie_t7_menu_cacselection_checkbox_empty" ) )
	self:addElement( checkboxBkg )
	self.checkboxBkg = checkboxBkg
	
	local SelectedIcon = LUI.UIImage.new()
	SelectedIcon:setLeftRight( 1, 1, -18, -3 )
	SelectedIcon:setTopBottom( 0.5, 0.5, -7.5, 7.5 )
	SelectedIcon:setRGB( 0.55, 0.77, 0.25 )
	SelectedIcon:setImage( RegisterImage( "t7_hud_cac_equipped_16" ) )
	self:addElement( SelectedIcon )
	self.SelectedIcon = SelectedIcon
	
	local checkboxCheck = LUI.UIImage.new()
	checkboxCheck:setLeftRight( 0, 1, 2, -2 )
	checkboxCheck:setTopBottom( 0, 1, 2, -2 )
	checkboxCheck:setRGB( 0.55, 0.77, 0.25 )
	checkboxCheck:setAlpha( 0 )
	checkboxCheck:setImage( RegisterImage( "uie_t7_menu_cacselection_checkbox" ) )
	self:addElement( checkboxCheck )
	self.checkboxCheck = checkboxCheck
	
	local focusBorder = CoD.Border.new( menu, controller )
	focusBorder:setLeftRight( 0, 1, 0, 0 )
	focusBorder:setTopBottom( 0, 1, 0, 0 )
	focusBorder:setRGB( 1, 0.41, 0 )
	focusBorder:setAlpha( 0 )
	self:addElement( focusBorder )
	self.focusBorder = focusBorder
	
	self.resetProperties = function ()
		focusBorder:completeAnimation()
		SelectedIcon:completeAnimation()
		checkboxBkg:completeAnimation()
		focusBorder:setRGB( 1, 0.41, 0 )
		SelectedIcon:setLeftRight( 1, 1, -18, -3 )
		SelectedIcon:setTopBottom( 0.5, 0.5, -7.5, 7.5 )
		SelectedIcon:setAlpha( 1 )
		checkboxBkg:setRGB( 1, 1, 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				SelectedIcon:completeAnimation()
				self.SelectedIcon:setLeftRight( 1, 1, -19.5, -1.5 )
				self.SelectedIcon:setTopBottom( 0.5, 0.5, -9.5, 8.5 )
				self.SelectedIcon:setAlpha( 0 )
				self.clipFinished( SelectedIcon, {} )
				focusBorder:completeAnimation()
				self.focusBorder:setRGB( 1, 1, 1 )
				self.clipFinished( focusBorder, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				checkboxBkg:completeAnimation()
				self.checkboxBkg:setRGB( 1, 0.64, 0 )
				self.clipFinished( checkboxBkg, {} )
				SelectedIcon:completeAnimation()
				self.SelectedIcon:setAlpha( 0 )
				self.clipFinished( SelectedIcon, {} )
			end
		},
		Checked = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				SelectedIcon:completeAnimation()
				self.SelectedIcon:setLeftRight( 1, 1, -19.5, -1.5 )
				self.SelectedIcon:setTopBottom( 0.5, 0.5, -9.5, 8.5 )
				self.clipFinished( SelectedIcon, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				checkboxBkg:completeAnimation()
				self.checkboxBkg:setRGB( 1, 0.44, 0 )
				self.clipFinished( checkboxBkg, {} )
				SelectedIcon:completeAnimation()
				self.SelectedIcon:setLeftRight( 1, 1, -19.5, -1.5 )
				self.SelectedIcon:setTopBottom( 0.5, 0.5, -9.5, 8.5 )
				self.clipFinished( SelectedIcon, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Checked",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "selected" )
			end
		}
	} )
	self:linkToElementModel( self, "selected", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "selected"
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

