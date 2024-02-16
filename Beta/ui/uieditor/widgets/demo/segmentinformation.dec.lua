CoD.SegmentInformation = InheritFrom( LUI.UIElement )
CoD.SegmentInformation.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SegmentInformation )
	self.id = "SegmentInformation"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 300 )
	self:setTopBottom( true, false, 0, 400 )
	
	local SegmentInfoTransition = LUI.UIText.new()
	SegmentInfoTransition:setLeftRight( true, false, 10, 290 )
	SegmentInfoTransition:setTopBottom( true, false, 81.5, 106.5 )
	SegmentInfoTransition:setTTF( "fonts/default.ttf" )
	SegmentInfoTransition:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	SegmentInfoTransition:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	SegmentInfoTransition:linkToElementModel( self, "transitionText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			SegmentInfoTransition:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( SegmentInfoTransition )
	self.SegmentInfoTransition = SegmentInfoTransition
	
	local SegmentInfoDuration = LUI.UIText.new()
	SegmentInfoDuration:setLeftRight( true, false, 10, 290 )
	SegmentInfoDuration:setTopBottom( true, false, 44.5, 69.5 )
	SegmentInfoDuration:setTTF( "fonts/default.ttf" )
	SegmentInfoDuration:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	SegmentInfoDuration:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	SegmentInfoDuration:linkToElementModel( self, "duration", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			SegmentInfoDuration:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( SegmentInfoDuration )
	self.SegmentInfoDuration = SegmentInfoDuration
	
	local SegmentInfoName = LUI.UIText.new()
	SegmentInfoName:setLeftRight( true, false, 10, 290 )
	SegmentInfoName:setTopBottom( true, false, 9.5, 34.5 )
	SegmentInfoName:setTTF( "fonts/default.ttf" )
	SegmentInfoName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	SegmentInfoName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	SegmentInfoName:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			SegmentInfoName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( SegmentInfoName )
	self.SegmentInfoName = SegmentInfoName
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.SegmentInfoTransition:close()
		self.SegmentInfoDuration:close()
		self.SegmentInfoName:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

