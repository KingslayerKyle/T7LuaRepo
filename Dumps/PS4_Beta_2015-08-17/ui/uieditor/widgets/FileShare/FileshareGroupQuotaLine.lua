CoD.FileshareGroupQuotaLine = InheritFrom( LUI.UIElement )
CoD.FileshareGroupQuotaLine.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.FileshareGroupQuotaLine )
	self.id = "FileshareGroupQuotaLine"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 360 )
	self:setTopBottom( true, false, 0, 28 )
	
	local CountBG = LUI.UIImage.new()
	CountBG:setLeftRight( true, true, 162, 0 )
	CountBG:setTopBottom( true, false, 0, 28 )
	CountBG:setRGB( 0.1, 0.1, 0.1 )
	self:addElement( CountBG )
	self.CountBG = CountBG
	
	local NameBG = LUI.UIImage.new()
	NameBG:setLeftRight( true, false, 0, 157 )
	NameBG:setTopBottom( true, false, 0, 28 )
	NameBG:setRGB( 0.1, 0.1, 0.1 )
	self:addElement( NameBG )
	self.NameBG = NameBG
	
	local GroupName = LUI.UITightText.new()
	GroupName:setLeftRight( true, false, 28, 123 )
	GroupName:setTopBottom( true, false, 1.5, 26.5 )
	GroupName:setTTF( "fonts/default.ttf" )
	GroupName:linkToElementModel( self, "locName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GroupName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( GroupName )
	self.GroupName = GroupName
	
	local GroupImage = LUI.UIImage.new()
	GroupImage:setLeftRight( true, false, 4, 26 )
	GroupImage:setTopBottom( true, false, 3, 25 )
	self:addElement( GroupImage )
	self.GroupImage = GroupImage
	
	local TxtUsed = LUI.UIText.new()
	TxtUsed:setLeftRight( false, true, -67.19, -33.19 )
	TxtUsed:setTopBottom( true, false, 1.5, 26.5 )
	TxtUsed:setTTF( "fonts/default.ttf" )
	TxtUsed:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	TxtUsed:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TxtUsed:linkToElementModel( self, "slotsUsed", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TxtUsed:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( TxtUsed )
	self.TxtUsed = TxtUsed
	
	local LblSlash = LUI.UITightText.new()
	LblSlash:setLeftRight( false, true, -33.19, -27.19 )
	LblSlash:setTopBottom( true, false, 0.5, 25.5 )
	LblSlash:setText( Engine.Localize( "/" ) )
	LblSlash:setTTF( "fonts/default.ttf" )
	self:addElement( LblSlash )
	self.LblSlash = LblSlash
	
	local TxtTotal = LUI.UIText.new()
	TxtTotal:setLeftRight( false, true, -26.19, -0.19 )
	TxtTotal:setTopBottom( true, false, 1.5, 26.5 )
	TxtTotal:setTTF( "fonts/default.ttf" )
	TxtTotal:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TxtTotal:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TxtTotal:linkToElementModel( self, "quota", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TxtTotal:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( TxtTotal )
	self.TxtTotal = TxtTotal
	
	local BarBG = LUI.UIImage.new()
	BarBG:setLeftRight( true, true, 166.01, -61.99 )
	BarBG:setTopBottom( true, false, 5.5, 22.5 )
	BarBG:setRGB( 0.33, 0.33, 0.33 )
	self:addElement( BarBG )
	self.BarBG = BarBG
	
	local BarFraction = LUI.UIImage.new()
	BarFraction:setLeftRight( true, true, 166.01, -61.99 )
	BarFraction:setTopBottom( true, false, 5.5, 22.5 )
	BarFraction:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	BarFraction:setShaderVector( 1, 0, 0, 0, 0 )
	BarFraction:setShaderVector( 2, 1, 0, 0, 0 )
	BarFraction:setShaderVector( 3, 0, 0, 0, 0 )
	BarFraction:linkToElementModel( self, "fraction", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BarFraction:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	self:addElement( BarFraction )
	self.BarFraction = BarFraction
	
	local Dimmer = LUI.UIImage.new()
	Dimmer:setLeftRight( true, true, 0, -0.19 )
	Dimmer:setTopBottom( true, true, 0.5, 0 )
	Dimmer:setRGB( 0, 0, 0 )
	Dimmer:setAlpha( 0.8 )
	self:addElement( Dimmer )
	self.Dimmer = Dimmer
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Dimmer:completeAnimation()
				self.Dimmer:setAlpha( 0 )
				self.clipFinished( Dimmer, {} )
			end
		},
		Dim = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Dimmer:completeAnimation()
				self.Dimmer:setAlpha( 0.8 )
				self.clipFinished( Dimmer, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Dim",
			condition = function ( menu, element, event )
				return FileshareIsQuotaLineDim( self, controller )
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GroupName:close()
		self.TxtUsed:close()
		self.TxtTotal:close()
		self.BarFraction:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

