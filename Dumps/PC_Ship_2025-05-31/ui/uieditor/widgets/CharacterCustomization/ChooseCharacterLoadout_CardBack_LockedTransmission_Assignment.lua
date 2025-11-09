require( "ui.uieditor.widgets.verticalScrollingTextBox" )
require( "ui.uieditor.widgets.Heroes.ChooseCharacterLoadout_TabBar" )
require( "ui.uieditor.widgets.Border" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseCharacterLoadout_CardBack_LockedTransmission_Progress" )

CoD.ChooseCharacterLoadout_CardBack_LockedTransmission_Assignment = InheritFrom( LUI.UIElement )
CoD.ChooseCharacterLoadout_CardBack_LockedTransmission_Assignment.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChooseCharacterLoadout_CardBack_LockedTransmission_Assignment )
	self.id = "ChooseCharacterLoadout_CardBack_LockedTransmission_Assignment"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 547 )
	self:setTopBottom( true, false, 0, 136 )
	self.anyChildUsesUpdateState = true
	
	local assignmentText = CoD.verticalScrollingTextBox.new( menu, controller )
	assignmentText:setLeftRight( true, true, 28, -31 )
	assignmentText:setTopBottom( true, false, 27.5, 90 )
	assignmentText:setRGB( 0.82, 0.98, 1 )
	assignmentText:setAlpha( 0.8 )
	assignmentText.textBox:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	assignmentText.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	assignmentText:linkToElementModel( self, "assignment", true, function ( model )
		local assignment = Engine.GetModelValue( model )
		if assignment then
			assignmentText.textBox:setText( Engine.Localize( assignment ) )
		end
	end )
	self:addElement( assignmentText )
	self.assignmentText = assignmentText
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( false, true, -25, 0 )
	Image0:setTopBottom( false, false, -65.75, -62.75 )
	Image0:setRGB( 0.82, 0.98, 1 )
	Image0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( false, true, -25, 0 )
	Image1:setTopBottom( false, false, -65.75, -62.75 )
	Image1:setRGB( 0.82, 0.98, 1 )
	Image1:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, false, 0, 25 )
	Image2:setTopBottom( false, false, -65.75, -62.75 )
	Image2:setRGB( 0.82, 0.98, 1 )
	Image2:setZRot( 180 )
	Image2:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image35 = LUI.UIImage.new()
	Image35:setLeftRight( true, false, 0, 25 )
	Image35:setTopBottom( false, false, -65.75, -62.75 )
	Image35:setRGB( 0.82, 0.98, 1 )
	Image35:setZRot( 180 )
	Image35:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image35:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image35 )
	self.Image35 = Image35
	
	local TabBar1 = CoD.ChooseCharacterLoadout_TabBar.new( menu, controller )
	TabBar1:setLeftRight( true, false, 18, 528 )
	TabBar1:setTopBottom( true, false, 0, 28 )
	TabBar1:setRGB( 0.87, 0.99, 1 )
	self:addElement( TabBar1 )
	self.TabBar1 = TabBar1
	
	local assignmentLabel = LUI.UITightText.new()
	assignmentLabel:setLeftRight( true, false, 28, 228 )
	assignmentLabel:setTopBottom( true, false, 4.5, 24.5 )
	assignmentLabel:setRGB( 0, 0, 0 )
	assignmentLabel:setText( Engine.Localize( "HEROES_ASSIGNMENT" ) )
	assignmentLabel:setTTF( "fonts/escom.ttf" )
	assignmentLabel:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	assignmentLabel:setShaderVector( 0, 0.05, 0, 0, 0 )
	assignmentLabel:setShaderVector( 1, 0.02, 0, 0, 0 )
	assignmentLabel:setShaderVector( 2, 1, 0, 0, 0 )
	assignmentLabel:setLetterSpacing( 1 )
	self:addElement( assignmentLabel )
	self.assignmentLabel = assignmentLabel
	
	local assignmentBorder = CoD.Border.new( menu, controller )
	assignmentBorder:setLeftRight( false, false, -254.5, 252.5 )
	assignmentBorder:setTopBottom( false, false, -41.25, 66.5 )
	assignmentBorder:setRGB( 0.87, 0.99, 1 )
	self:addElement( assignmentBorder )
	self.assignmentBorder = assignmentBorder
	
	local Image300 = LUI.UIImage.new()
	Image300:setLeftRight( false, true, -24, -20 )
	Image300:setTopBottom( false, true, -4, 0 )
	Image300:setRGB( 0.82, 0.98, 1 )
	Image300:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image300:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image300 )
	self.Image300 = Image300
	
	local Image311 = LUI.UIImage.new()
	Image311:setLeftRight( false, true, -23, -19 )
	Image311:setTopBottom( false, true, -4, 0 )
	Image311:setRGB( 0.82, 0.98, 1 )
	Image311:setYRot( 180 )
	Image311:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image311:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image311 )
	self.Image311 = Image311
	
	local Image42 = LUI.UIImage.new()
	Image42:setLeftRight( false, true, -529, -525 )
	Image42:setTopBottom( false, true, -5, -1 )
	Image42:setRGB( 0.82, 0.98, 1 )
	Image42:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image42:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image42 )
	self.Image42 = Image42
	
	local Image43 = LUI.UIImage.new()
	Image43:setLeftRight( false, true, -528, -524 )
	Image43:setTopBottom( false, true, -5, -1 )
	Image43:setRGB( 0.82, 0.98, 1 )
	Image43:setYRot( 180 )
	Image43:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image43:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image43 )
	self.Image43 = Image43
	
	local progress = CoD.ChooseCharacterLoadout_CardBack_LockedTransmission_Progress.new( menu, controller )
	progress:setLeftRight( true, false, 30, 516 )
	progress:setTopBottom( true, false, 93, 127.5 )
	progress:linkToElementModel( self, nil, false, function ( model )
		progress:setModel( model, controller )
	end )
	self:addElement( progress )
	self.progress = progress
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				assignmentText:completeAnimation()
				self.assignmentText:setAlpha( 0.8 )
				self.clipFinished( assignmentText, {} )
				Image0:completeAnimation()
				self.Image0:setAlpha( 1 )
				self.clipFinished( Image0, {} )
				Image1:completeAnimation()
				self.Image1:setAlpha( 1 )
				self.clipFinished( Image1, {} )
				Image2:completeAnimation()
				self.Image2:setAlpha( 1 )
				self.clipFinished( Image2, {} )
				Image35:completeAnimation()
				self.Image35:setAlpha( 1 )
				self.clipFinished( Image35, {} )
				TabBar1:completeAnimation()
				self.TabBar1:setAlpha( 1 )
				self.clipFinished( TabBar1, {} )
				assignmentLabel:completeAnimation()
				self.assignmentLabel:setAlpha( 1 )
				self.clipFinished( assignmentLabel, {} )
				assignmentBorder:completeAnimation()
				self.assignmentBorder:setAlpha( 1 )
				self.clipFinished( assignmentBorder, {} )
				Image300:completeAnimation()
				self.Image300:setAlpha( 1 )
				self.clipFinished( Image300, {} )
				Image311:completeAnimation()
				self.Image311:setAlpha( 1 )
				self.clipFinished( Image311, {} )
				Image42:completeAnimation()
				self.Image42:setAlpha( 1 )
				self.clipFinished( Image42, {} )
				Image43:completeAnimation()
				self.Image43:setAlpha( 1 )
				self.clipFinished( Image43, {} )
				progress:completeAnimation()
				self.progress:setAlpha( 1 )
				self.clipFinished( progress, {} )
			end
		},
		NoAssignment = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				assignmentText:completeAnimation()
				self.assignmentText:setAlpha( 0 )
				self.clipFinished( assignmentText, {} )
				Image0:completeAnimation()
				self.Image0:setAlpha( 0 )
				self.clipFinished( Image0, {} )
				Image1:completeAnimation()
				self.Image1:setAlpha( 0 )
				self.clipFinished( Image1, {} )
				Image2:completeAnimation()
				self.Image2:setAlpha( 0 )
				self.clipFinished( Image2, {} )
				Image35:completeAnimation()
				self.Image35:setAlpha( 0 )
				self.clipFinished( Image35, {} )
				TabBar1:completeAnimation()
				self.TabBar1:setAlpha( 0 )
				self.clipFinished( TabBar1, {} )
				assignmentLabel:completeAnimation()
				self.assignmentLabel:setAlpha( 0 )
				self.clipFinished( assignmentLabel, {} )
				assignmentBorder:completeAnimation()
				self.assignmentBorder:setAlpha( 0 )
				self.clipFinished( assignmentBorder, {} )
				Image300:completeAnimation()
				self.Image300:setAlpha( 0 )
				self.clipFinished( Image300, {} )
				Image311:completeAnimation()
				self.Image311:setAlpha( 0 )
				self.clipFinished( Image311, {} )
				Image42:completeAnimation()
				self.Image42:setAlpha( 0 )
				self.clipFinished( Image42, {} )
				Image43:completeAnimation()
				self.Image43:setAlpha( 0 )
				self.clipFinished( Image43, {} )
				progress:completeAnimation()
				self.progress:setAlpha( 0 )
				self.clipFinished( progress, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "NoAssignment",
			condition = function ( menu, element, event )
				return not IsSelfModelValueNonEmptyString( element, controller, "assignment" )
			end
		}
	} )
	self:linkToElementModel( self, "assignment", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "assignment"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.assignmentText:close()
		element.TabBar1:close()
		element.assignmentBorder:close()
		element.progress:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

