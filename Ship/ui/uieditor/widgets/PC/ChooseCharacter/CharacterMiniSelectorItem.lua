-- ec790000fe49df3adc599d70e44349d3
-- This hash is used for caching, delete to decompile the file again

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0:setHandleMouse( true )
end

CoD.CharacterMiniSelectorItem = InheritFrom( LUI.UIElement )
CoD.CharacterMiniSelectorItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CharacterMiniSelectorItem )
	self.id = "CharacterMiniSelectorItem"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( true, false, 0, 20 )
	self:setTopBottom( true, false, 0, 20 )
	
	local CheckboxBkg = LUI.UIImage.new()
	CheckboxBkg:setLeftRight( true, true, 0, 0 )
	CheckboxBkg:setTopBottom( true, true, 0, 0 )
	CheckboxBkg:setRGB( 1, 0.99, 0.97 )
	CheckboxBkg:setImage( RegisterImage( "uie_t7_menu_cacselection_checkbox_empty" ) )
	self:addElement( CheckboxBkg )
	self.CheckboxBkg = CheckboxBkg
	
	local checkboxCheck = LUI.UIImage.new()
	checkboxCheck:setLeftRight( true, true, 0, 0 )
	checkboxCheck:setTopBottom( true, true, 0, 0 )
	checkboxCheck:setRGB( 1, 0.45, 0 )
	checkboxCheck:setAlpha( 0 )
	checkboxCheck:setImage( RegisterImage( "uie_t7_menu_cacselection_checkbox" ) )
	self:addElement( checkboxCheck )
	self.checkboxCheck = checkboxCheck
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				CheckboxBkg:completeAnimation()
				self.CheckboxBkg:setRGB( 1, 0.99, 0.97 )
				self.CheckboxBkg:setAlpha( 1 )
				self.clipFinished( CheckboxBkg, {} )

				checkboxCheck:completeAnimation()
				self.checkboxCheck:setAlpha( 0 )
				self.clipFinished( checkboxCheck, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 2 )

				CheckboxBkg:completeAnimation()
				self.CheckboxBkg:setRGB( 0.96, 0.45, 0 )
				self.CheckboxBkg:setAlpha( 1 )
				self.clipFinished( CheckboxBkg, {} )

				checkboxCheck:completeAnimation()
				self.checkboxCheck:setRGB( 1, 0.45, 0 )
				self.checkboxCheck:setAlpha( 0 )
				self.clipFinished( checkboxCheck, {} )
			end,
			Active = function ()
				self:setupElementClipCounter( 2 )

				CheckboxBkg:completeAnimation()
				self.CheckboxBkg:setAlpha( 0 )
				self.clipFinished( CheckboxBkg, {} )

				checkboxCheck:completeAnimation()
				self.checkboxCheck:setAlpha( 1 )
				self.clipFinished( checkboxCheck, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
