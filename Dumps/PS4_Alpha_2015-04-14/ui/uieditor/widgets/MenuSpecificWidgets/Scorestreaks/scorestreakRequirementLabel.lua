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
	cacButtonBoxLrgInactive0:setTopBottom( true, true, -2, -6 )
	cacButtonBoxLrgInactive0:setRGB( 1, 1, 1 )
	cacButtonBoxLrgInactive0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( cacButtonBoxLrgInactive0 )
	self.cacButtonBoxLrgInactive0 = cacButtonBoxLrgInactive0
	
	local labelBacking = LUI.UIImage.new()
	labelBacking:setLeftRight( true, true, 17, -18 )
	labelBacking:setTopBottom( true, false, 0, 22 )
	labelBacking:setRGB( 0, 0, 0 )
	labelBacking:setAlpha( 0.6 )
	labelBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( labelBacking )
	self.labelBacking = labelBacking
	
	local scorestreakRequirementLabel = LUI.UITightText.new()
	scorestreakRequirementLabel:setLeftRight( false, false, -22.5, 16.5 )
	scorestreakRequirementLabel:setTopBottom( true, false, 2, 22 )
	scorestreakRequirementLabel:setRGB( 1, 1, 1 )
	scorestreakRequirementLabel:setText( Engine.Localize( LocalizeToUpperString( "MENU_SCORE" ) ) )
	scorestreakRequirementLabel:setTTF( "fonts/Entovo.ttf" )
	self:addElement( scorestreakRequirementLabel )
	self.scorestreakRequirementLabel = scorestreakRequirementLabel
	
	local score = LUI.UITightText.new()
	score:setLeftRight( false, false, -100, 100 )
	score:setTopBottom( true, false, 25.5, 45.5 )
	score:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
	score:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	score:linkToElementModel( self, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			score:setText( Engine.Localize( GetScorestreakMomentumFromIndex( modelValue ) ) )
		end
	end )
	self:addElement( score )
	self.score = score
	
	self.close = function ( self )
		self.cacButtonBoxLrgInactive0:close()
		self.score:close()
		CoD.scorestreakRequirementLabel.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

