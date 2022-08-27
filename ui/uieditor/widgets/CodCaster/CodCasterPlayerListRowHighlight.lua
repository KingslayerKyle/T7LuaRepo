-- 339700a5d9a09d536aaaf750cc81cd50
-- This hash is used for caching, delete to decompile the file again

CoD.CodCasterPlayerListRowHighlight = InheritFrom( LUI.UIElement )
CoD.CodCasterPlayerListRowHighlight.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.CodCasterPlayerListRowHighlight )
	self.id = "CodCasterPlayerListRowHighlight"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 320 )
	self:setTopBottom( true, false, 0, 27 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local axisbg = LUI.UIImage.new()
	axisbg:setLeftRight( true, false, 0, 320 )
	axisbg:setTopBottom( true, false, 0, 27 )
	axisbg:setAlpha( 0 )
	axisbg:setImage( RegisterImage( "uie_t7_codcaster_highlight" ) )
	axisbg:subscribeToGlobalModel( controller, "Factions", "axisFactionColor", function ( model )
		local axisFactionColor = Engine.GetModelValue( model )
		if axisFactionColor then
			axisbg:setRGB( axisFactionColor )
		end
	end )
	self:addElement( axisbg )
	self.axisbg = axisbg
	
	local alliesbg = LUI.UIImage.new()
	alliesbg:setLeftRight( true, false, 0, 320 )
	alliesbg:setTopBottom( true, false, 0, 27 )
	alliesbg:setAlpha( 0 )
	alliesbg:setImage( RegisterImage( "uie_t7_codcaster_highlight" ) )
	alliesbg:subscribeToGlobalModel( controller, "Factions", "alliesFactionColor", function ( model )
		local alliesFactionColor = Engine.GetModelValue( model )
		if alliesFactionColor then
			alliesbg:setRGB( alliesFactionColor )
		end
	end )
	self:addElement( alliesbg )
	self.alliesbg = alliesbg
	
	local freebg = LUI.UIImage.new()
	freebg:setLeftRight( true, false, 0, 320 )
	freebg:setTopBottom( true, false, 0, 27 )
	freebg:setRGB( ColorSet.CodCaster.r, ColorSet.CodCaster.g, ColorSet.CodCaster.b )
	freebg:setAlpha( 0 )
	freebg:setImage( RegisterImage( "uie_t7_codcaster_highlight" ) )
	self:addElement( freebg )
	self.freebg = freebg
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				axisbg:completeAnimation()
				self.axisbg:setAlpha( 0 )
				self.clipFinished( axisbg, {} )
				alliesbg:completeAnimation()
				self.alliesbg:setAlpha( 0 )
				self.clipFinished( alliesbg, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 1 )
				axisbg:completeAnimation()
				self.axisbg:setAlpha( 1 )
				self.clipFinished( axisbg, {} )
			end
		},
		Allies = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				axisbg:completeAnimation()
				self.axisbg:setAlpha( 0 )
				self.clipFinished( axisbg, {} )
				alliesbg:completeAnimation()
				self.alliesbg:setAlpha( 1 )
				self.clipFinished( alliesbg, {} )
				freebg:completeAnimation()
				self.freebg:setAlpha( 0 )
				self.clipFinished( freebg, {} )
			end
		},
		Axis = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				axisbg:completeAnimation()
				self.axisbg:setAlpha( 1 )
				self.clipFinished( axisbg, {} )
				alliesbg:completeAnimation()
				self.alliesbg:setAlpha( 0 )
				self.clipFinished( alliesbg, {} )
				freebg:completeAnimation()
				self.freebg:setAlpha( 0 )
				self.clipFinished( freebg, {} )
			end
		},
		Free = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				axisbg:completeAnimation()
				self.axisbg:setAlpha( 0 )
				self.clipFinished( axisbg, {} )
				alliesbg:completeAnimation()
				self.alliesbg:setAlpha( 0 )
				self.clipFinished( alliesbg, {} )
				freebg:completeAnimation()
				self.freebg:setAlpha( 1 )
				self.clipFinished( freebg, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Allies",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "team", Enum.team_t.TEAM_ALLIES ) and IsGametypeTeambased()
			end
		},
		{
			stateName = "Axis",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "team", Enum.team_t.TEAM_AXIS ) and IsGametypeTeambased()
			end
		},
		{
			stateName = "Free",
			condition = function ( menu, element, event )
				return true
			end
		}
	} )
	self:linkToElementModel( self, "team", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "team"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.axisbg:close()
		element.alliesbg:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

