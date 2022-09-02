-- 985a370da9189f8f6b1724bdde7bc8aa
-- This hash is used for caching, delete to decompile the file again

CoD.Startmenu_MapLocationDate = InheritFrom( LUI.UIElement )
CoD.Startmenu_MapLocationDate.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 0
	} )
	self:setAlignment( LUI.Alignment.Left )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Startmenu_MapLocationDate )
	self.id = "Startmenu_MapLocationDate"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 304 )
	self:setTopBottom( true, false, 0, 32 )
	
	local location = LUI.UITightText.new()
	location:setLeftRight( true, false, 0, 95 )
	location:setTopBottom( true, false, 7, 25 )
	location:setAlpha( 0.65 )
	location:setTTF( "fonts/escom.ttf" )
	location:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	location:setShaderVector( 0, 0.06, 0, 0, 0 )
	location:setShaderVector( 1, 0.02, 0, 0, 0 )
	location:setShaderVector( 2, 1, 0, 0, 0 )
	location:setLetterSpacing( 1 )
	location:subscribeToGlobalModel( controller, "MapInfo", "location", function ( model )
		local _location = Engine.GetModelValue( model )
		if _location then
			location:setText( LocalizeToUpperString( _location ) )
		end
	end )
	self:addElement( location )
	self.location = location
	
	local Spacer = LUI.UIImage.new()
	Spacer:setLeftRight( true, false, 95, 105 )
	Spacer:setTopBottom( true, false, 1.5, 30.5 )
	Spacer:setAlpha( 0 )
	self:addElement( Spacer )
	self.Spacer = Spacer
	
	local separator = LUI.UIImage.new()
	separator:setLeftRight( true, false, 105, 106 )
	separator:setTopBottom( true, false, 7, 26 )
	separator:setAlpha( 0.65 )
	self:addElement( separator )
	self.separator = separator
	
	local Spacer2 = LUI.UIImage.new()
	Spacer2:setLeftRight( true, false, 106, 116 )
	Spacer2:setTopBottom( true, false, 1.5, 30.5 )
	Spacer2:setAlpha( 0 )
	self:addElement( Spacer2 )
	self.Spacer2 = Spacer2
	
	local dateTime = LUI.UITightText.new()
	dateTime:setLeftRight( true, false, 116, 248 )
	dateTime:setTopBottom( true, false, 7, 25 )
	dateTime:setAlpha( 0.65 )
	dateTime:setTTF( "fonts/escom.ttf" )
	dateTime:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	dateTime:setShaderVector( 0, 0.06, 0, 0, 0 )
	dateTime:setShaderVector( 1, 0.02, 0, 0, 0 )
	dateTime:setShaderVector( 2, 1, 0, 0, 0 )
	dateTime:subscribeToGlobalModel( controller, "MapInfo", "dateTime", function ( model )
		local _dateTime = Engine.GetModelValue( model )
		if _dateTime then
			dateTime:setText( LocalizeToUpperString( _dateTime ) )
		end
	end )
	self:addElement( dateTime )
	self.dateTime = dateTime
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		cpzm = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				separator:completeAnimation()
				self.separator:setAlpha( 0 )
				self.clipFinished( separator, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "cpzm",
			condition = function ( menu, element, event )
				return IsCampaignZombies()
			end
		}
	} )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.location:close()
		element.dateTime:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

