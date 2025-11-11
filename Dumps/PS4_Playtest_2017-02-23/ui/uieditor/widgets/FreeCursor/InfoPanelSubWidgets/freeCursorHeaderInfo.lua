require( "ui.uieditor.widgets.FreeCursor.InfoPanelSubWidgets.freeCursorHeaderInfoHeading" )

CoD.freeCursorHeaderInfo = InheritFrom( LUI.UIElement )
CoD.freeCursorHeaderInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.freeCursorHeaderInfo )
	self.id = "freeCursorHeaderInfo"
	self.soundSet = "none"
	self:setLeftRight( 0, 0, 0, 420 )
	self:setTopBottom( 0, 0, 0, 55 )
	
	local BlackBG2 = LUI.UIImage.new()
	BlackBG2:setLeftRight( 0, 1, 0, 0 )
	BlackBG2:setTopBottom( 0, 1, 0, 0 )
	BlackBG2:setRGB( 0, 0, 0 )
	BlackBG2:setAlpha( 0.25 )
	self:addElement( BlackBG2 )
	self.BlackBG2 = BlackBG2
	
	local backing2 = LUI.UIImage.new()
	backing2:setLeftRight( 0, 1, 0, 0 )
	backing2:setTopBottom( 0, 1, 0, 0 )
	backing2:setRGB( 0.29, 0.33, 0.37 )
	backing2:setAlpha( 0.9 )
	self:addElement( backing2 )
	self.backing2 = backing2
	
	local backing = LUI.UIImage.new()
	backing:setLeftRight( 0, 1, 0, 0 )
	backing:setTopBottom( 0, 1, -0.5, -0.5 )
	backing:setRGB( 0.1, 0.25, 0.23 )
	backing:setAlpha( 0.9 )
	self:addElement( backing )
	self.backing = backing
	
	local title = LUI.UITightText.new()
	title:setLeftRight( 0, 0, 18, 218 )
	title:setTopBottom( 0, 0, 6, 51 )
	title:setTTF( "fonts/default.ttf" )
	title:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	title:setShaderVector( 0, 0, 0, 0, 0 )
	title:setShaderVector( 1, 1.03, 0, 0, 0 )
	title:setShaderVector( 2, 1, 0, 0, 0 )
	title:linkToElementModel( self, "title", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			title:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( title )
	self.title = title
	
	local heading = CoD.freeCursorHeaderInfoHeading.new( menu, controller )
	heading:setLeftRight( 0, 0, 18, 399 )
	heading:setTopBottom( 0, 0, 0, 28 )
	heading:setAlpha( 0 )
	heading:linkToElementModel( self, nil, false, function ( model )
		heading:setModel( model, controller )
	end )
	self:addElement( heading )
	self.heading = heading
	
	self.resetProperties = function ()
		title:completeAnimation()
		backing:completeAnimation()
		backing2:completeAnimation()
		BlackBG2:completeAnimation()
		heading:completeAnimation()
		title:setLeftRight( 0, 0, 18, 218 )
		title:setTopBottom( 0, 0, 6, 51 )
		title:setAlpha( 1 )
		backing:setAlpha( 0.9 )
		backing2:setAlpha( 0.9 )
		BlackBG2:setAlpha( 0.25 )
		heading:setLeftRight( 0, 0, 18, 399 )
		heading:setTopBottom( 0, 0, 0, 28 )
		heading:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				BlackBG2:completeAnimation()
				self.BlackBG2:setAlpha( 0 )
				self.clipFinished( BlackBG2, {} )
				backing2:completeAnimation()
				self.backing2:setAlpha( 0 )
				self.clipFinished( backing2, {} )
				backing:completeAnimation()
				self.backing:setAlpha( 0 )
				self.clipFinished( backing, {} )
				title:completeAnimation()
				self.title:setLeftRight( 0, 0, 5, 205 )
				self.title:setTopBottom( 0, 0, 5, 50 )
				self.title:setAlpha( 0 )
				self.clipFinished( title, {} )
				heading:completeAnimation()
				self.heading:setLeftRight( 0, 0, 0, 399 )
				self.heading:setTopBottom( 0, 0, 0, 28 )
				self.clipFinished( heading, {} )
			end
		},
		HasHeader = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				heading:completeAnimation()
				self.heading:setLeftRight( 0, 0, 18, 417 )
				self.heading:setTopBottom( 0, 0, 51, 79 )
				self.heading:setAlpha( 1 )
				self.clipFinished( heading, {} )
			end
		},
		TitleOnly = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				heading:completeAnimation()
				self.heading:setLeftRight( 0, 0, 0, 399 )
				self.heading:setTopBottom( 0, 0, 0, 28 )
				self.clipFinished( heading, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "HasHeader",
			condition = function ( menu, element, event )
				return IsSelfModelValueNonEmptyString( element, controller, "header" ) and not IsCampaign()
			end
		},
		{
			stateName = "TitleOnly",
			condition = function ( menu, element, event )
				return IsSelfModelValueNonEmptyString( element, controller, "title" )
			end
		}
	} )
	self:linkToElementModel( self, "header", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "header"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	self:linkToElementModel( self, "title", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "title"
		} )
	end )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, state )
		if IsSelfInState( self, "HasHeader" ) then
			SetHeight( self, 83 )
		elseif IsSelfInState( self, "TitleOnly" ) then
			SetHeight( self, 55 )
		else
			SetHeight( self, 0 )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.heading:close()
		self.title:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

