require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )

CoD.scorestreakRequirementLabel = InheritFrom( LUI.UIElement )
CoD.scorestreakRequirementLabel.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.scorestreakRequirementLabel )
	self.id = "scorestreakRequirementLabel"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 150 )
	self:setTopBottom( true, false, 0, 55 )
	self.anyChildUsesUpdateState = true
	
	local cacButtonBoxLrgInactive0 = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	cacButtonBoxLrgInactive0:setLeftRight( true, true, 14, -15 )
	cacButtonBoxLrgInactive0:setTopBottom( true, true, -2, -2 )
	cacButtonBoxLrgInactive0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( cacButtonBoxLrgInactive0 )
	self.cacButtonBoxLrgInactive0 = cacButtonBoxLrgInactive0
	
	local labelBacking = LUI.UIImage.new()
	labelBacking:setLeftRight( true, true, 17, -18 )
	labelBacking:setTopBottom( true, false, 0, 22 )
	labelBacking:setRGB( 0, 0, 0 )
	labelBacking:setAlpha( 0.6 )
	self:addElement( labelBacking )
	self.labelBacking = labelBacking
	
	local scorestreakRequirementLabel = LUI.UIText.new()
	scorestreakRequirementLabel:setLeftRight( false, false, -57, 55 )
	scorestreakRequirementLabel:setTopBottom( true, false, 1, 21 )
	scorestreakRequirementLabel:setText( Engine.Localize( LocalizeToUpperString( "MENU_SCORE" ) ) )
	scorestreakRequirementLabel:setTTF( "fonts/escom.ttf" )
	scorestreakRequirementLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	scorestreakRequirementLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( scorestreakRequirementLabel )
	self.scorestreakRequirementLabel = scorestreakRequirementLabel
	
	local score = LUI.UIText.new()
	score:setLeftRight( false, false, -57, 55 )
	score:setTopBottom( true, false, 23.5, 49.5 )
	score:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
	score:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	score:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	score:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	score:linkToElementModel( self, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			score:setText( Engine.Localize( GetScorestreakMomentumFromIndex( modelValue ) ) )
		end
	end )
	self:addElement( score )
	self.score = score
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.cacButtonBoxLrgInactive0:close()
		self.score:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

