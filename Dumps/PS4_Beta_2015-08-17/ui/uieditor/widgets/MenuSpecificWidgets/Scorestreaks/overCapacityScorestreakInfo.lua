require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )

CoD.overCapacityScorestreakInfo = InheritFrom( LUI.UIElement )
CoD.overCapacityScorestreakInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.overCapacityScorestreakInfo )
	self.id = "overCapacityScorestreakInfo"
	self.soundSet = "CAC_Wildcard"
	self:setLeftRight( true, false, 0, 332 )
	self:setTopBottom( true, false, 0, 89 )
	self.anyChildUsesUpdateState = true
	
	local TitleGlow1 = CoD.cac_ItemTitleGlow.new( menu, controller )
	TitleGlow1:setLeftRight( true, true, -2.5, -136.5 )
	TitleGlow1:setTopBottom( true, true, 5, -53 )
	TitleGlow1:setRGB( 0.9, 0.9, 0.9 )
	TitleGlow1:setAlpha( 0.7 )
	self:addElement( TitleGlow1 )
	self.TitleGlow1 = TitleGlow1
	
	local cacButtonBoxLrgInactiveStroke = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	cacButtonBoxLrgInactiveStroke:setLeftRight( true, true, -1.5, -137.5 )
	cacButtonBoxLrgInactiveStroke:setTopBottom( true, false, 32, 81 )
	self:addElement( cacButtonBoxLrgInactiveStroke )
	self.cacButtonBoxLrgInactiveStroke = cacButtonBoxLrgInactiveStroke
	
	local descText = LUI.UIText.new()
	descText:setLeftRight( true, true, 9, 0 )
	descText:setTopBottom( false, false, -6, 10 )
	descText:setTTF( "fonts/escom.ttf" )
	descText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	descText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	descText:linkToElementModel( self, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			descText:setText( Engine.Localize( LocalizeIntoString( "MENU_SCORE_REQUIRED", GetScorestreakMomentumFromIndex( modelValue ) ) ) )
		end
	end )
	self:addElement( descText )
	self.descText = descText
	
	local nameLabel = LUI.UITightText.new()
	nameLabel:setLeftRight( true, false, 9, 131 )
	nameLabel:setTopBottom( true, false, 8, 33 )
	nameLabel:setRGB( 0, 0, 0 )
	nameLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	nameLabel:setLetterSpacing( 0.5 )
	nameLabel:linkToElementModel( self, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			nameLabel:setText( Engine.Localize( GetItemNameFromIndex( modelValue ) ) )
		end
	end )
	self:addElement( nameLabel )
	self.nameLabel = nameLabel
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				descText:completeAnimation()
				self.descText:setAlpha( 1 )
				self.clipFinished( descText, {} )
				nameLabel:completeAnimation()
				self.nameLabel:setAlpha( 1 )
				self.clipFinished( nameLabel, {} )
			end
		},
		NameOnly = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				descText:completeAnimation()
				self.descText:setAlpha( 0 )
				self.clipFinished( descText, {} )
				nameLabel:completeAnimation()
				self.nameLabel:setAlpha( 1 )
				self.clipFinished( nameLabel, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.TitleGlow1:close()
		self.cacButtonBoxLrgInactiveStroke:close()
		self.descText:close()
		self.nameLabel:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

