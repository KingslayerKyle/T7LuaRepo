-- 370e8dc5b14e7af97ef5a4b92eb5e8e7
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 14 )
	self:setTopBottom( true, false, 0, 14 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local checkboxBkg = LUI.UIImage.new()
	checkboxBkg:setLeftRight( true, true, 1, -1 )
	checkboxBkg:setTopBottom( true, true, 1, -1 )
	checkboxBkg:setAlpha( 0.5 )
	checkboxBkg:setImage( RegisterImage( "uie_t7_menu_cacselection_checkbox_empty" ) )
	self:addElement( checkboxBkg )
	self.checkboxBkg = checkboxBkg
	
	local SelectedIcon = LUI.UIImage.new()
	SelectedIcon:setLeftRight( false, true, -12, -2 )
	SelectedIcon:setTopBottom( false, false, -5, 5 )
	SelectedIcon:setRGB( 0.55, 0.77, 0.25 )
	SelectedIcon:setImage( RegisterImage( "uie_t7_hud_cac_equipped_16" ) )
	self:addElement( SelectedIcon )
	self.SelectedIcon = SelectedIcon
	
	local checkboxCheck = LUI.UIImage.new()
	checkboxCheck:setLeftRight( true, true, 1, -1 )
	checkboxCheck:setTopBottom( true, true, 1, -1 )
	checkboxCheck:setRGB( 0.55, 0.77, 0.25 )
	checkboxCheck:setAlpha( 0 )
	checkboxCheck:setImage( RegisterImage( "uie_t7_menu_cacselection_checkbox" ) )
	self:addElement( checkboxCheck )
	self.checkboxCheck = checkboxCheck
	
	local focusBorder = CoD.Border.new( menu, controller )
	focusBorder:setLeftRight( true, true, 0, 0 )
	focusBorder:setTopBottom( true, true, 0, 0 )
	focusBorder:setRGB( 1, 0.41, 0 )
	focusBorder:setAlpha( 0 )
	self:addElement( focusBorder )
	self.focusBorder = focusBorder
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				checkboxBkg:completeAnimation()
				self.checkboxBkg:setRGB( 1, 1, 1 )
				self.checkboxBkg:setAlpha( 0.5 )
				self.clipFinished( checkboxBkg, {} )

				SelectedIcon:completeAnimation()
				self.SelectedIcon:setLeftRight( false, true, -13, -1 )
				self.SelectedIcon:setTopBottom( false, false, -6, 6 )
				self.SelectedIcon:setAlpha( 0 )
				self.clipFinished( SelectedIcon, {} )

				checkboxCheck:completeAnimation()
				self.checkboxCheck:setRGB( 0.55, 0.77, 0.25 )
				self.checkboxCheck:setAlpha( 0 )
				self.clipFinished( checkboxCheck, {} )

				focusBorder:completeAnimation()
				self.focusBorder:setRGB( 1, 1, 1 )
				self.focusBorder:setAlpha( 0 )
				self.clipFinished( focusBorder, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 4 )

				checkboxBkg:completeAnimation()
				self.checkboxBkg:setRGB( 1, 0.64, 0 )
				self.clipFinished( checkboxBkg, {} )

				SelectedIcon:completeAnimation()
				self.SelectedIcon:setAlpha( 0 )
				self.clipFinished( SelectedIcon, {} )

				checkboxCheck:completeAnimation()
				self.checkboxCheck:setAlpha( 0 )
				self.clipFinished( checkboxCheck, {} )

				focusBorder:completeAnimation()
				self.focusBorder:setAlpha( 0 )
				self.clipFinished( focusBorder, {} )
			end
		},
		Checked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				checkboxBkg:completeAnimation()
				self.checkboxBkg:setRGB( 1, 1, 1 )
				self.clipFinished( checkboxBkg, {} )

				SelectedIcon:completeAnimation()
				self.SelectedIcon:setLeftRight( false, true, -13, -1 )
				self.SelectedIcon:setTopBottom( false, false, -6, 6 )
				self.SelectedIcon:setAlpha( 1 )
				self.clipFinished( SelectedIcon, {} )

				checkboxCheck:completeAnimation()
				self.checkboxCheck:setAlpha( 0 )
				self.clipFinished( checkboxCheck, {} )

				focusBorder:completeAnimation()
				self.focusBorder:setAlpha( 0 )
				self.clipFinished( focusBorder, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 4 )

				checkboxBkg:completeAnimation()
				self.checkboxBkg:setRGB( 1, 0.44, 0 )
				self.clipFinished( checkboxBkg, {} )

				SelectedIcon:completeAnimation()
				self.SelectedIcon:setLeftRight( false, true, -13, -1 )
				self.SelectedIcon:setTopBottom( false, false, -6, 6 )
				self.SelectedIcon:setRGB( 0.55, 0.77, 0.25 )
				self.SelectedIcon:setAlpha( 1 )
				self.clipFinished( SelectedIcon, {} )

				checkboxCheck:completeAnimation()
				self.checkboxCheck:setAlpha( 0 )
				self.clipFinished( checkboxCheck, {} )

				focusBorder:completeAnimation()
				self.focusBorder:setAlpha( 0 )
				self.clipFinished( focusBorder, {} )
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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.focusBorder:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
