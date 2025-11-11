require( "ui.uieditor.widgets.Social.JoinButtonPrompt" )

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		self:setHandleMouse( true )
	end
end

CoD.Social_JoinBtn = InheritFrom( LUI.UIElement )
CoD.Social_JoinBtn.new = function ( menu, controller )
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
	self:setAlignment( LUI.Alignment.Right )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Social_JoinBtn )
	self.id = "Social_JoinBtn"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 300 )
	self:setTopBottom( 0, 0, 0, 39 )
	self.anyChildUsesUpdateState = true
	
	local spacer = LUI.UIImage.new()
	spacer:setLeftRight( 0, 0, 294, 300 )
	spacer:setTopBottom( 0, 0, 0, 39 )
	spacer:setAlpha( 0 )
	self:addElement( spacer )
	self.spacer = spacer
	
	local joinLabel = LUI.UITightText.new()
	joinLabel:setLeftRight( 0, 0, 252, 300 )
	joinLabel:setTopBottom( 0, 0, 6, 36 )
	joinLabel:setText( Engine.Localize( "MENU_JOIN_SERVER_CAPS" ) )
	joinLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( joinLabel )
	self.joinLabel = joinLabel
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 0, 246, 252 )
	Image0:setTopBottom( 0, 0, 9, 30 )
	Image0:setAlpha( 0 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local JoinButtonPrompt = CoD.JoinButtonPrompt.new( menu, controller )
	JoinButtonPrompt:setLeftRight( 0, 0, 206.5, 245.5 )
	JoinButtonPrompt:setTopBottom( 0, 0, 0.5, 39.5 )
	JoinButtonPrompt.KMprompt:setText( Engine.Localize( "J" ) )
	JoinButtonPrompt:subscribeToGlobalModel( controller, "Controller", "alt1_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			JoinButtonPrompt.GpadButtonImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( JoinButtonPrompt )
	self.JoinButtonPrompt = JoinButtonPrompt
	
	self.resetProperties = function ()
		joinLabel:completeAnimation()
		JoinButtonPrompt:completeAnimation()
		joinLabel:setRGB( 1, 1, 1 )
		joinLabel:setAlpha( 1 )
		JoinButtonPrompt:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Over = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				joinLabel:completeAnimation()
				self.joinLabel:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
				self.clipFinished( joinLabel, {} )
			end
		},
		NotJoinable = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				joinLabel:completeAnimation()
				self.joinLabel:setAlpha( 0 )
				self.clipFinished( joinLabel, {} )
				JoinButtonPrompt:completeAnimation()
				self.JoinButtonPrompt:setAlpha( 0 )
				self.clipFinished( JoinButtonPrompt, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "NotJoinable",
			condition = function ( menu, element, event )
				return not IsJoinable( self, controller )
			end
		}
	} )
	self:linkToElementModel( self, "joinable", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "joinable"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyLockedIn" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyLockedIn"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.JoinButtonPrompt:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

