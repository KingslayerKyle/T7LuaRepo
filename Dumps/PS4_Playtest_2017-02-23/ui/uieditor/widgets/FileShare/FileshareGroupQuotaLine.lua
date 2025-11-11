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
	self:setLeftRight( 0, 0, 0, 540 )
	self:setTopBottom( 0, 0, 0, 42 )
	
	local CountBG = LUI.UIImage.new()
	CountBG:setLeftRight( 0, 1, 244, 0 )
	CountBG:setTopBottom( 0, 0, 0, 42 )
	CountBG:setRGB( 0.24, 0.24, 0.24 )
	self:addElement( CountBG )
	self.CountBG = CountBG
	
	local NameBG = LUI.UIImage.new()
	NameBG:setLeftRight( 0, 0, 0, 236 )
	NameBG:setTopBottom( 0, 0, 0, 42 )
	NameBG:setRGB( 0.24, 0.24, 0.24 )
	self:addElement( NameBG )
	self.NameBG = NameBG
	
	local GroupName = LUI.UITightText.new()
	GroupName:setLeftRight( 0, 0, 48, 190 )
	GroupName:setTopBottom( 0, 0, 7, 35 )
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
	GroupImage:setLeftRight( 0, 0, 7, 40 )
	GroupImage:setTopBottom( 0, 0, 5, 38 )
	self:addElement( GroupImage )
	self.GroupImage = GroupImage
	
	local TxtUsed = LUI.UIText.new()
	TxtUsed:setLeftRight( 1, 1, -102, -51 )
	TxtUsed:setTopBottom( 0, 0, 4, 37 )
	TxtUsed:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TxtUsed:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	TxtUsed:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TxtUsed:linkToElementModel( self, "slotsFull", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TxtUsed:setRGB( FileshareSlotsTextColor( controller, modelValue ) )
		end
	end )
	TxtUsed:linkToElementModel( self, "slotsUsed", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TxtUsed:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( TxtUsed )
	self.TxtUsed = TxtUsed
	
	local LblSlash = LUI.UITightText.new()
	LblSlash:setLeftRight( 1, 1, -51, -42 )
	LblSlash:setTopBottom( 0, 0, 5, 38 )
	LblSlash:setText( Engine.Localize( "/" ) )
	LblSlash:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( LblSlash )
	self.LblSlash = LblSlash
	
	local TxtTotal = LUI.UIText.new()
	TxtTotal:setLeftRight( 1, 1, -41, -2 )
	TxtTotal:setTopBottom( 0, 0, 4, 37 )
	TxtTotal:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
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
	BarBG:setLeftRight( 0, 1, 249, -93 )
	BarBG:setTopBottom( 0, 0, 11, 31 )
	BarBG:setRGB( 0.33, 0.33, 0.33 )
	self:addElement( BarBG )
	self.BarBG = BarBG
	
	local BarFraction = LUI.UIImage.new()
	BarFraction:setLeftRight( 0, 1, 249, -93 )
	BarFraction:setTopBottom( 0, 0, 20, 23 )
	BarFraction:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	BarFraction:setShaderVector( 1, 0, 0, 0, 0 )
	BarFraction:setShaderVector( 2, 1, 0, 0, 0 )
	BarFraction:setShaderVector( 3, 0, 0, 0, 0 )
	BarFraction:setShaderVector( 4, 0, 0, 0, 0 )
	BarFraction:linkToElementModel( self, "barColor", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BarFraction:setRGB( modelValue )
		end
	end )
	BarFraction:linkToElementModel( self, "fraction", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BarFraction:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	self:addElement( BarFraction )
	self.BarFraction = BarFraction
	
	local slotfullWarningImage0 = LUI.UIImage.new()
	slotfullWarningImage0:setLeftRight( 0, 0, 249, 281 )
	slotfullWarningImage0:setTopBottom( 0, 0, 5, 37 )
	slotfullWarningImage0:setRGB( 1, 0, 0 )
	slotfullWarningImage0:setImage( RegisterImage( "t7_icon_error_overlays" ) )
	slotfullWarningImage0:linkToElementModel( self, "slotsFull", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			slotfullWarningImage0:setAlpha( FileshareSlotsFullWarningIconAlpha( modelValue ) )
		end
	end )
	self:addElement( slotfullWarningImage0 )
	self.slotfullWarningImage0 = slotfullWarningImage0
	
	local Dimmer = LUI.UIImage.new()
	Dimmer:setLeftRight( 0, 1, 0, 0 )
	Dimmer:setTopBottom( 0, 1, 0, 0 )
	Dimmer:setRGB( 0, 0, 0 )
	Dimmer:setAlpha( 0.7 )
	self:addElement( Dimmer )
	self.Dimmer = Dimmer
	
	self.GroupImage:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GroupImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self.LblSlash:linkToElementModel( self, "slotsFull", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LblSlash:setRGB( FileshareSlotsTextColor( controller, modelValue ) )
		end
	end )
	self.TxtTotal:linkToElementModel( self, "slotsFull", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TxtTotal:setRGB( FileshareSlotsTextColor( controller, modelValue ) )
		end
	end )
	self.resetProperties = function ()
		Dimmer:completeAnimation()
		TxtTotal:completeAnimation()
		TxtUsed:completeAnimation()
		Dimmer:setAlpha( 0.7 )
		TxtTotal:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
		TxtUsed:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Dimmer:completeAnimation()
				self.Dimmer:setAlpha( 0 )
				self.clipFinished( Dimmer, {} )
			end
		},
		DimArabic = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				TxtUsed:completeAnimation()
				self.TxtUsed:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
				self.clipFinished( TxtUsed, {} )
				TxtTotal:completeAnimation()
				self.TxtTotal:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
				self.clipFinished( TxtTotal, {} )
				Dimmer:completeAnimation()
				self.Dimmer:setAlpha( 0.8 )
				self.clipFinished( Dimmer, {} )
			end
		},
		Dim = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Dimmer:completeAnimation()
				self.Dimmer:setAlpha( 0.8 )
				self.clipFinished( Dimmer, {} )
			end
		},
		DefaultStateArabic = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				TxtUsed:completeAnimation()
				self.TxtUsed:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
				self.clipFinished( TxtUsed, {} )
				TxtTotal:completeAnimation()
				self.TxtTotal:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
				self.clipFinished( TxtTotal, {} )
				Dimmer:completeAnimation()
				self.Dimmer:setAlpha( 0 )
				self.clipFinished( Dimmer, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "DimArabic",
			condition = function ( menu, element, event )
				return FileshareIsQuotaLineDim( self, controller ) and IsCurrentLanguageArabic()
			end
		},
		{
			stateName = "Dim",
			condition = function ( menu, element, event )
				return FileshareIsQuotaLineDim( self, controller )
			end
		},
		{
			stateName = "DefaultStateArabic",
			condition = function ( menu, element, event )
				return IsCurrentLanguageArabic()
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GroupName:close()
		self.GroupImage:close()
		self.TxtUsed:close()
		self.LblSlash:close()
		self.TxtTotal:close()
		self.BarFraction:close()
		self.slotfullWarningImage0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

