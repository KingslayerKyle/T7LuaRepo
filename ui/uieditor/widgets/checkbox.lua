-- 5bd87c1a75060fc43a96817799d1531d
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_PC_KeyBinderTooltip" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

CoD.checkbox = InheritFrom( LUI.UIElement )
CoD.checkbox.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.checkbox )
	self.id = "checkbox"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 500 )
	self:setTopBottom( true, false, 0, 34 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local fullBacking = LUI.UIImage.new()
	fullBacking:setLeftRight( true, true, 0, 0 )
	fullBacking:setTopBottom( true, true, 0, 0 )
	fullBacking:setRGB( 0.1, 0.1, 0.1 )
	self:addElement( fullBacking )
	self.fullBacking = fullBacking
	
	local fullBorder = CoD.StartMenu_frame_noBG.new( menu, controller )
	fullBorder:setLeftRight( true, true, 0, 0 )
	fullBorder:setTopBottom( true, true, 0, 0 )
	fullBorder:setRGB( 0.87, 0.37, 0 )
	fullBorder:setAlpha( 0 )
	self:addElement( fullBorder )
	self.fullBorder = fullBorder
	
	local checkboxBacking = CoD.StartMenu_frame_noBG.new( menu, controller )
	checkboxBacking:setLeftRight( true, true, -8.5, -443.5 )
	checkboxBacking:setTopBottom( true, true, -13, 13 )
	checkboxBacking:setScale( 0.3 )
	self:addElement( checkboxBacking )
	self.checkboxBacking = checkboxBacking
	
	local CheckboxBkg = LUI.UIImage.new()
	CheckboxBkg:setLeftRight( true, false, 14.75, 33.25 )
	CheckboxBkg:setTopBottom( true, false, 8.25, 25.75 )
	CheckboxBkg:setAlpha( 0 )
	CheckboxBkg:setImage( RegisterImage( "uie_t7_menu_cacselection_checkbox_empty" ) )
	self:addElement( CheckboxBkg )
	self.CheckboxBkg = CheckboxBkg
	
	local checkboxCheck = LUI.UIImage.new()
	checkboxCheck:setLeftRight( true, false, 14.75, 33.25 )
	checkboxCheck:setTopBottom( true, false, 8.25, 25.75 )
	checkboxCheck:setRGB( 1, 0.45, 0 )
	checkboxCheck:setImage( RegisterImage( "uie_t7_menu_cacselection_checkbox" ) )
	self:addElement( checkboxCheck )
	self.checkboxCheck = checkboxCheck
	
	local labelText = LUI.UITightText.new()
	labelText:setLeftRight( true, false, 47, 500 )
	labelText:setTopBottom( true, false, 4.5, 29.5 )
	labelText:setText( Engine.Localize( "MENU_NEW" ) )
	labelText:setTTF( "fonts/default.ttf" )
	self:addElement( labelText )
	self.labelText = labelText
	
	local tooltip = CoD.StartMenu_Options_PC_KeyBinderTooltip.new( menu, controller )
	tooltip:setLeftRight( true, false, 517.5, 717.5 )
	tooltip:setTopBottom( true, false, -35, 65 )
	tooltip:setAlpha( 0 )
	tooltip.headerText:setText( Engine.Localize( "" ) )
	tooltip.descText:setText( Engine.Localize( "" ) )
	tooltip:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return not HasHintText( element )
			end
		}
	} )
	tooltip:linkToElementModel( tooltip, nil, true, function ( model )
		menu:updateElementState( tooltip, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		} )
	end )
	self:addElement( tooltip )
	self.tooltip = tooltip
	
	local StartMenuframenoBG00 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG00:setLeftRight( true, true, 0, 0 )
	StartMenuframenoBG00:setTopBottom( true, true, 0, 0 )
	self:addElement( StartMenuframenoBG00 )
	self.StartMenuframenoBG00 = StartMenuframenoBG00
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, 2, 0 )
	FocusBarT:setTopBottom( true, false, 0, 4 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, 0, 0 )
	FocusBarB:setTopBottom( false, true, -5.5, 0 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				fullBorder:completeAnimation()
				self.fullBorder:setAlpha( 0 )
				self.clipFinished( fullBorder, {} )
				checkboxBacking:completeAnimation()
				self.checkboxBacking:setRGB( 0.78, 0.78, 0.78 )
				self.clipFinished( checkboxBacking, {} )
				CheckboxBkg:completeAnimation()
				self.CheckboxBkg:setAlpha( 1 )
				self.clipFinished( CheckboxBkg, {} )
				checkboxCheck:completeAnimation()
				self.checkboxCheck:setAlpha( 0 )
				self.clipFinished( checkboxCheck, {} )
				labelText:completeAnimation()
				self.labelText:setAlpha( 1 )
				self.clipFinished( labelText, {} )
				tooltip:completeAnimation()
				self.tooltip:setAlpha( 0 )
				self.clipFinished( tooltip, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
				FocusBarB:setAlpha( 0 )
				FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
			end,
			Focus = function ()
				self:setupElementClipCounter( 8 )
				fullBorder:completeAnimation()
				self.fullBorder:setAlpha( 1 )
				self.clipFinished( fullBorder, {} )
				checkboxBacking:completeAnimation()
				self.checkboxBacking:setRGB( 0.87, 0.37, 0 )
				self.clipFinished( checkboxBacking, {} )
				CheckboxBkg:completeAnimation()
				self.CheckboxBkg:setAlpha( 1 )
				self.clipFinished( CheckboxBkg, {} )
				checkboxCheck:completeAnimation()
				self.checkboxCheck:setAlpha( 0 )
				self.clipFinished( checkboxCheck, {} )
				labelText:completeAnimation()
				self.labelText:setAlpha( 1 )
				self.clipFinished( labelText, {} )
				tooltip:completeAnimation()
				self.tooltip:setAlpha( 1 )
				self.clipFinished( tooltip, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end
		},
		Checked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				fullBorder:completeAnimation()
				self.fullBorder:setAlpha( 0 )
				self.clipFinished( fullBorder, {} )
				checkboxBacking:completeAnimation()
				self.checkboxBacking:setRGB( 0.78, 0.78, 0.78 )
				self.clipFinished( checkboxBacking, {} )
				CheckboxBkg:completeAnimation()
				self.CheckboxBkg:setAlpha( 0.5 )
				self.clipFinished( CheckboxBkg, {} )
				local checkboxCheckFrame2 = function ( checkboxCheck, event )
					if not event.interrupted then
						checkboxCheck:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
					end
					checkboxCheck:setRGB( 1, 1, 1 )
					checkboxCheck:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( checkboxCheck, event )
					else
						checkboxCheck:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				checkboxCheck:completeAnimation()
				self.checkboxCheck:setRGB( 1, 1, 1 )
				self.checkboxCheck:setAlpha( 1 )
				checkboxCheckFrame2( checkboxCheck, {} )
				labelText:completeAnimation()
				self.labelText:setAlpha( 1 )
				self.clipFinished( labelText, {} )
				tooltip:completeAnimation()
				self.tooltip:setAlpha( 0 )
				self.clipFinished( tooltip, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 8 )
				fullBorder:completeAnimation()
				self.fullBorder:setAlpha( 1 )
				self.clipFinished( fullBorder, {} )
				checkboxBacking:completeAnimation()
				self.checkboxBacking:setRGB( 0.87, 0.37, 0 )
				self.clipFinished( checkboxBacking, {} )
				CheckboxBkg:completeAnimation()
				self.CheckboxBkg:setAlpha( 0 )
				self.clipFinished( CheckboxBkg, {} )
				local checkboxCheckFrame2 = function ( checkboxCheck, event )
					if not event.interrupted then
						checkboxCheck:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
					end
					checkboxCheck:setRGB( 0.98, 0.44, 0.04 )
					checkboxCheck:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( checkboxCheck, event )
					else
						checkboxCheck:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				checkboxCheck:completeAnimation()
				self.checkboxCheck:setRGB( 0.87, 0.37, 0 )
				self.checkboxCheck:setAlpha( 1 )
				checkboxCheckFrame2( checkboxCheck, {} )
				labelText:completeAnimation()
				self.labelText:setAlpha( 1 )
				self.clipFinished( labelText, {} )
				tooltip:completeAnimation()
				self.tooltip:setAlpha( 1 )
				self.clipFinished( tooltip, {} )
				FocusBarT:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
				FocusBarT:setAlpha( 1 )
				FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				FocusBarB:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
				FocusBarB:setAlpha( 1 )
				FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.fullBorder:close()
		element.checkboxBacking:close()
		element.tooltip:close()
		element.StartMenuframenoBG00:close()
		element.FocusBarT:close()
		element.FocusBarB:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

