-- ec1301a2daa2589f8ef26faf8dad06ef
-- This hash is used for caching, delete to decompile the file again

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
	CountBG:setRGB( 0.24, 0.24, 0.24 )
	self:addElement( CountBG )
	self.CountBG = CountBG
	
	local NameBG = LUI.UIImage.new()
	NameBG:setLeftRight( true, false, 0, 157 )
	NameBG:setTopBottom( true, false, 0, 28 )
	NameBG:setRGB( 0.24, 0.24, 0.24 )
	self:addElement( NameBG )
	self.NameBG = NameBG
	
	local GroupName = LUI.UITightText.new()
	GroupName:setLeftRight( true, false, 32, 127 )
	GroupName:setTopBottom( true, false, 4.5, 23.5 )
	GroupName:setTTF( "fonts/default.ttf" )
	GroupName:linkToElementModel( self, "locName", true, function ( model )
		local locName = Engine.GetModelValue( model )
		if locName then
			GroupName:setText( Engine.Localize( locName ) )
		end
	end )
	self:addElement( GroupName )
	self.GroupName = GroupName
	
	local GroupImage = LUI.UIImage.new()
	GroupImage:setLeftRight( true, false, 5, 27 )
	GroupImage:setTopBottom( true, false, 3, 25 )
	self:addElement( GroupImage )
	self.GroupImage = GroupImage
	
	local TxtUsed = LUI.UIText.new()
	TxtUsed:setLeftRight( false, true, -68.19, -34.19 )
	TxtUsed:setTopBottom( true, false, 2.5, 24.5 )
	TxtUsed:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TxtUsed:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	TxtUsed:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TxtUsed:linkToElementModel( self, "slotsFull", true, function ( model )
		local slotsFull = Engine.GetModelValue( model )
		if slotsFull then
			TxtUsed:setRGB( FileshareSlotsTextColor( controller, slotsFull ) )
		end
	end )
	TxtUsed:linkToElementModel( self, "slotsUsed", true, function ( model )
		local slotsUsed = Engine.GetModelValue( model )
		if slotsUsed then
			TxtUsed:setText( Engine.Localize( slotsUsed ) )
		end
	end )
	self:addElement( TxtUsed )
	self.TxtUsed = TxtUsed
	
	local LblSlash = LUI.UITightText.new()
	LblSlash:setLeftRight( false, true, -34.19, -28.19 )
	LblSlash:setTopBottom( true, false, 3.5, 25.5 )
	LblSlash:setText( Engine.Localize( "/" ) )
	LblSlash:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( LblSlash )
	self.LblSlash = LblSlash
	
	local TxtTotal = LUI.UIText.new()
	TxtTotal:setLeftRight( false, true, -27.19, -1.19 )
	TxtTotal:setTopBottom( true, false, 2.5, 24.5 )
	TxtTotal:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TxtTotal:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TxtTotal:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TxtTotal:linkToElementModel( self, "quota", true, function ( model )
		local quota = Engine.GetModelValue( model )
		if quota then
			TxtTotal:setText( Engine.Localize( quota ) )
		end
	end )
	self:addElement( TxtTotal )
	self.TxtTotal = TxtTotal
	
	local BarBG = LUI.UIImage.new()
	BarBG:setLeftRight( true, true, 166.01, -61.99 )
	BarBG:setTopBottom( true, false, 7.5, 20.5 )
	BarBG:setRGB( 0.33, 0.33, 0.33 )
	self:addElement( BarBG )
	self.BarBG = BarBG
	
	local BarFraction = LUI.UIImage.new()
	BarFraction:setLeftRight( true, true, 166.01, -61.99 )
	BarFraction:setTopBottom( true, false, 13, 15 )
	BarFraction:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	BarFraction:setShaderVector( 1, 0, 0, 0, 0 )
	BarFraction:setShaderVector( 2, 1, 0, 0, 0 )
	BarFraction:setShaderVector( 3, 0, 0, 0, 0 )
	BarFraction:linkToElementModel( self, "barColor", true, function ( model )
		local barColor = Engine.GetModelValue( model )
		if barColor then
			BarFraction:setRGB( barColor )
		end
	end )
	BarFraction:linkToElementModel( self, "fraction", true, function ( model )
		local fraction = Engine.GetModelValue( model )
		if fraction then
			BarFraction:setShaderVector( 0, CoD.GetVectorComponentFromString( fraction, 1 ), CoD.GetVectorComponentFromString( fraction, 2 ), CoD.GetVectorComponentFromString( fraction, 3 ), CoD.GetVectorComponentFromString( fraction, 4 ) )
		end
	end )
	self:addElement( BarFraction )
	self.BarFraction = BarFraction
	
	local slotfullWarningImage0 = LUI.UIImage.new()
	slotfullWarningImage0:setLeftRight( true, false, 166.01, 187.01 )
	slotfullWarningImage0:setTopBottom( true, false, 3.5, 24.5 )
	slotfullWarningImage0:setRGB( 1, 0, 0 )
	slotfullWarningImage0:setImage( RegisterImage( "uie_t7_icon_error_overlays" ) )
	slotfullWarningImage0:linkToElementModel( self, "slotsFull", true, function ( model )
		local slotsFull = Engine.GetModelValue( model )
		if slotsFull then
			slotfullWarningImage0:setAlpha( FileshareSlotsFullWarningIconAlpha( slotsFull ) )
		end
	end )
	self:addElement( slotfullWarningImage0 )
	self.slotfullWarningImage0 = slotfullWarningImage0
	
	local Dimmer = LUI.UIImage.new()
	Dimmer:setLeftRight( true, true, 0, -0.19 )
	Dimmer:setTopBottom( true, true, 0, 0 )
	Dimmer:setRGB( 0, 0, 0 )
	Dimmer:setAlpha( 0.7 )
	self:addElement( Dimmer )
	self.Dimmer = Dimmer
	
	self.GroupImage:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			GroupImage:setImage( RegisterImage( image ) )
		end
	end )
	self.LblSlash:linkToElementModel( self, "slotsFull", true, function ( model )
		local slotsFull = Engine.GetModelValue( model )
		if slotsFull then
			LblSlash:setRGB( FileshareSlotsTextColor( controller, slotsFull ) )
		end
	end )
	self.TxtTotal:linkToElementModel( self, "slotsFull", true, function ( model )
		local slotsFull = Engine.GetModelValue( model )
		if slotsFull then
			TxtTotal:setRGB( FileshareSlotsTextColor( controller, slotsFull ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				BarFraction:completeAnimation()
				self.clipFinished( BarFraction, {} )

				Dimmer:completeAnimation()
				self.Dimmer:setAlpha( 0 )
				self.clipFinished( Dimmer, {} )
			end
		},
		DimArabic = {
			DefaultClip = function ()
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
				self:setupElementClipCounter( 1 )

				Dimmer:completeAnimation()
				self.Dimmer:setAlpha( 0.8 )
				self.clipFinished( Dimmer, {} )
			end
		},
		DefaultStateArabic = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				TxtUsed:completeAnimation()
				self.TxtUsed:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
				self.clipFinished( TxtUsed, {} )

				TxtTotal:completeAnimation()
				self.TxtTotal:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
				self.clipFinished( TxtTotal, {} )

				BarFraction:completeAnimation()
				self.clipFinished( BarFraction, {} )

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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GroupName:close()
		element.GroupImage:close()
		element.TxtUsed:close()
		element.LblSlash:close()
		element.TxtTotal:close()
		element.BarFraction:close()
		element.slotfullWarningImage0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

